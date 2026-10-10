Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABEA255F52
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628678; cv=none; b=tPfai55rGvtaPxNv0mGQoan/3tXCyBmSkLOZIPYoyMKuGuSEZo4zweURJe3D3ba+berGvFLtvKw3CpB3mRYxpmJ3/nBaN9ix+WKr4Vx+MzL151m+40730CDDzUbBoWBsW+NGU0+qAM7Qi0hij8m3pSod1aL0/nbkrXzmDP8gdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628678; c=relaxed/simple;
	bh=jkRZUjcR/iHQ5VzCqNLA9f4Fe486oeWzrxRWKYMer1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQWh4O+wAGy1PVtVVSpokYi293UcpfYSFuAjAGrTLiy/6j99rk3fzBT7fzjylvgaeOmwjv+d9sqZE55wXkDRX6T9AfG7+qvXpSK0Lmc0ZlB0lvecDM6mdb5LtqfrCQaM3QdcbZhtDD3+lENzsyQWYnR9/h+ujflju5FzFESnVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4p6nV1E; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4p6nV1E"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so1097957eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791628676; x=1792233476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ew2+S7G29t4qe/yFqpVAE8i/VYjBJqraXtqLzaXbyEQ=;
        b=n4p6nV1E/syK7HIIFtetLHBvYz1Q/tAoO5iA+sp+GpGzDbKFgj9hHo0WQbXdn+jQvm
         AlIAojqM6qvKUBRQByxK2QsvOGoHnCx4eqaiPRQDtE8UqpLRIJZ6spmu70zJShGwMuNF
         E2OUgRTv/bB9phZykkKFqdVeIuVMhsYwskTYgezhgX/yrYEOtG/PP71vIj0DA2xED0Ze
         rV634L0tnM+l1Su8/G9r2zHmTYU90jG3SasrOMyz3bKZOn+5YtYkLPWn2dJ/3UaOQk09
         fOL3blSChAiw+Wu22nPsE+gOBA1IkxndlGE/sZtENk3Du47z/K+MJRNb167eAzfPu8qe
         vaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791628676; x=1792233476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ew2+S7G29t4qe/yFqpVAE8i/VYjBJqraXtqLzaXbyEQ=;
        b=CX1kv5LwTx1nhJKCrEJ98706IIUplkhD9d1xv1EMjNg2naSh91xQ9Ekfh10YQxLhwb
         f7qzbIxt5MprjtAJ/Ey2Ge5ZiD3KnkX480OfPdx0TyrLeRnYqvMdc0nnhh6Nq5xR54cG
         toKbXSv0WFqQpgiZNshXf/jYK9DLCzUb/goIWmIqn6xGDSnt+TBet43C9LlKHV0IVzoX
         f4eY6liH5SpeJK4L8GLS+yTB9xBXntIowNNb+tgOY7biK3eEDwa+Rv0HSFQ8OtIIDuQx
         RL9qJCIrbuAix7hxXDND0JanVdWMrdvt8d+9bIlcB7wAckPPRx0rQcy42vPbZ/4m7Nn4
         vrLw==
X-Forwarded-Encrypted: i=1; AKwUvBzkNjNzE24XanMYi0PVnMA19jA8/yp9Kr+1ybgm3FhRSGeyN614mLwG49pjbXAlevpc5s14t2GpPUbtj2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYInMlvZ8XcUNJqDsA9hMKK42O8BWYJC9EJq+NhumwpBD7qh6L/t
	DC/zBgjqk08YBhQec6mvhg/QBNjltfLrH0KLZqL0nTy3cO4qfwCQ8+DO
X-Gm-Gg: AYBFou2oXq990YlNbrAO1MyE6eezJf5AH4k5Uav2Bjm7DX6A+RynZFJG8MZc6zQEUpy
	xykpEET+6IcvaxdCQ7vI+B1BGCb1kVMrMz3EhOTEL9kHT58d2jB13CxIho64yoig+jkEfzgcFOC
	Y9AtlPZU99vExEqCHWrmQIC3jWxgKDsmglyONDfaC1AXF5YAEjcTHNHa6W6Ux07A75dZSpRnL+R
	4p5aSP7szMy3nzCq57277Wd93ly5uMqCs+m46eun4omIfjNB/cA8nA1TG6PCZnsQsBVLK48db5C
	YTF2Q0DdqbxepfLyzkgnCZHGjwfY0XMvLCalMreX5ev9Q154SMYSfrYKE1cL4gTeatSs7fmRwDg
	plqOfUvauFl+U3AkPENIpEtlrY8444WTL0uWf1nWfAQT39pxTP87x+gOXJVp3296qNIkJaTajkO
	fS3VaViLYngVglcIciIFfzvylQ9S9EW0SDagdbvdPr/b4QOx3PLrVxnEL88xOFC4KnGmahGtl0T
	VW5pGaQOFmU7I3eKdC7DHESQPARH+znhb+AYpSaZHmPxY+vRflWwa+kkXoNV9PudIRr1DyyNCuF
	gns=
X-Received: by 2002:a05:701b:4549:10b0:165:90af:a25f with SMTP id a92af1059eb24-16a6178a081mr5322235c88.41.1791628676125;
        Sat, 10 Oct 2026 03:37:56 -0700 (PDT)
Received: from eve ([2601:644:4300:43e6:fe7a:b82e:befa:cd4b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm12153545c88.10.2026.10.10.03.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:37:55 -0700 (PDT)
From: Sergey Tiraspolsky <stiraspo@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Tiraspolsky <stiraspo@gmail.com>
Subject: [PATCH] ASoC: Intel: avs: Reset the stream unless it is already prepared
Date: Sat, 10 Oct 2026 03:37:53 -0700
Message-ID: <20261010103753.16969-1-stiraspo@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when XRUN
occurs") resets the HDA stream when ->prepare() is called in the XRUN
state. User space does not always recover that way. PipeWire's ALSA
backend recovers from an underrun with snd_pcm_drop(), snd_pcm_prepare()
and a new start, so ->prepare() runs in the SETUP state,
hdac_stream->prepared is still set and the reset is skipped. Every
recovery attempt then fails the same way:

  spa.alsa: hw:avsmax98927,1p: snd_pcm_avail after recover: Broken pipe

On a Google Pixelbook (Kaby Lake, max98927 speakers) this happens after
an occasional underrun during normal playback and silences the speakers
for one to four minutes, until the PCM is closed. It can be provoked by
stopping PipeWire with SIGSTOP for 0.5 s during playback: in one run
that single underrun led to 1297 failed recoveries over two minutes,
until the sink was suspended. A plain alsa-lib program that recovers
with snd_pcm_drop() and snd_pcm_prepare() hits the same loop, while
snd_pcm_prepare() straight from XRUN recovers at once.

Skip the reset only when the stream is already PREPARED, the repeated
->prepare() case the check exists for, and reset it otherwise. With
this change both kinds of recovery succeed with a single restart.

Fixes: cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when XRUN occurs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Tiraspolsky <stiraspo@gmail.com>
---
How this was tested, and what was not:

- Built out of tree against a 7.2.5 distribution kernel (Omarchy
  linux-omarchy 7.2.5-3, whose sound backports do not touch
  avs_dai_fe_prepare()). The rebuilt stock module's .text matched the
  shipped one byte for byte; the patched one differs only in this
  comparison. It was installed in place of the stock module and tested
  from a clean boot. It was not built or run on this branch.
- alsa-lib reproducer, no PipeWire: on hw:avsmax98927,1 write four
  periods, stall 0.5 s so the stream underruns, recover, then keep
  writing for 1 s, recovering every further -EPIPE the same way.
  Recovering with snd_pcm_drop() + snd_pcm_prepare(): stock 958, 228
  and 526 further xruns in that second; patched none (3 runs each).
  Recovering with snd_pcm_prepare() from XRUN: none on either.
- PipeWire, SIGSTOP for 0.5 s during playback: stock got stuck in XRUN
  3 out of 3 times until the sink was suspended; patched recovered with
  a single restart 3 out of 3 times.
- Patched, also checked: HDMI 1-3, headphone playback, headset and DMIC
  capture (repeated prepare and both recovery styles, no further
  xruns), audible speaker playback, headphone hot-plug, and
  suspend/resume during playback. After resume PipeWire logs one
  "after recover: Broken pipe" and plays on, on stock and patched alike.
- Only one machine (Google Pixelbook, Kaby Lake) was tested.

 sound/soc/intel/avs/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index ad25bd355..880cd7a9f 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -756,7 +756,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	host_stream = data->host_stream;
 
-	if (runtime->state == SNDRV_PCM_STATE_XRUN)
+	if (runtime->state != SNDRV_PCM_STATE_PREPARED)
 		hdac_stream(host_stream)->prepared = false;
 	if (hdac_stream(host_stream)->prepared)
 		return 0;

base-commit: f90f8afb61beb268ca8092e7f3a826b520d3e8da
-- 
2.55.0

