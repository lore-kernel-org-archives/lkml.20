Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792864918;
	b=1BMIirkUXPRfCkorxjlpmuLleITvF/I5UwTts+7FPIJEdVV3txAhb0YRQrMHDiMdf1l2
	 qCaagC3nnZISm7Zp18M4S0cWbp8ozs48LSEijK5ipg6Lvbie/byYgRRNr2DfYM4dDPcHj
	 53JgfOwPf7+tJ6G/Jpbv2H49Fjn55l3BKzllmI2I4++NelmWSqOr5QZaZFaRSKs1LSbDs
	 E+b2S1at0uoGHZvFUYRj7JMA/yhFLiz/fGZBA2yOdu15sXY3D5d5y2TstBNA0+FZW481t
	 11N8fSoYj7zWvCD0Fl3nlMfPvHlMRWbFik/OAp5R+VMJlponw4tnYErfPeypKe0nquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792864918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aucSs4M6EypPpZv9kMX/hXOBtI8X6mI9msD95/jWcCY=;
	b=RFxZuivhgsQXrYVw7QU+EgP6Cco6wcVl/vkDuAwzr6K7to4JR9QmXkCNuZgBwvBW5d60
	 hmQFULXY/WAH3ZUkhbkP2XNImOjEfXTRu84SyeBzEa8W4eI5O6BppOFSXKp9/MTTir13O
	 KtLPe8Hq+FUI3FkqsB8YzqXnPNfXjzpn9KrTSamZ1wKpUNfOZ1+jI/YeOO6fImXeIxAfw
	 5WCQmT2HWt2KKCdcA1lTQIL8aBz4Fv1QopjrqYSz9FRG1NfTq7ZNnNXTx4nsveZZuQxcn
	 A9ZcMd+fRUSSK/CExM4bateJ9ZQerG+wnNCahee4tnvqRq0XS8Lxr+v5OFVCaMg2b0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZUbm0Chs;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A039606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A039606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZUbm0Chs
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so2925195eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792864917; x=1793469717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aucSs4M6EypPpZv9kMX/hXOBtI8X6mI9msD95/jWcCY=;
        b=ZUbm0Chs9sK2DY6EH08oe+6eNZ3kcAtRBPWIzGjviXzO0r8qmh8K4NTeUTSymShQgq
         zyGAqD4jHQMcj91d7okNW/6RcRHyaDWtYddKANjJhWIoeLczeWn20K2XpO5etx2WD9Hp
         8776r/rEG+tXnTRXxLQ4+DPvDUxbWtUpZCTjWFcNIgWkd1XUY+r9VRV81AQVFTAMOzEH
         Q5L63h3wdBKTEOG8gQgaXN3x5x7/GSgzw2Nyds5pasRnMrB6Ndqj8EtKumPo6xiHHb+U
         AtJIwYrd3CZ5p/Pk+jJ1qn0E/Geq4Ags6JSx6gTc6PA5zoBo+uVlnxZ+z3KlOA78T/oX
         lI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792864917; x=1793469717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aucSs4M6EypPpZv9kMX/hXOBtI8X6mI9msD95/jWcCY=;
        b=0rpPzWSUlqEqNiVi8+gPeHG+kblBoqzAh0YFNnxwtP9VImXzWHxxa0TMMy60iXCdEo
         sTtC25cG/Iq319Q1y2OgSf3EOD7Sv12jwUwX2t7Ti52Wsr7LFqb2IuSwD702/ay25V3e
         3WO3vwHa9QHjoYi1nKEWx0i4uIDYSoUisUkwVVd7uFS5iRLjRTS8TvBzfH8Vgmx1JEII
         JfG6gcn5kk3uH1X35anfffaN6JaD8WUF1r8GR0/AFmdg3WKGTe101ycncKUv66g3clsC
         OEAdELqA1pC/vcUJmWMuCEE+wQ43ptpUwdpjP63VCOHGpkYwV6SadYnAbWMs2Ky3MDP6
         40lw==
X-Forwarded-Encrypted: i=1; AKwUvBzmBbnhbFVsPkEgVQTbxqkfzc+E3Ci5IKUXc1VXeZbMG1l7aGZOLL9Opkg0FtsQnO2nmonblqulGS4MVFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ+K0Ni+8wMWMEJFcyBQv6kBRurT8XOTF/40TPKJTaDB7YqedT
	4BtgsSLgDx+NOuHiVjB2p1MVYIZMbOH8vspw71kMtw6XG6Cf2CRNncs2
X-Gm-Gg: AYBFou16Qa4iYi6TdsEl499Fdm9NNrlQ6OK5Kf3e/hF6AQWPqx5faHazh2XMJJNqSHl
	Sim5iO273hXFAIZcOw+UhFkAIiUt+Dz9ykVTb1zbzeuIpVPJQNI17huInvYPFJBSx1NtFcqMNys
	jDsWq/3V+BjVgBjMWYTsPTefH3Fd1Ch+zQi349BQRzbYvce6xi9IaGThnTikgT/y+L2VcNrquxn
	vwC5j2BQqFWbPpTl6oLZpHWB7RxPGr6Y+mTUu366M9UxUuB2NYw9xEjXC1S0xECIbpPg1P1KNuX
	osX1SmhWlUZja5WCNvAqUgunasK3vRFNGd27vGjPr9ZmnemBf9AFM+lLCNk3qBkIQyKk54R4rNq
	IVeiPrHE3ak9EwniMrTjnfy1ZFbZnD1k84mKF2PorqCmOAl1IciocdhaQ34+HwCLOJZgLfH6iwE
	Oy3DBVJpvrooJyjTDjfg0rqtJ+Rl2gFJVKbCjcPq/obMrbZd44udhzZ8XZFFDa3CTExFWZyJHDj
	hBhiKTovppLV1mcxg5tlRIEGaoF7JmkBUbPIcv5rghB6HqJTT+l2XwCcjkIFfBhXHrFqS+jby1E
	PrY9zhmmUnqCYIZlPcqf6Yt5M71vc3O1ZBItBcIGLyjM6Y5xmrrfIoFtN67nF2pxYTY0Zn1LlKj
	WYmuUxyVh5qs=
X-Received: by 2002:a05:7301:5501:b0:367:68c:860d with SMTP id 5a478bee46e88-369e84a5128mr3927448eec.29.1792864917278;
        Sat, 24 Oct 2026 11:01:57 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm9065191eec.20.2026.10.24.11.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:01:56 -0700 (PDT)
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
Subject: [PATCH] iio: proximity: sx9360: fix sampling frequency write and available range
Date: Sat, 24 Oct 2026 23:31:43 +0530
Message-ID: <20261024180149.144609-1-kapoorarnav43@gmail.com>
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
Compile-tested only (W=1); I don't have SX9360 hardware. I round-tripped
the new conversion through the existing read formula in userspace, e.g.
9.765625 Hz -> period 50 (the 102 ms default) -> 9.765625 Hz.

 drivers/iio/proximity/sx9360.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index ed83d809ecf5..d076de19b9e7 100644
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
@@ -383,11 +386,24 @@ static int sx9360_read_avail(struct iio_dev *indio_dev,
 static int sx9360_set_samp_freq(struct sx_common_data *data,
 				int val, int val2)
 {
-	int reg;
+	unsigned int period;
+	u64 freq_uhz;
 	__be16 buf;
 
-	reg = val * 8192 / SX9360_FOSC_HZ + val2 * 8192 / (SX9360_FOSC_MHZ);
-	buf = cpu_to_be16(reg);
+	if (val < 0 || val2 < 0)
+		return -EINVAL;
+
+	freq_uhz = (u64)val * MICRO + val2;
+	if (!freq_uhz)
+		return -EINVAL;
+
+	/* The register holds the scan period, in units of 8192 / FOSC. */
+	period = DIV64_U64_ROUND_CLOSEST((u64)SX9360_FOSC_HZ * MICRO,
+					 freq_uhz * 8192);
+	if (!period || period > SX9360_REG_GNRL_SCANPERIOD_MAX)
+		return -EINVAL;
+
+	buf = cpu_to_be16(period);
 	guard(mutex)(&data->mutex);
 
 	return regmap_bulk_write(data->regmap, SX9360_REG_GNRL_CTRL1, &buf,

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

