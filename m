Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862433;
	b=RSP9NcWgshgQ+UZ4KliC9vucqbff3Ln9zqgrxxVkF885+Cv7SKMxuFvdnAWzykD5qrLk
	 FkVD0zomfxV1nz3pO5WCPLXDMyUG5tM9dOVHVdj9tfkJMAftBfBsAKCXegtkHz2eQpyCu
	 Pz+eJ6NadbQ2vhcu5BPLWmi8A6YYNm8NH/rQEwb1U1juEAcrWdUY4XYzzRrukcBsAyeHl
	 KLVuHvIfVxbPkHr+vweZXC3yctW96TF8J+oFKMuj7C/kq4MpesX73rEmvqTTn0+H+r8D9
	 CLedmvS0YgKKPzUbTDY0tqfO+2wYhconWhhP8hadE+R8X/xPwp5noDOlGjj7+bbdTxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oLtriKjTvSSHrsef7Np3jMgnZ+Hl7Owr5a+y0JpAEig=;
	b=OBGoYiegdF0vJ5Uk98C3TjQDvEtCwItGu1ZyNHxpuNq5WagaXmd5IVOJlyLo6PB3tCRl
	 FoY40HHJes5bLXoIjeD6u+HVoSrT4f2/r95FAXOZ8sc5zV/gHrxIw7/xRB954eIhyM29S
	 IgNWc6rovvj95EH50S5wOqhN4JaEMS856f7L9aMgN5nuSwDIV/evAg49Lue00k2YrZ0pM
	 AuKK/y7/LtT29tYqEPa4YfKD8mIWipucJCcsXh06vunef+C+h+2nQb9TRsJdw5Zp8HyLB
	 mq3LQ1hKc2f+dzSwWtQmAgYVww7NmNiO+QqdskduJ7Vq4lZpiwwxmvz0U6k/u9o2odg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJ7Y3AFN;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0336D606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0336D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJ7Y3AFN
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so5661691c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862432; x=1795467232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLtriKjTvSSHrsef7Np3jMgnZ+Hl7Owr5a+y0JpAEig=;
        b=TJ7Y3AFN2mQOWIbXoIbygcGFIeOTdYnH2URceY/WJFdyf+bMQD+mYAJIrRPC4h3YfA
         NMBXffUDVPbIjQ709/3XtATSDVDATK0bIbHk5ZfEvXiUuxJMnuC3EYOmP6lA66PsPhg+
         MWRzqrEWfZ4RrYPDdbJ+5R4qbNXHYp4AIVsds/1QyGChOpYdEtyHJp2HAEuSEa2Oii1q
         rAoufgP1M0G8/XartnNVQ8c5229Hniax2Dn4AY9J8U4fcfzd6qRxfVus+elB7Zt5Ke1v
         AXQJVBt6rCbWmiWa1m8Xah/lP+l7bHVEgd1CcAuZH4H5cYWee0CoV4CsKt8vC7+4F/UI
         AjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862432; x=1795467232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLtriKjTvSSHrsef7Np3jMgnZ+Hl7Owr5a+y0JpAEig=;
        b=TUgGzW9xDkNODRALR5YSKTnMIpOtuoOvlidBULz/WTZMg3ZdLSRoygRnx+PO2Ca2ke
         CMNuBvAmAYQaebFLahN+/vXfY+1wQQhuO/hifK9kXzmeG6+ip8JxjuS/S3/eK9HONlXw
         EQ2AflWPy9dnoGVogU+aVQQNv7skTewftcVwulC+V6FvV7DFEGrT9E1j2Rz5HLbW96YA
         fHqCgIX8v8ZZCY6Koc5d7IMncRHYdrV9YV6vLSz/7Vo5Lq8L1J9v5Za3LFYLsp0h2Hd0
         0mSaf5cB2qedOxRwpe9ZaEZOUFn4WxiAg2fbYpuhd2KbTr3WwIxKD/BWaUkPXU5B3C9F
         L/yw==
X-Forwarded-Encrypted: i=1; AL+hErGFtlilPtORcGTwzw5AhHyYTWIak00H3AF0gI5yhZKxKq73VeiTpFX7Fh+CXYMlvMzSetbWoUr2gIRLZ0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KdBu6kEg5joi419sMkBDITXy5P72NS8zKnw7lVe4AeWM5wciJ
	OfPfZA9WO3UaHEwDYoqrEQk5YjLSnUaDggWvpuML4bgqbbvDmX26NSMr
X-Gm-Gg: AYBFou3VrIKb5H85Oa6cDrCjKmXaNuECZISSof4sn5AwDFg96r6LrnpDsfTKiuDJVmI
	4/gH6ZDLkK8+XUVxuIR/C1//di//bDPevmx/0mvhVumf+nJmHwS9T+jJR7siwIhEf39L7nimfNu
	62LhGdhjY6GS2jYQ2NEmOdP1NMy97h2t2aGcaWerLFn0SaY2LWlameC1eXhPwMZolvzD/KFaOHc
	22R3GOib+npiMAvEpEeKozuYwVAVidB0CmQztt0pSNySjWXcyqnoN4bCPVXvnqy/1SnyxaoJQaV
	ZZgMeTZEUskh+WRIdb298Mlywdr0PvSZV03KlPKYtatzIArasvPzn8iLwZ6Qz2uQ1hkoZen1szl
	aKsZri5IIH0ZFl+mG5A7ML3xEdol429aAQDm/WSeALyh6XzNxtNwvxHsNhQxhzIoUvntj0Vsp2c
	kj9Cu+/M+unHFNXiltxw7anScUCjcNcWH02Ex7/Zxa/a04bOWkWOqraxdWsqSfakdQTq9dC9wEs
	tBh9xQjgFzoaj63th1n2G1hE3qDiWn/SHoarz90Iv68ks7PvjxywPw1WOljFw5q1wq+SyhToAqA
	pfga0/tHnnHLfJLB2m5SR7j1PkF47gpHrRSwO92vSODULdkTxmqIOCE+y4ui4Ht1xXVr/Jge2W9
	GQk+LYAPNBYPnVwTO+WDacdOficxU6xNE5BqHTCvg6V63dK9a4V2lC3lEnhBGHCDToMMVg3yGRE
	UpIljXyyy63I5cuXqko/JEAEwORbvvJYTMws5A9evRqQ==
X-Received: by 2002:a05:7022:286:20b0:14f:8d59:edcc with SMTP id a92af1059eb24-1b5030d4057mr11251768c88.12.1794862432024;
        Mon, 16 Nov 2026 12:53:52 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm15293497c88.4.2026.11.16.12.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:51 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 4/6] iio: proximity: sx9360: fix hardware gain encoding
Date: Tue, 17 Nov 2026 02:23:12 +0530
Message-ID: <20261116205320.26070-5-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116205320.26070-1-kapoorarnav43@gmail.com>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com>
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

The sx9360 PROX_CTRL0 gain handling was copied from the original sx9324
driver and has the same bug that commit 108e4d4de2b5
("iio:proximity:sx9324: Fix hardware gain read/write") fixed there:

  - The gain field holds ilog2(<gain>) + 1, with 0 reserved, so a gain
    of 1 is 0x1 and a gain of 8 is 0x4. read_gain() and write_gain()
    use ilog2(<gain>) instead, so every gain is off by one: writing 1
    programs the reserved code 0 and writing 8 programs a gain of 4.
  - SX9360_REG_PROX_CTRL0_GAIN_1 is 0x80, which sets the reserved bit 7
    and leaves the gain field at the reserved code 0, instead of
    0x1 << 3.

Semtech's own SX9360 driver (shipped in Samsung Galaxy kernels) decodes
the field the same way, codes 1..4 as x1..x8 and 0, 5..7 as reserved,
and programs 0x09 (gain x1, bit 7 clear) into both PROX_CTRL0
registers.

Use the same encoding as sx9324: add one when writing, subtract one
when reading, return -EINVAL for the reserved codes on read, and build
the default with FIELD_PREP_CONST(). SX9360_REG_PROX_CTRL0_GAIN_8 used
by the range check in write_gain() becomes 0x4 accordingly.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Link: https://github.com/TeamWin/android_kernel_samsung_d2q/blob/master/drivers/sensors/sx9360.c
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index d102e20d4084..9ba967a33c98 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -64,8 +64,9 @@
 #define SX9360_REG_PROX_CTRL0_PHR	0x40
 #define SX9360_REG_PROX_CTRL0_PHM	0x41
 #define SX9360_REG_PROX_CTRL0_GAIN_MASK	GENMASK(5, 3)
-#define SX9360_REG_PROX_CTRL0_GAIN_1		0x80
-#define SX9360_REG_PROX_CTRL0_GAIN_8		0x3
+#define SX9360_REG_PROX_CTRL0_GAIN_RSVD		0x0
+#define SX9360_REG_PROX_CTRL0_GAIN_1		0x1
+#define SX9360_REG_PROX_CTRL0_GAIN_8		0x4
 #define SX9360_REG_PROX_CTRL0_RAWFILT_MASK	GENMASK(2, 0)
 #define SX9360_REG_PROX_CTRL0_RAWFILT_1P50	0x01
 #define SX9360_REG_PROX_CTRL1		0x42
@@ -289,7 +290,12 @@ static int sx9360_read_gain(struct sx_common_data *data,
 	if (ret)
 		return ret;
 
-	*val = 1 << FIELD_GET(SX9360_REG_PROX_CTRL0_GAIN_MASK, regval);
+	regval = FIELD_GET(SX9360_REG_PROX_CTRL0_GAIN_MASK, regval);
+	if (regval == SX9360_REG_PROX_CTRL0_GAIN_RSVD ||
+	    regval > SX9360_REG_PROX_CTRL0_GAIN_8)
+		return -EINVAL;
+
+	*val = BIT(regval - 1);
 
 	return IIO_VAL_INT;
 }
@@ -612,7 +618,7 @@ static int sx9360_write_gain(struct sx_common_data *data,
 	if (val <= 0)
 		return -ERANGE;
 
-	gain = ilog2(val);
+	gain = ilog2(val) + 1;
 	if (gain > SX9360_REG_PROX_CTRL0_GAIN_8)
 		return -ERANGE;
 
@@ -663,9 +669,11 @@ static const struct sx_common_reg_default sx9360_default_regs[] = {
 	{ SX9360_REG_AFE_PARAM1_PHM, SX9360_REG_AFE_PARAM1_AGAIN_PHM_6PF |
 		SX9360_REG_AFE_PARAM1_FREQ_83_33HZ, "afe_param1_phm" },
 
-	{ SX9360_REG_PROX_CTRL0_PHR, SX9360_REG_PROX_CTRL0_GAIN_1 |
+	{ SX9360_REG_PROX_CTRL0_PHR,
+		FIELD_PREP_CONST(SX9360_REG_PROX_CTRL0_GAIN_MASK, SX9360_REG_PROX_CTRL0_GAIN_1) |
 		SX9360_REG_PROX_CTRL0_RAWFILT_1P50, "prox_ctrl0_phr" },
-	{ SX9360_REG_PROX_CTRL0_PHM, SX9360_REG_PROX_CTRL0_GAIN_1 |
+	{ SX9360_REG_PROX_CTRL0_PHM,
+		FIELD_PREP_CONST(SX9360_REG_PROX_CTRL0_GAIN_MASK, SX9360_REG_PROX_CTRL0_GAIN_1) |
 		SX9360_REG_PROX_CTRL0_RAWFILT_1P50, "prox_ctrl0_phm" },
 	{ SX9360_REG_PROX_CTRL1, SX9360_REG_PROX_CTRL1_AVGNEG_THRESH_16K, "prox_ctrl1" },
 	{ SX9360_REG_PROX_CTRL2, SX9360_REG_PROX_CTRL2_AVGDEB_2SAMPLES |
-- 
2.53.0

