Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105409;
	b=WzhMz1oy1FGfKv7n5iE53MPm5+sQIGve2JyUnCyvDnNqqknvfjU/fsPF+INxMK+iEmdT
	 nhEq6t4p7eLA+EpjZ1Xe+OE7IHsEHLy+XpjR/SxGmKoczVYIx5ynSLK2olNWzwVNziNN2
	 Nkd9fAdlVk/sfEorSKU+Rs5RzsfWJfKBAMzbUQmNfz3GqpUeeu/HKGmHb2qpnAKP4zc53
	 D1WJ0KIcfKanNcDszhRMCPpOCRMGeANZS6+uhDvvbHwANtsZ0xgncGTIafWOM9//uvKMV
	 A3JPHRfx8ggjerCID961hSs0tSdk0UrSoQTfWiQBaIM7dJMukKSPYLco4dFh1dNbsSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
	b=wRhsFMr5KrB9aY8T+n87HfgNERNc2IsGNKjjqjXvHm8lRyaKGT3a2U6GONuHH2z1ap+d
	 mgT3CsHHaWMNw1/LEgmsREm955qe/ErR8Grb0Mpeg+WXjxp+EexQcYZdo5R/6H7OcEjCI
	 nIUBrSLl7y+2A5W/aeXZf1cCCmivYcgKFK9C1k9m5vmMkJ50jeIrNvwFuPPzyE1nska6m
	 /LTYqJGEN23bYN/cnWHruwBlBD70Mg7Rl1NZ8yfxTddElu3chj7zIztek5lsxosXD3GPA
	 2xK1gMpaMvJWbti55FnjwHgqJkENX9yL89MrHJ1owiasLwmhWG27INN2b7klFVIHNog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ez0oGccC;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE660A2616
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7EE660A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ez0oGccC
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso2629188e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105407; x=1793710207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=ez0oGccCIQwAhOEXNUKq4s56IEy0Key822YezRkU3GlBMBzMxj6sk7iUMGGKSFhI+f
         Te2gzPvCY286PbONIgL9EKJvrxdMru9G8rdz5dZayZqtX1YU3uq1p2YGC4y4yV7Mi/54
         mF7weiIuV2V8cwgez4F+iS6F5PbHdv128WWUuCOxz1yT8RFIktAvQGwrFzy/7couGtMA
         sXB5/VRlJXxGRhi5REiehlpoUlFDWYWOfHxiNhheodEl6ncPNKqRGSs+9l4iSQA+09Ez
         bUIKzTtcDZihGP44DwSZU8dfP5tH4GQX6jEFgjiHgdDzEOI3SQJtcB5vomFk6C7R6Y18
         kNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105407; x=1793710207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYHn/wr28N2yNDPHhw1evl1S59ARQnHWvpuXjgekTs4=;
        b=Tn4XxinQPFLnwLUGYpLgNFGot7NOpThLODVTqsQ8S59SaSzEZ40QhdeLXDtUczdngK
         /mKkfpEmOkElqDqyxR+IQbQgXe6R7LRxCwddYnI4Siva8zVyzcTtX8CYyRJb0xwoITF0
         rKh+4spylXyjIgAyNSe7SGyoyZXKXg1NLEYSP+SuDM/NWIUdwBdljJ8dco4koGod0TUi
         IY0B5Ig+SmDzIpi8/0L9AwdEPxI2LjwDEk32IiCXSF4xsCyQ77tbIptaFf1CPrM9803y
         J8aHCVuxDzCvf7smof+ophYMblLoFxE5p/oSrZmJ7E02AmW57l6/HPnV7cdAEd59JaH9
         uO/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcfl7mWp4tjfvmKV0ed/dykuzbdhJ/mE4aJYMKv1VfgnXZ0pcZZIzle/DhxMtO+1owuEHsVDZHFATADjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvIm1h2Ti3K0G3h88JaMYkXdDQClZErKVq07bwlCGBQpf4J9YA
	osXo79A0mkkggiSbYaLoy2wOAgA7wJO200ZsZCrskb0xqLzfG9hkoZ+D
X-Gm-Gg: AYBFou1hVq1ELuiFVbnYsoSTlg5V9ed3u2RBUHnqexcGkFZMaokFnxSdRnzwWGHBWMx
	ZCfpA8TtT+9RPNbXWpcv/qJwe0WdsdDRj8M6s3eAGU2yZ2Mf+7OVbrBsk62n5uzBwfNAtsZRhCm
	BSS3B7lma3Leo9fjCMZ+GXZrwyjfOe8es9WSGGsdh+/WD+iFqYxa34c8qvGa+iqckrjn7UIv0cN
	v9ZaHrtSJxDP7rEa5yL15/qI90ksy8gp5+iF1eNEQz/GPbtdTWt+TPaAiC9Sdje+I/4d0tu0oCi
	vRgpud6GOaXLEXDzz7g8a4jS/aqsBw6yPDip1jV6uLdud4akyHh+BiAHDEBPa9UoiXUu0p6LNt4
	q5wtOl6sPX9DcrAYJqrerhIcIhuhM+9Csa3vWYhBLHX4ed6dLeZBFZEqGxeAqhVdIxfB0mDxXSW
	HqStaW1J5gClU+hpmIr1sfSD8rHAJ3iZEhF7/oE0ylgv0jVLdnwRDR/devMW5vEpJ9j6iL/ZHzF
	0vGezI7Pv6zSJZ5qVhGFZFX/skcf1qMkg3F+XVtfgye0b00Q1EoBFoWvD4Anex5Yp46ncbW7dH9
	ih2R/jJY0IpulsruBxDdhI+ZL2aFhqmkF0bdVO7tLAtlJhl6Un6RNR46Y502rzweJA==
X-Received: by 2002:a05:6512:3409:b0:5be:50f5:f789 with SMTP id 2adb3069b0e04-5bfb71c4555mr3678914e87.45.1793105406758;
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:06 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:49 +0200
Message-ID: <20261027124954.110697-5-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
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

kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
and kx022a_turn_on_unlock() releases it. Annotate both so context
analysis follows the lock into the callers.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/accel/kionix-kx022a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-kx022a.c
index add89512af79..a132af87fb5e 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -484,6 +484,7 @@ static int __kx022a_turn_on_off(struct kx022a_data *data, bool on)
 }
 
 static int kx022a_turn_off_lock(struct kx022a_data *data)
+	__cond_acquires(0, &data->mutex)
 {
 	int ret;
 
@@ -496,6 +497,7 @@ static int kx022a_turn_off_lock(struct kx022a_data *data)
 }
 
 static int kx022a_turn_on_unlock(struct kx022a_data *data)
+	__releases(&data->mutex)
 {
 	int ret;
 
-- 
2.43.0

