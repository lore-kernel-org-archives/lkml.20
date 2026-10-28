Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180537;
	b=pg/hwZsQES8s3ZNCLHC9Dyr8Dfu9VV2NnZIh1jkpDDb6xk3rszgUSaNLYx/MqgCn46HR
	 WLm05uwfRZzY/u+niqdqx6nRNaekXxF7btc0fIjhUAyUV7omEqR7KhgGZOUQzjv9JziqZ
	 QIYPcwU4sKOA6JMOIHdwPPDwnXXVdbX17EByhR/p1LK0EK6iwEWeE8fHb2jWe4uL22TD9
	 DpYts6AK75VsD2mFhti10C4JPsCUfSxrMr4kvau3B2X+6KrjOYzkHKe7355vmMnJwpNvQ
	 bHml7aWNtawj6NO4rigS/eClM5Q1b5AVzPUHcG9cE1zxjmUR03EzyfSou3GsDoNiIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=MdZsMnWW2cOtc+g5aBafxh17ZTf4iDvbz/eFHckpDk14O6d//FknNUUtdWQ1xPGZjE8b
	 r9qrPKMm4xPeTg0D1MOP7WVQKzVTKy3xJcDSmf4T35bBBfiR3V9XRYtcbSH1PIjw2gqmz
	 Vo11Df4XO76YONe4LrbzlVliDoz9hbZGlx2qOAn+SeGWV52t7N4eJzDy/gk28AkSoDeWj
	 zP0k1+WKkCbhShAuWVr3z2MF5VisCEzsR5ekZiVO8ZXTPac7x6T5HTUNex/bZOAMfTJU4
	 R484G8qBVOajbMx5+fVXV2m8rAZW2xnsfyDnZZuL/J7RTM8Gyu0My2b3Rj6cy6j9f3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZbh0t2d;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893360A3803
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4893360A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZbh0t2d
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd3310348d2so850796a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180536; x=1793785336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=rZbh0t2dmtNId58W/OtED9F3sw76uxXRb0O+OwMvyUJJaVsbHftF8j1pg2EwLWaz7I
         90beBK4z7uYVZsfIyBSF4G+ep2N/6aDaekU1oTnnOXCbGpTMegO4qFxbpmRQh366PwG2
         s4mHTUV2Ctp4Nk81hls3/aIq3Js2N2+i4G/zkSizwvtJCRPAMNnu/yf6RUNjkdhKXILR
         8G4a80frNDlki8clJWblQcIA62hTaIkIc6xBUyB7u6pGTiVZc4zL9YNEl8CTJYFoiP6p
         NAQOLrZrsKCpn2H09k1enpC0rfGeP9BeombpyAWwg6yMDX3X2lqejfrbBcdEcIbM1uCj
         JaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180536; x=1793785336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=G+dqhrsvsjzDkkK2oygj3LmAQOI0pDvpNIS8PLSUlsdjs1GmT+hFd+TwR0J21R6C7e
         /HFHnyM2wntl3jxiM+TYaxOZj6HBzhNNHxlC2huiXPUT2Gemdx8yVBwIL5nCBJYnjSx7
         FZk6rgjODy1/mCX+GR4h1oCJdiTI8E1CCaN3YfEdBgcS/u7GYH1/OFZbUOvYJl11NHYo
         hgOeIKLdYgRIXs7lyaXxXxunMdI6kiVFcybIrrmN4RZyZoGWg3FzAkgE6zn69S9kGE1p
         MMXp543sTKnxSqwNORt7j/1thQ2aQUaKUkBoGtU/CTZHIK2yf9wf7c/iChA4gRQLYaJL
         kurA==
X-Forwarded-Encrypted: i=1; AKwUvBzqtrfEtx290upJOk7lOmy7daUerQNaWNTh+pADGFKmpQUi3AAGE0kG0UVObf+P+lUIZrpHjamNtBLbvMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaCgq6ay68a2fy9/3qecCvbook/RjmjyRg05Yv5UiqAJ8OFhEj
	YEeTS0Ke6w+uKqCDbtA109W0hJon4biejVDJfLvHSDI2MiyBLD3G886J7DpsfQ==
X-Gm-Gg: AYBFou0zMLXHt0joy1xKCAl4ChSVvyFksVlQSNiDw0l9xgbSA2TyNX5uI+HqIH1Pk8t
	BXN1BzYLx/a6WOnhcGwf6KXdS54DH80iBC8II4psMxm2iQmC1cuv0Cl5+RXYSWVpvJP/Ln9g5jD
	YKPcNTWDUQg1yp4DVKP36POPaEPye0XDmuSjAqM+7NYq+Rv4XdPsO0ij4cWPTPBMXMrYUw7IUbz
	M1EOiFvJRnVYaEvP0nnAxqB5kdTPBfWnryKQdkkEZ+AYUd3INUWNVxfWKkGTOyJhKDWLe2KYFQ2
	iRCFp+vKB7R6HD9y5pJgdtit8U9W3L2z9Zs9S3gkWA7DRUEy8zsbjsQSZgsfls8CjTNamVOqHU2
	jA+67ZUuFvi6srQI/7CJtldsWyEfF0nS52iATn77YavJPnWuewKtr6tY40sBsOQyX5jT3AMJwo6
	mNkLsJ97j4X1q8ZoMgOmK2kqFe4ruO0m3aS5fYD38x6rFK/swWLuzLMv+NN2AR64+uscR9rj7W8
	M8ZpBZLyeE3w53vkJOzHhTKAwIWiZ3d4cOu0Kh2t/8dZFD26HWeNPjGLT3OJhoK6MYU4YnRn1pn
	BbG5KKpI0F8gIB0/KG4Nj/S9hCRB4tZXb+TEgqVFB1EYTtAtmVb4zkc5qCcVI3he+R1JaanaTRr
	8FYzsttQ86Iyp5WWX1X9bZYbehn5FfFqtRrHyx2wUDEjmsgQxaA6dfnwXI6Kw+ix7cdlJ
X-Received: by 2002:a17:90b:4b01:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3ae5c6c4316mr584601a91.1.1793180536606;
        Wed, 28 Oct 2026 02:42:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:16 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v7 10/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 18:41:26 +0900
Message-ID: <20261028094132.20364-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in the following patch.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
