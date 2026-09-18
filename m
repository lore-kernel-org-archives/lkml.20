Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2C751812F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748106; cv=none; b=savKRZf2bw9aQcB73Bd+YnZ4JT1WfkfOSMQXgRwfeD71le5wcTbQke1MbRMuVhKzXKFObNkRb3bCzi0HDuzxVJfaDg5kjYoAjxRrdoti8QY34Y1c5CSbXlxy3Q+OfHI2ULvkJFb2eVkBodsgDNVpxEKSpg/g6xrdAE4vgJuPRKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748106; c=relaxed/simple;
	bh=IGlAsYPqJLBdGQbuzb+CS793IwgUKqQ5O1eHtGwRLxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkX7Dcrbk8CN+TCeZb5D5wqwF+78XnjGluwymmVQCIsqd+0C4CArlcb3TB3sCBs8qcVZi0NwjptDUUqG02OK4jVweNsf/nJJjgUKxLFVytdyIW9pYb+EVrv1otTax05NQNYUoAfUq5Tb0xVbpOB7jwg69DrMEtzWkexh+j/wNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/ffdFAM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/ffdFAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD191F00898;
	Fri, 18 Sep 2026 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748105;
	bh=8nBLQSKemxDIktlR563dkf+XaG9PZ7B4rjq2+jvC9t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z/ffdFAMxmWA9YF2dCYlP4WVx8iG4pj2rNzJqqF7scRBaWTu8PUGnJ/RLD+kbIzDc
	 50DJpkxeP1moeVXfp135B87JcBo0uHGmXQWF2XKtqE8eL4xHRuAWOVbcKcx9av58Tp
	 BEVVhahBxZNv3dbKArxMlqTDUaWgwgFsx1qAYCJoHIBcAhdFqSJUPei3Bk5cu2Cynt
	 alJs+g5kiqed+FY6dL0LmkdsqqhwtG5O6qSMjqTNuiA+ZxtKmLHwty7AP7ML5f6okU
	 B+RhZ1XlPlYxzQqYg1cGypFhkVKuSEc7L6aAFLu15Yc86AHTtCcghi5l/LDZL5e0fA
	 XfWAtM9QciATA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 14/21] arm64: sdei: Support SDEI events from kernel handler and thread modes
Date: Fri, 18 Sep 2026 17:13:58 +0100
Message-ID: <20260918161407.2300-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Section 5.2.2 ("Event resume context") of the SDEI specification states
that, as a result of an SDEI_EVENT_COMPLETE_AND_RESUME call:

 | SPSR_ELc is set to the PSTATE when the event was taken

In preparation for making use of both thread and handler modes in the
kernel, adjust the SDEI event handler so that we return to the correct
kernel vector for the interrupted mode.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/sdei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/sdei.c b/arch/arm64/kernel/sdei.c
index 778f2a1faac8..6337ce905593 100644
--- a/arch/arm64/kernel/sdei.c
+++ b/arch/arm64/kernel/sdei.c
@@ -208,7 +208,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	int i, err = 0;
 	int clobbered_registers = 4;
 	u64 elr = read_sysreg(elr_el1);
-	u32 kernel_mode = read_sysreg(CurrentEL) | 1;	/* +SPSel */
+	u32 kernel_mode = read_sysreg(CurrentEL);
 	unsigned long vbar = read_sysreg(vbar_el1);
 
 	if (arm64_kernel_unmapped_at_el0())
@@ -233,7 +233,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 		pr_warn("unsafe: exception during handler\n");
 	}
 
-	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK);
+	mode = regs->pstate & (PSR_MODE32_BIT | PSR_MODE_MASK) & ~PSR_MODE_h_BIT;
 
 	/*
 	 * If we interrupted the kernel with interrupts masked, we always go
@@ -251,7 +251,7 @@ unsigned long __kprobes do_sdei_event(struct pt_regs *regs,
 	 * address'.
 	 */
 	if (mode == kernel_mode)
-		return vbar + 0x280;
+		return vbar + (regs->pstate & PSR_MODE_h_BIT ? 0x280 : 0x80);
 	else if (mode & PSR_MODE32_BIT)
 		return vbar + 0x680;
 
-- 
2.55.0.1082.g2b9226bbc0-goog

