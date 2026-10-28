Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156036;
	b=2ywOUohOz74znjwXs7r5LZ1C8IUhUVsGCuUAlN6Fv2o+tv9aB2YEzbZe5ubElTR6Tq05
	 HaR/+9WfuO4z5ApTUXsZzb1WfJyg/q7o2yYR2dMrx4GpNIkHQfIBmlBfuXUfyo4Dq5MbV
	 6SkY/Xf0zG+0/1DKAaBsCkXZPbG2sLpbbF8eqbayWTGbp0sG0tSOIJ2unl3CaqxD7I9DT
	 ebPGQmIt8zL5MZL/dPCCm5y1KLUtX0oSdP4BC4D77AfWp3D2CD3hXxp43TP6lV4+FWM6G
	 aUE9qKF4e4jgZPt+JzpyS7Feq/gTUEJoh0mwUt5FxoHqqnilnR25nWznO8Mz5C9RA8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=pUUC8CD4TevAZLg2t9rrAt4c+NiRwvMO8Fhtgdw6ynzcIQ8nQnZ8bA+i2oYXK/9swAC3
	 F23vQAMKJVL58SvSPDrybabFL4CAJsxwcg8zvEa1Hhgt/tuDUyXaoHlyrAcb0jVVHTglN
	 kQhpaloxoiYd9dB60CFV28xD1khM1RKGmkXXgelUpht9HP9D/L48J+XnYUrRpmdW5ErnW
	 h4Wj2bvc5eic7tXv9kkoWwWq069cKWsBlzlSvYE/fIUMPLQOpkxoLmvlVw7sWdyGAaYV6
	 SpZhuRxoi+ekoXL0zI3vlRQrFZ7M9pZ9OHSi5F/dijlCJnPLReynzRyNP2uDtKNf05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtlOS1HN;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1179606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1179606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtlOS1HN
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36661f953e4so821870eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156035; x=1793760835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=DtlOS1HN/lPRDERq/L4CWKWOWJTRrPcFCxqObl76LU7v3PRxxlWsCZwYTccQ0vLfkI
         VGzYHLsj9oDMkYO8RMbT3lRkeTZsfbifPU4IKZdHmfzD0+bjzyb/x7a4onw1MFc4rY12
         c7QfGHjSLX8rw1VMNLuFtckc7h2amQYjzghSuYkZ1OoOxgqFli0eDklrSKKz5RP+xv2y
         slMZ+0vFfz4KzSyKI873S5FI1Jkp3UxJeWySGX4jHbpZT3cvpDPWUWADukPOJ1iloYW/
         mitXvsrBhSJETdeECIFpEaf0txh4pir4cPB3L1BfZXYYvOGMo7uUOFoTzzw57obw6TEt
         uG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156035; x=1793760835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=HYW8SMJFBgRLB3Oqm4BfX8IvvBExeOC4lRH7+HU5RnIMZglqxVjGIbXNM49uXIyY/x
         CoJKxhJhPTkBS1wK9x3dkwYy714MkPljanYY44te/kZpxc2lMCO8dk9A8tVRGvD0XCwQ
         veb2XFBNz2eKnkqgnc7iUlCThBYT5DK2hWp+dmiKWEWVnrNQWZvIo2AqzQFdKGtxLSAm
         RYmRDwgUSgRY0fxaTel5nkHk4nK1CszfEiGT/nLw6dl5526iC4uF2R82TaHLBlGY/t42
         n4qV3DsDYStQ/gauqE9zo629aqOr1/u0diSQg2eQqZJ79UGkPK1qjGWNoBMuHxvNF/NO
         QD5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfrCQI6u3vQvZdXL+tONXEgLDcKm0qYXAtCxVUsfOSjS4K2wuJYuzn0BGgNr8yCnat3oH0r1Dc1BlQBQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYILDQ0v90uk4qqZcfqg5AdLU0E1o3uftt4R/HKt0WfW25DWRvGy
	b5/0+6Uf31o37Mp2Sb77CeZm8m06fQ2RAuIW7Kem1bsp3Yp9HR4Hm3PN
X-Gm-Gg: AYBFou3Xa1xJgfrhu02Da0X4DJLFIJywMnAzve5u8Gd6paXZS81DRn5qXg0EpJewVae
	2oFcw8joVRsvAU7wyvNklaU4hPCVBHRwpseUaZJtQX8ap2i4TzcME3LKRQFVThevIBrir61a1a5
	UvTcTXwbkaXC+vljToqNhdXiaYOh4kOSJNJjWK26gcp6Hj58jo7wMqeQ/e+U6RLiziquImVPkjH
	zqsiMJdN/8NVdXOTJNBKuyQze+fvEQ4N9wPTXFaCf0GNXuhBoyK3MFXT1kV3Z6jGdyMJu3c/MyE
	+gjLafzG57B2YUNJxafzdwwAfw++wF3sSh9pk5MielJhklMvosiUT7vwZTC7rnUqy0mdhQZVK6p
	ABp74+U5KTBVmDmlC830d+JDfKyJw08soFRa6Us1TgsqBr16Fb333T+GRph417p1a1YJoLiYk3d
	BwSbN1JCBFcYVuS0LrxTdg6pcOcBGgGQPbBYWOY1PDS5n5xHgw5NTy6eWR8VVWfRk52d/qCH3Iu
	C8e3VRqKmHoBay8ItfUAnnmNlI+hxojsv+ton4WV/qac11itRZTbxxf+0LSGmCbM9/zmiXhwlNC
	XCq+XGuJeMdPidhhHXmL5C0S7k41eBG9qpwbHeMuKAAm3fXypleZKbEAKe5Aop/H6dNFUaoWYJ+
	lDj6cdj1mSfXODkOIb0wo79WViDuBssd9hwxOjAt+bVBmLJjSWOpT9hFBL91Vpfqiz314
X-Received: by 2002:a05:7300:a8f:b0:368:c6b9:d3bb with SMTP id 5a478bee46e88-36a203f18f1mr1809613eec.14.1793156034971;
        Tue, 27 Oct 2026 19:53:54 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:54 -0700 (PDT)
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
Subject: [PATCH v6 10/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 11:53:13 +0900
Message-ID: <20261028025317.92450-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
