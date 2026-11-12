Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461696;
	b=fKcnB7voSPIjyp3V6/fOmrFJu4z8SPkwAiLumy/sVUyTWMvVkNsx9eF4MKBj/Rb8F5uB
	 xbnYyNX6F6phMpd3ycCWrQKKqbPkHcvLMr7wlYgmr1OFICdeOvsSs8H79JIN9Sw2dH0KD
	 KAIM1ZbjEVTVcZHltJfICYrAH5lKBPRqcgA7a7T8d902Yr22tyFsd0rAFawr5HGLa14/l
	 lP/NDeEIOLwjW2sFMMTQ40fve6DNpcrVp6u6ms+hHlMUEYOnZII3FAS+VPcP4n0pA60YG
	 1B6cEeUDHUf/QxOyIEJAqpuPC+yxv/WZuIOhEXx2Mw2XdDhm5suuITFJnuDL/c5/VLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=GzOmc//ZoB8cq+UZg7KKWjB8/ISzFdYhd1c+h7hLN6v77MEf1RSr6F2N+hm0LK6Ev7RY
	 4wlSEdU1+2Q1pBS0gvtrQiFwXXAB6I+Se0xOL7FDpySK7jXJBH208ex18kjtxL8rvkcmX
	 PrwAAEkRteZcvirnPkhWqVHEtheeWriPNZGDri0E3qGkkpx6dbLNXyJ5d6e2ll0U0kUfz
	 oZGMoRgdBMPf/NBDhCZ+jj5xMnXkyov6vq5UCpOlFQQuUbZfO5P2ilQnys9lWnhhjgbq4
	 VH+et9zTxm1Xz4aLj0EIR73DFZoj+C9q9TG8OZktwuNawG3eEuqM/HO855S1u/rVR7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ+iAVGr;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D56606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D56606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ+iAVGr
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37198ed3727so655014eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461695; x=1795066495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=dQ+iAVGrs40P3mvOnsMx386F8x4T7hbt6QJVwaw4bN3WscCPOFlAT769rRBBC2dE7m
         6CtlmkSISj8zLFXvkwVDmd2CxyC2uvv1EYh/lasvpNnmiUXyjoqzG+Fi7u60tyz9br4J
         KwIz8yLlNpgIj885KK9b5Vb02B1EJOL6C+yvJvLLKrvf71di9USNV7R+u2nW1L2ilNG2
         3BB0EKujATiVzo0W5IMWOgiqLRKmi/+0wvWoNdLdFGF3Za0UVxOl6EhgStNKz6ltq5ex
         O12e0xKNHDW6j+k7Njl5mg/6h8B3rgp5kwlOsp3Pjr0baIAdD8Wqr8LN2CK734UfLr6L
         O/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461695; x=1795066495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=PmeE6YzZBSSKqAyJVSnCHNofTES1fVeR5TohD8nUVU5i/nj4Uj8Gh2a5jqkcYXQIgV
         o4Uaqbl8qpTx1m0s6raBuszCebRhkcS0FqKGeWguRTkT6X5n+/osQX2R4/U849cMJueG
         s5tTJRTo2uj4XeNvqwtBCOwHs0uricaruI3l7H82OgdTwOS24uMck0pzGdo1aVQd1MMy
         ZOri/adytGVtVKxoVcJic8NNH8W+BdviiCFtXKeuGy5viqpQXvOb3c5GViQsRBo4cdmK
         SWAx8jrzV+h9PNoxGTSjYxKylwQsn5Wt1ZWcNtQO4zLPa2Kz6Ia4VjAnuNnyxTMIME2u
         DBHA==
X-Forwarded-Encrypted: i=1; AL+hErHaJF02B2XiLkZDkWxXhRTzrMW/KTBrvinKWFHdSlWAGoDD1LeocWRtotfZQWEEMKiC0jF8iHItPC5A8G0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OJB+vw5azr8WeIGemebEzIUlBiONMqh1wuDLL/4NhPDRWJxz9
	iJdrRLKdunkUpa/pMrawm+9fmTFV76NGvU3L2KvU380usepsqPJnMA6+
X-Gm-Gg: AYBFou316CmeIFTbXcEgu8osze7LbSgwn6unfW58/BO0kKi1Z5/htvIIoqYe01Zra5i
	mKJJHgW4wjB12jssaarIlhWAzW78yQ18YuFQMTnZ1Woy546p+PJDW1TM1tPQjHddaCbj0kICb0H
	E7jaKgNYheuJ3az7YS39Gr5OG8jnf8vjvMjGYuqhP3db8HyI8ojYTmVcAU1o1m33kOvJRx9DJp9
	6o9uIZlNtHVmWg2S/vcmDJ8avj4onsbSd1JFdd6BL4IC8wdpzwh19yrydLoRN8PwYJ6Gdz5MhUz
	gWUmQNRBjDG7hBOALwd2Gx867+jmP4FQ6K6ucB2Rx/jLEAAPovz5OF842OFVyURZxnlc8oCroP1
	SSmgpN6jJFUZ4TWO3i8fhOrTpMVJjcuve0vNjIfcqILO3CUNBJrJunpAhCo4dwP+lXUOy0iNdk/
	2ozSB7jL6xpcFbZeIVDEAVnuIyen982HzxEvgGq6tEzetm398KCnpPU+jqZJlHjMAX/HV+7BQ+H
	0S7Vb7PjQGx2sHN1A8GH4xyOBwR2Fb2wb+RcH9021pdnaXK2I45QaaExQDJP5gXGnWuMNCqMSoa
	DBR6YusxfcBqYmOdb/6TCl5pZGUMcVC5k8mC1ZyjsfTwSAvnYJjjXc+F5ln1Wqo4NnLm362XROp
	j5uhIgtho6yyfLremwNOp3bHBEx0wVNAf0bgZCb/cHjKdyUAhvbhHNCGBQRXhPtcIKn7w
X-Received: by 2002:a05:701b:420f:20b0:1b3:a87e:8040 with SMTP id a92af1059eb24-1b4f5eba049mr1425278c88.20.1794461695410;
        Wed, 11 Nov 2026 21:34:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:54 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v29 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 14:34:30 +0900
Message-ID: <20261112053446.73504-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
staged-capture policy sampling.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

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
