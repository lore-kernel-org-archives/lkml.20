Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634867;
	b=O9/YsY6syTLXs28KewAeSiFEChSnJRl9wTr6TSZQZqKg8mmr/IzdB4z2rEYUnqTqW0qz
	 b+3eT0Mc76gk4k0IPkYgGvcS+HXRxcB/c+XLUbp5tl1ABkC/hjfqChlj3SZYPbpsx4WR0
	 hjvVb50WQVhJivfDgHt01lfupF8lMUYfzstsvN6gzYiy99HgJowteedkC2+K1IKICH2ib
	 I1Z5rjI/SX3ty4zQz4Kjbj75Zp7bljdpBJH89r1+tZWZPZ3zTHMeDFU7TtJdtGKtSWzGy
	 eKpUVo+RLtQbMVuj45saalSWprJiW3tQYyrHpQbHTKQupU1pLayPKupXXyc5bM3TCWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=s6I4cHkq0fuuN6rf65WlcWbhxrb9QhcwY/p8gIVUaoE=;
	b=4ErTmjWvZqfcSVG8dFmozZh1/jth7UI0OioGHIoRbzXFaSuf4h4RjvSMpO/aPy4EayXL
	 INPlwbwQEEbVFvz/RrMd4KJn+yOUKZzdm/0LmroqdLnibYsQtTJLrU+HeeMyLesXCBDaf
	 ng6LV+KKLtCjq2v1cUcaUHEk3QtbdXJU4zNMI+tc6pw0hf5wDVi2m9qZrHPQBit6fLUU8
	 Qt9cm1WJ5oCjJ8OTz29k9A30edBoCc7lTj4MNQskQlJdPi+cKb1YzPDcaJ1AaORZ3i5Vs
	 5O04WKiVXOY2mHcF6NieHYIFCHWL1Q84t4c1AKZb2BC1k73bhOsH0QUsdT41XP1NXqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KqstKD7R;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1DC607B429
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1DC607B429
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KqstKD7R
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so34094135e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793634865; x=1794239665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6I4cHkq0fuuN6rf65WlcWbhxrb9QhcwY/p8gIVUaoE=;
        b=KqstKD7Rh1xVpfPpdL423pgej0gzHJ0Ql8p5u/qo5C3NvF+bibqSkoCR6AJtYQofnO
         C8yYlSbDje/6N0ibi5tSvCYvjSE22ex4sgeBIj/F0iBYzTWXiWKlJE+n/CLO14ulesmy
         /9EZ2oau1EIHZ190tj/XUMovbxxW2Qcst5JXN/oCxz5EjmSMvggRVRS/lIZ+G/zfNCIq
         M8U82JCDv6c7akDTVkfJmtVsJGXH5dnWRsqkSmX3U++why+Q629qhoteqPMFDk6m/8f6
         jvQyQqcsDPidMxGjGzWNtIuhUupckEY9HEt1Jl+z7T0pZy5Qyo5IixvokrpN93deo7hQ
         vofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634865; x=1794239665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6I4cHkq0fuuN6rf65WlcWbhxrb9QhcwY/p8gIVUaoE=;
        b=mQM+NoJoFF3jVHLapcXvywCTwImRgAuOjwcHJS+Yl8V9pErwQ2nm3qGJMWNz4HdqKT
         iHoaRZnBHZKS0Wkoc2CtbMJVynFxqDjWqiOEIlkO3SA+GlpC3RX+Mf/ncynazUuhqTF4
         QoYyOEtChztiRo8oyEvyAflxWBiPYleR7pvursk10F5x/e5DVv+TypdwgIb660wDBgTe
         +Cwq1wlodH8jyWw0/azoT3H6bJUvOZiUT0++FF2vA0w7pQchuiizgiQUMoK3J6sb+uv4
         Uw6pli1gB/5mVpXKtIUoJVqC0KmtZgjYRIR+oqZNRIfIVNU5UoJPWSQcp94vRZqsX/cb
         T0Ww==
X-Gm-Message-State: AFq9FYLnWwdsIv5/kh1cob+yAbcS0Ls51Urd+64GHlpJ5CQkWTdpRZHn
	GVhClxMnh5Hoh1IJyD0onUUvoCfWMqcEvigtfNsJwDTb0viUlmWMPPg8ZKN7fp0lxfA=
X-Gm-Gg: AYBFou3FVyMmJhrAqEkoZpoFsAUZagIrpZNpRtv/lGQA9LV88m9XIYvt5GNLOjA+G0v
	1jCHremZulZQoUuVlUGmCnO3KUOL6VSvNXXvp37ZOgwfYN8EIajFMFYCgf7gkfbCU/ChQi8uIhE
	Dr3Ffy789KL5TMozNZmPkGc0UI9RagCV6txzVuXYgwR5cTJlZcg/5RMvhe0u8xkPPurSKSRB+O4
	OZrWmnBz1MmkfzmXsfSkZHXMzgHRYb6HbQuy2U6oELt+veepHablAWgXPZrQIgNHz+UyjyIUuLF
	stEKVXUIBbPVjFne34WaV7/kQU/+rpp1SFNd+6vbdAJuNdOf329FbZxzzd+Q8SCtPgHo9Hn0pUg
	oQcHsmszfERl/puXwwa9wOa4g+Oc4344kOBDGePUc/f4qNohDrVzFE1IqPqXqTFqOSU7uo9cXwr
	SxzQAhFjXDBY7BCp6tb7UsBaKckVdFjAtGp8fNyV6KujCUoeg4RoruCjaMXRKwU7e2kTsAleAv3
	Pip1vyxTDUAkc4/DqybWaZi2qyXOS2xUZw9OvPHZOkELfuGfmMcbEIpzQsHj771krv1k8ksehCF
	koMX94kT3Lr9TSyFH5v6MFgCtFcaPR1U7XavtoJ68v/I78g36iLaE4nx
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr245616975e9.23.1793634864747;
        Mon, 02 Nov 2026 07:54:24 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm21229288f8f.51.2026.11.02.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:24 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 02 Nov 2026 15:54:18 +0000
Subject: [PATCH 2/2] regulator: mt6363: Fix VEMC voltage selection
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rgp-67-mt6363-regulator-fixes-v1-2-420789a3113e@baylibre.com>
References: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
In-Reply-To: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

VEMC encodes its voltage as a range and a trim value. The custom
getter looks up the range with

	if (rdesc->linear_range_selectors_bitfield[range] != calsel)

so it stops at the first non-matching range and the reported voltage is
wrong for every range setting. With hardware trap 1, the custom getter
and setter apply MT6363_RG_VEMC_VOSEL_1_MASK, the trap 1 range field,
to the trap 0 trim register and keep the trap 0 range field. Voltage
changes are then not applied and the reported voltage does not reflect
the trap 1 settings.

Apart from the trap handling, both callbacks reimplement the regulator
core pickable regmap helpers, which work for VEMC once the descriptor
holds the range field and trim register of the hardware trap. Select
that field and register at probe and use the helpers instead of
fixing the copies. Keep the setter as a wrapper for the TMA unlock
and relock around the write, which the helper does not do. A trap
value other than 0 or 1, or a failed trap read, now fails the probe
instead of the VEMC voltage get and set.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/regulator/mt6363-regulator.c       | 120 ++++++++---------------------
 include/linux/regulator/mt6363-regulator.h |   1 +
 2 files changed, 33 insertions(+), 88 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index ac79ad6698bf..27d12baa9f2f 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -4,7 +4,6 @@
 // Copyright (c) 2025 Collabora Ltd
 //                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
-#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/err.h>
@@ -484,30 +483,7 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 {
 	const __le16 tma_unlock_key = cpu_to_le16(MT6363_TMA_UNLOCK_VALUE);
 	const __le16 tma_lock_key = cpu_to_le16(0);
-	const struct regulator_desc *rdesc = rdev->desc;
-	struct regmap *regmap = rdev->regmap;
-	unsigned int range, val;
-	int i, ret;
-	u16 mask;
-
-	for (i = 0; i < rdesc->n_linear_ranges; i++) {
-		const struct linear_range *r = &rdesc->linear_ranges[i];
-		unsigned int voltages_in_range = linear_range_values_in_range(r);
-
-		if (sel < voltages_in_range)
-			break;
-		sel -= voltages_in_range;
-	}
-
-	if (i == rdesc->n_linear_ranges)
-		return -EINVAL;
-
-	ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &val);
-	if (ret)
-		return ret;
-
-	if (val > 1)
-		return -EINVAL;
+	int ret;
 
 	/* Unlock TMA for writing */
 	ret = regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
@@ -515,30 +491,8 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	if (ret)
 		return ret;
 
-	/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
-	if (val == 1) {
-		mask = MT6363_RG_VEMC_VOSEL_1_MASK;
-		sel = FIELD_PREP(MT6363_RG_VEMC_VOSEL_1_MASK, sel);
-	} else {
-		mask = rdesc->vsel_mask;
-	}
-
-	sel <<= ffs(rdesc->vsel_mask) - 1;
-	sel += rdesc->linear_ranges[i].min_sel;
-
-	range = rdesc->linear_range_selectors_bitfield[i];
-	range <<= ffs(rdesc->vsel_range_mask) - 1;
-
-	/* Write to the vreg calibration register for voltage finetuning */
-	ret = regmap_update_bits(regmap, rdesc->vsel_range_reg,
-				 rdesc->vsel_range_mask, range);
-	if (ret)
-		goto lock_tma;
-
-	/* Function must return the result of this write operation */
-	ret = regmap_update_bits(regmap, rdesc->vsel_reg, mask, sel);
+	ret = regulator_set_voltage_sel_pickable_regmap(rdev, sel);
 
-lock_tma:
 	/* Unconditionally re-lock TMA */
 	regmap_bulk_write(rdev->regmap, MT6363_TOP_TMA_KEY_L,
 			  &tma_lock_key, sizeof(tma_lock_key));
@@ -546,45 +500,6 @@ static int mt6363_vemc_set_voltage_sel(struct regulator_dev *rdev, unsigned int
 	return ret;
 }
 
-static int mt6363_vemc_get_voltage_sel(struct regulator_dev *rdev)
-{
-	const struct regulator_desc *rdesc = rdev->desc;
-	unsigned int vosel, trap, calsel;
-	int vcal, vsel, range, ret;
-
-	ret = regmap_read(rdev->regmap, rdesc->vsel_reg, &vosel);
-	if (ret)
-		return ret;
-
-	ret = regmap_read(rdev->regmap, rdesc->vsel_range_reg, &calsel);
-	if (ret)
-		return ret;
-
-	calsel &= rdesc->vsel_range_mask;
-	for (range = 0; range < rdesc->n_linear_ranges; range++)
-		if (rdesc->linear_range_selectors_bitfield[range] != calsel)
-			break;
-
-	if (range == rdesc->n_linear_ranges)
-		return -EINVAL;
-
-	ret = regmap_read(rdev->regmap, MT6363_TOP_TRAP, &trap);
-	if (ret)
-		return ret;
-
-	/* If HW trapping value is 1, use VEMC_VOSEL_1 instead of VEMC_VOSEL_0 */
-	if (trap > 1)
-		return -EINVAL;
-	else if (trap == 1)
-		vsel = FIELD_GET(MT6363_RG_VEMC_VOSEL_1_MASK, vosel);
-	else
-		vsel = vosel & rdesc->vsel_mask;
-
-	vcal = linear_range_values_in_range_array(rdesc->linear_ranges, range);
-
-	return vsel + vcal;
-}
-
 static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
 {
 	struct regmap *regmap = rdev->regmap;
@@ -697,7 +612,7 @@ static const struct regulator_ops mt6363_ldo_vemc_ops = {
 	.list_voltage = regulator_list_voltage_pickable_linear_range,
 	.map_voltage = regulator_map_voltage_pickable_linear_range,
 	.set_voltage_sel = mt6363_vemc_set_voltage_sel,
-	.get_voltage_sel = mt6363_vemc_get_voltage_sel,
+	.get_voltage_sel = regulator_get_voltage_sel_pickable_regmap,
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -794,6 +709,30 @@ static int mt6363_backup_op_setting(struct regmap *map, struct mt6363_regulator_
 	return 0;
 }
 
+static int mt6363_vemc_select_bank(struct regmap *map, struct regulator_desc *desc)
+{
+	unsigned int trap;
+	int ret;
+
+	ret = regmap_read(map, MT6363_TOP_TRAP, &trap);
+	if (ret)
+		return ret;
+
+	/* The hardware trap value selects which VEMC voltage controls are used */
+	switch (trap) {
+	case 0:
+		desc->vsel_reg = MT6363_RG_VEMC_VOCAL_ADDR;
+		desc->vsel_range_mask = MT6363_RG_VEMC_VOSEL_MASK;
+		return 0;
+	case 1:
+		desc->vsel_reg = MT6363_RG_VEMC_VOCAL_1_ADDR;
+		desc->vsel_range_mask = MT6363_RG_VEMC_VOSEL_1_MASK;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static void mt6363_irq_remove(void *data)
 {
 	int *virq = data;
@@ -878,6 +817,11 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	 */
 	regmap_read(config.regmap, MT6363_TOP_TRAP, &val);
 
+	ret = mt6363_vemc_select_bank(config.regmap,
+				      &mt6363_regulators[MT6363_ID_VEMC].desc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to select VEMC bank\n");
+
 	interrupt_parent = of_irq_find_parent(dev->of_node);
 	if (!interrupt_parent)
 		return dev_err_probe(dev, -EINVAL, "Cannot find IRQ parent\n");
diff --git a/include/linux/regulator/mt6363-regulator.h b/include/linux/regulator/mt6363-regulator.h
index 60761f01d3ad..e0d2c01827a7 100644
--- a/include/linux/regulator/mt6363-regulator.h
+++ b/include/linux/regulator/mt6363-regulator.h
@@ -138,6 +138,7 @@
 #define MT6363_RG_LDO_VSRAM_APU_VOSEL_ADDR	0x1b17
 #define MT6363_RG_LDO_VSRAM_APU_VOSEL_MASK	GENMASK(6, 0)
 #define MT6363_RG_VEMC_VOCAL_ADDR		0x1b1b
+#define MT6363_RG_VEMC_VOCAL_1_ADDR		0x1b1c
 #define MT6363_RG_VEMC_VOCAL_MASK		GENMASK(3, 0)
 #define MT6363_RG_LDO_VCN15_ADDR		0x1b57
 #define MT6363_RG_LDO_VCN15_EN_BIT		0

-- 
2.43.0

