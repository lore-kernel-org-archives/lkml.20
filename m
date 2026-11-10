Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351076;
	b=I8SaXYa6fkNeKaJsydf3ht++JMYeGqo2p5vPQNErBExlK6rk/Sf4c1o5n8HVSEak77NY
	 4tDi1PGERo+KWsJIFVrKdBiWzipjm7kI75gqf8o/TeTneUq8iG6PHGWd4ijOo2B5o5kPd
	 bUM5ilDJTu1fEQRs86kS4Bsobw11zROzDXXqq49m9hjyWsvnilEsGKIRMZNX/1esRILth
	 EFFV5Bm/HVLajpPxiPS8AMY4TxN9fy387s9BuyUkNZSuynGLA4zm6r/i5niYR0G5beKRX
	 qCVXi5xfXJCY88uTLvOUaFAmcvpP6kTC/67zev5fSYG6nXrWOwGc3yredfBDp41NUMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351076;
	h=DMARC-Filter:DKIM-Signature:Date:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eM62stGlO9Wse+nXJb2nhJ+ESqdO/DZ9KfICfYRljao=;
	b=lLlnKShOvgm4XlaDqxwpC1DuHJ6c7ScaaKOdeZqCh9BOOnsJo9mndH8qcRWStA+UpHWD
	 mHuLxBOzEpNgbo6MM0x1PZF8U7qFC3/sY4+t1lfftjHlTeo1BFpp6kEz8A5fj8ocqG3KX
	 vJvB9PKxDHxAJMSXElby1ZeazFySYnS5Q11tHZ40+DF/tdwaQyQ0f/WDy/5HssU4h0qH/
	 oFv5gPLxp8zXmFF0u7HOlwnQq7Jogn5dF9nCVTOTkK8oC/ASqrlMmEzcQ5Hj0jIujMCHO
	 HCSdFHIbVbVre+FF7ekhfzqq9wGsQG/VWNnOFBrNCZ+9j/BKj/BYloJHbLSGMxtcQ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.ch;
	spf=pass smtp.mailfrom=protonmail.ch;
	dkim=pass header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=j3ilvKbE;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B6606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7B6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=j3ilvKbE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794351072; x=1794610272;
	bh=eM62stGlO9Wse+nXJb2nhJ+ESqdO/DZ9KfICfYRljao=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j3ilvKbE2p1jKmPfpCdK0zEPr3YJ3hayhKXluJHGBtP5M3UKofViNrz9AbcvmWSRz
	 cZaL52hH2CCbe6bgtttj6bMcLoW4d9e1CCA0SWsm0U6laeaadKb1UzfR2TWLcoa9Z7
	 qWdlOirI1vxzj9rwWd7WOqMSlaWHiyx0mReowbWG1KTwKn4HpP+cdRehBdmPT1oo+T
	 cXTfK048v8RTJRae8tL4B1CJSCPaSuipXI6KmrOTuuoKrQ9s8fk0ImTd7lQsvWdNHG
	 qh4oVCIeKind0iWdshxvQs08PlpjQizcZ8MmOSbF4BctmC6DzhDBlU+jnCvCuBdJy0
	 O4VAORjL/Btww==
Date: Tue, 10 Nov 2026 22:51:07 +0000
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for domain creation
Message-ID: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: b6e27d1989934072699f0422e290035781386c66
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

mt6397_irq_init() currently creates its IRQ domain with a fixed number
of interrupts (MT6397_IRQ_NR). However, not every PMIC supported by this
driver has the same number of interrupts as the MT6397. The MT6328 has
47 interrupts, so its interrupts above MT6397_IRQ_NR (32) are currently
unusable.

Correct this by passing the PMIC's actual interrupt count to
irq_domain_create_linear() based on the chip ID. Define the missing
interrupt count for MT6328, as the other supported PMICs already have
it defined.

Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261110-mt6397-irq-num-fix-v1-1-81d=
17454194e@protonmail.ch
---
 drivers/mfd/mt6397-irq.c        | 7 ++++++-
 include/linux/mfd/mt6328/core.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 5d2e5459f744..783be9f5c9c3 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -171,6 +171,7 @@ static int mt6397_irq_pm_notifier(struct notifier_block=
 *notifier,
=20
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
+=09unsigned int irq_num;
 =09int ret;
=20
 =09mutex_init(&chip->irqlock);
@@ -181,6 +182,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09chip->int_con[1] =3D MT6323_INT_CON1;
 =09=09chip->int_status[0] =3D MT6323_INT_STATUS0;
 =09=09chip->int_status[1] =3D MT6323_INT_STATUS1;
+=09=09irq_num =3D MT6323_IRQ_STATUS_NR;
 =09=09break;
 =09case MT6328_CHIP_ID:
 =09=09chip->int_con[0] =3D MT6328_INT_CON0;
@@ -189,12 +191,14 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09chip->int_status[0] =3D MT6328_INT_STATUS0;
 =09=09chip->int_status[1] =3D MT6328_INT_STATUS1;
 =09=09chip->int_status[2] =3D MT6328_INT_STATUS2;
+=09=09irq_num =3D MT6328_IRQ_STATUS_NR;
 =09=09break;
 =09case MT6331_CHIP_ID:
 =09=09chip->int_con[0] =3D MT6331_INT_CON0;
 =09=09chip->int_con[1] =3D MT6331_INT_CON1;
 =09=09chip->int_status[0] =3D MT6331_INT_STATUS_CON0;
 =09=09chip->int_status[1] =3D MT6331_INT_STATUS_CON1;
+=09=09irq_num =3D MT6331_IRQ_STATUS_NR;
 =09=09break;
 =09case MT6391_CHIP_ID:
 =09case MT6397_CHIP_ID:
@@ -202,6 +206,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09chip->int_con[1] =3D MT6397_INT_CON1;
 =09=09chip->int_status[0] =3D MT6397_INT_STATUS0;
 =09=09chip->int_status[1] =3D MT6397_INT_STATUS1;
+=09=09irq_num =3D MT6397_IRQ_NR;
 =09=09break;
=20
 =09default:
@@ -216,7 +221,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 =09=09regmap_write(chip->regmap, chip->int_con[2], 0x0);
=20
 =09chip->pm_nb.notifier_call =3D mt6397_irq_pm_notifier;
-=09chip->irq_domain =3D irq_domain_create_linear(dev_fwnode(chip->dev), MT=
6397_IRQ_NR,
+=09chip->irq_domain =3D irq_domain_create_linear(dev_fwnode(chip->dev), ir=
q_num,
 =09=09=09=09=09=09    &mt6397_irq_domain_ops, chip);
 =09if (!chip->irq_domain) {
 =09=09dev_err(chip->dev, "could not create irq domain\n");
diff --git a/include/linux/mfd/mt6328/core.h b/include/linux/mfd/mt6328/cor=
e.h
index 9a08aed72b9f..18e000cf5d29 100644
--- a/include/linux/mfd/mt6328/core.h
+++ b/include/linux/mfd/mt6328/core.h
@@ -48,6 +48,7 @@ enum mt6328_irq_status_numbers {
 =09MT6328_IRQ_STATUS_FG_ZCV,
 =09MT6328_IRQ_STATUS_SPKL_D,
 =09MT6328_IRQ_STATUS_SPKL_AB,
+=09MT6328_IRQ_STATUS_NR,
 };
=20
 #endif /* __MFD_MT6323_CORE_H__ */

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261110-mt6397-irq-num-fix-2de78da5695e

Best regards,
-- =20
Ben Grisdale <bengris32@protonmail.ch>


