Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623264;
	b=3n+fs3TRh6ylm2LQ44XnSKcdWacV7STVWZfOqYUTe/BJ4d34V7Rk0ZBHlnr/OX46OrC+
	 QFVDqhGgub4NTG4fyznR9ntxSW6Udp3eu3YLX6suuEn8Z1XlsSGZ6Njbkn5LPP7wS1FTz
	 Pi3X2OgBaRKb4ZwGNtP0NFVneoJTWZ1C66cZKYnccejZ5C4jB4E1gjRFGU1j5LJ4t14Vy
	 Tivo0yjFWmBTkuAr4hsFqvPvhl190J0SWqxCGCBtzLlUepJZ8oR/aYR1J2nigh5nJOkKj
	 2uv+Rx1VYqUt8MTY3UGGOIWlQyAyMfgAGGoNoCzYiB68SERc7fXvfmPTIIi6w2K55MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M/HCi2uN/jq/lVCP/nbhRVGKxJtO5i3puDSAhzll2fQ=;
	b=p/8PUt4STj+ka/br8+A0sOPnk6qtOXmU8m0nH15D7KaHLmh/lcSMa6gFSFx5EhRGpBqu
	 MLVDwC1J8TfH7KHS7S3tgxVfT5rhnpZN7RNyQ+KEV3exa2ZeI25V+eIBOPeWBWuoGqpij
	 K6BKsSsn2aEyM8b2Dlg1d/VOq5BeZWMrvEih6QsZkdelkVqK0CTw8124xzx2R75r9QhBr
	 TADknD/0WYfcIVygy7mMO/e6brTpp35gFZLM1lrNrIwvcilNxWkc7c4Be+/BdmJNZXGaG
	 Urlc6t9HcX9E8EFJ4GBjkFSnx5LBsoS1Mq17hxh+mo13cwQ0Uxxwc7IxC4ampUsVfpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LULCyG0N;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C12B606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C12B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LULCyG0N
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35ef6b49813so1650345eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623264; x=1793228064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/HCi2uN/jq/lVCP/nbhRVGKxJtO5i3puDSAhzll2fQ=;
        b=LULCyG0NF8XpZRm6yFjaDBqK8WHmyzAGJg9YsvXN/iSa8G+WPnlvofYQhtYGP4qwJP
         VthbE2b9UlAWO7kz+Vd0PFLMrkgETeaIRIxi6+wd4eGQGro1eh6jlgG0sqyy/FRI1jRZ
         4XjgjgDtLLg53RSkMPNR1pUlM0h7h3DpMZfhSDAsk0Tt1/y7yCuxgnyIITci1scL8ujC
         iPqAUnlWI/xazld+rvOfOlRKcV/5fcjXNeJQbgs5ppmm/IXHb6hXFWKDvXSV3PQfOegg
         ZVkWreLBGibUbs+x5pVK7G2leAFuFlXVBz/mt2CTmKiEqDDMpJkhiPOg6nOUFCnqdeUC
         0/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623264; x=1793228064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/HCi2uN/jq/lVCP/nbhRVGKxJtO5i3puDSAhzll2fQ=;
        b=mhyU+sKC6IvznRV7/fQE4Q3Cmo9PhwpdtwWFLigZWZHO4rBLkq5ahRPrd3NNd7yV/G
         mNvZmQIcdhfLlghRZSfhjmBwVEfPq2CVQ/99dogdockOtOrQPpIlfOvH6wili5F0kreQ
         FMjubQmfOWl7ZppxO/GEUOd7VY4bKZ9tFaIXvHMld/okgG3bpnyvFf/f/J2vJWJYHZfd
         9olH1YrIQjzionOMqLn3KrVKxPMC1MWSt7BGk27q0HO6k8cCGyoOni6sVNV5oPie0mPn
         aBYbqIqHPQsyG24Xt/m8S8lkLn1uQfEwF/JOkW0M/2R4BTbPv6LrHhZeNWnfFVg/dNZw
         eW3g==
X-Forwarded-Encrypted: i=1; AKwUvBzyyZV4pj+PUzuUQySMopWHhUwEetfCDochumeUu2itfcSE7r1KbVV2fVspKoiPrfBd4/cIxUY930OkW9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIehL+X4UyywJgmLVmIaV65gcbiVcYHJlFhElgLePpOGRTrOIZN
	E4yxAWD5JS9Hf+y/wfEL9e1t0ZEfk0Gh2uNmLC/X4L7kbSvT7keXOIq2iVtKa09t
X-Gm-Gg: AYBFou2f3rmIBZZ48OD8Nrp5W3SHHkoqCyZuPw59x3OW//rCYnuWxrTBmk1W1Bh+q/f
	YPoa5ZYeqsvfByOQk52ReVJ5RIto1hF2gLbOqZSC3Ytpo5w3uezUU6K7GSFptkt0RhyBbIjsSCx
	lswFgHbdre8y5ywKgTxYPuiL94AOoPg78oufV4dtM5ioMUjw3b+J/hU5nofkF2cY/Tz0CMA2biF
	wZVFB1MZmvpJmAGv1hv14VDscLhJxNz2aujws0g9JbFldWHh/esgJVhA1YnnXORH405mcbLmdy9
	yRHgKZUGoPPqmOAIH9i4FGgprbXxoJWj/iSnQt5KeG6daa2YqJB2VEp8yCgnHKvNuiM0k9e2ooV
	gGKJ7NRqgyGXfz3dVDBaxAE7HHY0PRd0LcJcv0DEpYEyXVR/FGb0n/P4Unr+0rEpW/h0zp0L57J
	B4TS8hxuggFNM4bw3Vw6vFgNb3lhyiLXzS/ajEgk4c4XskDHZPBT4BcwfAHDmKeHf3+QCWiQ8EX
	A1tgZyFzoHlzk120sePXZtxWaq4jVHQmpz8BRCFynzXtATsEDKZceBIgoOKeZQOl4XULLf609F7
	LaEO52HhUEOZSypkLADpr/xoR0Ls4g5WViaqva+KqQW982AQIurwGBsRBSRUG843iauDftdo5Ox
	/PvnDMV/AV1NP
X-Received: by 2002:a05:7300:e9cf:10b0:365:b147:b458 with SMTP id 5a478bee46e88-3674b52acb8mr5389019eec.3.1792623263512;
        Wed, 21 Oct 2026 15:54:23 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ee692656sm439219eec.28.2026.10.21.15.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:54:22 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: proximity: sx9324: fix out-of-bounds read of scan
Date: Thu, 22 Oct 2026 04:24:11 +0530
Message-ID: <20261021225417.626946-1-kapoorarnav43@gmail.com>
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

The scan period of the SX9324 is selected by the 5 bit wide
SX9324_REG_GNRL_CTRL0_SCANPERIOD field, so it has 32 possible values.
sx9324_scan_period_table[] however only has 16 entries, it was copied
over from the SX9310 driver where the field is only 4 bits wide.

sx9324_wait_for_sample() indexes the table with the raw field value, so
all the codes from 16 to 31 read past the end of the array. The default
value of the register is SX9324_REG_GNRL_CTRL0_SCANPERIOD_100MS (0x16,
i.e. 22), so the out-of-bounds read happens with the default
configuration of the device. It is only avoided when the device has an
interrupt line, as the wait is only done in the polling case.

The value read is then used as the duration of an msleep() call, so the
sensor is polled with a completely random delay.

Fill the table with the scan periods of all 32 codes, which are the
periods documented for the corresponding sx9324_samp_freq_table[]
entries, and add a static assertion to keep both tables in sync.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 13b4ef2896e3..36ab83d3f493 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -279,11 +279,20 @@ static const struct {
 	{ 0, 250000 },  /* 11111: 4 s */
 };
 
+/*
+ * The scan period of the SX9324 is selected by the 5 bit wide
+ * SX9324_REG_GNRL_CTRL0_SCANPERIOD field. The values below are the scan
+ * periods in ms of the corresponding sx9324_samp_freq_table[] entries.
+ */
 static const unsigned int sx9324_scan_period_table[] = {
-	2,   15,  30,  45,   60,   90,	 120,  200,
-	400, 600, 800, 1000, 2000, 3000, 4000, 5000,
+	1, 2, 4, 6, 8, 10, 14, 18, 22, 26, 30, 34, 38, 42, 46, 50,
+	56, 62, 68, 74, 80, 90, 100, 200, 300, 400, 600, 800, 1000,
+	2000, 3000, 4000,
 };
 
+static_assert(ARRAY_SIZE(sx9324_scan_period_table) ==
+	      ARRAY_SIZE(sx9324_samp_freq_table));
+
 static const struct regmap_range sx9324_writable_reg_ranges[] = {
 	/*
 	 * To set COMPSTAT for compensation, even if datasheet says register is
