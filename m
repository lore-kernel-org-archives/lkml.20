Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156224;
	b=yMtXaKIDdWxb3UDnHoyscXZMuFO2clv8RYdZMmN9q4YF6yEqYXWhvRC2ZV2HzlLv6Y/m
	 5vpFBANXq3JNLgVPHF2JtXd8zuES5gsr0fQetAgRz9kp8ZT7KYy+Dup5oiprkywzpaOg4
	 vEtOWMiRn2tgg1jKAOAQL4a+oLNoiRZUGX2cBUII5tIHMxGx1NJUZwqcudgF8euDAE5Km
	 zG8w/PAPe0z6Eys9dvVIEruFLesJryAw+Ny5k/WlhGYnITr2AWdmtPsG7KQCXdSkeHJQo
	 ha+OJY75vHHIwp23ztw9DUBKOSBwXHK0ZS3VDAAmFEttJzWKkhOwxtsgO4YYMQR1Tog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156224;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=a008btcntBEmLIyYQBfvpbVKUIYxfFhzudgDfJ05MVo=;
	b=SNTj6JZlJ09DMY6wq8o0/Q32XAEg5RO6fi6QdNZaeFlypNYGfzYH+I0iq4+eewXytkFh
	 tPYBkcBuPwv96Oy8/fRa4/bh8E23JQXs0vwavwS3V2vqYc1szNLS93LHLdMgPfZZ52RSG
	 G+bPYUvNtSQDQDhLRdXoIpK8CxgQ3yJmtuPYJdarVnlcWiRWj9IUZhsA6IjiEhqqHZ8o4
	 71bZWag/3O/xiTp/tX24alIKvcSrelXDkNI/g3cSazZHAi5bMcapotGnFMysuDt/rjeo/
	 ZVAQNB48OOVTzW74yC23BiZ4u2MQx/8dPNmH/HEapklGEBfcqGL4TkQr0VsY8ui5ghw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TnecaqrB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xFFuSgpp;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8A606D811;
	Sun,  8 Nov 2026 16:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA8A606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TnecaqrB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xFFuSgpp
Date: Sun, 08 Nov 2026 16:43:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794156222;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a008btcntBEmLIyYQBfvpbVKUIYxfFhzudgDfJ05MVo=;
	b=TnecaqrBD+Im0RG2F72tu7z8uTPLvyXcU6c1EUv4sG2TSmZ/YcOcR5hBZ/by/0ALqs6g+s
	va2BOGQUvSrDlYlHCVQb6xb2EsXCYCCk+yvSrfRld90gKKrkBXUkhpdVB4QLHrlyotlJMY
	dggfeP+BtuykKLEJk6O960M2vLM9tQIb1xFCpD9hunAO7xQLntyvU4a93gPou+O7kLqOEQ
	gQyCKqXBq39Pz0yTCVRmPYMzhf1yw4GFQ6RHLGiOGV6Q8MyJkqFSV6CJvLoVaA75GMyGNX
	mLVkVLrpymg5d6uJ9y3EnQ4tu2I/IGd3T4Ik1H3BcOEodUlyNsH0H2HvVs1Ovg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794156222;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a008btcntBEmLIyYQBfvpbVKUIYxfFhzudgDfJ05MVo=;
	b=xFFuSgppn2ScDMmO9Qbp5pKRo7ljnWBOGxNVRydt3CPlPcfv5aE62t9KgZj8rOubmzhDO8
	ElvPBndkM3Rvm0Bw==
From: "tip-bot2 for yangfeng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/core] genirq/debug: Re-implement flags printks in print_irq_desc()
Cc: Yang Feng <yangfeng.lucky@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20260904125205.15311-1-yangfeng.lucky@gmail.com>
References: <20260904125205.15311-1-yangfeng.lucky@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179415622003.2093942.10988770694313002624.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     403e2849fb51a1b8ca06a5fe70d75ee635d79520
Gitweb:        https://git.kernel.org/tip/403e2849fb51a1b8ca06a5fe70d75ee635d=
79520
Author:        yangfeng <yangfeng.lucky@gmail.com>
AuthorDate:    Fri, 04 Sep 2026 21:51:17 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 17:39:43 +01:00

genirq/debug: Re-implement flags printks in print_irq_desc()

When the INPROGRESS/DISABLED/MASKED flags where moved from the interrupt
descriptor state to irq_desc::irq_data the related debug printks were
disabled and not fixed up.

Re-implement them so the state printouts are complete.

Signed-off-by: Yang Feng <yangfeng.lucky@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260904125205.15311-1-yangfeng.lucky@gmail.com

v2:
  - Implement missing FIXME in ___PD() with __irqd_to_state
  - move the define of __irqd_to_state before "include debug.h" in internals.h
  - Adjust printk() width from 14 to 20
  - Use full legal name in Signed-off-by
  - Rebase to latest master
---
 kernel/irq/debug.h     | 13 ++++++-------
 kernel/irq/internals.h |  4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/kernel/irq/debug.h b/kernel/irq/debug.h
index 8ccb326..4514391 100644
--- a/kernel/irq/debug.h
+++ b/kernel/irq/debug.h
@@ -3,10 +3,9 @@
  * Debugging printout:
  */
=20
-#define ___P(f) if (desc->status_use_accessors & f) printk("%14s set\n", #f)
-#define ___PS(f) if (desc->istate & f) printk("%14s set\n", #f)
-/* FIXME */
-#define ___PD(f) do { } while (0)
+#define ___P(f) if (desc->status_use_accessors & f) printk("%20s set\n", #f)
+#define ___PS(f) if (desc->istate & f) printk("%20s set\n", #f)
+#define ___PD(f) if (__irqd_to_state(&(desc->irq_data)) & f) printk("%20s se=
t\n", #f)
=20
 static inline void print_irq_desc(unsigned int irq, struct irq_desc *desc)
 {
@@ -39,9 +38,9 @@ static inline void print_irq_desc(unsigned int irq, struct =
irq_desc *desc)
 	___PS(IRQS_WAITING);
 	___PS(IRQS_PENDING);
=20
-	___PD(IRQS_INPROGRESS);
-	___PD(IRQS_DISABLED);
-	___PD(IRQS_MASKED);
+	___PD(IRQD_IRQ_INPROGRESS);
+	___PD(IRQD_IRQ_DISABLED);
+	___PD(IRQD_IRQ_MASKED);
 }
=20
 #undef ___P
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 703a062..daa1507 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -79,6 +79,8 @@ enum {
 	IRQS_SYSFS		=3D 0x00004000,
 };
=20
+#define __irqd_to_state(d) ACCESS_PRIVATE((d)->common, state_use_accessors)
+
 #include "debug.h"
 #include "settings.h"
=20
@@ -218,8 +220,6 @@ static inline class_irqdesc_lock_t class_irqdesc_lock_con=
structor(unsigned int i
=20
 #define scoped_irqdesc		((struct irq_desc *)(__guard_ptr(irqdesc_lock)(&scop=
e)))
=20
-#define __irqd_to_state(d) ACCESS_PRIVATE((d)->common, state_use_accessors)
-
 static inline unsigned int irqd_get(struct irq_data *d)
 {
 	return __irqd_to_state(d);
