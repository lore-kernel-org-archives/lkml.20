Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C23BB104;
	Thu, 24 Sep 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242755; cv=none; b=XXimEyvqyKjd0hhXTDNT7yp4J+SisHxVHoA5eYzuD6bne7oXbP5UlQL+B7iCyT/0c+9igiRVgoiq1QRJ1aB+zVotZz5UealAHqEkYU/fS/1PhoianrH7rbbT2cRQF3mKolw+WsQJKajJcJMPx8KUIQmR1+bNhKqFSbI3ISZSQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242755; c=relaxed/simple;
	bh=0RTxQHG5SrtpOkmN7+AQ0qZmluLnT0Jxv21b+yq+lq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dR51jGCJX4MdJclRRIMhff5xm71ZMyjKwA8m07n4ygoQD2T9oEJVkKGyP/g9GOW3tiqRNe3P5PRuzBjm4BSzeO6u0gzTuj9w0HENPDjthbDBRvhUl9kwHt8A5AaOqinaCDoZpHbrOp7Q3wnP7Ii87007KzOS6++EKX+XUUVi8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcNCsIZ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcNCsIZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 011F2C2BCFA;
	Thu, 24 Sep 2026 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790242755;
	bh=0RTxQHG5SrtpOkmN7+AQ0qZmluLnT0Jxv21b+yq+lq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PcNCsIZ/vgfG3346EY3GJ0vXUj0aWbAbqnyhTABImkzh2FwQZ9KeiZ7AkixB2Tn80
	 7fOEcjyJFQXB9ebm47ftjq8uikQuE0h/6UN+sVKjf4VE/9IN0c2GoGUidzld+Dlrct
	 Vzs8otNFlqN6QzAFUFBpTsMtyA4osbALrwp2aFBtaH3BH0AKBtftteW2D4IrXWeiHi
	 gx6GkNggMsRcYfLLUHKLl0YfrZuUxjOFABODsasRq59iNZlMvRABqBrzcpbbCVlcjr
	 smoQzLnZcXcgbih+iMybTJoBlvL4BoL/qc/IuZKCaLxHyZgZFgs2Zbw2T9O8adD+p+
	 gG5fT+YgzJw8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE39BC9830E;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 24 Sep 2026 12:38:32 +0300
Subject: [PATCH v3 3/3] soc: mediatek: pwrap: add mt6572 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-6572-pwrap-v3-3-64769b6446ac@protonmail.com>
References: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
In-Reply-To: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242752; l=3136;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=5/Rr8S3k+cl5buopSAZz/51dHnX8PxgtHV+UdekTJuQ=;
 b=3zna0fCsAZGuoEu6X45tKEbLaKOi8CmV2a1/9jAYSfRoPrJiPoGh8AMeJthOLkL6WItLm4gk5
 F2X2Og9coxQAeuyxSgaO8HM62n25DBavqHKp+Zo5QRb2KOtLK2r4TxM
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add mt6572 registers and platform data for the pmic wrapper.

While vendor kernel source code suggests that mt6572 can be paired with
the mt6320 PMIC, no such devices have been found yet. Hence, registers
that not included in the mt2701 array are omitted.

The mt2701 SoC-specific initialization function is used because they
share the same GPS_INTF settings.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a4b10b0a97cb..3f05fc724e15 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1314,6 +1314,7 @@ enum pmic_type {
 
 enum pwrap_type {
 	PWRAP_MT2701,
+	PWRAP_MT6572,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
 	PWRAP_MT6795,
@@ -1733,6 +1734,11 @@ static void pwrap_init_chip_select_ext(struct pmic_wrapper *wrp, u8 hext_write,
 static int pwrap_common_init_reg_clock(struct pmic_wrapper *wrp)
 {
 	switch (wrp->master->type) {
+	case PWRAP_MT6572:
+		pwrap_writel(wrp, 0x8, PWRAP_RDDMY);
+		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_RDDMY_NO], 0x8);
+		pwrap_init_chip_select_ext(wrp, 5, 0, 0, 0);
+		break;
 	case PWRAP_MT6795:
 		if (wrp->slave->type == PMIC_MT6331) {
 			const u32 *dew_regs = wrp->slave->dew_regs;
@@ -1839,6 +1845,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		pwrap_writel(wrp, 1, PWRAP_CIPHER_START);
 		break;
 	case PWRAP_MT2701:
+	case PWRAP_MT6572:
 	case PWRAP_MT6765:
 	case PWRAP_MT6779:
 	case PWRAP_MT6795:
@@ -2277,6 +2284,24 @@ static const struct pmic_wrapper_type pwrap_mt2701 = {
 	.init_soc_specific = pwrap_mt2701_init_soc_specific,
 };
 
+/*
+ * MT6572 register map is a superset of the MT2701. It has additional registers
+ * OP_TYPE (0x10), MSB_FIRST (0x14), GPS_STA (0x40) and SW_RST (0x180),
+ * which were omitted because the driver doesn't use them.
+ */
+static const struct pmic_wrapper_type pwrap_mt6572 = {
+	.regs = mt2701_regs,
+	.type = PWRAP_MT6572,
+	.arb_en_all = 0x1ff,
+	.int_en_all = 0x7ffffffd,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = pwrap_mt2701_init_soc_specific,
+};
+
 static const struct pmic_wrapper_type pwrap_mt6765 = {
 	.regs = mt6765_regs,
 	.type = PWRAP_MT6765,
@@ -2446,6 +2471,7 @@ static const struct pmic_wrapper_type pwrap_mt8186 = {
 
 static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
+	{ .compatible = "mediatek,mt6572-pwrap", .data = &pwrap_mt6572 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },

-- 
2.55.0


