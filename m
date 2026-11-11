Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355554;
	b=w+MTXIf8GI7yLo1Lfjy2ZOxZkTBE0+hB3hFGH8g+9YCP2rEhNvQ2znwyYeFswXFtPzUo
	 Bh2O+yRaZavzcWoIKBfmTJnyT9I7unbFkuaymAqqKA43epbMpRuT7kpqQkrdQehldsbPr
	 U7aOYTsYGCiSGoMOAuVfWO2I0lzfp1dRXNmePLAblsIY6B69v+nDtu+F5N1bnvDsUHFUO
	 O5gd1IhWwGMAshuiZG7SO517d4v16bw1h+XYet43msoFxxSAVgRumsR8IM7nOG4xI3Wa3
	 /oGEPztsNA+xe8rYx69d2qJj6Iav80QF2VT7C36+6WV6xFXa9gO5TCIdvdufVIXab6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=OJxYs+YuZANH8+lLe8YfWnkhuLCDcKospeWrPwyza1TIAA39/SaYZpXfwZXApual/HxI
	 xIknE3LrrpCiI/LAj4MGAfH2MmjoNLhZwMRXQuuaVLiCdMXoGCpgOZuvi7IA9MCnU3ZLX
	 EecPGssaSZXSZVf41+o3DtFEHZCuquN/VnyX2nJQXlYvmRBeaNZ/xMQDlnn/PxOtWntSl
	 puSHhzdn2bJz5O5S4CkyZq8uiULCSdb+igT/qY2f2RFU7N73WloTWZVbnqwGJnH2aJx1y
	 REubpW4BldofiQY8fSp6/Tx7VFvy9ZIbh96JekJEt2fLQpKK/baalRy1DruN/lB6yhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpV1k9cV;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CDB606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CDB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpV1k9cV
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1509330a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355553; x=1794960353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=MpV1k9cVRo42tR/lASLz7dwsoXaP6lc/cQKqmFLqaK3MhIAZ19v0VVf//zYTsvvzL0
         BXi59ypQMnyJftH9KWQwqfo22HKxPeMDDq74sEaKaPmBGoQAr47xWzFXWBy0CEtg8zc1
         rviZj/Mz1vOfCySzRf3KPc0JdvB5gVGC61GyGbDfB9ahxNfsoEvSdlglAedX+AtqUVoc
         02iaKuxfPAlMAByITTTB5l84rsQYJZ0G5SiK4hWarjTSjMQovDKh6Tw1OwUt7DyxGlwF
         aCkF1xsFszmsA9wJo6uD2XM5T9BESfES8jNSvbS5HE1hffyoaThQMt4OTQF3rDEGvXAr
         eVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355553; x=1794960353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=uOSiB4ldSh5e3jUMj49cHK4HBF+hmhMvZ9ngZs7CRkYLDF5GGYwKzjoxC7Zh6OAp95
         L8ulj/a3Bazp4YMRYCNFtIhrQZGJPXZfXqjmDrLr7+JCPLbLseprTWQ1IbHhOyg+t1v0
         iG6qT6hl3BicFPKk/d0F+bKlVdfRnkilveE48ciq2MquLNK1yTz0ekmndA2zOT7VCuzz
         zNfPkrZK88jb6qnkBFken3N/yjbmaHq/xliBtvoAlwXtY2fnfmVIeV+64ZDQYn9xb5NI
         sBP5E2YoihqnVHcWdZ6S0QTgv6XXc4Wh3p3OS8hAo6S/8uW5tLluAn9rN1D9dIAxaAD2
         7xVg==
X-Forwarded-Encrypted: i=1; AL+hErEEj+49r0fBvA10X5V1fhDIbxW19UbLYqhT93CgWWx8XRrlHh2SiTKTzfB2gzSjIt5GDUcUS1lU6gXiBq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FjWEMMPmkhqfbQpOOjZHn303CNXIBnlIlksZnV95oG3xDUNwU
	JljijRYDE/GKrwz9M1oKDOXYjbyfQh0/B75+8APCnMbiJzjn3sPxP2nc
X-Gm-Gg: AYBFou1YrgdJq2Kn4kzevoQAXnnWBYvDaBxrQBghtetkeSB8yMbTBBh0Rvd+zNua3s4
	fn2Gpcq/ZAsu8IgABY7JI34kKp4HRkxxz5bSTI4Ex3Nugo8aMps8NCWoQE1wYghTLDBeAfD22gM
	EU/j7EK//I8nUiNowBllGNymBkcqd5LanYC1pENIdn0mL0zKuu1VasO8t+ow2lhwYHIJxPfBEZo
	WWsr0iQtnkednnUR9VcEnlxe7R6JWgR5H1BnmTj3p8lzIGAqz5+cCw/BEjkcuhLYge7kfESw2cv
	BU2zqUKMAuRL2SdqCbXJBTXIkDxK+9zxOXedn+j4m+PPg4cAEjKrFjBD6QuXDfFucLsbhxZtE6g
	ZTpGYf8klOQZ+61wgZnUV6KT5CdvwyLWuquqET4VJs8oKOcF0XoxHh0+RJQ2ZmEfhZ0nfg4sXhW
	Y/OBarjBFx0vHUR4X6vTjNnY4sKyc5VHrLFgHVlNQ9P5LO2VNjlTzadcgNEAf/0VNBhsmxQSnMF
	MJ5FmONnOcwmnEoiw3cJOkv0gvOz5pFYQQqtGoefqpD3je904JPskxDRKlS8kcVyVEM+7i/ZzaI
	8cc3bt2e0588TQAijj9NGdK+GgT6kJ83pEzBUlizJTmVtgzk+XuCJ+u82/gJ6JjMUOLIq5khx+8
	3Q7tPpFNZwRi+V/LI3toQdBMXMdY+i1YomSbU8YAXAi2iKdk=
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr614942a91.43.1794355552868;
        Tue, 10 Nov 2026 16:05:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:51 -0800 (PST)
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
Subject: [PATCH v24 01/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 11 Nov 2026 09:05:28 +0900
Message-ID: <20261111000543.28550-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
