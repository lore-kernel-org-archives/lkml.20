Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664287;
	b=IHHeL8DqSi71E635mLFx3zAzirSUun94NZH3zo3uaJsYSfACVBmcCTsxys7KzllvdJos
	 Tq3T9RI7gqmGznx2eKcKVPj3Ud6eKeWZZ7w7vzMfhg7peP3WBunldDir1rRxqeCqiPCYS
	 v4SEeXwmiDm+Re8SVn1NBuTsuoX0hCTNILMIm/oS3Fu9Uu+azuKzOxiXT53DW691nKyzk
	 y0s3R3423wP9C5sxAhw36uFX5jI2ep176bien4m3igcCtZ62yRyfqU6TEjsLEUevVhwb/
	 lFo2Mutf/inVGuqusQ+8I+hzJCaH0987b/ps2G+NO2j064P5Kx3oGS1V56+G3Kf82tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
	b=0YMswa5DNXMaGmN/z9NpikgDyLxBOoPeSA5USUdtwOdKS0Vu+m7IGABRmVt6ywYELAeR
	 2ba8k9YMNC3oBEtRsImmhgFQwbJH8lI9amdM+fA7FAZLlNR+pQjLUFoTUdJv0sfgwuXTS
	 6KZblatHLivAY1TGjtLa4QeQuvRNgW5JGltl2aDuQVU+JCfE8R2UoykjVQtgFCR8BOadw
	 8SENA8OUc1rueVp6DREh9dtxNAQmBOVebMLKoylXfRBZkkZXf3XHyAr4QWIwIPtErhEnY
	 udH8uovhK1yGk/gqWSJtEqWuv2wzitK7bsJpWTNftu8zAjfxHpoq7sXN1XeNgWabQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAp2WmZq;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D3606EE80
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432D3606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAp2WmZq
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9cf928dc9so764975ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664287; x=1794269087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
        b=AAp2WmZqH4lFkiQxMuPQDFOnleVHB5UP8Z0ExbOAQOUg2Ktwk9r0z5zhWiZ+vH1L8c
         O9gRQOAfoIPyyhtZ73n8FaRR5rwo+x1PzEf7SdnCorC9rr8/FKNaKI7kzH62MEqKLPIz
         HQMmt7+vq+yvJ4Per09QL5/T+YzTFOtT+iIByB6GEkMQPJJPYQQU8B3XP8jZuh/IDTlk
         pNcagp7Kb3nAHm10gAyDB/4VUsRUIOziIOqHVi/pO2VKRGOVkmMcHgNowQ3lNRi4MzM3
         VKv42ry2krMBnGPEOyPyCbCdnBnuI7XvOTutKa8pZk331GEjWJXnk6WSWkn255kWcoXq
         9s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664287; x=1794269087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
        b=mTERwB3ViydDu0e5Ttg8W+dVZToaUMYsy4V7l3FEAyNqR7U6fPccro+xKSPiHIbEZQ
         TH05ddbL2UxtYcWY68OYDtde6qmkwYHna32A8LLfJV/jCnKPDOfQ5TjqR++L97FC7WWg
         tWOYLn6ZCkjFAiTDV76cJMB24U9gvKHgfjPloh1wUMIQs9e+8hFU7wIt0cXhxc8pJzYm
         34Moc+CBclNHwi++tMiz/OXd8NOGj57pZ2Q5mtYZuaxgkouQQLbuYKhc56ohCueLRJLj
         t1rf4W4fHL+S0G8O0AkT/vVziJGBd4hI3XSBqvqpkI6Zfshm0/yl3+KMSabQcOwbPeIM
         Yqjg==
X-Forwarded-Encrypted: i=1; AKwUvBy2yGZVcanTH0rKeRTKfHCiDCBiBfCtpcbgud1tgbwPODcjZvwvNf8bNlXp53AqqyBs24g6jP5xRvKxT9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kDKFCqhnnwn29rF5mRiKMnxBOwoKxZAUxu5gHKzfoOPYl2mKl
	am2fw1Il21YF3+eJRCVo8Oc/d8nu5Pn3D94Kl5KbYY5PAhSRCrD6L+HpGY1URA==
X-Gm-Gg: AYBFou0MLkHDiOxzvVRiE5LTfv0wqM2l9YSSVo23GgIQB1c7Vs7PjXzK/qg/aNibp4d
	cYigb8pdq81JHW+zxZb4TyVGAXAUEyiccLIhTtxDLVxAkpLz7ghoTlxLkIMCJss0Z3utHYJ53xa
	Kj0avxU43VXfHOyyZo5im1xSaFa0EMURgzbnYiOxibM7uo7nAQeCIsqDYbfUmwzGi4kqr+LDiKQ
	t1n/hDX8ObpFQrvh1qIFELpDSw8HsjJaXAcN6XRUQvhiMmYA8/FEmniJiAxxWYXBFkWMptAfcYv
	ASx8HjbV3w3djV3UTJcOdwjy4yw+rW0CvdNswKVwv+C+LZ4X+OeFPHo97jk33K7vJjG3CFiMyuS
	cvuTLU/yBgVhgh7rFfwM6Kt0MmGhCwNMIodsZdS7HzWgJwlabIex/tgQHjfdVIf9M1y3sx2VLlz
	3HZaUZYxVvC3RQnCaje19g7FPbBHmNmoMmr7vmoQM0X+kQb+UDBVtyBVu/bz9nywD3ka2cJ9Ovr
	ek8JyWqwsNIc+pgD8ewg80EdpSc1FQ5XiL3qtrhmrWAB6z3OTQP1jPi/VbDWjOfVEuwgIR/b3UY
	6WQBO7IJqGVdITQRBCdd58xg0kpt8w8VyRaef04Y9hBS/vPb85DnzmRmSJekBT6JS1S5pIxvBOg
	ZD+GgjjL+9bovuiIUF32LMkSOHVwUp5ltriljhmjXlTXNC/CsEcJGho7Ep7p01VpHbFca
X-Received: by 2002:a17:90b:4a4d:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ae89542f3dmr6388084a91.3.1793664286684;
        Mon, 02 Nov 2026 16:04:46 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:46 -0800 (PST)
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
Subject: [PATCH v12 11/12] ALSA: virtio: prioritize staged capture period work
Date: Tue,  3 Nov 2026 09:04:02 +0900
Message-ID: <20261103000403.67106-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -167,6 +167,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
