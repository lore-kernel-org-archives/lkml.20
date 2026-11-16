Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854804;
	b=319AalM9Trob/Xx5jBKL1NTBvGkH7WlJih4z+VU1QJB92I6YsselIwyN+uz/L8COWZxe
	 CntD8YpnY/M9ZUF5+GpLTPq04lR4Vl2hLtpgNA80s+6b0NjwiOaDWzJL4VOgO4L+8sJuJ
	 quPaz39yaY7bOGHrddloQwngfKYtJYx/Y2nvPdZ22FlBzVf3+GrNcs9+0Fiy3hzg07EuM
	 5sjwfiY8ARKiYXAXbrZniv2TKbQ41j8npPijCnvwrsqfpwsVf1/PjyKWGQ52oF+Cm8QiF
	 8Mku6AHHUbw8dbG2tKtXfsjL8o7lwsVOvWpNNNCDPQF6+M73NgjV5l5AEg/n0DF8B+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
	b=1/2hWxkPNF2jaTVfl2Z1pimvUi21/QrKD42ptlDliygSFWLvtW7MkMPm2pc2OdwMO5fJ
	 rT+Qvu+Mbuigyxv5sLgT8L1dmMOXloV8dX+A0411Gvcg277Y960zqxY7StqpzeBBd7cN4
	 5iHCWx9v9DjIBMK9oHoNEhVPX+CE8+dpEkfhYp4x0h/0YBzQxzmSw5mw8SdoRBkC7kl4F
	 2tlyw4viMaxmIEXfd/XS1MY+7NK8cFrRmEVRyopqmm2sR5PnOf3ITBOmfyVT5rKhdQNYp
	 1HZRMTpqEsgelSHPOY1kIDUKMwb5hEwO0mqhZpK+Vv5tp7+6FSPW9Yy4PRhS6/lwS7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSiQx4S3;
	arc=none smtp.remote-ip=74.125.231.75
Received: from mail-oa2-f11.google.com (mail-oa2-f11.google.com [74.125.231.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67C606A88B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D67C606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lSiQx4S3
Received: by mail-oa2-f11.google.com with SMTP id 586e51a60fabf-4a77fe1bc0bso1354216fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854803; x=1795459603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=lSiQx4S3Xo9G/OM+t4saP8wp4415tQJEz+Wfn3TbxnoXXxpJxsHJkv8On5xYqoadZ0
         Hggria6KMnIzhATUsM2DWE88zVbX2twjyN4wWSbpO738qoPpb4UW2K1SH/3Q+3tYit70
         rJ39CRP7zu/7PTBX3J+Y/SD66bCjHFTkLSBUjhIh9R5kG4mCFC4BiwnrnW+VoMNN8f6c
         FmPFMFm6Cc9GzyRlvERTperbKv5QtzAescXvz0RNKF7HqBGt29y89LGB6r34zmyCvstY
         cUt7OyRB/C3ggMxavuAF0udge2NJwDJkmBR2yAnqHGvwnMdkAtbi5FArr6bpi1M3X1lQ
         SF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854803; x=1795459603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AVctQ+aR6nnVUb3bzlRRJ+51PbpL8MX28yvtpVethA=;
        b=wJHNY8ReP9nqFpFgOYuXDhq4fcYorhtioqCY+UOpKlQVd95zEnnAiuDwZ9lnZqs4nP
         S/iFF+5WMuGl5VCrGNax7aQIbaHcbqFJUjfC2W3GiCTTdwLkr6A0WWsj5DUo7OWrbS0h
         fP5Ie5/LupgSX1IQeugjzvYCkMZ19saQpEdcdNHeezy/6Rgwr698qasWq9spchW2/gac
         qTc3hn5ZHPY9izuFBPzW6rS2n3K/fE77B6QXP1ZQWlepSXZzRdR9Bm6DjJ51BkebEqBE
         zjD8j8fWq1KQBjoRUibYw0a+vx5LFuCEdXJZ6pgojl5FoHVBd1L0SzH4CkErX1zbOFNo
         G/5w==
X-Forwarded-Encrypted: i=1; AL+hErFGhytSxeFRJbn9/6Tf0fqJaZ62Vjt4RhDSZFam0ppUVu8cuNzH9bmNSjkNIsOMBROaneAhJDk4XQ0yINI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hX3I3SHcB6G6F3x6GMkI++A+BjCAwqVnOiwkPEoQzX9EW71ue
	IcCy31KHBgPFrLabYgC1ORJHMap7szNoMPr67nBRaA085tt91obUhuuU
X-Gm-Gg: AYBFou08qY+QNWJ4zXc4t0kIxUfuag19o/qrR8PnsUHZzD/sdwSktGO6fV28T+TEEOR
	WRhnnHjLvxhFdaQd7PSStiAqBrN+DE8ctnAeVRFtgeXR3eLXThV4a+52jC1xh4B8bpNXQ90HtU2
	m2TCUbVDgNVj64EP62HAQRr+JP7LgYA/3H77k68ZPzILx1qK3xzUYMWOZ6+QHradFh+uBsz0ppT
	Be2uCSk5IQQ4oKuvZG3z5I4DRiMjS5L0L9cHa5owCZHwcMxAEqy3qJpP+M4lugU3QJKCOymmH5P
	tpRGhJQ8/kiP1OjCLDqSe1PB5vn5g+rRcRHDYLuDq4Tog4imYJsJ/bMa3HRIOiN8bpmGR9YpejD
	+9a7Xq96x/k+pNDTO5uAzvwvW3EyhxsNKDGi42s+Z48n6jCbMNBDnUcJyMZntaG1yQmx67wPAt8
	AIyAq/eJYYoJVrorqy9+NojEXMxfql1QOE9UL7UVU2MCEw7Nf3cKb6olV7RJKO1mOeQ941hB+W2
	qYKU1SVTFaPvQ6yIyX8z58NmrTQtK30DmI0eaBBted/GIqZfYjFOCqbLCUBGFIpdQPqyxk5ZTbv
	qCVEmd44T+P8VN/TMq1F5U/kIzCAMDaAoMYJOLaDtBHbzz2mPUdyKeJdkDs/Ehlbgc4qqZw/M0H
	1NQ3weMHwOSHU+8OaJDE=
X-Received: by 2002:a05:6870:1794:b0:448:c946:9ae1 with SMTP id 586e51a60fabf-4afdf492de7mr9534453fac.18.1794854803469;
        Mon, 16 Nov 2026 10:46:43 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:34 -0600
Subject: [PATCH v3 2/2] rtc: mt6397: provide the 32 kHz output as a clock
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
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-2-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=4985;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5Ww9Gje6b1XRBnVHPbGKqTnDhZK8UEbEzy3EbOlGhe8=;
 b=0RKmfCD3eY+/9AN9a1rhsVOFhEDM/PpOvKN0oMv1Ca3hnbVA3HFzfLgmOVAArB7TAbJEd394l
 xnjgKaYm14uBsCI5inKdYxKpwUyUOaFw96x0xaydSQa3fLA0llXYaqC
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
 drivers/rtc/rtc-mt6397.c       | 88 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 94 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 5afdb707a5b5..d24f0ccc132c 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -318,6 +319,87 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap,
+				 rtc->addr_base + rtc->data->control_reg,
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
+	u32 control;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->control_reg,
+			&control))
+		return 0;
+
+	return !(control & RTC_CON_F32KOB);
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
+	if (!of_property_present(dev->of_node, "#clock-cells") ||
+	    !rtc->data->control_reg)
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
@@ -381,6 +463,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -417,6 +504,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.write_trigger_reg = RTC_WRTGR_MT6397,
+	.control_reg = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 44d2b2cb1ff7..986b3aaaeb35 100644
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
 	u32                     write_trigger_reg;
+	u32                     control_reg;
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
2.56.0

