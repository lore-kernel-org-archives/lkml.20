Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105411;
	b=EoMFXYK8HP/tq34L//KXt+iPqVnOKW3bSqEW2KiES57Hj8Jxz+K6yiU/XFlmBq84Oz25
	 5FSCPkrQr/z2pLroXeZrccmUJ9PnPaIm3B18pD+uWVYWxUMLMuiiGcbnMtYvxFGeir4g5
	 wImVHBRUZax3RdZdeLsoORZD7oZJMvvH22vIJFBWCrs34qNx7vQVzkYHhiQ+Ix6xcK38E
	 xuWTZEsqu7KJL7/848I98FFCmG9pKbxCLE/w3eN93x/54assNreLwx4rDW6OZrcpHQ/UC
	 3xij7WRcm9xaxpe1bKb7IxCwQ+hgKCYWfo6u7GDl71+FN00HFmS/Zkddw7OOj3XYzvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
	b=eTEX2OOVOYvlMDEjfQNVLCCBhT2YtXDVHP9FkIMr5QyhrT5cKXPOThR9aGfASszdkGAl
	 bZX1N7DQ7Jha57m3YpwkO8yfH4iw2cRFieQ9GmerbwamFpHeZM9ShLzlXR7e0sFcUVPBZ
	 ZbXWBFnaf2F4SqRBJvBqQQ+JCo/nzFULtBw9z60izl7lACS6ATxDuRDE+IABMgZCmCLZe
	 dgUAnECZcWEZYPBNwhA5e7NZ0PEpVHI7Bny9VBvvMujwnbeoFbkUmMlajbz8KdKIHnJpw
	 137rPfRPjYTRVkbMSSK3+FvcOvy5ZEfKQf3K0BTVEOpnLCF1rP6zIHfPsratMO8D6/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NmiDqgRR;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63EB60A2624
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63EB60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NmiDqgRR
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso1237659e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105409; x=1793710209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=NmiDqgRRJrFmXSJIKbbdXABegTUZk0NZ6W3SMFeoK7ytpy859DpB0vLWWk62uy72mQ
         pjYh+EU5z+sZA1kfFMIrTvZhDlUciNH3ahDSHrCo6HP1QcGwD6O+YDtOovcxlTxHqNN4
         Ro+kBLbCWOtGF5rFurIW613Nu+0wZhXdZpEu442W4iwLLHs/hjUAR/earDMFAp3/UouE
         41zRkzSDusb840peCdvCfwDmpHcWRpVlOVJPVf0UHDD7HbGQ/6fUlMHtlC8qwacbXgFF
         LUleBgy9LOCvi8N+niD94TAuYGbhJFyMFzMhA/B3mQKjxu4KWIgniq9qJBQ1zRgW3akj
         IUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105409; x=1793710209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAwqAAQD7kxOT9F2GvcLkLjakYWT0+JOrQ0Pn5dLBYQ=;
        b=qP6YCL/fzOVwQ1tB29G/DBxrOA0PIcA2P7KVZsrmsOsdyRv4pKphuwvTbaP0Q9dkOa
         slwNV/ZF40KhtR425UZVEEvqEQp4zceJIX8pbHtTTnD45vDm/jtNPnwRX8lDLSroNDVG
         /BzgnEoabCodGGmenPYyQI9MLT5ggzhBWB+v2O3QhetULsN1POarDEBvMwjt0gHJk7gG
         qKoRfR/uE/2MiBSMclyDxUg6Wzu+PNG+YSgne7FNhyRA9q2Pm5PulXovz8KOPEVNDVch
         hfpBHUCTGkSNQKl7AeXIoxg377OPkx8XVT3zlfa4v09ZY8JfmGpD4rYlV2tQpvOlVG2w
         myPA==
X-Forwarded-Encrypted: i=1; AKwUvBxl4xinL/S3WkGDli/8sef4roy8scfOO39QX4m1pQIeo1my60tl19xZ+Ha1JNBb0aY6Wf3wQRYEuqnWIwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1O+7CFWCpZe8DhOGP/NW1wK4CbMzyq7YeHkvzt5P/iASlAJcU
	a6RR0P6ebvT6bvD7vSwUF7ozNKz9e4+Us1Bp2TFia6iixCUOYYDYt/Qg
X-Gm-Gg: AYBFou33/p7XIMiomCcfmYOOj2lP1G7vhFyLFKfVkyNp8BQdq+0cQVM+D8bSOkmIi9T
	lKQPk8+v9Ueks25CsryXyx9ivFzsnY5M2Li+J9o6tLyONeOmYFJCao1VYYPiDjk89kI2RGbqNAj
	Buz9gSI247Gh3rDptXMTSutyUggYfK/pKsiogiHKMIxUZzp0KCroKGIvkUyvaPSY0aT0Hr1SVon
	PfevvegXmfA2DndnsR/BALD5x3Lx4agkwf1RPhyyQIAFam1x6pi3Rto4B9BQRRKy2O2lsXrvV6H
	uvQjkgdPjXAOXXMof8fugEP+CsweRKMZqWovMOXrPM+CFbcJ5mSkSy8mUgzeiy7cIuWeR5ZbE+6
	VMSa0HI+HKdVTA9AoYLhMVh5ytW7tXsc2dQVAl8/xzsLA5UCoVSMw73RPAkz1PNBRYxBHvSG5HM
	AzR6e22HnX4ZmQA5EU/2t2iEVOnguF/WF9Ge/VGGUXEeLJG8ICk2RSlzPP/7dOdlXkSbqE5qqLp
	h4lC7bHskBzS9BiFFT4o/zlXxxLvtgtCwlDiv7XEttPEdebJNYXnGCgperqe5QrqFhwX1J0ZLUx
	U0pVaun8YqqHhQc+/35CYQHMbk1vHeC0orW9k/PP3McMsEMqNjNsDg+bq77eRIWE84POcYuQsyJ
	hlbn+v+BmeQ==
X-Received: by 2002:a05:6512:3981:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5bfc618c82bmr832927e87.45.1793105408719;
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:08 -0700 (PDT)
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
Subject: [PATCH v4 6/9] iio: buffer-dma: annotate the queue lock helpers
Date: Tue, 27 Oct 2026 14:49:51 +0200
Message-ID: <20261027124954.110697-7-zoone.rupert@gmail.com>
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

iio_dma_buffer_lock_queue() and iio_dma_buffer_unlock_queue() take and
release the queue lock for the core. Annotate them with that lock so
context analysis checks them.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

 drivers/iio/buffer/industrialio-buffer-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 1daac23087a7..b42b70e9b06d 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -763,6 +763,7 @@ struct device *iio_dma_buffer_get_dma_dev(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_get_dma_dev, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+	__acquires(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
@@ -771,6 +772,7 @@ void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
 EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+	__releases(&iio_buffer_to_queue(buffer)->lock)
 {
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
-- 
2.43.0

