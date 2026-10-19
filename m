Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431993;
	b=qYkvuRjtBMKE3SkTLWt3o2nSA61yEJ2eLXHpvJ0CiNwpDEsqWsmkGp4Iv/5CS0AzySpT
	 05IQYayh67oaD/OFgfQI6rxolqCovzQWFpp6SPagqzoW1cu48No4jlGIAl7ULHU8Wg/gP
	 gw5nUqUMVyEhGs1r3Zz5Hz0eROdp7WbvmF7FycMGps3IJ1PTDmMXtwDgeoLT4aGpewrVD
	 Cph4Y28yYlI7fvmEkr5LLSngNCRKitDCjcp2AxHrpi/l/XioaRz1XjInAg+7sjTd/Ao2v
	 cJpBfp9+8Y/h+0hmNTjXF37aydN+FNWKPwdmuZeOFJu0H00rjXBqr+wg48tjH9qULlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NcOhz0tzSgfUH68/PJzrUKegW7bBcfa4YNTQCpAKSkg=;
	b=dJWJjiAR8n9kjjtKREMTQl/DLx554WQhex+U/cNAR46/ELgY+VKXix+vZzRn4rRVZ7Ax
	 ZO4Xe5E6zVSfDbDZKblfn8cbGPMm4l3UlW9my1ArM9dtH2OD+bffx6QqL1xhs0zSWkKz5
	 81bAR/JRVY0Desm8iOuNvaMMUaFHwr816lo5zHXHwWivzG/vqMnnQ2HKeJnXNlXKdZYBZ
	 yA3FpDK2jEw8+jfgQlVSaLy+EmvYdrIg+YMdUCLYB9lzZXBigw5nA2Y4wsTsCUYR/9bMt
	 ESIjMfQBnH0ztqaVMxh01tjA4fENV6Qmpjk0pOv1/ZQx213QbEydca6mDgxFGIK+08A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ky0A2tkq;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718BC60A3801
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 718BC60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ky0A2tkq
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso435885241.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431991; x=1793036791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcOhz0tzSgfUH68/PJzrUKegW7bBcfa4YNTQCpAKSkg=;
        b=ky0A2tkqGaxVehgBL1WNxM99ZO8gdScLdx1BSC1OXBBzOCmjknBMqk2MkY65UJJH7e
         4hZhZ+gI7zIgaSnWJXaoxJsy6lmXBeJTk2FvBk5dZaObVyCRCCHv3yp/wpCiGt6fDyiY
         R0n9xWouvtYwDY3E9Y4J3Q+5+4rVyEcd5jzyqgdiOyYL7g9Fy2K/JtrnO1VpGdsY7EYG
         qJ53jp6qJPNOIrX5TQ1rOxBI2Fd4lxu+3lZOo+vwaS/FiTegjFfJYXQPSuT1dpVK2Vi/
         Sh9s1Nz7XUMO+ojt8nSdBrZQ2GkptydFsRyhxun+I/wzDoe0fp4G6dPlV/Q8roAkx7qh
         JriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431991; x=1793036791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcOhz0tzSgfUH68/PJzrUKegW7bBcfa4YNTQCpAKSkg=;
        b=Op8TctFrD2BJRmyvRIXEXy4b+TLj5Ry5dZb+KgP3EdXrlKQ8+VBkvcNbj4rSeKIkgA
         cRnLQA0b/Qt2FbleOthAcC0DNK5NRU3XjvSIvSTYkZUKgb96evztyUbbizKsnIYDR7Nk
         4gVrRRjc+0oeJc3Je0JCaZJDlg+q94dZXeKlzBOs5TLWK7StW04R5RckCBPYRzc84AD7
         CusT4b8taYjQo0t/uEqwOZ+LkX6cOEADH9DYMAlo2flS1IXHx89GkZGtavTbocWvs25j
         /o9TFBHRzZTJ64k0hy/coQnoLbyqaMBNOefvbnzguUQJ1KcpY8Qs+7WWt580t+1bK4g4
         nVOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkrOCSgb8hxtEb9+8PkymwjGdgwgGH7zvpNRIEfkkcuo8EwuT/gn9TwYrFr5V+FmC1YaCFFruAqPFl+ZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXB8S0tkxDpg/A7Z1oIt4P+3Gl8W+nAsOOQKVqVz2n3cdq43w/
	Gnt5JDpdNKh7p/9K+QzCpGw0gnmg+T2fIrVgHWMFlFvxbYPPUYTNq9jJ
X-Gm-Gg: AYBFou0S6LQoCS64mYouJdu6ixBUTLEmdmxZkU+uU/6AUHS2KG+N5pFdlGjhC7Dig6o
	FrGVsEyxufOR4+sUMT1fWZ3VLV7D1bO942A+qKb7AiYPD5ovVGpra3Nf1ANkGem3JjE8fFBNSzi
	4EETsrEEC7tSN23e5WQa5yKA4XA4WhiyDhP6rSTs3Ksa356USH8y2j4pntFTzCmUXExl1aibzDK
	XNFb4PTjpobCkCcf7W64anfaJhdlwVi+mY2adMzvqg0h0JgIuIypT/IDEln5n4SwntdFnmCgOLK
	OFCB7zdejYClk7Be/shnzujh0PRa10b6Hr8Ki+0qGsiRyuHMTo4dUqxMLbARHLVU1AErEmYfFSp
	Qhb6ndu+HJeu6sQJ+r23G7cx5++4pk3qPCKFPwqTvsJGrkIQOqlCrIK+AqKR1bfgHG2CCOc1GY9
	ctWScv4PuUsK0sruH6SHDh/++UamGNr0OLwfpEu01WYTVDgDQVFNbD4wlfA1A+f4F+pJKBW0lSu
	xFmAgAiNVcURU23q49scLJT6SKmg6NVOfhbhhTEuJF2+U5pt2Y+o2BXxz1IvcXLD4Lm/AklCZE8
	wMmU6t5hIwtS6pB4K2haGLRG0Zx3IEE=
X-Received: by 2002:a05:6102:3c92:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7cc36494a62mr2114430137.0.1792431990901;
        Mon, 19 Oct 2026 10:46:30 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:30 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/13] ALSA: jockey3: Add a watchdog for mid-stream stalls
Date: Mon, 19 Oct 2026 13:44:41 -0400
Message-ID: <20261019174445.1931263-10-fvdpol@gmail.com>
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

A stream that stalls while it is running is not noticed by anything so
far. Every error path hangs off a URB completion, and a stalled stream
has none. Playback does not even produce an xrun, because the hardware
pointer stops advancing.

Add a delayed work item that checks both directions for as long as the
URBs are meant to be flowing, which is the whole time the device is
bound. On a new stall it runs the recovery ladder from the previous
patch and reports an xrun on the open substreams.

 - Playback is always recovered, because it carries MIDI OUT.
 - Capture is recovered only while a capture stream is open. Recovery
   restarts both directions, so recovering an idle capture stream would
   glitch working playback.

The work item reschedules itself from the nearer of the two deadlines
while a stream is open, and once a second otherwise. The stall
threshold of 20 ms is sized so that recovery can finish before the ALSA
core gives up on the stream by itself.

jockey3_stop_urbs() runs under rate_mutex and so cancels the work
without waiting for it. The "Locking" comment explains why that is safe
and where the synchronous cancel is used.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/jockey3.c | 549 ++++++++++++++++++++++++++++++++++--
 1 file changed, 521 insertions(+), 28 deletions(-)

diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index 45365103510db..a6c9f0bcfc87d 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -21,6 +21,7 @@
 #include <linux/mutex.h>
 #include <linux/wait.h>
 #include <linux/wait_bit.h>
+#include <linux/workqueue.h>
 #include <linux/cleanup.h>
 #include <sound/core.h>
 #include <sound/initval.h>
@@ -91,6 +92,11 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * carries MIDI OUT, and the device expects a continuous packet stream. The PCM
  * callbacks therefore only toggle whether a URB's payload is filled from (or
  * copied to) an ALSA buffer.
+ *
+ * A stall can also be found and recovered mid-stream, with no PCM ioctl
+ * involved: jockey3_watchdog_work() polls URB liveness for the device's whole
+ * lifetime and calls the recovery ladder directly on a new stall onset. See
+ * jockey3_watchdog_check() and jockey3_watchdog_arm().
  */
 
 /**
@@ -110,8 +116,8 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * - jockey3_disconnect() does everything that must happen while the device is
  *   still there: latch JOCKEY3_FLAG_DISCONNECTED (for either interface, since
  *   the core takes them down one at a time), release anyone waiting on a
- *   reset, kill the URBs, release interface 1, and hand the card to
- *   snd_card_free_when_closed().
+ *   reset, stop the watchdog, kill the URBs, release interface 1, and hand the
+ *   card to snd_card_free_when_closed().
  *
  * - jockey3_card_free(), reached through card->private_free once the last file
  *   descriptor is closed, frees the buffers and URBs, destroys rate_mutex and
@@ -154,6 +160,39 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *
  * .trigger and .pointer are called by the core with the stream lock held and
  * interrupts disabled, so neither may sleep.
+ *
+ * The watchdog work item adds one rule: rate_mutex must never be held across
+ * cancel_delayed_work_sync(&chip->watchdog_work). jockey3_stop_urbs() is called
+ * from inside rate_mutex at two sites, so it disarms with the non-sync
+ * cancel_delayed_work(), which is safe under any lock; a tick that is already
+ * running when the cancel lands re-reads 'stopping' and does nothing. The sync
+ * form appears only in jockey3_disconnect(), in probe's error path and in
+ * jockey3_free_resources(), none of which holds a mutex.
+ *
+ * Because that disarm does not wait, a tick can be parked on rate_mutex while
+ * jockey3_pre_reset() takes the device down, then wake to the timestamps it
+ * zeroed and read the stream as stalled. So jockey3_recover_urb_stream()
+ * re-tests DISCONNECTED and RESETTING under the mutex and leaves the restart
+ * to jockey3_post_reset().
+ *
+ * jockey3_watchdog_work() itself may call jockey3_recover_urb_stream(),
+ * which takes rate_mutex and calls jockey3_stop_urbs() -- i.e. the watchdog's
+ * own tick disarming itself via the non-sync cancel above, which is exactly
+ * the safe case: it never blocks and does not affect the tick already
+ * running. It may also queue a full USB reset; that reset runs on system_wq
+ * (usb_queue_reset_device(), drivers/usb/core/message.c), never
+ * system_long_wq where the watchdog runs, so the two cannot serialize behind
+ * one another, and rate_mutex is dropped before the wait for it, letting
+ * jockey3_pre_reset()/jockey3_post_reset() take the mutex themselves to
+ * complete.
+ *
+ * This also means jockey3_recover_urb_stream() can be entered from two
+ * independent contexts (the watchdog, and a PCM ioctl) for what turns out to
+ * be the same stall. rate_mutex alone does not prevent both from running
+ * their stop/start-or-reset sequence concurrently, since neither holds it for
+ * the whole ladder -- chip->recovery_in_progress (atomic_cmpxchg(), not a
+ * lock, since the second caller must decline rather than block) is what
+ * makes only one such ladder run at a time; see its doc comment.
  */
 
 #define JOCKEY3_N_URBS 8
@@ -203,12 +242,41 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
 /* Consecutive URB transport errors tolerated before a direction is given up on */
 #define JOCKEY3_MAX_URB_ERRORS 8
 
+/*
+ * URB liveness watchdog.
+ *
+ * A healthy stream completes one URB every @n_pkts packet intervals, and a
+ * packet is 226.8 us at 44100 Hz. So JOCKEY3_WATCHDOG_STALL_MS of silence is
+ * many consecutive missed URBs at any N -- more than scheduling delay or bus
+ * contention produces on a device that is still streaming.
+ *
+ * The threshold is sized against ALSA core's own stall timeout
+ * (wait_for_avail() in sound/core/pcm_lib.c, roughly buffer_size * 1100 / rate
+ * ms), because jockey3_watchdog_check() recovers on this signal and needs
+ * headroom to succeed before the core returns -EIO to userspace itself.
+ * Contrast jockey3_check_urb_stream_alive()'s 1 ms window, which is sampled
+ * repeatedly inside a start grace and need only answer "anything just now?".
+ *
+ * jockey3_watchdog_arm() self-reschedules from the nearer of the two
+ * directions' deadlines, as dev_watchdog() does in net/sched/sch_generic.c.
+ * JOCKEY3_WATCHDOG_POLL_MS is the ceiling, used before either direction has
+ * started; JOCKEY3_WATCHDOG_MIN_POLL_MS the floor, so a confirmed stall is
+ * rechecked tightly rather than waiting out a stale window.
+ */
+#define JOCKEY3_WATCHDOG_POLL_MS	1000
+#define JOCKEY3_WATCHDOG_MIN_POLL_MS	10
+#define JOCKEY3_WATCHDOG_STALL_MS	20
 /*
  * Bounds and evidence thresholds for the "has this direction reached steady
  * streaming yet" checks that run over the window from jockey3_start_urbs()
- * until the device is proven alive. The grace duration itself is the
- * runtime-tunable start_grace_ms (see its comment near the top of the file);
- * these clamp a bad write and gate what counts as real streaming.
+ * until the device is proven alive -- distinct from JOCKEY3_WATCHDOG_STALL_MS,
+ * which governs silence between two completions on an already-established
+ * stream. The grace duration itself is the runtime-tunable start_grace_ms
+ * (see its comment near the top of the file); these clamp a bad write and
+ * gate what counts as real streaming.
+ *
+ * JOCKEY3_GRACE_MS_MIN is deliberately well above JOCKEY3_WATCHDOG_STALL_MS: a
+ * grace at the stall threshold escalates on scheduling jitter by construction.
  *
  * JOCKEY3_HEALTHY_MIN_COMPLETIONS feeds jockey3_stream_streaming_healthy(), the
  * stricter "did the warm restart actually take" test: a real stream lands
@@ -229,6 +297,14 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * budget is consulted after JOCKEY3_RECOVERY_WINDOW_MS has passed since the
  * current one started, so a chip that stops stalling is never left refusing
  * to recover for the rest of its life.
+ *
+ * The watchdog calls jockey3_recover_urb_stream() directly, and the xrun it
+ * reports before restarting anything can wake a concurrent
+ * jockey3_pcm_prepare() retry on the same direction before the
+ * watchdog's own call returns. chip->recovery_in_progress (see
+ * jockey3_recover_urb_stream()) makes that concurrent second call decline
+ * outright rather than draw from this budget, so one physical stall still
+ * draws against it at most once.
  */
 #define JOCKEY3_RECOVERY_MAX_ATTEMPTS	3
 #define JOCKEY3_RECOVERY_WINDOW_MS	60000
@@ -242,7 +318,7 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *
  * Writable at runtime (0644) and read through jockey3_start_grace_ms(),
  * which clamps to [JOCKEY3_GRACE_MS_MIN, JOCKEY3_GRACE_MS_MAX] so a bad write
- * cannot drive the grace to an unusable value.
+ * cannot drive the grace down to or below the stall threshold.
  */
 static int start_grace_ms = 200;
 module_param(start_grace_ms, int, 0644);
@@ -250,7 +326,7 @@ MODULE_PARM_DESC(start_grace_ms, "Grace (ms) for PCM to reach steady streaming a
 
 /*
  * Current start-grace budget in ms, clamped so a runtime write cannot drive
- * it to an unusable value.
+ * it to or below the stall threshold.
  */
 static unsigned int jockey3_start_grace_ms(void)
 {
@@ -279,9 +355,14 @@ static unsigned int jockey3_start_grace_ms(void)
  *	jockey3_start_urbs(); zeroed there and by jockey3_stop_urbs(). atomic_t,
  *	incremented lock-free from the completion handler.
  * @urbs_started_time: ktime at which jockey3_start_urbs() submitted this
- *	direction's ring; zeroed by jockey3_stop_urbs().
- *	jockey3_wait_urb_stream_started() measures the confirmation latency
- *	from here.
+ *	direction's ring; zeroed by jockey3_stop_urbs(). The watchdog measures
+ *	from here until the first completion arrives. A separate timestamp is
+ *	needed because @last_callback_time is deliberately 0 between a start and
+ *	the first completion, which jockey3_check_urb_stream_alive() must keep
+ *	reading as "not alive" -- so the watchdog cannot reuse it without either
+ *	reporting a stall at every start or breaking the check after a restart.
+ *	It doubles as the watchdog's post-start grace baseline (the grace
+ *	duration is start_grace_ms).
  * @lock: protects the fields marked "@lock" below; IRQ-safe leaf
  * @dma_off: byte offset into runtime->dma_area, i.e. the hardware pointer; @lock
  * @period_off: bytes accumulated towards the current period; @lock
@@ -298,6 +379,15 @@ static unsigned int jockey3_start_grace_ms(void)
  *	re-anchor a URB after the kill has drained the anchor.
  * @consec_errors: consecutive URB transport errors; @lock. Reset on any
  *	successful completion and by jockey3_start_urbs().
+ * @stall_reported: the watchdog has logged the onset of the current stall;
+ *	@lock. Edge flag, so a wedge produces one onset line and one closing
+ *	line rather than one per tick. Cleared either by the stream completing a
+ *	URB again, or by jockey3_watchdog_clear_stall() when a restart ends the
+ *	outage first -- which is the common case, since every recovery path goes
+ *	through jockey3_stop_urbs()/jockey3_start_urbs().
+ * @stall_since: ktime the current stall was measured from; @lock. Only
+ *	meaningful while @stall_reported is set, and used to report how long the
+ *	outage lasted once the stream comes back.
  * @n_shift: log2 of the Ploytec packets per URB ("N") the next resubmission
  *	will carry, in [0, 3]; @lock. Set by jockey3_pcm_hw_params() from the
  *	period size and reset to the default by jockey3_pcm_close(), so an idle
@@ -324,6 +414,8 @@ struct jockey3_pcm_urb_stream {
 	wait_queue_head_t drain_wait;
 	bool stopping;
 	unsigned int consec_errors;
+	bool stall_reported;
+	u64 stall_since;
 	u8 n_shift;
 	u8 n_pkts;
 };
@@ -341,7 +433,7 @@ struct jockey3_pcm_urb_stream {
  * @xfer_buf: bounce buffer for EP0 control transfers, USB_XFER_BUF_SIZE bytes.
  *	Serialized by @rate_mutex once the card is live. The one exception is
  *	jockey3_initialize(), which runs from probe before the card is
- *	registered, so it is the only user in existence.
+ *	registered or the watchdog armed, so it is the only user in existence.
  * @rate_mutex: serializes the URB stop/start sequences and the EP0 programming
  *	that goes with them; process context only, outermost lock
  * @flags: JOCKEY3_FLAG_* bits, atomic bitops
@@ -351,6 +443,10 @@ struct jockey3_pcm_urb_stream {
  *	so a waiter is released when the USB core skips post_reset() entirely.
  *	Re-armed by jockey3_queue_reset() for a reset this driver starts, and by
  *	jockey3_pre_reset() for one started anywhere else.
+ * @watchdog_work: periodic URB liveness check; see jockey3_watchdog_work().
+ *	Armed by jockey3_start_urbs() and disarmed by jockey3_stop_urbs(), so it
+ *	runs exactly when the URBs are supposed to be flowing -- which, for this
+ *	device, is its whole lifetime rather than only while a PCM stream is open.
  * @recovery_attempts: resets taken from the current window by
  *	jockey3_recovery_budget_take(); not mutex-protected, since
  *	jockey3_pcm_prepare()'s liveness check and recovery run outside
@@ -363,14 +459,22 @@ struct jockey3_pcm_urb_stream {
  *	time, chip-wide rather than per-direction for the same reason
  *	@recovery_attempts is chip-wide: jockey3_stop_urbs()/jockey3_start_urbs()
  *	restart the shared ring for both directions together, so a Playback
- *	recovery and a concurrent Capture recovery -- e.g. two racing
- *	jockey3_pcm_prepare() calls -- would step on each other's
+ *	recovery and a concurrent Capture recovery -- e.g. the watchdog and a
+ *	racing jockey3_pcm_prepare() retry -- would step on each other's
  *	stop/start (or reset) sequence rather than being independent. A second
  *	caller finding this already set declines immediately rather than racing
  *	the first; the first caller's restart brings back whichever direction
  *	the second one wanted too. Test-and-set via atomic_cmpxchg() rather than
  *	a mutex held across the whole ladder, since jockey3_check_urb_stream_alive()
  *	callers elsewhere poll rather than block on recovery finishing.
+ * @warm_start: true if the current URB ring was last started by the stall
+ *	watchdog's own lightweight restart, false for every other (re)start
+ *	(first open, USB reset, probe). Both kinds share
+ *	one start_grace_ms; this only labels which one is in effect, for
+ *	dev_dbg(). Chip-wide, not per-direction: jockey3_start_urbs() restarts
+ *	the shared ring for both directions at once. Plain bool, written by
+ *	jockey3_start_urbs() and read unlocked by the watchdog via
+ *	WRITE_ONCE()/READ_ONCE().
  * @midi_in_urb: the single MIDI IN URB; not anchored, killed directly
  * @midi_in_buf: transfer buffer for @midi_in_urb
  * @midi_lock: protects the MIDI fields; IRQ-safe leaf
@@ -391,9 +495,11 @@ struct jockey3_chip {
 	unsigned int current_rate;
 	unsigned int dev_idx;
 	struct completion reset_done;
+	struct delayed_work watchdog_work;
 	atomic_t recovery_attempts;
 	atomic64_t recovery_window_start;
 	atomic_t recovery_in_progress;
+	bool warm_start;	/* set by jockey3_start_urbs(): warm vs cold, for dev_dbg() only */
 
 	/* MIDI Path */
 	struct urb *midi_in_urb;
@@ -1183,6 +1289,143 @@ static void jockey3_midi_in_callback(struct urb *urb)
 		jockey3_resubmit_failed(chip, ret, "MIDI IN");
 }
 
+/*
+ * How long until a direction's watchdog deadline (last activity plus
+ * JOCKEY3_WATCHDOG_STALL_MS, or the current start grace if no completion has
+ * arrived since the last start), in ms clamped to
+ * [JOCKEY3_WATCHDOG_MIN_POLL_MS, JOCKEY3_WATCHDOG_POLL_MS]. Returns
+ * JOCKEY3_WATCHDOG_POLL_MS if the direction has never started (no deadline to
+ * chase yet), and the floor if the deadline has already passed, so a
+ * confirmed stall gets rechecked tightly instead of waiting out a stale
+ * window. Only meaningful while a PCM stream is open somewhere -- see the
+ * caller, jockey3_watchdog_arm().
+ */
+static unsigned long jockey3_watchdog_next_delay_ms(struct jockey3_chip *chip,
+						    const struct jockey3_pcm_urb_stream *urb_stream)
+{
+	u64 last = atomic64_read(&urb_stream->last_callback_time);
+	u64 started = atomic64_read(&urb_stream->urbs_started_time);
+	u64 threshold_ms = JOCKEY3_WATCHDOG_STALL_MS;
+	unsigned int grace_ms = jockey3_start_grace_ms();
+	u64 now, remaining_ns;
+
+	if (!started)
+		return JOCKEY3_WATCHDOG_POLL_MS;
+
+	now = ktime_get_mono_fast_ns();
+
+	/*
+	 * Mirror jockey3_watchdog_check()'s own time-based grace window
+	 * (see its kernel-doc): while still inside it, the deadline to chase
+	 * is urbs_started_time + grace_ms regardless of whether an early
+	 * completion has already advanced last_callback_time, or this would
+	 * schedule a tight re-poll off a completion that does not end grace.
+	 */
+	if (now - started < (u64)grace_ms * NSEC_PER_MSEC) {
+		last = started;
+		threshold_ms = grace_ms;
+	} else if (!last) {
+		last = started;
+	}
+
+	remaining_ns = last + threshold_ms * NSEC_PER_MSEC - now;
+
+	if ((s64)remaining_ns <= 0)
+		return JOCKEY3_WATCHDOG_MIN_POLL_MS;
+
+	return clamp_t(unsigned long, div_u64(remaining_ns, NSEC_PER_MSEC),
+		       JOCKEY3_WATCHDOG_MIN_POLL_MS, JOCKEY3_WATCHDOG_POLL_MS);
+}
+
+/* Forward declaration: defined further down */
+static bool jockey3_stream_is_open(struct jockey3_chip *chip, const int direction);
+
+/*
+ * Schedule the next watchdog tick.
+ *
+ * State-dependent cadence. With no substream open nothing is waiting on ALSA
+ * core's wait_for_avail() timeout, so there is no reason to chase
+ * JOCKEY3_WATCHDOG_STALL_MS; poll at the JOCKEY3_WATCHDOG_POLL_MS ceiling.
+ * Once a substream is open, self-reschedule from the nearer of the two
+ * directions' deadlines, as dev_watchdog() does in net/sched/sch_generic.c.
+ * Capture's deadline counts only while a capture stream is open: an idle
+ * Capture stall is logged, never recovered (see jockey3_watchdog_check()),
+ * and chasing its long-passed deadline would pin the tick to
+ * JOCKEY3_WATCHDOG_MIN_POLL_MS for as long as Playback stays open.
+ *
+ * Unlike dev_watchdog() the delay is not passed through
+ * round_jiffies_relative(), which rounds to whole seconds -- right for a
+ * multi-second watchdog_timeo, two orders of magnitude too coarse here.
+ *
+ * system_long_wq rather than system_wq: the tick is cheap, but
+ * jockey3_watchdog_check() may call jockey3_recover_urb_stream(), which blocks
+ * for seconds, and system_wq items are expected to be short.
+ */
+static void jockey3_watchdog_arm(struct jockey3_chip *chip)
+{
+	bool capture_open = jockey3_stream_is_open(chip, SNDRV_PCM_STREAM_CAPTURE);
+	unsigned long delay_ms = JOCKEY3_WATCHDOG_POLL_MS;
+
+	if (capture_open || jockey3_stream_is_open(chip, SNDRV_PCM_STREAM_PLAYBACK))
+		delay_ms = jockey3_watchdog_next_delay_ms(chip, &chip->playback);
+	if (capture_open)
+		delay_ms = min(delay_ms, jockey3_watchdog_next_delay_ms(chip, &chip->capture));
+
+	queue_delayed_work(system_long_wq, &chip->watchdog_work, msecs_to_jiffies(delay_ms));
+}
+
+/**
+ * jockey3_watchdog_clear_stall() - close out a stall that a restart ended
+ * @chip: driver state
+ * @urb_stream: the affected direction
+ * @type: direction name, for the log message
+ *
+ * Every recovery path in this driver goes through jockey3_stop_urbs() and
+ * jockey3_start_urbs(), so a stalled stream is essentially always brought back
+ * by a restart rather than by starting to complete URBs again on its own. If
+ * the restart simply cleared the flag, the watchdog's onset line would never
+ * be paired with anything and the outage would have no recorded end -- which
+ * makes "stalls that ended" indistinguishable from "stalls still open" for
+ * anything reading the log afterwards.
+ *
+ * So the restart closes the outage explicitly. Together with the recovery line
+ * in jockey3_watchdog_check(), every onset has exactly one counterpart.
+ */
+static void jockey3_watchdog_clear_stall(struct jockey3_chip *chip,
+					 struct jockey3_pcm_urb_stream *urb_stream,
+					 const char *type)
+{
+	u64 outage_ns = 0;
+	bool reported;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		reported = urb_stream->stall_reported;
+		if (reported)
+			outage_ns = ktime_get_mono_fast_ns() - urb_stream->stall_since;
+		urb_stream->stall_reported = false;
+	}
+
+	if (reported)
+		dev_warn(&chip->intf0->dev,
+			 "%s URB stream restarted after stalling for %llu ms\n",
+			 type, div_u64(outage_ns, NSEC_PER_MSEC));
+}
+
+/*
+ * Stop the watchdog from the URB teardown path.
+ *
+ * Deliberately the non-sync cancel: jockey3_stop_urbs() runs inside rate_mutex
+ * at several sites and the work item takes locks of its own, so waiting for a
+ * running tick here would be a deadlock waiting to happen. Not waiting is safe
+ * because a tick that is already running re-reads 'stopping' under the stream
+ * lock and does nothing. The sync cancel that teardown does need lives in
+ * jockey3_disconnect() and in probe's error path, where no mutex is held.
+ */
+static void jockey3_watchdog_disarm(struct jockey3_chip *chip)
+{
+	cancel_delayed_work(&chip->watchdog_work);
+}
+
 /**
  * jockey3_stop_urbs() - stop all PCM and MIDI URBs
  * @chip: driver state
@@ -1195,6 +1438,8 @@ static void jockey3_stop_urbs(struct jockey3_chip *chip)
 {
 	dev_dbg(&chip->intf0->dev, "Stopping all URBs\n");
 
+	jockey3_watchdog_disarm(chip);
+
 	/*
 	 * Fence the completion handlers before killing anything. Each 'stopping'
 	 * store pairs with the test the matching handler makes while holding the
@@ -1202,6 +1447,12 @@ static void jockey3_stop_urbs(struct jockey3_chip *chip)
 	 * released no handler can add a URB back to an anchor we are about to
 	 * drain. The spinlocks provide the required ordering; no explicit barrier
 	 * is needed.
+	 *
+	 * These stores must also stay above the timestamp zeroing below. The
+	 * watchdog is disarmed without waiting for a tick that is already
+	 * running, and such a tick samples the timestamps before it takes the
+	 * stream lock; 'stopping' being set by the time it gets there is the only
+	 * thing that stops it reporting a stall for a stream we stopped on purpose.
 	 */
 	scoped_guard(spinlock_irqsave, &chip->playback.lock)
 		chip->playback.stopping = true;
@@ -1285,10 +1536,11 @@ static void jockey3_submit_failed(struct jockey3_chip *chip, int err,
 /**
  * jockey3_start_urbs() - submit all PCM and MIDI URBs
  * @chip: driver state
- * @warm: true only for the recovery ladder's lightweight restart of a ring
+ * @warm: true only for the stall watchdog's own lightweight restart of a ring
  *	that was streaming a moment earlier; false for a cold start (first open,
  *	USB reset, probe). Both share start_grace_ms; this
- *	only labels the restart for dev_dbg().
+ *	only labels the restart for dev_dbg() and is recorded chip-wide in
+ *	@chip->warm_start.
  *
  * Clears the stop fences and error budgets, then submits the full URB ring for
  * both directions plus the MIDI IN URB. Uses GFP_KERNEL, so process context
@@ -1333,11 +1585,17 @@ static int jockey3_start_urbs(struct jockey3_chip *chip, bool warm)
 		chip->midi_consec_errors = 0;
 	}
 
+	/* Report and clear any stall this restart is about to end */
+	jockey3_watchdog_clear_stall(chip, &chip->playback, "Playback");
+	jockey3_watchdog_clear_stall(chip, &chip->capture, "Capture");
+
 	/*
-	 * Stamp the start before submitting, not after: a URB can complete
-	 * before the loop below has finished. Reset the cadence counters in the
-	 * same breath.
+	 * Stamp the start before submitting, not after: this is what the
+	 * watchdog measures from until the first completion arrives, and a URB
+	 * can complete before the loop below has finished. Reset the cadence
+	 * counters in the same breath, and record which grace applies.
 	 */
+	WRITE_ONCE(chip->warm_start, warm);
 	atomic64_set(&chip->playback.first_callback_time, 0);
 	atomic64_set(&chip->capture.first_callback_time, 0);
 	atomic_set(&chip->playback.completions_since_start, 0);
@@ -1410,6 +1668,14 @@ static int jockey3_start_urbs(struct jockey3_chip *chip, bool warm)
 				n_playback, JOCKEY3_N_URBS, n_capture, JOCKEY3_N_URBS);
 	}
 
+	/*
+	 * Arm regardless of first_err. A ring that came up short, or did not come
+	 * up at all, is precisely the state worth watching: when the endpoints
+	 * have been disabled underneath us every submit fails and nothing is left
+	 * to report the resulting silence.
+	 */
+	jockey3_watchdog_arm(chip);
+
 	return first_err;
 }
 
@@ -1434,7 +1700,8 @@ static int jockey3_start_urbs(struct jockey3_chip *chip, bool warm)
  *   pointless and jockey3_disconnect() is on its way. This is the common case
  *   on an ordinary unplug and must not be treated like the one above.
  *
- * - anything else is reported and left alone.
+ * - anything else is reported and left alone; the watchdog picks up whatever
+ *   silence results.
  *
  * Note that trying to undo the failure by selecting the working altsetting
  * again does not work: if the control endpoint is unresponsive, that request
@@ -1523,6 +1790,21 @@ static int jockey3_set_rate(struct jockey3_chip *chip, unsigned int rate, bool c
 	return 0;
 }
 
+static bool jockey3_stream_is_open(struct jockey3_chip *chip, const int direction)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	bool open;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		open = urb_stream->substream;
+	}
+	return open;
+}
+
+/* Forward declaration: defined further down, alongside its other caller jockey3_pcm_prepare() */
+static int jockey3_recover_urb_stream(struct jockey3_chip *chip, const int direction,
+				      const char *context);
+
 static bool jockey3_check_urb_stream_alive(const struct jockey3_pcm_urb_stream *urb_stream)
 {
 	u64 last_time = atomic64_read(&urb_stream->last_callback_time);
@@ -1569,7 +1851,7 @@ static u64 jockey3_min_urb_interval_ns(const struct jockey3_pcm_urb_stream *urb_
  * jockey3_check_urb_stream_alive() answers "did anything complete just now",
  * which a single FIFO-drain completion satisfies. This is the stricter test,
  * used at the one decision that must not be fooled by trickle: whether the
- * ladder's warm URB restart worked, or it should escalate to a
+ * stall watchdog's warm URB restart worked, or the ladder should escalate to a
  * full USB reset (a stream-killing event, and on this hardware one that can
  * leave the capture endpoint down). It requires
  *
@@ -1634,6 +1916,193 @@ static bool jockey3_stream_streaming_healthy(struct jockey3_chip *chip,
 	return true;
 }
 
+/**
+ * jockey3_watchdog_check() - one direction's share of a watchdog tick
+ * @chip: driver state
+ * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
+ *
+ * Reports a direction that has stopped completing URBs and, on the onset edge,
+ * recovers it -- the only path that catches a stall mid-stream, with no PCM
+ * ioctl to hand it to. Gated by direction: Playback always recovers because it
+ * carries MIDI OUT; Capture only if a capture stream is open, since the ladder
+ * restarts the shared ring and an idle Capture stall would glitch working
+ * Playback for no visible gain. It is logged and left for the next capture
+ * open.
+ *
+ * Logging is edge-triggered, one line per stall start and end. The measured
+ * age is reported rather than the threshold, since the poll interval would
+ * only bound it to one tick.
+ *
+ * Deliberately does not gate on urbs_in_flight: endpoints disabled underneath
+ * the driver leave nothing in flight, which is the case that must not go
+ * unnoticed. The count is reported as evidence -- a full ring means
+ * "submitted, never returned", an empty one "nothing could be submitted".
+ *
+ * The onset tags itself "startup" if the direction has not completed a
+ * single URB since its last start -- caught once the start grace has run
+ * out -- and "steady-state" otherwise. Only "steady-state" is a real
+ * mid-stream fault.
+ *
+ * Time-based rather than keyed off the first completion: at low N a restart
+ * can complete an URB within under a millisecond, a hardware FIFO draining
+ * rather than the pipeline catching up, so an early completion must not end
+ * the grace. jockey3_stream_streaming_healthy() applies the same reasoning in
+ * the recovery ladder.
+ */
+static void jockey3_watchdog_check(struct jockey3_chip *chip, const int direction)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	const char *type = direction == SNDRV_PCM_STREAM_PLAYBACK ? "Playback" : "Capture";
+	bool log_onset = false, log_recovery = false;
+	u64 now, last, started, age_ns, outage_ns = 0;
+	u64 threshold_ms = JOCKEY3_WATCHDOG_STALL_MS;
+	unsigned int grace_ms = jockey3_start_grace_ms();
+	bool open = false, startup = false;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		/*
+		 * One flag covers every deliberate stop -- pre_reset and
+		 * teardown both reach jockey3_stop_urbs(). Checked before
+		 * now/last/age_ns are sampled, not after: this tick can have
+		 * been sitting on system_long_wq for a while before it got to
+		 * run, and a stop+restart cycle can complete inside that wait.
+		 */
+		if (urb_stream->stopping) {
+			urb_stream->stall_reported = false;
+			return;
+		}
+
+		/*
+		 * Read both candidate baselines before sampling @now, whichever
+		 * one ends up used below: a completion landing on another CPU
+		 * between reading a baseline and reading @now would otherwise let
+		 * "now - last" underflow to a u64 near its max instead of going
+		 * negative. Reading both first guarantees @now is taken no
+		 * earlier than either.
+		 */
+		started = atomic64_read(&urb_stream->urbs_started_time);
+		last = atomic64_read(&urb_stream->last_callback_time);
+		now = ktime_get_mono_fast_ns();
+
+		if (!started)
+			return;		/* never started; nothing to watch yet */
+
+		if (now - started < (u64)grace_ms * NSEC_PER_MSEC) {
+			/*
+			 * Still inside the fixed post-restart grace window --
+			 * measured from urbs_started_time regardless of whether
+			 * last_callback_time has already advanced. See this
+			 * function's kernel-doc for why an early completion is
+			 * not treated as proof the window is over.
+			 */
+			last = started;
+			threshold_ms = grace_ms;
+		} else if (!last) {
+			/* Past the grace window and still never completed once */
+			last = started;
+			startup = true;
+		}
+
+		age_ns = now - last;
+
+		open = urb_stream->substream;
+
+		if (age_ns > threshold_ms * NSEC_PER_MSEC) {
+			if (!urb_stream->stall_reported) {
+				urb_stream->stall_reported = true;
+				urb_stream->stall_since = last;
+				log_onset = true;
+			}
+		} else if (urb_stream->stall_reported) {
+			urb_stream->stall_reported = false;
+			/*
+			 * @last is the completion that ended the outage and
+			 * @stall_since the one before it started, so the
+			 * difference is the true gap rather than a rounding of
+			 * it to the poll interval.
+			 */
+			outage_ns = last - urb_stream->stall_since;
+			log_recovery = true;
+		}
+	}
+
+	if (log_onset) {
+		dev_warn(&chip->intf0->dev,
+			 "%s URB stream stalled: no completion for %llu ms (%d URBs in flight, substream %s, %s)\n",
+			 type, div_u64(age_ns, NSEC_PER_MSEC),
+			 atomic_read(&urb_stream->urbs_in_flight),
+			 open ? "open" : "idle",
+			 startup ? "startup" : "steady-state");
+		if (startup)
+			dev_dbg(&chip->intf0->dev,
+				"%s stream completed nothing within the %s start grace (%u ms)\n",
+				type,
+				READ_ONCE(chip->warm_start) ? "warm" : "cold", grace_ms);
+	} else if (log_recovery) {
+		dev_warn(&chip->intf0->dev, "%s URB stream recovered after %llu ms\n",
+			 type, div_u64(outage_ns, NSEC_PER_MSEC));
+	}
+
+	if (log_onset && (direction == SNDRV_PCM_STREAM_PLAYBACK || open))
+		jockey3_recover_urb_stream(chip, direction, "watchdog");
+}
+
+/**
+ * jockey3_watchdog_work() - periodic URB liveness check
+ * @work: the chip's watchdog_work
+ *
+ * Every error path in this driver hangs off a URB completion, so a device that
+ * simply stops completing URBs is invisible to all of them: nothing runs, so
+ * nothing is logged. A playback stream in that state does not even produce an
+ * xrun, because the hardware pointer never advances far enough to overtake the
+ * application. This is the only place that can notice such a silence, which is
+ * why it runs for the device's whole lifetime rather than only while a PCM
+ * stream is open -- the URBs do too, since MIDI OUT rides in every playback
+ * packet and there is no idle state in which "no completions" is legitimate.
+ *
+ * Acts as well as detects: jockey3_watchdog_check() calls
+ * jockey3_recover_urb_stream() directly on a new stall onset. This is the
+ * only place recovery can be triggered without a PCM ioctl (prepare)
+ * re-entering the driver first -- necessary because a long-running,
+ * uninterrupted stream never re-enters otherwise, and ALSA core's own
+ * wait_for_avail() (sound/core/pcm_lib.c) times out the open substream with
+ * -EIO on its own schedule regardless of whether this driver ever notices.
+ * jockey3_watchdog_arm()'s cadence tightens while a PCM stream is open, for
+ * exactly this reason.
+ *
+ * Calling into jockey3_recover_urb_stream() from here is safe even though it
+ * calls jockey3_stop_urbs(), which disarms this same work item: the disarm is
+ * the non-sync cancel_delayed_work(), which never blocks and only prevents a
+ * future queueing -- it does not affect the tick that is already running
+ * (this one). The reset jockey3_recover_urb_stream() may queue runs on
+ * system_wq (drivers/usb/core/message.c's usb_queue_reset_device()), not
+ * system_long_wq where this tick runs, so the two cannot serialize behind
+ * each other; and rate_mutex is not held across the wait for that reset
+ * (jockey3_recover_urb_stream() drops it first), which is what lets
+ * jockey3_pre_reset()/jockey3_post_reset() take the mutex themselves and
+ * complete while this tick is blocked waiting.
+ */
+static void jockey3_watchdog_work(struct work_struct *work)
+{
+	struct jockey3_chip *chip = container_of(to_delayed_work(work),
+						 struct jockey3_chip, watchdog_work);
+
+	if (jockey3_is_disconnected(chip))
+		return;
+
+	/*
+	 * A reset stops and restarts the URBs from the USB core's own workqueue.
+	 * Sampling in the middle of that would report a stall that is both
+	 * expected and already being dealt with.
+	 */
+	if (!jockey3_is_resetting(chip)) {
+		jockey3_watchdog_check(chip, SNDRV_PCM_STREAM_PLAYBACK);
+		jockey3_watchdog_check(chip, SNDRV_PCM_STREAM_CAPTURE);
+	}
+
+	jockey3_watchdog_arm(chip);
+}
+
 /*
  * Poll a stream for up to timeout_ms. With @require_healthy false the bar is
  * jockey3_check_urb_stream_alive() -- "something completed just now", enough
@@ -1863,13 +2332,16 @@ static int jockey3_run_recovery_ladder(struct jockey3_chip *chip, const int dire
  * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
  * @context: short description of what found the stall, for the log
  *
- * Called by jockey3_pcm_prepare() once its liveness check has confirmed a
- * stall. A direction found alive at entry returns immediately, so two
- * sequential calls for one stall are cheap.
+ * Shared by jockey3_pcm_prepare()'s liveness check and
+ * jockey3_watchdog_check()'s mid-stream detection. Every call site confirms
+ * the stall first, and a direction found alive at entry returns immediately,
+ * so two sequential calls for one stall are cheap.
  *
  * Concurrent calls need more: two can both pass the alive check before either
  * restarts anything, then run competing stop/start sequences or resets.
  * @chip->recovery_in_progress closes that -- one ladder at a time, chip-wide.
+ * Without it a watchdog tick and a racing jockey3_pcm_prepare() retry collide
+ * and produce -EPROTO on every endpoint, needing a re-enumeration to clear.
  *
  * Ladder: a lightweight URB stop/start, then a full USB reset if that did not
  * take, queued with usb_queue_reset_device() and awaited by
@@ -2399,6 +2871,15 @@ static void jockey3_free_resources(struct jockey3_chip *chip)
 {
 	int i;
 
+	/*
+	 * The last fence on the watchdog. jockey3_disconnect()'s sync cancel is
+	 * not enough on its own: a jockey3_start_urbs() already past its
+	 * DISCONNECTED gate arms the watchdog at its tail, under no mutex that
+	 * would exclude the cancel. Here that cannot happen -- private_free runs
+	 * once the card is closed, so every such caller has returned.
+	 */
+	cancel_delayed_work_sync(&chip->watchdog_work);
+
 	for (i = 0; i < JOCKEY3_N_URBS; i++) {
 		usb_free_urb(chip->playback.urbs[i]);
 		kfree(chip->playback.bufs[i]);
@@ -2713,6 +3194,7 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	chip->playback.n_pkts = JOCKEY3_PLAYBACK_N;
 	chip->capture.n_shift = ilog2(JOCKEY3_CAPTURE_N);
 	chip->capture.n_pkts = JOCKEY3_CAPTURE_N;
+	INIT_DELAYED_WORK(&chip->watchdog_work, jockey3_watchdog_work);
 
 	chip->xfer_buf = kmalloc(USB_XFER_BUF_SIZE, GFP_KERNEL);
 	if (!chip->xfer_buf) {
@@ -2759,11 +3241,12 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 
 err_free_card:
 	/*
-	 * Same order as jockey3_disconnect(): latch DISCONNECTED, kill the URBs,
-	 * and only then let go of interface 1 and the card. All of it is safe on
-	 * a half-built chip -- the locks and anchors are initialized above with
-	 * no failure point between, and everything jockey3_free_resources()
-	 * touches is NULL until it is allocated.
+	 * Same order as jockey3_disconnect(): latch DISCONNECTED so a watchdog
+	 * tick cannot re-arm itself, wait for any tick already running, kill the
+	 * URBs, and only then let go of interface 1 and the card. All of it is
+	 * safe on a half-built chip -- the locks, anchors and work item are
+	 * initialized above with no failure point between, and everything
+	 * jockey3_free_resources() touches is NULL until it is allocated.
 	 *
 	 * snd_card_free_when_closed() rather than snd_card_free(), as in
 	 * jockey3_disconnect(): snd_card_register() creates the device nodes
@@ -2777,6 +3260,7 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	 */
 	usb_set_intfdata(intf, NULL);
 	set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+	cancel_delayed_work_sync(&chip->watchdog_work);
 	jockey3_stop_urbs(chip);
 	usb_driver_release_interface(&jockey3_driver, intf1);
 	snd_card_free_when_closed(card);
@@ -2818,6 +3302,15 @@ static void jockey3_disconnect(struct usb_interface *intf)
 		 */
 		complete_all(&chip->reset_done);
 
+		/*
+		 * Sync here, unlike in jockey3_stop_urbs(): no mutex is held on
+		 * this path, and a tick that is mid-flight must be finished with
+		 * the chip before the card is torn down. DISCONNECTED is already
+		 * set above, so a tick that started just before this will not
+		 * requeue itself.
+		 */
+		cancel_delayed_work_sync(&chip->watchdog_work);
+
 		jockey3_stop_urbs(chip);
 
 		/*
-- 
2.47.3

