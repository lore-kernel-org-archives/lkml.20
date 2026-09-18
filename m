Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6186E502D66
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748064; cv=none; b=KzXVplG6vLOJrXgdE6n3L+Gi20nTDWdOwgcrn4F3Mb0i+CMIQWgN6Wu7PFKxWkIuOEKby/hB46S1xrGmo/ulR/be2txoa91fDth4I3FfEdSzCI9vdrJUZuP3xS4eSurzPoIAv1axiiEYpvjnOd84dtjsxc1jVX/EHcVlBcoMz44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748064; c=relaxed/simple;
	bh=GmxteVjU9qYXSGVJEqSdzMCASmIFnZ0iHlTvWcHzzTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldfszVIV8ZF2MTgX93lDrBMgvN2wf7ykl/t5f21g1rup8BfARALdVhuW4yfPbMRQKOzcVh3TLOFSldehXR7qQb22/Ax/2HtoB2YrDq3IuG0n3HVz1PkGjzd0+9AY3kDjOk8j83cT/aY49jOI94jNnPxTUNEBaxcRUiry6hiGI+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO+7mL8M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO+7mL8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA0B1F000FF;
	Fri, 18 Sep 2026 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748062;
	bh=i5WKKe+LbffkRYv2t0YaLabQ2JHUtS1RbnFSIgfXllw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iO+7mL8MmOAWCnP2p3vRnFMM5ydmWe2icNPmTsVcjHbvOU4rLqVzrXS1I1k9+MNA/
	 stDBU1VLeerXsSEA79KxaRJfyuseqKhc/45qU5CE8iArvQfC1cex21xq4Ln+N7GlkO
	 AI+9Du1UY0pbV2grKzZGatPldtNLu9TRu2KXF9Oy5rp6aobHqB+OeDZW+0JPi7yp7R
	 CWpM7VuSdumgLkcopP9B4/1sMj3oKRkahBkCJCb1REtr5b5FW40SjT8wUAlXCwFNrf
	 hYh04brISd5qnnXlIVIOC2dohJl4KOUP0BFyvi00G5LYlpq/6vqN2VXUPQ3Lm2V2gd
	 Hh8dZa1uEyOrA==
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
Subject: [PATCH v2 02/21] arm64: entry: Only check for stack overflow on exceptions from EL1
Date: Fri, 18 Sep 2026 17:13:46 +0100
Message-ID: <20260918161407.2300-3-will@kernel.org>
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

Checking for kernel stack overflow on entry from EL0 is largely
pointless and gets in the way of using SPSel to switch to the overflow
stack. If the kernel stack overflows on entry from userspace, that
implies that it was unbalanced on the last exception return which means
we can't sensibly reason about the state of the system given that we
could've returned to an arbitrary virtual address in an arbitrary mode.

Remove the stack overflow check from the EL0 exception entry path.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 59f045e496ec..b5d8277f608a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -54,6 +54,8 @@
 	.endif
 
 	sub	sp, sp, #PT_REGS_SIZE
+
+	.if	\el == 1
 	/*
 	 * Test whether the SP has overflowed, without corrupting a GPR.
 	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
@@ -64,8 +66,11 @@
 	tbnz	x0, #THREAD_SHIFT, 0f
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
+	.endif
+
 	b	el\el\ht\()_\regsize\()_\label
 
+	.if	\el == 1
 0:
 	/*
 	 * Either we've just detected an overflow, or we've taken an exception
@@ -96,6 +101,7 @@
 	sub	sp, sp, x0
 	mrs	x0, tpidrro_el0
 	b	el\el\ht\()_\regsize\()_\label
+	.endif
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
 	.endm
 
-- 
2.55.0.1082.g2b9226bbc0-goog

