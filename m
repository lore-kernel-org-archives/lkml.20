Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638232;
	b=2FIGIY39v/I8vDhlFfO2qDI8i+ZGb+BKURGUnLyLbCj6lEHD7SWucx/jpw4xO8tIU4qT
	 N5p1h1z9sLZ8vum2kA/71ljg5PfU9B3ZbvxG458YBT/6dOAq5CvtCeIbExRmZ/Mgbzwke
	 PuagOB3V9SgwlwWrQ8Ub8jC//EFdR878WSIXsy0NJWZhLSsn3kSJGlDzvB9D23PYNeBdk
	 XO/f3A2Z1C2aN58J3hZsCeue5pdFZrpcluoo7+BBmfMsRP4LWnm+RjlhzJvk2nKdS0KHY
	 J0FX3U6KwQ4frbB9IvcBNNi5sqp1whVVY34n8b1U/5X5VIoYP2q0UR+ALBj9QyQr7Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
	b=KGrBhrOW4dWZr5N55m8kz0xTmn3x9JA2xTrcimm6Df4SuRD1RzrtCDsdWuPh6UyW9WaT
	 mUShSQZOsp//C6lQhpeBq+YdDVqYRZCe6QaMYYm8I7rpikRGO3MA48qVbieczrvGIPquV
	 hB5zSUcvuxIT/ZESQWSCSikcfvh/Yat0cjlP7NB6vDDxEWTRc+DnAtg7ThdAtUxFOfblV
	 M7ZQD8efpHPkuwiYQH24wZdqJ5CY9wDXbG0ZnF6w6q+xTeIW+EHQDPD/HqmtQGorPFVfL
	 liLdFTD7kIo2D5tmifPHq3BEjTXOteFixZE41d/+qFKlKtPjoBjyG1t8TpTIKXTha2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHfQ1jyI;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03866074669
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03866074669
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHfQ1jyI
Received: by mail-oo2-f3.google.com with SMTP id 46e09a7af769-8459f7bc7c0so252494a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638231; x=1794243031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=rHfQ1jyI8vgeZsIJ8/crxP6sQGfOrqxThPsEAA/+kbRZwUIEBpVbtv0fgCcZRIF23D
         jawXtmxCraOCtUMOjgKF2+S9Ww0FRiTIgABHxilJk8/hfn/bzcoHiYI0KZHSPccxiW1I
         1/agQFhLFa1IMgaD9Szej8Q3tnpjCpN8FCN8tOVSKSnxBziMSactzZwu7lizWLGztw7C
         DLip1LNDcM8jd8J2A0nS64qm7jIGRLOTEvSlRagL8a/hh/ywh/oAVXto359VwJJBwv5y
         Ik9/Ifb/YIaU/OECBjMSkLi69Zsj7Tf81u12NAT+xnj0Y+qS/2TsgMNydiWc0Ps5ACLr
         V1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638231; x=1794243031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=Brw7zYGsDBkYITiy6SPHnBvosyIH5Fp3BMTpBi4Si+RiKaTrMPJtK6lPC/f6ey2224
         Cy7UL7KvPd3fnHMvUPFaYPibOJnUTDNIAm14C8YE1bis6x1QKny5B1YcTEwLMrOA1i1t
         N9zgerJ8vBOf8x4nJdtvdmi1HSedU52ZsiKLLpXZ9paDNeNusLvny25ZtsWqCXRfvcH/
         BjcSc1amBVVYsA+BWSOlFX5iuRQFZH2tkE4kvLV4v6ktOv4m6mJ+y8NyAqzf8KksjRxD
         80UeoiDEvUo9gDsEX/GohnqL6myfqZ1djDamSScUam9xNhMpGqUwvUNInYzMIMaaDlQv
         /RGg==
X-Forwarded-Encrypted: i=1; AKwUvByyAHA+kFM2kD92GLpyOW7hBUQrBL+Xx1hydYQMMG1Gyhz2wNMXdbWUVw9xtH9unECZfg1malY1spuaRf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA7EWqkS7tB3B/lFW3CHaZ9KzF8N+QTAYTbBrdaS/JjIdnDTGt
	kFqqMRdoQNpwZ9oYxCR8lCx4tTLbPp9P8fwkgoDVfhlc5hI5Q8tcTYQK
X-Gm-Gg: AYBFou0T5i/Ctt5CYaESBaEvoCdF1o/OhzYeYhmVJ8ZaWPFpW1UDuPCsX3dtE/qz5Yi
	Vok0pWcqL5fpA6tQLbeZWxfOhMnLbc0OJyxOb04+flcrZ6+L3lABPRrdMF/ZJaluE+MptKPXGqS
	ziJxRUB+3O6e41MNxHy4lYby4rRpFOAELvYNHUs0mmXM1lmYaCxn0dOgk2Md6/Sfov/WKVtjB6Z
	oLvgjraaOeFGZooTlcpZ4NIIjuw8u+DatuSRnJObvjxnB1mMqWFKjAJC7IjRsaLP+2CimCoffwr
	Mg0d/QM0xZyBlgiYdriwvTTSHVE9yvH37Nf/nE4mOeNAR/lTwm6KiHKDF792juY6eB5MjyUcGMu
	/YK0y2KXGneyXBq/Z+EKjuhorG0eJj5im702GOXb8AisU9aDzzH87Hgn6jv538NP7BATDIcQrI4
	WcbFsZZNadiLnuEFSsS+XsNlkdfxrvK2tZAPXCQ9y9+zElK7rA7gxTvMLXXByc42j7Hyl0o+sRa
	NgnCpkIb2+/vd8o6Wn80IeKxmGEnhmvHNmQO4c7DbqV7SrCKdiZ9Lk3mfKAiZBC/WVPoP7FRsPw
	V+WuJPyZHxvANwKRsmrYHrb3Vq9GiynDW1FYkuwhn83e3PutBb/0TlhXS7FrLy09g5Sk3pK2dAP
	m6c0dUp/ebd+zoDDrkJQ=
X-Received: by 2002:a05:6830:3481:b0:844:a8bf:7dc7 with SMTP id 46e09a7af769-85d363fc570mr7336192a34.17.1793638230796;
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:22 -0600
Subject: [PATCH v2 2/2] rtc: mt6397: provide the 32 kHz output as a clock
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
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-2-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=4890;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=amIz4+OO8bg9BY0ErwfxlJTjkYD75qjrKdIIoLGCs4c=;
 b=SddfdcmGKWyuqGOE2/GxaWQqOQ1TXoTGs5VUhTToGfp3bnPWl7+Zrz5vLWEeXxPdlsr4dE61r
 fAJ9r7/SePRCBSg2vB3thim3kLRhLfoupjQ/1z8Xsr6XCNPG6w8yuKc
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The RTC's 32 kHz output is gated by RTC_CON.F32KOB, which the vendor
kernel clears before it powers the Wi-Fi/Bluetooth combo chip. Mainline
never touches it, so on a board whose bootloader leaves it set, such a
chip has no sleep clock and does not come up.

Register the output as a clock when the RTC node has #clock-cells, so
the chip's power sequence can enable it.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 85 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 91 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index d6e156516aa6..2849beddc79d 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -317,6 +318,84 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap, rtc->addr_base + rtc->data->con,
+				 RTC_CON_F32KOB, on ? 0 : RTC_CON_F32KOB);
+	if (!ret)
+		ret = mtk_rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
+static int mtk_rtc_clkout_prepare(struct clk_hw *hw)
+{
+	return mtk_rtc_clkout_set(hw, true);
+}
+
+static void mtk_rtc_clkout_unprepare(struct clk_hw *hw)
+{
+	mtk_rtc_clkout_set(hw, false);
+}
+
+static int mtk_rtc_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	u32 con;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->con, &con))
+		return 0;
+
+	return !(con & RTC_CON_F32KOB);
+}
+
+static unsigned long mtk_rtc_clkout_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	return 32768;
+}
+
+static const struct clk_ops mtk_rtc_clkout_ops = {
+	.prepare = mtk_rtc_clkout_prepare,
+	.unprepare = mtk_rtc_clkout_unprepare,
+	.is_prepared = mtk_rtc_clkout_is_prepared,
+	.recalc_rate = mtk_rtc_clkout_recalc_rate,
+};
+
+/* The 32 kHz output the PMIC drives to other chips, such as a combo chip */
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	struct clk_init_data init = {
+		.name = "mt6397-rtc-32k",
+		.ops = &mtk_rtc_clkout_ops,
+	};
+	int ret;
+
+	if (!of_property_present(dev->of_node, "#clock-cells") || !rtc->data->con)
+		return 0;
+
+	rtc->clkout.init = &init;
+
+	ret = devm_clk_hw_register(dev, &rtc->clkout);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &rtc->clkout);
+}
+#else
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	return 0;
+}
+#endif
+
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -380,6 +459,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -416,6 +500,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.wrtgr = RTC_WRTGR_MT6397,
+	.con = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..a8130d726c59 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_MFD_MT6397_RTC_H_
 #define _LINUX_MFD_MT6397_RTC_H_
 
+#include <linux/clk-provider.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
@@ -22,6 +23,9 @@
 #define RTC_WRTGR_MT6397       0x003c
 #define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
 
+#define RTC_CON_MT6397         0x003e
+#define RTC_CON_F32KOB         BIT(5)
+
 #define RTC_IRQ_STA            0x0002
 #define RTC_IRQ_STA_AL         BIT(0)
 #define RTC_IRQ_STA_LP         BIT(3)
@@ -72,6 +76,7 @@
 
 struct mtk_rtc_data {
 	u32                     wrtgr;
+	u32                     con;
 };
 
 struct mt6397_rtc {
@@ -83,6 +88,7 @@ struct mt6397_rtc {
 	int                     irq;
 	u32                     addr_base;
 	const struct mtk_rtc_data *data;
+	struct clk_hw           clkout;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
2.55.0

