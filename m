Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431981;
	b=UROGK1uz6wZ8IIHMvadM29pkpGtlGOpIvfLuGHdvfH4n0je632zXTjME13xvLiT1WCf8
	 jcuJ9z0Z9A5UkYVyZGlbrQUc9Tp7fjGFbVXv1QEvsALvVJqN7HM2zXVN4fNg/NiSlMN0N
	 zZkVbTrsJj6dDcm26MkV0zZBwKsDc+zIKVcs5oa/npl3jcWf3/m7AWDZyxgdguWiF8G9t
	 G78fELsDVO7TGM4fqagw9EJS/YrYoYg+YeOtE0eYl6ixJqLT1BsxltOO24dimRoOXZX7z
	 iCO1R4ReO0TI0PopWiTLUp+t+VRYxpwGC7Ew+4JWUzpZtluRviPxIABpUDDWrV7PXTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+7CnNyW1/5etXvogl4rTvYmOz9J8EtzTrb13SyIlpo=;
	b=EZsziT0/MMGrxZ9ndK2o2PrtDp2dBoqeOV5e7OMQCoEuzndeA2bsDRkcR0S+SJPv6RWP
	 TgF9dvkFt6kdYDkvtyhv46di/xqmYtdos9PWKaGGhPPcs8IbKhUNboSU6wLnq0JBguWe+
	 lQCvQz6WUr5bX//j1peK173CDKUbvbF7fsH7JUNcotxmbQdJUBrAtF1fBPjOj+x9KUaOe
	 WZSoI/t1ZFx1EsjbLF+1dZ/MSr9LWw1xfgYRIzBBe/iaXJEdyprADxIqsJ6sT55E0eAKM
	 GeODNKug6tmb0htC7OL6Uq7nWG2jHtaTNwKZBdSe9uM7qkFfqvCusQ6CBVCh5iTLR3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D6D3SCGu;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA9B606A335
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA9B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D6D3SCGu
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-99061e2171cso626723241.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431980; x=1793036780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+7CnNyW1/5etXvogl4rTvYmOz9J8EtzTrb13SyIlpo=;
        b=D6D3SCGuD/UdgffuuOBmkqB2nKknEry5/A3czdXmX6mkFzbPzaYu1Elt0C3OusGlm3
         uF4vmwQ8uPhHTJBYkpB4I5phq1eahWi8Q8zp22yuSjUQZ854fINm0SOg11NLdglNIZAI
         iQbdd7Thl6Dzww2G/mZDXVXqVrSIuxO0xVe4WwtkO5oSHulvKHuLiZZIa6RlN58zvc14
         f1Hdw9BTu2Uw9kCFhq5i6ygZggj/KNqVdicKr6BjaywhojvH8PlWrt3t/DiQF0sjex36
         42D0aws+y6R7MmIYBkbznllR8/Fy/uJZy4Off6BZJWWnvbdaLAsEjQQ4Yi5t0Nu+VC1I
         Ljow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431980; x=1793036780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+7CnNyW1/5etXvogl4rTvYmOz9J8EtzTrb13SyIlpo=;
        b=pn+N3xMz0bJflYS/vo5RiGB8WgAuYDK17GPgzdzJfhu9+KAadDtMnDzWlI3szAQM2O
         kbITFiuZLKDrFveXQxnzFlF/hUcGk9u33eyZYER1t5ijNfeDYVX231T01U4ugTh7bslD
         rcFowvycgEv7g+dAl6tzKO+wqLGjQfqmQd5yQocCq3hWXEOeAnCZau8mGdmYMFijM+LJ
         9kHr7ZRezveJQPrno83+J3xCYNSsQCaIGamaYFJf1IzSyc4pdgDT3JhDKsGgoJCNJ0fN
         gcNh+vm5TvPDHD4+t2hPn1uvmUGJ6SLm3MYuXmA8iUGNW9cgHCDQU+ql9QZfcECIML8d
         8QcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpJF6XPUH2fKCZFRaicR9U+g6xrm6S8PHn5Ck3NbI2gzYigaTOYQJQ6gT2ol0dr6P6MUKMG/HQpFyuYOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjQTmvKuQnvLZMduL03vvgWPYAUKpVFbjYiZVhiXERW3Nm9o8Q
	V4y2zLUbaILv6jGN+Y9VXVCPkYthi4SE8QMmtq0Ij/FWDeoHdzbPNdcN
X-Gm-Gg: AYBFou0v3c671IO6XDuQFVnnAUukxYuNC2RvKIXUjIsPru3Tbu/bzezqzGDYt/+sIz7
	SZ4725Yn9dabPl+YRCh8zERK93VuiArHkNYzyHSIqdHGfqHsVsvgoSbneKvTNiich+JPP4V5QGs
	1l2kGVGT8m+HG0IHeBDu50kT9FUN9NK3D/gbJcBGXK3U/NYxov5l5ruv0tYNSijR4qX5rq0MTlW
	3pWPFDlNYBjbFgdtCosP3AudL+ZfyW5iGeDAJCU34tFVsBNYLyq7T+xrKa/wJfIIZ/v6TgRYj7J
	jAnKqz5CuoAUa/3EpbmtfnkNsgWAf9sxGUgv8DZYcGJMKjGhuyjGrOaAVfQgIQSm3g/tHKGyW/X
	OgH5awa63DbVTtZAdlYgJlj9y9zZPlfXCXo4sRi5pX8lb4AFeylqS2BekFuytC1huyRwX8RFTIC
	auVJ8ZOKRGE0GbKcxEZljtsJR8MYPIXAb4l92VTjnxbwwPYM7UKwhbPt49+NUf2Ea58ilWHoe4a
	nY4QFhuTxYN3fTm+/RGDUj0V5lko1L2lPG9UR0iDDRnYqyGo5wdpQsDY2BfVU3iNzgZckP5tQ4k
	3b6+hPyKZ8w2MB/dt7MWgsXTSAVtdLs=
X-Received: by 2002:a05:6102:2b97:b0:7cc:26e4:1947 with SMTP id ada2fe7eead31-7cc36a1fe11mr1737246137.20.1792431979622;
        Mon, 19 Oct 2026 10:46:19 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:19 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/13] ALSA: jockey3: Add PCM capture
Date: Mon, 19 Oct 2026 13:44:36 -0400
Message-ID: <20261019174445.1931263-5-fvdpol@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019174445.1931263-1-fvdpol@gmail.com>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
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

Add the 6-channel, 24-bit capture stream and the decoder for the
Ploytec capture frame.

The capture URBs have been running since the transport patch. Their
completion handler now decodes each packet into the ALSA buffer while
the stream is triggered, with the same locking and safe-zone rules as
playback.

The capture channels are two stereo line inputs and a microphone. None
of them is a speaker position, so the channel map leaves all of them
unpositioned.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/jockey3.c       | 143 ++++++++++++++++++++++++++++--
 sound/usb/jockey3/ploytec_codec.c |  66 +++++++++++++-
 sound/usb/jockey3/ploytec_codec.h |   9 +-
 3 files changed, 209 insertions(+), 9 deletions(-)

diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index 3863ed12cf566..a24674e078a6b 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -77,7 +77,7 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * - EP 0x83 IN:  MIDI input
  *
  * Audio is not sample-interleaved but bit-plane interleaved; see
- * ploytec_codec.c for the wire format and the encode implementation.
+ * ploytec_codec.c for the wire format and the encode/decode implementations.
  *
  * URBs run free for the lifetime of the device rather than being started and
  * stopped around PCM use: the playback stream must keep flowing because it
@@ -342,6 +342,60 @@ static bool jockey3_process_out_packet(struct jockey3_chip *chip, u8 *urb_buf)
 	return false;
 }
 
+static bool jockey3_process_in_packet(struct jockey3_chip *chip, const u8 *urb_buf)
+{
+	struct snd_pcm_substream *substream = chip->capture.substream;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->capture;
+	struct snd_pcm_runtime *runtime;
+	unsigned int pcm_buffer_size;
+	unsigned int alsa_frame_size;
+	unsigned int frames_in_batch;
+	unsigned int bytes_left;
+	int f = 0;
+
+	if (unlikely(!substream || !substream->runtime))
+		return false;
+
+	runtime = substream->runtime;
+	if (unlikely(!runtime->dma_area))
+		return false;
+
+	pcm_buffer_size = snd_pcm_lib_buffer_bytes(substream);
+	alsa_frame_size = runtime->channels * 3; // 6 * 3 = 18 bytes
+
+	while (f < PLOYTEC_CAPTURE_FRAMES) {
+		frames_in_batch = PLOYTEC_CAPTURE_FRAMES - f;
+		bytes_left = pcm_buffer_size - urb_stream->dma_off;
+
+		/* Respect circular buffer wrap-around */
+		if (bytes_left < frames_in_batch * alsa_frame_size)
+			frames_in_batch = bytes_left / alsa_frame_size;
+
+		if (frames_in_batch == 0)
+			break;
+
+		ploytec_decode_batch(runtime->dma_area + urb_stream->dma_off,
+				     urb_buf + f * PLOYTEC_CAPTURE_FRAME_SIZE,
+				     frames_in_batch);
+
+		/* Advance pointers */
+		urb_stream->dma_off += frames_in_batch * alsa_frame_size;
+		if (urb_stream->dma_off >= pcm_buffer_size)
+			urb_stream->dma_off -= pcm_buffer_size;
+
+		urb_stream->period_off += frames_in_batch * alsa_frame_size;
+
+		f += frames_in_batch;
+	}
+
+	if (urb_stream->period_off >= runtime->period_size * alsa_frame_size) {
+		urb_stream->period_off %= runtime->period_size * alsa_frame_size;
+		return true;
+	}
+
+	return false;
+}
+
 enum jockey3_urb_state {
 	JOCKEY3_URB_OK,		/* completed normally */
 	JOCKEY3_URB_STOPPED,	/* teardown in progress; return without resubmitting */
@@ -524,7 +578,10 @@ static void jockey3_capture_callback(struct urb *urb)
 {
 	struct jockey3_chip *chip = urb->context;
 	struct jockey3_pcm_urb_stream *urb_stream = &chip->capture;
+	struct snd_pcm_substream *substream = NULL;
+	bool period_elapsed = false;
 	bool data_valid = true;
+	bool active = false;
 	bool stopping;
 	int ret;
 
@@ -549,11 +606,44 @@ static void jockey3_capture_callback(struct urb *urb)
 	if (unlikely(jockey3_is_disconnected(chip)))
 		return;
 
-	ret = 0;
+	if (data_valid && unlikely(urb->actual_length < PLOYTEC_PKT_SIZE)) {
+		dev_err_ratelimited(&chip->intf0->dev,
+				    "Capture URB too small: %d; required at least %d\n",
+				    urb->actual_length, PLOYTEC_PKT_SIZE);
+		data_valid = false;
+	}
+
+	/* Step 1: Safely fetch the pointer and join the safe zone */
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
 		if (data_valid)
 			urb_stream->consec_errors = 0;
 
+		if (data_valid && !urb_stream->stopping &&
+		    urb_stream->running && urb_stream->substream) {
+			urb_stream->callbacks_active++;
+			active = true;
+			substream = urb_stream->substream;
+
+			period_elapsed = jockey3_process_in_packet(chip, urb->transfer_buffer);
+		}
+	}
+
+	/*
+	 * Step 2: Safe Zone. ALSA core can't free 'substream' because
+	 * jockey3_pcm_sync_stop() waits for 'callbacks_active' to drain before
+	 * the core releases the buffer. Our lock is released here to avoid an
+	 * ABBA deadlock with ALSA's internal locking: snd_pcm_period_elapsed()
+	 * takes the stream lock, and the order is stream lock -> urb_stream->lock.
+	 */
+	if (period_elapsed && substream)
+		snd_pcm_period_elapsed(substream);
+
+	ret = 0;
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		/* Leave the safe zone; last one out wakes any waiter */
+		if (active && !--urb_stream->callbacks_active)
+			wake_up(&urb_stream->drain_wait);
+
 		/*
 		 * Keep resubmitting the URB while the interface is alive. The
 		 * 'stopping' test and the anchor+submit below must stay in this
@@ -1018,6 +1108,26 @@ static const struct snd_pcm_hardware jockey3_pcm_hw_playback = {
 	.periods_max		= 1024,
 };
 
+static const struct snd_pcm_hardware jockey3_pcm_hw_capture = {
+	.info			= JOCKEY3_PCM_INFO,
+	.formats		= SNDRV_PCM_FMTBIT_S24_3LE,
+	.rates			= JOCKEY3_PCM_RATES,
+	.rate_min		= 44100,
+	.rate_max		= 44100,
+	.channels_min		= 6,
+	.channels_max		= 6,
+	.buffer_bytes_max	= 1024 * 1024,
+	/*
+	 * One capture URB carries one packet of 8 frames * 6 channels * 3 bytes
+	 * = 144 bytes; see the playback .period_bytes_min comment above for why
+	 * the minimum must cover at least one packet.
+	 */
+	.period_bytes_min	= PLOYTEC_CAPTURE_FRAMES * 6 * 3,
+	.period_bytes_max	= 512 * 1024,
+	.periods_min		= 2,
+	.periods_max		= 1024,
+};
+
 static int jockey3_pcm_open(struct snd_pcm_substream *substream)
 {
 	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
@@ -1031,7 +1141,8 @@ static int jockey3_pcm_open(struct snd_pcm_substream *substream)
 	if (jockey3_is_disconnected(chip))
 		return -ENODEV;
 
-	runtime->hw = jockey3_pcm_hw_playback;
+	runtime->hw = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+		      jockey3_pcm_hw_playback : jockey3_pcm_hw_capture;
 
 	/* The period accounting assumes a whole number of periods per buffer */
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
@@ -1442,9 +1553,15 @@ static int jockey3_validate_endpoints(struct usb_interface *intf0, struct usb_in
  *
  * The one exception is the playback Master pair, which is marked FL/FR so that
  * userspace (PipeWire and friends) can identify the device's primary output.
+ * There is no equivalent notion for the inputs, so capture is left entirely
+ * unpositioned.
  *
  * Physical layout:
  *   Playback: 1-2 Master Out L/R, 3-4 Headphone L/R
+ *   Capture:  1-2 Input 1 L/R, 3-4 Input 2 L/R, 5-6 Microphone
+ *
+ * The microphone is mono: the balanced input stage feeds the same analog
+ * signal to both converters, so channels 5 and 6 carry identical content.
  */
 static const struct snd_pcm_chmap_elem jockey3_playback_chmap[] = {
 	{ .channels = 4,
@@ -1453,9 +1570,17 @@ static const struct snd_pcm_chmap_elem jockey3_playback_chmap[] = {
 	{ }
 };
 
+static const struct snd_pcm_chmap_elem jockey3_capture_chmap[] = {
+	{ .channels = 6,
+	  .map = { SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN,
+		   SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN,
+		   SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN } },
+	{ }
+};
+
 static int jockey3_init_pcm(struct jockey3_chip *chip)
 {
-	int ret = snd_pcm_new(chip->card, CARD_NAME " Audio", 0, 1, 0, &chip->pcm);
+	int ret = snd_pcm_new(chip->card, CARD_NAME " Audio", 0, 1, 1, &chip->pcm);
 
 	if (ret < 0)
 		return ret;
@@ -1463,10 +1588,16 @@ static int jockey3_init_pcm(struct jockey3_chip *chip)
 	strscpy(chip->pcm->name, CARD_NAME " Audio", sizeof(chip->pcm->name));
 	chip->pcm->private_data = chip;
 	snd_pcm_set_ops(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK, &jockey3_pcm_ops);
+	snd_pcm_set_ops(chip->pcm, SNDRV_PCM_STREAM_CAPTURE, &jockey3_pcm_ops);
 	snd_pcm_set_managed_buffer_all(chip->pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
-	return snd_pcm_add_chmap_ctls(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK,
-				      jockey3_playback_chmap, 4, 0, NULL);
+	ret = snd_pcm_add_chmap_ctls(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+				     jockey3_playback_chmap, 4, 0, NULL);
+	if (ret < 0)
+		return ret;
+
+	return snd_pcm_add_chmap_ctls(chip->pcm, SNDRV_PCM_STREAM_CAPTURE,
+				      jockey3_capture_chmap, 6, 0, NULL);
 }
 
 static void jockey3_setup_card_names(struct jockey3_chip *chip, int driver_info)
diff --git a/sound/usb/jockey3/ploytec_codec.c b/sound/usb/jockey3/ploytec_codec.c
index 2c431853b8434..6cbbc26ac5cac 100644
--- a/sound/usb/jockey3/ploytec_codec.c
+++ b/sound/usb/jockey3/ploytec_codec.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *   ALSA driver for Reloop Jockey 3 devices
- *   Ploytec PCM encoding functions for the S24_3LE format (3 bytes per sample)
+ *   Ploytec PCM encoding/decoding functions for the S24_3LE format (3 bytes per sample)
  *
  *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
  */
@@ -85,6 +85,55 @@ static inline void ploytec_encode_s24_3le(u8 *dest, const u8 *src)
 	}
 }
 
+/**
+ * ploytec_decode_s24_3le() - Decode 64-byte Ploytec frame to 6-channel S24_3LE
+ * @dest: 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: 64-byte source buffer
+ *
+ * Ploytec Bit-Plane Interleaving (Capture):
+ * Similar to encoding, the capture path interleaves 3 pairs of channels
+ * into bit-planes (bit 0, 1, and 2 of each byte).
+ * - Bytes 0x00-0x17: Pair 1 (bits 0,1,2)
+ * - Bytes 0x20-0x37: Pair 2 (bits 0,1,2)
+ */
+static inline void ploytec_decode_s24_3le(u8 *dest, const u8 *src)
+{
+	int i;
+
+	memset(dest, 0, 18);
+	for (i = 0; i < 8; i++) {
+		/* Channel 1: odd channel 1 (bit 0 of bytes 0x00-0x17) */
+		dest[0x00] |= ((src[0x10 + i] & 0x01) << (7 - i));	// Ch1 LSB byte
+		dest[0x01] |= ((src[0x08 + i] & 0x01) << (7 - i));
+		dest[0x02] |= ((src[0x00 + i] & 0x01) << (7 - i));	// Ch1 MSB byte
+
+		/* Channel 2: even channel 2 (bit 0 of bytes 0x20-0x37) */
+		dest[0x03] |= ((src[0x30 + i] & 0x01) << (7 - i));
+		dest[0x04] |= ((src[0x28 + i] & 0x01) << (7 - i));
+		dest[0x05] |= ((src[0x20 + i] & 0x01) << (7 - i));
+
+		/* Channel 3: odd channel 3 (bit 1 of bytes 0x00-0x17) */
+		dest[0x06] |= (((src[0x10 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x07] |= (((src[0x08 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x08] |= (((src[0x00 + i] & 0x02) >> 1) << (7 - i));
+
+		/* Channel 4: even channel 4 (bit 1 of bytes 0x20-0x37) */
+		dest[0x09] |= (((src[0x30 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x0A] |= (((src[0x28 + i] & 0x02) >> 1) << (7 - i));
+		dest[0x0B] |= (((src[0x20 + i] & 0x02) >> 1) << (7 - i));
+
+		/* Channel 5: odd channel 5 (bit 2 of bytes 0x00-0x17) */
+		dest[0x0C] |= (((src[0x10 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x0D] |= (((src[0x08 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x0E] |= (((src[0x00 + i] & 0x04) >> 2) << (7 - i));
+
+		/* Channel 6: even channel 6 (bit 2 of bytes 0x20-0x37) */
+		dest[0x0F] |= (((src[0x30 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x10] |= (((src[0x28 + i] & 0x04) >> 2) << (7 - i));
+		dest[0x11] |= (((src[0x20 + i] & 0x04) >> 2) << (7 - i));
+	}
+}
+
 /**
  * ploytec_encode_batch() - Encode a number of 4-channel S24_3LE to 48-byte Ploytec frames
  * @dest: n_frames * 48-byte destination buffer (Ploytec playback frame)
@@ -99,3 +148,18 @@ void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames)
 		src += PLOYTEC_PLAYBACK_PCM_FRAME_SIZE;
 	}
 }
+
+/**
+ * ploytec_decode_batch() - Decode a number of 64-byte Ploytec frames to 6-channel S24_3LE
+ * @dest: n_frames * 18-byte destination buffer (6 channels * 3 bytes)
+ * @src: n_frames * 64-byte source buffer
+ * @n_frames: number of frames to process in this batch
+ */
+void ploytec_decode_batch(u8 *dest, const u8 *src, const int n_frames)
+{
+	for (int f = 0; f < n_frames; f++) {
+		ploytec_decode_s24_3le(dest, src);
+		dest += PLOYTEC_CAPTURE_PCM_FRAME_SIZE;
+		src += PLOYTEC_CAPTURE_FRAME_SIZE;
+	}
+}
diff --git a/sound/usb/jockey3/ploytec_codec.h b/sound/usb/jockey3/ploytec_codec.h
index 32660f1b4350a..0ee0d38099bf2 100644
--- a/sound/usb/jockey3/ploytec_codec.h
+++ b/sound/usb/jockey3/ploytec_codec.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *   ALSA driver for Reloop Jockey 3 devices
- *   Ploytec PCM encoding functions for the S24_3LE format (3 bytes per sample)
+ *   Ploytec PCM encoding/decoding functions for the S24_3LE format (3 bytes per sample)
  *
  *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
  */
@@ -12,7 +12,7 @@
 #include <linux/types.h>
 
 /*
- * Playback: 4 channels of S24_3LE (3 bytes/sample).
+ * Playback: 4 channels, capture: 6 channels, both S24_3LE (3 bytes/sample).
  * The *_FRAME_SIZE values are the Ploytec wire format; the *_PCM_FRAME_SIZE
  * values are the corresponding ALSA-side frame.
  */
@@ -20,7 +20,12 @@
 #define PLOYTEC_PLAYBACK_FRAME_SIZE	48
 #define PLOYTEC_PLAYBACK_PCM_FRAME_SIZE	12	// 4 channels * 3 bytes
 
+#define PLOYTEC_CAPTURE_FRAMES		8	// number of samples per frame
+#define PLOYTEC_CAPTURE_FRAME_SIZE	64
+#define PLOYTEC_CAPTURE_PCM_FRAME_SIZE	18	// 6 channels * 3 bytes
+
 /* batching of the sample processing */
 void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames);
+void ploytec_decode_batch(u8 *dest, const u8 *src, const int n_frames);
 
 #endif /* __SOUND_USB_JOCKEY3_PLOYTEC_CODEC_H */
-- 
2.47.3

