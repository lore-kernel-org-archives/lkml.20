Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC654A7C83
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965752; cv=none; b=rGOwQN13VMwaBd71DAEHs4RGE1AdrWbOTYyOg0rVee0WZ4mI2mnFSFnuncD0BMb0CaMsD0yilcfCwYPAOw45+R0c5/azH3fPTpGZA5uhHCVuK7quEsm/qp5y2HHEy/+c9zkWhIGJEIO/GUYJiYJI9vyoElymdtiRRJV2sIsXQpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965752; c=relaxed/simple;
	bh=wSZ3zwnVBwhfAGt5ifjj+oFVu2p72JS9QMJwu71vpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7NDFLkxu2Ptm7Ir+pf2Sk2L7of4cAw6dXGI2HdQn6YxwUNjr/qtRbDz8jPRLYJuhvbptxd3E03LTqxNkfjc4mrDvySqSacU3DLSBU86URTkEwlitu8ubCU5MKno+lyVxh12Sstx067kUGnZGhhZ1+TMI0mJXLI2ok7I7rSpBHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhOGTsII; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhOGTsII"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1965817a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965748; x=1792570548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=DhOGTsIIoYoFoB3HtfXJWqtn7l1e+BYak3aD2IASvJXXb0az5D4s31qAwUTcZTI6xH
         STxLs0yiX2k9EqUmxhJhc+TBis73InrMRrjzjA5anO4QivtSWElt8BoXSUrRooMclyhL
         yW8Nrkp7Fv/86wRPB28BTLAJS7oVOaHmW5I/bttvUUAT0Akq+NbHIa1mqy7F8fH+E1qG
         zXDtMChb6ojZ6Qu8gTRLos3gWfMqHYji6g+uqLXbPtUtou33y3ioHUDrr04lU17oDm1l
         a/6koldbij1XRjW1kbpTl1MqWdJuN9S0d3SWuZeT/GbYLJzFyrcmnrJGrIWE1evdhEhb
         XzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965748; x=1792570548;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=PXYuleenqqHylrg6IxpESrEe39zlsSXD8Zk40EGX2MIVAdJBnfonaEUiU2JBPcfXrc
         ttJ5MLx9NyXpZ7x3HlJcg7a+1NV2rM6EBgPbMOOPiNweurIHSdfGUQIM2FoN7XOUBrWT
         8f9+OAEUPItHwLg6U3UBO5WEW6tfvV1mTvEIbZmURfUah1M9T7dqziBg/8ZpE5rZaVMG
         icLGMrIyBY8kiKqGOPyaCc63lBnJxaE+TaYs6Bh8L8Yae/lcsYVmG20/g/KA8lPcieRQ
         4VqjAQP5pFSi7huNT/ycipBDiQA/btuCbYNiqo53iYX2K9DeMzSPxaIMx9lPHUarUw+N
         h9XA==
X-Forwarded-Encrypted: i=1; AKwUvBxHb6Ic/7AeMlJdSSx/ZccZVtt/67wcCP7A/S7pQ+njNdRLkHgtP7SWLS5xxmNhTLmeKlgiINf5IwC5GmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVT8Y/ZWGEuv3SppWM0a8ZZo1Zcv4AsIYpEYz2tOBoLulrtdy6
	UxNixVco9tb1WFhSoVXO8PaXSDEzZJzSkvAL50vbruqrXWuZr0tu5ISX
X-Gm-Gg: AYBFou3dXiWBRtckULZNPvOGLMd7vxrs5cySQhOUNXAeKcAx29xbk4Os6Q3haYbcs/S
	oan3FDmPywWdhsxjt71ylt8PeD+mdFcysLASY7du6symEwMvEKPVR6Mgfe7xx6/auN9xnDoUVp7
	w8uCtKKjMHZSnzTk1kWDD1f+uR8p2IqfRXyRerWpB0JXygwD18SBM6F3FXf7qSULhXhJuf6ziPs
	wwUjAX0iko+VkhlKWboeOoUwyidoIkfzPL3zjsXAynI/nS8yErcTTdnI4jfXC6f3aQAXGl3K1It
	9EVlgcDgOsS+CNSI/X2wrOj6WnW7ja45+U3aNqX4cRophaMml1QxAxShMddHjOhaEeRyqJ5JhHo
	4Aw1/79o43AOBawr+tj9SLJodvEs1CJ7cxp6wTbrC5z6ojfRXdTP3OnMU5f2qIwtMcxFHwNLkYy
	+PSfZ6bYLpk6ML75OWA/gJSbF0c2vMAHuTYU6NqG0ET4N+6OHUFj1SwF+kJSgD6Q79gyk82Jsyd
	KfURnJxx1S85q3r2AlL0P2cnqvTe/TuypM5U0AUajxnGazHFXEJRYAeoGmlFbIURWdVszhnT5X+
	K/ll5NJBMn5HHSl8bV9ui5waRA==
X-Received: by 2002:a17:90b:51cf:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3abc370392emr7678451a91.30.1791965747930;
        Wed, 14 Oct 2026 01:15:47 -0700 (PDT)
Received: from localhost.localdomain ([121.137.86.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b757sm3569229a91.10.2026.10.14.01.15.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 01:15:47 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v2 1/2] ALSA: pcm: allow capture reads while draining
Date: Wed, 14 Oct 2026 17:15:43 +0900
Message-ID: <rfc-v2-core-capture-drain-1.2eddd58a796e497f@gmail.com>
In-Reply-To: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
References: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow capture transfer calls in DRAINING so already captured tail frames
remain readable until drain completes.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_lib.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 4d665b4148d7..de952f639d3b 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2208,13 +2208,17 @@ static int pcm_sanity_check(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_accessible_state(struct snd_pcm_runtime *runtime)
+static int pcm_accessible_state(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
 	switch (runtime->state) {
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PAUSED:
 		return 0;
+	case SNDRV_PCM_STATE_DRAINING:
+		return substream->stream == SNDRV_PCM_STREAM_CAPTURE ? 0 : -EBADFD;
 	case SNDRV_PCM_STATE_XRUN:
 		return -EPIPE;
 	case SNDRV_PCM_STATE_SUSPENDED:
@@ -2320,7 +2324,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	nonblock = !!(substream->f_flags & O_NONBLOCK);
 
 	snd_pcm_stream_lock_irq(substream);
-	err = pcm_accessible_state(runtime);
+	err = pcm_accessible_state(substream);
 	if (err < 0)
 		goto _end_unlock;
 
@@ -2388,7 +2392,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		atomic_dec(&runtime->buffer_accessing);
 		if (err < 0)
 			goto _end_unlock;
-		err = pcm_accessible_state(runtime);
+		err = pcm_accessible_state(substream);
 		if (err < 0)
 			goto _end_unlock;
 		appl_ptr += frames;
