Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F003E2AA1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334794; cv=none; b=qlxs1TAfSFTl5nMOR1SZiJuB6c/36XD79lr3HHonZA5nOFN0gWZWeInWyv+6nIxyMTPo1417x41FOGXfIv5h+SEPYSQTPP0jjYWh5J7JXKk3tQdBVAp0Rh7YMfh7jMqZmSyI8ima1RTtXhmHI+JXBG0d6hMKO8CMdZh0GhlXPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334794; c=relaxed/simple;
	bh=8NnPAtndwCLiyUYQOrEFhczA2QwzvIqCV2M/9HEmlSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKRJobnYXU4Em1C6iNlhGsTA9WL1uCk9b3hYWTefN4oDCL+yr2uef9Bo7UXvN8J+1N12wvtiIP3u69Bgz3popzH5mFrNCpIb13Kg+ROlE5IK+ErmNMYROShpEfQNqjZ3NUxD5gsB7pYz4Y+HnoY+OViHXQ5qA4EKXvTs9GQOFQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGXkcrmu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGXkcrmu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so431205f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334789; x=1788939589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOyHjTCEcoFHo/QaU1ed7RXwDgLdnIb7/0FDfrBc/+k=;
        b=nGXkcrmu39W9Y7vAX2AeSXwpm4o0Ag48yUXrHrBS5lGGvL8aR0vOpcnuIFkzuI2G8z
         MrVzuS5UOACyUq/vHxXRu6H/pN01PTmlWT8RKERkd/L/mNtL1dudpcb/B0dXup7nmwnh
         QtSfkyfrzPmouOsPghuBHCwG5gi2j84YiPky99uhNynOiY62QoPLShWCnMQN2wrQQ92R
         nVhX17NP47CcZauME17LkwcPnqkv+y3xfr4MXzW1Q79SaW5tXAYYsF6hc4ZCI+50j46f
         T7hvSJl/9m8Szdz4uDYE880I2sU5LyixaxSp+ihadKkKvFU3BXi6+7g/nNFfOhKBlpGd
         vHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334789; x=1788939589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOyHjTCEcoFHo/QaU1ed7RXwDgLdnIb7/0FDfrBc/+k=;
        b=gTuLwqWtP/vWdjOvpBc7KSSC+n3l+SiCim2i7yI9p3/YgpZBu8u/dgFoLxNM2uNl/X
         /opdUDpynDGU00Rh6g9YYIAXcNLJpM4P0hxQ6rtRiFThG9cd0hR937fqtmp1wT6rDmOU
         r4X1l2Dr8bExBD6tN0PmiqXF4jjggmOCWPebddTZaJlZV7dibOiutjNWXX1+NJDDcNCF
         nxoki/t52vDJbT5oRnJURmabB6CaU35H5ftiAXp8LInT8g5vXBZRfpn55SCpZddziorH
         35UVfr64hdmBOLDHIn4CSzbK/gifVc/EsZqYFeawyZOOd59V3crttjm3Dzhkp6OapVBT
         mpaw==
X-Forwarded-Encrypted: i=1; AKwUvBzyGdQnVCrct0sO7+LtNlq9fqjMmTt57RdQGhqbVpYXqNgVnk9T310EsmtGYGC/dC2w7RVi3XAbsOq0oCs=@vger.kernel.org
X-Gm-Message-State: AFuF++mV1ayDwraYsSCDaqW02QL8CXXRoml/odxvQ6pQFDijVkLB861T
	SKRgxKx/7SUqO/DueqH1sK/UrZMaXRon0AZFA+EvVr5DgdTLSTesUKbP
X-Gm-Gg: AYBFou1Ev8u5rwILERZZhE1fw8npr8kaUQC2gTHQF37s033U4At9Vz/k2UyQhKk8s6x
	DySkt3HAyg8imOz8emm0RX6gpDOPccwzmfHI843PU1rbwrv0tmgofOC4f3gu8jNBZpBYCfCF8fe
	ykn4EAsbN5IeYABWZUssUN51zQkGvm0wYcCUHZjU8avINP38xrK1JDodifkqF/InnZb8sKnXK9T
	hkbj9g9WWBr/ymK2AGVgWYVjKfH3KtK7la5e//9G3vnFr9w7OMx9HQYS4xEKFP2/S627m+PeEeU
	/eFlP1q2ICi5WO5yplwcD8gyiUZpNCrA2eZKAaywPuGYXxIKmT4OF6P54AQylBSvU9+DAiP/7Et
	C5r4jov7Gqjkxu53tq5RXL8cLlyGUAujWubs10G7Ut5eIFMkw5r48joZol+I080Im8N/mKb0ZB3
	OY3i5BBw38gVN52ZZT5LCdJDoRO7AmypY4VaApAs4YyqIpkFCkRZkzz8vJxd9rjgNsjQ==
X-Received: by 2002:a5d:64c9:0:b0:482:fa3c:3e95 with SMTP id ffacd0b85a97d-48488f07dd0mr4552916f8f.8.1788334789361;
        Wed, 02 Sep 2026 00:39:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:48 -0700 (PDT)
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
Subject: [PATCH v2 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 09:39:45 +0200
Message-ID: <20260902073946.3709080-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902073946.3709080-1-mehmet.fide@gmail.com>
References: <20260902073946.3709080-1-mehmet.fide@gmail.com>
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
next patch) expect. Everything else, including pins the device tree
never configured, gets -ENOTSUPP.

The only in-tree user of the raw register was the debugfs group dump,
which called the callback with an uninitialized config; it now reads
the register through its own helper, like the single pin dump already
did.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - the pin_config_get callback answers only the parameters the SoC
   declares and returns -ENOTSUPP otherwise; the debugfs group dump reads
   the raw register through its own helper instead of calling the
   callback with an uninitialized config (Sashiko)
 - subject prefix pinctrl: imx:
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 54 insertions(+), 3 deletions(-)
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..506ee6627c82 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -21,6 +21,7 @@
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
@@ -291,8 +292,8 @@ struct pinmux_ops imx_pmx_ops = {
 	.set_mux = imx_pmx_set,
 };
 
-static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
-				unsigned long *config)
+static int imx_pinconf_get_raw_mmio(struct pinctrl_dev *pctldev,
+				    unsigned int pin_id, unsigned long *config)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
@@ -312,6 +313,38 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
 	return 0;
 }
 
+static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev,
+				unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int mask;
+	u32 raw;
+
+	/* only the parameters the SoC declares a pad bit for */
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		mask = info->obe_mask;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		mask = info->ibe_mask;
+		break;
+	default:
+		mask = 0;
+		break;
+	}
+
+	if (!mask || pin_reg->conf_reg == -1)
+		return -ENOTSUPP;
+
+	raw = readl(ipctl->base + pin_reg->conf_reg);
+	*config = pinconf_to_config_packed(param, !!(raw & mask));
+
+	return 0;
+}
+
 static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 			   unsigned pin_id, unsigned long *config)
 {
@@ -324,6 +357,18 @@ static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 		return imx_pinconf_get_mmio(pctldev, pin_id, config);
 }
 
+static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
+			       unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+
+	if (info->flags & IMX_USE_SCU)
+		return info->imx_pinconf_get(pctldev, pin_id, config);
+	else
+		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
+}
+
 static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
 				unsigned pin_id, unsigned long *configs,
 				unsigned num_configs)
@@ -426,7 +471,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
 
 		name = pin_get_name(pctldev, pin->pin);
-		ret = imx_pinconf_get(pctldev, pin->pin, &config);
+		ret = imx_pinconf_get_raw(pctldev, pin->pin, &config);
 		if (ret)
 			return;
 		seq_printf(s, "  %s: 0x%lx\n", name, config);
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

