Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036518;
	b=YxdKnfU+RB6YyeHeA3FvjuIe1iXqtqypbxs/h32z06WixtbTyz3NFLZtFEwNWhu7BQFZ
	 VP3haA1+/0sbmcdTpME/jegqDVfATpnLKQyHdte+wbTISKQojZMG7zer6Fjw2S8CL8tmr
	 W9AQEoOtet8PtF23He4S3qeex36IjgPywHb8pfLS/FzsXObqWKGiHbZM/tT7YIowJ0zx6
	 Z6DehuRpdcEmco3QbFJLRH9dDbdxjMKK9EusR+3D/RCnqACldfMganAdiMs8Ap/uhdsDT
	 oE+cjo//jZdoN9JhWv/GLdFY+5hs5pfKHDKytSbNRemFA+WfBNhSHfXpF2hhh5YJ5dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036518;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4meGpp5bM9W2KlfdPIeQIZ6PeWQUimuoG86VDalLWzY=;
	b=45QWlsZ24MvtnPx8XUIWT3ZoYRl0offN3LvtYwpYJqfIKVcuh4CyfVJY5scIB4yC/hA4
	 DIXtgpPBu9B552BJdF5xUK62o3y71AB2zPrFJU2Hb4BOVNF3E4wzLzNoVzfp92gtVuOKG
	 uuuba2Eeg1HgeChTE3D/CgNyAUimQU9CGGAaHGKB/yJ1ILyoxUv4u7Su/rTqsfc/D+gVW
	 BpBskWhadJ+7cJlLr5WHQ9u7zWwvrqK92fgT4WExHBFjEla7OPMS1AjgYyBO4o/utn99b
	 y6HigOZ6DYUA1l4/nKX9CRmQ3Ags0g6b7dyOl89xjaOm+O7G91ofxcoMwmDCoatmRVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADHGPBzq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95FA606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADHGPBzq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAFB1F0089F;
	Sat,  7 Nov 2026 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036517;
	bh=4meGpp5bM9W2KlfdPIeQIZ6PeWQUimuoG86VDalLWzY=;
	h=From:To:Cc:Subject:Date;
	b=ADHGPBzq1Bu7EA2ZwzWl7vo2h1riz92TljyGwx5IFXTpJfCbgr8i3PTPQehfFmKef
	 jSb3ZXxqFtYBKSc1Z1zjk+vEb/aMjGGDVkLilVERL8wKye2Z8RXABU9I3qFLOdy1wY
	 W236BK7EEkKPghJc+pIn49hSlieU1Ue+SARymHmbwEfVQ6uMC1mdPZuwbfLRUw5eLj
	 pxpZgsSUZKK1t3TqbdopwXCvCRVO5oYkikX7GZ73E3fUdSDmr99exl/XIuk+CNcC5j
	 LUel3poqS38OR+Li9c6dK1tq8LPVK265IdIdm9KEQE/k3HzV2OPiWoExkCR3CEtJbP
	 9dpv58p6ns13g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Establish entry state for kernel software-check exceptions
Date: Sat,  7 Nov 2026 15:08:27 +0800
Message-ID: <20261107070827.17414-1-jszhang@kernel.org>
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

The kernel-mode software-check exception path calls die() without
performing the entry bookkeeping used by other kernel trap handlers.
die() invokes diagnostics and notifiers which need the corresponding
RCU and tracing state established.

Wrap the kernel fault handling with irqentry_nmi_enter() and
irqentry_nmi_exit(), following the existing kernel trap paths.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/riscv/kernel/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..f28e03f98af0 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -402,8 +402,11 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
 
 		irqentry_exit_to_user_mode(regs);
 	} else {
+		irqentry_state_t state = irqentry_nmi_enter(regs);
+
 		/* sw check exception coming from kernel is a bug in kernel */
 		die(regs, "Kernel BUG");
+		irqentry_nmi_exit(regs, state);
 	}
 }
 
-- 
2.55.0

