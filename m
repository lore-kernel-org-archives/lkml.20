Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2631D4E0210
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606361; cv=none; b=Vrsp2rP294bvOJ9mxFaa/tGmn0h795zpPjrDZ4nmOvLMFc5s3JZ41qxMVGauvhoAVIDIfm0jyXjJUARjQRPqRrnKjGkTEwkTiU6FDsR98eKve2may3UBryE0QE4uf9VKUiy0mXvfQQpdU6B20CXV3UH6AhFKLToenWys/RqlZE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606361; c=relaxed/simple;
	bh=ty9FipmxYZQDCPnFgpmnO/iT8e8O7+c6Vj51m+k/yEo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cvayGZvTmsy47TbBCK62Gd0z1im+KTZ+g3J44gQEDO0kZcVBhJ1x8uZxjELmJkpm5Dstp7i/HZcttGSX8VbOmqXv218TCuOknDF+761IlJH4debPQKPhahlDqBKWXUwkSJO06AQBPgrsLr8Z1Z0QR9GCDt4tv761tc7BdgxUKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R8mbHJLQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R8mbHJLQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so10471145e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606344; x=1791211144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIq9o8C6NiP9XlYnGflFHeFN2bvfSHubqssGJibxA2c=;
        b=R8mbHJLQmybCELS3B4JiRTUz50wP1m8m3JRiZ3fBPn0H2ZEcKF6P5XKisgqI3IK7Ce
         1MMnIklJfB3juZM3YAPB1HyYd5bR04viPQuuht2EQDSj3aIAJ1ER6H8ej8fMbeVePlXv
         JvPlYbmCqoPeEvk8xULqMHYlKzH/l4rYmgAPkLz50K5TdJercOmlALCptFkJWlwlbB9x
         K34gp4BwZbg6ZakmXf1ng5kPM3vLNhXQAGI1KkxhWEh2HZbmnRZwx/GbT68RrdHT0I0p
         cRrjdOmw7SKtZSwHpwbc+hDPLgh9I8R/nnz7U8AyJzKDUq8r4/gm7uIfc/zEVIMhAO46
         +Pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606344; x=1791211144;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIq9o8C6NiP9XlYnGflFHeFN2bvfSHubqssGJibxA2c=;
        b=1aNNzbN4IRcJmfTV6WUeuz8ORGHf7MaYEPdv2RsBQXqYb8BWjKjNsUQ6diD/HLm35g
         wU/BHobXXmn3K5lMUBslsPhhrrlXhne/nvJg5giEV/C9cHFe+f6F5pd/V7Ac3QKhhgEG
         sUX4q3WWQeyVjPGhkjwExS5sl5I5fbRb5ivZSJCEqTF2dtS+2deWhwjFBm0aOE+/Si1B
         591mRgd/ClBmThgyEKgWf5oRxl1xYLporf6tWOhyROcQ9eQJ1Td2LIRPNy5r7k5I3EBT
         JDG2lM+Ea5xuQTnkN1avPxBb6tDS4IyN88Lg9IIaAts+Sfc6IniSzqH6qJNOjHqLlzn+
         TjOg==
X-Forwarded-Encrypted: i=1; AKwUvBxcGhwsVHIBrZK0izJZokMyW+6vJkSy/joGd0XmyRJeA5uA1F/nt+oKykKFeeHm1RmpooaR+yUiuncqadY=@vger.kernel.org
X-Gm-Message-State: AFuF++mgtb5kAp73sjWFJRaq6Dxxs0JC8HcTeqDrFcp3xH8rf4GZm1iI
	vZIzn3xWsfnoOcQFRZ2l9QQJUYwk4dYNnnsYtijWBiFf39TDZQk9YUriAoo4ElrWzD8=
X-Gm-Gg: AYBFou3LKMV/KyW0v5pmpXwNzxehfzNtK5RvuBJd6tZ+TRDZUJ3FMZDZmUjwGUUstfJ
	OiOfjJOamlw3gs2cm1Mpvl3OcDgooF4tS02QQhAQBw7K8IkR+Am7vhp0sKCggmQVOaTmT9/pP9y
	dPbqxlW2enN00vKDcGsmwAiI+q8pnIy7Rhf9fVseJbfj3qljI5de4CF45EQtMP4gElwTmXwVuPk
	8F0zo1DItsqGniVXSw6AfJxZQ3KTGLrgLqEdL2Qb6CX/IgtKCnbRzzHO9Tv3bl7OVo1V5g5hr8U
	95WR8uaJ9IS3ZnDppJwLJjMj1d5OKvkObL1+Fe3VUlzohWYJJX2klCWTBWdHx0vv6PB7LlykHVS
	bdNPVaSVZAuExj/sBnelJ6llgeANP2T73AJeCT4wyQ2EPep+IkxoUi1A2kuIKP+17SvWusRG+yc
	vllrqA1w6xM6FbSf3sbO4wre7cUEg70Vt/1eNFPCxgBQIyWrEPA8h5t2RgHqDXnm5jtjoThg==
X-Received: by 2002:a05:600c:314a:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-49fe66c86bcmr249130795e9.6.1790606343534;
        Mon, 28 Sep 2026 07:39:03 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm221012115e9.15.2026.09.28.07.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v10 2/3] pwm: rp1: Add RP1 PWM controller driver
Date: Mon, 28 Sep 2026 16:42:41 +0200
Message-ID: <b26a359bb0b8f8637955cf3428d0db5137d932e1.1790606188.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790606188.git.andrea.porta@suse.com>
References: <cover.1790606188.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.

Add the supporting driver.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pwm/Kconfig   |   7 +
 drivers/pwm/Makefile  |   1 +
 drivers/pwm/pwm-rp1.c | 417 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 425 insertions(+)
 create mode 100644 drivers/pwm/pwm-rp1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 7297760868790..523789e82355e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -637,6 +637,13 @@ config PWM_ROCKCHIP
 	  Generic PWM framework driver for the PWM controller found on
 	  Rockchip SoCs.
 
+config PWM_RASPBERRYPI_RP1
+	tristate "RP1 PWM support"
+	depends on MISC_RP1 || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  PWM framework driver for Raspberry Pi RP1 controller.
+
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 5630a521a7cff..c07fd24f69f39 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
 obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
 obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
+obj-$(CONFIG_PWM_RASPBERRYPI_RP1)	+= pwm-rp1.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
new file mode 100644
index 0000000000000..a993b86a5bf85
--- /dev/null
+++ b/drivers/pwm/pwm-rp1.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pwm-rp1.c
+ *
+ * Raspberry Pi RP1 PWM.
+ *
+ * Copyright © 2026 Raspberry Pi Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ * Based on the pwm-bcm2835 driver by:
+ * Bart Tanghe <bart.tanghe@thomasmore.be>
+ *
+ * Datasheet: https://pip-assets.raspberrypi.com/categories/892-raspberry-pi-5/documents/RP-008370-DS-1-rp1-peripherals.pdf?disposition=inline
+ *
+ * Limitations:
+ * - Channels can be enabled/disabled through a global update flag, while the
+ *   period and duty per-channel registers are independently updatable, and
+ *   they are latched on the end of (specific channel) period strobe.
+ *   This means that period and duty changes might result in glitches if the
+ *   period/duty is changed exactly during an end of period strobe.
+ * - Since the duty/period registers are freely updatable (do not depend on
+ *   the global update flag), setting one of them close to the period end and
+ *   the other right afterwards results in a mixed output for that cycle because
+ *   the write ops are not atomic.
+ * - The global update flag prevents mis-sampling of multi-bit bus signals in
+ *   the PWM clock domain. This ensures that all PWM channel settings update
+ *   on the same PWM clock cycle. Channels start in sync only if they share the
+ *   same period.
+ * - If both duty and period are set to 0, the output is a constant low signal
+ *   if polarity is normal or a constant high signal if polarity is inversed.
+ * - When disabled the output is driven to 0 if polarity is normal, or to 1
+ *   if polarity is inversed.
+ * - Disabling the PWM stops the output immediately, without waiting for current
+ *   period to complete first.
+ * - Channels are phase-capable, but on RPi5, the firmware can use a channel
+ *   phase register to report the RPM of the fan connected to that PWM
+ *   channel. As a result, phase control will be ignored for now.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/units.h>
+
+#define RP1_PWM_GLB_CTRL			0x000
+#define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
+#define RP1_PWM_GLB_CTRL_SET_UPDATE		BIT(31)
+
+#define RP1_PWM_CHAN_CTRL(chan)			(0x014 + ((chan) * 0x10))
+#define RP1_PWM_CHAN_CTRL_POLARITY		BIT(3)
+#define RP1_PWM_CHAN_CTRL_FIFO_POP_MASK		BIT(8)
+#define RP1_PWM_CHAN_CTRL_MODE			GENMASK(2, 0)
+enum rp1_pwm_ctrl_mode {
+	RP1_PWM_CHAN_CTRL_MODE_ZERO,
+	RP1_PWM_CHAN_CTRL_MODE_TE_MS,
+	RP1_PWM_CHAN_CTRL_MODE_PC_MS,
+	RP1_PWM_CHAN_CTRL_MODE_PD_ENC,
+	RP1_PWM_CHAN_CTRL_MODE_MSB_SER,
+	RP1_PWM_CHAN_CTRL_MODE_PPM,
+	RP1_PWM_CHAN_CTRL_MODE_LE_MS,
+	RP1_PWM_CHAN_CTRL_MODE_LSB_SER,
+};
+
+#define RP1_PWM_CHAN_CTRL_DEFAULT		(RP1_PWM_CHAN_CTRL_FIFO_POP_MASK +  \
+						FIELD_PREP(RP1_PWM_CHAN_CTRL_MODE, \
+						RP1_PWM_CHAN_CTRL_MODE_TE_MS))
+
+#define RP1_PWM_RANGE(chan)			(0x018 + ((chan) * 0x10))
+#define RP1_PWM_PHASE(chan)			(0x01C + ((chan) * 0x10))
+#define RP1_PWM_DUTY(chan)			(0x020 + ((chan) * 0x10))
+
+#define RP1_PWM_NUM_PWMS			4
+
+struct rp1_pwm {
+	void __iomem *base;
+	struct clk *clk;
+	unsigned long clk_rate;
+	bool clk_enabled;
+};
+
+struct rp1_pwm_waveform {
+	u32 period_ticks;
+	u32 duty_ticks;
+	bool enabled;
+	bool inverted_polarity;
+};
+
+static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value;
+
+	/* update the changed registers on the next strobe to avoid glitches */
+	value = readl(rp1->base + RP1_PWM_GLB_CTRL);
+	value |= RP1_PWM_GLB_CTRL_SET_UPDATE;
+	writel(value, rp1->base + RP1_PWM_GLB_CTRL);
+}
+
+static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value, polarity;
+
+	/* init channel to reset defaults, preserving the polarity bit */
+	value = readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+	polarity = FIELD_GET(RP1_PWM_CHAN_CTRL_POLARITY, value);
+	value = u32_replace_bits(RP1_PWM_CHAN_CTRL_DEFAULT, polarity, RP1_PWM_CHAN_CTRL_POLARITY);
+	writel(value, rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+
+	return 0;
+}
+
+static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
+				       struct pwm_device *pwm,
+				       const struct pwm_waveform *wf,
+				       void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u64 period_ticks, duty_ticks, offset_ticks;
+	struct rp1_pwm_waveform *wfhw = _wfhw;
+	u64 clk_rate = rp1->clk_rate;
+	int ret = 0;
+
+	if (!wf->period_length_ns) {
+		*wfhw = (typeof(*wfhw)){
+			.enabled = false,
+			.inverted_polarity = false,
+		};
+		return 0;
+	}
+
+	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
+
+	/*
+	 * The period is limited to U32_MAX, and it will be decremented by one later
+	 * to allow 100% duty cycle.
+	 */
+	if (period_ticks > U32_MAX) {
+		period_ticks = U32_MAX;
+	} else if (period_ticks < 2) {
+		period_ticks = 2;
+		ret = 1;
+	}
+
+	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
+	duty_ticks = min(duty_ticks, period_ticks);
+	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
+	if (offset_ticks >= period_ticks)
+		offset_ticks = period_ticks - 1;
+	if (duty_ticks && offset_ticks &&
+	    duty_ticks + offset_ticks >= period_ticks) {
+		wfhw->duty_ticks = period_ticks - duty_ticks;
+		wfhw->inverted_polarity = true;
+	} else {
+		wfhw->duty_ticks = duty_ticks;
+		wfhw->inverted_polarity = false;
+	}
+	/* Account for the extra tick at the end of the period */
+	wfhw->period_ticks = period_ticks - 1;
+
+	wfhw->enabled = true;
+
+	return ret;
+}
+
+static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
+					 struct pwm_device *pwm,
+					 const void *_wfhw,
+					 struct pwm_waveform *wf)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	const struct rp1_pwm_waveform *wfhw = _wfhw;
+	u64 clk_rate = rp1->clk_rate;
+	u64 ticks;
+
+	*wf = (struct pwm_waveform){ };
+
+	if (!wfhw->enabled)
+		return 0;
+
+	wf->period_length_ns = DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1) * NSEC_PER_SEC,
+						(u32)clk_rate);
+
+	if (!wfhw->inverted_polarity) {
+		ticks = min_t(u64, wfhw->duty_ticks, (u64)wfhw->period_ticks + 1);
+		wf->duty_length_ns = DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC,
+						      (u32)clk_rate);
+	} else {
+		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
+			/* 100% duty cycle case */
+			ticks = 0;
+		} else {
+			ticks = (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
+		}
+		wf->duty_length_ns = DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, (u32)clk_rate);
+		wf->duty_offset_ns = DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1 - ticks) *
+						      NSEC_PER_SEC, (u32)clk_rate);
+	}
+
+	return 0;
+}
+
+static int rp1_pwm_write_waveform(struct pwm_chip *chip,
+				  struct pwm_device *pwm,
+				  const void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	const struct rp1_pwm_waveform *wfhw = _wfhw;
+	u32 value, ctrl;
+
+	/* set polarity */
+	value = readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+	if (!wfhw->inverted_polarity)
+		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
+	else
+		value |= RP1_PWM_CHAN_CTRL_POLARITY;
+	writel(value, rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+
+	/* early exit if disabled */
+	ctrl = readl(rp1->base + RP1_PWM_GLB_CTRL);
+	if (!wfhw->enabled) {
+		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
+		/* just disable the channel and bail out early */
+		writel(ctrl, rp1->base + RP1_PWM_GLB_CTRL);
+		rp1_pwm_apply_config(chip, pwm);
+		return 0;
+	}
+
+	/* set period and duty cycle */
+	writel(wfhw->period_ticks, rp1->base + RP1_PWM_RANGE(pwm->hwpwm));
+	writel(wfhw->duty_ticks, rp1->base + RP1_PWM_DUTY(pwm->hwpwm));
+
+	/* enable the channel */
+	ctrl |= RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
+	writel(ctrl,  rp1->base + RP1_PWM_GLB_CTRL);
+
+	rp1_pwm_apply_config(chip, pwm);
+
+	return 0;
+}
+
+static int rp1_pwm_read_waveform(struct pwm_chip *chip,
+				 struct pwm_device *pwm,
+				 void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	struct rp1_pwm_waveform *wfhw = _wfhw;
+	u32 value;
+
+	*wfhw = (typeof(*wfhw)) {
+		.period_ticks = 0,
+		.duty_ticks = 0,
+	};
+
+	value = readl(rp1->base + RP1_PWM_GLB_CTRL);
+	wfhw->enabled = !!(value & RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm));
+
+	value = readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+	wfhw->inverted_polarity = !!(value & RP1_PWM_CHAN_CTRL_POLARITY);
+
+	if (wfhw->enabled) {
+		wfhw->period_ticks = readl(rp1->base + RP1_PWM_RANGE(pwm->hwpwm));
+		wfhw->duty_ticks = readl(rp1->base + RP1_PWM_DUTY(pwm->hwpwm));
+	}
+
+	return 0;
+}
+
+static const struct pwm_ops rp1_pwm_ops = {
+	.sizeof_wfhw = sizeof(struct rp1_pwm_waveform),
+	.request = rp1_pwm_request,
+	.round_waveform_tohw = rp1_pwm_round_waveform_tohw,
+	.round_waveform_fromhw = rp1_pwm_round_waveform_fromhw,
+	.read_waveform = rp1_pwm_read_waveform,
+	.write_waveform = rp1_pwm_write_waveform,
+};
+
+static int rp1_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned long clk_rate;
+	struct pwm_chip *chip;
+	struct rp1_pwm *rp1;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	rp1 = pwmchip_get_drvdata(chip);
+
+	rp1->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rp1->base))
+		return PTR_ERR(rp1->base);
+
+	rp1->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(rp1->clk))
+		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
+
+	ret = clk_prepare_enable(rp1->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+	rp1->clk_enabled = true;
+
+	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
+		goto err_disable_clk;
+	}
+
+	clk_rate = clk_get_rate(rp1->clk);
+	if (!clk_rate) {
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
+		goto err_disable_clk;
+	}
+	/*
+	 * To prevent u64 overflow in period calculations:
+	 * mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC)
+	 * If clk_rate > 1 GHz, the result can overflow.
+	 */
+	if (clk_rate > HZ_PER_GHZ) {
+		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");
+		goto err_disable_clk;
+	}
+	rp1->clk_rate = clk_rate;
+
+	chip->ops = &rp1_pwm_ops;
+	chip->atomic = true;
+
+	platform_set_drvdata(pdev, chip);
+
+	ret = pwmchip_add(chip);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
+		goto err_disable_clk;
+	}
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(rp1->clk);
+
+	return ret;
+}
+
+static void rp1_pwm_remove(struct platform_device *pdev)
+{
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	pwmchip_remove(chip);
+
+	if (rp1->clk_enabled) {
+		clk_disable_unprepare(rp1->clk);
+		rp1->clk_enabled = false;
+	}
+}
+
+static int rp1_pwm_suspend(struct device *dev)
+{
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	if (rp1->clk_enabled) {
+		clk_disable_unprepare(rp1->clk);
+		rp1->clk_enabled = false;
+	}
+
+	return 0;
+}
+
+static int rp1_pwm_resume(struct device *dev)
+{
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	int ret;
+
+	ret = clk_prepare_enable(rp1->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock on resume: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+	rp1->clk_enabled = true;
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rp1_pwm_pm_ops, rp1_pwm_suspend, rp1_pwm_resume);
+
+static const struct of_device_id rp1_pwm_of_match[] = {
+	{ .compatible = "raspberrypi,rp1-pwm" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rp1_pwm_of_match);
+
+static struct platform_driver rp1_pwm_driver = {
+	.probe = rp1_pwm_probe,
+	.remove = rp1_pwm_remove,
+	.driver = {
+		.name = "rp1-pwm",
+		.of_match_table = rp1_pwm_of_match,
+		.pm = pm_ptr(&rp1_pwm_pm_ops),
+	},
+};
+module_platform_driver(rp1_pwm_driver);
+
+MODULE_DESCRIPTION("RP1 PWM driver");
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_LICENSE("GPL");
-- 
2.35.3

