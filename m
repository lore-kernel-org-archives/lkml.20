Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060752;
	b=uj6BEQWhxJdqAjc3nQ3azcL62BChvtD2BkWQXIghLOgdgJ2G4DsD9mJso3We4AMiHUA8
	 Vy8Ui4RPPmzwGpUOvbbqvXq3A42VYvFRidzoYz4afuTGRE5opOlgKharygdYV9tp/GdVC
	 xDUxT6p6/UPRBK5KNjQPB7SYEAfgKbo220xgj4cTL3lc0SzzLlMi7ur/THP0yqY/E4GJx
	 t3RVRVMCgCPmdjKOHAUm0SgbMLuH8+Oc+SjdQftsX4FsZGo3q9+mIGpRRwXyvQQtPnCk7
	 twfeuoxinOxrNyLBC77gG/ZOyxPhktMaIKhwm0g7Q2fRYdH74Me1tm1z/3RP+U1/zDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060752;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IyxiWgY/OresKPmRcZQ5FzYMHN44S+1AZllFk55N12c=;
	b=OZIJC3O6gT++ENuttB+8JKo7tvKScuv/aXytb6p8sAPUnDvw2t1WMVTbrQgPny4pKr2D
	 Of4jbgOq587ZtSDB1lP0mhzxdcf1k6/6iErMU8/1YFBr8BYQdnGOdibpzvQI4UIqPnUBF
	 ICE2L4wJxEdDvR0N5PX78UGn2BFkPbivKf4XAEWxJ7vslUuOljP51ZNR2N/kQDT5Co9hZ
	 eB8rv6hDsnmcoP+K94geFaTo/UmS5yMLo3W99rN7tjBqPy6M+zCLkM2cfLvlzhdzKa/Kj
	 Drjl6eApsJDMGibQhA0tFY6XAKFaweB4B3mwOZ/ilTjvU3zXhFm2wR6KEeN41LnsBrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eBQUs/9s";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB43606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eBQUs/9s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9282E1F008A1;
	Sat,  7 Nov 2026 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060751;
	bh=IyxiWgY/OresKPmRcZQ5FzYMHN44S+1AZllFk55N12c=;
	h=From:To:Cc:Subject:Date;
	b=eBQUs/9ssxB8volhnNWXcZzALvhPxvdslLhJjU5/UbRe05DZ2jGyoeY2p33unU7yV
	 7uf25YzrTOL7e2slPIV2Uy9rOdk/fTVqq6txBYq0CxPm9ZZ7k+KOh9pW/k8lpnG8Pm
	 phV+LvG1+aO3qc55Oe/X/aerRPPOquPPXI0Pvsw0f2suh+Z1rPMxAbqfViIZpb7A8B
	 qGGD3qf0nVqlg7YDJDmEACu4b3Ukuu8WXyVVJ7FxKgeGjsUFo5NYzDDajhA4DzAMn7
	 6O8iUno0y1cG0Ux1AVGzlO6gVpcNcNf83tMvwsPdok9XOGU884ZZS5jzVZFJyOvsJM
	 uZzz0gbnKfUgQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] riscv: make thread_info smaller for RV64
Date: Sat,  7 Nov 2026 21:52:21 +0800
Message-ID: <20261107135221.17904-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RV64 platforms, the thread_info structure is non-necessary bigger
due to padding. Move the "cpu" member to "preempt_count" to remove
the padding.

when !SHADOW_CALL_STACK and !RISCV_USER_CFI
Before the patch, sizeof(struct thread_info) == 72
After the patch, sizeof(struct thread_info) == 64

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9ec..9f358c3ddeb0 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -53,6 +53,7 @@
 struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	int                     preempt_count;  /* 0=>preemptible, <0=>BUG */
+	int			cpu;
 	/*
 	 * These stack pointers are overwritten on every system call or
 	 * exception.  SP is also saved to the stack it can be recovered when
@@ -60,7 +61,6 @@ struct thread_info {
 	 */
 	long			kernel_sp;	/* Kernel stack pointer */
 	long			user_sp;	/* User stack pointer */
-	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
-- 
2.51.0

