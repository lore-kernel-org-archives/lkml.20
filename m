Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D64717B418
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330238; cv=none; b=bnOyqInyzwYKvk+Y2JMdEVFRonsnNDcwGTcSrkFsYnByNKxQL7iorENcOLa9y1D+gTvrkYy1btaXgwS+tolr227jpfn97h/Ckd2uD2beBjiIUMhnoCFG7rlXWYaOkWYfNo27Ic8N4dLoZr1S1Bbf+OuhF9QZfBmZgkhfp0QzepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330238; c=relaxed/simple;
	bh=9eaEcb6TvEIduA2i2Qs5j+6mpsX5c1wGth55EfwXySQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/49ZovQLVFF5pjOmRhoa/6A+YyPlGB7XOzMjMSzOpIfo3hr7AcaHqZp2mtTDHdOzGdzWsNHqnNu9BVfZjsW1nFR71Cs7yfe7h5V9cCdXGlCOz1jLbimv3Q3HOS65ElFUItj1MtxvZ0cDCzqsGznE+Z4i9B3RWH2/d7lrQq4hC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPhB2Fes; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPhB2Fes"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso3804185e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330235; x=1788935035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLjWeeRx5GwvUZT6jfZGxkrQuiE7XPs8NxQMb0vudxI=;
        b=aPhB2FesAoCZDsVCEQfP9/cb4FeVeHR9q0TMO6sPBScxiytXb9LLV0fAfGw2NVm2cv
         EaYSm5ucUXl7YPs6b4/tS55T0HfrTSEvOvOJUWOiUbfAjsTtgKkwXGt8pceaMRSb8bF6
         orpYw8mLdzrg77oEJMdOx2dHs/JfDSdFcRkcX9FGvtVuMLXq7Kz61cWr4Ip80mcyrd9q
         1I8wOsW3skQsp8CowxG4UL8eXtVdq2UlAWTSgOoYsPZ/D1Q5FuMZEdLuo+vmmcRfWkJS
         ZL35rHSZjXtdPUxpDatYDomqRJE9MhDZJG3ZuIznGocTnz17gKT518PFBovKXfCp98D4
         /Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330235; x=1788935035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLjWeeRx5GwvUZT6jfZGxkrQuiE7XPs8NxQMb0vudxI=;
        b=dnfIF623rBkmp/JUlUAPQ/5VhXA6FPCpBhUZS74nJEma8DZNVCczqdykep8GW4pKVZ
         RzX7Y+k88UTSwuy8PEzX6JfhUKB1ScEZ6uW2aZN8Kz6ab4JzFNmNKoqNG5INe1uIwTI8
         SzW1FUTJTWeXtMJ7XPFMlfj6VP9esN+J+yQUH9cflHcdIz1yFq/cSPJ339snTOFFRnx7
         IuTsoKhUcJsfVRz8B15JveLp/YP2SCp+E95BLPL06Pj4Z3gLmKtHDPguyzDLmEMcsBpa
         Yo+ARF1PjSUl3qUAWxrXTuJZqc9D6wqv/jfSP2mWfRJPcXz8KlFarRsUTwmWPhF7d2Kv
         OEUg==
X-Forwarded-Encrypted: i=1; AHgh+RqB6A6swDUiG/RgBqUFkxQFUPM4mhhNzG35eX1LtjrYIU2x1rW5zHN9/yVS2Kx0RwG5j6vxVv94MR4OMy8=@vger.kernel.org
X-Gm-Message-State: AFuF++klYc/npCVm6XLhH4lS7ifRHqyArbq/kflBXiIV4/IluabdzoBa
	U0ZbkH4Nx80uDDDWE/pW5syJ0kK2xtO4iuF9JJPZS/g87FhLUUBqZ3C1
X-Gm-Gg: AR+sD139uTZ+2fICvW29rRaMSU+FHm5B7udssOwo9OKJWQR1I5HSom+4LMyGuj53HH4
	5EB2k/5/AF0CVYmHvu9DKLj4EQR1FGr9lt3SD1JT/4GvGrtu49/nwMxXsE/a2hcsT+B2GLPPX19
	qC4dLu6Ubvg8s7QnYpIu/imcO1pnDVmIw5NQafmy0HeGsboHQYR1NfFRIDgwY705xFv6+tmLPjd
	8Id0F78Td80pb+f0yFmwU+lMxgFBogsOZK4b9LkaH2yL/4l3BYsLEk5RNPgsvNa0rciJjyVXyzu
	Z6oL+7ujkJTJ3gJq5wI6Cu1jS/kleOt9QHhqpGafKj9qWRyWjHqCJkOSw7cArcHVojaoxMh3fgH
	MtKHZCxUp8Hn/h28tkZbqS/Y1xunM1mx3isCKKyKd9PdWoDJBdVGZkseelnEDsEi09lEc3BYqM3
	6RFPE4niPwaQ3Zq1GOnBp5e8TZmnp0T1gF92HVS2vC4d8mP7DPXwJzMYPMBhaajDv0miw=
X-Received: by 2002:a05:600c:4592:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49ce558ff08mr36761315e9.0.1788330235172;
        Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:54 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 08:23:51 +0200
Message-ID: <20260902062352.3600368-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902062352.3600368-1-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The mmio pinconf get callback ignores which parameter was requested and
returns the raw conf register, so a generic query through
pinctrl_gpio_get_config() gets register bits back instead of the packed
parameter it asked for.

Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
is 0 with the bit value as the argument, which is what the
pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
next patch) expect. Pins the device tree never configured have no
register offset and get -ENOTSUPP, without the error message meant for
configuration attempts. Other parameters keep the historic raw-register
behaviour, which the debugfs dump still relies on.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 30 +++++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 +++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
 3 files changed, 36 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..5da1a76b0141 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -21,6 +21,7 @@
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
@@ -297,6 +298,35 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int mask = 0;
+	u32 raw;
+
+	/*
+	 * Only OUTPUT_ENABLE/INPUT_ENABLE are decoded, and only when the SoC
+	 * declares the bits. Everything else still returns the raw conf
+	 * register, the debugfs dump depends on it.
+	 */
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		mask = info->obe_mask;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		mask = info->ibe_mask;
+		break;
+	default:
+		break;
+	}
+
+	if (mask) {
+		/* pin not configured, nothing to report */
+		if (pin_reg->conf_reg == -1)
+			return -ENOTSUPP;
+
+		raw = readl(ipctl->base + pin_reg->conf_reg);
+		*config = pinconf_to_config_packed(param, !!(raw & mask));
+		return 0;
+	}
 
 	if (pin_reg->conf_reg == -1) {
 		dev_err(ipctl->dev, "Pin(%s) does not support config function\n",
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index f65ff45b4003..8fa7e1e2521d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -91,6 +91,10 @@ struct imx_pinctrl_soc_info {
 	unsigned int mux_mask;
 	u8 mux_shift;
 
+	/* OBE/IBE bits in the conf register, 0 if the pad does not have them */
+	unsigned int obe_mask;
+	unsigned int ibe_mask;
+
 	int (*gpio_set_direction)(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned offset,
diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
index 76a4bc0181a0..77d077618782 100644
--- a/drivers/pinctrl/freescale/pinctrl-vf610.c
+++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
@@ -319,6 +319,8 @@ static const struct imx_pinctrl_soc_info vf610_pinctrl_info = {
 	.gpio_set_direction = vf610_pmx_gpio_set_direction,
 	.mux_mask = 0x700000,
 	.mux_shift = 20,
+	.obe_mask = 0x2,
+	.ibe_mask = 0x1,
 };
 
 static const struct of_device_id vf610_pinctrl_of_match[] = {
-- 
2.54.0

