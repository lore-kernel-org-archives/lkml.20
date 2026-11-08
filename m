Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182110;
	b=Ej1xOA5H/pNSjzSRoE549vfyTlbqiqyK+bw4hzWsCOjwblH78FY59ZnXjbx1RS2wm8wf
	 GP8YIsjGvjER4bH4ovjNay/ZSmk9/hKV+hQQCWsmS15Tq7ptDfYu1h5228Gd0fw+PaWB0
	 geb8JWlTkqcZgZZpV4c/r/ZKorbG3VHdHvl4RYesmyb145Y5rB+QetVdOsiEPFFoHe+zG
	 pbg+alObLITkUqheQ4/nUWwjhScpccuc4ROl6hN4peM/Snndeqabq5y6qqoVPQ0AwXst8
	 XnweHrBVy5bL5kMhpW8E9xyi2c5yIBbZz39zqTR2LpmLlWgkodt4sH7IF76kZmDGGdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=f1pYv9rQTBnP5SLtSfpb4XbbXPIoYIMgK74L3TmCwovB7jXU2uVvn4aHdI2un1YW1LUY
	 CPFXDD7dAyn5H1Ia785GsmgNmhimETCkjxmEs1MdggGYDNdMYZBHlh1PPDEtJaksiS07L
	 hBkkXGUXPeL7bf1KeJ1CRAjzjdunSpHaX7nItKVrdiir1Re21OBZSnXjX2Y/WDabOB4Gf
	 tGnkhWziKS5ZrqHSojuLlnKl5SiiqSLzuffQ7usxnVBcmfMWCVvtWdFuzaZrtFxhzFjrL
	 i74FLaOXOoZqyDczceyFZRGLCEEioD63j3UyNnSfjSfNHReY+jxFBGVZ1ZTUjpr+p2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcUIo68R;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1284F606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1284F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcUIo68R
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed39646f04so854835ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182109; x=1794786909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=kcUIo68RUScRY0ZqUggpTUfqo+8eYwH1EDLHD9KKqiPbN2cs8Vl0f8o9MgEKge2UQP
         k5NuTFWfBjUDq+qkDH1a30+Ct+MxtIV8trUWsPC1VvHuhfbuFEFmDaCPV0K2glNaIh9B
         2oFmhi0KqgIBTkWOCc6wcSHxn+ICs4yi4ZNJ8BM6089J/KlGzfo7d4dTekkUmL2IWmRz
         XFVlhbrFWn8XKL01NYr8Yg+w+4w8DE3XUG48+O749rwxK5zR7UPPjlTL+rDmJ/mboZZ9
         g5uHw0fgfFtvn/sebL9kb9WrTAd8eClTeZ0Cjwxzrk0PhGdAthj0h4QGlmHb0scgfs9G
         eatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182109; x=1794786909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=fB1HUJHUmbL9Q3n71+eV21UQy9J8/ryTuYr6+RPeBobd5+U9idLzs9bnsIDQ74AiN9
         bDAW7jYajM/hZbF5pC5BVVgfIXbqnptVPJsegbWVjbbSYhuWqNWG/tnP0pwr1sbdjqLQ
         bUmfpGjhp0Sd16qviqJlDWyXL1egS1GrJlHtn/7mDD/MiO4f7HFmiTE9VH4MmlLg+46Q
         jLbQE9fUR79vnwpzhhWgOGitEwJhNndEZw0Bx6GY4/ruq7WwQYH7AAKIvAho9KDM9QaC
         ScR/AEE6LX06M2ZqGQeC6M8kaabqeMlZLVZhykBQJiSIVHIb8WAul1OHr1d7igDuQmtn
         ITpQ==
X-Forwarded-Encrypted: i=1; AL+hErHDybpqcwSSLVE/BrI5JGPMEw2+DajmPhq2WaRV3gna54kYPxkPXynvJ7sKjH9DxTo+FxhmvSPMXrKnDXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m4eSdcYfkhnxLTpNDIHU693ITQArJrk78HEz7NdkU4vXI7Z+3
	a6fcZESwI7GgR/fs6FfWS8hLEqUNuXQ7F6hzdfm/LG38IUvU44HjrZMj
X-Gm-Gg: AYBFou1DR7p7H+2Hxwn72RvemfqSvazTGNT2mZ1MhBQcUYXPTLIbGNFMxoD9FMTyQ0J
	dp4ClKwtEun3zIausuIgBaPRjffHq6KkOGYp92IR+tuendxbNRLMbdSXDtF/7YuZP/3io0VUzMB
	6fYcZFUnEpBJhsaDttDdNz70uc+6jfuwWJE/tI5r//1934rulcZ7NUEFXNzocTMpkS6nUeCPLJ3
	r0adIBZEqkP/no+B8pPKlnB3uq8DHJgv5teVhIBrjIv3I+aviUMNqBc/sVjnZ7GTG5I0VLIBVGP
	OKI4O2RQrETEaLdr54bAQ70RhXjkkYtw7PkQyQ/GoGHso9h9Ytt/m58WEf5WxJsfUtfeN1gyNvQ
	HJjQ3x8a1uqm89WbWG7r5G3dVkQTFaNgH1gUd+J2tkVCOzcfI5krc0UkvzkZVnl0Lir4wXPH/d9
	5pxxo45sevi5l6EDf1vTqyWkpXme0N2P8d2BFDjj6to8n++SKHHrlW27nYF7kQld/XXjQzeDqst
	d+t7KgMOk/dTIDQslan3PML+iD/qyaFKUgErdd6OHCLBFObuQ8P+VuQ0HPBU4dvnkYELRuHoVzx
	YTOctVC3H/Wb9KjsvoWJSLASVJFVKRzm6WY/D/SNv9ieceENKHpKwB6KwjpFmKoPFi39RqBpwmj
	/IpLSFcRVrRA5CWOxWOJoLto/8qLTJCHpF//aUN8eVOe9KxuOp24p2vFLM1Ew8B4yRdjN
X-Received: by 2002:a17:903:2289:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2ed8378477amr25176185ad.45.1794182109426;
        Sun, 08 Nov 2026 15:55:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:08 -0800 (PST)
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
Subject: [PATCH v21 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Mon,  9 Nov 2026 08:54:46 +0900
Message-ID: <20261108235457.12688-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
