Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201388;
	b=3eF/pFnS3sxZ2WX51YJrHm8d3I1YSejw6gK+4us5bfUVIpqS59J6Fmc9gsoeixaby98O
	 2d6sY8eHuPjnL8D9Qb/tK3IwT7Xhp+7NH7icibQIlznSHmLu2ggcsh7/xcf7hbgkHl3FH
	 NFgaP5Vb1TKO0nr0idVyG6zKAk76I4k1aSDMHefIbZYaUBxRLzKOZYdGmHld1tXRC/5+y
	 7Tdtn8iOF3pSRPlrOvHzRgn0WoEvOVxqqgXtRVEOCnVYcXTAsHSPhoBuOtXETlufhdmDy
	 2Zy9zeHid0DM5hIN68NJdNlBPmFc5T4WxIzN2Jxser4wEDxb1SYuNfm2NDHnDC3HEGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=AD0KRvd/FhSeUmTECPO/i0R7PbKBgb1yYteJ02qNGdDb/VsEJmD92nX0vpEhQS2i9mXm
	 RksNhu4X+q9gH1zRiEnNC+ay7c+76l0Yg3h8AjweCENiWa45ilSIpesqRHTQlx4zd6Q5w
	 fSx4ytawOrtdzGzoX3eQ0EjlUT17uRLxXw37ewVz5VYE8CYpJQ/GanGDlvwEzevtDK8N5
	 Wkd4C0vTwzkQ4Li+iTO+wUHdNsqhX44P99hB7tTdCXWIwghChSrait8lSlZ/a4yi5yhWQ
	 NgrgXASIYwPN397UAFqX1Jq5/WA+yLpNZcYwAwiTAAt+l4+XC0HVjj/cCO4/MLtEL8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06MkglJ5;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE3606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DE3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06MkglJ5
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so298189c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201387; x=1794806187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=06MkglJ5FY1s6DB2TSqzZ4qQ4hkx7EOIM9N1gGEu3eVg58tFqiQERaWJe5tHTFnm9m
         VI//0HTN7ThVuXiicuw9NQkwwvvTFEykv368+BvwVPr/a7lmqqdWZUiny6RBZ1NeRSgt
         LmXimky/C+1EHMOSANnZK1puI5Acyr6D4VxieZSaqxkzOW2dhNdDS0sBRcn+yRIOzFGk
         pZw0innVGsOmeffxdG+eYIz4/ew5mp40F8+6GAHmB6uK+OXqPtXVCqFWRn9p8+EQBSwL
         M1pXfjVrDjKcJeGarQLVX11BWAZoLCDVivdYV11c8F/pu4nE0VPnqL5r+AVOkZJw694i
         iTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201387; x=1794806187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=tiF/udva0z9B5Kd34mfI1ZtoS+3j7I4oDiqFNVsKr2nxli6ffqufOxD82m/ES8HjRr
         ccdGiddYbsuuUHS7Fp+N506oQfNY4tviPLR2tT0DFxM5u71Uitmy4JPwVz3KioH9QYz+
         A8unqg1gCS8c1UYZcnzhldE61TgduWu3MeKteP8PwXiw+fnhvhW++Cmav1h/G3syH8zT
         NiFE+cafkTEnnU394sxabza67VLNrEMATycFMhTLudcJ23tJgUDd0AKSNJLDJNerh+iE
         G5jFI0jDOWo7sSwMx60jP7IBR/3fJLTLODQkWO+EvgV7Qmk2Rb1v6soa5dfMCaomCe1m
         gFqw==
X-Forwarded-Encrypted: i=1; AL+hErFGff21fwhSKmrGV0p5eTVlx2gLaPewxwITxKILfhMimYF0+q7bVaafoYbNU1TWdxHV7NSoDUutmIiz2uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qDq75HLVY3Jfleo02Ow1j+Ay7ED04q8lIdMz7RKr9dv36s13E
	hksIVJ6Rcc7715kDoEz0wqP5/c9Equ9tC8b7Ztqx+TinzQALABWPsjet
X-Gm-Gg: AYBFou1yN7pBsyuVUXJHGPwwlrD0McFPj+RcWzOsq5srs6qy9PfEegMZyoM5ca/wIXS
	yNJmv1xegNIVTyXGnFzrswK6iRb8EGya/+tR/GYcVW3XtykSP5xDJ+u5m3t4HvjAAllEWjn84JT
	fBIRxyo2rmbT8YDB5//0JG/ndSg6dCLkjYMw+0nlBPwl/Or44vZn5GAiN1ickY8J6LDTKXgAsWp
	mBuZYWQXt7C6J3rcSfxAtdTN/vYGzEu60JVLSBHlLEdrsrxG+0I+j+WtIUrgNN2uDkBYzK3h8f+
	T0iiE+Oqy6xEOTRoFW9j6uHZCm7vCy3wzNo0dCi90itob0x2sKSw8FiFisvL+H1TaPNqgBsTZQ6
	eoI/VYFoSep0CykD7lWAb0Gw5xApkUqaRqfWoxsnPFycD8xE6+Dy8lS7q9v7RgPd70MdHQf9ge5
	38lYKZ4YB2ScVk73eSX5UdGjAZZUHMVvVk0OIzatmQPVS+GHwrQRUxSzJoFOr53g1QrRHWO882h
	VgA3lVHECe1d6FvnqYDnT4k/flD3N/T8S3dKvEkNVtdkHkg5Jn1fKo8rzm94t95aeQcauvFqy2G
	HlYNRYqSpEoc2f5wMn5GKJYGnPGNAyO4y7QpVGXsTLBClR7Gk1/bwaNGqcmK7DhECwX80pKM7qw
	tSF/WufrihjqTGNT/qcxf2q0VQwSwuTj6/TRdyihjk5bS2jM=
X-Received: by 2002:a05:701b:450c:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b39fe87361mr5510996c88.11.1794201386847;
        Sun, 08 Nov 2026 21:16:26 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:26 -0800 (PST)
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
Subject: [PATCH v22 01/13] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Mon,  9 Nov 2026 14:16:06 +0900
Message-ID: <20261109051618.22506-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
