Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905189;
	b=waHbn3oQND36Md+ruPnL8iXDeypEMTvV9GK519Mo6ZvlW2UW0BTVzP0pPqV5KhMqBmsD
	 W2fEwoW2Uu5kZi71gBwITQaNLqM4cNE5N6h4mHDrMyGJIaNoLjEyub+E3h9uh2NJ+FQ0E
	 gYCKV+IDxGOL4wvfRoyxlra7H+x3xax7itT3gnjAqZPABhJnavCL6KVQOVkXVd842X69q
	 Jl5fupnzTbhMz4ncijG5bL9wGkmrkWcWnLxGq62p4BXrVAjm29lIBiZtn/PNpLXR1jzZ7
	 Guit2CsiE8LKXm1X1lKZJeFxT9A6iFutMEdBxGs4rjytig1+y39q8mWzBPcr2xOaqbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=DHusL7u7Fqx9OudJd915QK0aL4/opLsdToHk+Xzc3vVptHMilJX/vUM8XlPW2KplOO63
	 DLv7DcqfBADW1o/uoch7GwVinCbzb1LDRVrfv5I65g3aT5Fcjp/FISun2xtTTzFzFVTHP
	 s26OiMq6dRDKySjjQrv7NFQKJ1oKNDV3XBCiHo3MWRoVu9Yj/LsyHMfV1BmTerpS9z5WY
	 c+oQO2VFznz41kvEIXDZn5edb4svE4l5+jfchEjGb4FeFFJGfxgVA0YaGhRI5PDg93HE5
	 MiN367enxxcxZUytyEIDB2SBCcbgOIerFvaF7j9M2+li7+vzsfkbbdH3rC5sM8yN8Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gq4Ppgjg;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D68606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D68606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gq4Ppgjg
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14fc585291cso722858c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792905188; x=1793509988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=Gq4PpgjgLRasFGFftL7CEtj4d/xJ88hLYYduIopBcHIwH2OGYvqGzp6Q4tsIMhxkjO
         +WGopa3xQoykhn8bSohiUY3f/AGO0/CcG6RjoXz3nldYOGFvfF8ObFgEl7kAnPNMzU1u
         P2+1BKOkgqCx7dAV3YE1t+m2N2LPd+ojPCFqXgnCzUk6HbV5MkUThpmjDSfSiMhTVDst
         k8AmFQUg9zYePE10sDmD5tJjFe+K2oBef5OeixfjGWgSZyIlyZTj65w119TavA25KB7W
         LYfb5QYLORt8I1LxN72W0bvBX/7B0kHQBQB4l1GvVfLUeW2nkrpYaPTYvWTcfbCL++Wo
         ftUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792905188; x=1793509988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=LmSFHbc26qhl5Md2oEOcPs8sJM0+Zdv9GM5smVnNNqcZ9elWKR/sVlLIvGOnLBLAv/
         OqSlt+Q7Z715zhKrhRKcKVpVl4ZA2Prxyr5pYXPyeBZrD8jNYoXcLgAseEyKiX4b8fIK
         OcjJCqpa4ZSHlHKgnxbOc9FKEKHy6cNdK2XmSwEln8Jgv4IP/9Hsl9C+TsEUegh8Wp8+
         yN95ylhhaYKNVDjajOfteonrGA4o73Nx3m3KIFa4XSUBBitqe8Sa5hYZmiHKYLMRLIBm
         iaZQXpFvEdKC1mznprvVNgGPTrUO8VUw8INqZr9yp41L5+ABNjalPe0uM02PsQ39nN/T
         PwZA==
X-Forwarded-Encrypted: i=1; AKwUvBzGoOXNVUV4WCV9kQakFAxacYbwp+PhjNalSxjqYUinkl4eqYs0aniTv9LwOUUmkfLb4nG3Gz080QMYb9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMS9WO/CMPB3HgoLr7kF74zCPow/cxeT7ohFRd0ff7gDpBQ2WQ
	ZCcCqL9/PprmLdJJ2nQYIrrDQYVfWoRh+jIH9IJnbFSYbkighnHNzQA7
X-Gm-Gg: AYBFou2pu35ea5f8DtTlaQGZ7HSFQoyXm8XO4zXCu50L36pEnvZp9FfzlUZKvIJ9rI2
	9qsgIPByyZEPaug2ZCy2yM/RrxDVsjAaQTo1iRrFftQpaMcziTj0YJFxKCY52JOzyizwjxQc+31
	tx2oxzhHWSlPxsEkab2cg+iq8oJVfieiZZsYIdQWExT9w7LWkv8+BM51huD3iV84HaSvJOgrNqB
	9bHO7tqXkdItMUXfhE0nGlQcr9/eln0ZvS3rswwX3kOqHyvh3j3MLJ/iXwtKSYIV0Fvdlbr9BnF
	bDe726DGWEnWghH11b7l2vIZFN2vjaM+sXHIjneWO2/8lLSj7QQTT2RLPNuqk7InlGz6ctbYCiW
	32svVU3SvSG0Z9H3up/6AiCCXLl3nBlVElmA4fmTyz3xcwfBsA06F9SwVd0wxhFZpJwHsNkceFt
	XtKCzG3PHPmvozsPeIp9I3UmS+BwZrBgpKSPryOimrJa0K+5OUB50CcK7f609h5IzC5o9y+gjCZ
	2Y8RG5PKVz7PuPoic3BeFOMPhCkCCPVP/Py9npzJw86/GcS4p/jvTMFrWc8Rin1YNVP6BYkj/7i
	A2EmQXlqlMlUtBiU0GSkTF2irraRYs+ISJLUJDoDWIxIfs1JD9PrvCGayXR//0eunwcTK4Zz
X-Received: by 2002:a05:701b:4212:20b0:19d:6484:869f with SMTP id a92af1059eb24-19d648486dbmr1653830c88.7.1792905188364;
        Sat, 24 Oct 2026 22:13:08 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm12588456c88.14.2026.10.24.22.13.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 22:13:07 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v2 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sun, 25 Oct 2026 14:13:00 +0900
Message-ID: <20261025051301.54640-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025051301.54640-1-mynameisjune111@gmail.com>
References: <20261025051301.54640-1-mynameisjune111@gmail.com>
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
