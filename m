Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870015;
	b=NDPINneKe7umskkN8rsMKNFkFt12IKwhXg9EoFI4SiWFr43MS35g7tQInAs1241SRzJ3
	 maXBKGsIvE4/eCw/SAADfyoSR36bj7IPPTST2WJVjjPsZmjiUYiftxbQiUFfdAPS4O+Bd
	 aN3N3Uo/VO9QFXKfXNQIZVtcJwUZ7yLon8FBzQQ7Zsyi8M3/HiiWPbDkSADigOEfS0iCl
	 IWDjqso+5DijHz6b2C+ZWlWR30NSN/dhDkOsdCjD/S78pO5nR3g2Nmf0XrWV2b4rg2XOP
	 JnSWH+bJht+GI94ELoLP2SxaEgy+diW1/DLjVpQeFeJcPlmeaubibsfpLwihA1QQo2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=F6oW4ZmByrglAwdMR7r6p9kXbfexkyXhO5YlnrOYLBs=;
	b=ScK5IiWkN5gmtISLYdR6qVif0OiysAFseX0Y19SjKPl/6a62TmhQ8Aq4wSj4EJlo6N2E
	 uhGwEEnGjM7XQfuw2to+/9XHtm11w5Gsvzr8GH2nVpmeZ8kir4dBhtr5F6etQGRnEO+Tu
	 9LcIDiEAv4gD9V3qTbNvuU/yOLPuuz6lwVXyQL7zrL9nIun6UfCI3xcXPfbnSewEPXOoV
	 +5qg3f1bjVjnYzZf2peQYMl8FEGePoTTPxfi2OVmZHyEcq4DrwFeFhy5mTf1oPyECdak9
	 fY6jp6pTgUtGmUtC6gp78fmz4k7bDBwyHJpNiklSGiKvfm5h7gzhSDbxmQRgLs6jgCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3563360A2618
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3563360A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4cd576f2aso15388257b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870014; x=1795474814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6oW4ZmByrglAwdMR7r6p9kXbfexkyXhO5YlnrOYLBs=;
        b=aEbcdK+ttdQ2ozSdtMG0F7xJlCmNfD9n6MY0CJ1gHpExf8MuJiNzcMUDZaFpUBA8hc
         QbLqO1oPOhuG0Vl8aukUIFVuMeFWSW1hwXxp2UcqATqRS9drq47CBUaFE9f8Z79zH9fA
         0zupc3BuNoHV1eB+pNKz5z6Vi/OUjJVdwXvf7bl31pVh2mDbLmMWUL+MnyR1Ux0jozQY
         Z8sJfjvrISwPm3lBcTFA8EAMcQKhIJV8sC0EQNMghVgi2Tj4tFAJA9m48rwdH8Q0pgJY
         mFBF0WBDPPSEc1CLfNxD5uJHmhrUVJiR5toiUavbSkeinteCf06FjaRP4X2Si5iSTuCg
         T0wQ==
X-Forwarded-Encrypted: i=1; AL+hErECRgWxulirfVIztCDCkDJZjScbBSMFSiDwAshjdr+fFhvB+f+pEPpSWiUYbs2vfnlHgbHOvJrye1Kj7UE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k3GncpB3raP2kUhRou8OocfPX8QCvok0Px5eKZMrP6qea9WKH
	wroGCPFPxrXzMPuc35th0+XJa+cPJWW+SbEoIu4YEmKr4tXXmYKcGNxgWq7RwB01Zcs=
X-Gm-Gg: AZFdTZehwCTS3dA7YZ7dKv1H+Y3enukxvrwTW/+S7IN0uEtQXhwrNVW74fwj1uexZ2s
	BwynO6EO0p61VZdN7O8gWTbTBuYhjaKtyyia5DP2fjbAdvT8MvNbVtjamhwKGNMf7qZSnT7Mh13
	7pIsABzj3DqUbK9YbqOqIG8vZzUZHeQMs7OOWPD6k1g9DcAsAJyDkdYTyCnnuLnToAqv3pyJBSN
	tDvVfQ4wtZ2qAaW6DlOYYLlZX35mOiSQJhatPjtyqtuF111RVJOmb+CtKiQaSdZRAQEDAfrGItX
	nO8StQtqEDX2m5dOe0KCfm5/X+7qyqq69igoY21mw+syf0Ve7ywyX7s9oPh6NC+648P8JPXKk7G
	nUJgLO/cTYKUkpXqiykLDE10apZXMEuwmzQ98+BonsdEru+/dkJrtntrAKl8kSIqLpjSjQeOnfW
	i4CUc6EK1oOx6mqlWFkawyMH6Gc1rciUyrmC7YaufzE/voh5pikb8sUs1NMoHhzrbrUVFtLAVvn
	11f8e0d2/Vg1jiljoq+UX7QDc4cpfBy2OYnG6ThV1PuIXvsFWgcXcGokr0J8lgJbX2S7cFXR/eh
	cCH3I4VMg0RdxmMAohM5lQPIexFUC00tBtOBISLHLwCvcotoHceUgrBXMN+eawFfQXNQeMV6Y1w
	o0KUZhwxvsKtFiOSIbEuB6/ua4vPYBf7VkP4=
X-Received: by 2002:a05:690c:39c:b0:8a8:5c3d:903 with SMTP id 00721157ae682-8b4aa441b73mr65561507b3.62.1794870014054;
        Mon, 16 Nov 2026 15:00:14 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:13 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:54 -0500
Subject: [PATCH 5/5] iio: potentiometer: mcp4018: Add Analog Devices AD5246
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
Message-Id: <20261116-iio-ad5246-v1-5-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The AD5246 is a 128-position digital rheostat with the same I2C
interface as the MCP4017/18/19: a single data byte writes the 7-bit
wiper and a single-byte read returns it, with no command byte. Add its
four resistance options.

Its resistance is D/128 of the end-to-end value, where the MCP401x's is
D/127, so the scale divisor moves into the per-part config.

The misc ad525x_dpot driver also knows the AD5246, by I2C id only and
through its own sysfs files. It can't provide an IIO channel, which a
consumer such as dpot-dac needs. The AD5272 is likewise in both drivers.

Tested on an AD5246 at 0x2e that sets a fan's speed, described as
adi,ad5246-010 with a vdd-supply. It probes, out_resistance0_raw_available
reads [0 1 127] and out_resistance_scale reads 78.125000000. Raw writes
of 0, 64, 100 and 127 read back the same value, and 128 is rejected.
Writes through iio_write_channel_raw() from an in-kernel consumer of the
channel read back as well (127, 38, 0 and 76).

Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/AD5246.pdf
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/Kconfig   |  6 +++---
 drivers/iio/potentiometer/mcp4018.c | 33 +++++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/potentiometer/Kconfig b/drivers/iio/potentiometer/Kconfig
index e6a9a3c67845..7945c75f06da 100644
--- a/drivers/iio/potentiometer/Kconfig
+++ b/drivers/iio/potentiometer/Kconfig
@@ -70,12 +70,12 @@ config MAX5487
 	  module will be called max5487.
 
 config MCP4018
-	tristate "Microchip MCP4017/18/19 Digital Potentiometer driver"
+	tristate "Microchip MCP4017/18/19 and Analog Devices AD5246 Digital Potentiometer driver"
 	depends on I2C
 	help
 	  Say yes here to build support for the Microchip
-	  MCP4017, MCP4018, MCP4019
-	  digital potentiometer chips.
+	  MCP4017, MCP4018, MCP4019 digital potentiometer chips
+	  and the Analog Devices AD5246 digital rheostat.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called mcp4018.
diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index 0d80bdfdf243..1368d7cfa5b0 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -5,11 +5,13 @@
  * Author: Peter Rosin <peda@axentia.se>
  *
  * Datasheet: http://www.microchip.com/downloads/en/DeviceDoc/22147a.pdf
+ * Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/AD5246.pdf
  *
  * DEVID	#Wipers	#Positions	Resistor Opts (kOhm)
  * mcp4017	1	128		5, 10, 50, 100
  * mcp4018	1	128		5, 10, 50, 100
  * mcp4019	1	128		5, 10, 50, 100
+ * ad5246	1	128		5, 10, 50, 100
  */
 
 #include <linux/err.h>
@@ -23,6 +25,8 @@
 
 struct mcp4018_cfg {
 	int kohms;
+	/* Wiper position divisor: R = raw * kohms / div. */
+	int div;
 };
 
 enum mcp4018_type {
@@ -30,13 +34,22 @@ enum mcp4018_type {
 	MCP4018_103,
 	MCP4018_503,
 	MCP4018_104,
+	AD5246_005,
+	AD5246_010,
+	AD5246_050,
+	AD5246_100,
 };
 
 static const struct mcp4018_cfg mcp4018_cfg[] = {
-	[MCP4018_502] = { .kohms =   5, },
-	[MCP4018_103] = { .kohms =  10, },
-	[MCP4018_503] = { .kohms =  50, },
-	[MCP4018_104] = { .kohms = 100, },
+	[MCP4018_502] = { .kohms =   5, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_103] = { .kohms =  10, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_503] = { .kohms =  50, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_104] = { .kohms = 100, .div = MCP4018_WIPER_MAX, },
+	/* The AD5246's resistance is D / 128 of the end-to-end value. */
+	[AD5246_005] = { .kohms =   5, .div = 128, },
+	[AD5246_010] = { .kohms =  10, .div = 128, },
+	[AD5246_050] = { .kohms =  50, .div = 128, },
+	[AD5246_100] = { .kohms = 100, .div = 128, },
 };
 
 struct mcp4018_data {
@@ -72,7 +85,7 @@ static int mcp4018_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
 		*val = 1000 * data->cfg->kohms;
-		*val2 = MCP4018_WIPER_MAX;
+		*val2 = data->cfg->div;
 		return IIO_VAL_FRACTIONAL;
 	}
 
@@ -125,6 +138,10 @@ static const struct iio_info mcp4018_info = {
 }
 
 static const struct i2c_device_id mcp4018_id[] = {
+	MCP4018_ID_TABLE("ad5246-005", AD5246_005),
+	MCP4018_ID_TABLE("ad5246-010", AD5246_010),
+	MCP4018_ID_TABLE("ad5246-050", AD5246_050),
+	MCP4018_ID_TABLE("ad5246-100", AD5246_100),
 	MCP4018_ID_TABLE("mcp4017-502", MCP4018_502),
 	MCP4018_ID_TABLE("mcp4017-103", MCP4018_103),
 	MCP4018_ID_TABLE("mcp4017-503", MCP4018_503),
@@ -147,6 +164,10 @@ MODULE_DEVICE_TABLE(i2c, mcp4018_id);
 }
 
 static const struct of_device_id mcp4018_of_match[] = {
+	MCP4018_COMPATIBLE("adi,ad5246-005", AD5246_005),
+	MCP4018_COMPATIBLE("adi,ad5246-010", AD5246_010),
+	MCP4018_COMPATIBLE("adi,ad5246-050", AD5246_050),
+	MCP4018_COMPATIBLE("adi,ad5246-100", AD5246_100),
 	MCP4018_COMPATIBLE("microchip,mcp4017-502", MCP4018_502),
 	MCP4018_COMPATIBLE("microchip,mcp4017-103", MCP4018_103),
 	MCP4018_COMPATIBLE("microchip,mcp4017-503", MCP4018_503),
@@ -209,5 +230,5 @@ static struct i2c_driver mcp4018_driver = {
 module_i2c_driver(mcp4018_driver);
 
 MODULE_AUTHOR("Peter Rosin <peda@axentia.se>");
-MODULE_DESCRIPTION("MCP4018 digital potentiometer");
+MODULE_DESCRIPTION("MCP4018 and AD5246 digital potentiometer");
 MODULE_LICENSE("GPL v2");

-- 
Git-155)

