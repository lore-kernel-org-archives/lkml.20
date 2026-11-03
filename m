Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712936;
	b=UPzqAtJOK0vEqfp4XAysS+efLRpSXF7JItCIsJL8q83pOyrgcDtT+NiUm0dBOnkUpKFT
	 FnysU5A1fZokVi01+DbJWkfzz4Vadm4S9s+i/Ii4zYbqQ35usaBnWDtdeU6NXIIch1V4l
	 vRsrZDDJB5J+HoUMg+zWnHxkz/dP89tanVTWNzjtCyybZ58Jd3faoYNByKD02341P2AbV
	 KcZKAMC/S00KwmdhpnjWq5HmJUwbQ7FAwgqTUN3kNJQMFe/LbfiXiwzq5BP9Z0tdWEGzV
	 nXzACWJQ7OUSFaKGdtxMcUo33qX5d7+gkQ3cqg1cJpIJR5Orguad3Y1ftJpgQibu/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=55AdvbYjUSHpq0D3zdaJdVs8t2CEWwIW7MYZkBrdVp0=;
	b=VVltZ5lo6Doht6u01z+ceH7m65A0wEREuXpLd2unzRphQKzARu4Bq4vIfkRl1H3oLOwD
	 n/TRAbwLdIEiyr07A1gcOP6yYMe/Tn8CoHKTwsFGWQIhwWM+be0QyxBTG7v7No/ScUx2Y
	 rTlGK6qkmN8eZR5J71obiizGAE7oSyaGSErd50CogOHCA/xX1Rkcmv5BoyYrsj10cV9yr
	 MLsb8wBq3Ympw5Ac7901Hbx59EOlAgYV/LAG8UnPDlURXVBXpxPDDP2H4xAZ7VZ4pF7fU
	 6FVrx2g3Pv5UYwBQK/wlLU32iUvhgNGn5pt4dGHVXjyCajfjHSr32QVjpuXsA0CCwVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK4dRYzp;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C666083621
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C666083621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK4dRYzp
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso29961075e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712934; x=1794317734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55AdvbYjUSHpq0D3zdaJdVs8t2CEWwIW7MYZkBrdVp0=;
        b=IK4dRYzpIgrdEMOOSJCkumri43Ra9e/saaqcMz4arw35A74roOi4kkkeRGCh28RncD
         EJRcKvEqqnpmqRCONKs5lZinRR86Qew2Z6SgzyJTwOUcCP6HOZ7hzY6ydOGz9hPGPjd2
         B5LvFbNmMJdZNHCKcuhBOGFqP3uE3TIaQsjZfr9iDRM73p4npJxltcx77GY9oB1q+PBE
         wP38Wyq8gz5J4776SwDGHe7F6Ka+zDXYVc3oV7cH62F3un1LNZlwc1ZoxgFbZaSgGZDB
         rrfRgd84k3l0KASHyLP+QHtlJl0Nm471rjqdu85ZYQ1/5ekiYtXpZc55lh18a+l6ZVAR
         CIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712934; x=1794317734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=55AdvbYjUSHpq0D3zdaJdVs8t2CEWwIW7MYZkBrdVp0=;
        b=WOs6RxLQ/bDkxXSyvSj4Iqxd873Ca8o+kGwbcmCHDf5uVztcBqziD9rTjUFUjxZlrA
         OktaGY93GLNjUAyI/GnbpapxdIL6r5aoL+MyzHHlWGHLSQjjraBG0feRo8hE5cwL3mKN
         5wigux0pHzk+6fEYmx+sQIVVgsqwXk+praCUQgRYoheBmYNUzYzgYAzHBTUqyF+ReFME
         sE+5kv979Te3i/yW2iG/EFiRirr5NNW/hhZo6NThf/OONC1/pXKvvYJ7oon8nOPcMrBz
         YagZ8A1k0r57U5L3O+LIgMnRrR5STGSyiYho4Y1rFHCN1bowlLlznXatJphjs1ODmfB6
         NBsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF5BomBH2mpeTencf4qLjj2Yn/AJ8FgG/PmUkUBIeq2d7IkJBBPaf5nGBPytl5ONfCUrHVPHixRzbuJRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jILhVDCXgPiWRFnJbJ199FOOC8k5d9qV5Mdgmbjilh6mijFaL
	STnL2/UZRrl9KIvEZvBFSoiaB8LsyLoc06QsWibh55iGZFysIkj4h4y4
X-Gm-Gg: AYBFou22FSd+k+vGK4a63YM6vJ9JA5ESzS6K4As1eS2nRMiwlNucgRuIwXCfc0brgzV
	SxFNTAumzN53l/pPcSP0df3lbAoo7xkBg0QyUQF9O2OySSsvcPrVdWC5b7b5osZ3fHGxWoHELd7
	PoaVqUpwbhjf79HHaBT7ZRiSaNPNj4ukyZRkNSOZVjymi6a1PwqERMfGq4BQto2GA4kfXzflEqj
	xM7eo9Huy+biI12/PDv8kzNies6Z6eHN7MwlLLlL3ZAlccE3fu6oY7H8b6jVbEv+U5y1ulekbHu
	40DHJd3FB0fjxN4XgOLich4GHU0SxjttLSNzBabJ2cE8h6Bi3mwurTpIE4KBgX/U6gI4TUVCTAe
	/e59eHQvux2l1knYeWOffYn2bB/3Apts8WpPopxW0Tx8uWafopqVqGlMCwHHn9sK3/hHjKy+1eW
	dT9UL4kiSZ6iWmzaOMqwQ26ToWBUAGk4eKCpSNiKmnwrCyLB4NWaxDnt8XHjEu3TNtVL1se+P9x
	kyq3Dsz8rDmaI79sPw4Qa3ZzEw7QFsTIgUTjz7xs8+iVX++CUPk0u8jb79zwVAN4YUCzCGg7Wj3
	eYtKqS9RP2VuXPc+MPHToV47k3bA1CxiLTKv3L0kolUH6QW/6994vyjfNiLxTqv6Y/I7CEfjHtW
	E54s7clfJkBd8GZdtqryK0eZH10g5S71/Pf0t3zl1rL6I3hohZn2Z8k5NDb8CPVph5Q2k2KPxEc
	3UOXYYiNWGff4WpRVsLovD/jWd1+bYtYoYWVzJ1485tm5PCBz/P1EU6A==
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr304126875e9.22.1793712933899;
        Tue, 03 Nov 2026 05:35:33 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:33 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/2] wifi: mt76: mt7925: add LED support for USB adapters
Date: Tue,  3 Nov 2026 14:35:28 +0100
Message-ID: <20261103133528.53197-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
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

MT7925 USB adapters such as the NETGEAR A9000 have their status LED on
GPIO 8 of the chip. MediaTek's Windows driver asks the firmware to
switch it, but the firmware in linux-firmware does not act on that
request.

Drive the pin from the host instead. Set its level, then switch it from
its default function to a GPIO output through the CBTOP GPIO registers.
The register layout follows the coda headers in MediaTek's gen4m
driver. The LED of the A9000 is active low.

While the adapter is idle, the throughput trigger keeps requesting the
same state every second. Only write the registers when the state
changes, and forget the cached state whenever the firmware is loaded.

Link: https://github.com/morrownr/USB-WiFi/issues/731
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 51 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |  8 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 8c3049b66a85..3dfb4b2d997c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -187,6 +187,56 @@ static int mt7925_init_nan_cap(struct mt76_dev *mdev)
 	return 0;
 }
 
+static int mt7925_led_set_brightness(struct led_classdev *led_cdev,
+				     enum led_brightness brightness)
+{
+	struct mt76_phy *mphy = container_of(led_cdev, struct mt76_phy,
+					     leds.cdev);
+	struct mt792x_dev *dev = container_of(mphy->dev, struct mt792x_dev,
+					      mt76);
+	bool on = brightness != LED_OFF;
+	u8 pin = mphy->leds.pin;
+	u32 mask = BIT(pin % 32);
+
+	mt792x_mutex_acquire(dev);
+	if (dev->pm.suspended || dev->led_state == on)
+		goto out;
+
+	if (on ^ mphy->leds.al)
+		mt76_wr(dev, MT_CBTOP_GPIO_DOUT_SET(pin), mask);
+	else
+		mt76_wr(dev, MT_CBTOP_GPIO_DOUT_CLR(pin), mask);
+
+	/* the pin starts in another function, make it a GPIO output */
+	if (dev->led_state < 0) {
+		mt76_wr(dev, MT_CBTOP_GPIO_DIR_SET(pin), mask);
+		mt76_wr(dev, MT_CBTOP_GPIO_MODE_MOD(pin),
+			MT_CBTOP_GPIO_MODE_MOD_EN << ((pin % 8) * 4));
+	}
+
+	dev->led_state = on;
+out:
+	mt792x_mutex_release(dev);
+
+	return 0;
+}
+
+static void mt7925_init_led(struct mt792x_dev *dev)
+{
+	struct mt76_phy *mphy = &dev->mphy;
+
+	if (!IS_ENABLED(CONFIG_MT76_LEDS) || !mt76_is_usb(&dev->mt76) ||
+	    !is_mt7925(&dev->mt76))
+		return;
+
+	/* MediaTek's Windows driver uses GPIO 8 on MT7925 USB adapters */
+	mphy->leds.pin = 8;
+	/* the LED of the NETGEAR A9000 is active low */
+	mphy->leds.al = true;
+	mphy->leds.cdev.flags |= LED_HW_PLUGGABLE;
+	mphy->leds.cdev.brightness_set_blocking = mt7925_led_set_brightness;
+}
+
 static void mt7925_init_work(struct work_struct *work)
 {
 	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
@@ -208,6 +258,7 @@ static void mt7925_init_work(struct work_struct *work)
 	}
 
 	dev->mt76.init_wiphy = mt7925_init_nan_cap;
+	mt7925_init_led(dev);
 
 	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
 				   ARRAY_SIZE(mt76_rates));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 26cdb3f0a98a..91564a2c1d65 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1191,6 +1191,8 @@ int mt7925_run_firmware(struct mt792x_dev *dev)
 {
 	int err;
 
+	dev->led_state = -1;
+
 	err = mt792x_load_firmware(dev);
 	if (err)
 		return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index e040dff321dd..73bd8c58dd84 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -91,6 +91,14 @@
 
 #define MT_WFSYS_SW_RST_B		0x7c000140
 
+#define MT_CBTOP_GPIO_BASE		0x70005000
+#define MT_CBTOP_GPIO(ofs)		(MT_CBTOP_GPIO_BASE + (ofs))
+#define MT_CBTOP_GPIO_DIR_SET(_n)	MT_CBTOP_GPIO(0x004 + ((_n) / 32) * 0x10)
+#define MT_CBTOP_GPIO_DOUT_SET(_n)	MT_CBTOP_GPIO(0x104 + ((_n) / 32) * 0x10)
+#define MT_CBTOP_GPIO_DOUT_CLR(_n)	MT_CBTOP_GPIO(0x108 + ((_n) / 32) * 0x10)
+#define MT_CBTOP_GPIO_MODE_MOD(_n)	MT_CBTOP_GPIO(0x30c + ((_n) / 8) * 0x10)
+#define MT_CBTOP_GPIO_MODE_MOD_EN	BIT(3)
+
 #define MT7925_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x370)
 #define MT7928_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x400)
 #define MT_WTBLON_TOP_WDUCR_GROUP	GENMASK(4, 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index a7d71e007da0..73c23f509b99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -324,6 +324,8 @@ struct mt792x_dev {
 
 	u8 fw_debug;
 	u8 fw_features;
+	/* LED state last written to the GPIO, -1 if unknown */
+	s8 led_state;
 
 	struct mt76_connac_pm pm;
 	struct mt76_connac_coredump coredump;
-- 
2.54.0 (Apple Git-157)

