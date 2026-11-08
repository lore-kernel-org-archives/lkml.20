Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101665;
	b=qj4RIBwaEx/U1e4QeyRYe1QrfH1qZJ71+H9gH51PZo/KJChDC1o4PZFQY+/16gkTiSDz
	 QZyAgDC4Dnl6lDao0am48xx5qByeuhNVI+K7phLU75XjyyF40CSGbl6itILpOFjrgl0rd
	 bR6x/8hjkiK3Z+2SawMy9ymFPQfyQXw4ry6Wvs/wtd6Ri4sbKruAKGMKxMdRa68zjIAmx
	 5jJ/SBHeogexrGjnbY7AXDbY5WtsoaRqiSt0zFWLATAW+Td49yV9w72vaQ0Vaztoc8JkC
	 qkI0z78vA6cg8dquqYsSE4gJ+kr9/kcw2nuEhZ0Yga4Q85PDYYc6XQZ79LA1xf0sATA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JGXeoEcc3kDlzKja01AIsaye9Z/+QuBp1KBLpsLMndA=;
	b=Ztll2Q+Yb6N6mL8Dxvxqhn204S4ve6v01gbd0Q06RBWSeBUkvNCLcye3idrly9kucj25
	 ST42A0T76zl3I5/ckONlFqKWfbQc1M1xCnx2z/rltF1HaVlz4sWNb/w54NDZsNjbndGar
	 xuKrNxLEUD9dpVaoaVYMYryayYQsha4/+VPHzcLEZUC5YonsCCrq1vL/TWGLSF9Ilxitp
	 OJv6z987GLdT2F3OM+7xei0+QatimX23OgnEjjmoR/mRYbWOPLO7A+7yehTeshyjJxpkq
	 fn4WVJMJu1menl3D8tl21B3qwctBaMfx7whsB2mweoTmJRKOI7n4+JnLFXAj8n0FvWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByKYzU9H;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC8606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFC8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByKYzU9H
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so817395e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794101663; x=1794706463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGXeoEcc3kDlzKja01AIsaye9Z/+QuBp1KBLpsLMndA=;
        b=ByKYzU9HB5DT/i7Ko829srtaxHhCrNZi84hheOwMY/9oJ2W4O1VIM01DuOraqtoTuX
         LE0SbPtd0jXqd6gQbXxGph0tr066fVgGGlZD0nked4HX6OPrXhxCyFyP2yHGeuDFPvsP
         mvFsasV27hKylXDrJh79101nD4FERPbSO0f36W8nQ36EIdcEkTKeM9JT6BbRPhPf77GL
         W7GBY3j4NX0I045bPbzfceR7rzDUtBNslNf8KCI9kQMpqFH1DEB3GnSNEBWEy4D8l8Dl
         oj6RUtgP/jXwFRVqLffZvmTUsw0eG9xLQZcOfj1OvU5JOg7Ki/7acfX5nZNIIpcDYIL5
         8oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794101663; x=1794706463;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JGXeoEcc3kDlzKja01AIsaye9Z/+QuBp1KBLpsLMndA=;
        b=G3PglVzeHoyrYQLTmdhQo9So0hzb00uL/eo0pPzhqlDFiSEtf+SSZ46dU2MUFQ1SuK
         L9AaSp6WQyLvDF2lFK9bOuBuA5MfxCieJlGiUaDpC0I7SEL3UpuK+bu74XEcsg5sxEik
         +HnvmytPqnrjE4m1Hj/+dt0WRMsBgOw/f1oJ6o0VHNUEMJuF8H0k1ATqqPgWVJo70w/S
         sBZI+G9L1JtK8yDXKuCZPV2Xyyb7uXvoPNYxy3bVQAkrjbIYXLZFhPjGnd7SRQS5/+ak
         tjcnLE4hi21TksHkfCIkP8B674Ly9Pr9SvYvgcVic1yRfGVVAjCpOPte4ysfAXez6Wi0
         LqFw==
X-Forwarded-Encrypted: i=1; AKwUvByWJQJ88bn5XNhPHB/0sbTpT4m/TUgaLdf1zRPBnGtyx5+Pv+Mbb6WCep2+UcXh5oEgMqZVeTwH3BCU1uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4WefuSHjVkp89sxQ4a7+gQVEAUxF1wZu/OQBzC8u8905lKtg8
	7rkFCEqx8IVKJJpoO1hVOVZO1UkaSkyM/inSSkiPvSDkYyYsXpop9mwL
X-Gm-Gg: AYBFou3lNPJ7RWUUQOR+B+MpGkWH8bkyTOf5KXIbjRkdCOeoQXCWE2PCbYkw9myjQmU
	0gWTg8mfoyJEGQTah0Snc5sGmCsaIpgXoUT4Ec8lxXxIRQIhgGL9tphtO/fAqI6QPRh3UycPJ62
	/NL/ba9zWZ7JNrGoB3yxKN+bK4dyClER+Sge2vV4AbBeasaV6M/LFMSo4siAmUNvnO2yf6B+mAT
	gs6u63AvO8/lI7NkP8+0bJHz9OR9jyKJcNub0QxmCqiA3fMZsf1f6U1Da50+TP5fbtremA9F02C
	2+L+F21zDk4Xx4VYRppngCWSZjP4My/Lc0MQ86/ZhYPlMcUsE4ablVaujYrTUvSQZgQoHbveZEG
	4VUgnPkxwXor5LgUhY0g28q/WqKvHbzKGspG7UxaIXb+LAQnLyE3iXmC4pOjUzd3SGclrtVLUVI
	vUO1FFi+0GMC56+PJM0FeVQfS/6U9+f8B/EIT3cvJIIXj/WM0BaiAds55kcwuVYSvLnFti67jnn
	PVml+mbx9lVw/Q0WG+Q9MbSNPevcdjeUq1++eUd31UYdTXJXNJWLQhJDvYuTe93vsc22dC/T1d5
	Q9lWYv3+g+L32xrlk3QvuMByNVxGsF4/7vDo4cNa4uOp8Y+e3/16grs=
X-Received: by 2002:a05:600c:46d3:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4b963c9197cmr5815975e9.32.1794101663125;
        Sat, 07 Nov 2026 17:34:23 -0800 (PST)
Received: from legion.. ([5.43.81.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783e39esm1143137f8f.45.2026.11.07.17.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:34:22 -0800 (PST)
From: =?UTF-8?q?Adi=20Kadu=C5=A1i=C4=87?= <kadusicadi1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adi=20Kadu=C5=A1i=C4=87?= <kadusicadi1@gmail.com>
Subject: [PATCH] iio: adc: ad_sigma_delta: use __free(kfree) for temporary buffers
Date: Sun,  8 Nov 2026 02:33:28 +0100
Message-ID: <20261108013328.125069-1-kadusicadi1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace manual kfree() calls with the __free(kfree) cleanup attribute.
No functional change.

Signed-off-by: Adi Kadušić <kadusicadi1@gmail.com>
---
 drivers/iio/adc/ad_sigma_delta.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index 119ddc5a13e2..66aba39f68a7 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -203,21 +203,14 @@ EXPORT_SYMBOL_NS_GPL(ad_sd_read_reg, "IIO_AD_SIGMA_DELTA");
  **/
 int ad_sd_reset(struct ad_sigma_delta *sigma_delta)
 {
-	unsigned int reset_length = sigma_delta->info->num_resetclks;
-	unsigned int size;
-	u8 *buf;
-	int ret;
+	unsigned int size = BITS_TO_BYTES(sigma_delta->info->num_resetclks);
 
-	size = BITS_TO_BYTES(reset_length);
-	buf = kcalloc(size, sizeof(*buf), GFP_KERNEL);
+	u8 *buf __free(kfree) = kcalloc(size, sizeof(*buf), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	memset(buf, 0xff, size);
-	ret = spi_write(sigma_delta->spi, buf, size);
-	kfree(buf);
-
-	return ret;
+	return spi_write(sigma_delta->spi, buf, size);
 }
 EXPORT_SYMBOL_NS_GPL(ad_sd_reset, "IIO_AD_SIGMA_DELTA");
 
@@ -249,7 +242,6 @@ static int ad_sigma_delta_clear_pending_event(struct ad_sigma_delta *sigma_delta
 {
 	bool pending_event;
 	unsigned int data_read_len = BITS_TO_BYTES(sigma_delta->info->num_resetclks);
-	u8 *data;
 	struct spi_transfer t[] = {
 		{
 			.len = 1,
@@ -317,7 +309,7 @@ static int ad_sigma_delta_clear_pending_event(struct ad_sigma_delta *sigma_delta
 	 * shorter than the reset procedure.
 	 */
 
-	data = kzalloc(data_read_len + 1, GFP_KERNEL);
+	u8 *data __free(kfree) = kzalloc(data_read_len + 1, GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -340,11 +332,7 @@ static int ad_sigma_delta_clear_pending_event(struct ad_sigma_delta *sigma_delta
 	memset(data + 2, 0xff, data_read_len - 1);
 	spi_message_add_tail(&t[1], &m);
 
-	ret = spi_sync_locked(sigma_delta->spi, &m);
-
-	kfree(data);
-
-	return ret;
+	return spi_sync_locked(sigma_delta->spi, &m);
 }
 
 int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
-- 
2.43.0

