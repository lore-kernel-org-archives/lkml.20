Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597640;
	b=ONti8WtB2e6Z/11Lld8wVccU3tHzkuLky78G1zTJ9PfhDtZcREzQ/jP7wMjZOKJkUoAX
	 /v4W3J2BPfM7Ha6dqnLzfVbpvWtazei5PmdGh+G71NZoCx0B0R6+adRZtgoZ9sT3AA23o
	 5Eao796rsSdGOQQ3YC+ermX/Vd2KSabDEwud2P9VrH75+viwETLC8vJZzbxe8MOzEnkX+
	 gDeN+z7thK70zUGxx7I0x4ODiCkeTH0ivN/T4mIGxQhHLS3seFnyeDymLkLzjtNjtkd5C
	 AZ8q3MTnNPFaNndNNpU1i+AfQCVfBNI8nuMlxEiGd6gN8VXWfo7QHQukN3LIQCHeNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=j/iKDdwYCnsubloLpqDmZlwHL6ERoLEJpqDNEy1hOkk=;
	b=aTUa8PN2KY9HQ56g2XHWhbD6FZjIv2HiURZ1CXq3T3Xga1C4RsmXz8i3NJRXe9Ijagyn
	 V5AfXAv7SodTuxHzB6CiQqCsplc0SfFJCGKzq228yhOspHiznpXzMv9bVBTAQeD6q54zt
	 dWyILRMiCLgPm2L+oGbEnvEeon6q0sNA0LMrJ+78N2/CLO55T6TqFvXUR69YJFoyswsB4
	 z/OFOEuHQygiBWIJ1Wb2ktg8eo+QrdASw1nApHwifisc95p6Cq/ezh/xyuynX+5n9PyBK
	 p6BBkfC9tc6/kaTYs5YjoCbuRMoM0bcIdJHk6n8d8nJcFfTeDtv/QQ/MyAoafaKXhnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/9AMy9R";
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645E606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0645E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/9AMy9R
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-824f3901d55so3181793a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 21:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597639; x=1794202439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/iKDdwYCnsubloLpqDmZlwHL6ERoLEJpqDNEy1hOkk=;
        b=U/9AMy9R3HO9CMqxdw8ILkrqQN9WdKD8V4l+rW1MDOuT0q5IRvrMc7EDMvi5OkZ4Cb
         u+od2i2X+TCWB4D1bfUNUgeOJBp+qGOzCdE3IX4sQ8amKTaqL1poBlxapkklf7vaFzID
         p+PtgaHZRGqlNyOP94i1yg/pJIc4WVDNwJYBwcSpp+aXKS0mA5NQmw2mmfoBVIz+uJuN
         X2+9Ou5QJfgDIrL0upNFq4zz/eizYAmzUMqsNL4A2piO8+SWndRcdvDiNzn46cD2ldWN
         ZSiGtqtxHKZrROrXcE6GKK90c1+RYbkGT6zdde4Z7PkwFwQvIsbO8Rgy4r7eaVcLKQe/
         BIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597639; x=1794202439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/iKDdwYCnsubloLpqDmZlwHL6ERoLEJpqDNEy1hOkk=;
        b=jKwn7f3x44RryljrndXlIUvar/Fs0FOk/DokQ+CPE7FiGx8GINFPCMlhbGovtSABXR
         kA4dZrZYT2gJdH+NdK+jqIN8yYZTPFbLM7hzPueqdyoxnwb9ev3Lm/QirBhWnjGGmXt8
         zn/+LN6ywB6SeghXy6fD4x+h/OH1Xxq/0zHZdOBsw+ht3T9GXe4O+zFIY/VfjQgyFPul
         mnz7P2V19Eh5zU76I+9XVeLEl/RGCpuC4TlBb0lKth2qsoV/CZxPK2GA4MI726dJE90e
         Jb4mvNDKL9WPmZjw78tbtquUuXp/hs7D0GbHWL4Uidv3I3dfDaDhZgrXZCi4LdIRDEU7
         dS1w==
X-Forwarded-Encrypted: i=1; AKwUvBz9jef6aTOw2/2AsQJ6OIcO4SeliKdjz4diHaQxo9glEUkyYy2oIWkE+i1MAw1k/xqHw4885mlGqE4DEzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7jN1APe9JGxC1wNBZD7s74nqMBv1xY7Js7eEO/+j1ZSgV2tOb
	ScEysAPQhbRPryfB8uT7FrVqbqqRNf0xeLcBV8ttZtGLHqmhEtpfOFzs
X-Gm-Gg: AYBFou3Hm+jfHOI8+mLX2rN1CdkZ+M0DkgF7A6RA9HJbO0+NdhNBGaDDmZPx4Atokmo
	JofPdI9Pr952N/9Y5UU9uEC6efr7fKFw57hL213pxnzBS9c+/ICrDMTvUJXAUCZF/GrY2O8Cvg5
	JWbttgZR0yvjgJdpZMjbwJjRJykRHCEkClwTT9LlR7ZZBLLjYXDXqI6YqqOFTPxjOu33QLd/DSq
	wfZgfKRhYNn4eOrDnYjftgabRzysKC7+RuTHt8abNk2cPBDPL6y4bNze8gci3de5dOAzfRgabs0
	UClfCgJH96Vx34vJPAaJ4uUuTzSR3q+oZ04f6X1YLSA98uepUN8rG/bUbkFY/Empkkj6SGXeRNc
	ioxaJjzW0lNpbWq7U5RpzeXUMwAzEg8j1T3TuxiJvnxZ1JG0OW9t6U+QUHOiO0I/Wb6pqJGyop7
	JtoJIsF8+LA1FJhPbb0PJHIJleJdsVi1tB88G5gmPwZrHWKNgeIA+uMeKojYG0MJcBzA7AY/D1V
	t6jg3hJOgSqVjNrY3vvBCj5lLi5zW3C94OfUaVDRp9pxyWJ8odbcL52Fe7gD1xDQPRdVjJw3+z9
	80ydukPebuOMa/6h+XqjwSgm
X-Received: by 2002:a05:6820:81e:b0:70a:4053:52dd with SMTP id 006d021491bc7-714f24f9791mr5803420eaf.12.1793597638909;
        Sun, 01 Nov 2026 21:33:58 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:57 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:33:47 -0600
Subject: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
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
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=4890;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=eS8wwphnLf29L4d5m076ho5/o3jTqtIytR9mtme4zMw=;
 b=V5rSbVxU0IF5N7h6PPPyOJQV/wX0G6LmMZa8wVDZQxfdGcr4TIErn1bIGZZU6u4TjA94W77+a
 3p2deiTL6UBBKiXt28snx/azYaVv8C5+hP8+TMfIhI6rsZeP2q+Xt+p
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
index d6e156516aa6..5130fecffa7b 100644
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
+	if (!rtc->data->con || !of_property_present(dev->of_node, "#clock-cells"))
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

