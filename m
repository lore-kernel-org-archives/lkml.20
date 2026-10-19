Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431995;
	b=XNblgHTuIBUPRi1aL0IoaKDTEBhRAKjVhfaq42/2kXJv+XZMzmc1oMDrEGEFaFF61BGN
	 TQaYFCf8fMWtxF8XHqY6YsP15ylX3V8J3ImzGoCMQI7ClNP2oRdU+i7SUbnwt9r/yFIGq
	 QnzHEfoTHragwj4vDk5MC40/DUNqOtDuUwJkmpYZEQcUQQZiXuNgtBKq5vlOLmdb5B4V1
	 ta1NmF9wmh53cHntnPTRz6xgZGR+Tg/2aSKik168q/c5DwCZpaLnWeWNTa8vFOTabrv9H
	 sS11N66imYuNj4yF6nbZ0In8ka416xagRyAj7TG77U5g85hxTpBUOZCIsYTc72fh/og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3WyjwvvWjsV4EY122Zbe2s0hvPvI5hKlqVJjqBi8RdQ=;
	b=KNH8mKu9iVLJXYLYyI+sr+5HhheTAstmBwIfHKNoYU+FKcVbFMbldsjHmqFQAtf2qENa
	 XV1b/E8LRFJlbhpl4wbLpVE2eRdav/GhGgWU9l3Tychhyhztz/Rsj5neMrzpZTa4Fg3Ps
	 mcnV55FrkZAr7Q7SXXas7vaut4DlyfYsQj6idX3Blr+Lp0JeVLPBhAiiYa4+aVMrqc6hH
	 1IkzqaaLfdsZAVJtIP/MxAvqp8q9mF7xkRhs9J+6rjo+giDTMwNnpta++jIy90qOg0Uez
	 w+vG6OnHSWpJCKm+GcTSLPJhjB7oRltBb6b5EI/W2URRLQ8e1Swi/wZkVs5DI97QI0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dCZbny5e;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811FB60A381B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811FB60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dCZbny5e
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ab6c88052so667728137.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431993; x=1793036793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WyjwvvWjsV4EY122Zbe2s0hvPvI5hKlqVJjqBi8RdQ=;
        b=dCZbny5e51FVX8H/OqEcKMN/oYp6wFTWfbFYqSHjjVJKltyRwqu4nSoc+lLTRgacXs
         CAZfDiy+nfPj5O/0Gk4E+nh5934jSWlxSUqj7UUAFpqd2q6g4t1XXLi7kCq8N6VU+IXa
         ohCjSwQokNWrGtkN2iroGZ8RcP/ZxQOcaiyVtdE9hnVvMLOa3TGrysofZqODk60O+/dP
         ZV4GiVvTn3UIcF/eUNv2xjC8wyKAZJy7TGZ01byyf7AY5RipGT3FIaLxN/uPKBivolDh
         FIuZ8Vqhvhqjw5dlZjQpR0Huxng66pOnWikAk7oO1FkOmO6ohPEd8mUuMbHj67YZpVuX
         DOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431993; x=1793036793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WyjwvvWjsV4EY122Zbe2s0hvPvI5hKlqVJjqBi8RdQ=;
        b=hPMH83MyoGVCG5kSc+QLR6Ec1z2F7TAvy6kXIbp8gzTPb745p1n9gYl4GKeT2xodc6
         meGGx2Tkv+60Qg5JL18hig2SgzRg/Z6wv0T2Xs7gmpB+WKLqgwlL+QOUfVnH38MRQfU5
         JUT+u2Unjs+TT3uRU6zyYhOPEZ8rSWl93vRzChj8WSw3du2lHtcSulsn5Kr44t/po38D
         uIXrqxuz0Zrh71y/2wOoiI4BXxRC5Bqr5cxrHGd05injTGeLvvSW9/l9ZHsl3phclalV
         imQ8CWas2w1WtRdSeN6kfswsc8NWMOJr1EYmsOxDgJcAwramVQcYTWjk/kYGx9l3VQOp
         AYog==
X-Forwarded-Encrypted: i=1; AKwUvByRWXBlYdPlwWUbtVFAxkaCneqFP97/qlSYHu+NavodH/pv4mKtaVG5b8XTj9D2946wTCTem1/WMABMagU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6lDsX4fO1yMZ/LwxVeR+124823vEP4RLR3hFwrfafRaoHci8o
	fcqXZCUhUWd4kiaAX+hZuBz71lJgVFOuS4kEkmpi0qPRbHecAdYynCew
X-Gm-Gg: AYBFou3gbvs1do1JBUxOy0N34L7Q8O/QHab+de04cAop1dtIR+6MAgKSfJmb3nJEnwJ
	WREsUQAa/fxXmDvDjP6OxmKi9HedjNx9WQYiN8Uzxo61lfWOEVdMeYOqvCvUQso9RFWKcBZpW/w
	4XQzNAQo23JNVqx/DIFhGB+YVO30e0G2uC944L199DwPz9p3thE0FjYzw2aMbjq7R3OUPSUxKER
	GroCJiHr56psP4yPXLKctpO1iKC3wJWREpuQC9SWE177lN5/nP905WPTyTSNO+6agxXB6QPvnzp
	EWHkFilmFvzB1ORPVJU+rtJnqQgoLa8f9+Qs8ADPIzuZ5FFJ6f1QKyxJL/QT/ae5S/w137ZMBLo
	Zpxrr+qaz+33un1B4CUWkzmX9DSxfowLBbR6UkZx23P4Qkeye0nlXRna5OUH3NM3JOMjPopzGyP
	1JNOUQ0eXw51fVB7Z5J/2sJY2EueIUD/jLSCzS3+Kn9YMtFHnxaI4D9UQ2UJS2XH7RFbw3sPPsz
	fuBW+UgSfhWU6XpcfY0nCuVk2OOcpyBZn22whKb2L/BwA7FXbVh9nSEF/GLSA0pKI/+OxIpRrV6
	K0AFEabl8PHbiPicOICJnIkIBJfAzcZSLpdPe37v1w==
X-Received: by 2002:a05:6102:5127:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7cc36aed490mr1847630137.31.1792431993029;
        Mon, 19 Oct 2026 10:46:33 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:32 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/13] ALSA: jockey3: Add sample rate switching
Date: Mon, 19 Oct 2026 13:44:42 -0400
Message-ID: <20261019174445.1931263-11-fvdpol@gmail.com>
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

Support 48, 88.2 and 96 kHz in addition to 44.1 kHz.

The device has one rate for both directions. Changing it means stopping
the URBs, reprogramming the device over EP0 and starting the URBs
again. This uses the rate-change shape of the Ploytec sequence that has
been in ploytec_proto.c since the transport patch.

A direction commits to the rate in .hw_params and releases it in
.hw_free. While one direction holds a rate, .open constrains the other
direction to it and .hw_params refuses a different one.

The firmware does not always resume streaming after a rate change.
.hw_params therefore checks both directions afterwards and runs the
recovery ladder on a direction that did not come back. As in the
watchdog, an idle capture stream is left for its next open.

Programming a rate calls usb_set_interface(), so .hw_params takes the
USB device lock around it. The comment there explains where the lock
has to sit relative to rate_mutex and the reset callbacks.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/jockey3.c | 433 ++++++++++++++++++++++++++++++++----
 1 file changed, 384 insertions(+), 49 deletions(-)

diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index a6c9f0bcfc87d..90458f5d9245e 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -93,10 +93,15 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * callbacks therefore only toggle whether a URB's payload is filled from (or
  * copied to) an ALSA buffer.
  *
- * A stall can also be found and recovered mid-stream, with no PCM ioctl
- * involved: jockey3_watchdog_work() polls URB liveness for the device's whole
- * lifetime and calls the recovery ladder directly on a new stall onset. See
- * jockey3_watchdog_check() and jockey3_watchdog_arm().
+ * A sample-rate change requires tearing the URBs down, reprogramming the
+ * device over EP0, and starting them again. jockey3_pcm_hw_params() checks
+ * URB liveness on both directions afterward and recovers if either did not
+ * restart; see the comment there for what that covers and why.
+ *
+ * A stall can also be found and recovered mid-stream, with no rate change or
+ * PCM ioctl involved: jockey3_watchdog_work() polls URB liveness for the
+ * device's whole lifetime and calls the same recovery ladder directly on a
+ * new stall onset. See jockey3_watchdog_check() and jockey3_watchdog_arm().
  */
 
 /**
@@ -163,7 +168,7 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *
  * The watchdog work item adds one rule: rate_mutex must never be held across
  * cancel_delayed_work_sync(&chip->watchdog_work). jockey3_stop_urbs() is called
- * from inside rate_mutex at two sites, so it disarms with the non-sync
+ * from inside rate_mutex at three sites, so it disarms with the non-sync
  * cancel_delayed_work(), which is safe under any lock; a tick that is already
  * running when the cancel lands re-reads 'stopping' and does nothing. The sync
  * form appears only in jockey3_disconnect(), in probe's error path and in
@@ -246,9 +251,10 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * URB liveness watchdog.
  *
  * A healthy stream completes one URB every @n_pkts packet intervals, and a
- * packet is 226.8 us at 44100 Hz. So JOCKEY3_WATCHDOG_STALL_MS of silence is
- * many consecutive missed URBs at any N -- more than scheduling delay or bus
- * contention produces on a device that is still streaming.
+ * packet is 226.8 us at 44100 Hz down to 83.3 us at 96000 Hz. So
+ * JOCKEY3_WATCHDOG_STALL_MS of silence is many consecutive missed URBs at any
+ * supported rate and N -- more than scheduling delay or bus contention
+ * produces on a device that is still streaming.
  *
  * The threshold is sized against ALSA core's own stall timeout
  * (wait_for_avail() in sound/core/pcm_lib.c, roughly buffer_size * 1100 / rate
@@ -360,13 +366,17 @@ static unsigned int jockey3_start_grace_ms(void)
  *	needed because @last_callback_time is deliberately 0 between a start and
  *	the first completion, which jockey3_check_urb_stream_alive() must keep
  *	reading as "not alive" -- so the watchdog cannot reuse it without either
- *	reporting a stall at every start or breaking the check after a restart.
+ *	reporting a stall at every start or breaking the post-rate-change check.
  *	It doubles as the watchdog's post-start grace baseline (the grace
  *	duration is start_grace_ms).
  * @lock: protects the fields marked "@lock" below; IRQ-safe leaf
  * @dma_off: byte offset into runtime->dma_area, i.e. the hardware pointer; @lock
  * @period_off: bytes accumulated towards the current period; @lock
  * @running: stream is triggered and its payload should be filled; @lock
+ * @rate_committed: this direction has had a rate accepted by
+ *	jockey3_pcm_hw_params() and not yet released by jockey3_pcm_hw_free();
+ *	@lock. See jockey3_rate_committed_streams() for why the rate interlock
+ *	keys off this rather than off @running or off @substream.
  * @callbacks_active: number of URB completions currently inside the "safe zone"
  *	where they may still touch @substream or runtime->dma_area; @lock. The
  *	last one out wakes @drain_wait. A count rather than a flag because there
@@ -410,6 +420,7 @@ struct jockey3_pcm_urb_stream {
 	unsigned int dma_off;
 	unsigned int period_off;
 	bool running;
+	bool rate_committed;
 	unsigned int callbacks_active;
 	wait_queue_head_t drain_wait;
 	bool stopping;
@@ -434,8 +445,8 @@ struct jockey3_pcm_urb_stream {
  *	Serialized by @rate_mutex once the card is live. The one exception is
  *	jockey3_initialize(), which runs from probe before the card is
  *	registered or the watchdog armed, so it is the only user in existence.
- * @rate_mutex: serializes the URB stop/start sequences and the EP0 programming
- *	that goes with them; process context only, outermost lock
+ * @rate_mutex: serializes sample-rate changes and the URB stop/start that goes
+ *	with them; process context only, outermost lock
  * @flags: JOCKEY3_FLAG_* bits, atomic bitops
  * @current_rate: sample rate the hardware is programmed to; @rate_mutex
  * @dev_idx: card slot held in jockey3_devices_used
@@ -449,7 +460,7 @@ struct jockey3_pcm_urb_stream {
  *	device, is its whole lifetime rather than only while a PCM stream is open.
  * @recovery_attempts: resets taken from the current window by
  *	jockey3_recovery_budget_take(); not mutex-protected, since
- *	jockey3_pcm_prepare()'s liveness check and recovery run outside
+ *	jockey3_pcm_hw_params()'s post-rate-change liveness check runs outside
  *	@rate_mutex by design. The two-atomic race with @recovery_window_start is
  *	benign: the worst case is a handful of extra resets in one window, not a
  *	stuck or negative budget.
@@ -469,7 +480,7 @@ struct jockey3_pcm_urb_stream {
  *	callers elsewhere poll rather than block on recovery finishing.
  * @warm_start: true if the current URB ring was last started by the stall
  *	watchdog's own lightweight restart, false for every other (re)start
- *	(first open, USB reset, probe). Both kinds share
+ *	(first open, rate change, USB reset, probe). Both kinds share
  *	one start_grace_ms; this only labels which one is in effect, for
  *	dev_dbg(). Chip-wide, not per-direction: jockey3_start_urbs() restarts
  *	the shared ring for both directions at once. Plain bool, written by
@@ -490,7 +501,7 @@ struct jockey3_chip {
 	struct usb_interface *intf1;
 	struct snd_pcm *pcm;
 	unsigned char *xfer_buf;
-	struct mutex rate_mutex;	/* serializes URB stop/start; outermost lock */
+	struct mutex rate_mutex;	/* serializes rate changes; outermost lock */
 	unsigned long flags;
 	unsigned int current_rate;
 	unsigned int dev_idx;
@@ -576,6 +587,15 @@ static void jockey3_set_current_rate(struct jockey3_chip *chip, unsigned int rat
 	chip->current_rate = rate;
 }
 
+/*
+ * Rate changes are serialized by chip->rate_mutex alone: jockey3_pcm_hw_params()
+ * performs the whole stop/set-rate/start sequence while holding it, so any other
+ * sleepable callback that takes the mutex is automatically excluded for the
+ * duration. There is deliberately no separate "rate changing" flag to poll --
+ * the only caller that could not take the mutex was .trigger, which runs in
+ * atomic context and must not block at all.
+ */
+
 /*
  * Bounded, synchronous wait for a device reset queued via
  * usb_queue_reset_device() to complete. chip->reset_done is completed by
@@ -664,6 +684,55 @@ static inline struct jockey3_pcm_urb_stream *jockey3_get_pcm_urb_stream(struct j
 		return &chip->capture;
 }
 
+static void jockey3_set_rate_committed(struct jockey3_chip *chip, const int direction,
+				       bool committed)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+
+	guard(spinlock_irqsave)(&urb_stream->lock);
+	urb_stream->rate_committed = committed;
+}
+
+/*
+ * How many directions currently hold the hardware rate, i.e. have had a rate
+ * accepted by jockey3_pcm_hw_params() and not yet released by
+ * jockey3_pcm_hw_free(). The device has a single rate for both directions, so
+ * this is what the open-time constraint and the hw_params interlock key off.
+ *
+ * Deliberately not a count of *running* streams: .trigger is what sets
+ * @running, so a stream that is open, has its rate fixed and is merely waiting
+ * to be started would not be counted, and the other direction could reprogram
+ * the hardware underneath it -- it would then play or record at the wrong
+ * speed.
+ *
+ * Equally deliberately not a count of *open* streams: a full-duplex
+ * application opens both directions before calling hw_params on either, and
+ * counting opens would pin the second one to whatever rate the device happens
+ * to be sitting at, refusing an otherwise legal rate change.
+ *
+ * One consequence is worth knowing: the constraint jockey3_pcm_open() applies
+ * is permanent for that substream's runtime, while a commitment is not, so a
+ * stream that opened while the other direction held a rate stays pinned to it
+ * even after that direction closes. That is inherent to a device with a single
+ * rate for both directions, and is the safe side of the trade.
+ */
+static int jockey3_rate_committed_streams(struct jockey3_chip *chip)
+{
+	int committed = 0;
+
+	scoped_guard(spinlock_irqsave, &chip->capture.lock) {
+		if (chip->capture.rate_committed)
+			committed++;
+	}
+
+	scoped_guard(spinlock_irqsave, &chip->playback.lock) {
+		if (chip->playback.rate_committed)
+			committed++;
+	}
+
+	return committed;
+}
+
 static bool jockey3_process_out_packet(struct jockey3_chip *chip, u8 *urb_buf)
 {
 	struct snd_pcm_substream *substream = chip->playback.substream;
@@ -1337,7 +1406,7 @@ static unsigned long jockey3_watchdog_next_delay_ms(struct jockey3_chip *chip,
 		       JOCKEY3_WATCHDOG_MIN_POLL_MS, JOCKEY3_WATCHDOG_POLL_MS);
 }
 
-/* Forward declaration: defined further down */
+/* Forward declaration: defined further down, alongside its other caller jockey3_pcm_hw_params() */
 static bool jockey3_stream_is_open(struct jockey3_chip *chip, const int direction);
 
 /*
@@ -1538,7 +1607,7 @@ static void jockey3_submit_failed(struct jockey3_chip *chip, int err,
  * @chip: driver state
  * @warm: true only for the stall watchdog's own lightweight restart of a ring
  *	that was streaming a moment earlier; false for a cold start (first open,
- *	USB reset, probe). Both share start_grace_ms; this
+ *	rate change, USB reset, probe). Both share start_grace_ms; this
  *	only labels the restart for dev_dbg() and is recorded chip-wide in
  *	@chip->warm_start.
  *
@@ -1773,6 +1842,9 @@ static int jockey3_set_rate(struct jockey3_chip *chip, unsigned int rate, bool c
 	 * device's power-on default. The write evidently does more than set a
 	 * frequency; no vendor initialization omits it. See
 	 * re/usb/init_timing_comparison.md.
+	 *
+	 * Callers that want to avoid a redundant rate change already check
+	 * against chip->current_rate before getting here.
 	 */
 	dev_dbg(&chip->intf0->dev, "Setting hardware rate: %u Hz\n", rate);
 	ret = ploytec_set_rate(chip->intf0, chip->xfer_buf, rate, cold_init);
@@ -1801,7 +1873,9 @@ static bool jockey3_stream_is_open(struct jockey3_chip *chip, const int directio
 	return open;
 }
 
-/* Forward declaration: defined further down, alongside its other caller jockey3_pcm_prepare() */
+/* Forward declaration: defined further down, alongside its other callers jockey3_pcm_hw_params()
+ * and jockey3_pcm_prepare()
+ */
 static int jockey3_recover_urb_stream(struct jockey3_chip *chip, const int direction,
 				      const char *context);
 
@@ -1923,11 +1997,11 @@ static bool jockey3_stream_streaming_healthy(struct jockey3_chip *chip,
  *
  * Reports a direction that has stopped completing URBs and, on the onset edge,
  * recovers it -- the only path that catches a stall mid-stream, with no PCM
- * ioctl to hand it to. Gated by direction: Playback always recovers because it
- * carries MIDI OUT; Capture only if a capture stream is open, since the ladder
- * restarts the shared ring and an idle Capture stall would glitch working
- * Playback for no visible gain. It is logged and left for the next capture
- * open.
+ * ioctl to hand it to. Gated as jockey3_pcm_hw_params() gates its own capture
+ * recovery: Playback always recovers because it carries MIDI OUT; Capture only
+ * if a capture stream is open, since the ladder restarts the shared ring and
+ * an idle Capture stall would glitch working Playback for no visible gain. It
+ * is logged and left for the next capture open.
  *
  * Logging is edge-triggered, one line per stall start and end. The measured
  * age is reported rather than the threshold, since the poll interval would
@@ -1961,11 +2035,18 @@ static void jockey3_watchdog_check(struct jockey3_chip *chip, const int directio
 
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
 		/*
-		 * One flag covers every deliberate stop -- pre_reset and
-		 * teardown both reach jockey3_stop_urbs(). Checked before
-		 * now/last/age_ns are sampled, not after: this tick can have
-		 * been sitting on system_long_wq for a while before it got to
-		 * run, and a stop+restart cycle can complete inside that wait.
+		 * One flag covers every deliberate stop -- rate change,
+		 * pre_reset and teardown all reach jockey3_stop_urbs(). Checked
+		 * before now/last/age_ns are sampled, not after: this tick can
+		 * have been sitting on system_long_wq for a while before it got
+		 * to run, and a stop+restart cycle -- which routinely takes on
+		 * the order of 100 ms, far longer than this spinlock is ever
+		 * held -- can complete inside that wait. Sampling first and
+		 * checking stopping second, as this used to, let a tick whose
+		 * data predated the stop act on it once stopping had already
+		 * gone false again, misreporting a rate change's own deliberate
+		 * silence as a stall. See re/rate_change_stall.md for the
+		 * hardware traces this closed.
 		 */
 		if (urb_stream->stopping) {
 			urb_stream->stall_reported = false;
@@ -2062,8 +2143,8 @@ static void jockey3_watchdog_check(struct jockey3_chip *chip, const int directio
  *
  * Acts as well as detects: jockey3_watchdog_check() calls
  * jockey3_recover_urb_stream() directly on a new stall onset. This is the
- * only place recovery can be triggered without a PCM ioctl (prepare)
- * re-entering the driver first -- necessary because a long-running,
+ * only place recovery can be triggered without some PCM ioctl (hw_params,
+ * prepare) re-entering the driver first -- necessary because a long-running,
  * uninterrupted stream never re-enters otherwise, and ALSA core's own
  * wait_for_avail() (sound/core/pcm_lib.c) times out the open substream with
  * -EIO on its own schedule regardless of whether this driver ever notices.
@@ -2227,13 +2308,17 @@ static int jockey3_run_recovery_ladder(struct jockey3_chip *chip, const int dire
 	scoped_guard(mutex, &chip->rate_mutex) {
 		/*
 		 * Something else may have already fixed this while the call above
-		 * was waiting for rate_mutex -- a device reset, say, whose
-		 * jockey3_post_reset() restarts the ring under this same mutex.
+		 * was waiting for rate_mutex -- most plausibly
+		 * jockey3_pcm_hw_params()'s own rate-change restart, which holds
+		 * this same mutex across its whole stop/set-rate/start sequence.
 		 * The alive check above this function's entry is stale by the
 		 * time the lock is held; re-checking here is what makes a call
 		 * that raced a legitimate recovery a no-op instead of a second,
 		 * redundant full URB-ring teardown/rebuild landing right on top
-		 * of one that already succeeded.
+		 * of one that already succeeded. Without this re-check the
+		 * redundant restart can miss its own liveness budget and escalate
+		 * to a full USB reset that a change which had already recovered on
+		 * its own never needed. See re/rate_change_stall.md.
 		 */
 		if (jockey3_check_urb_stream_alive(urb_stream)) {
 			dev_dbg(&chip->intf0->dev,
@@ -2332,10 +2417,11 @@ static int jockey3_run_recovery_ladder(struct jockey3_chip *chip, const int dire
  * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
  * @context: short description of what found the stall, for the log
  *
- * Shared by jockey3_pcm_prepare()'s liveness check and
- * jockey3_watchdog_check()'s mid-stream detection. Every call site confirms
- * the stall first, and a direction found alive at entry returns immediately,
- * so two sequential calls for one stall are cheap.
+ * Shared by jockey3_pcm_hw_params()'s post-rate-change check,
+ * jockey3_pcm_prepare()'s liveness check and jockey3_watchdog_check()'s
+ * mid-stream detection. Every call site confirms the stall first, and a
+ * direction found alive at entry returns immediately, so two sequential calls
+ * for one stall are cheap.
  *
  * Concurrent calls need more: two can both pass the alive check before either
  * restarts anything, then run competing stop/start sequences or resets.
@@ -2401,14 +2487,17 @@ static int jockey3_recover_urb_stream(struct jockey3_chip *chip, const int direc
 				 SNDRV_PCM_INFO_BATCH |		\
 				 SNDRV_PCM_INFO_MMAP_VALID)
 
-#define JOCKEY3_PCM_RATES	SNDRV_PCM_RATE_44100
+#define JOCKEY3_PCM_RATES	(SNDRV_PCM_RATE_44100 |	\
+				 SNDRV_PCM_RATE_48000 |	\
+				 SNDRV_PCM_RATE_88200 |	\
+				 SNDRV_PCM_RATE_96000)
 
 static const struct snd_pcm_hardware jockey3_pcm_hw_playback = {
 	.info			= JOCKEY3_PCM_INFO,
 	.formats		= SNDRV_PCM_FMTBIT_S24_3LE,
 	.rates			= JOCKEY3_PCM_RATES,
 	.rate_min		= 44100,
-	.rate_max		= 44100,
+	.rate_max		= 96000,
 	.channels_min		= 4,
 	.channels_max		= 4,
 	.buffer_bytes_max	= 1024 * 1024,
@@ -2431,7 +2520,7 @@ static const struct snd_pcm_hardware jockey3_pcm_hw_capture = {
 	.formats		= SNDRV_PCM_FMTBIT_S24_3LE,
 	.rates			= JOCKEY3_PCM_RATES,
 	.rate_min		= 44100,
-	.rate_max		= 44100,
+	.rate_max		= 96000,
 	.channels_min		= 6,
 	.channels_max		= 6,
 	.buffer_bytes_max	= 1024 * 1024,
@@ -2468,6 +2557,26 @@ static int jockey3_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * Rate constraints under rate_mutex, which also excludes a concurrent
+	 * rate change in jockey3_pcm_hw_params(). Re-check for disconnect here:
+	 * the check above raced with anything that happened while we were not
+	 * holding the mutex.
+	 */
+	scoped_guard(mutex, &chip->rate_mutex) {
+		if (jockey3_is_disconnected(chip))
+			return -ENODEV;
+
+		if (jockey3_rate_committed_streams(chip) > 0) {
+			/* Force the new stream to match the existing hardware rate */
+			ret = snd_pcm_hw_constraint_single(runtime,
+							   SNDRV_PCM_HW_PARAM_RATE,
+							   chip->current_rate);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	/* Substream registration under spinlock to ensure memory consistency to the ISR*/
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
 		urb_stream->substream = substream;
@@ -2494,13 +2603,17 @@ static int jockey3_pcm_close(struct snd_pcm_substream *substream)
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
 		urb_stream->substream = NULL;
 		urb_stream->running = false;
+		urb_stream->rate_committed = false;
 
 		/*
 		 * A closed direction is not covered by jockey3_pcm_hw_params()
 		 * any more, so its N would otherwise sit at whatever the last
 		 * open left it at -- possibly a small, period-tuned value that
-		 * has nothing to do with the next stream to open it. Reset to
-		 * the default here so an idle direction always runs at a safe N.
+		 * has nothing to do with the next stream to open it, or with
+		 * this direction's own idle ring being re-armed by a rate
+		 * change on the *other* direction (jockey3_start_urbs() re-arms
+		 * both unconditionally). Reset to the default here so an idle
+		 * direction always re-arms at a safe N.
 		 */
 		WRITE_ONCE(urb_stream->n_shift, ilog2(default_n));
 		WRITE_ONCE(urb_stream->n_pkts, default_n);
@@ -2564,18 +2677,20 @@ static int jockey3_pcm_prepare(struct snd_pcm_substream *substream)
 		return ret;
 
 	/*
-	 * Taking rate_mutex here serializes against a URB restart in
-	 * jockey3_recover_urb_stream() or a device reset, both of which hold it
-	 * across their stop/start sequence -- so the liveness below is sampled
-	 * from a settled state rather than from the middle of a URB restart.
+	 * Taking rate_mutex here serializes against an in-flight rate change in
+	 * jockey3_pcm_hw_params(), which holds it across the whole stop/set/start
+	 * sequence -- so the liveness below is sampled from a settled state
+	 * rather than from the middle of a URB restart.
 	 */
 	scoped_guard(mutex, &chip->rate_mutex) {
 		if (jockey3_is_disconnected(chip))
 			return -ENODEV;
 
 		/*
-		 * The ring may have stalled since it was started. Catch it here,
-		 * before the stream that is being prepared starts relying on it.
+		 * Either direction may have been left stalled by an earlier rate
+		 * change that happened while this stream was not open (see
+		 * jockey3_pcm_hw_params()). Catch it here, before the stream that
+		 * is being prepared starts relying on it.
 		 *
 		 * This single sample is only a hint. jockey3_check_urb_stream_alive()'s
 		 * window is scaled to always span a handful of packet intervals
@@ -2647,7 +2762,14 @@ static int jockey3_pcm_prepare(struct snd_pcm_substream *substream)
 
 /*
  * Called by the ALSA core with the substream stream lock held and interrupts
- * disabled, so this callback must never sleep.
+ * disabled, so this callback must never sleep. In particular it must not wait
+ * for a rate change or a device reset: a URB completion can re-enter here via
+ * snd_pcm_period_elapsed() -> snd_pcm_stop_xrun(), and blocking would then
+ * stall the very rate change it is waiting on.
+ *
+ * Serialization against a concurrent rate change is provided by rate_mutex in
+ * the sleepable callbacks instead; the ALSA state machine guarantees .prepare
+ * runs before TRIGGER_START and after every XRUN.
  *
  * Lock order here is snd_pcm_stream_lock -> urb_stream->lock, which is why the
  * URB callbacks drop urb_stream->lock before calling snd_pcm_period_elapsed().
@@ -2729,6 +2851,10 @@ static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version
  * this direction simply picks up the new N at its own next resubmission; the
  * ring turns over onto it within at most JOCKEY3_N_URBS completions. See
  * re/streaming_overhead.md for the rationale and measurements.
+ *
+ * Called unconditionally on every hw_params(), including when the rate is
+ * unchanged and the URB ring is never touched: N is a per-open, per-period
+ * property, independent of whether a rate change happens to be in progress.
  */
 static void jockey3_pcm_set_n(struct jockey3_chip *chip, struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *hw_params)
@@ -2752,16 +2878,215 @@ static void jockey3_pcm_set_n(struct jockey3_chip *chip, struct snd_pcm_substrea
 		is_playback ? "playback" : "capture", 1U << n_shift, period_bytes);
 }
 
+/**
+ * jockey3_pcm_change_rate() - reprogram the hardware rate for hw_params()
+ * @chip: driver state
+ * @substream: the substream asking for the rate
+ * @rate: the requested rate in Hz
+ * @changed: set true if the hardware was actually reprogrammed
+ *
+ * Split out of jockey3_pcm_hw_params() because nesting two scoped_guard()
+ * blocks in one scope shadows the guard's own variable and trips -Wshadow.
+ * Call with the USB device lock held; see the call site for why.
+ *
+ * Return: 0 on success or if the rate already matched (@changed stays false),
+ * %-EBUSY if the other direction holds a different rate, %-ENODEV if the device
+ * is gone, or the error from programming the rate.
+ */
+static int jockey3_pcm_change_rate(struct jockey3_chip *chip,
+				   struct snd_pcm_substream *substream,
+				   unsigned int rate, bool *changed)
+{
+	int ret;
+
+	/*
+	 * rate_mutex is held across the whole stop/set-rate/start sequence, which
+	 * is what excludes a concurrent rate change from another substream: any
+	 * other sleepable path that needs a settled rate takes the same mutex.
+	 */
+	guard(mutex)(&chip->rate_mutex);
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	/*
+	 * Drop this direction's own claim on the rate before counting:
+	 * an application is free to hw_free and run hw_params again at
+	 * a different rate, and its previous commitment must not be
+	 * what blocks it. Cleared inside rate_mutex, so the other
+	 * direction cannot observe the gap and reprogram the hardware.
+	 */
+	jockey3_set_rate_committed(chip, substream->stream, false);
+
+	if (chip->current_rate == rate) {
+		dev_dbg(&chip->intf0->dev, "Rate already set to %u, skipping change\n",
+			rate);
+		jockey3_set_rate_committed(chip, substream->stream, true);
+		return 0;
+	}
+
+	*changed = true;
+
+	/*
+	 * The other direction already holds the rate. The ALSA core
+	 * should have enforced the constraint from jockey3_pcm_open(),
+	 * so this is a backstop -- but it is also the only check that
+	 * covers a stream which opened while the device was idle and
+	 * only now asks for a rate the other direction has since fixed.
+	 */
+	if (jockey3_rate_committed_streams(chip) > 0) {
+		dev_err(&chip->intf0->dev,
+			"Cannot change rate to %u while the other stream holds %u\n",
+			rate, chip->current_rate);
+		return -EBUSY;
+	}
+
+	jockey3_stop_urbs(chip);
+
+	ret = jockey3_set_rate(chip, rate, false);
+	if (ret != 0) {
+		if (jockey3_err_device_gone(ret))
+			dev_dbg(&chip->intf0->dev,
+				"Rate change to %u abandoned; device is gone (%d)\n",
+				rate, ret);
+		else
+			dev_err(&chip->intf0->dev,
+				"Rate change to %u failed: %d\n", rate, ret);
+		/*
+		 * The rate change is what left the endpoints disabled if
+		 * they are, so this restart is the one most likely to
+		 * come back -ENOENT. Report it before returning the rate
+		 * error, which would otherwise be the only thing seen.
+		 */
+		jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, false),
+					  "a failed rate change");
+		return ret;
+	}
+
+	jockey3_set_current_rate(chip, rate);
+	jockey3_set_rate_committed(chip, substream->stream, true);
+
+	jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, false), "a rate change");
+
+	return 0;
+}
+
 static int jockey3_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *hw_params)
 {
 	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	unsigned int rate = params_rate(hw_params);
+	bool playback_alive, capture_alive, capture_open;
+	bool rate_changed = false;
+	unsigned int grace;
+	int ret = 0;
+
+	dev_dbg(&chip->intf0->dev, "PCM hw_params rate %u, rate_committed_streams %d\n",
+		rate, jockey3_rate_committed_streams(chip));
 
 	if (jockey3_is_disconnected(chip))
 		return -ENODEV;
 
+	/*
+	 * A previous call may have left a stall-recovery reset in flight (see
+	 * jockey3_recover_urb_stream(), called below). Without this, a rate
+	 * change arriving before that reset completes runs jockey3_set_rate()
+	 * and the URB restart against a device that is mid-reset, which fails
+	 * outright instead of recovering. jockey3_pcm_prepare() waits for the
+	 * same reason.
+	 */
+	ret = jockey3_wait_for_reset_completion(chip);
+	if (ret < 0)
+		return ret;
+
+	/* Independent of rate and of whether it changes; see jockey3_pcm_set_n() */
 	jockey3_pcm_set_n(chip, substream, hw_params);
 
+	/*
+	 * Programming a rate calls usb_set_interface(), which the USB core
+	 * serializes against usb_disconnect() with the device lock and nothing
+	 * else; both reach remove_intf_ep_devs(), whose only guard is the
+	 * unlocked bitfield intf->ep_devs_created.
+	 *
+	 * Three constraints fix where it goes. It cannot move down into
+	 * ploytec_initialize_device(): probe, disconnect and the reset callbacks
+	 * already hold it and it is not recursive. It must be dropped before the
+	 * recovery below, which can queue a reset that needs this same lock. And
+	 * it goes outside rate_mutex, the order pre_reset()/post_reset() use.
+	 *
+	 * The watchdog must never take it: jockey3_disconnect() holds it while
+	 * waiting in cancel_delayed_work_sync().
+	 */
+	scoped_guard(device, &chip->dev->dev)
+		ret = jockey3_pcm_change_rate(chip, substream, rate, &rate_changed);
+	if (ret < 0)
+		return ret;
+	if (!rate_changed)
+		return 0;
+
+	/*
+	 * The firmware does not always resume streaming after a rate change, so
+	 * check liveness on both directions and let
+	 * jockey3_recover_urb_stream() force a re-synchronization.
+	 *
+	 * Playback recovers unconditionally -- it carries MIDI OUT, so a stall
+	 * breaks MIDI control. Capture only if a stream is open: an idle
+	 * Capture stall is logged and deferred to the next open, since
+	 * recovering it would glitch working Playback audio.
+	 *
+	 * Outside rate_mutex, because an escalated reset needs pre_reset() and
+	 * post_reset() to take it. Playback goes first: if both died, its
+	 * restart of the shared ring makes the capture call a no-op.
+	 *
+	 * Start grace -- a rate change reprograms the endpoints over EP0.
+	 */
+	grace = jockey3_start_grace_ms();
+	playback_alive = jockey3_wait_urb_stream_started(chip, SNDRV_PCM_STREAM_PLAYBACK,
+							 grace, false, true);
+	capture_alive = jockey3_wait_urb_stream_started(chip, SNDRV_PCM_STREAM_CAPTURE,
+							grace, false, true);
+	capture_open = jockey3_stream_is_open(chip, SNDRV_PCM_STREAM_CAPTURE);
+
+	if (!playback_alive || (!capture_alive && capture_open)) {
+		dev_warn(&chip->intf0->dev,
+			 "Rate change to %u Hz left a stream stalled (playback_alive=%d, capture_alive=%d, capture_open=%d); attempting recovery\n",
+			 rate, playback_alive, capture_alive, capture_open);
+
+		if (!playback_alive) {
+			ret = jockey3_recover_urb_stream(chip, SNDRV_PCM_STREAM_PLAYBACK,
+							 "rate change");
+			if (ret < 0)
+				return ret;
+		}
+
+		if (!capture_alive && capture_open) {
+			ret = jockey3_recover_urb_stream(chip, SNDRV_PCM_STREAM_CAPTURE,
+							 "rate change");
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		if (!capture_alive)
+			dev_dbg(&chip->intf0->dev,
+				"Capture URB stalled after rate change to %u Hz, but no capture stream is open; deferring recovery to next capture open\n",
+				rate);
+		dev_dbg(&chip->intf0->dev, "Rate changed to %u successfully\n", rate);
+	}
+
+	return 0;
+}
+
+/*
+ * Release this direction's claim on the hardware rate. The URB ring is
+ * deliberately left running (see the top-of-file DOC); all this hands back is
+ * the right of the other direction -- or of this one, on a re-run of
+ * hw_params -- to program a different rate.
+ */
+static int jockey3_pcm_hw_free(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+
+	jockey3_set_rate_committed(chip, substream->stream, false);
 	return 0;
 }
 
@@ -2769,6 +3094,7 @@ static const struct snd_pcm_ops jockey3_pcm_ops = {
 	.open = jockey3_pcm_open,
 	.close = jockey3_pcm_close,
 	.hw_params = jockey3_pcm_hw_params,
+	.hw_free = jockey3_pcm_hw_free,
 	.prepare = jockey3_pcm_prepare,
 	.trigger = jockey3_pcm_trigger,
 	.sync_stop = jockey3_pcm_sync_stop,
@@ -2799,6 +3125,12 @@ static int jockey3_initialize(struct jockey3_chip *chip, int model)
 	 * otherwise takes to reach its first transfer is host-dependent, so a
 	 * value that only topped that up would erode on a faster machine.
 	 *
+	 * Placed here rather than in ploytec_initialize_device() because that
+	 * runs twice per probe -- once below, once via jockey3_set_rate() -- and
+	 * again on every rate change. This point runs once, and is the last
+	 * before the driver's first EP0 transfer; everything above it in probe()
+	 * is ALSA and USB core bookkeeping.
+	 *
 	 * See re/usb/init_timing_comparison.md for the measurements.
 	 */
 	msleep(250);
@@ -3278,7 +3610,10 @@ static void jockey3_disconnect(struct usb_interface *intf)
 
 	/*
 	 * Latch DISCONNECTED first, and for EITHER interface. Every ALSA entry
-	 * point tests it on the way in.
+	 * point tests it on the way in, so setting it before anything else is
+	 * torn down closes the window where e.g. jockey3_pcm_hw_params() had
+	 * already passed its check and would go on to resubmit URBs we just
+	 * killed.
 	 *
 	 * Doing it for interface 1 as well is what covers the unbind order. The
 	 * driver is bound to both interfaces and the USB core takes them down
-- 
2.47.3

