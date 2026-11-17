Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915888;
	b=oHSiNLWwMAqggTXOLg9jxHKBca1fHAxMuoYAe3ydPm9JZJqyO64zSiqzQJ3cd0ow//Gd
	 LFhJouayZc9A6WdlB3Z6OSFsRJWP84zhv+J1zWCin2qpYE9ab9OKncl8oOkGGHMpHC4Gd
	 9RnSXwPQuRK8SoFdp80BrLCK7Df4v5wlYnMyjpbqqXbi4OQ4PJlV+iQCM12Y59wUR20ol
	 Bz5m+14wM7bkn7CxZaZ6Km21P9vgKtc7NtLX12do8Sv578vaJJVqnDntoaYom/vHCNyYx
	 wAblypcfoyoSNZcK9GthNK4w1szBMQtlEy7jel0MIvf4WiNkrJSHrn1Zccy74D0rwPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=69UjS/icxGdKcghhC/fAtKqEULws+FgUWtAF3AwGKD4=;
	b=icqrgItOhKNcV4NcfSrl2sNen78A7nSYjGkUBgJ7UuA1nSWf7s0Tej6INUJDbF5DzfRN
	 zo16/+CoNHqXREOKcke3dvGeIB+qFUdDRFU9gsbDHCAgmx2eZOG3tiufsLgmoeOtsjDOS
	 k7JNjKcg6etmsEK6+IxlPFgsIFbCAdU1+rEMLR75eOncExEiLaBpNvZYm5AMGCPrMWw2Q
	 t/tAdcgRdau5p8N3w1LWTGuWUlgSwngv1MKUxRVVMu6sczgD+pFQn4IXOiZHYrJr/aGOW
	 C1tek4El2h9lnLfh0elQRDs7ndUx7kDEC5DX+3oXiTfpNgTbo192/QneSEUN1Zrrffg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RO2LFvkM;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAD260A2609
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAAD260A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RO2LFvkM
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so6145880e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915886; x=1795520686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69UjS/icxGdKcghhC/fAtKqEULws+FgUWtAF3AwGKD4=;
        b=RO2LFvkMf+jCXhQZ3jwgane+gnk8yLgQqUTMQgRMP204tz5bg670HAwrjPD/plWP37
         rZbO6lRRxkwr8L80vq7idRdNePkYtZjjQOunDzG4FQyrCRG9I2xe8Bh4fRQAkrp4rFJF
         BwbEbXfta+++HPevkcdklerm12OI/YQg5Mk+LS/cv8BW6f1tesWzT0j34xzkS8psk4pX
         eifT3SveEO8i31zzwDVOfVrHkIuIbr4Rz1dBwcmTrt1b5HXEjpoQyg7zC6cVt0i/rt14
         FKrI35aH+toTqtCyhbKkF/fXJvdmw/fjnyTs4wntWdlM9A6JAmVWS89RoJEDAS2zIGZd
         fTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915886; x=1795520686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69UjS/icxGdKcghhC/fAtKqEULws+FgUWtAF3AwGKD4=;
        b=U2od07Ns+nntGsNRqobQi3rJKaJz3cZlk1M7SrI60my/HfS0R59h5cPGcdPM3b+Byj
         yVk0tr7Txbnf+mp1YmBgJ3RDyJVEybU+Rtk3W/eYR9Z2DzerIeJMicwK5EzWYcmyg5Nd
         nE2s9nysSw9QHRwA9joTobREAbIpHMa7H9MN+JD3LLkDWwccHOFp4CVbkgi1aw6scSPp
         0x+zUdJ7UcZ7ixcIBG8J7N/vi8cMu3UFMT96QGtMJz/FVCp2QjwEfVcwEX2deAJhsJxb
         79YbRh/+Rw66gKEQdAMRD5FFvge8QDD3jUHYo6L47WtYNhxy1Qv+z0KgRsJAhYXKUKDx
         N2Nw==
X-Forwarded-Encrypted: i=1; AL+hErGDBpZPem6ZxlILANyRxyem773JfhaZu2bdGMnuDOhupltpwGVT9Y+iHE1p02r6YsyolchToHL1dTifjBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u9KmCwX0/CGvBbOyMYaMJ+QKcbn26K17O5h65yQtYAi/JOYh9
	+MIxJolgwgj+VAksrQUuPSkOUfZ+uglkVdjPOYM/M8CyEFCDIt6IbkYG
X-Gm-Gg: AYBFou0iBpjS5ZCJmay7sKGGnnsyHnMP6w8Pn2Z3WV6cx1MYFDXll+FSHn6Sol2anID
	YBKsK0l6TUSa6gx3HG1jgvNJjScrYdDy4bCOVaAsMy+CQXtmyaJ5En9wE3MIV1kGFl5A5Z2+vbr
	GlwLdh+/Rk2SewIo4SdZW7Z3Cz6tT315GK26YoEjy/Ct9FAmqKAX91z+IxfYh2CsR/gJQqpCA2B
	zffJ5anzRM1qW17qzFxFQaMyZFwsQ4hkpMCnE4CmgsXurquOQw8RTJpcxjbpD2SL/Pl3zQOsQcy
	iauUOkoM0HJ8PSXH3UKEi71BECdmismBVc2ORXdMCP/kKhxOq4nzdER0AVq6q4Ks5PbPtB4f+04
	GpWG+n7F82x4l0P4xU4YHFaFRUg4LLvCquHeKUx2cqGrxWCPNrTG3BUdvyBnair6vhX4EYhavq2
	SaLcThvSuSI/7g0sIh315X9FTXi0BKsvCHP7bGO/dZ6zaPvut/zl/4Y4Rq7BJf4mY++lJ6jBN0O
	CyucAVC597IQ6OZZI+H3zaNR9YeZmDm3tQFU0LT3+Cux8oOCj1QvQWdehEBY7KAPrgsE+6fhbbH
	sBgS+jKK9VMJjNxm3iNZUQPI0yAg0NF5NgjaUmJ6AoKNnaY=
X-Received: by 2002:a05:6512:3404:b0:5c1:57cd:51c with SMTP id 2adb3069b0e04-5c1709e0f56mr4806490e87.40.1794915885823;
        Tue, 17 Nov 2026 03:44:45 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:45 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
Date: Tue, 17 Nov 2026 14:44:30 +0300
Message-ID: <20261117114432.2794961-5-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

Add support for hardware-controlled LEDs and brightness on the DAP8211R
PHY. The chip exposes three LEDs that can be programmed to react to link,
speed, duplex, and TX/RX activity or be driven via the force mode.

Implement callbacks for led_brightness_set(), led_hw_is_supported(),
led_hw_control_set(), led_hw_control_get().

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 216 +++++++++++++++++++++++++++++++++++++
 1 file changed, 216 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index f626b43fdee1..8e93a9a62746 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/ethtool.h>
 #include <linux/kernel.h>
@@ -57,6 +58,50 @@
  */
 #define DAP8211R_DEFAULT_DEL_SEL	0xD
 
+#define DAP8211R_LED_ID_0		0
+#define DAP8211R_LED_ID_1		1
+#define DAP8211R_LED_ID_2		2
+
+/*
+ * LED_COMCON force mode bits:
+ * bit 2   - FORCE_EN (enable force mode for this LED)
+ * bit 1:0 - FORCE_MODE (00 = OFF, 01 = ON, 10/11 = blink mode1/mode2)
+ *
+ * Only ON/OFF is supported.
+ */
+#define DAP8211R_LED_COMCON		0xA00B
+#define DAP8211R_LED_FORCE_EN_BIT	BIT(2)
+#define DAP8211R_LED_FORCE_ON_BIT	BIT(0)
+
+#define DAP8211R_LED_FORCE_EN(idx)	(DAP8211R_LED_FORCE_EN_BIT << 3 * (idx))
+#define DAP8211R_LED_FORCE_ON(idx)	(DAP8211R_LED_FORCE_ON_BIT << 3 * (idx))
+
+#define DAP8211R_LED_FORCE_MODE		GENMASK(1, 0)
+#define DAP8211R_LED_FORCE_MASK(idx)	(DAP8211R_LED_FORCE_MODE << 3 * (idx))
+
+#define DAP8211R_LED_0_CON		0xA00C
+#define DAP8211R_LED_ACT_BLINK		BIT(13)
+#define DAP8211R_LED_FULL_DUPLEX	BIT(12)
+#define DAP8211R_LED_HALF_DUPLEX	BIT(11)
+#define DAP8211R_LED_TX			BIT(10)
+#define DAP8211R_LED_RX			BIT(9)
+#define DAP8211R_LED_LINK_1000		BIT(6)
+#define DAP8211R_LED_LINK_100		BIT(5)
+#define DAP8211R_LED_LINK_10		BIT(4)
+
+#define DAP8211R_LED_LINK		(DAP8211R_LED_LINK_10	| \
+					DAP8211R_LED_LINK_100	| \
+					DAP8211R_LED_LINK_1000)
+
+#define DAP8211R_LED_SUPPORTED_TRG	(BIT(TRIGGER_NETDEV_LINK)	| \
+					BIT(TRIGGER_NETDEV_LINK_10)	| \
+					BIT(TRIGGER_NETDEV_LINK_100)	| \
+					BIT(TRIGGER_NETDEV_LINK_1000)	| \
+					BIT(TRIGGER_NETDEV_TX)		| \
+					BIT(TRIGGER_NETDEV_RX)		| \
+					BIT(TRIGGER_NETDEV_HALF_DUPLEX)	| \
+					BIT(TRIGGER_NETDEV_FULL_DUPLEX))
+
 static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
 					      1050, 1200, 1350, 1500, 1650, 1800,
 					      1950, 2100, 2250};
@@ -139,6 +184,173 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
 	return ret;
 }
 
+/**
+ * dap8211r_led_brightness_set() - Modify the LEDs common control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @value: ON/OFF value for force mode of the LED
+ *
+ * Enables force mode and sets the LED to ON/OFF state.
+ * It will be disabled when hardware LED control is requested.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_brightness_set(struct phy_device *phydev, u8 index,
+				       enum led_brightness value)
+{
+	u16 set, mask;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		mask = DAP8211R_LED_FORCE_MASK(index);
+		set = DAP8211R_LED_FORCE_EN(index);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (value != LED_OFF)
+		set |= DAP8211R_LED_FORCE_ON(index);
+
+	return dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, mask, set);
+}
+
+/**
+ * dap8211r_led_hw_is_supported() - Check if the requested LED rules are supported
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Validates the requested combination of rules which can be represented in the
+ * hardware register.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index,
+ *         or -EOPNOTSUPP if any requested rule is not supported by the PHY
+ */
+static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return (rules & ~DAP8211R_LED_SUPPORTED_TRG) ? -EOPNOTSUPP : 0;
+}
+
+/**
+ * dap8211r_led_hw_control_set() - Write the LED control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Disables force mode and translates the requested trigger rules into
+ * the corresponding bit positions of the LED control register and writes
+ * the resulting value to the PHY.
+ *
+ * Note that the ACT_BLINK bit (13) must be set together with TX/RX rules,
+ * otherwise the LED will not blink on traffic if no other rule (such as
+ * link or duplex) is active.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	u16 led_mode = 0, led_reg;
+	int ret;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, DAP8211R_LED_FORCE_EN(index), 0);
+	if (ret)
+		return ret;
+
+	if (test_bit(TRIGGER_NETDEV_LINK, &rules))
+		led_mode |= DAP8211R_LED_LINK;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+		led_mode |= DAP8211R_LED_LINK_10;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+		led_mode |= DAP8211R_LED_LINK_100;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+		led_mode |= DAP8211R_LED_LINK_1000;
+
+	if (test_bit(TRIGGER_NETDEV_RX, &rules))
+		led_mode |= DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_TX, &rules))
+		led_mode |= DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_HALF_DUPLEX;
+
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_FULL_DUPLEX;
+
+	return dap8211r_write_ext(phydev, led_reg, led_mode);
+}
+
+/**
+ * dap8211r_led_hw_control_get() - Read the current LED configuration
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Pointer to a bitmask where the current rules will be stored
+ *
+ * Reads the LED control register and translates the hardware bit
+ * positions back into the corresponding netdev trigger rules bitmask.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
+{
+	u16 led_reg;
+	int led_mode = 0;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_0_CON + index;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	led_mode = dap8211r_read_ext(phydev, led_reg);
+	if (led_mode < 0)
+		return led_mode;
+
+	if (led_mode & DAP8211R_LED_LINK_10)
+		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_100)
+		__set_bit(TRIGGER_NETDEV_LINK_100, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_1000)
+		__set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+
+	if (led_mode & DAP8211R_LED_RX)
+		__set_bit(TRIGGER_NETDEV_RX, rules);
+
+	if (led_mode & DAP8211R_LED_TX)
+		__set_bit(TRIGGER_NETDEV_TX, rules);
+
+	if (led_mode & DAP8211R_LED_HALF_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+
+	if (led_mode & DAP8211R_LED_FULL_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+
+	return 0;
+}
+
 /**
  * dap8211r_config_init() - Initialize PHY
  * @phydev: PHY device structure
@@ -227,6 +439,10 @@ static struct phy_driver dap8211r_driver[] = {
 		.config_aneg	= genphy_config_aneg,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
+		.led_brightness_set	= dap8211r_led_brightness_set,
+		.led_hw_is_supported	= dap8211r_led_hw_is_supported,
+		.led_hw_control_set	= dap8211r_led_hw_control_set,
+		.led_hw_control_get	= dap8211r_led_hw_control_get,
 	},
 };
 module_phy_driver(dap8211r_driver);
-- 
2.43.0

