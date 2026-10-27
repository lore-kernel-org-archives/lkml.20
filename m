Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105410;
	b=T9Sy1xYR9ga1OjWaVWvHT6BBxNXP3LYYwQpyb2zipzS/FHLra3Im4dAK0iTuJaLhtehg
	 gLjLMbO6DQYtozGL6rUVrZTB0hJ4OqNJ2nd0fQ5729nKxidkUPej9XtDDTm1/Q8GCvYW6
	 HchKyOTuSgW1ABHGEraJbsoRA4boOjSyoK8n1SSqm7T8UUgHmh9852QdtrSmsZreT0lvY
	 TMTilKu8kHW/5OfLSZHIRODKSvU2ypMHmHiSRWBVyqSuyRDLd4U6NxFWkacP58PN5n+6C
	 lvHX7NKV3gIn0PrlxZuQ7EDJYwIf9lmLmMzxblw2zyRCBNLQm2wObPYvqmXO6eKaMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
	b=FgQ9qhzorOenetNydB5t6QblNmzxYFcD3pMbF5hFaxXnFHHL5byquVTqGHw4n/e5kG6P
	 t8z8BXxdnXzThouuJI74iZ77Z/5TJs/BH9OleMUIGke0W1gOU3PNSV4fe48BlxAlTcOTb
	 Z2aWoPhmAGoRTMeGv7BaTDsr9Yqd/5POKExiWKIQESRYD1bDRKybpju/RAvCir96D7aXg
	 XNId2RyaZ+vZd65rh6ZP/vTFxNpTcZRrX5MpBcbjZJm7zB7ABzMTld8VsB1MfaSMZ/y29
	 wv1jO6DJVPXP44ZT+Zfl9H0SuD2aF0S3mrBzKD0slUqnS9mobnokaw8lUCpsMRIkOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OUrL+4G;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00560A262D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB00560A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OUrL+4G
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so27119201fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105408; x=1793710208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=0OUrL+4GZOE8uUTEfdA96OGH/ToNP4d63/vuiTYPji/+otCz4ks/vG1EWxNvbamZSZ
         +iew7Dp+3NkgTOTPVfzlFsDV1vCHubeaxrOkZp5KMum46mDTgymZdVTCbNnu8SoZZl3i
         6pyW2zYTtTwr2gPudthxKg5wJiL5BgvnepW0CNZ9FWk40ur+KMi8bHlPZNQksCFQ3Yq2
         8KK/5HYUGQuRCc1+3YevwzQ3X4HFCj4Xa852iGmqDCFO/9xN1p+bOZQZ/G8pte/2s0U6
         NQUTy7Jr8h/wqSmsEa6Bh1nMIHbIrlQYsAR91RqarU16FI6CvO3DgTBFSM+QaCdQoD1y
         JYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105408; x=1793710208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9bm/VqfouJwe/E4PVyOUQraLP3MHwcXiPF4bxf1G7Y=;
        b=g7UzubKLYJ6gv2ylXQLdw67Blf4hj1goxhcAf8TxzRijD3z59YSRaQetRgRjDYwD/D
         dqMUB19QZ2iGK9/Nt4Afdig0QR/7AD0UNALzRRcSKxJ4rGAHHa5MvOC6GpKNxbCHY/sV
         cFx4syZqavlAoTGjl0Bxf8sIEQ14VaF4v5xl+P8sk8BLq1G9kSVYljOa/W+B5a8ybGtM
         MPft6QpG5gwnYslVYyaDhg2ud+sBQY33lfzNUZVDm9LlQFN69QeCPetKdKY80ChqUumw
         Ty6E5MlC/CI8elSYiR3FfUrQtc/CvdEgFOpIEV/FdGcYghn5boIMH1gj3p0Yb5ZMlPwg
         fVKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxon5P1XYIGsjMaurMN1Jbv6hEurAO3E+woDxVP1fH3raExzKev7ZltK6xPTPzHx07mXp9+M2GCKLnF4xY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqUTiYQoHCxvRUOqr4pApY2lJDgbZpKE5akU+OGMGCXanxDiC8
	9k1XSgyGRC38njl2WuUhprE1hnBcD0S0kx/NWeWKFPXUoVWN4mBt0Nw+
X-Gm-Gg: AYBFou1F+XbNO5rf1jvIPJ6LtOgNI73OkEccaYAufPon0cdIAavGa8kgOmlfnH/KNB3
	e2oPvEgWGHQWdcLB1LYqGK0jWWNR2nEiVd1ZUiG1RgWV2f5Gkzw2BS5q7IO1GM53xoaUal1pRt/
	g8pVVr0wWQenNLo15KSpLYgDy0Q5+m8gUOLQ6kkHjZsxgXeM457AmO6gh6Uz5vQO36UdIhYK9Jb
	F0y37fVzku/14ez4DJlMkAIFrOLVUhrGp9udoFItvdWuqL3Nc0UUO/JHLzvRR7OlLY/w5/7Zjsn
	ssaJuu0xUxpu4yeLZI5+cpFFmI6eU83ZPPluVwXBzqGidYVNzwaBB7gcWXwGn8XhxmL3j76ur6M
	xEjbiPeOHhGce8GIOyuUs+vPQEHbyYv1zTGsf/ZTXIT1k8B9zPRrXRnK8cZINx5+cVGrd0a4EGT
	UzYt2j20k8Jchi8Fq5y1mCapza+46XdY/VUbgPRwHIUQDvsOq3z2r36gym4Q+d7skC9R4dSBtRV
	pBE47V9pYAXLEQZokncaQ33HQ+Fbp6Fqubjk0MVA6JKtjn/8lxN5iSEZ89zNk3p6HnkbyLeTrbW
	J0HRt7HcI9VWFJeGZlIhU3eVf0Zp67x7g5lF5IY8pRJCrMQ3iIV7YMlJbdAFDMKL2gEbI6teorP
	aMMFk9Ag0Xw==
X-Received: by 2002:a05:651c:a331:b0:3a6:622a:2cad with SMTP id 38308e7fff4ca-3ac6fd0c2efmr24122901fa.10.1793105407711;
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:07 -0700 (PDT)
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
Subject: [PATCH v4 5/9] iio: adc: meson_saradc: annotate the lock helpers
Date: Tue, 27 Oct 2026 14:49:50 +0200
Message-ID: <20261027124954.110697-6-zoone.rupert@gmail.com>
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

meson_sar_adc_lock() returns 0 with priv->lock held, and
meson_sar_adc_unlock() releases it. Annotate both so context analysis
follows the lock into the callers. Only indio_dev is in scope in the
annotation, so the lock is reached through iio_priv().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/adc/meson_saradc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 2b003fd5afeb..3c1bc2274129 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -578,6 +578,7 @@ static void meson_sar_adc_stop_sample_engine(struct iio_dev *indio_dev)
 }
 
 static int meson_sar_adc_lock(struct iio_dev *indio_dev)
+	__cond_acquires(0, &((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int val, ret;
@@ -608,6 +609,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 }
 
 static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
+	__releases(&((struct meson_sar_adc_priv *)iio_priv(indio_dev))->lock)
 {
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 
-- 
2.43.0

