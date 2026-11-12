Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466180;
	b=n1JHlSWBiQ7jge3SiHQBmNpRq77q2v6R+pCYs99Qh5RrQk3gE/8lNk2fQmU65/3EqA8c
	 wonfFP8SDEPeQqdzstehqLqMTnA5c1vfx4Cu731SI+Jr0SY6MlqICBMHDrQ/zlvYNmbE+
	 ZoJsRvQNRSS7NSFZYXHNjbdB7kceHHgqUl1OF5j1/aASv3Idw2QLl2mMW2+sPz3Ope8GQ
	 MlqgQd2957xfHQfho6L0Fv2RW6E+4ctWeKqgiNVCsqw7va7annrQKfa1jgs1COHvQwUov
	 sy8X96xazYzJJcsobR9GyOQPkVXWQbwNidB/X4yP9Q7ClNfmAXlyBwmmhuiAJLkKX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=f9DEigYuP/gNUi/PSJse6a2NDnfhz+LrnAuUcxDtMNlHUDFAElyzglXpkozQHCqss3a+
	 1Z6tCTKiMH0+SZNgCOWtfZ03gs+6J7nqSuNDG2wG2ytLGcgXi5nkCa+0irVEikNSlQV+y
	 95ZOpBs3EigsyQt7pi89RR8mpFaQPprwxnIfQT99wQm/cVArX7QTy9GesSTpP1m1wbrJX
	 wksIDnZkCR1ZFQ0kNI4HQEDG/BJJI44faUGxsfG+3kzRu+LxyZK8lAY+mmhPm+Y87f+hn
	 faGyqBbyYhYd4EsxWc+lXoLdBI/yZ58++kRj2mv9XUssLBk2ZZyoxT3rv08Kai3I4EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="goqwm/iU";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95FF606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95FF606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goqwm/iU
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b271e573adso1535971b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466179; x=1795070979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=goqwm/iUnzzSoI/jO1rA0nrlUA2LqEgD8+jxtyvkTVbn8KpBwn5ptAG6gyEqulz2XF
         sXafkazu1RvJ2AK/yu4k3FJyjmsqpy0l/mgZwinua70n4X1ijoNufzHI9QteSE4sVATe
         /drjQOCitDPmmV6RvbNWyJqyvEegtxxub6yzwi5VClseF3MsMoBzEA3pDvRaev0oJjub
         LgIEC0LaTOCLweYrL2Nr+8A2h/SVknrhXfipDlAEbLZ/saoZKsYgD9o4HAi6kQucyzIX
         t8M3EFtL1v/YJmm8Cg6k/yUo/JUOBQnQSNHO+JpW3alincxWTkPYP5pR5DDMElQeGUp+
         xAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466179; x=1795070979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=F1trc0XNvvCHQpxlmLl+nBL19rM72U8wJ7D661Hw5ur+bzlTYoExX9V+Y7EzuPCUBg
         cUkj2LIB64ihivE5tl13gTabwjtDGc4J9rXV8bKPIySnH93hTEyLo8lpYYxYkVyE2clP
         gDZP8we13pbmEQBuSrnixaNmqpqYbFtoX9qNdFDQm3aYrpIuY/zk//CvHOf3gnjoUL0T
         iFPGkFPlkwV73s6BqLqQn3csVgMd7VKt8NbHoq97ixbUspO47XAYiTGtzJ/Ag2Q5fDAa
         deVmGc0AQegwV9REpvzxaQ7pvH79+P26gxi0Cbuu8co7MMIyTZLumdFAWnIuZoFDAmKB
         6GMg==
X-Forwarded-Encrypted: i=1; AL+hErHQMQI3OnTkSknK7jfXgzX/xBCCJcd45W8oC9eNqfGmkOssKZU7DVpDPqnFcuUcHlPqyZeI1NkZsU2xLak=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oVhQjS4aVOWF0sEV5MftVx2NYYdzWlCQ4fKQlCGtv1foImepu
	cudU+kSjAzgnyHqKP5erTNyjbdRkHVGGxp2kwyYcTzeZKgnhx6AFk0EE
X-Gm-Gg: AYBFou3vfMqg4EAwSjZ66Ihklg8A98FV820jo7jnfjlVs3idegBjAkGTedx0PTOgYWa
	8+oE0hpOGxaY0Z2WlM3yWaSgkT6MrOz8dPUqu/iCbJlw0QtDHqnwltC2aaSAjFHEQtmuBl+JLJw
	wjp3x4tlCPcbeXCdBmpntYiM/cuh/WNV047uSFvx9d4jJyOj+1W9IskAz+mmzTqXmy0JtJYlnP4
	jM5Puors0Y1hN6TuOY5DE4c719tQPEV48MnKT1Q9xDPCSxMtZ1fAVaeEMkJGKrLvrRW7S4dwUL9
	Jq8XzAJ27P1RD12wVW9c7i/PDe1DH6Fj2mWWMP6w1fMyB6c0B7x28K9eYuKhMTJcxX5fdftao7l
	y5WTac5S5pDCT+nNtuqysn4ywaq81baDoERgml/SBiaJvo/9srQ+qJaV9Io+TkJN4QVYTPOGuwM
	mtc2knEPtvUYZykEKWrx43b+0G9WltI9tXk93BtK13tjPnj+lEXOPtrgXZkxTOL07Zbv7TvjhPc
	YxznYrZ42kQWk2UYzywRyHFs36UdTVVv65kHwHMGMyIzRbaJrt8oa2EMCeJDe/+10TFNFFc7Pvj
	pgmGspYjl1v96GwrUKpXkqIn1RH+7fB+NClYAnaGknt1h9wbdHJXnWaLboF3eWDhMI8b1EjnsjC
	sYaQOi4lmo3tdIxogLj3YbXQz+sz99Qt2Asm4ba/htqIeaFo=
X-Received: by 2002:a05:6a00:3390:b0:8a0:76ea:36a2 with SMTP id d2e1a72fcca58-8bc1deef1damr4766908b3a.54.1794466179289;
        Wed, 11 Nov 2026 22:49:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:38 -0800 (PST)
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
Subject: [PATCH v31 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 15:49:13 +0900
Message-ID: <20261112064929.11211-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
