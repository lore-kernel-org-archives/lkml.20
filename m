Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091502D94B5;
	Thu, 15 Oct 2026 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058088; cv=none; b=gtHQlNwn/+dV/g9vpohiFU3VsWenK6u0Q859D0kDvcj9yrEIkBbmrxXAexPc6FtwdaeOAiv+MXzgIso3Drh6NUNYiBn5nzIDbvGNx6hm+m75ysbAYJVN8WLG2Ib5XTxsB1iClEDpKTtomhVIvELyIJ0XWxHir9oaejK4obxkf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058088; c=relaxed/simple;
	bh=256ub1+EMI2/yc6hRxi9cF2VnZIJXuNDdePrD9Jmjc8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=afJHaPFIFl1J/c33LgYwqWhy4CJj0rJc5OQZamDRV9fCSfuUrnev9BfzvI+9/OLPg0Zu9Kp4klCq2CmDSMZYFFNZyAaOjAPyEOzvujXbQMhABvSRjUiDA59mwCtcYCUrJ6mvA9AcbYIl71+aM0x4ZQ52JTa1W686bykYUv0vxtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WRmHLFxy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jfGtl/qe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WRmHLFxy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jfGtl/qe"
Date: Thu, 15 Oct 2026 09:54:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058078;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVyO2KKWOxQz1LRbURStoJK12r9pxMxFILc6L2jgmK4=;
	b=WRmHLFxyG8YT3mOPGREVM0WvOQOkDdA2by2YPIDUvfIWuo6ccMxz9C3BdHJYkhufDpjIWG
	WzxsTlCh4vAXfMkVUBJLMcEq869JWuSXHOzQwUxEeZlBRCipwuJLcDlBiS5PZyVbuYMDuq
	r5c/p/jhSYAJH3PfomrKtu7wy89r7x58Nf8CU8nPGomx2z3k3M8/V0+nDPq/FjqYVg2kT3
	mUO73WRHyAHhJIibvbAeo5cKULGuhiuQEQFOwASr2hPG0MFkjF1pgmve+7daL84wGoc4VD
	xoBsaHD3Kq6dEpYc7Q3czCeV2rHd6Ik/cCEcLOOQktMognK0Cu7Z0ZQzrpba2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058078;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVyO2KKWOxQz1LRbURStoJK12r9pxMxFILc6L2jgmK4=;
	b=jfGtl/qexIRV6oTysxZaMBHb1syQV4/JULw98o9Y7H1qaLnzohnROTw+YBd9FWbZ22MTR8
	7Jtos4yl7oSAtHCQ==
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
Message-ID: <179205807620.2666988.658158530960567460.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     9ed1a2c62bf21abe8cb7607d7f4fd615d5c6b53c
Gitweb:        https://git.kernel.org/tip/9ed1a2c62bf21abe8cb7607d7f4fd615d5c=
6b53c
Author:        Zhu Ling <zhuling2709@phytium.com.cn>
AuthorDate:    Tue, 29 Sep 2026 11:10:50 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 11:50:48 +02:00

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
