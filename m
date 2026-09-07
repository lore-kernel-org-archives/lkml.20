Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EDE51FCA5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799436; cv=none; b=PhPnsbKvTjtE0J5snwqgpAaBj97AuSuuaduL7tc07NUTJq+qvP2FikC1fvK2BVGVtQkWdI+oCFa0Sry43EiVEU7eKV47tns8H7XxDEX7ZnNOvq8wh1RVAeQGM6Dk4EAAFED4ieFU+dS7oKLuEgs6zDuKcsGsmpPSZSuCygv5828=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799436; c=relaxed/simple;
	bh=OjwrxO+Yb3VNhrFuMQv9vy/22rWY6qBRMH79RZf/xZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejnya2wV0eYU4Duavo9BCYSH4nGQO1IafchEKI3mWmCBCH+SIsF7QsGdcGpzUhCBDFXG9UW+0ZEB+OR1wXdyF2Cas5npDfe+UrURnhrjH43GKlLpqHULnIH/W7i0K1sG4cR9fiI7kUv+my27IOvASMnMt4zogM8SbtS12CJOe9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoqkleTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoqkleTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014211F00ACA;
	Mon,  7 Sep 2026 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799434;
	bh=4B7ig5JOoqM/sFSoDwiMA77B2+r7GUXRB2lSds3AJ1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZoqkleTPnHZFWHuFBC5xHFyP3BP9O1hjKw2d5rYkM2MLLe3ztBAyg38Gruwde31aS
	 jWJRkAiHsf7M7fxkT743JrzWBtbXc7avZ6a3lIOMUjP+4MUWi/DF+pYEn87+RJxXTR
	 CbmjaGIyGsemrCX2J59wRJx953ODDyyNCEvjMNyYdCBvbQztdnNuzYh1AEnN8cuzbI
	 XZluHaDSekTuobMXbIG7FeQkQUliobvqTwa8p49dDI2DkKbphNiqxzhHMudrp6w1Dd
	 lwTb+jrLO3mkW7qape3i59DZkmdj5UVmLv50Mp27xt6I8D9KttLFsOBPcEmpnD1dAZ
	 3+xisjdqBFSuA==
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
Subject: [PATCH 16/21] arm64: entry: Implement EL1t exception handlers for overflow stack
Date: Mon,  7 Sep 2026 17:42:41 +0100
Message-ID: <20260907164247.17223-17-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for using EL1t to handle exceptions taken whilst running
on the overflow stack, implement some simple wrappers around the EL1h
handlers which perform a best-effort stack overflow check before
proceeding.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/entry-common.c | 43 +++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59f..9738142780df 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -327,10 +327,45 @@ static void debug_exception_exit(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(debug_exception_exit);
 
-UNHANDLED(el1t, 64, sync)
-UNHANDLED(el1t, 64, irq)
-UNHANDLED(el1t, 64, fiq)
-UNHANDLED(el1t, 64, error)
+static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
+{
+	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
+	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
+
+	/*
+	 * We're in big trouble if we've overflowed the overflow stack
+	 * so perform a best-effort check before we proceed. If our SP
+	 * is outside of the overflow stack for this CPU then presumably
+	 * we're already corrupting memory, so park ourselves here in an
+	 * attempt to contain the damage.
+	 */
+	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
+		cpu_park_loop();
+}
+
+asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_sync_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_irq_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_irq_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_fiq_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_fiq_handler(regs);
+}
+
+asmlinkage void noinstr el1t_64_error_handler(struct pt_regs *regs)
+{
+	el1t_64_check_overflow_stack(regs);
+	el1h_64_error_handler(regs);
+}
 
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
-- 
2.55.0.979.g7e5102b832-goog

