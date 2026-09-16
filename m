Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A63DB62E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582908; cv=none; b=N3Lw7jcKaMiRkExNz4VZUoHIxNCSVip6cV75IyJ4LfQde0BBtb+h6x9rSzEwyzCG6YsdJ9ihK4cy8+ML4RB9cdc0+vYA57MAjfdzr++gQY7rvDZVbh8VTXok0KUdOFMzG1pAm/hJc0OTGHKvcmqgeHHbdY1LLpd8QKyhTlAyqF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582908; c=relaxed/simple;
	bh=jEpIA7bvLTdzVcsHeIeLL/AF/RITcLl/fBmqh6A01Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VkXnfWv68p8c+vgRwgb+daYM0jzVgmEHKQ5caZIKs+oqEPxtgCOadqtBsMzBgqP9cDPGJ4RLQGUTKPNhmON9Z2gaWCWuk47zsUpYVWAfz2UvYi4Y8MBbKc8SQX6oTPybM7xvqM+EDwzgvMGyQsqvXF5Uhd73p9IxyksoaLpMyIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWWyDYLw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWWyDYLw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso388165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582893; x=1790187693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvfPoOEcmC8/94abbwrhnmtr6QM09GFHkRqzmkwOjDg=;
        b=DWWyDYLwDWrQqhtFKw3RBcD4sPTMVsj1zIUwVjinvPRVC4YeC93VCwMfF6SO9hbZ5N
         /oFYVc4sBidrqhEh88vG6AojnaC3egrxrsGuI5QpknZC1o031VSGr54/B1z52lOncgxP
         8oAEglqvqSchxFHjU81THUekYzV9YDg2NOfnX+mDnM/UPwY+6cXmU5ubB7Ga+c/iT25f
         SirqOAfCAddsP6CQICJqvIzT8nj82MK5VJPZ1mPInJ3wLfqV47dJFtut0qIwMCWhldvo
         4Dukt2ALZ7gTiBJwCPv320EPkxSeEa3ePPIiM96lrq+LFbzYbKwechsIEgwVGe438ypx
         p5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582893; x=1790187693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvfPoOEcmC8/94abbwrhnmtr6QM09GFHkRqzmkwOjDg=;
        b=kjZMoi66WBd7didNwSOzcCUs+IQgkcXzaFgfZuQoZvSZbSQgh7dRMF7AFHvRFkNmsJ
         Q24rCYtFvOwxl2SHsJRPkEMO1EAqBqgs6mHGBwrl7JYtLcna3nSpf6UyNZCupMIsQDfG
         G1NA0vOmvYS3lr6R20b2I5Y7hBDALrLP5rh9RJRkaeWhHYIJzptiVhLlTYGzgQk3ogtp
         8v9mCOH2eqq7mYUEigkq8UvNUEmEdelOThLztPC7RAFUnJnKvcKOcw5te6+K1VLwOUt7
         TPY6RLHaFgGoIu56gh4B+yX7XXhqhtJPVIduD6udZujXI/IdWSz1ruVPGdwDUPkwaFB6
         DUWg==
X-Forwarded-Encrypted: i=1; AKwUvBwtsrTtI/h+DE8jUTwBmpwO8KJ50BurMsTT96TTG79z5NPU1bpoK7zvcSTnLtgmPJsK4Qu2JtoLl3X82Hk=@vger.kernel.org
X-Gm-Message-State: AFuF++l5gBllAF+/Qr3ILhGReNNmvQy6topImGUDpEGPngIGJEdZHaqo
	pwESJiggZOZKSE72gsORevWSG6sey0gFU6XvTBctP3LksNBdoaj/vFZJFmNnd5XW
X-Gm-Gg: AYBFou2adkr9ZvWMrj3hOEq5fH2K8/v+eTvqcDPMxpqGz7xcvsgUSJ0lYfS12aX11GU
	1QuAevss/lIy1EP+5kDv8/kuLr23iVcx6zSnO2OFMbLMrG4PBlFqu93X0rIK8Q4JxyX/fDTtAr+
	AnYaLL/rRWwTfqA2M1khES1ONN89QIrtH4YPVrIfSnimIUimVo1NJizhxlMG2lqsaOpmBKRYbso
	SAHjM4BFVgaV9bVdMMsgwETWNSNgT+O2c6hIdKFqjKcDyI9A4JMkuKSCMFAkyKV38xdNPTrB4+7
	KkiG0riWVUvQxaKPYHCddK6p59Sx0Q21NKyCvZGz2E52w/6Gmy82iGJKdI67GEdq1bCxeAvUbNP
	5QHrFXEbV8VRgTEidFOXS7VnaqL+I8lnPTzwkJZtHS4ABH0QASRswDBdOIKlofHxkKK+YiHZI16
	c+wrVOKQz29dU/X5YDigXMmJqrlf10Av+6btwcnxSTEKD5UqWJlCGxSsM9sR163/qV6B9WBuzKW
	e503SmrMGanrf9rJxbRcbVYUjSkyUMczgU34urt4NE6WYYZ1awboseHS2wM8aPFM8+5l7ewOfHJ
	B85HwJOG
X-Received: by 2002:a05:600c:34c2:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49eb72f7043mr41322645e9.15.1789582892455;
        Wed, 16 Sep 2026 11:21:32 -0700 (PDT)
Received: from fedora ([2a01:261:818:9401:46b1:9fe8:a5e3:32be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf43511sm8386272f8f.33.2026.09.16.11.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:21:31 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND] x86/kexec: store segment registers directly to memory in crash_setup_regs()
Date: Wed, 16 Sep 2026 20:20:58 +0200
Message-ID: <20260916182116.7949-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

crash_setup_regs() currently moves segment registers (ss, cs, ds, es)
into pt_regs via a general purpose register (%eax). Update the code to
avoid the intermediate register and store segment registers directly
to their destination fields. This reduces the generated code from:

 131:	8c d0                	mov    %ss,%eax
 133:	66 89 84 24 a0 00 00 	mov    %ax,0xa0(%rsp)
 13a:	00
 13b:	8c c8                	mov    %cs,%eax
 13d:	66 89 84 24 88 00 00 	mov    %ax,0x88(%rsp)
 144:	00

to:

 131:	8c 94 24 a0 00 00 00 	mov    %ss,0xa0(%rsp)
 138:	8c 8c 24 88 00 00 00 	mov    %cs,0x88(%rsp)

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/kexec.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 5cfb27f26583..ad7ef567452b 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -106,11 +106,11 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 		asm volatile("mov %%r14,%0" : "=m"(newregs->r14));
 		asm volatile("mov %%r15,%0" : "=m"(newregs->r15));
 #endif
-		asm volatile("mov %%ss,%k0" : "=a"(newregs->ss));
-		asm volatile("mov %%cs,%k0" : "=a"(newregs->cs));
+		asm volatile("mov %%ss,%0" : "=m"(newregs->ss));
+		asm volatile("mov %%cs,%0" : "=m"(newregs->cs));
 #ifdef CONFIG_X86_32
-		asm volatile("mov %%ds,%k0" : "=a"(newregs->ds));
-		asm volatile("mov %%es,%k0" : "=a"(newregs->es));
+		asm volatile("mov %%ds,%0" : "=m"(newregs->ds));
+		asm volatile("mov %%es,%0" : "=m"(newregs->es));
 #endif
 		asm volatile("pushf\n\t"
 			     "pop %0" : "=m"(newregs->flags));
-- 
2.55.0

