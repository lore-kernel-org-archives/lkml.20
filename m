Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431991;
	b=pAnAKUDskWVtCeyP3PmdAyP/ZSjSzH7hag7n0eW4NK8OFsZql2kwBhWwkTrLRZ0R2B8c
	 EIPtgtk/S1Gl6l+bPTwKXD0HIYuqKnPWBl/mV9x/eXjoPpzKRB3FxCDoK85APUByMIdoV
	 6aumRTwSB0oxg/x/wq2nVwheFRI7uV/kFuib4fK2xbi6Knl8/UQuT5T6RacfDpb8cZj+z
	 W6lwAE6AWvlnK6ttbHzE1p4bbHKVlCQxYHrKTsPLWvxtUJee44N7cA7VMzR3Ad1YXWHiz
	 Naiohtgjv4Vowi+4x7IQH7RjYWJyYV2nX0XwT1Q4l2/1YjSawrAlLYlhpblvcATjd8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=96LjUeoMd3c5KrbAF/q5p8SlH99ghbv42doGPt8cBZQ=;
	b=romvcmPqRqEjptHW89ue1swMViYF/Mo9rgXiggz9kM8c2WLfcBiUOBHzJtd8ggmOgxnU
	 2qJbbEvvAw1j0jqkDeeRbAurSLL9XkeiB6+s7xEzMLAKktCy+zE99HVFAE/SNwZNLbA1z
	 6A4Fa3owhA4C7DVEqzwRbmhiLD/MXBL+73ZU6c3lPjW85ZleFVNNpVvMJCOmYGFXkNOsg
	 OWm8momoU36HUS0ygmBk5pSDE5rb422n/iDWrZ3crtqknwVl3MVypGdTNJkT3YQFjDZVp
	 RzrEpu4pzqPIiw80R4++D7MLzwoiP8rHEt+tvdMgz1E1DPah/cWB0w2lhnEnelj1sjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I49lSzTh;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6132F60A2612
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6132F60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I49lSzTh
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso598831137.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431989; x=1793036789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96LjUeoMd3c5KrbAF/q5p8SlH99ghbv42doGPt8cBZQ=;
        b=I49lSzThQ2Jo7OHyxYe7ocad4GbGdgOMWqrfe/IW18F6NpwS2f/guc5oWZ48BtLCni
         D/4NS9Ofku5WvI14329dDALDIveKqQ1T12mvTBo/no2FQd06nhiYQpNiSuICPSA7EC65
         Est5d2P4wGacNjkCxo4VUJ2YMO/Onetc/eemsYgo0MnfJsHR9nTzipOzLl7SbrlxCNUY
         gaOB6UeRvj0+URDV5lI3rIs+UmqhRuUF+SAK5x4vdOMNfM7JBEd1LUY1m77L36PY14Kd
         ZeYXHILAV3M0WpXkOqaQUI0OfNjBc47DSUiPRdBwZEbWK9uH0aB7Osltn6IWMFzzAhel
         T9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431989; x=1793036789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96LjUeoMd3c5KrbAF/q5p8SlH99ghbv42doGPt8cBZQ=;
        b=g8kF0HdpUxL0nWF3kVTmYyVC0oDXsaE5kTNwrhff7yZMlG7+6nc0G8IXfXwXifJcsS
         IFTDKbRKTzTlWumd1yqhFx4Vy6m3Ep0Tfw+KrHWcg8SmHE/QMgdk/k/HkpsuOb+4nYTK
         7cvW+bhtmVa4aohq9+WffXj7PIXJcjVfCdXhF8IJEJ79TxC/FUQ0uUC6UX9xsExRUPk6
         9DH74wIRSBXFYcNct/rspjlnI/U3owvBwA/ztooxOVb9kbgTe7IP6r075cvgZEf8lS1W
         O7nUJo1Avahve/ZXavaNvLPKoWfnD3QO9VDvSQAGV5GYURpXGiU1//63QM96+s9Hn47K
         lVMQ==
X-Forwarded-Encrypted: i=1; AKwUvByOLUykGpNiw17YqGOwfBhcESyQqiksgC11SNa10d5gp+PHjPzgUeSb9/aP3MVApI4WPRI6xF1ScXMJm24=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKxMx2CWCEtzd+AImC35rKQsbFpUOorQRQI9XVV+JtgEr+jZSl
	XMtkbreBmO1n03GJjhPGQTkCSzXhXvBmce+VXbXMQkZLUpxzByLyPVog5Faoyczq
X-Gm-Gg: AYBFou2UeEKWsS24NEwHDdSaSqC/BISarky/9z6gyZb3zw3LjLteK8sXlesHxTsutqK
	CqCnY69Nz+VwN98FK4v5k7MsCXmpMVepT2bB2sL+0xw4P0obgI/pW8qWsUBBYpa5QY55s2vQ4Hl
	84AVK9Kc4WAyY4DIJetPhcIS3H9HsKJVO65Tt8zTdadwYP6qamCkmqIlk9aHKEFu2ctLcu2TB8R
	FoqTYsR6FFQh5dBJ73jXRjxYpKVPkCAkhwRdtL9+trvZRjcGCAmiAaLQ4/NT+74+n4U3C9w0ciW
	Cvu9RL27gsZQT7WLF989NW4W9FJSud3QFjVPERkYeVeK3GBym8/JUDqLKK1s2cf+YElptV+vVq5
	+sDINsG53OU4VKhtwo637cE1b02Vjx/3VEcjwpSKi7LlJW0fbEenghK9ynGwAqyYx0coXJ/WBmW
	MkaaRJg1IESaLXwwz1X5Kzr0IzOa6fcwEtkLmmmQ6+jizFrZVpcB19NhbgDz+/dIT4JPCY8VUX8
	BX36ZBNKiC4WrtP9UFTnEf8fZyRmt963LztaXpFCKWeJcN48OAVwZG/ONsYs3ooKjaBtTAyqo5H
	7zTFfNUmHCMSZmUGaP5OgBXxCf9gu6E=
X-Received: by 2002:a05:6102:80a5:b0:7cc:26a8:e731 with SMTP id ada2fe7eead31-7cc36a7e662mr1965926137.29.1792431988767;
        Mon, 19 Oct 2026 10:46:28 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:28 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/13] ALSA: jockey3: Recover a stalled stream
Date: Mon, 19 Oct 2026 13:44:40 -0400
Message-ID: <20261019174445.1931263-9-fvdpol@gmail.com>
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

The device does not always start streaming on an endpoint when asked
to. Detect a direction that completes no URBs and bring it back.

.prepare checks that the stream it is about to use is alive. If it is
not, jockey3_recover_urb_stream() climbs a ladder:

 1. Stop and restart the URB rings, then wait up to start_grace_ms for
    the direction to stream at a plausible cadence. A few completions in
    quick succession do not count: that is a FIFO draining, not audio.
 2. If that fails, reset the device and wait for it to come back.

The reset is queued with usb_queue_reset_device() and awaited, never
called directly. A failed reset unbinds the driver, and that must not
happen in the thread that is inside an ioctl on the card being torn
down.

Resets are limited to three per minute for the whole device, so a
device that keeps stalling is not reset in a loop. Only one ladder runs
at a time, since both directions share the restart.

pre_reset() and post_reset() stop the streams and bring the device back
up, which also covers a reset started from outside the driver.

rate_mutex is added here as the outermost lock. It serializes the
stop/program/start sequences. The name anticipates rate switching, which
is the other user and comes in a later patch. The "Locking" comment now
shows the hierarchy.

Once it is committed to a restart, the ladder reports an xrun on both
directions. The restart is shared, so a running sibling of the stream
being prepared loses its place as well. A stream must not start
after that report and ride the rest of the ladder untold, so .prepare
waits for a ladder that is in flight to finish.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/jockey3.c | 958 +++++++++++++++++++++++++++++++++++-
 1 file changed, 932 insertions(+), 26 deletions(-)

diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index 74fe5676273d2..45365103510db 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -16,8 +16,11 @@
 #include <linux/jiffies.h>
 #include <linux/bitops.h>
 #include <linux/log2.h>
+#include <linux/timekeeping.h>
+#include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/wait.h>
+#include <linux/wait_bit.h>
 #include <linux/cleanup.h>
 #include <sound/core.h>
 #include <sound/initval.h>
@@ -106,14 +109,15 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *
  * - jockey3_disconnect() does everything that must happen while the device is
  *   still there: latch JOCKEY3_FLAG_DISCONNECTED (for either interface, since
- *   the core takes them down one at a time), kill the URBs, release
- *   interface 1, and hand the card to snd_card_free_when_closed().
+ *   the core takes them down one at a time), release anyone waiting on a
+ *   reset, kill the URBs, release interface 1, and hand the card to
+ *   snd_card_free_when_closed().
  *
  * - jockey3_card_free(), reached through card->private_free once the last file
- *   descriptor is closed, frees the buffers and URBs and gives the card slot
- *   back. It runs arbitrarily long after the disconnect and must attempt no
- *   USB operation, though the objects themselves stay referenced until it
- *   returns; see jockey3_free_resources().
+ *   descriptor is closed, frees the buffers and URBs, destroys rate_mutex and
+ *   gives the card slot back. It runs arbitrarily long after the disconnect
+ *   and must attempt no USB operation, though the objects themselves stay
+ *   referenced until it returns; see jockey3_free_resources().
  *
  * struct jockey3_chip lives in card->private_data, so it is freed with the
  * card and outlives the USB binding -- which is what makes it safe for an ALSA
@@ -129,9 +133,16 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
 /**
  * DOC: Locking
  *
- * There are three locks, all IRQ-safe leaf spinlocks: playback.lock,
- * capture.lock and midi_lock. They are never nested inside one another;
- * anything that needs more than one takes them in sequence, not nested.
+ * The lock hierarchy is::
+ *
+ *     rate_mutex                     process context only, outermost
+ *       |- playback.lock             IRQ-safe leaf
+ *       |- capture.lock              IRQ-safe leaf
+ *       `- midi_lock                 IRQ-safe leaf
+ *
+ * The three leaf spinlocks are never nested inside one another; anything that
+ * needs more than one takes them in sequence, not nested. rate_mutex is never
+ * taken from atomic context.
  *
  * Against the ALSA core the order is::
  *
@@ -178,9 +189,76 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
 #define JOCKEY3_PLAYBACK_XFER_SIZE	(JOCKEY3_PLAYBACK_N * PLOYTEC_PKT_SIZE)
 #define JOCKEY3_CAPTURE_XFER_SIZE	(JOCKEY3_CAPTURE_N * PLOYTEC_PKT_SIZE)
 
+/*
+ * jockey3_check_urb_stream_alive()'s liveness window, per direction, scaled
+ * by that direction's own live N (struct jockey3_pcm_urb_stream's @n_shift):
+ * the worst-case URB span scales linearly with N (N packet intervals instead
+ * of one), so scaling the window the same way keeps the same margin against
+ * it at any N instead of eating into a fixed margin as N grows. N is always a
+ * power of two (jockey3_pcm_hw_params() only ever derives one), so this is a
+ * shift rather than a multiply.
+ */
+#define JOCKEY3_LIVENESS_WINDOW_NS(shift)	((u64)NSEC_PER_MSEC << (shift))
+
 /* Consecutive URB transport errors tolerated before a direction is given up on */
 #define JOCKEY3_MAX_URB_ERRORS 8
 
+/*
+ * Bounds and evidence thresholds for the "has this direction reached steady
+ * streaming yet" checks that run over the window from jockey3_start_urbs()
+ * until the device is proven alive. The grace duration itself is the
+ * runtime-tunable start_grace_ms (see its comment near the top of the file);
+ * these clamp a bad write and gate what counts as real streaming.
+ *
+ * JOCKEY3_HEALTHY_MIN_COMPLETIONS feeds jockey3_stream_streaming_healthy(), the
+ * stricter "did the warm restart actually take" test: a real stream lands
+ * hundreds of completions inside any plausible grace, so requiring a handful,
+ * spread over at least half the time that many URBs need and still arriving,
+ * rejects a trickle of implausibly fast FIFO-drain completions without
+ * rejecting a healthy resume. See that function.
+ */
+#define JOCKEY3_GRACE_MS_MIN		50
+#define JOCKEY3_GRACE_MS_MAX		5000
+#define JOCKEY3_HEALTHY_MIN_COMPLETIONS	4
+
+/*
+ * Bounded-retry budget for jockey3_recover_urb_stream(), chip-wide because the
+ * remedy it escalates to (a full usb_reset_device()) is shared by both
+ * directions -- a per-direction counter would double the effective rate for
+ * no reason. A window re-opens (and the counter resets) the first time the
+ * budget is consulted after JOCKEY3_RECOVERY_WINDOW_MS has passed since the
+ * current one started, so a chip that stops stalling is never left refusing
+ * to recover for the rest of its life.
+ */
+#define JOCKEY3_RECOVERY_MAX_ATTEMPTS	3
+#define JOCKEY3_RECOVERY_WINDOW_MS	60000
+
+/*
+ * Grace period for a PCM direction to reach steady streaming after its URB
+ * ring is (re)started, in milliseconds. Sized well above the worst measured
+ * restart latency rather than tuned close to it: the error cost is
+ * asymmetric, since too long only delays an escalation that was coming
+ * anyway, while too short kills a stream that was merely late.
+ *
+ * Writable at runtime (0644) and read through jockey3_start_grace_ms(),
+ * which clamps to [JOCKEY3_GRACE_MS_MIN, JOCKEY3_GRACE_MS_MAX] so a bad write
+ * cannot drive the grace to an unusable value.
+ */
+static int start_grace_ms = 200;
+module_param(start_grace_ms, int, 0644);
+MODULE_PARM_DESC(start_grace_ms, "Grace (ms) for PCM to reach steady streaming after its URB ring is (re)started.");
+
+/*
+ * Current start-grace budget in ms, clamped so a runtime write cannot drive
+ * it to an unusable value.
+ */
+static unsigned int jockey3_start_grace_ms(void)
+{
+	int ms = READ_ONCE(start_grace_ms);
+
+	return clamp(ms, JOCKEY3_GRACE_MS_MIN, JOCKEY3_GRACE_MS_MAX);
+}
+
 /**
  * struct jockey3_pcm_urb_stream - per-direction PCM streaming state
  * @substream: the open ALSA substream, or NULL; @lock
@@ -189,6 +267,21 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * @bufs: transfer buffer for each URB, allocated at the maximum N; @n_pkts,
  *	not this width, governs how many bytes an URB actually transfers
  * @urbs_in_flight: number of submitted URBs; diagnostic, must reach 0 after a stop
+ * @last_callback_time: ktime of the last completion, for stall detection. Zeroed
+ *	by jockey3_stop_urbs() so a stopped stream is not reported as alive.
+ * @first_callback_time: ktime of the first completion since the last
+ *	jockey3_start_urbs(); zeroed there and by jockey3_stop_urbs(). With
+ *	@completions_since_start it lets jockey3_stream_streaming_healthy()
+ *	judge cadence, not just recency: the device can retire a URB
+ *	microseconds after submit, which is a FIFO draining rather than audio.
+ *	Set lock-free from the completion handler.
+ * @completions_since_start: count of completions since the last
+ *	jockey3_start_urbs(); zeroed there and by jockey3_stop_urbs(). atomic_t,
+ *	incremented lock-free from the completion handler.
+ * @urbs_started_time: ktime at which jockey3_start_urbs() submitted this
+ *	direction's ring; zeroed by jockey3_stop_urbs().
+ *	jockey3_wait_urb_stream_started() measures the confirmation latency
+ *	from here.
  * @lock: protects the fields marked "@lock" below; IRQ-safe leaf
  * @dma_off: byte offset into runtime->dma_area, i.e. the hardware pointer; @lock
  * @period_off: bytes accumulated towards the current period; @lock
@@ -208,7 +301,7 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * @n_shift: log2 of the Ploytec packets per URB ("N") the next resubmission
  *	will carry, in [0, 3]; @lock. Set by jockey3_pcm_hw_params() from the
  *	period size and reset to the default by jockey3_pcm_close(), so an idle
- *	direction never runs at a stale N. Changing it does not tear the ring
+ *	direction never re-arms at a stale N. Changing it does not tear the ring
  *	down -- the wire cannot tell one N x 512 B transfer from N separate ones
  *	-- so each URB picks up the value at its next resubmission.
  * @n_pkts: 1 << @n_shift, mirrored for loop bounds; @lock
@@ -219,6 +312,10 @@ struct jockey3_pcm_urb_stream {
 	struct urb *urbs[JOCKEY3_N_URBS];
 	unsigned char *bufs[JOCKEY3_N_URBS];
 	atomic_t urbs_in_flight;
+	atomic64_t last_callback_time;
+	atomic64_t first_callback_time;
+	atomic_t completions_since_start;
+	atomic64_t urbs_started_time;
 	spinlock_t lock;	/* protects this stream's state; IRQ-safe leaf */
 	unsigned int dma_off;
 	unsigned int period_off;
@@ -242,8 +339,38 @@ struct jockey3_pcm_urb_stream {
  * @intf1: interface 1, claimed explicitly because it owns EP 0x86
  * @pcm: the PCM device; read-only after probe
  * @xfer_buf: bounce buffer for EP0 control transfers, USB_XFER_BUF_SIZE bytes.
+ *	Serialized by @rate_mutex once the card is live. The one exception is
+ *	jockey3_initialize(), which runs from probe before the card is
+ *	registered, so it is the only user in existence.
+ * @rate_mutex: serializes the URB stop/start sequences and the EP0 programming
+ *	that goes with them; process context only, outermost lock
  * @flags: JOCKEY3_FLAG_* bits, atomic bitops
+ * @current_rate: sample rate the hardware is programmed to; @rate_mutex
  * @dev_idx: card slot held in jockey3_devices_used
+ * @reset_done: completed by jockey3_post_reset(), and by jockey3_disconnect()
+ *	so a waiter is released when the USB core skips post_reset() entirely.
+ *	Re-armed by jockey3_queue_reset() for a reset this driver starts, and by
+ *	jockey3_pre_reset() for one started anywhere else.
+ * @recovery_attempts: resets taken from the current window by
+ *	jockey3_recovery_budget_take(); not mutex-protected, since
+ *	jockey3_pcm_prepare()'s liveness check and recovery run outside
+ *	@rate_mutex by design. The two-atomic race with @recovery_window_start is
+ *	benign: the worst case is a handful of extra resets in one window, not a
+ *	stuck or negative budget.
+ * @recovery_window_start: ktime the current budget window opened; 0 before
+ *	the first attempt. See JOCKEY3_RECOVERY_WINDOW_MS.
+ * @recovery_in_progress: one jockey3_recover_urb_stream() ladder running at a
+ *	time, chip-wide rather than per-direction for the same reason
+ *	@recovery_attempts is chip-wide: jockey3_stop_urbs()/jockey3_start_urbs()
+ *	restart the shared ring for both directions together, so a Playback
+ *	recovery and a concurrent Capture recovery -- e.g. two racing
+ *	jockey3_pcm_prepare() calls -- would step on each other's
+ *	stop/start (or reset) sequence rather than being independent. A second
+ *	caller finding this already set declines immediately rather than racing
+ *	the first; the first caller's restart brings back whichever direction
+ *	the second one wanted too. Test-and-set via atomic_cmpxchg() rather than
+ *	a mutex held across the whole ladder, since jockey3_check_urb_stream_alive()
+ *	callers elsewhere poll rather than block on recovery finishing.
  * @midi_in_urb: the single MIDI IN URB; not anchored, killed directly
  * @midi_in_buf: transfer buffer for @midi_in_urb
  * @midi_lock: protects the MIDI fields; IRQ-safe leaf
@@ -259,8 +386,14 @@ struct jockey3_chip {
 	struct usb_interface *intf1;
 	struct snd_pcm *pcm;
 	unsigned char *xfer_buf;
+	struct mutex rate_mutex;	/* serializes URB stop/start; outermost lock */
 	unsigned long flags;
+	unsigned int current_rate;
 	unsigned int dev_idx;
+	struct completion reset_done;
+	atomic_t recovery_attempts;
+	atomic64_t recovery_window_start;
+	atomic_t recovery_in_progress;
 
 	/* MIDI Path */
 	struct urb *midi_in_urb;
@@ -318,12 +451,104 @@ static void jockey3_release_slot(unsigned int dev_idx)
 
 /* Chip flags */
 #define JOCKEY3_FLAG_DISCONNECTED	0
+#define JOCKEY3_FLAG_RESETTING		1
 
 static inline bool jockey3_is_disconnected(const struct jockey3_chip *chip)
 {
 	return test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
 }
 
+static inline bool jockey3_is_resetting(const struct jockey3_chip *chip)
+{
+	return test_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+}
+
+static void jockey3_set_current_rate(struct jockey3_chip *chip, unsigned int rate)
+{
+	lockdep_assert_held(&chip->rate_mutex);
+
+	chip->current_rate = rate;
+}
+
+/*
+ * Bounded, synchronous wait for a device reset queued via
+ * usb_queue_reset_device() to complete. chip->reset_done is completed by
+ * jockey3_post_reset(), and also by jockey3_disconnect() so that a waiter is
+ * released when the USB core skips post_reset() entirely (a failed reset marks
+ * the interface for rebinding and unbinds it instead).
+ *
+ * Deliberately does NOT call usb_reset_device() itself. A failed or aborted
+ * reset marks the interface for rebinding and unbinds it, so the call would
+ * run jockey3_disconnect() -- and the card teardown behind it -- in the very
+ * thread that is still executing an ioctl on one of that card's file
+ * descriptors. Queuing the reset instead lets the disconnect run on the USB
+ * core's own workqueue, where the ALSA core's own refcounting keeps the
+ * substream alive until this ioctl returns and userspace closes it.
+ *
+ * Until the card was switched from snd_devm_card_new() to
+ * snd_card_free_when_closed() this was worse still: the teardown blocked in
+ * snd_card_free() waiting for that same file descriptor to be closed, which
+ * could never happen. That specific self-deadlock is gone, but reaching a
+ * disconnect from inside an ioctl on the disconnecting card remains something
+ * to keep out of this driver's calling threads.
+ */
+static int jockey3_wait_for_reset_completion(struct jockey3_chip *chip)
+{
+	/*
+	 * Empirical testing shows that the reset cycle typically takes around
+	 * 334 ms; a 1000 ms timeout gives sufficient headroom.
+	 */
+	if (!jockey3_is_resetting(chip))
+		return 0;
+
+	dev_dbg(&chip->intf0->dev, "Waiting for reset completion\n");
+
+	if (!wait_for_completion_timeout(&chip->reset_done, msecs_to_jiffies(1000))) {
+		dev_warn(&chip->intf0->dev, "Timeout waiting for reset completion\n");
+		return -EAGAIN;
+	}
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	return 0;
+}
+
+/*
+ * Queue a full USB reset and arm chip->reset_done for a waiter. Does not
+ * wait; pair with jockey3_wait_for_reset_completion() for that.
+ */
+static void jockey3_queue_reset(struct jockey3_chip *chip)
+{
+	reinit_completion(&chip->reset_done);
+	set_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+	usb_queue_reset_device(chip->intf0);
+}
+
+/*
+ * Chip-wide bounded-retry budget consulted by jockey3_recover_urb_stream()
+ * before it escalates to a full USB reset. Returns true if the caller may go
+ * ahead. A window older than JOCKEY3_RECOVERY_WINDOW_MS (or none opened yet)
+ * is replaced with a fresh one, so a chip that stops stalling is never left
+ * permanently refusing to recover; within a live window, up to
+ * JOCKEY3_RECOVERY_MAX_ATTEMPTS resets are allowed before further attempts
+ * are declined and reported instead.
+ */
+static bool jockey3_recovery_budget_take(struct jockey3_chip *chip)
+{
+	u64 now = ktime_get_mono_fast_ns();
+	u64 window_start = atomic64_read(&chip->recovery_window_start);
+
+	if (!window_start ||
+	    now - window_start > (u64)JOCKEY3_RECOVERY_WINDOW_MS * NSEC_PER_MSEC) {
+		atomic64_set(&chip->recovery_window_start, now);
+		atomic_set(&chip->recovery_attempts, 1);
+		return true;
+	}
+
+	return atomic_inc_return(&chip->recovery_attempts) <= JOCKEY3_RECOVERY_MAX_ATTEMPTS;
+}
+
 static inline struct jockey3_pcm_urb_stream *jockey3_get_pcm_urb_stream(struct jockey3_chip *chip,
 									const int direction)
 {
@@ -482,7 +707,7 @@ static inline enum jockey3_urb_state jockey3_urb_check(const struct urb *urb)
 static void jockey3_warn_unexpected_stop(struct jockey3_chip *chip, bool stopping,
 					 int status, const char *type)
 {
-	if (stopping || jockey3_is_disconnected(chip))
+	if (stopping || jockey3_is_disconnected(chip) || jockey3_is_resetting(chip))
 		return;
 
 	if (chip->dev->state == USB_STATE_NOTATTACHED)
@@ -574,7 +799,8 @@ static void jockey3_resubmit_failed(struct jockey3_chip *chip, int err, const ch
  * These are frequently transient -- marginal cabling and some host controllers
  * produce them routinely -- so a single one must not disable the card. Keep
  * resubmitting while the consecutive count stays below JOCKEY3_MAX_URB_ERRORS;
- * beyond that, stop feeding this direction.
+ * beyond that, stop feeding this direction and leave recovery to the next
+ * .prepare, which already carries the stall detection and reset path.
  *
  * Return: true if the caller should give up and not resubmit.
  */
@@ -619,6 +845,26 @@ static bool jockey3_urb_error_give_up(struct jockey3_chip *chip,
 	return true;
 }
 
+/*
+ * Record one URB completion for the liveness and cadence checks. The device can
+ * retire a URB microseconds after submit -- a hardware-side FIFO draining rather
+ * than audio actually clocked onto or off the wire -- so
+ * jockey3_stream_streaming_healthy() needs the first completion's time and the
+ * running count, not just the last time, to tell real flow from that trickle.
+ * Lock-free; called at the top of each completion handler. If two completions
+ * race, exactly one sees the count go 1->1 and stamps @first_callback_time; a
+ * transient @last_callback_time < @first_callback_time is harmless, the health
+ * check rejects it and is re-polled.
+ */
+static void jockey3_note_completion(struct jockey3_pcm_urb_stream *urb_stream)
+{
+	u64 now = ktime_get_mono_fast_ns();
+
+	atomic64_set(&urb_stream->last_callback_time, now);
+	if (atomic_inc_return(&urb_stream->completions_since_start) == 1)
+		atomic64_set(&urb_stream->first_callback_time, now);
+}
+
 static void jockey3_capture_callback(struct urb *urb)
 {
 	struct jockey3_chip *chip = urb->context;
@@ -632,6 +878,7 @@ static void jockey3_capture_callback(struct urb *urb)
 	int sp, ret;
 
 	atomic_dec(&urb_stream->urbs_in_flight);
+	jockey3_note_completion(urb_stream);
 
 	switch (jockey3_urb_check(urb)) {
 	case JOCKEY3_URB_STOPPED:
@@ -779,6 +1026,7 @@ static void jockey3_playback_callback(struct urb *urb)
 	int i, sp, ret;
 
 	atomic_dec(&urb_stream->urbs_in_flight);
+	jockey3_note_completion(urb_stream);
 
 	switch (jockey3_urb_check(urb)) {
 	case JOCKEY3_URB_STOPPED:
@@ -979,6 +1227,21 @@ static void jockey3_stop_urbs(struct jockey3_chip *chip)
 	usb_kill_anchored_urbs(&chip->playback.anchor);
 	usb_kill_anchored_urbs(&chip->capture.anchor);
 
+	/*
+	 * Drop the liveness timestamps: a stale value would otherwise make
+	 * jockey3_check_urb_stream_alive() report a stopped stream as alive for
+	 * up to its 1 ms window. The cadence counters go with them so the next
+	 * start's jockey3_stream_streaming_healthy() sees only its own completions.
+	 */
+	atomic64_set(&chip->playback.last_callback_time, 0);
+	atomic64_set(&chip->capture.last_callback_time, 0);
+	atomic64_set(&chip->playback.first_callback_time, 0);
+	atomic64_set(&chip->capture.first_callback_time, 0);
+	atomic_set(&chip->playback.completions_since_start, 0);
+	atomic_set(&chip->capture.completions_since_start, 0);
+	atomic64_set(&chip->playback.urbs_started_time, 0);
+	atomic64_set(&chip->capture.urbs_started_time, 0);
+
 	/* after killing the URBs there will be no in-flight requests anymore since the callback
 	 * function has been called as part of the shutdown. The number of in-flight URBs should
 	 * therefore be zero at this point. Log an inconsistency error if not.
@@ -992,7 +1255,8 @@ static void jockey3_stop_urbs(struct jockey3_chip *chip)
 }
 
 /*
- * Demote an unplug. -%ENOENT stays loud: the endpoints were disabled while the
+ * Demote an unplug, as jockey3_start_urbs_failed() already does for the
+ * aggregate result. -%ENOENT stays loud: the endpoints were disabled while the
  * driver is still bound, which takes a device reset to undo.
  *
  * @slot is the ring slot, or -1 for the single MIDI IN URB.
@@ -1021,6 +1285,10 @@ static void jockey3_submit_failed(struct jockey3_chip *chip, int err,
 /**
  * jockey3_start_urbs() - submit all PCM and MIDI URBs
  * @chip: driver state
+ * @warm: true only for the recovery ladder's lightweight restart of a ring
+ *	that was streaming a moment earlier; false for a cold start (first open,
+ *	USB reset, probe). Both share start_grace_ms; this
+ *	only labels the restart for dev_dbg().
  *
  * Clears the stop fences and error budgets, then submits the full URB ring for
  * both directions plus the MIDI IN URB. Uses GFP_KERNEL, so process context
@@ -1029,11 +1297,12 @@ static void jockey3_submit_failed(struct jockey3_chip *chip, int err,
  * The return value must be checked. Only a completion handler resubmits a URB,
  * so a ring that comes up short stays short: nothing retries the URBs that
  * failed here, and the direction runs at reduced depth for as long as the
- * device stays bound, with no bookkeeping that would ever notice.
+ * device stays bound, with no bookkeeping that would ever notice. Callers pass
+ * the result to jockey3_start_urbs_failed(), or return it to their own caller.
  *
  * Return: 0 on success, or the first submit error encountered.
  */
-static int jockey3_start_urbs(struct jockey3_chip *chip)
+static int jockey3_start_urbs(struct jockey3_chip *chip, bool warm)
 {
 	int i, ret, first_err = 0;
 	int n_playback = 0, n_capture = 0;
@@ -1042,7 +1311,8 @@ static int jockey3_start_urbs(struct jockey3_chip *chip)
 	if (jockey3_is_disconnected(chip))
 		return -ENODEV;
 
-	dev_dbg(&chip->intf0->dev, "Starting all URBs\n");
+	dev_dbg(&chip->intf0->dev, "Starting all URBs (%s start, grace %u ms)\n",
+		warm ? "warm" : "cold", jockey3_start_grace_ms());
 
 	/*
 	 * Clear the error budget as well: a stream that was given up on must get
@@ -1064,8 +1334,24 @@ static int jockey3_start_urbs(struct jockey3_chip *chip)
 	}
 
 	/*
-	 * Each direction's ring is armed at its own current N, which at probe is
-	 * the JOCKEY3_PLAYBACK_N/JOCKEY3_CAPTURE_N default.
+	 * Stamp the start before submitting, not after: a URB can complete
+	 * before the loop below has finished. Reset the cadence counters in the
+	 * same breath.
+	 */
+	atomic64_set(&chip->playback.first_callback_time, 0);
+	atomic64_set(&chip->capture.first_callback_time, 0);
+	atomic_set(&chip->playback.completions_since_start, 0);
+	atomic_set(&chip->capture.completions_since_start, 0);
+	atomic64_set(&chip->playback.urbs_started_time, ktime_get_mono_fast_ns());
+	atomic64_set(&chip->capture.urbs_started_time, ktime_get_mono_fast_ns());
+
+	/*
+	 * Each direction's ring is (re)armed at its own current N
+	 * (jockey3_pcm_hw_params()), which persists across a restart rather than
+	 * falling back to the JOCKEY3_PLAYBACK_N/JOCKEY3_CAPTURE_N default just
+	 * because the ring turned over. A direction with no open stream is held
+	 * at that default by jockey3_pcm_close(), so it always re-arms at a
+	 * safe N.
 	 *
 	 * Both are read once here rather than per iteration: they are written
 	 * under the stream lock, which is not held here, so a re-load could
@@ -1127,9 +1413,57 @@ static int jockey3_start_urbs(struct jockey3_chip *chip)
 	return first_err;
 }
 
+/**
+ * jockey3_start_urbs_failed() - react to a failed jockey3_start_urbs()
+ * @chip: driver state
+ * @err: the value jockey3_start_urbs() returned; 0 is ignored
+ * @context: what was being attempted, for the log message
+ *
+ * Classifies a submit failure so that a condition needing a device reset is not
+ * mistaken for an ordinary unplug:
+ *
+ * - %-ENOENT means the endpoint is administratively gone while the driver is
+ *   still bound. usb_submit_urb() reports it when usb_pipe_endpoint() finds no
+ *   endpoint, and usb_hcd_link_urb_to_ep() when the endpoint is not enabled --
+ *   which is the state usb_set_interface() leaves interface 0 in when its
+ *   SET_INTERFACE request fails, since it disables the endpoints before sending
+ *   the request and does not re-enable them on that path. Nothing short of
+ *   re-enumerating the device restores it.
+ *
+ * - %-ENODEV means the device is already detached, so a reset would be
+ *   pointless and jockey3_disconnect() is on its way. This is the common case
+ *   on an ordinary unplug and must not be treated like the one above.
+ *
+ * - anything else is reported and left alone.
+ *
+ * Note that trying to undo the failure by selecting the working altsetting
+ * again does not work: if the control endpoint is unresponsive, that request
+ * times out as well and the endpoints stay disabled regardless.
+ */
+static void jockey3_start_urbs_failed(struct jockey3_chip *chip, int err, const char *context)
+{
+	if (!err)
+		return;
+
+	if (err == -ENODEV || jockey3_is_disconnected(chip)) {
+		dev_dbg(&chip->intf0->dev, "Could not start URBs after %s: device is gone\n",
+			context);
+		return;
+	}
+
+	if (err == -ENOENT) {
+		dev_err(&chip->intf0->dev,
+			"Endpoints are disabled after %s; the device needs a reset to restore them\n",
+			context);
+		return;
+	}
+
+	dev_err(&chip->intf0->dev, "Failed to start URBs after %s: %d\n", context, err);
+}
+
 /*
- * Log a failed rate-programming step at the severity it deserves: an unplug
- * is not an error.
+ * Log a failed rate-change step at the severity it deserves, matching what
+ * jockey3_start_urbs_failed() applies on the URB path.
  */
 static void jockey3_rate_step_failed(struct jockey3_chip *chip, int err, const char *what)
 {
@@ -1189,6 +1523,401 @@ static int jockey3_set_rate(struct jockey3_chip *chip, unsigned int rate, bool c
 	return 0;
 }
 
+static bool jockey3_check_urb_stream_alive(const struct jockey3_pcm_urb_stream *urb_stream)
+{
+	u64 last_time = atomic64_read(&urb_stream->last_callback_time);
+	u64 window_ns = JOCKEY3_LIVENESS_WINDOW_NS(READ_ONCE(urb_stream->n_shift));
+
+	if (!last_time)
+		return false;
+
+	/*
+	 * Alive if we had activity within the last window_ns. The window
+	 * must exceed one URB span (@n_pkts packet intervals) or a
+	 * perfectly healthy stream could sample as dead between completions
+	 * -- and scaling it with N (see JOCKEY3_LIVENESS_WINDOW_NS()) keeps
+	 * the same margin against that span at any N, rather than a fixed
+	 * window eating into a shrinking margin as N grows.
+	 */
+	return (ktime_get_mono_fast_ns() - last_time <= window_ns);
+}
+
+/*
+ * Shortest wall-clock time one URB's worth of audio can legitimately occupy:
+ * @n_pkts Ploytec packets, PLOYTEC_PLAYBACK_FRAMES (10) or
+ * PLOYTEC_CAPTURE_FRAMES (8) PCM frames each, at @rate. Returns 0 if @rate or
+ * N is not yet known. Completions arriving in a small fraction of this are a
+ * hardware-side FIFO draining or the host controller retiring transfer
+ * descriptors, not the device's audio pipeline running.
+ */
+static u64 jockey3_min_urb_interval_ns(const struct jockey3_pcm_urb_stream *urb_stream,
+				       unsigned int rate, bool is_playback)
+{
+	unsigned int fpp = is_playback ? PLOYTEC_PLAYBACK_FRAMES : PLOYTEC_CAPTURE_FRAMES;
+	unsigned int n = READ_ONCE(urb_stream->n_pkts);
+
+	if (!rate || !n)
+		return 0;
+
+	return div_u64((u64)n * fpp * NSEC_PER_SEC, rate);
+}
+
+/*
+ * jockey3_stream_streaming_healthy() - is this direction actually streaming,
+ * as opposed to having produced a trickle of implausibly fast completions?
+ *
+ * jockey3_check_urb_stream_alive() answers "did anything complete just now",
+ * which a single FIFO-drain completion satisfies. This is the stricter test,
+ * used at the one decision that must not be fooled by trickle: whether the
+ * ladder's warm URB restart worked, or it should escalate to a
+ * full USB reset (a stream-killing event, and on this hardware one that can
+ * leave the capture endpoint down). It requires
+ *
+ *   - at least JOCKEY3_HEALTHY_MIN_COMPLETIONS completions since the last
+ *     start -- more than a FIFO drain supplies, and a real stream lands
+ *     hundreds inside any plausible grace;
+ *   - those spread over at least half the time that many real URBs would take
+ *     (rejects a fast burst);
+ *   - the most recent one still within jockey3_check_urb_stream_alive()'s
+ *     N-scaled liveness window (rejects a burst that then stopped).
+ *
+ * With no programmed rate it cannot form the interval and reports not-healthy
+ * rather than fall back to a weaker test; @current_rate is always set while a
+ * stream is recovering.
+ */
+static bool jockey3_stream_streaming_healthy(struct jockey3_chip *chip,
+					     const struct jockey3_pcm_urb_stream *urb_stream)
+{
+	bool is_playback = urb_stream == &chip->playback;
+	const char *type = is_playback ? "Playback" : "Capture";
+	u64 first = atomic64_read(&urb_stream->first_callback_time);
+	u64 last = atomic64_read(&urb_stream->last_callback_time);
+	int n = atomic_read(&urb_stream->completions_since_start);
+	unsigned int rate = READ_ONCE(chip->current_rate);
+	u64 min_interval, span, floor;
+
+	/* Not enough completions yet to judge -- the common "still warming up"
+	 * state during the poll, kept silent so it does not flood the log.
+	 */
+	if (n < JOCKEY3_HEALTHY_MIN_COMPLETIONS || !first || last <= first)
+		return false;
+
+	min_interval = jockey3_min_urb_interval_ns(urb_stream, rate, is_playback);
+	if (!min_interval) {
+		dev_dbg_ratelimited(&chip->intf0->dev,
+				    "%s health: no programmed rate, cannot judge cadence\n", type);
+		return false;
+	}
+
+	span = last - first;
+	floor = (u64)(n - 1) * (min_interval >> 1);
+	if (span < floor) {
+		dev_dbg_ratelimited(&chip->intf0->dev,
+				    "%s health: %d completions in %llu us spans < %llu us floor -- still trickle\n",
+				    type, n, div_u64(span, NSEC_PER_USEC),
+				    div_u64(floor, NSEC_PER_USEC));
+		return false;
+	}
+
+	if (ktime_get_mono_fast_ns() - last >
+	    JOCKEY3_LIVENESS_WINDOW_NS(READ_ONCE(urb_stream->n_shift))) {
+		dev_dbg_ratelimited(&chip->intf0->dev,
+				    "%s health: cadence plausible but last completion is stale\n",
+				    type);
+		return false;
+	}
+
+	dev_dbg(&chip->intf0->dev,
+		"%s health: streaming -- %d completions, ~%llu us/URB (min %llu us)\n",
+		type, n, div_u64(span, (u64)(n - 1) * NSEC_PER_USEC),
+		div_u64(min_interval, NSEC_PER_USEC));
+	return true;
+}
+
+/*
+ * Poll a stream for up to timeout_ms. With @require_healthy false the bar is
+ * jockey3_check_urb_stream_alive() -- "something completed just now", enough
+ * for the cold-start paths that only ask whether the ring came up. With it
+ * true the bar is jockey3_stream_streaming_healthy(), which a trickle of
+ * FIFO-drain completions cannot clear; used where a false pass would escalate
+ * to a needless USB reset. Always logs a dev_warn on timeout regardless of
+ * whether the caller acts on the result, so stall frequency (Playback and
+ * Capture alike) stays trackable in the field via dmesg.
+ */
+/*
+ * @fresh_start: this wait follows a jockey3_start_urbs() the caller just did, so
+ *	the confirmation latency is reported as the time from that restart to the
+ *	first completion (@urbs_started_time -> @first_callback_time), not from
+ *	when this poll loop happened to begin. The two directions are checked one
+ *	after the other, so measuring from loop entry would credit the whole of
+ *	the first direction's confirmation to the second direction's start time
+ *	and under-report it -- Capture routinely printed "after 0 ms" only
+ *	because Playback had already burned the first several ms. Pass false for a
+ *	bare .prepare() liveness check on an already-running ring, where
+ *	@urbs_started_time is stale and the meaningful number is how long this
+ *	call spent polling.
+ */
+static bool jockey3_wait_urb_stream_started(struct jockey3_chip *chip, const int direction,
+					    const unsigned int timeout_ms, bool require_healthy,
+					    bool fresh_start)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	const char *type = direction == SNDRV_PCM_STREAM_PLAYBACK ? "Playback" : "Capture";
+	u64 since_ns = fresh_start ? atomic64_read(&urb_stream->urbs_started_time) : 0;
+	unsigned long start = jiffies;
+	unsigned long deadline = start + msecs_to_jiffies(timeout_ms);
+	u64 first, last;
+
+	dev_dbg(&chip->intf0->dev, "Waiting up to %u ms for %s to %s\n",
+		timeout_ms, type, require_healthy ? "stream steadily" : "show liveness");
+
+	while (time_before(jiffies, deadline)) {
+		/*
+		 * A device that went away mid-wait completes nothing more;
+		 * spinning out the grace only delays the caller's next decision,
+		 * which in the recovery path is whether to reset.
+		 */
+		if (jockey3_is_disconnected(chip))
+			return false;
+
+		if (require_healthy ? jockey3_stream_streaming_healthy(chip, urb_stream)
+				    : jockey3_check_urb_stream_alive(urb_stream)) {
+			u64 mark;
+			unsigned int elapsed_ms;
+
+			first = atomic64_read(&urb_stream->first_callback_time);
+			if (since_ns && first >= since_ns)
+				mark = first;
+			else if (since_ns)
+				mark = ktime_get_mono_fast_ns();
+			else
+				mark = 0;
+			elapsed_ms = mark ? div_u64(mark - since_ns, NSEC_PER_MSEC)
+					  : jiffies_to_msecs(jiffies - start);
+
+			dev_dbg(&chip->intf0->dev, "%s confirmed %s after %u ms\n", type,
+				require_healthy ? "streaming" : "alive", elapsed_ms);
+			return true;
+		}
+
+		usleep_range(500, 2000);
+	}
+
+	dev_warn(&chip->intf0->dev, "%s URB has stalled.\n", type);
+
+	/* What the grace saw when it gave up: too few completions is silence or
+	 * trickle, many with a tight first->last span is a burst that stopped.
+	 */
+	first = atomic64_read(&urb_stream->first_callback_time);
+	last = atomic64_read(&urb_stream->last_callback_time);
+	dev_dbg(&chip->intf0->dev,
+		"%s stall detail: %d completions since start, first->last %llu us, %d URBs in flight\n",
+		type, atomic_read(&urb_stream->completions_since_start),
+		(first && last > first) ? div_u64(last - first, NSEC_PER_USEC) : 0,
+		atomic_read(&urb_stream->urbs_in_flight));
+	return false;
+}
+
+/*
+ * The body of jockey3_recover_urb_stream(), run while that holds
+ * @chip->recovery_in_progress. A function of its own so that every exit,
+ * including those from inside the rate_mutex guard, is a plain return
+ * rather than a goto to a shared cleanup label.
+ */
+static int jockey3_run_recovery_ladder(struct jockey3_chip *chip, const int direction,
+				       const char *context)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	const char *type = direction == SNDRV_PCM_STREAM_PLAYBACK ? "Playback" : "Capture";
+	unsigned int grace;
+	int ret;
+
+	dev_warn_ratelimited(&chip->intf0->dev,
+			     "%s stream stalled (%s); restarting URBs to recover\n",
+			     type, context);
+
+	/*
+	 * Even the light restart below discards in-flight buffer state, so
+	 * sample-accuracy is already broken the moment recovery is committed
+	 * to -- report it now rather than waiting to see how far the ladder
+	 * escalates. Both directions, not just @direction: jockey3_stop_urbs()/
+	 * jockey3_start_urbs() below tear down and resubmit the *shared* ring
+	 * unconditionally, so an open sibling substream loses continuity too,
+	 * even though it was never found stalled itself. Found on the bench: an
+	 * open Capture stream died with its own -EIO from ALSA core's
+	 * wait_for_avail() timeout while a Playback-triggered recovery was still
+	 * in flight, because only Playback had been told. jockey3_report_xrun()
+	 * itself is a no-op if a given substream is not open and running, so
+	 * calling it on both unconditionally is safe, and right for every caller:
+	 * the stream jockey3_pcm_prepare() is preparing is not running, but its
+	 * sibling may be.
+	 */
+	jockey3_report_xrun(&chip->playback);
+	jockey3_report_xrun(&chip->capture);
+
+	scoped_guard(mutex, &chip->rate_mutex) {
+		/*
+		 * Something else may have already fixed this while the call above
+		 * was waiting for rate_mutex -- a device reset, say, whose
+		 * jockey3_post_reset() restarts the ring under this same mutex.
+		 * The alive check above this function's entry is stale by the
+		 * time the lock is held; re-checking here is what makes a call
+		 * that raced a legitimate recovery a no-op instead of a second,
+		 * redundant full URB-ring teardown/rebuild landing right on top
+		 * of one that already succeeded.
+		 */
+		if (jockey3_check_urb_stream_alive(urb_stream)) {
+			dev_dbg(&chip->intf0->dev,
+				"%s stream came back under rate_mutex (%s); no restart needed\n",
+				type, context);
+			return 0;
+		}
+
+		/*
+		 * Stale for the same reason the alive check above is repeated: a
+		 * tick that blocked here may have been waiting on
+		 * jockey3_pre_reset(), and wakes to a stream that looks dead
+		 * only because that zeroed the timestamps. Restarting on that
+		 * would submit URBs to a device that is in the middle of a reset.
+		 *
+		 * Bailing loses nothing: jockey3_post_reset() restarts the ring
+		 * itself on the way back up.
+		 */
+		if (jockey3_is_disconnected(chip) || jockey3_is_resetting(chip)) {
+			dev_dbg(&chip->intf0->dev,
+				"%s stream stalled (%s), but the device is being taken down; leaving the restart to the resume path\n",
+				type, context);
+			return 0;
+		}
+
+		jockey3_stop_urbs(chip);
+		jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, true), context);
+	}
+
+	/*
+	 * Start grace, and the strict health gate: the light restart above was
+	 * of a ring that was streaming moments earlier, so a real resume shows
+	 * a proper completion cadence quickly, while a trickle of implausibly
+	 * fast FIFO-drain completions must NOT count -- passing on those
+	 * escalates a merely jittery restart to the USB reset below.
+	 */
+	grace = jockey3_start_grace_ms();
+	if (jockey3_wait_urb_stream_started(chip, direction, grace, true, true)) {
+		dev_dbg(&chip->intf0->dev,
+			"%s stream recovered via light URB restart (%s)\n", type, context);
+		return 0;
+	}
+
+	/*
+	 * Re-tested because the restart and grace above take long enough for the
+	 * device to go away underneath them, and escalating then goes badly.
+	 * jockey3_queue_reset() would reinit_completion() over the complete_all()
+	 * that jockey3_disconnect() issues to release waiters, and block the full
+	 * timeout on a reset that will never come. Ahead of the budget, so this
+	 * spends no attempt.
+	 *
+	 * Racy by construction -- a disconnect arriving just after the test still
+	 * hits it. The timeout bounds that; closing it properly would mean
+	 * serializing against jockey3_disconnect(), which must not block on
+	 * driver locks.
+	 */
+	if (jockey3_is_disconnected(chip)) {
+		dev_dbg(&chip->intf0->dev,
+			"%s stream still stalled after URB restart, but the device is down; not resetting (%s)\n",
+			type, context);
+		return -ENODEV;
+	}
+
+	if (!jockey3_recovery_budget_take(chip)) {
+		dev_err(&chip->intf0->dev,
+			"%s stream still stalled after URB restart; recovery budget exhausted, not resetting (%s)\n",
+			type, context);
+		return 0;
+	}
+
+	dev_warn(&chip->intf0->dev,
+		 "%s stream still stalled after URB restart; queuing full USB reset (%s), attempt %d/%d in window\n",
+		 type, context, atomic_read(&chip->recovery_attempts),
+		 JOCKEY3_RECOVERY_MAX_ATTEMPTS);
+	jockey3_queue_reset(chip);
+
+	ret = jockey3_wait_for_reset_completion(chip);
+	if (ret < 0)
+		return ret;
+
+	grace = jockey3_start_grace_ms();
+	if (!jockey3_wait_urb_stream_started(chip, direction, grace, false, true))
+		dev_err(&chip->intf0->dev,
+			"%s stream still stalled after full USB reset; hardware may need power-cycling (%s)\n",
+			type, context);
+	else
+		dev_dbg(&chip->intf0->dev,
+			"%s stream recovered after full USB reset (%s)\n", type, context);
+
+	return 0;
+}
+
+/**
+ * jockey3_recover_urb_stream() - bring a stalled direction back
+ * @chip: driver state
+ * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
+ * @context: short description of what found the stall, for the log
+ *
+ * Called by jockey3_pcm_prepare() once its liveness check has confirmed a
+ * stall. A direction found alive at entry returns immediately, so two
+ * sequential calls for one stall are cheap.
+ *
+ * Concurrent calls need more: two can both pass the alive check before either
+ * restarts anything, then run competing stop/start sequences or resets.
+ * @chip->recovery_in_progress closes that -- one ladder at a time, chip-wide.
+ *
+ * Ladder: a lightweight URB stop/start, then a full USB reset if that did not
+ * take, queued with usb_queue_reset_device() and awaited by
+ * jockey3_wait_for_reset_completion() rather than calling usb_reset_device()
+ * from ioctl context -- see there for why. The reset step is gated on
+ * jockey3_recovery_budget_take(), so a chip that keeps stalling is not reset
+ * in a tight loop.
+ *
+ * Once recovery is committed to, an xrun is reported on both directions,
+ * not only @direction: the ring the ladder restarts is shared.
+ *
+ * The onset line is ratelimited: jockey3_pcm_prepare() runs on every xrun
+ * recovery, so a client looping on a wedged stream re-enters here several
+ * times a second, and the budget bounds resets, not log lines.
+ *
+ * Return: 0 if the direction is confirmed alive, recovery gave up and logged
+ * why (still non-fatal to the caller), or a concurrent call already had this
+ * in hand, which jockey3_pcm_prepare() then waits out; -ENODEV if the
+ * device is gone; or -EAGAIN if a reset was queued but did not complete in
+ * time.
+ */
+static int jockey3_recover_urb_stream(struct jockey3_chip *chip, const int direction,
+				      const char *context)
+{
+	struct jockey3_pcm_urb_stream *urb_stream = jockey3_get_pcm_urb_stream(chip, direction);
+	const char *type = direction == SNDRV_PCM_STREAM_PLAYBACK ? "Playback" : "Capture";
+	int ret;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	if (jockey3_check_urb_stream_alive(urb_stream))
+		return 0;
+
+	if (atomic_cmpxchg(&chip->recovery_in_progress, 0, 1) != 0) {
+		dev_dbg(&chip->intf0->dev,
+			"%s stream stalled (%s); another recovery is already in progress, skipping\n",
+			type, context);
+		return 0;
+	}
+
+	ret = jockey3_run_recovery_ladder(chip, direction, context);
+	/* Fully ordered, as wake_up_var() requires; see jockey3_pcm_prepare() */
+	atomic_xchg(&chip->recovery_in_progress, 0);
+	wake_up_var(&chip->recovery_in_progress);
+	return ret;
+}
+
 /*
  * SNDRV_PCM_INFO_BATCH: the hardware pointer only advances once per completed
  * bulk URB (a whole Ploytec frame group), never per sample, so userspace must
@@ -1351,11 +2080,92 @@ static int jockey3_pcm_prepare(struct snd_pcm_substream *substream)
 	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
 	struct jockey3_pcm_urb_stream *urb_stream =
 		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	bool stalled = false;
+	int ret = 0;
 
 	dev_dbg(&chip->intf0->dev, "PCM prepare stream %d\n", substream->stream);
 	if (jockey3_is_disconnected(chip))
 		return -ENODEV;
 
+	ret = jockey3_wait_for_reset_completion(chip);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Taking rate_mutex here serializes against a URB restart in
+	 * jockey3_recover_urb_stream() or a device reset, both of which hold it
+	 * across their stop/start sequence -- so the liveness below is sampled
+	 * from a settled state rather than from the middle of a URB restart.
+	 */
+	scoped_guard(mutex, &chip->rate_mutex) {
+		if (jockey3_is_disconnected(chip))
+			return -ENODEV;
+
+		/*
+		 * The ring may have stalled since it was started. Catch it here,
+		 * before the stream that is being prepared starts relying on it.
+		 *
+		 * This single sample is only a hint. jockey3_check_urb_stream_alive()'s
+		 * window is scaled to always span a handful of packet intervals
+		 * regardless of N (JOCKEY3_LIVENESS_WINDOW_NS()), but a handful is
+		 * still not many -- one preemption is enough to make a healthy
+		 * stream read as dead -- and .prepare runs on every xrun recovery,
+		 * where acting on a false positive would disrupt a working stream.
+		 * What it flags is confirmed below before anything is done about it.
+		 */
+		stalled = !jockey3_check_urb_stream_alive(urb_stream);
+	}
+
+	/*
+	 * Confirm, and recover, outside rate_mutex on purpose: polling would
+	 * otherwise hold the mutex for a whole start grace, and recovery may
+	 * escalate to a queued USB reset, whose jockey3_pre_reset() and
+	 * jockey3_post_reset() need to acquire the mutex themselves to complete.
+	 * Start grace and the plain alive check: this is a stream being
+	 * (re)opened, not a warm restart of one that was just running.
+	 */
+	if (stalled)
+		stalled = !jockey3_wait_urb_stream_started(chip, substream->stream,
+							  jockey3_start_grace_ms(), false,
+							  false);
+
+	if (stalled) {
+		const char *context = substream->stream == SNDRV_PCM_STREAM_CAPTURE ?
+			"opening a capture stream" : "preparing a playback stream";
+
+		ret = jockey3_recover_urb_stream(chip, substream->stream, context);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * Do not return into a recovery ladder that is still in flight,
+	 * whoever runs it: the call above declines when one is, and a stream
+	 * found alive never makes it at all. The ladder reports its xrun once,
+	 * when it commits, so a stream started after that would ride the
+	 * ladder's later URB restart or USB reset untold, and with a small
+	 * buffer ALSA core's wait_for_avail() timeout, about 1.1 buffer times,
+	 * turns that gap into -EIO. The ladder clears the flag only once its
+	 * reset, if any, has completed.
+	 *
+	 * A stream that passes this check just before the ladder takes the
+	 * flag is normally running by the time the ladder reports, so it is
+	 * told. Missed is only one whose START ioctl comes after that report:
+	 * a window no wider than the gap from .prepare returning to START,
+	 * left open rather than serializing .trigger against the ladder.
+	 *
+	 * Bounded by the longest a ladder can take: two start graces and the
+	 * one-second reset wait, plus headroom for rate_mutex.
+	 */
+	if (!wait_var_event_timeout(&chip->recovery_in_progress,
+				    !atomic_read_acquire(&chip->recovery_in_progress),
+				    msecs_to_jiffies(2 * jockey3_start_grace_ms() + 2000))) {
+		dev_warn(&chip->intf0->dev, "Timeout waiting for stream recovery\n");
+		return -EAGAIN;
+	}
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
 		urb_stream->dma_off = 0;
 		urb_stream->period_off = 0;
@@ -1544,15 +2354,19 @@ static int jockey3_initialize(struct jockey3_chip *chip, int model)
 		 (fw_version >> 4) & 0x0F, fw_version & 0x0F);
 
 	rate = 44100;	// default sample rate at power-on
+	scoped_guard(mutex, &chip->rate_mutex)
+		jockey3_set_current_rate(chip, rate);
+
 	ret = jockey3_set_rate(chip, rate, true);
 	if (ret < 0)
 		return ret;
 
 	/*
-	 * Fail the probe: a device that cannot accept its URBs has no working
-	 * audio and no MIDI OUT.
+	 * Fail the probe rather than escalating: a device that cannot accept its
+	 * URBs has no working audio and no MIDI OUT, and queuing a reset against
+	 * one that never started is worse than reporting a clean failure here.
 	 */
-	ret = jockey3_start_urbs(chip);
+	ret = jockey3_start_urbs(chip, false);
 	if (ret < 0) {
 		dev_err(&chip->intf0->dev, "Failed to start URBs during initialization: %d\n",
 			ret);
@@ -1595,6 +2409,8 @@ static void jockey3_free_resources(struct jockey3_chip *chip)
 	kfree(chip->midi_in_buf);
 	kfree(chip->xfer_buf);
 
+	mutex_destroy(&chip->rate_mutex);
+
 	jockey3_release_slot(chip->dev_idx);
 
 	/* Last, reversing jockey3_probe(): everything above may read these. */
@@ -1860,6 +2676,8 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	spin_lock_init(&chip->midi_lock);
 	spin_lock_init(&chip->playback.lock);
 	spin_lock_init(&chip->capture.lock);
+	mutex_init(&chip->rate_mutex);
+	init_completion(&chip->reset_done);
 
 	init_usb_anchor(&chip->playback.anchor);
 	init_usb_anchor(&chip->capture.anchor);
@@ -1867,16 +2685,25 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	init_waitqueue_head(&chip->capture.drain_wait);
 
 	/*
-	 * From here on every failure goes to err_free_card, and the card slot is
-	 * given back by jockey3_free_resources() rather than by err_free_idx.
+	 * Arm the release path only now that everything it touches exists --
+	 * jockey3_free_resources() calls mutex_destroy() on rate_mutex, so it
+	 * must not become reachable before mutex_init() above. From here on
+	 * every failure goes to err_free_card, and the card slot is given back
+	 * by jockey3_free_resources() rather than by err_free_idx. Keep this
+	 * assignment below the initialization block: nothing fallible may be
+	 * inserted between them.
 	 */
 	card->private_free = jockey3_card_free;
 	/*
 	 * card->private_data is zeroed by snd_card_new(), but be explicit:
-	 * this one is load-bearing for the stop bookkeeping.
+	 * these two are load-bearing for the stop/stall bookkeeping.
 	 */
 	atomic_set(&chip->playback.urbs_in_flight, 0);
 	atomic_set(&chip->capture.urbs_in_flight, 0);
+	atomic64_set(&chip->playback.last_callback_time, 0);
+	atomic64_set(&chip->capture.last_callback_time, 0);
+	atomic64_set(&chip->playback.urbs_started_time, 0);
+	atomic64_set(&chip->capture.urbs_started_time, 0);
 	/*
 	 * Default N until the first hw_params() picks a period-tuned value
 	 * (jockey3_pcm_set_n()); matches the width the URB buffers below are
@@ -1983,6 +2810,14 @@ static void jockey3_disconnect(struct usb_interface *intf)
 		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
 
 	if (chip && intf == chip->intf0) {
+		clear_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+		/*
+		 * Release anyone blocked in jockey3_wait_for_reset_completion():
+		 * a failed reset unbinds the interface instead of calling
+		 * jockey3_post_reset(), so this is the only wakeup they get.
+		 */
+		complete_all(&chip->reset_done);
+
 		jockey3_stop_urbs(chip);
 
 		/*
@@ -2018,6 +2853,75 @@ static void jockey3_disconnect(struct usb_interface *intf)
 	usb_set_intfdata(intf, NULL);
 }
 
+/*
+ * rate_mutex is taken and released within each of pre_reset()/post_reset()
+ * rather than being held across the reset. The USB core does not guarantee
+ * post_reset() runs at all: if the reset fails, the interface is marked for
+ * rebinding and unbound instead, so a lock handed off from pre_reset() would
+ * be leaked permanently and every later PCM ioctl would block on it forever.
+ *
+ * The window between the two callbacks is not left unguarded: the device is
+ * physically in reset, so every EP0 transfer fails and is error-checked, and
+ * JOCKEY3_FLAG_RESETTING gates the ALSA entry points.
+ */
+static int jockey3_pre_reset(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		/*
+		 * A reset started outside this driver -- usbfs USBDEVFS_RESET,
+		 * say -- does not pass through jockey3_queue_reset(), so
+		 * chip->reset_done still carries the complete_all() from the
+		 * previous reset and jockey3_wait_for_reset_completion() would
+		 * return immediately, letting an ALSA ioctl talk to a device
+		 * that is mid-reset. Re-arm it for that path. Testing the flag
+		 * unlocked is safe because the USB core serializes resets per
+		 * device, and re-arming before setting the flag leaves no
+		 * window in which a waiter sees "resetting" but a stale
+		 * completion.
+		 */
+		if (!jockey3_is_resetting(chip))
+			reinit_completion(&chip->reset_done);
+		set_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+		scoped_guard(mutex, &chip->rate_mutex)
+			jockey3_stop_urbs(chip);
+	}
+	return 0;
+}
+
+static int jockey3_post_reset(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+	u32 hw_rate = 0;
+
+	if (chip && intf == chip->intf0) {
+		scoped_guard(mutex, &chip->rate_mutex) {
+			jockey3_initialize_ploytec(chip, NULL);
+
+			/*
+			 * Re-apply the rate unconditionally, as the vendor
+			 * sequence does. The read below is a diagnostic only.
+			 */
+			if (ploytec_get_rate(chip->intf0, chip->xfer_buf,
+					     PLOYTEC_RATE_IDX_DEVICE, &hw_rate) == 0 &&
+			    hw_rate != chip->current_rate)
+				dev_dbg(&chip->intf0->dev,
+					"Rate after reset: HW %u, expected %u\n",
+					hw_rate, chip->current_rate);
+
+			jockey3_set_rate(chip, chip->current_rate, true);
+
+			jockey3_start_urbs_failed(chip, jockey3_start_urbs(chip, false),
+						  "a device reset");
+		}
+
+		clear_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
+		complete_all(&chip->reset_done);
+	}
+	return 0;
+}
+
 static const struct usb_device_id jockey3_ids[] = {
 	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_ME_PID), .driver_info = JOCKEY3_ME },
 	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_REMIX_PID), .driver_info = JOCKEY3_REMIX },
@@ -2044,6 +2948,8 @@ static struct usb_driver jockey3_driver = {
 	.soft_unbind = 1,
 	.probe = jockey3_probe,
 	.disconnect = jockey3_disconnect,
+	.pre_reset = jockey3_pre_reset,
+	.post_reset = jockey3_post_reset,
 	.id_table = jockey3_ids
 };
 
-- 
2.47.3

