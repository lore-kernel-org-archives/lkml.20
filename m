Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922198;
	b=VOoDC7wesNk2Q/oi1icwNv3eDn+wfZ4IjXlpN/cpNdbVCazgLQr3+4UC+c2REG9haBPs
	 /hsTsMIvqsjAY5LecZ5zVD31JybEvoYK3du7SK/dGXDy8r9VXijPLz6F6bFd5EXtboTcK
	 8rjULDY92DBRSzx/1OZKIba+Yg6kqYHwVLEFHIWN1zQ6FG2kQ5O+hKQghHeJ1H4nT6llv
	 1sjqtuzVH2tuEWNE/mahAEDkxGS5Fa+E22eny85FOnnOcUw30O3W6lrUMVN8HclhO2/fR
	 5k+PfqMirvKa1PbUj70sgctdd7TtZOVXHMIfg8+SF2VS+1AmG9t6EYz7/X7vwij+c1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922198;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+/eM0ie1fpSs0MEZ2nMXLlQ2it2BqaQSx7FYZNcUYkI=;
	b=X5mGYzGDQcYsoKBNnX6fTzWnfKm1+r8U1AfHX9VK5wF7X9AUdjb7u29feAbEtfX6CGf2
	 4kNios21V87nffN8Ws6O47m4e0Mh9/hzOhY49yUAjkHpVtFlNxNDQtbv7dgXH7vX9Vxg/
	 4ioFrWKjk8qrvUIYH86AFTgWoq4DS9Iw4Fzno0msZ5viFGAfKabf11iy/V34djTPEgToW
	 jy17eYnUCcXscGHcc21hYtwmATqF3nxt4O1LZLqeV+bKKCNbyT8XY0skoMDAvxD9PftnE
	 0/Pw1y7vlArnFBJb94JYbp3FI/IMMEsxRalrozm8dCfBq05rT/mTZoAvMtyaKbT1Eug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNreNuQZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB76606A338;
	Tue, 17 Nov 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNreNuQZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794922198;
	b=JNcM3EqDcJbm8hX2FU7WSnnD7D5diDQj5ALdcVFwztrxRMFZjcAxUP3hKYZkjl2wpuwT
	 jeY/TIhyqOtSOMF62SySmd7NlSw1WUgSnAQ4Z43tyEmd8qGYPwEG1x29dsSIa0bBX24b1
	 b+ObSwkWa+jKFNxq9XCFD9AuXpp6YxBuFAnYB30ndv+bCXI6wvY/KZsj1kJ/iHZ6SvVgF
	 x1/b/3+QWpt2e8TSFTaR2qb/RTfSRYbmRTnaZZ2RkFd5LDhRp/PWNSFV2g0fzhgpThowa
	 S9sz9jhsFc93wlk7uZPP8W0b+Yg2wvRxr/c3Rdyt8KFvAn7W4YYzBuA2Vw9sHB9KH/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794922198;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+/eM0ie1fpSs0MEZ2nMXLlQ2it2BqaQSx7FYZNcUYkI=;
	b=Jw5m0ZpNzFKHMX1qI8gSE136A/cJbfV5DVE0HlAgl2J2mvBfrFyKq1ZlapnnzpVn35G5
	 WcViVn3dMCCJcReVT1QJWjMzm8er38G2/ti9vlealPBaCcWi8Qw0oiBQsYdR78O3Emop7
	 I/H3tsQJtDzb79FGOVgJvowRvjq1Okaq53fH/K7OdoszyGSW67MEEByJVtfrGiLdAvSNm
	 4NezHZ+aV6kFC3sXm8ZTPjFK6penQwXDiQ0q+0TtUcqiKtQjgtxe4sOdvYJ0Bhk1a+km8
	 EtCQJmSLRGhO+azjzfeo4Yp12tlPZmhHivND2P9m7mLPvb6s4VYkrzfZ4M3pr92uMjg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD1C21F000C9;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922198;
	bh=+/eM0ie1fpSs0MEZ2nMXLlQ2it2BqaQSx7FYZNcUYkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dNreNuQZowTFIxrIA7QXlqhutbsvP/VnHozl2aWnanVXx/qCFF2wcBbkW+1Oev+MI
	 YFrnDIQddNgDOOAkbkoX45/drC6mEJCsaZtYC0eaDk/cwhsGQ5bs3AC05Vq7NSU4kg
	 wAgOBSiL5CKUIuvkN7eD8NNWjYTlWczhNhxZsDWtedv+Z/3+1BmlDPEsYXMOGJPW0v
	 RQTpSYlttp9U2N7p6w+fOkeHKxPtls50gxZvpW8ddm/99QsTAJasHLdjiIPfsKgsbl
	 Y79AjwNmvGkDDpcalUThsVueoKAcrxrk+T8ozklvzWxq3D0hb+cD4gxOa9xZOjzkHi
	 qy3cUm3opH6Kw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3A03F4A9A0;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Tue, 17 Nov 2026 13:28:09 +0000
Subject: [PATCH 2/2] soc: mediatek: pwrap: Add support for MT8163
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
Message-Id: <20261117-mt8163-pwrap-support-v1-2-b00fa10035a5@protonmail.ch>
References: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
In-Reply-To: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794922196; l=2470;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=KQUjaX3+qHhIzKElI39Z3bS/gua1IXmfn76JotbTuig=;
 b=gm0V6u3IzWo4u7S4ZP1d/kO5qqkgUlZOnWou9QMh46QFPLBd6oF5sDCTHVSXZhgnmh4o73IfV
 qWpXBUHM1S4DsdpRnkJt5cMMprrUXigxd4o38mkZ4aD/cqxKqTXzmJu
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch
Content-Transfer-Encoding: 7bit

From: Ben Grisdale <bengris32@protonmail.ch>

Add support for the PMIC wrapper on the MediaTek MT8163 SoC.

The register layout is identical to MT8516, so re-use its array.

Additionally, as all known MT8163 devices use the MT6323 PMIC,
re-use the reg clock init from MT2701.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 90677187c3b5..e4aa42614113 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1321,6 +1321,7 @@ enum pwrap_type {
 	PWRAP_MT6873,
 	PWRAP_MT7622,
 	PWRAP_MT8135,
+	PWRAP_MT8163,
 	PWRAP_MT8173,
 	PWRAP_MT8183,
 	PWRAP_MT8186,
@@ -1843,6 +1844,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT6779:
 	case PWRAP_MT6795:
 	case PWRAP_MT6797:
+	case PWRAP_MT8163:
 	case PWRAP_MT8173:
 	case PWRAP_MT8186:
 	case PWRAP_MT8365:
@@ -2063,6 +2065,8 @@ static int pwrap_init(struct pmic_wrapper *wrp)
 	switch (wrp->master->type) {
 	case PWRAP_MT6795:
 		fallthrough;
+	case PWRAP_MT8163:
+		fallthrough;
 	case PWRAP_MT8173:
 		/* Enable DCM */
 		pwrap_writel(wrp, 3, PWRAP_DCM_EN);
@@ -2367,6 +2371,18 @@ static const struct pmic_wrapper_type pwrap_mt8135 = {
 	.init_soc_specific = pwrap_mt8135_init_soc_specific,
 };
 
+static const struct pmic_wrapper_type pwrap_mt8163 = {
+	.regs = mt8516_regs,
+	.type = PWRAP_MT8163,
+	.arb_en_all = 0xff,
+	.int_en_all = ~(u32)(BIT(31) | BIT(2)),
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
+	.init_reg_clock = pwrap_mt2701_init_reg_clock,
+};
+
 static const struct pmic_wrapper_type pwrap_mt8173 = {
 	.regs = mt8173_regs,
 	.type = PWRAP_MT8173,
@@ -2453,6 +2469,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
 	{ .compatible = "mediatek,mt7622-pwrap", .data = &pwrap_mt7622 },
 	{ .compatible = "mediatek,mt8135-pwrap", .data = &pwrap_mt8135 },
+	{ .compatible = "mediatek,mt8163-pwrap", .data = &pwrap_mt8163 },
 	{ .compatible = "mediatek,mt8173-pwrap", .data = &pwrap_mt8173 },
 	{ .compatible = "mediatek,mt8183-pwrap", .data = &pwrap_mt8183 },
 	{ .compatible = "mediatek,mt8186-pwrap", .data = &pwrap_mt8186 },

-- 
2.56.0


