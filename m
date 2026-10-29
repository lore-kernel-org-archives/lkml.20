Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263872;
	b=2D24XSjuV2NDAGWHZPrNX/vyR4AHqRpz/SJGgTTrJuWWoEqUlT7tMZG3ZxeDOVmx2+xa
	 LcyJFbibQ6Q3V58QFmGzCx3oIAJF/Y/3WwzqWQN2gCsn89Cr4htDIAtXzqqSiF+IgsLO3
	 IXGqGyg5ZJ0uIROHFPzPbqJ3+f2zXbrminu447eK9dqG75Dad7F93d5zXbhTeRwY494kB
	 BpZeDidkS6QreKyZ2r4FlIFqOLeWFFpzgnnb2vQYmBRQGa9SFi7vx5HAkfp8QNrY+xVe/
	 nhPx0lsqoyqOe7qfDq3+28Rwzk/XiMfjEFzweGV1fbNskFCW/XJsHs9nWkdh8vR/c+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=i9UUuDCAWgL7mslGn8BoLckzN3FO09rMDH44da40afqQobje7fBH05erC4WhDkXtCNJt
	 vvpzF8fpq4RTNrKBxAFtcmacK+dKot/s3bfi7MyjQ25aA9YXf4BEn9rYwteVJ7jAXpFqs
	 zXaR9/Wy3RtTztdCcaHKs9YcIgjmFb7BtMe9icdCh8Ojcr4fUFuJdM2OwAc8GD+6uiHEl
	 l6bld+RctcVwdtZhsxECQF3iTroG4Rg3XZcrJfrTb+9AJaH7hxIRIOqgopsX2q2l/Q99b
	 dncGomhFJ0mzJEyuRrycX7xIacE6tXfj97aXLtxYW6YPPfGuuL60BgXNyEoNX/jp0Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcvVyl1U;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D639E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcvVyl1U
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9ae391a05so3608785ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263871; x=1793868671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=xcvVyl1UK+hhO2fTI7lH5vns5F8yjWGhFUMSks+bbyK0vuanDc9OwXfxOuwnzJkzew
         rbQqQ966CBmd7i3OmFUq8Qwg3bHWKDstZnrIxjUILrNC+dD+7Zoy9M/ovJt3ITS+tvKl
         Hg6EUPhNm2eqf7hNzdBBs1HKFIlfLX0n5ragIz72/CX2aFItaGVdiRcBd3Qi2/JuqXCj
         u+geZUQpxGfj/gbbbTIKmlv/SC5GdxfMw7CaV+y6p+vQ91YHNUik7jymZ470grNl5d3O
         zvY9DlWIiaoaAH3Z2/jOEe6F/BvPeeGon4QSU9UePie1YMkMPzHbv2ZEBBCBTF0I0d1G
         btEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263871; x=1793868671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=e4J/21zPSt2j1D5YltcVHp4F2TCHlmNs5ZaPU+77F31Gw4BZ2qYcBHzZCVCJrlciEs
         iPZfq7ugYMVB4hArLDcXwNYqD2xYVCwgL5v4dNmFIlDO4mHe7KOWn+jdHUC5ocKEhffX
         BZ3DKjFt07oKqqqPgxXYoMp2/Ch7lhkhaX0C4wkGCMM6JqwC0Mn+Ui+p9hBJ9PElti+m
         vWQgoeZzfSMxk/QjmXvcsstLz9ODvBIIAjSrgOtnY19kKTp+2oujsdEeSVq1h3InlrYh
         eiWVTyap5gq6RVJsBqBCws/AHtu0ahIImLexipBI6CHGLDsSR2bmDT7eYUU8oVwJdHlU
         vV0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwa+1+NIGTiFBZghfcD7r9T23JvQecb/CedGD/2S696Fb57gOsGgtsguCTDvSgSEbJbfNENz/kVmF72aAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEH/cz/Ojha8wV6hKLc9JEP/VaGi1r94XdNFVLtvrbKMPew5RX
	qNBbclwsuIMMzmyjHJjig9D/Lj9wake8tTxcosC1jemzFw3tsVFFo1SL
X-Gm-Gg: AYBFou0WCMoNR+QDSwhlfwUjdLefTlvV7BfOYOVZ52JwsDgVsyncQqqvww+IByx06Ji
	wrealeZlfSPXPm02p6vjNmHN+ESVuf7ZodaDETCZyVf9D06m8gses8vdtJcBntWoCnCdzINREGq
	ONNmbW19OBfqPtAiy6yAajfAq1XGZaIf7P1BZ+umdEYshdhCLGsNo5+qgq5h7I1qfOEcDh83XB5
	iJ0qVz8RYEOi02hHkarGFaF0mjPp0QFLcDHD2nHFz/Vx0iKQDF+2Yg9aqauehdegrItk1XkWb7u
	JJgnMeyyOgwV43YDPDVqatJ4dDzdAfOzl626JN6mvaqNR/0ZisDHLGdJ0PI4+CClpcZlcIU2NQI
	QmR4REbR7i1uLIwCn3z2egIsn/+7rxwpAKT7msfKBmO6OmDpAJJFddUZHjEbz0NmpXWtTjjlNGB
	O5HFV04jD8hXOEk/Nunp2R55uSyRh40/UmVO8JrbONhdG1HTMtWkU7jzluv3wcqQIf1wIbNEBHv
	Evq8ZFcT7UGTKO8+70Sl+Jzsdj6XRtPW9+amJP2D8+GVo+sMD6gB0ywoS5MqdY9ojKNR7Iv+Qn6
	y5mnR5McH40i5klZ4kkxlcTy4i9UWqq9fI6bS8hSluPHRYNEm6OmuEf/9icD43G1ujSnEz5xDQH
	O6nO8eKvxPbFhabkOL3eUEdcQH1Mp4RH1CzljsW8Alg==
X-Received: by 2002:a17:903:19e7:b0:2e9:64b9:a338 with SMTP id d9443c01a7336-2eb1aab220cmr12773445ad.7.1793263871292;
        Thu, 29 Oct 2026 01:51:11 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:10 -0700 (PDT)
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
Subject: [PATCH v9 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 29 Oct 2026 17:50:25 +0900
Message-ID: <20261029085032.70689-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in patch 9.

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
