Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252668;
	b=MypaT7tYXwwLu7p2HSEpamCME7iT+2UHVwGah8XWgdx99VO2K9Yj3P7smwYsgTVNyD0v
	 aTOnZtXYd1mzPAls5MQ594ZbTOTPK23jdxpPRvHsYpSmEqqcByVARGTBJEtqZ0pmhS9yT
	 s1G4TmoayaXTVgazCaeiZabws2CFjjT/Hbf5r/Rv2FqKd3YAca4aF0K0O4G8QgN5atEY4
	 y0mpWtIa2/dpXNG7PnsF1JqMrTS7eh43AXj18ZwkCbGyLm0bP4TpiPIvbQ4LviubXF2Wp
	 f1JR/ISClx7MxsP451MG+zrUiLwTn2lz4kk7Dp20MnCPEr6xvunYa7P5ZITm6o+boIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=NmlmUHSIy1EWzmsKPbu4vzyIJegicMVlC8F5l7MRjY5TBRmssrnvtpM1t/oqo3G1XGkd
	 IdisRyHryT5GBdKE5iJnRmRgZnNL9Lb+a4PQb/1feBknn2x8Rt3nNmQBY1AXhVp3/RfPJ
	 iEXP7+PBvt7V7bQ7KdtpOS1W6RiWvDQleNBOkn9toQvlLEAg7V6hdovf26iwMz3Oi+fpt
	 1ELSLDVJPqgBkTjc94j0JCs29nsf8/DOyiyrhF6dvYOuq8GszBqciBzfPnPlMwmf2ASfg
	 lCkaYxdbZ9NVEYvN6Aufc/520e/ryFUmILFMyndretpR9mAhhXk3eBKVLbSWJIeLs2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="epPelA/e";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826C606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6826C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epPelA/e
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso972383a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252668; x=1793857468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=epPelA/ebjfKFIqUn76ZkmnCEM8hEnqTKQBTqZWyzD9GSxOXK9i0OABVBwkMEDQqEb
         mrp9w0LSE0NmyrG0aKBQcZzPaUQCMbYvJ2BJynrtADLpfG4Vz6ugsAbCaEBNFtgyPLWM
         3DvXcC5tX4J50e21gwS0bHS7YgzuJBauc2kTX8ftvjmb8Iji5m90vZ6bd8LH6+EndCKK
         9CbkEkggyvQ9g/3Rk0iCu78IkbvbUm+LjRYu7NDuUs1rkWsbl6i3l3qcfPBEEOulW7JT
         rZqv9uN6a8bCyq3FQrk/ML79I2IexbKQb9QdZC4h+jHFfsyiA+abn1GqUznCloayheEw
         QQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252668; x=1793857468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=MaGZEStiXA7TiAhmOdLdDKkvAHdYgTYrJ7KhHTRU1NgLaayQQKWx/JnX+YfzQqSv6Q
         JqGlTcllUq0hXxwnFrfjgRJLJvinNGaKz+UcolYuc+/sIMrK6n6ALZ/AvRmo1iL2POj1
         ms+CSzNoSC201NEDgLwSFk3O7seIokYQdQ5DiiRCJIRWR7O1p9US3ckWTic05UkO4HAf
         FA9V9iSxOzd+5of//bWwG7ksk3x6wTcDl9IgbKBn2nlA5F3tuv9q+4y1AiN4rMtc8tPa
         CjZKwSzbq1pualmXdiVNvdZO8lnPHIiWcQE+40g/wrEpYQAtM4P3mmnOGyVfOHaln8Hu
         GaKw==
X-Forwarded-Encrypted: i=1; AKwUvBw+nYWahGR9z7dUGbj7UAAzts8qHfX4DpNs2c3ZrVjxFdjm8QW3Rn85bTrW9LTKrldnCSeGg7W1fdRIPVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI93x5szRK/6GbMwBZNl77Y/hG/d1bwvcC3ox7xHFCltygkZR+X
	t52Y2fB6rdk4HtDPgQfp3lrjF+8ITqNM+XtY2gFCew2czFiHdPdhYNKT
X-Gm-Gg: AYBFou0/kiV9RhvwvgGB4GMs3hooiXUyTU0pchmk3ivnKyarlk17do3JqOy/USifRAE
	bnJ1yyrFCSx+0pAOcjRq5eIs7E9rmkFmscjCifXU18z/IrH6BNwbMH5Acz58GTLm1/nasUnm9Ef
	MAxGMZG7BlwuLhB9wHSRMHhHjZxjK3uXo/6fn6/M7ghsAwy+PYuJAHi0Qbhfl1rq0uThPuWLhAV
	lv/QpwHtSxRn73I0uC+HOVhlH7YUhzKU2HBFd/x25q4wAECDqgIiybiIW/NFuILHHowZtMb8MFk
	jBsnmc3rmUAFLr/CNREcqtuHhkLxOSUrVTzLXfGakCaMH0SKlMkysbA84IUOr18b3/vzfpBtGs4
	uV3SBhvNjqS1O4vqDFQOwsZWbsMBQ+mYO9BVJDTCs89CIXnby+MpxTP4LOCARsPTRyTJhEHCeOa
	shOCXkPYYclF2o9BomB1Rj/EeDd6lYReYeafKpXmSuVPzuN1e9uaGQs82SgDSFTKjoU1+del+BB
	R0fdprExb+XWzsIELVpq6uPNwquSPOn+qsxl7y7014q3lagAkbOYTvOngfSxIZCJr7C6nMgUUpR
	O45Q0R4bECH9sKPlr0fs0Eq6Vq7Dm/5fxe+ENX37yNnP+ezWlrECYIjg1bzWk8wt1dW938k43Tf
	QNlIYv9R1web6Rsrgn+DCbgEkfuGdk1XEN9vhZ132F/OP4qs=
X-Received: by 2002:a17:90b:3142:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3ae58362f48mr3595933a91.63.1793252667831;
        Wed, 28 Oct 2026 22:44:27 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:27 -0700 (PDT)
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
Subject: [PATCH v8 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 29 Oct 2026 14:43:47 +0900
Message-ID: <20261029054354.2931-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

