Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A64CB8AD;
	Thu, 15 Oct 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058452; cv=none; b=hSFnrVQYoicGG90bBIEDCjCUjN3H5AA3eNKeBSrr6L0eBiZeK9wQ6Tht9bGG0oypb+VFeCit9eDXXSXP5gN8rI3CxlVqaRe8gT8IVsc2CY/+3qncN1KBCph+oLjYRiDfmF38/w0eRPyOlnMVdJvkUuBX82tn+gHB+4rlvpWB7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058452; c=relaxed/simple;
	bh=wQCWElaDKSG5twpvgCXoub9OLoAY/sEZylhO8TbSdOs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hBFfLL2UgOyujXXlBDyzVHw54gSocIwvv/WUdtLbEWaIXhtr6R6ZPMZ+rFn3l+NHYwwzzX2i/P7UmWZXZGD13y++xnKzAS7ip3IjBm1jwcCt3kWf7RR7zypvR/tYPsy9diNgv0ZcvnJp9jVsJ1jDHef5h+QyiQg5Fj0HQW79A+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dIWNBeZD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hTUexe+E; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dIWNBeZD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hTUexe+E"
Date: Thu, 15 Oct 2026 10:00:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058439;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8u2A+ocTeJnnAtYvzdD/LjQxbWb3gqYKwcqUM6n6J9g=;
	b=dIWNBeZD4BSM/EjwuOULE3tm/s21dsnf1kDISunr7sTE2rlfrSlOo2jDDUnlY7hqMZcM4s
	Ope8lWcq7yyZwgfHvzkDJhVBu9quVJbXKbsWiRowdJkh/pDb2LlVjVpPihLa0noe34TcTn
	8J0uLyvO5oKQNQ+L3KLj0OdEB1gYLt6Skz4CLeKDSDlcpxmbfvkl9iUx7+8ySQain22cyj
	Uv8kEtc7e3FM+7jrFmcyn04oKkN1inB7oft9fuIc0yRR6vSZwEFSCfe10dE8gleONfxf6J
	QNxOEfwRdS9nm5a3oR6mpopvo2jMH7G33z9MTF53+MKn+GrKXDfSO7St1KN7lA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058439;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8u2A+ocTeJnnAtYvzdD/LjQxbWb3gqYKwcqUM6n6J9g=;
	b=hTUexe+Erw10n+9Uz7n/Ygjb0MigHJoJbHn5yrG6jKHSQ/BlF7c4CpqtJHQRVRkMsptFOF
	k2ct12Y6FHmGa9Bg==
From: "tip-bot2 for Zhu Ling" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/drivers] irqchip/gic: Fix UBSAN shift-out-of-bounds in GIC helpers
Cc: Zhu Ling <zhuling2709@phytium.com.cn>, Thomas Gleixner <tglx@kernel.org>,
 "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>, Radu Rendec <radu@rendec.net>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929031050.16988-1-zhuling2709@phytium.com.cn>
References: <20260929031050.16988-1-zhuling2709@phytium.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205843812.2666988.8692137118347120054.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     13ce14ca41a35f5ee90b77ffa57da91ce6048a2d
Gitweb:        https://git.kernel.org/tip/13ce14ca41a35f5ee90b77ffa57da91ce60=
48a2d
Author:        Zhu Ling <zhuling2709@phytium.com.cn>
AuthorDate:    Tue, 29 Sep 2026 11:10:50 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:55:41 +02:00

irqchip/gic: Fix UBSAN shift-out-of-bounds in GIC helpers

When running with UBSAN enabled, enabling a GPIO controller that uses a
GIC interrupt as its parent triggers several shift-out-of-bounds warnings:

  shift-out-of-bounds in drivers/irqchip/irq-gic-common.c:50:21
  left shift of 2 by 30 places cannot be represented in type 'int'

Similar reports are emitted from gic_poke_irq() and gic_peek_irq() in
drivers/irqchip/irq-gic-v3.c. The corresponding GICv2 helpers use the
same signed-shift pattern. These masks are generated by shifting signed
integer constants, which invokes undefined behavior when bit 31 is
selected.

Use BIT() to generate the masks with an unsigned type and make their
intent explicit.

Fixes: f27ecacc54cc ("[ARM] Add support for ARM GIC")
Fixes: 5c0c1f08abf0 ("ARM: 6150/1: gic: implement set_type")
Fixes: 021f653791ad ("irqchip: gic-v3: Initial support for GICv3")
Signed-off-by: Zhu Ling <zhuling2709@phytium.com.cn>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Reviewed-by: Radu Rendec <radu@rendec.net>
Acked-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/2fJDwUUYdEf2_eaRa041L9xkT8RkSWFeo7euOnqMbbPhU=
atLlEaAvGfB6sOspDmXaxO87Eh7bQLV9UolyjbMtZBT1wB2UGypjPOo0Z-RC0Q=3D@proton.me
Link: https://patch.msgid.link/20260929031050.16988-1-zhuling2709@phytium.com=
.cn
---
 drivers/irqchip/irq-gic-common.c | 2 +-
 drivers/irqchip/irq-gic-v3.c     | 4 ++--
 drivers/irqchip/irq-gic.c        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-commo=
n.c
index c776f91..8bd1eaa 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -48,7 +48,7 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk *qu=
irks,
 int gic_configure_irq(unsigned int irq, unsigned int type,
 		       void __iomem *base)
 {
-	u32 confmask =3D 0x2 << ((irq % 16) * 2);
+	u32 confmask =3D BIT(((irq % 16) * 2) + 1);
 	u32 confoff =3D (irq / 16) * 4;
 	u32 val, oldval;
 	int ret =3D 0;
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 32a8ea4..b9a99f9 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -457,7 +457,7 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
 	u32 index, mask;
=20
 	offset =3D convert_offset_index(d, offset, &index);
-	mask =3D 1 << (index % 32);
+	mask =3D BIT(index % 32);
=20
 	if (gic_irq_in_rdist(d))
 		base =3D gic_data_rdist_sgi_base();
@@ -473,7 +473,7 @@ static void gic_poke_irq(struct irq_data *d, u32 offset)
 	u32 index, mask;
=20
 	offset =3D convert_offset_index(d, offset, &index);
-	mask =3D 1 << (index % 32);
+	mask =3D BIT(index % 32);
=20
 	if (gic_irq_in_rdist(d))
 		base =3D gic_data_rdist_sgi_base();
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index b2926a3..a5ca04e 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -178,14 +178,14 @@ static inline bool cascading_gic_irq(struct irq_data *d)
  */
 static void gic_poke_irq(struct irq_data *d, u32 offset)
 {
-	u32 mask =3D 1 << (irqd_to_hwirq(d) % 32);
+	u32 mask =3D BIT(irqd_to_hwirq(d) % 32);
=20
 	writel_relaxed(mask, gic_dist_base(d) + offset + (irqd_to_hwirq(d) / 32) * =
4);
 }
=20
 static int gic_peek_irq(struct irq_data *d, u32 offset)
 {
-	u32 mask =3D 1 << (irqd_to_hwirq(d) % 32);
+	u32 mask =3D BIT(irqd_to_hwirq(d) % 32);
=20
 	return !!(readl_relaxed(gic_dist_base(d) + offset + (irqd_to_hwirq(d) / 32)=
 * 4) & mask);
 }
