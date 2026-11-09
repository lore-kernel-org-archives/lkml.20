Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231391;
	b=XOaw+7XtcasqG4W9tEE8jFhIDPWHK4FVcTsCcTa1sy01YcQg/BqomzG4CVNx0+Cz+lyf
	 2V6ZmvOsjBAaxlPFORoZ56z9BvafbfwxWg5ZQWT2BKQ4tNY9lBU4hUAlO3WXznSMdXfxm
	 PXlVVdDT6Ku588TAhRinMmuFFoHYQu9Q6o+pmHuuaZ0/pLM/YIRo8b32u5D0C4C6OM5JW
	 bd/hy9aSiX/1DBx3NJ6RYW0zwwXlB42tfWQMvRtwvpeR7bds9wTB91SmnNSeYBhH/r8vS
	 FHHcy9vBIF2q5mmREaF4wnlk1MgMNK6L8ZUsh3kX/M92p8tzkSpOXH5iAoOEQlOAsnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c+8gusN7ZVkPaglEfpGfKOEdlZyPLK59OAvXXwLbBt0=;
	b=3q+NNdq91Sb72AELOB5LLnecF4TiQQfEfr1AHQ/9vh95Sx8ng3rdeWfl0cnHQuM0dKqN
	 yCaaVOGBf+WvdqXmgzqlyrsa8aL3OQXCyItXZu+K8F/RRcxOIDET/ZZp6rGvyN0QxUMGJ
	 mY+edg86XtxmCTbrasIsyJzrPLg7dQfEXwEvb4Q+YlRk+S8eklt2bVDZWfP2+IyuPNwLX
	 KsXMbwxAl1KTU7/iRwzOb4yORQOfLyENJLrQGKD9nBtxm0HSMPV2RF5yJ7NYFGx4Ez338
	 v6UkOKQ2sRDJf74sggRK9eBTDtcZWgB/9kXS9XGoyyj5QHNa757uk9GWUNDUZ1Sy6Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b="ksRZ/fCF";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB3608361B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDB3608361B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ksRZ/fCF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6555585e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231389; x=1794836189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+8gusN7ZVkPaglEfpGfKOEdlZyPLK59OAvXXwLbBt0=;
        b=ksRZ/fCFelz62Fa8iLWWikjaVSv6fhUgzCF8ATUrnF4hcUvmsb2D7mr+7JqyLo6Zxu
         /dB03aqQ8120ucV1FBcZiU07fAhTb8LEadxv3lXe2wDfEs5SEUDdjyKXM31SS9vd5wnp
         b8wrDFTXs7ww7LJKLkrlyRZpPHt7AEeSx7SF4huXNvfhWFey2ZuoJrWIPMx56pUmC5Kt
         TsMLVOOd4Uoxwz3TixQna5DKGEt8i+ossjozc/JGk7ltItPG0hYK9KQsS1RgaZTL0nW1
         0YrsjjVXPkJaT6vZpD0oTWQlYPH3RGizyrwjGBsx7JTbzOxcTAOWy5fZnTK5USG0iYi6
         qptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231389; x=1794836189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+8gusN7ZVkPaglEfpGfKOEdlZyPLK59OAvXXwLbBt0=;
        b=tKA97zy52KcGgB5/nI89evNcmZPoPqyhIfrQiGlws9kin2254kdGCdRyyQAK4CMkuv
         NPmYqCmCYc9MMoQdgOvQFtv3kmSzhtuxC2b/a/MPH8soLf0lZiUcvhMIYLstjSGedpUs
         fBuJ7KGz0YKYoS0Tmu3ESqiz5pvhHoIvyIn63LKQltHWzL3QF6V5xd/MOKAoIM43rUOV
         tpSY4Q87O9sSMdbVgx7sQuSDiRTR/cyro9/VAi+rDXebH4EZLAi/nqc+QLwm8l5oWwvs
         yBngI+9RULRpLx8Ai/lSfv1UFZYAmfDAKN5Bfkol4P7OkQnTwow/dg1V458KDHh9b2ZJ
         cjCA==
X-Forwarded-Encrypted: i=1; AL+hErH3z1uch7kRaEze4TojIoZ/7vzz6Owio2zikbdj1dBVn3k+bHlY9IDS5gNbk5WWL4PtOAhBndA8Gan0BHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JQvL3PpQ1mKk7nyh/4Npcpc6HTdsPvaHQ0H86cnks9IcWfaGB
	Fv05R8+pMh9FJ9PZLN3G+z1F1423MALjn2SIy/t8dSsdvpyfFNxvnJcGrhyZ8OgdHsU=
X-Gm-Gg: AYBFou2wiox2G0j3stvf/w2GCCOsWIEFNH8jhaDBmzz/A57sj8zC9cErjFxZmXjo1bM
	gyu1fJe3Az1BtWwBFViASdG2PJuA0DTxiUzUqkfyOyZrvvGC0ueojoRRq2rlP7YlxRkMurf3vHB
	i67/D4s5Q0+eQyD+6hIBWcIz8QgPkyhxGR7WyxUFO+x4u+minjpyJtK6tC4sl1f5QgiPIK9V8Ot
	1ps4/oJCR6brYSCQjxIBrzuO8f5/90rK3t2K4W5ko9KqhlzyBqRhXKZ+2TmP0YlwjMK3DUaxEWB
	XNqMG8m2XkCBNAi5DfpkehTGEgsbmBEjfP1YfNOs2Dz/HCBuH/GTu7hE5QPA8Rpz+fbvXMU5c5D
	8GAy1SJSY0Z8XmY3+/cRxGkzEB5LZft2rAkJwLJ/tu5CABHF+781EhJcP9AtAQDuuFJcnDrnIRg
	kARZXI8j/NXHaDZe0cl8j81Wy3oON7qiszqFoOLG7NrUik1KR2PToEql3H1jL94xfA2eNpaUC61
	wH4x7195Xdt3GD0U7brI+QrVr97RgretjwPvcoXY21Cv1HOh8mNXSOD67k7+1fPT+EULXvT/2/g
	8ke8XfJ9PYhi/R608VxsYCtXaE5pWc0nTbeKEyGrmqW0oPRjV8/HrSEopRyNk29pWOs927hoD+d
	XyotkdcXSOBH+ASy0VTp/UxE24IK6IoBT3eJSTyR60E8+/ErNOp5PYFJKkiAC/ZNMlOXLYRaM89
	yumUQe
X-Received: by 2002:a05:600c:5397:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4b963c8715fmr67153345e9.35.1794231389580;
        Mon, 09 Nov 2026 05:36:29 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:28 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 4/6] hwmon: sparx5: add LAN969x PWM support
Date: Mon,  9 Nov 2026 14:35:08 +0100
Message-ID: <20261109133609.810876-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LAN969x fan controller provides an 8-bit PWM output with a
programmable frequency and polarity.

Expose pwm1 and pwm1_freq on the fan hwmon device. Parse the fan child
node's standard PWM specifier and use its period and polarity flags to
configure the hardware.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Drop the private mutex; hwmon serializes sysfs accesses.
- Preserve firmware PWM polarity when no fan child is present.
- Convert the DT period directly to a divider and reject invalid values
  before changing fan registers.

 Documentation/hwmon/sparx5-temp.rst |   9 ++
 drivers/hwmon/Kconfig               |   2 +-
 drivers/hwmon/sparx5-temp.c         | 198 ++++++++++++++++++++++++++--
 3 files changed, 196 insertions(+), 13 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index a053d12fbdbbb..edb12f890172c 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -35,8 +35,17 @@ The following attributes are supported.
 ======================= ========================================================
 temp1_input		Die temperature (in millidegree Celsius.)
 fan1_input              Fan speed in RPM (LAN969x only).
+pwm1                    PWM duty cycle, from 0 to 255 (LAN969x only).
+pwm1_freq               PWM frequency in Hz (LAN969x only).
 ======================= ========================================================
 
 The tachometer counts pulses over one-second intervals, independently of the
 PWM output. The fan child's pulses-per-revolution property specifies how many
 pulses represent one revolution; it defaults to two.
+
+On LAN969x, the fan child's pwms property selects the initial PWM period and
+polarity. The output is dedicated to this fan and is not available to external
+PWM consumers. The pwm1 value describes the logical duty cycle independently
+of the output polarity. Frequency requests are rounded to the nearest
+hardware divider value; requests outside the divider range are rejected.
+pwm1_freq reports the resulting frequency.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index deb9eb82b8501..b77112518ebe6 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -673,7 +673,7 @@ config SENSORS_SPARX5
 	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  If you say yes here you get support for temperature monitoring on
-	  Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
+	  Microchip Sparx5 and LAN969x SoCs, as well as the fan controller on
 	  LAN969x SoCs.
 
 	  This driver can also be built as a module. If so, the module
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 1f197004780cc..bdf08931f5b93 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -15,6 +15,8 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
+#include <dt-bindings/pwm/pwm.h>
+
 #define TEMP_CTRL		0
 #define TEMP_CFG		4
 #define  TEMP_CFG_CYCLES	GENMASK(24, 15)
@@ -24,14 +26,18 @@
 #define  TEMP_STAT_TEMP		GENMASK(11, 0)
 
 #define FAN_CFG			0
+#define  FAN_CFG_DUTY_CYCLE	GENMASK(23, 16)
+#define  FAN_CFG_INV_POL	BIT(3)
 #define  FAN_CFG_GATE_ENA	BIT(2)
 #define  FAN_CFG_STAT_MODE	BIT(0)
 #define FAN_PWM_FREQ		4
 #define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define  FAN_PWM_FREQ_DIV	GENMASK(15, 0)
 #define FAN_CNT			8
 #define  FAN_CNT_DATA		GENMASK(15, 0)
 
 #define FAN_TACH_INTERVAL_HZ	100000
+#define FAN_PWM_FREQ_SCALE	256
 
 struct s5_match_data {
 	bool is_fan;
@@ -43,6 +49,8 @@ struct s5_hwmon {
 	struct clk *clk;
 	unsigned long clk_rate;
 	u32 pulses_per_revolution;
+	u32 pwm_period;
+	bool pwm_inverted;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -72,6 +80,11 @@ static void s5_fan_enable(struct s5_hwmon *hwmon)
 	/* Count all tachometer pulses over one-second intervals. */
 	val = readl(hwmon->fan + FAN_CFG);
 	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	if (hwmon->pwm_period) {
+		val &= ~FAN_CFG_INV_POL;
+		if (hwmon->pwm_inverted)
+			val |= FAN_CFG_INV_POL;
+	}
 	writel(val, hwmon->fan + FAN_CFG);
 }
 
@@ -111,6 +124,32 @@ static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int s5_read_pwm(struct s5_hwmon *hwmon, long *val)
+{
+	u32 data;
+
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	*val = FIELD_GET(FAN_CFG_DUTY_CYCLE, data);
+
+	return 0;
+}
+
+static int s5_read_pwm_freq(struct s5_hwmon *hwmon, long *val)
+{
+	unsigned long rate;
+	u32 divider;
+
+	divider = readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
+	divider = FIELD_GET(FAN_PWM_FREQ_DIV, divider);
+	if (!divider)
+		return -ENODATA;
+
+	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
+	*val = DIV_ROUND_CLOSEST(rate, divider);
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		   u32 attr, int channel, long *val)
 {
@@ -125,6 +164,18 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_fan_input && hwmon->fan)
 			return s5_read_fan(hwmon, val);
 		break;
+	case hwmon_pwm:
+		if (!hwmon->fan)
+			break;
+		switch (attr) {
+		case hwmon_pwm_input:
+			return s5_read_pwm(hwmon, val);
+		case hwmon_pwm_freq:
+			return s5_read_pwm_freq(hwmon, val);
+		default:
+			break;
+		}
+		break;
 	default:
 		break;
 	}
@@ -132,6 +183,85 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 	return -EOPNOTSUPP;
 }
 
+static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+{
+	u32 data;
+
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	data &= ~FAN_CFG_DUTY_CYCLE;
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, val);
+	writel_relaxed(data, hwmon->fan + FAN_CFG);
+
+	return 0;
+}
+
+static void s5_write_pwm_divider(struct s5_hwmon *hwmon, u32 divider)
+{
+	u32 data;
+
+	data = readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
+	data &= ~FAN_PWM_FREQ_DIV;
+	data |= FIELD_PREP(FAN_PWM_FREQ_DIV, divider);
+	writel_relaxed(data, hwmon->fan + FAN_PWM_FREQ);
+}
+
+static int s5_write_pwm_period(struct s5_hwmon *hwmon)
+{
+	unsigned long rate;
+	u64 divider;
+
+	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
+	divider = DIV_ROUND_CLOSEST_ULL((u64)rate * hwmon->pwm_period,
+					NSEC_PER_SEC);
+	if (!divider || divider > FIELD_MAX(FAN_PWM_FREQ_DIV))
+		return -ERANGE;
+
+	s5_write_pwm_divider(hwmon, divider);
+
+	return 0;
+}
+
+static int s5_write_pwm_freq(struct s5_hwmon *hwmon, long val)
+{
+	unsigned long rate, divider;
+
+	if (val <= 0)
+		return -EINVAL;
+
+	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
+	if (val < DIV_ROUND_CLOSEST(rate, FIELD_MAX(FAN_PWM_FREQ_DIV)) ||
+	    val > rate)
+		return -ERANGE;
+
+	divider = DIV_ROUND_CLOSEST(rate, val);
+	divider = min_t(unsigned long, divider, FIELD_MAX(FAN_PWM_FREQ_DIV));
+
+	s5_write_pwm_divider(hwmon, divider);
+
+	return 0;
+}
+
+static int s5_write(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long val)
+{
+	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm || !hwmon->fan)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return s5_write_pwm(hwmon, val);
+	case hwmon_pwm_freq:
+		return s5_write_pwm_freq(hwmon, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 			     u32 attr, int channel)
 {
@@ -144,6 +274,12 @@ static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 		if (hwmon->fan && attr == hwmon_fan_input)
 			return 0444;
 		return 0;
+	case hwmon_pwm:
+		if (!hwmon->fan)
+			return 0;
+		if (attr == hwmon_pwm_input || attr == hwmon_pwm_freq)
+			return 0644;
+		return 0;
 	default:
 		return 0;
 	}
@@ -157,12 +293,14 @@ static const struct hwmon_channel_info * const s5_temp_info[] = {
 
 static const struct hwmon_channel_info * const s5_fan_info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_FREQ),
 	NULL
 };
 
 static const struct hwmon_ops s5_hwmon_ops = {
 	.is_visible = s5_is_visible,
 	.read = s5_read,
+	.write = s5_write,
 };
 
 static const struct hwmon_chip_info s5_temp_chip_info = {
@@ -175,6 +313,42 @@ static const struct hwmon_chip_info s5_fan_chip_info = {
 	.info = s5_fan_info,
 };
 
+static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
+			   struct s5_hwmon *hwmon)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0,
+					 &args);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse fan PWM\n");
+
+	if (args.np != dev->of_node || args.args_count != 2 || !args.args[0] ||
+	    args.args[1] & ~PWM_POLARITY_INVERTED) {
+		of_node_put(args.np);
+		return dev_err_probe(dev, -EINVAL, "invalid fan PWM specifier\n");
+	}
+
+	hwmon->pwm_period = args.args[0];
+	hwmon->pwm_inverted = args.args[1] & PWM_POLARITY_INVERTED;
+	of_node_put(args.np);
+
+	if (of_property_present(fan_np, "pulses-per-revolution")) {
+		ret = of_property_read_u32(fan_np, "pulses-per-revolution",
+					   &hwmon->pulses_per_revolution);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "invalid pulses-per-revolution\n");
+	}
+	if (!hwmon->pulses_per_revolution ||
+	    hwmon->pulses_per_revolution > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid pulses-per-revolution\n");
+
+	return 0;
+}
+
 static int s5_temp_probe(struct platform_device *pdev)
 {
 	const struct s5_match_data *match_data;
@@ -201,18 +375,11 @@ static int s5_temp_probe(struct platform_device *pdev)
 		hwmon->fan = base;
 		hwmon->pulses_per_revolution = 2;
 		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
-		if (fan_np &&
-		    of_property_present(fan_np, "pulses-per-revolution")) {
-			ret = of_property_read_u32(fan_np, "pulses-per-revolution",
-						   &hwmon->pulses_per_revolution);
+		if (fan_np) {
+			ret = s5_get_fan_data(dev, fan_np, hwmon);
 			if (ret)
-				return dev_err_probe(dev, ret,
-						     "invalid pulses-per-revolution\n");
+				return ret;
 		}
-		if (!hwmon->pulses_per_revolution ||
-		    hwmon->pulses_per_revolution > 4)
-			return dev_err_probe(dev, -EINVAL,
-					     "invalid pulses-per-revolution\n");
 	} else {
 		hwmon->base = base;
 	}
@@ -222,10 +389,17 @@ static int s5_temp_probe(struct platform_device *pdev)
 		return PTR_ERR(hwmon->clk);
 	hwmon->clk_rate = clk_get_rate(hwmon->clk);
 
-	if (is_fan)
+	if (is_fan) {
+		if (hwmon->pwm_period) {
+			ret = s5_write_pwm_period(hwmon);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid fan PWM period\n");
+		}
 		s5_fan_enable(hwmon);
-	else
+	} else {
 		s5_temp_enable(hwmon);
+	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev,
 					is_fan ? "lan969x_fan" : "s5_temp", hwmon,
-- 
2.56.0

