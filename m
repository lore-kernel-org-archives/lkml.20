Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8F54A7E1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704679; cv=none; b=L8RiWaVWu5DHy+Ohy+DZg+SGQ78zDxEV87egf1vRucgC8Le6v/AauLH8Lqkv07oTSj4VXPyqYxFuiTUVvSMifEUZArt8+nXGyq73GBc0+0SR7wz8sL/I5jckdX4Xq5vuI4Fl8Ca9WRYEM1Z3/PcdHpAr7u4MTRNdzXiXhip0SOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704679; c=relaxed/simple;
	bh=AhPKeNImrvlq1anzVY2fNb8qUrxOu5aYYSTJF3bI2YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iSLg/maOp41xzp2tMdNM+MrFKIp4cBPZ/tum4a6sbfeAiodx1mtWxbLdNB59QvxlZRk3XwnuLEEizSrBJQTzuIudPayYxI9f6uims+ytWHwxU900kePDdQCUncjYSabMQxUkM9gUT/7eGP5BHw3Gjg/MnV/m0bG7Ptf2gWO0PFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpgHumZL; arc=none smtp.client-ip=74.125.231.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpgHumZL"
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-81a7ff792f6so1554306a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790704676; x=1791309476; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Q5DALqLK2poFGKjmNG6XI2SLB5UCPlonreW219u7mo=;
        b=HpgHumZLfoBwRxHf2nOf9XmhjcbkP24UCawGHiGk9iQghu8rK+1IYj/KoBmRMXWduE
         Mnd5G+8jtHxpOVv/lj2HK5Ee5Jat6Isqrbn1cn/k0y3+TMOIzDcsgocbn0jfR0S2TGee
         AmFN3DHqcMRCWz1QzmA835im49+xSgAGyFohfAaM9MJj461DQAjDceJAOWC1jyv1DZEJ
         QKNcmuAOFrijbkRLLq51jaf+spkDVlDllvjp3OOZyVN9eDxstrcUrFiaT2qAxA0uifxf
         VBM0ciIYTdilW82bEgM7ENLmlHAuW77/bH1wVEXlCPGNUym5vDoX8c+1nNKemua4PJLf
         CYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704676; x=1791309476;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Q5DALqLK2poFGKjmNG6XI2SLB5UCPlonreW219u7mo=;
        b=QL5DW8tPZfmGVngWFjnOK4LJN0pbNsNfyOeOnEt3TJirLnPWyJcwtvfWAorQTtEr9L
         72CDIvYG5WMQhCUG8Mpk2f9DnfOyMZVna0AMB+4632FmM9qWm1V0NWX4Ht3pOOpZzbXF
         ceMnGkTmNNE/gjlHTtL7J4apWXvuDf0oPmGm774xEFOKezOBsqzjl+3OzJ3x8ciM0BOK
         BPxrTEQkj5Pf7ZDgV6JT1+Fx2opUN8eojBtanuKHvc3fG4eQVqcAtvTTxjZEAdQAUfOX
         fB6psGmUmAo0ApDvqoXjOXYrXCwr+p57sMOJ/CZwUzuGgy+71YqgXyGiFIQ/gukLfUlD
         Y6Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwe0Sbx23NBHTAOn+d33ivfHg+s+KdckVR2u2NVnQnUaKMbotETv2DdHASmmkNdTrs1KAj8vzLmut7x7zg=@vger.kernel.org
X-Gm-Message-State: AFuF++k7m1DxCVqv6ITG3F6IwdLZh1a5fZ2kaTyHMArlBAWS+65cbnwH
	xETltBcOujf3wQoEmJah0KvxYNv7G16AWd1PHhx1ZvReRU9FBjbm7gJd
X-Gm-Gg: AYBFou3/tDHwSI+opbSX9WstBBFrTnIKSsZif63/1oNS1KES57SUy7LtsSOM4Z10UZI
	LJ38zKn4kioYyk0g/Riln+dAEgYxDNDFzbVGZHt46jFmnwZPPZEovc2rMICN2ZOO1/jdj/Arla2
	+Tq5tc8d+dlFKFz78ihim8vPAee8UTdSgUMyMT6ptEKJu9zVA/+638OEliu3wY0OQXtQHaN/GDZ
	Qf/maQ260mkxTCgiAjRqYdM5Cvc3MjYGigUUU1zxP+kJJOfIoVR7+nqoCYDWXi8y/PINIT1Hvxv
	XGWOvrN9zcni2RQ545h0LzGebqdj+opocm0Og412s/JfBpnwqKAy6B1eNIt6TioJ74QtgtCNJQe
	72ax3MthTBL+/H93CDeZdYiWpqMNDEGCQT/WLWyNonO3Vcu1ZVnqwUwbX9ba7f1QKAoRn0+obT3
	VPGu8XKJxQhU6YN1z2+/yMKBpoSGFU0NDIqjI1AfQ4q9RZ3hni4WlvmXsbShFswSdqtA==
X-Received: by 2002:a05:6830:6f8b:b0:81c:ad41:f9a8 with SMTP id 46e09a7af769-81fd8d7e013mr96882a34.25.1790704675863;
        Tue, 29 Sep 2026 10:57:55 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81faf7eedd6sm691407a34.17.2026.09.29.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:57:55 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 29 Sep 2026 12:57:51 -0500
Subject: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBA0auQWTsJNBaCVzEuCgx1oq3NTKtGw
 t1tWL7N/xsoCZPCpdlA6M3Kr1jRnRqY7y56Ql6qwbSmb0djUSYphFrohyVpFnKBo8eQH5g4zlm
 eKO6DQj64hJ09L70xdhqHAWozCa38PX7X277/AZvetit/AAAA
X-Change-ID: 20260925-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-154d6225b977
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yingjoe Chen <yingjoe.chen@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790704674; l=5335;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=AhPKeNImrvlq1anzVY2fNb8qUrxOu5aYYSTJF3bI2YQ=;
 b=yQ5tCTTuq8nTIonA2166WPdB0ch3FpnbY3HeqZaxd1jIKsCOG9Ko0jSYkM8b1C/Fa3Ehnt1cj
 hLTiIbbRx6fCXdVy1YJTPmVo+15nwP4U/aNM9eWC7H3yhRtWEe8kDnL
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The EINT irq_chip emulates both-edge interrupts by reading the pin's
level through mtk_gpio_get() and the pinctrl regmap. It does so from its
unmask and set_type callbacks, under the raw irq_desc lock, and from the
chained handler, in hard interrupt context. The regmap comes from syscon
and locks with a spinlock_t, which may sleep on PREEMPT_RT. With
CONFIG_PROVE_LOCKING, the first request of a both-edge EINT prints
"[ BUG: Invalid wait context ]" and turns lockdep off for the rest of
the boot.

Create the regmap for the "mediatek,pctl-regmap" nodes here instead,
with use_raw_spinlock set, and register it with syscon so that other
users of a node, such as the ethernet on MT2701 and MT7623, share its
lock. If the node already has a syscon regmap, keep using it. Select
REGMAP_MMIO, which the driver now uses directly.

Fixes: 3221f40b7631 ("pinctrl: mediatek: emulate GPIO interrupt on both-edges")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found on the Amazon Fire HD 10 (2017), an MT8173 tablet that is not
upstream yet, where usb_extcon_probe() requests the USB ID pin's
both-edge EINT. With this patch lockdep stays on through boot, CPU
hotplug, suspend to RAM, and lid open/close edges on the hall sensor's
both-edge EINT. Only MT8173 was tested. Nothing else uses the node
there, so the -EEXIST fallback was not exercised.

checkpatch warns that the regmap_config should be const. It is copied
per node to set name and max_register, as syscon does.
---
 drivers/pinctrl/mediatek/Kconfig              |  1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 59 ++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 30ef3dc5dfb1..764256901d6a 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -17,6 +17,7 @@ config PINCTRL_MTK
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select EINT_MTK
+	select REGMAP_MMIO
 
 config PINCTRL_MTK_V2
 	tristate
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 1a977acd6883..65b1e3096183 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -9,6 +9,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
@@ -1057,6 +1058,60 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	return mtk_eint_do_init(pctl->eint, NULL);
 }
 
+static const struct regmap_config mtk_pctrl_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.use_raw_spinlock = true,
+};
+
+/*
+ * The EINT irq_chip reads a pin's level through this regmap from callbacks
+ * that run under the raw irq_desc lock, so the regmap has to use a raw
+ * spinlock too, which syscon's own does not. Register one with syscon for the
+ * node instead, so that any other user of the node shares its lock.
+ */
+static struct regmap *mtk_pctrl_syscon_regmap(struct device_node *np)
+{
+	struct regmap_config config = mtk_pctrl_regmap_config;
+	struct regmap *regmap;
+	struct resource res;
+	void __iomem *base;
+	int ret;
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret)
+		return ERR_PTR(ret);
+
+	base = ioremap(res.start, resource_size(&res));
+	if (!base)
+		return ERR_PTR(-ENOMEM);
+
+	config.name = kasprintf(GFP_KERNEL, "%pOFn@%pa", np, &res.start);
+	if (!config.name) {
+		iounmap(base);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config.max_register = resource_size(&res) - config.reg_stride;
+	regmap = regmap_init_mmio(NULL, base, &config);
+	kfree(config.name);
+	if (IS_ERR(regmap)) {
+		iounmap(base);
+		return regmap;
+	}
+
+	ret = of_syscon_register_regmap(np, regmap);
+	if (ret) {
+		regmap_exit(regmap);
+		iounmap(base);
+		/* An earlier probe, or another user of the node, got there first. */
+		return ret == -EEXIST ? syscon_node_to_regmap(np) : ERR_PTR(ret);
+	}
+
+	return regmap;
+}
+
 /* This is used as a common probe function */
 int mtk_pctrl_init(struct platform_device *pdev,
 		const struct mtk_pinctrl_devdata *data,
@@ -1076,7 +1131,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
 	if (node) {
-		pctl->regmap1 = syscon_node_to_regmap(node);
+		pctl->regmap1 = mtk_pctrl_syscon_regmap(node);
 		of_node_put(node);
 		if (IS_ERR(pctl->regmap1))
 			return PTR_ERR(pctl->regmap1);
@@ -1089,7 +1144,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	/* Only 8135 has two base addr, other SoCs have only one. */
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 1);
 	if (node) {
-		pctl->regmap2 = syscon_node_to_regmap(node);
+		pctl->regmap2 = mtk_pctrl_syscon_regmap(node);
 		of_node_put(node);
 		if (IS_ERR(pctl->regmap2))
 			return PTR_ERR(pctl->regmap2);

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260925-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-154d6225b977

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

