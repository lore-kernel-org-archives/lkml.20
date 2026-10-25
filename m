Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792966372;
	b=DtUFcv39ys0fpwXYGyFRngGZH8ccRU7Sj9dC4XxsdvSbb1RXfemqcOnCc3/7h93PLNlT
	 YmDQV4GnGPeZo/vDXKbA3QnHcIfVThsoex37TklmbHRZ95N2Dur1v/MFw7cLj9Ef55ZDX
	 0+uBrkczwhImMdkHZVezDgBT2NG+hYrUNKtrRTwtmhGJveRRHfFwwJNtEuVe0Fgg7mG7X
	 YIA8Pst1IouJdLapoDDfLBBUotn2LBlwYEKbXzHDJQMqFnIrUWMfGPXX0peGrmXIN5VgD
	 Ab2N1Fx/3q/FrPORwuMrp63slC1kIHlRvAXbwhOOlm1SPWIqEt3vmx7i1XhLb+hKfEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792966372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8qE5yHTBSvCqq9ep0eRR6fh7pY27XkCysxDq9OCORyA=;
	b=ia75kIYGKngcvogSZcgOz78OrQJozxGJ2wCknwBCI7BxjtTGqA/brrhbaCTYEm1W1lUf
	 fdj/qHJHNNb+hBnAA/Z3CpJPAPT97K/dXNJfRmojU7GAG8PGlDTEFlseN+3HWLuLoHDYB
	 IJHdUYqZ4i45v4XPk2Mky1wylwsI2buZFJjcqqQ6aFz+IPRy7PYqNmEzx4Z90GqzMf23G
	 83q1vTiYni4N8pSowczl520lDGaquTm1io+bc9dzG1XWqlLa/rnsbs58T6pF65U1RJznH
	 zFrTf4fwLKJpalh6F7UrXXDaO6mPMcyLLjkHfISYAj6I1YnwTCN+rUzps5FpPkjiFPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eEFRLhzb;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44035606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44035606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eEFRLhzb
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so3841034eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792966371; x=1793571171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qE5yHTBSvCqq9ep0eRR6fh7pY27XkCysxDq9OCORyA=;
        b=eEFRLhzbc7gMz7bX05skDFKPkhF9qncMCXVts+Wc+K5PxFQnElI6DtyZuKddt8qE+O
         WjtB4knNGDdEKJ4zEFSY+O1FYJiWAGjDSrdZbeHQjNU+IjNCGaw2Uq02d5y3lbjZZNry
         c9I90PmWGonztfN122vZ+P8GQET8vlkLO7VFBWjnPr/Y+8yTgRdO5cMC/Nm/poGtPa7S
         AqxtVM7x3vtIAt5h/Ved8AegC6RwI+a8dETIY+VCZarLjXFWjSb16HOvYeRJx9sEfdtQ
         UNHk6JC7PDPon56slL8cq0/cEv/bAPTzTxUDA+JCHEbIuvjR2DZir3cbPZA0YnJdSDRw
         ggnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792966371; x=1793571171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qE5yHTBSvCqq9ep0eRR6fh7pY27XkCysxDq9OCORyA=;
        b=dZ6PvmDhF+/DZ6xjbp0piAMNnvEDa/ZWFt5B9wXP7UG444EWwmx0xkLJ7zXRuX6ZOk
         bgTySt9lmxiaoenDcxjSBBANjwnJqycZhNpiw3FYlUlCchQ2Z3+plkdUAi0ExApDh80+
         AQFsgDKnvH1yV3SJrD9ViLhPLZI0SguzLsJny+v56wed/AMWzgHZTNAYLQGCnHVnhXwt
         V4MoqxJTRui6GIwC/llY1p29C7vdTJaGnw0LeLedzVqnXjtYXejeuFSMpIeVkYy1LCU/
         Zm4CCMAJ0AqZgeZbhz2JD8ZXAOkbG8yaxe+JWR229I2NRK8m4jIGDOJ/FmGeLOCbWYIe
         +vbw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ41LWHv8qHi+/T1H4ZW8gHr84T0yDmFKXfiSqqaChYIwhVScjByvPXnKlysP9y3vHaeerXss4GBXjVwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQu2kCDvyNyktMMN07w7BUz/bTTfD1MnZxJ9jBhWWixnp7aUj/
	MJwGVwr5b9c5C0USbi+GUGObc/VRQSV3R1Fx7ddu1IIAlAL5Lu3uqdQmXvMEFEqClzE=
X-Gm-Gg: AYBFou0rduUOsznOa+ud5K+vzkLwFOeyt9pAPqLh23hSw1SQfFnQONfGGt2XxWcLnbu
	jEmNhfP7uahmwwv4TK9APRhpZuLcCXeyVFcg1A2pC+UE+xbWLK8+c9t6VJA7cpFOO9CzyqK5UTl
	ghiraC80eD2EBwE7TnmwRawm8byafGCCaJx0npsgDyr0/Z3fqFK+K9JsosdX4g4ZSJDJ6GEBijt
	G5OFcd9LJ+G14de03ak/J/YUBb07y3Cr/LSRG9Pt7jwxMQwZ2CSH7Am6QAMqheKoQmkummcNDrg
	M/1cd1DpJt1vbWnsbym+H2ntI3NHrtxd+QuIvwhbxQeeFdsXIgR7aLciM5x/A1Smn4B9L+z320B
	rohfdPR4LYbWGvtlI0lQAxeYbHQgptfTBNAP++HfTPuuzx+H1CN3u4u/it56xEZIyY+EyCvKk1p
	pBqW9+uaS8XHKGauZWqbimzK/rGr57YvJfLzsVxLEkUkSPJg9vwEO1AIhXfC+8PBKnoNrl+DzKF
	basDTAV0fBYxi1m5a1I2RMPrDPiEziR5ugJU9hxDpoRkPoGiROmWGrp7GZB4KiXfBAQDt2bgPxU
	0PMsm+eZww5nLx7T5voxC6vY56nK5MqiPqvqmLt+ZbLHdKx8qY5mmAyF+/vVwN7UGCyoEAvRN4s
	Pp67+qWoOwTg=
X-Received: by 2002:a05:693c:87d9:20b0:369:987f:d15e with SMTP id 5a478bee46e88-369e8336389mr8021940eec.2.1792966371114;
        Sun, 25 Oct 2026 15:12:51 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm16525779eec.4.2026.10.25.15.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 15:12:50 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] iio: proximity: sx9360: fix sampling frequency write and available range
Date: Mon, 26 Oct 2026 03:42:38 +0530
Message-ID: <20261025221241.19596-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

GNRL_CTRL1/2 hold the scan period in units of 8192 / FOSC, but
sx9360_set_samp_freq() computes freq * 8192 / FOSC and mis-scales val2,
which is in micro units. Any integer frequency then programs a period
of 0, and fractional parts above ~0.26 Hz overflow the int, writing
0x10 to GNRL_CTRL1 outside the SCANPERIOD field.

Compute FOSC / (freq * 8192), rounded to the closest value, and reject
frequencies outside the 1..2047 period range.

The available range doesn't match the limits in the comments next to it
either: 4 MHz / 8192 is 488.28125 Hz, not 448.28125 Hz,
4 MHz / (8192 * 2047) is 0.238535 Hz, and (max - min) / 2047 is
0.238419 Hz. Use those values.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Rename period to period_ticks and say in the comment what a tick is (Andy)
- Rename freq_uhz to freq_uHz and use MICROHZ_PER_HZ instead of MICRO (Andy)
- Add a blank line before guard() (Andy)

Converting sx9360_samp_freq_interval[] to a plain int array is left for
a separate cleanup.

Compile-tested only (W=1); I don't have SX9360 hardware.

v1: https://lore.kernel.org/all/20261024180149.144609-1-kapoorarnav43@gmail.com/

 drivers/iio/proximity/sx9360.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index ed83d809ecf5..2a9b37df8f62 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -14,10 +14,12 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/log2.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include <linux/iio/iio.h>
 
@@ -43,6 +45,7 @@
 #define SX9360_REG_GNRL_CTRL1_SCANPERIOD_MASK GENMASK(2, 0)
 #define SX9360_REG_GNRL_CTRL2		0x12
 #define SX9360_REG_GNRL_CTRL2_PERIOD_102MS	0x32
+#define SX9360_REG_GNRL_SCANPERIOD_MAX		GENMASK(10, 0)
 #define SX9360_REG_GNRL_REG_2_PERIOD_MS(_r)	\
 	(((_r) * 8192) / (SX9360_FOSC_HZ / 1000))
 #define SX9360_REG_GNRL_FREQ_2_REG(_f)  (((_f) * 8192) / SX9360_FOSC_HZ)
@@ -182,9 +185,9 @@ static const struct {
 	int val;
 	int val2;
 } sx9360_samp_freq_interval[] = {
-	{ 0, 281250 },  /* 4MHz / (8192 * 2047) */
-	{ 0, 281250 },
-	{ 448, 281250 },  /* 4MHz / 8192 */
+	{ 0, 238535 },  /* 4MHz / (8192 * 2047) */
+	{ 0, 238419 },
+	{ 488, 281250 },  /* 4MHz / 8192 */
 };
 
 static const struct regmap_range sx9360_writable_reg_ranges[] = {
@@ -383,11 +386,25 @@ static int sx9360_read_avail(struct iio_dev *indio_dev,
 static int sx9360_set_samp_freq(struct sx_common_data *data,
 				int val, int val2)
 {
-	int reg;
+	unsigned int period_ticks;
+	u64 freq_uHz;
 	__be16 buf;
 
-	reg = val * 8192 / SX9360_FOSC_HZ + val2 * 8192 / (SX9360_FOSC_MHZ);
-	buf = cpu_to_be16(reg);
+	if (val < 0 || val2 < 0)
+		return -EINVAL;
+
+	freq_uHz = (u64)val * MICROHZ_PER_HZ + val2;
+	if (!freq_uHz)
+		return -EINVAL;
+
+	/* The register holds the scan period in ticks of 8192 FOSC cycles. */
+	period_ticks = DIV64_U64_ROUND_CLOSEST((u64)SX9360_FOSC_HZ * MICROHZ_PER_HZ,
+					       freq_uHz * 8192);
+	if (!period_ticks || period_ticks > SX9360_REG_GNRL_SCANPERIOD_MAX)
+		return -EINVAL;
+
+	buf = cpu_to_be16(period_ticks);
+
 	guard(mutex)(&data->mutex);
 
 	return regmap_bulk_write(data->regmap, SX9360_REG_GNRL_CTRL1, &buf,

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

