Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466184;
	b=jAiJILujZCxfFKpW0/PHKBoDc1rDhOCNDeOzTnwzqKWaXZ91ft3BRk6Kbx2sxR3eVHC9
	 D9LpGk1J55yvUZe1qC5T9KBUOdoEQU9wYNtNYfS3ZKjaHYL39F+e890bRTpzo3vrPDWWg
	 m71kTtL+1UaLyielZOv3UU9woDKFFwlIZIjpozrTk63o0V+SjGpqGUhC/J+5K9eVhAcEB
	 ELcL6Fo1BmGPhxEUwL3FCAoTlBxL27sE/dmYo5QRX6YiePuTQMgZUFe75ASvNKeOMxnb1
	 AKtH8TrsrnT9Wn9lDRfNyXK1EmrKjjkIZIA9PlUFKHykgaGJ2cAO/ma6xtPoGkhOmTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=bv8CnFpzfxoSaA+bJSHV1B3vzZDn59mfhqEU93AQsH8x7aL5J1wh3VR15oofeU9C4WeH
	 tik+D8mUpLYPwNgdT4wYZQT/2RJHPnAKeWuUYUEwcygD/RPnTtQsu213Ow94cNDMnxvv5
	 j3Y3PT6Rt55O7YDTvtCcm9v13XYSq/fwtfC8Y+bDQBlm9PviP3fDPQRvCNzCBrSqE55Pc
	 mIVylMucKHRp3ui85RxxMBRreXFefGh2K2WoimDa70hVxH4eGpU6eIk8eYHpU0AvnFdiK
	 k/dLnY0TWJObdiv6pFlDslPhKrL0Up1sVplRQo7kl7s6j3WwHycb7Qa4PPtuKBDrwgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPeEKIzC;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D587606A893
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D587606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPeEKIzC
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so1423454b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466183; x=1795070983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=TPeEKIzC3PqINmM3ycLE9YPGZ/5qU0qGFTA0j/y9SwD2F+rZah/IHdWmVCykhyknwK
         J9Ym1q3wC6e8eevWqRUhB0qThnnahm//hb7R4TtfkfxLryPOI6EYKZnL6+6Ls9LLtxqJ
         2+gtN21rat6NTXLyyiZdRPP8CObKWuwo8RftamEqewpjhBBBkbzhDL/JD3GLBGqLpcHZ
         MzduxdSJ16OugBxfH30xhEyS5CAcZTYYqKz9+U9k/t5etalS9IwsBcR9Gk8vIvJ3qn4w
         zbKNJC2C68+EBfCDXCtuHWyDSA9dQ5ncS311VU96nilMOd3NqcRC9TUggfw67oa9xOB8
         t7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466183; x=1795070983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=i1XcKdqvwDdY1/UazJ2ebTlsy6H+fv1TnADPLtlGC2KLUT27lT/ex/4xfOw8h20YPX
         lnlpexQG0+mL8Z5eKD7CB0bTL1N6aQ4oLZjUpoQZlecDPlGVZeXKUr+EQzRZC39r/Mew
         RJOu+86h1P2OS4jARwckmgRdZssbQ27QDDoXB7zH4lSbas7kwlW6ZKHCjObkGGt1c7eO
         7blJD8VGM2Kh9rQsD+m/2ddqFzn4KspcNorb/84teb/D4jpcfIE0T4n7yRgXV2ZBe4vs
         wioAvcUGQylY+4eZUwdNm+ieFu7VANmBo2uCpsm8MSwSFdIDec5gxn6npW97YCPLQxab
         3BTQ==
X-Forwarded-Encrypted: i=1; AL+hErHoPq3gZpb6AwBzs83ocl8cO5pD+0bX0bQ2hDt2VzEkF+9/GjXut/IiTdUBWgNt5zHrJ8lVyUza+QjcAvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jhD/lLsNtvBv+K6cAtn/K6+qiUlNd46FMR/o8ekQDmcB/VCTL
	l4FUjINhRPNCZDPMUfD3+Bs54DbQGLuzWGWQAv7R4Jtbpl+ZOM5kLm1ysh9LGQ==
X-Gm-Gg: AYBFou2I4PdEDGREHbcmUVYjWeg+9LDHRoTcmn+Lx5lwyaYp5htVWjHslsnHSaVaR/C
	fpzAZv+jobehbY7izy7hwzBKVy1mWCzSZ7b2ezAxaKUmROnGlNAGoG+XGcZ6d4gfiWJ9fRmeVjf
	fK2RC5wED0205x0lsRN3jCx6tspdQZjtqwQbck1abKNSrOxo8Pjrh4A8aTLs641TqZuKTRk3UY5
	o+WLhFPB/46nUPZoza5eaGL7lsG9ERHJxFUN42rXibo36E7alLTVJu0CbUwOUN4UrO0ytyFQS/q
	cjF/IBnHPA1I2CRpcXGn2pVFTIaOSWOoiiUMh56AA8tD+JMshis7LM8Md3Hj+k0QGDXwT3SyLHM
	SpvpOs80PvkEeSzzkXm5yPNsVeiohBt08bbAbsXOZo/jAOEF89xvvCOypDj1b1S6jv67w/1bl6O
	lFnagAgpYMj+Of48q4D6SY0Jtzh3rB+ZgAfHFHj0cSUyZPF77hNq84UHW3BoF4PKAxVxHMcwJN+
	XQpkP7M8nPs2yw0Dw9dqxD+aN/U0MDV8YqI1jrO38eF9o8Ff4wdIU/77VWErshx7d5JNEEEZ2E4
	VsGEutZS8+CEh1q6m+Zg7O9lFc6Tw3sLcdl4ec/5pEMa/6/W6y059tZRoccPCFrDfTHv+guHKEd
	ogOVr3fToM4+ttMVCECwSvk82C8sgqUPKsGrX6/PkxbCWkb4=
X-Received: by 2002:a05:6a00:170b:b0:8b6:59a:2ae with SMTP id d2e1a72fcca58-8bc1d819c34mr4549542b3a.52.1794466182900;
        Wed, 11 Nov 2026 22:49:42 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:42 -0800 (PST)
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
Subject: [PATCH v31 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 15:49:14 +0900
Message-ID: <20261112064929.11211-3-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Handle capture DRAINING separately in the state update: a full buffer is
still readable capture data, while progress beyond the buffer capacity
is an overrun. Playback continues to finish draining when its buffer is
empty.

Refresh capture availability after the unlocked copy and application
pointer commit while DRAINING. A final tail can arrive during the copy;
subtracting only the copied frames from the earlier snapshot can
otherwise finish draining with unread samples left in the ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -215,8 +215,14 @@
 	if (avail > runtime->avail_max)
 		runtime->avail_max = avail;
 	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
-		if (avail >= runtime->buffer_size) {
-			snd_pcm_drain_done(substream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (avail >= runtime->buffer_size) {
+				snd_pcm_drain_done(substream);
+				return -EPIPE;
+			}
+		} else if (avail > runtime->buffer_size) {
+			/* A full capture buffer remains readable while draining. */
+			__snd_pcm_xrun(substream);
 			return -EPIPE;
 		}
 	} else {
@@ -1919,6 +1925,30 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Capture
+ * streams may report their final tail while DRAINING. Unlike a period
+ * notification, this does not imply an elapsed period or tick the PCM timer.
+ * The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream))
+		return;
+	if (!snd_pcm_running(substream) &&
+	    !(substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	      substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
@@ -2405,7 +2435,11 @@
 		offset += frames;
 		size -= frames;
 		xfer += frames;
-		avail -= frames;
+		if (!is_playback &&
+		    runtime->state == SNDRV_PCM_STATE_DRAINING)
+			avail = snd_pcm_avail(substream);
+		else
+			avail -= frames;
 		if (is_playback &&
 		    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 		    snd_pcm_playback_hw_avail(runtime) >= (snd_pcm_sframes_t)runtime->start_threshold) {
