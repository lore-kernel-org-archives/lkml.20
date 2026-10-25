Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910449;
	b=dqVkMLpy2WWNj4+JRKH6MFBJiUdTHUupt0DK0nnKBN9Ml1RY4uAkZ7hbo8/7XbH4GtwS
	 0IcmSkU9ZgyR94rTb5oeTe+Lp8npE2+RR7MNa0Ukt32ckKPAlO27Cz1zhtpdLcIWbHhsA
	 Wt8G95mgZhiPs3GevnuweiHZ6MMleBFc301uoqPBYaz4KkUDokgBLCj8MHGWoT5tL0zqh
	 bERYRobQ0HhBzbHTgMUydgW3teSiihxLxfUsB5szstZCJg6sPCFZov1p40PM11o/RsZCA
	 nSGQnQ6oDDVrV6qg0e4uBM6dw85TiyU4ZfSvFVrUSlEaWL9LkqsTfvdW0XvCayH/MRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=iqwA10WxYwp2A/qMykcqSJVrmbUv6c4QS9aE9v1UqIVXAOhie6/XuFWG+1hMIq4MrXiD
	 9zJYFdQF9F5WaEk4IXvOmrAJ56l1n42wqRGXsovoDaEwxUGCfCknvdBW+x8o/yaKnz6q6
	 YdUdeG+HkwNTeA2YQigc1nO3dyXdy6WAtsxepQBOaJeJu5SJz0I5aXraW3HRIxwPb+dxe
	 FI6xQ4LvWa8WGp/gXui8kgaScCWZszOb/+5svuQVVOjlTdX4ikxkfKMMIjSKgawy1m4dI
	 AQoeoagKuMLMrvSVxTSrquRFoum+G6j5CvfdeLSEZWUkwG1X606nHMM4r3UOGrUN3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pVDjVEHf;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E9606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pVDjVEHf
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8fe8e343fso11543775ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792910448; x=1793515248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=pVDjVEHfM95BkznBoGTv8lsNxfPvO+wdDgVBA58PQFLJ53R6rCw6MHXpld0Qe/sqEF
         MUrPa2BZpTETIImt0K8JcjuPA4mnBIpDdx/GCfWt3uYNWGc12hHgqLVVHPLVcG7QkpWl
         jjYOp1rMikRXBbF0MJ/WlYdowgTD5qwLeB3CQ1jEwvN19iVofxhC5eRzcOS3O1kTu6a3
         iuYHeLYdLFc9PvnqJ3xfXsFh91epinQzDgCsE75dOCPSoTQ307M4lBJt4n3nwGbuNWgm
         FSpKqLb4eCAVaPnqNBfW2DhvZ4fh4QITZTICvBDucGRxEASY0oIzudji7sqegqfM4n9k
         XcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792910448; x=1793515248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=qiSZ6d0whOxWdPCpIiAGzEPT+mdAgbjALIbo7hI6zPNFAEGmMLVdEPk8WSqSBsNCG0
         mSkabkKB7ZgoWCVIMHFP3cYkM0VsnJmysGBvckSAuPK3k3ftM2vUPY1AeFn4iSOzXT45
         pFqkYgCFUjN8yoIZQ5Iv9fR/5U61QVOf4C6Mrp9rcT0SrD1tMpZ5GPxJimrBpPf0SRWw
         1pCVstvzbbCgve7YqfJrW3AwAzhquIgjtey6KjovCqaRQq1iSdsOOpDcURhbd7JsuO2O
         pgpuQq/Ob1vZGpO28SYbAmyj4YU/4Hs4FatXaRgd8lC7S5sP33B6EN2Mt1e0ravO9skd
         ir5w==
X-Forwarded-Encrypted: i=1; AKwUvByJ89TVteZW1iqT0w+zKhPmKv+dpSfmAk+Jpzmyg78aO7P3v4oyeNH6x8/Rr7x/Hch9tJieI0QZnAmLu7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCP7nfQHlcA7QmDaH584kcVgGaHXvh9BYeFvEiGeqlQNN1n74W
	0M7pWriA2P2KDGTnUK1chWngAwW00fxFGwU6njARlQpV4xm7cLLsOhuZ
X-Gm-Gg: AYBFou3apPgXsTkwjus4XWjz6kHK6aT5KeySdZz8I5ZS8/kC5wILM4/NHIrqeuvyVJp
	qkPACmm68TuGY/3idl8lQ+IXYt/k46O4JpF8Gl9Y/cdrsRqEawv+HPh8wrrRVHQftM+4EsjrIwT
	75RI0s19JNiuclvC1sMbDWPW62DBkiRbYfcYc+wm3A3aSW2G/F1BfPc8qjL6jXybLBQdR6A0W3F
	lKvCrR7zf2oJWfhnAhMai3vNpp/RyTz61tLRfPvhQLJDXTnACselMYS8KVIkLe4qPok8NvWxNKB
	j0LAXNscPzGTOiQzXv3mZdU/DHmIi11778RpVp9JKn98nnY/LleGrUh5Y66ArFffAHhEvLsHpdb
	otfHMKtzb2FuzdOnmFcRZxYMzW7YmE2gyLLW64DkJJsUAIFHmQ1EySLaKEQaVsZHkuHODB81SyV
	SDRb7Up8KgOCP0T3PD+rUsvIduNzsVbCMfr5DRIVeezaXHQz1fwXxHHg8RHij5auyvDWZZlMiZc
	wNIIk/GyCpsnOhqcJn9y+x2FBuxiANqFyOTYvVWfqwqBB1iNoTv0SfT9dguBtPnEGefPUVEP9PJ
	fEAPp7n7vdFMj07ddkCLNO5k1yhOlShj2EcjHp1sHSAcYeVWWabE07ns//9mYi8imuub8u8T
X-Received: by 2002:a17:90b:3805:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3adeb131135mr2666671a91.50.1792910448307;
        Sat, 24 Oct 2026 23:40:48 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb2fb2sm4462670a91.1.2026.10.24.23.40.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 23:40:47 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v4 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sun, 25 Oct 2026 15:40:37 +0900
Message-ID: <20261025064038.81674-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025064038.81674-1-mynameisjune111@gmail.com>
References: <20261025064038.81674-1-mynameisjune111@gmail.com>
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
