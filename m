Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACD4381E8A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537350; cv=none; b=srkjk1Ag5Y9c+DtctesaNc8K6GmQZUF9zXCSHin0L0sYdKGPHeXi5QwmqnZ3YGd8cZ6qDKaLKmiwTeVOqxv/9yRK7MQd3DZhf/JL2GuMOHivWAEXd7oE3NLAmucX7OtXwVFxu07wGVKxAU5swIWk8YAjUltWLlU7GA2cduKjepU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537350; c=relaxed/simple;
	bh=M3WajPatnE0mWYQmmAzrdJhQoPdwi8cUHui9t50gSro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lBfuc7H42lywN1R45IvEAZ4hvOS6lY0WDEW1SibQQqSX37trD5Y73jqxUS8v/sgMvN0TXIR7tl0ID2bUVdKZaYaeWbTrYKRrhg2gsl5d3lFPLXX/3Ukl+GRSuramwL/WI+lMwiMqGv3IIZN56ExKn/RWuFuZyQgODeTLj+f68LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3HNDH4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3HNDH4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA54C1F00A3D;
	Fri,  4 Sep 2026 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537349;
	bh=60gpO03ThxnVGQt9XlytEMoGdzSGk1VBaaogieREs9Q=;
	h=From:To:Cc:Subject:Date;
	b=n3HNDH4GzQBQsmaToRAjjFqqL9Lv9N9ZnzVc60lFLKo3lxkUVDw5bhWfhgTCmWTBh
	 FWhbsesG8KEOLIvPbBFY+uOc5aCJl+fTF7Tfxu8JMVDF4q5IwEHrd6j1vifdGaVdqY
	 X3h8QSKiZ8Ra/4kk9K5YOVnh5AW5iBtMVPHYmG6kzxFjneNj7etbsrYPXvYvLX8PkW
	 vOnG6u0bvBqVRpMzFLCsy14HZImTK+nISjdwz0fpc40uyp9DxeKFF5QSofDL8muL5V
	 FL3br0kg7w5wJ4296VfT11s2rEbZzAtfWiSB5A95xckkjxrEb1yzjDZl5j8d5gAXdI
	 YVjQC6QtIbsmw==
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org
Subject: [PATCH] x86: Define __ARCH_IRQ_EXIT_IRQS_DISABLED
Date: Fri, 04 Sep 2026 17:55:44 +0200
Message-ID: <87pkyt6mf3.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

X86 exits from interrupts with interrupts disabled, but it does not have
__ARCH_IRQ_EXIT_IRQS_DISABLED defined. So it ends up with a pointless
local_irq_disable() in __irq_exit_rcu() instead of just validating that
interrupts are disabled on a lockdep build.

Add the missing define.

Signed-off-by: Thomas Gleixner <tglx@kernel.org
---
 arch/x86/include/asm/hardirq.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/x86/include/asm/hardirq.h
+++ b/arch/x86/include/asm/hardirq.h
@@ -113,4 +113,6 @@ static __always_inline bool kvm_get_cpu_
 static __always_inline void kvm_set_cpu_l1tf_flush_l1d(void) { }
 #endif /* IS_ENABLED(CONFIG_KVM_INTEL) */
 
+#define __ARCH_IRQ_EXIT_IRQS_DISABLED 1
+
 #endif /* _ASM_X86_HARDIRQ_H */
