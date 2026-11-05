Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837366;
	b=TJC8sG2O7ADLGECPD/Ys+3sfEB1iYvKCdch51A64YiSKrYH5vuRnE7iyG78BVk/CZg28
	 O1F9QAMO6FBT08ZCYSOvv9RpHzbgGiA/rgOd5vvSIZQ1HBIPwYmoHXrdlrL6Haf+mH8Bd
	 g1rnxwGMkq1xlm1v7drSTZijQV+RNaTTBY0xm2vefqLoLCd2yvIvJMDA2J3tshLfX9jwN
	 GSDM69TdSKmBBopSgQ5187xjpH3PlAV2RnWBH/eCu+r2KDEYC5sooS3IlzivwUQMYMHQg
	 2VtrLJrtPiOwrIG+1X2VxaKJi/nxCmz54J6gccyKMzEm3R7aA0l+P/1yhkl9Ckvqc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=dm2QF2Z+MpwQ4gci/PTpiJxh5bzkT/1JXgntaKxrq09VkDrrzubpZGFf1kEt5s5T16la
	 OqMaUhLt1Yj4p4xS7dXYkBfacprQo2gYDxLjpmsAOI2twZMB9/joYtPLRxx02gVpi6/Ph
	 ixyMtUa99nyzaEbEKO+ssPvUh3fce73KSDy39xucaVhEJn0PvVzeK0SFkC/6tDw6IuErd
	 jtYtcFBM41LtVTd8jtfYPHKw86CoBJ+KhwO7KdnpIFdCOF5romFWHEYe5OQSRIpl8gsBu
	 cJrdAu+s6gGDNP/J1eAjWoQCzcbbD05uQOd28ohOLp/3aZx2nKnWsNlXsPtOcgaleSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzYiptT3;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7394E606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7394E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzYiptT3
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so673389a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837366; x=1794442166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=KzYiptT3HMTpwcUEgKTEdOZ1adOzA45MiGDH3xRGwEqKAkU0HIBEyOg9QgZ5eDNwIt
         WoJ09SFTFlA6x8W4uHWRI7Dr2kKyk5pkPrcz8swIRzka6lHPhIqFij1L+pJKyRmcPeaJ
         AhyIR2aVfOVRTG1waXp7x7jMI3m0u7UtabMGCq2TSnkXlY3Z981jZwJ15eut/bcCBRYk
         4r08iNX7HUJltHCiTqqmfyHX1+GOoL1v/6/egB1yH2aLEXKDQ6MjDQET677xtfeY820X
         0U3ZYSgKUV19epd+rkM6xY8M3GFLZyR2ySllE/iK1pE/o6mXHl/6tmCQkmiQxred/Cqm
         wkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837366; x=1794442166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=dLq3p7WvsR2rsulGjmXciJaRgom2xgXU//rPcQhc3ho/vzbfs8/uoWlQ2ujYS+5pbe
         pBhrN3Ula6bhidQ0+DrMq8dmOhDG+blmAKi3nw6mjO/oRPNggGbixgjSRdWQEA2Vg+yS
         ei6GP9xEWd92nb5dWYMDfS+xuYv0CcV9YyhtDDLvU5XnllTgnkAUrICFtdts4crb7Zch
         17TWSpZ2cPyT4M0A4yAkLrptTqfRMDXKrLgLiPrmDGxDvpocU4XAwMIWlkPdZgqOy2ws
         SxeVeWAgc4xtUCTLknxpoqrfXMGGBjFfAnJSRHw3Ad7ZUs56XMQTXOP4eqibk0nnndNi
         j/cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyjPdFTriumPtpO2JHdQd/oEND5me/v6ZxPzwpY4rbf0TyqpkDJVcbJzfnqi3c79mCNgaA80NbNduPy80=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2DrfWPdAW0zGZK4nQ8JxCWdslIBKRac++bmM/VDuoQJYgOTfH
	adQWk3if+h8QOzeLqUTpG2CEvmyugqLPmbTR5MbAk8Iogmaol694qwU9
X-Gm-Gg: AYBFou2BnSpGAu/L3yBgqGPokvkI3kr4o0wbQij9Of3IOe7BLgWkl7ECCNs3hcKi8i1
	RccoAYMIMWnLzlFwsSBuMmTUtcXTYXBcq44MgeI8Som2t0aydSshGUJOYxYi1idzRT4Hfod/z7K
	7rvZWYgp65q7adfwynQcPr5ELPWGPTPqxt++1Yb5vN6Uh59DzxqPuq0/AY013yx4LdpoKGoBSvR
	rAzue0vQVazJWWddBdKvSs9+OL2LSRrEmJq9xVHrSdeAZPWvDluRZvj2XAWgSbaiIUfXDxsfVpq
	rVt6ho0stbsE4SMyiZT7Sq2BW0V64XJciAOPD/nC5Fapu32qsCSEv1nbqGiwJCx0bMTKEojcNRl
	K6884qOgCHMtTw8GUTxx2BqGjAAj4up+5uPRAVdcGmw1XaA2OEWQKiNu7dPrmRmU5zSLUw/fmHq
	Bf5IiB1j4iw0OgUhgF68MQWgK37FSlStomSncxOLVr3zziTmWBVNAXXs9TNE6E/jB7LUvEuS0dD
	8fTyGvsH+1DYygV+fRuVdEipDC0sSm3Lw1vU9mJ0J0ArFQL3s3oiuNUH5PNQl/Ra+zyiTUnssLi
	w/FxCpFcRvpGgo0CuPu3nMa6MkAna0Wz1Lm8+TInG8YaOxGCdKdNHT+Q1GhTY32i/DDODdHv6Rt
	5/mjCKg+bMInMWBZCOfw4RW4I4X3UrIoO0p7pd9FKEmUJTBY=
X-Received: by 2002:a17:90b:1d46:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b0a37a37e4mr2097706a91.25.1793837365788;
        Wed, 04 Nov 2026 16:09:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:25 -0800 (PST)
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
Subject: [PATCH v15 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 09:09:04 +0900
Message-ID: <20261105000915.15177-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
