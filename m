Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183932;
	b=uxNfpcYu4BUTaa8xkjR7eJWh9KTzhVasbZ49qBwPhn/7bUNLjohw36rS2UQAPMQj3SGL
	 passANWfQ+/ZCj5Cga3NKJuwD6RGrGPLISlTTndgZ2cU+pk/RSQVpatrVbl9nilbcEstx
	 wIFkJnA+sI6GgdwvZ5cPiYxjspNDx2OcLNcZsLSniVcJLRXLgQNuCIJJGLgfKW9LqKdg1
	 xdrLlY/E/ws5ABeQ9GmNSINex1ZEuRDjVCcKLuOU++F1R2SictdMxAwpvNeeOoGdQypOs
	 w2WOO9xBGvLy4ipcUJOu/CSqZ7/EhcvRoKjpdvzBaX9++Wyi6RudUZoASCa+f2qd9qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183932;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dd3LTey7FOWHFlhpV5HFbjoYqofICdOmzExQr7sFatU=;
	b=PrDrGoWzMMaJEO+R/l5YlduBnCE9io5QtVnK9bc/++Gh6NMCVut+PDkQaVm402eiDTQ0
	 Z13ilnYtz5qyf2RE49nj2AfZwmRsUADVhTERVHUF2I658DaBnkh9Hho+A8PwV/Ho0M/JZ
	 OuwOcGms3hjw1IeKwB3eitCYa/t1H0q+v+oREeyVC6hh9WkaIVj7Mo7ZicCvLdlLHV6BR
	 nAzb6Wphs8ReY+AOndcZTFUVuVKDxVFSLs1CmBoQLzti5O7/cK07cL7DWyLc2uFSomvHt
	 uMlZ77VJydPuhNmCHBOUnQojkYBOZ0eD+hVo024Tc/ex3dyREFSckuBcumTXWhqe8cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDrpwpoI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600EE606A32D;
	Wed, 28 Oct 2026 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDrpwpoI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793183932;
	b=ukHRQKYm3bgX53TrzlM5t/U0bg5QQCJIFdngwgk+VCw9fERhSp5Xi7gl3jQ1udh1mjYC
	 ZWSukk9rW1uDIcuXkl6F5G4WJlgfVCyU2ZlBek3D0e0Ee2FM2g9ISE1ew9eS9slrfZq0L
	 yqhxmdnA5SfO0OgBSP+KIKY7ge/z3vIAiuyBNu/AgyhE/yMhva/eZQROiYCTjXFplQWdC
	 hVTDRTYBYqPgMa4w4Zl+o32iL7AFuU2gW/tsg++PQ0v3xPdrb/B6sK4uPHEH6YWemgMUh
	 sjLlz8PXG7sZ4O9zEHtKiuCCpbxhwdj7lQGbO3vd1Zioe2YVx2FrVEZ6LgGZ7Aupx5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dd3LTey7FOWHFlhpV5HFbjoYqofICdOmzExQr7sFatU=;
	b=Xq0gefE3mDzrX55KVGLFptU7O4apAnY0lSBt80cPLTrKmWIomzYFYvVzhkCJL0XNpQno
	 efC4oKzckhXmYvIZR6/FFDPXIVJNXF8JZTeb8D8GHkKMNfEU+vJ/67Cx2/QebBv2XfplA
	 cJ2FzqS8MXFUUqwMuCgC8KT6qgtyakvjQUEpbNWQkxxeEBlxG/UK7K4JL0UgSgDjkNN6s
	 pAcdUsr7v4FgomPcjxqmlV+OjEt6SEBPBGeT7X+2mYHn3WcVdANmpNEbSdYq507yoK9Y4
	 Pdi5Nt3yZrVhWLX+jg15Foold2nbdhcWyvjtEHA5NiJK+WK5wDDRgsaQbu27TectFcw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D32A1F031EC;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183932;
	bh=dd3LTey7FOWHFlhpV5HFbjoYqofICdOmzExQr7sFatU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fDrpwpoIgHWdgW7RLHyyy5Ej3o33gWWETjBey3khGzhrvZNI9MKN/pKSsxW0ruFvF
	 UUG1/7yEorQtbcPubzaLWm7H7VPcG3fI34dqU3AdgR9vEB1eYc0to+ag+46rGDtoPI
	 UTqeemHI8Aj2gzog9iAorrNJRjhKUrsL/dZWlkYLdccDMEG0ZRQXN1MrwnPXhdqVpl
	 GguKEqxVDnEukP2nx9T2hqVEHLJ1D429b1huJDHhwvZI4qUxLSTz5EE4D2/hHIiY4s
	 gCPFz/hCO5AlViBSST9fgLkRvUvebtgPFPaVDicgj65fevfFOLZ1YfquxVgkNc+ysy
	 RX8MSJKnPkUNQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8BD33453FB;
	Wed, 28 Oct 2026 10:38:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 28 Oct 2026 12:37:52 +0200
Subject: [PATCH v4 3/3] soc: mediatek: pwrap: add mt6572 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261028-6572-pwrap-v4-3-1780c58d2097@protonmail.com>
References: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
In-Reply-To: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183929; l=3136;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=X7RUCAUzHEeezmdptLocTfbDePTBSCcJViWNqtvBVa8=;
 b=xbzrk1QUfsZq+oeVv0PQSkjw+Sf8DQY2IBuHNdfHAJHJRZ34ufne2EKTSW9cAUezj/4BXBI4v
 Teg/mDz2D/XCBzE6WRB8I621nSAmmDvPLzX7OPqfVF3NFTh/NJ0+XGT
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

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
2.56.0


