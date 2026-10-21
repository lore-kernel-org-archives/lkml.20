Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615371;
	b=Z2VM7s5m/WE9/+/YTxLnEW9FAoJUtcPyydVuF38EOxPzwLiege/T23Ah15LyFmjB5e9n
	 9XQH6h2Kz4YQN7hJfaBHePQDa1QpT6UM/hAFnKZ+6gDibs04xckhM1FDK3AnT8QE7u4In
	 PiRlyabzn7X/pz16ts/r9w4IzL3pB/9nVaMkecJtFODix+GGcbJYIkuFR7rEWT3gJv6a9
	 pnjpYWuYj8GIVx3d2WBBUclcoF5kkjcJ56SMmatZhLV0v6+Oi46mIQsLC2AsQYZRPJ6kN
	 pi5fmHd8wEscSqQRAQhbTiccRkF9fWQm+kx0qX4nH97aesFF2/08hkR/+kj0jxm4Q8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615371;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=O5L1eGqPKsyqDaYtGLmBvYrSlwBdL6y7fRQobnmfAXg=;
	b=T/pKBTSNn27kH7cKr2SbCsMS48Z8RYVkeuTjRHB2Z5xtEUFq5fTB/tyifKe9EF57NW/+
	 E5nGXWFGwngrt7Qirhkyhmaluv7oDOUt10Vu6BGHoYEm4JJLAlRbi8qIvt47z4oISQuLc
	 BZ7zc64zzbI8pl3h71x3yfnuo3lNb5dj9M8xZV/0YJURMAcrBelgXhCPAttdxAjiqPZI3
	 Lns8532BXo7oeOW9KalFdVfJPzg+SCEzff4jO8LvqYefuMgFsgKUq4CuOM9JHCEFYaTLX
	 idssTSxHq/NYbNGal0MMaL7MrYb+Lni56ixnXkG1RWFPf/fxWvtRgjcKYQIl9G1wyRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=OZ+0Rh6D;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C87606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C87606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=OZ+0Rh6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792615367; x=1792874567;
	bh=O5L1eGqPKsyqDaYtGLmBvYrSlwBdL6y7fRQobnmfAXg=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OZ+0Rh6DWa2Qhg3c5QC44y9CNi1KtcMb2p539aGriw/KnMZheY1kgzjYQSQ5O/f31
	 rLX54vj3gmsf2/TkzURBTF1Y7Tm+fXCF8hEk1/DehtzWYpaRS+BYw6/l1+aNb1MOvL
	 RaKYMRakRsIPViFO4LXo0ar/XcqPwqoidY9zattiWqmcgyRlFHNBm5ojwT+Qtd6NgY
	 lV0jeMzaQjDRaYt8XZD5ztLPfYc7FVkD/UCBE5OhOQ7InrexY6iD1dkK88uRYWXPox
	 mSUKfWbZI2i6tmSlYWfeeTPDS3Kih4ULT7KoMeq2T4Nb/8Mek+PEBsBWh12K9pFxkq
	 nc94ct8IsH8/A==
X-Pm-Submission-Id: 4j91SP0GYPz2ScPf
From: Michael McAllister <me@michaelmcallister.org>
To: linux-sound@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6asm: Reset PCM positions when preparing a stream
Date: Wed, 21 Oct 2026 21:42:02 +0100
Message-ID: <20261021204202.43738-1-me@michaelmcallister.org>
X-Mailer: git-send-email 2.50.1
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

Preparing an existing PCM stream closes the DSP stream and remaps its
buffers, but leaves queue_ptr, dsp_buf and hw_ptr at their previous
positions. ALSA resets appl_ptr during prepare, so q6asm_dai_ack() can
subtract a stale queue_ptr from the new appl_ptr and queue an incorrect
number of periods.

On the Motorola Moto G10, playback works after opening the PCM device,
but the first write after snd_pcm_drop() and snd_pcm_prepare() fails
with -EBUSY and "Error queuing playback buffer -16".

Reset queue_ptr in prepare, and reset the DSP buffer index and hardware
pointer when allocating the new buffer ring. This keeps the queued,
submitted and completed positions aligned with the new PCM stream.

Fixes: e386c2cf3df2 ("ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp under-runs")
Fixes: 44432315444c ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Tested on a Motorola Moto G10 using a Linux 7.2.9-based port, with
48 kHz S16_LE stereo playback, a 3840-frame buffer and 960-frame periods.
After two seconds of playback, snd_pcm_drop() followed by
snd_pcm_prepare() and snd_pcm_writei() on the same handle returned -EBUSY
without this change. With the change, both playback cycles completed.

Both affected objects also build with ARCH=arm64 W=1 against sound's
for-next branch at bef34efba74d. This maintainer-tree build has not been
booted on the device.

 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +++
 sound/soc/qcom/qdsp6/q6asm.c     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4261c3048c..94416ddf7a 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -243,6 +243,9 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 		prtd->state = Q6ASM_STREAM_STOPPED;
 	}
 
+	/* ALSA resets appl_ptr for every prepare, including xrun recovery. */
+	prtd->queue_ptr = 0;
+
 	ret = q6asm_map_memory_regions(substream->stream, prtd->audio_client,
 				       prtd->phys,
 				       (prtd->pcm_size / prtd->periods),
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index de0bd8fd08..8dde9a3b9c 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -514,6 +514,8 @@ int q6asm_map_memory_regions(unsigned int dir, struct audio_client *ac,
 
 
 	ac->port[dir].buf = buf;
+	ac->port[dir].dsp_buf = 0;
+	atomic_set(&ac->port[dir].hw_ptr, 0);
 
 	buf[0].phys = phys;
 	buf[0].size = period_sz;

base-commit: bef34efba74d87d5c20e3bb93539fa45b3cb8a83
-- 
2.50.1 (Apple Git-155)


