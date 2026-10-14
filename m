Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667653290C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948658; cv=none; b=DKJyqMcTKrCBKpxPL0NIaaYL0f/4PxJlSiwwBIHuWO/qTF4GULbEgj2IP3nR286iiR9ZleDBTpzd3h+Wqv5rxoP7NAd8jS6FkK0rNeHi4IxMAgWs8c08ds8ManbBsz8bxnyOQsAyUjY529yfe6XdmypWCKtGtqPVy+XeDI7ffxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948658; c=relaxed/simple;
	bh=wSZ3zwnVBwhfAGt5ifjj+oFVu2p72JS9QMJwu71vpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ewpy6g/YayyIjWnr1BK/cKYXdpzQHcw3Wdcxx6V4Bv7jEY+d0pqcFQopLU9DLLFx6221QIJb2yoQs+eIXASVfw30barV1gCecJNMlvP5auubZH6V6HjuSjoLbtnTvaLE3IQpP0ynCfb09QLSNHGECM/D59vPzQsCg+ZYBjH86QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcIxQ4fQ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcIxQ4fQ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so351667a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948657; x=1792553457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=ZcIxQ4fQPwR+TZiLlaYG55ZbbYOi1loEwJYwfyOl5fwpJw5SgsuopKGGI2gQ7QVbi9
         oy5ubrcbdKHjJhVQy8k63wasDtxiw6edStZHnU+5XYnoHtDMghJcA8Ib6zPK9CMLoG30
         mAmnjmwCbgH5LkLTsbs85hObKQF6h8MVbcsSQnbyoqDG5WB9D8S/9Gxj1EkYrsuUfWE2
         S3vbS7+KK4QwiG5CdQ/jSL0U8lFuCaC+i8vYW3H71y70K+VhW8e0nST/5RSS+rlgdAZS
         6SV2S3hJZQsVVLtHwJPtK7k2X3FQE2bNJcAKfGcT9ngSKZ5oYf7IL4Gnv9erDYMZSKpt
         pBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948657; x=1792553457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=D2ifDUIHZwFdktfB5NFUFjc6Vr9Et8zRD96MKXUhcfxsyhni8rX3QZK0aSFp6m9rR8
         4QeLRi5WoHYMUPAKLrfFXRJpycN8Ssm2uYLg4MaNX94e5oSmwTPSojYn830thfialo24
         4jaPgX90fuPj9+43RVETfmfju5+K5bIzPPJf6ShjDzQbYUiKk/VMyLPcT5l/SWqmQ0iE
         NfXqnGyc6jWuAgLrCb6VQIpUkv6jB+KcPS4vk4REObCNYO3zTaegDeRoOg1ILOdgnvR8
         LSmnZIXD9+No3tETFpNf/dDkWAx986+KSZOzr0PqcmrTG6GEG9OgfwOPRaut7fIeTpTv
         7C9w==
X-Forwarded-Encrypted: i=1; AKwUvBzFeXYsyLt6dKxSdKOIkY/J7GI4G2hX3+oozQ6w7R/lPxbPcZs95SiUWNFs1h0DDgIvLi6BVMyK9nlQvF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqEZwnhV5QsMoiVCrrT036AmkkWOfAEU4cp/tH2fCKrtkUfTYO
	DI9iKJbslZ9PWmIhluHT+Qqe7PIzeSd5jDu4ZbDFlwDC/zsA3qVsFO4KA4SGwg==
X-Gm-Gg: AYBFou28OQ/iu0ERK9+wpONgSrw6ngFzK4aNj6nYnOkh+H41oqc4FZYexLFGkcgue8B
	Vp3Ivr+QhHxeeiNHRDYccj7TNL3CxXTK2jfYGFryZsPAn42Et0IhD77UNKqolIsLVzAhefdZtu3
	rwruMUSKW5FkJevIhHgXkPHuRy3J5H8NLsS3/enZ6/DUOKDy/8fIuLZG6g4KU07mwcQqBhS8n+L
	1+H0aeawXWwSbJ2SBCKAwm0t9Dl4mAsh6LKTXGGRHzKCFTMV94imp4B36nk+V5G5BKOvzQTgadL
	iIxWk+sGJwYiM5wWsP4x1JtD7ZUw3hi+OG1GhL/7QCS+RsmepkGgwxXr26TDcHfbwzhous8NJlT
	WmgmuTlVDcUtG5rKdQtJkwG+oA2R3ig5LF1y6fh7EAM0hvCpSncmYqa3OvkP1Figs5vNX5ic9X8
	YsbDY2ev382IwoiNISx4PZlI9E2ihGYHnZDGdcfdAZQZEQfhqvZMbHAKEgaewak98PMQpVC70m3
	w7advb8eD9brM9ekHcKMnLWJKdxnzwdDiFwrBs7iEkzv4PChgNY9hY+Uv1+fBQN7qbJXgiJfQ33
	vl/D3REt0heOlKWt
X-Received: by 2002:a17:90b:3145:b0:3a4:b0b9:6b3e with SMTP id 98e67ed59e1d1-3ab3ab40fa2mr11879030a91.36.1791948656754;
        Tue, 13 Oct 2026 20:30:56 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5ee3093bsm3301344a91.0.2026.10.13.20.30.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:30:56 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 1/2] ALSA: pcm: allow capture reads while draining
Date: Wed, 14 Oct 2026 12:30:52 +0900
Message-ID: <rfc-core-capture-drain-1.112c40f0e9284eaa@gmail.com>
In-Reply-To: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
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
