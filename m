Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013666;
	b=sJKUs1V4dbQba7I8/DA/mQHR9inb0CEuhTdbrPjmw1c3JtFMKAcDfk2LlndGoRM4fbwT
	 35Uydt0zWCMyJCdwoh7vczbJ/i3qxLvKxkpFgVG1gWsIZEklThAPYiKB+da9wlneUqag+
	 FHsRMnKXUTylxzAIwZF2PwvCkc5cqCtfKz+xhdI1xtJxirey9L7eQjZBufMlXl6Y+TuX4
	 PY5uQ3YIZGKfCR2O9Bk6TTSEgsUc0yz890vakpppDKQJTWisENEDZK8tOacI+nK2YyvnZ
	 jvBwOLidpJQpa5FNaesLehoSJIwwHWJXAzYPXwrGTWU98EeOL6TprDJF118kjFlpNMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S8X5Y9IyyBtIsxQOYjbqtgkv37Y5t4081jPR++5oDKU=;
	b=e3liOG6WOhf80NhQkVT/BFuaDz8csNEPIUMlSn1HP0h73g3ODGaU6ek2UWz4BclAcFcI
	 uUtdm/C4UC/ezUV4LkS5lI67FC6TGYW0XCp1O0rt0iCL8hgN/0U4ZjXAwq07yuOtYMgF8
	 uBMU87ySSC1hbGpC1p5cFwE472F7ippIaNyVm/GLN3wbT+QEmWYAd5ZdDgDzkRz+kF+TS
	 spxt73JcBiOAKtlIXZdL9Zohsnn4Tk902SRQaSDDowSo67njaw71KgMPdjX3GxIpwdctz
	 QSYofZWltxfmn40bVnDwntVoUJj/6eBcLiIg/6wLDn3fHJQGFDcynyksPVOod4oYj3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qn3OXI2T;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qn3OXI2T
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-156cbe59524so1988724c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013665; x=1793618465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8X5Y9IyyBtIsxQOYjbqtgkv37Y5t4081jPR++5oDKU=;
        b=qn3OXI2TkpgSCc2zQQsQYGigI9SKg13KpHmaQZbX91XloFETbD6AutaUOq8I9IMoI8
         ZAPwRKBkWuqO6ba7b/zuKAvIkOLOkJbeUAdGuzipkQGYeTFn489KbGV8WoPnc8a+5Z/X
         pd0PtZIRdTcjDOso0axbgE/8HFu4fp9TE0nTdzpXV74u784TVm+7UzglST3TEHHS9Bvu
         keTVUSnzipDca1Gjznbrl5WwZthyhJ6MyaRH2RxJniGID3bEZ2r0ldIv/GCKRwH9fZrO
         Le4dYHSVQ+osJ/XuTemzAxMeYVqG6B3a7pysiCmWsuel25vgJDdYXkJCBTVeMXTKWkH1
         EXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013665; x=1793618465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8X5Y9IyyBtIsxQOYjbqtgkv37Y5t4081jPR++5oDKU=;
        b=XbNxc29rqYyVpfkzbSsuNKa9Jn/ZRl7Id3piIDPIFWQ2oDWrqXMZ1UmA3H4j207J8z
         3fO7cwPKoXI4nnPbVQ5ezNM/HEouGwHG3Lt0Jz8gq/Vf5y66DFU3SyPRI+AW9IBzFAjP
         HICVDrSJ1yWpPHxmjErdiFFfhBGGHvgl8GXenRLxNjMg4aY/fhjmGSlp9fPDOW9e8ShA
         i2tAQDxzGF24/sXrDtDlkyI6NLzLLggpN0sMgrmoDrRrqt5K7mDP6EOkpCC0uG3lira5
         /2Zm+Gesn/EDOeel4A/MhSNhIgxaWmMzeoPf/a4zlAz0GQJfCi242hrqbAld0GJwo3Ow
         dgxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9uJi2nuVTL5p0n1eEI5sYipRwo9YJw85bKRc6mzLgzkiwHrzZfLU7h2Ss9Y8sqD1OE/FNcPD/1rGD2kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhTpZXtaM0GaNwLwBz9/b/AcfZKij0gbu8g69y+/bnlqQlPY74
	e1z8XHd7iypf5UIzuAbupYposAvKBNiRf/pYxwJyj5cZgh9yAxlJD/tu
X-Gm-Gg: AYBFou1QaSllBVKp98uRFARCCMe/K8ljP0xsx/jfQT7LNWjIrb7SzTnSisLyaJe9eVi
	WclE5MwujO/3uGxcAeQwi2sVUyMX1JBGz4G8Y7hhuKmEJ6wOFIZ5PVQmaNdkjdG4XaOqz/QN+0A
	YzZ22p+0EtnuE47QfQxHDNmfPCBOR1rAqw6Z92yWq2e6FXaCYRkb1IQ8lEbmHfjdeWDJgNa0hEI
	fuuJ+TR0YvuyrSsdLisypDQ/8iUC29kBBG5VAtn/c+FRyNDzqx3eYLSQ7/oBNLdT0W5YBDktvJe
	mRIYWTH2zP4EGFg06B+6eQiTpqGm03sOCC+VicOZ6BQpVP3Km8+Vn9HVEvNHcSO2IKG/AaQxPil
	ppKVMZV3P9az2AjdZD09GDlFGt2A4rm1RC1dBBxICqSKVafRR9h29B6bFQeVUlvNJsjCR9Ylu/a
	5DcLhP6dMHGey9jmNIGwWeOSq5a0ZxTXpxIK81RwGbYDWNp/uHVh1ilbMiHXG2tQZ3OwLeAQhnN
	ttnDNNRQzbARRUIHpYJ7Fr9F6AxH1WgyebnPeqt6dx39xR0wCgWF/RFCggdrsXgO0jw2bSmeWIp
	fD765KBy3RF0j1P3J7HJ1BL1LHZOzOqlrAinE4MLz0HQzUaQge6s7D6F17EYLkUESbzdrekyZTf
	br/EBuMPyOq4=
X-Received: by 2002:a05:701b:428a:20b0:192:fd91:c567 with SMTP id a92af1059eb24-19935906f80mr10413928c88.11.1793013664628;
        Mon, 26 Oct 2026 04:21:04 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm24469130c88.14.2026.10.26.04.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:02 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] iio: proximity: sx9310: report a hysteresis of 0 when it is disabled
Date: Mon, 26 Oct 2026 16:50:49 +0530
Message-ID: <20261026112054.59895-1-kapoorarnav43@gmail.com>
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

sx9310_read_hysteresis() turns a PROXHYST value of 0 (no hysteresis)
into a shift of 0 and reports the full threshold, which writing back
then usually fails with -EINVAL. Report 0, as sx9324 and sx9360 do.

Fixes: 08f0411c48f2 ("iio: sx9310: Support setting hysteresis values")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Invert the conditional (Andy)

v1: https://lore.kernel.org/all/20261026100041.16018-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have SX9310 hardware.

 drivers/iio/proximity/sx9310.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 79ba46d8a0aa..dc1b1c3f4776 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -446,11 +446,10 @@ static int sx9310_read_hysteresis(struct sx_common_data *data,
 		return ret;
 
 	regval = FIELD_GET(SX9310_REG_PROX_CTRL10_HYST_MASK, regval);
-	if (!regval)
-		regval = 5;
-
-	/* regval is at most 5 */
-	*val = pthresh >> (5 - regval);
+	if (regval)
+		*val = pthresh >> (5 - regval);
+	else
+		*val = 0;
 
 	return IIO_VAL_INT;
 }

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

