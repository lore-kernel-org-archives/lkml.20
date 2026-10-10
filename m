Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF752F4F1
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791591624; cv=none; b=n7/4fUoIBGc8gcJD8C0vz5N+HKsIrabvhKEx+YFcXbflRt6qTUUUBmtza1v++sWi1BT2w7TUF5oD4Q0I9SA1zengDQ6e1sjkmThFLnMA/OTwxuyD/lO/uwXftx70VKQQZd/P7oYdoyd2CxvdhSn1O8YaLnwCWkF2ayYnVMRKhME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791591624; c=relaxed/simple;
	bh=jCUnaSR49EI1tyE1VoVGpgqvf6CaF1AoXGDYHDKdufk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/gPb2b0aMDWeVrL31w6PmZDi4fCdGu6udEYSaNYZ7vnxCVodBNQa/q6eNQ+/QK0sM+5DMZYSjBwOAad9dLSN40SUL9bw/pz6FoiXfHC2ZVzuZKfoSIbh+42sVaUUnPx54+t6t1GpmoeNIrxsVHH427eVdnN1aksx3pN+inL2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doApGa7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doApGa7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E041F000FF;
	Sat, 10 Oct 2026 00:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791591623;
	bh=IyxiWgY/OresKPmRcZQ5FzYMHN44S+1AZllFk55N12c=;
	h=From:To:Cc:Subject:Date;
	b=doApGa7rp7sj1yczpm7FjD7fsDVyhJJlZpp5q69fSQvACQ1iJ9neXiupMIhxznLfu
	 bIVSF4OxA6XFM3Kp/4pWDZvFRNwWG7KaS86deLDAOXlEBzePeRHNCmveGlaTMR400V
	 H2+tRLP6dZqUBHyY7ipvvZGjfDk3r3yn985jxL5WCz7BR/4tXsxHGjxPZcD2X3ZBtG
	 LlhoKCNUVmWRZcnRx/k00K6W2rjVNsjO5Kf7rGpKEfeRopt/lvpW6NaEmYo4b5eeHZ
	 K0FNnkptcZszjRuByI36tSeZvAmbDLxUTQAvS52Fl9vRBJTEp2ykQ0hCnLNQTRlZ9s
	 28uKKnzpH0TGQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: make thread_info smaller for RV64
Date: Sat, 10 Oct 2026 08:00:25 +0800
Message-ID: <20261010000025.29569-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

