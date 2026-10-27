Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105412;
	b=S5JdtmQ6OU2kKBRfPvUErMvIQMr8h3YNurSIpGOVuUkF18rkhoA+CxpiX7Qj2ZWllrMd
	 Xq+oMD3Gmzcb7RLfH68Qja1VRHg3QjiOJqOOKcnioKPd1KumMRqzGNIpIwXMv5PQ3PFAE
	 sYNr8bAkw/wnkDLaHD96KmwXzhINcmLWdWoculYNLA9zCz4r9qP8Ut0XA16giEXEqqDwv
	 DCIFXo6587hULJ9vfkvStuoIIpKEIpXMVNCiP86PRuOUcuvQBKVmevq7xZGG5Y50+sFDv
	 Qu9QWn47vA3CGrIoLh5aD1AyUvN/WPPJ2BlCVFIeloA/mZcrmrHCAlXj6eDvR+jG0QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
	b=QR5mfaj+0BnMMqNRBrXorK7uVtVMJZUp2kF9OyCDRgsWb+HOd3aIhMPcQzQb+Xmc/pVI
	 Il3Ik2wJw73DRma0RE9BCFpw3s+4a7/YEQuPdFqe6b0RY98onJP90YRHx0jgAomT9nIqm
	 DM0LQ+WO9zvBHrSQ/cJDBiWN8fTXVPA0W75F9Ilr7r8Qs+fv7lfFIF4l83kif+J0eTmee
	 /iD2Vh2gGz3HwEfwkRQ4GV0+4UGU8T50DU6zFhL6aEY3fHhMe9LEOJvmfBEkG5k3/prxY
	 TnwvNcmv+xw97AOxpUxlNARAboYDE0Z/wSop3OwrjHjJbHkw7Rsp+qkcResIFzpvM3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R5tOWkju;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCD60A381D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FCD60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R5tOWkju
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso1832114e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105411; x=1793710211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=R5tOWkju4v00bJxZmvuwB7/pKDsqkBAU/1/eg0Y2mI3+68zI0Mic91igIxblPKDv1G
         ITUYcqzhY/lj7Jsr1hZnifgKAqFARw15N52gxtgWV5Z4lGJVtKLPhp90ADC8Gm6jVEEK
         m7auX7ATnMoHARvtbiA5YgQdCiP6D2li77+Jjj+62l4UY6g5dncYC3HE6dOrlNYK9L/Z
         zF8Bd6Jya6/rQtR+dvCGbiZipSrRIlt4ttb3zUHpSQGM+8ankrnZ0WxqoNSuaIA9Hqkf
         dSbrLbL8x0jXh1KjkboyEe31U+cLqIgHffdPEUIIPx0GRNvxzr/TlbiR3a3NLsUgNl3D
         6Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105411; x=1793710211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sODvYeqV5gDMhpF3/tE93N3B3mOo+hnfsfgEpH0noQs=;
        b=RymLPnUZg/PflaJD/iKUm0WQMwwYlbO+g+qtuolr35h4jE+r0cKw4DscOGGZ6ke5oK
         977CQq3j5mrTP5NXuXEPHs+xogDT/evNxRhkxxfm92p2c+CAQNw4+7Zm7v1WOsNf0dnf
         t66F4v3NGl6QHwxOIIQjkf/GaHDCjW1BqQJIv4351elMyh7kuWK1jwCAxmc9oaopIRnN
         rgqjnvl0FsEPi8reVtW3J7QnAxjJkU0YX74iH8aTEkSXTeZ/64k4bfoajJZEnSCMus1G
         nTaeasFn3/nRq1T0Z55CAoVfskqbLWFxxdl7Lu8I+Zcru/ONhoXDA57JAyyx0B5jqk4u
         I2qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW+amUaEPpGDV1Ok/2VzYvdK5WY9lHzI0yXUF++P0dIP6lUA9U8LQgTxeHPehZk04c3mHXC/UJrjsNc7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb9hQfPio6NRetG0lNK9iWm1gB5Rab6lubZV/SSNgsG8WeQiNk
	k6o/oXlJ9pnoDGp81gYYoOfeuzs33z3h/bT39sEQ7gVdq4q3uoF0Gtju
X-Gm-Gg: AYBFou2x0FMSyF0atEON3MTTpmDZzUL3cbbuOz7dHRDxj5opc2TIBXTtXSNp8BEiHDa
	MNgdkJTCMElCckF3YGS2V+TdnvAVpR3D2gMYKvzQSMCgvF4iS9/fhGecNklmLIk+/bWzjGCtgsd
	17rFceXSxFVkZuYEtCswOf7JKrTGV8M+jgNBG+nulQZ5XsdPyiIaKue43MCcRoDHkvhxbhVddEI
	RsdNXVJMUa2tv/OhMoGNBhvorXHPZTDaobtEtAjRlVoPP18VB5bLv+KUg1YrtGouHAk/Kq9UWlt
	A4SppfIHf6Yzj+g4e7mfy9YSCH3f0ifuSDpPYiOaXga0bQXgAwLXcq5AiIBr7NOo2OEhAoineaU
	sBK5y8sqqxcrjRrW1Cc2MuoUy1ayPx2ux6YMsvGJUq32AYTuA74/O44Brnd1b76VcHyXgzw2Sxc
	C9s/WEaWgcRUBkLtdU8ReaAXMZWymnL9KbFInTm+0ZXafWxctD9JVZL84zMTMgqpAeMXbtv+4bc
	cPqpIIrhcjIsPpFlzM7NBYSo6V9QFUJbrQyW1YqD07YL1bf3z9jhXwwMfTSLIgWrMDyN+5h52fJ
	SA3HSLydXyoDBoErQ58q2LIuEV/dJiIONf1pY/2IDKx49iDDao+mxUy6D4gn37Jd
X-Received: by 2002:a05:6512:3409:b0:5bf:b963:70fa with SMTP id 2adb3069b0e04-5bfb96372f8mr3300311e87.48.1793105410585;
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
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
Subject: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event enable helpers
Date: Tue, 27 Oct 2026 14:49:53 +0200
Message-ID: <20261027124954.110697-9-zoone.rupert@gmail.com>
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

veml6031x00_event_enable() and veml6031x00_event_disable() call
veml6031x00_set_interrupt(), which needs irq_lock held. Their only
caller holds it, so mark both __must_hold(&data->irq_lock).

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/veml6031x00.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index f6308498e422..476ac3717f8e 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_dev *iio,
 }
 
 static int veml6031x00_event_enable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
@@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x00_data *data)
 }
 
 static int veml6031x00_event_disable(struct veml6031x00_data *data)
+	__must_hold(&data->irq_lock)
 {
 	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
-- 
2.43.0

