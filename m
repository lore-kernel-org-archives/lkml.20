Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105411;
	b=LVZcHkKCEisQe9spuxvHni7HMBTYvlvT9jyj01eW8jkJO8AN0jMnioR4Sa4JFBTKbXKo
	 SQz902ss/k4DTkGpBsv1x1vVcEV/c/WmH4BzXAc1JtTrnVSZCKgU8qz0fMsRxHma9EB65
	 O4/5gTWoIjhYmIj86AQaML1SCyX89LE9OwV1BOBM9zZg6xfcUSX0XBrNSzZl4hQ7pQlsF
	 7C0blqFoKV/O1r3cxbUcDX59d4qtpEYiajWeTU3nCv46HTQqCawbhirltf0/+EsgLZmpA
	 0EhUjVI8kP8R1/dxa158nBZY/6K+j3PyehxJFaUSIQe8LOEdZa1O9N5/Mrdy0eUjzpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
	b=KVteZFFJeeI5TDGJkigu87xqcsxMr5Gu8UL1pzndAYD1PwulBVql6jJUPShgrcUk0muK
	 fxWp9laa5QwzGc/Kvc42fHbPGpVKsHF9QLZKl3gosxIcfQFYh9Sl9NlM4gcS4r1MP4B6B
	 ZHSfRncdxmIav7pnWxI+ZnpMZ3OeF2g+7aKCBMXR/qg8fj+EcFmsW+cSg1uYOY51v3Dfy
	 BHnCP0h7WRrQbd2GIwMfN5m9ruT8ZGIoKFK/BQ4I/p41xaprrzE6DJ/iKJ5hNtZcapLYI
	 Qe9C4gS7dj2ZLz7iVgPSgZBFfApaz2v+n3pV5yLcQXGaoKvDJqxffnxlIbW1iA8QRBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EzESZW/H";
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96371606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96371606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EzESZW/H
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso3959660e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105410; x=1793710210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=EzESZW/H7tOi7GvKKOrMRq6axsqyMq3xScPbGJQxm5ZGKGsHeduTOyDyl4r3phHpuD
         6DkQepdlV5Dr4XL0yivuJYfJSLm4VTu+fuIbIrw9aWrgrSOywUqKeZtlcsC4r+yiAqpg
         HOSQ98PfzDkySybEL05MI3yswMOq0127zLMk+KJY87FefJ4VPs/CSepGX1P18B1uz1v5
         At0gAEGEBj7pbxoLX6hasgbkDtIChAacXgbOfJyR2y2nfLjMqNw/l9dSgFOuXUG9KLkS
         fNAAgoVRWlOuF8kw8lviqRD9bkQ2jIRlfPejz7IcTidhncHCvrU63Oe4SHlNWseWhFy8
         Clww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105410; x=1793710210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZfYLczmvRoSi6CaREX5Mwnwxrh4r7FBoQ6OBNNjGi4=;
        b=xd6O6SBh1zAGx5TjPQAf7gSoMhdRr9lYeWLiWuEU4c1F9TikQBzMiZ2TwQH1Tr0bet
         HE7zgMQv5nbCDIJMwXcppzHqq1MoTchKCUw7ldAadSrnAh6OaqdpjnLWB2YrMWJBZNcI
         O2XLxdxxPINXesvWq72XL5p8vtnThlL8Cr7SBL6NKMaIxYOZM7NMUvZ5tS6AnsfBvWqq
         fQrFqq221owkKQt9mPBIce0DEFO3yXvNtGh52r1SarrZHX66uyOwdbO/EdKPVCewvj8T
         UZ4VmSAeYsZrmG+gMTPukchJ2kjvmI/LxK0+tly4sAgvmb4acDqI+oRm27yYfaa3KoCR
         +CDA==
X-Forwarded-Encrypted: i=1; AKwUvBwqxyfsieoHvjQoJhMYtsL87Pzb2GeNKJB68tTfjLPRdSZLCVHyjynBfOK53Yfsa0gwgX4Kmiu6fwpCjdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPTN3qaqYBmJGq0k/Hf4rsYp+QCCzv0cjdFcHWjE71VD0XslW8
	+YloV5AzkzhL9wc4ZqMXYHGIQ1HCldKe4uUhbzzESnuQT44ErhHiXsA4
X-Gm-Gg: AYBFou1mYO28ejmsqLrj9MzPh4ERjJWETmGQjRmZ3b2XzQDSfgvRh/b/W4Qe8tIo5dh
	iUfWHrciL0edMxZJv1feNbw4e2cSUPZgslJ2gU4ZqmXm5vll5gS9/hgqFwrwYoJX+eAICSp8vJ2
	cxSzXUkqqYeAwkGFysMnzMuU7mZ0ipbaHxCn59H53k0TPuKSgD4BYkjqigoHvkjL8O+6Qdb0xp3
	ajyaK5z47uOEJb2XuZVrQ7hxFce8Kw8EddH6MLk8+31olwmlaDqX9z4KZoxA6oPuHLJ+SNI06rl
	xmX+ltnTGpao96AIC8JcwQgo16rhmtku0+EKAavP6DcaXr1RmoUlx6MLCtgRy8RgRoYjI1/GcvX
	APQARj7lqPtpmXkMEkmV51XbbaF+zyBBkmGTREKuStx4txy/73nb+l2HdFshXYUxI9/LRSQGDs4
	JD5NJVH7PV4E/w5rr7JxSp9QQiMUjzCFp36fDgk8rsUOqSZQIM9CgLY/cyvU/VfJ2f8R7Rd6hBw
	MlAdiioBZPkYOmOlNAPCTJHb4CZYHCoGy8ybjTglgVE3A4/pNqpXgS6BQKjMeBaGp886xOh2Dfd
	7BSLod1P6N8Efa+3CAWbVjNcXZlxNGm+Y7nkLk2K2EDMxW6mnBXJKii7O56Gj3s6KQ==
X-Received: by 2002:a05:6512:10ca:b0:5bf:c27b:8e52 with SMTP id 2adb3069b0e04-5bfc27b8f26mr1690144e87.65.1793105409656;
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:09 -0700 (PDT)
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
Subject: [PATCH v4 7/9] iio: light: opt3001: mark the interrupt handler __context_unsafe
Date: Tue, 27 Oct 2026 14:49:52 +0200
Message-ID: <20261027124954.110697-8-zoone.rupert@gmail.com>
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

opt3001_irq() takes opt->lock only when ok_to_ignore_lock is false, and
releases it under the same test. Context analysis does not follow a
lock taken and released on a condition, so mark the handler
__context_unsafe().

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/light/opt3001.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
index a948353014ac..cfd4a0ba9bd7 100644
--- a/drivers/iio/light/opt3001.c
+++ b/drivers/iio/light/opt3001.c
@@ -817,6 +817,7 @@ static int opt3001_configure(struct opt3001 *opt)
 }
 
 static irqreturn_t opt3001_irq(int irq, void *_iio)
+	__context_unsafe(/* lock only taken when !ok_to_ignore_lock */)
 {
 	struct iio_dev *iio = _iio;
 	struct opt3001 *opt = iio_priv(iio);
-- 
2.43.0

