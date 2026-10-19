Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432000;
	b=QN1ZH+jydH+wcEM6beLWS48jJzdEiWWWMG1lpgt20AiNM0T/xExQHnU1c3UsxPa6opzF
	 3DnjWeD5DvgGtCr0B0fLcQ9kCNXzFiKEawHChGUXMat6Hy5fLUCCWVGqSY/fYYfVOkTrU
	 PZW7lWSN1jvbvQBvh9CHRk6f/H3IIWQu75LzwBiNBzEpKpzOz97GlunNmALbDN4a49NUh
	 EQn5KFD62kLh5KNGN6HCXUuojbMSX88ad4fvYTXDAEETGlrbO8Uy8mSCk77LAAuJ5lVT/
	 3pRZUCuEUBtUjy4XiO7HroH77TuAiiVQC9YED6fOj6X3h/gezd9OX86xRSA/lxdNkdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/j+L9c85Zmk9gdLPRB45/y1VrP4yGCXm6RLIZSp5kzw=;
	b=HMZPoB1BXsGZCdRm+8Fcmufz0hA7//8BRHjyeZs0VCarQT7v78KUCd/jZz3GbiWfDPDc
	 0U4LMPw2PDaSh4s5Yli71YzvKX6ezEEsnw8uoFeiUrgpQc86DXcJ5dSqdPOeup+/3snPc
	 BLBGvHnbhJOEzpVTSbpdOvPVoH6GbI3vh5cnwtY6Vowz/X9QxJjtqa9d7xxZG+qQ27sYo
	 umVgwLa6tZwS/+Lm8NnvjmohdXQmNo9eHbprYhQLI05W2C6XRBOlwvgO+JlgCtuIt9LDo
	 QGZmgN+VdFjPOR7blXbdD9a5v+ucR4xSaEAquOuLC6AkypwIc0bhuFKXWBNahdmdeXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AmpSduC3;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABF6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ABF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AmpSduC3
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso1534531137.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431998; x=1793036798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/j+L9c85Zmk9gdLPRB45/y1VrP4yGCXm6RLIZSp5kzw=;
        b=AmpSduC3UfBn+AzvxVn+pVam6OOmCc3dzILgnDfMxVUlGJ+/lBEFLhnrp5Gb58wcJJ
         nq55YP+IMz9QMPLf5JdqzaY3OxJJOSSrF6imo/mXQL+maDYsDv7D4nVHns2S5IaGMKuI
         55ckGaCDQafa3OCOAKzAd+YdoCPXNC41YwMKryBlmhev7nPu5gMOh+4wj0vWxDp2sxLe
         s1lqtb/bm9z8RytRurd/0GftCprHndxQT00p5w0cjj4nwYR4udgc7QIByDIQam3A8y8D
         Er5Xi1M3d1L5/++/rMu5PkcV9Q4a8ipMIYBuFm4omY2ZgZcHXmxIaT9r5dvZrGTso5Er
         9T6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431998; x=1793036798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/j+L9c85Zmk9gdLPRB45/y1VrP4yGCXm6RLIZSp5kzw=;
        b=lpxGMuMRW8abEwJ+Vfp4DTakbEFC2KDQCKufWtZT4mbzMRCbZ2wnlYJWlMZmoi85ey
         eAQKS7okCeXax0zJfHp97RAX1pjJ6p5r2P10aAE7lzKHPPbXrRy0fS+05xCXOCqGMrgx
         KUPTusk5/Z52yVDsljf+o6d9vYQ3iEYqfLaRHWlp6IcdBTrcbi+Tf/1xGCJL/El51G6u
         iuoaRjsgqdTPyjsLwqTHl4CsUACsHS8CP0setHF0eNJYKIOnWfb2vb+zvk9xa/pMIrcM
         dw/JSRSfXrgj3jqsAY44/Iu0Rhg83khlSpR3ic7NH+GGcu+wyFDXsGC9NIAI2bT8i+8v
         9yPg==
X-Forwarded-Encrypted: i=1; AKwUvBzgmT3QtFSwZ6DluK0RsKbfey6/Ur4OxaPPL8p/kHwx6cOQsQlgnpMyPlJIP0bTaMvQaiEwysUYEDUPQP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4j4x8FAwwAPpCo/Rx3+++VhC8/d4reH586oYfghcBw7sNfv/D
	LWDpEjqHa4lsTz9OZshm+W9br2QV01/QrScEzBYjd+505cEK5oGfxySf
X-Gm-Gg: AYBFou2W+Yl03DXjHJ+Kx33uk4J8z5TlWgQm+uHTNaTHN+v0nPGKgAssuv6uYNM4QDP
	GG8Dr/0/e5Z6nmxU8BWQn3O3vp/+lS1m40uXjuvscH7+GqK1q05szoFeIT7FpdKLnfS2aEOlCm5
	wRAUvcUfN2C13BUfJ8d4h55UKrMMo447kTzUO09r2M5dlXdt8WauA6QROwFMqTqyynolsHJ8fVo
	gxsOarxAq9JFxZZCxCntnKD1HJd6iD7u0jtCiwRmJx091vi/+4rX0/DIwDD/T56jtYZeXGFPbW3
	S8csOcC8fi0/uWKaOw7C04O++nblPvZU86uRKrmJuBN2shpBIcbpsQ2xHbOG+I1mfq66saZFueD
	C+QRJOqnsK1P0XU5AzxPa8li+CoELRz4Peyn8qaZJpCyJp/bfVPuWie7gLz4cTRAK/oCHEeDfA2
	2dIsXYAatQaPCMBmOU4Jk5WqXZJ48/daArDytznpmiYPjxxqAQcJ0fq7+xxhaOmccSriFQpl1sx
	xvc1wFyadV9g6YlcZLJ9piszLZ7dTCWfQg77CQrk6HzPPjUohyoZ3cRJBxCPHeBXdm6zJzC1wNr
	bZ3Qne6wYb1Y9/eb50aCHzPa8qRULos=
X-Received: by 2002:a05:6102:849b:20b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7cc3eb09b24mr1525700137.11.1792431997928;
        Mon, 19 Oct 2026 10:46:37 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:36 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/13] ALSA: jockey3: Add power management
Date: Mon, 19 Oct 2026 13:44:44 -0400
Message-ID: <20261019174445.1931263-13-fvdpol@gmail.com>
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

Add suspend, resume and reset_resume callbacks.

Suspend stops the URBs. Resume programs the rate again and restarts
them; reset_resume also repeats the initialization handshake first.

SNDRV_PCM_INFO_RESUME is not set. The device loses stream
synchronization across a suspend, so userspace has to prepare the
stream again.

A watchdog tick or a recovery that is already running must not restart
or reset a device that is being suspended. JOCKEY3_FLAG_SUSPENDED is
set before the URBs are stopped, and the watchdog and the recovery
ladder test it at each point where they would otherwise act.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/jockey3.c | 183 +++++++++++++++++++++++++++++++-----
 1 file changed, 161 insertions(+), 22 deletions(-)

diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index 17c014f2e69d0..db351c42d85c3 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -170,17 +170,18 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *
  * The watchdog work item adds one rule: rate_mutex must never be held across
  * cancel_delayed_work_sync(&chip->watchdog_work). jockey3_stop_urbs() is called
- * from inside rate_mutex at three sites, so it disarms with the non-sync
+ * from inside rate_mutex at four sites, so it disarms with the non-sync
  * cancel_delayed_work(), which is safe under any lock; a tick that is already
  * running when the cancel lands re-reads 'stopping' and does nothing. The sync
  * form appears only in jockey3_disconnect(), in probe's error path and in
  * jockey3_free_resources(), none of which holds a mutex.
  *
  * Because that disarm does not wait, a tick can be parked on rate_mutex while
- * jockey3_pre_reset() takes the device down, then wake to the timestamps it
- * zeroed and read the stream as stalled. So jockey3_recover_urb_stream()
- * re-tests DISCONNECTED and RESETTING under the mutex and leaves the restart
- * to jockey3_post_reset().
+ * jockey3_suspend() or jockey3_pre_reset() takes the device down, then wake to
+ * the timestamps they zeroed and read the stream as stalled. So
+ * jockey3_recover_urb_stream() re-tests DISCONNECTED, SUSPENDED and RESETTING
+ * under the mutex and leaves the restart to whichever path is bringing the
+ * device back.
  *
  * jockey3_watchdog_work() itself may call jockey3_recover_urb_stream(),
  * which takes rate_mutex and calls jockey3_stop_urbs() -- i.e. the watchdog's
@@ -450,7 +451,10 @@ struct jockey3_pcm_urb_stream {
  *	registered or the watchdog armed, so it is the only user in existence.
  * @rate_mutex: serializes sample-rate changes and the URB stop/start that goes
  *	with them; process context only, outermost lock
- * @flags: JOCKEY3_FLAG_* bits, atomic bitops
+ * @flags: JOCKEY3_FLAG_* bits, atomic bitops. SUSPENDED is set before
+ *	jockey3_suspend() takes @rate_mutex and cleared by
+ *	jockey3_restore_device() under it, so a tick blocked on that mutex sees
+ *	it on the way out.
  * @current_rate: sample rate the hardware is programmed to; @rate_mutex
  * @dev_idx: card slot held in jockey3_devices_used
  * @reset_done: completed by jockey3_post_reset(), and by jockey3_disconnect()
@@ -483,7 +487,7 @@ struct jockey3_pcm_urb_stream {
  *	callers elsewhere poll rather than block on recovery finishing.
  * @warm_start: true if the current URB ring was last started by the stall
  *	watchdog's own lightweight restart, false for every other (re)start
- *	(first open, rate change, USB reset, probe). Both kinds share
+ *	(first open, rate change, USB reset, resume, probe). Both kinds share
  *	one start_grace_ms; this only labels which one is in effect, for
  *	dev_dbg(). Chip-wide, not per-direction: jockey3_start_urbs() restarts
  *	the shared ring for both directions at once. Plain bool, written by
@@ -585,6 +589,7 @@ static void jockey3_release_slot(unsigned int dev_idx)
 /* Chip flags */
 #define JOCKEY3_FLAG_DISCONNECTED	0
 #define JOCKEY3_FLAG_RESETTING		1
+#define JOCKEY3_FLAG_SUSPENDED		2
 
 static inline bool jockey3_is_disconnected(const struct jockey3_chip *chip)
 {
@@ -596,6 +601,11 @@ static inline bool jockey3_is_resetting(const struct jockey3_chip *chip)
 	return test_bit(JOCKEY3_FLAG_RESETTING, &chip->flags);
 }
 
+static inline bool jockey3_is_suspended(const struct jockey3_chip *chip)
+{
+	return test_bit(JOCKEY3_FLAG_SUSPENDED, &chip->flags);
+}
+
 /*
  * Publish a new sample rate.
  *
@@ -1711,7 +1721,7 @@ static void jockey3_submit_failed(struct jockey3_chip *chip, int err,
  * @chip: driver state
  * @warm: true only for the stall watchdog's own lightweight restart of a ring
  *	that was streaming a moment earlier; false for a cold start (first open,
- *	rate change, USB reset, probe). Both share start_grace_ms; this
+ *	rate change, USB reset, resume, probe). Both share start_grace_ms; this
  *	only labels the restart for dev_dbg() and is recorded chip-wide in
  *	@chip->warm_start.
  *
@@ -1736,6 +1746,13 @@ static int jockey3_start_urbs(struct jockey3_chip *chip, bool warm)
 	if (jockey3_is_disconnected(chip))
 		return -ENODEV;
 
+	/*
+	 * Belt and braces; jockey3_recover_urb_stream() is what actually bails.
+	 * jockey3_restore_device() clears the flag before its own restart.
+	 */
+	if (jockey3_is_suspended(chip))
+		return -ESHUTDOWN;
+
 	dev_dbg(&chip->intf0->dev, "Starting all URBs (%s start, grace %u ms)\n",
 		warm ? "warm" : "cold", jockey3_start_grace_ms());
 
@@ -1891,6 +1908,13 @@ static void jockey3_start_urbs_failed(struct jockey3_chip *chip, int err, const
 		return;
 	}
 
+	if (err == -ESHUTDOWN || jockey3_is_suspended(chip)) {
+		dev_dbg(&chip->intf0->dev,
+			"Could not start URBs after %s: device is suspended; the resume path will start them\n",
+			context);
+		return;
+	}
+
 	if (err == -ENOENT) {
 		dev_err(&chip->intf0->dev,
 			"Endpoints are disabled after %s; the device needs a reset to restore them\n",
@@ -2139,7 +2163,7 @@ static void jockey3_watchdog_check(struct jockey3_chip *chip, const int directio
 
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
 		/*
-		 * One flag covers every deliberate stop -- rate change,
+		 * One flag covers every deliberate stop -- rate change, suspend,
 		 * pre_reset and teardown all reach jockey3_stop_urbs(). Checked
 		 * before now/last/age_ns are sampled, not after: this tick can
 		 * have been sitting on system_long_wq for a while before it got
@@ -2272,7 +2296,15 @@ static void jockey3_watchdog_work(struct work_struct *work)
 	struct jockey3_chip *chip = container_of(to_delayed_work(work),
 						 struct jockey3_chip, watchdog_work);
 
-	if (jockey3_is_disconnected(chip))
+	/*
+	 * Suspend as well as teardown: jockey3_stop_urbs() disarms with the
+	 * non-sync cancel_delayed_work(), which leaves a tick that is already
+	 * running to finish. Without this it would requeue itself and keep
+	 * ticking for the whole suspend, for no purpose -- every check below
+	 * bails out on the suspended flag anyway. Resume re-arms via
+	 * jockey3_start_urbs().
+	 */
+	if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip))
 		return;
 
 	/*
@@ -2327,11 +2359,11 @@ static bool jockey3_wait_urb_stream_started(struct jockey3_chip *chip, const int
 
 	while (time_before(jiffies, deadline)) {
 		/*
-		 * A device that went away mid-wait completes nothing more;
-		 * spinning out the grace only delays the caller's next decision,
-		 * which in the recovery path is whether to reset.
+		 * A device that went down mid-wait completes nothing until it is
+		 * restored; spinning out the grace only delays the caller's next
+		 * decision, which in the recovery path is whether to reset.
 		 */
-		if (jockey3_is_disconnected(chip))
+		if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip))
 			return false;
 
 		if (require_healthy ? jockey3_stream_streaming_healthy(chip, urb_stream)
@@ -2434,14 +2466,16 @@ static int jockey3_run_recovery_ladder(struct jockey3_chip *chip, const int dire
 		/*
 		 * Stale for the same reason the alive check above is repeated: a
 		 * tick that blocked here may have been waiting on
-		 * jockey3_pre_reset(), and wakes to a stream that looks dead
-		 * only because that zeroed the timestamps. Restarting on that
-		 * would submit URBs to a device that is in the middle of a reset.
+		 * jockey3_suspend() or jockey3_pre_reset(), and wakes to a
+		 * stream that looks dead only because they zeroed the
+		 * timestamps. Restarting on that would submit URBs to a
+		 * suspended device, then escalate to resetting one.
 		 *
-		 * Bailing loses nothing: jockey3_post_reset() restarts the ring
-		 * itself on the way back up.
+		 * Bailing loses nothing: both paths restart the ring themselves
+		 * on the way back up.
 		 */
-		if (jockey3_is_disconnected(chip) || jockey3_is_resetting(chip)) {
+		if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip) ||
+		    jockey3_is_resetting(chip)) {
 			dev_dbg(&chip->intf0->dev,
 				"%s stream stalled (%s), but the device is being taken down; leaving the restart to the resume path\n",
 				type, context);
@@ -2474,12 +2508,21 @@ static int jockey3_run_recovery_ladder(struct jockey3_chip *chip, const int dire
 	 * timeout on a reset that will never come. Ahead of the budget, so this
 	 * spends no attempt.
 	 *
-	 * Racy by construction -- a disconnect arriving just after the test still
+	 * Suspended as well as disconnected, and this is not the same check as
+	 * the one under rate_mutex above. That one covers a tick that arrives
+	 * after jockey3_suspend() has run. A tick which passed it earlier, while
+	 * the device was still live, is legitimately mid-recovery and reaches
+	 * here only after its grace has elapsed -- by which time suspend may have
+	 * happened. Resetting from there was observed to queue a reset the
+	 * suspended device could not complete, leaving the resume path waiting
+	 * out jockey3_wait_for_reset_completion() twice over.
+	 *
+	 * Racy by construction -- either state arriving just after the test still
 	 * hits it. The timeout bounds that; closing it properly would mean
 	 * serializing against jockey3_disconnect(), which must not block on
 	 * driver locks.
 	 */
-	if (jockey3_is_disconnected(chip)) {
+	if (jockey3_is_disconnected(chip) || jockey3_is_suspended(chip)) {
 		dev_dbg(&chip->intf0->dev,
 			"%s stream still stalled after URB restart, but the device is down; not resetting (%s)\n",
 			type, context);
@@ -2584,6 +2627,10 @@ static int jockey3_recover_urb_stream(struct jockey3_chip *chip, const int direc
  * SNDRV_PCM_INFO_BATCH: the hardware pointer only advances once per completed
  * bulk URB (a whole Ploytec frame group), never per sample, so userspace must
  * not assume a sample-accurate position.
+ *
+ * SNDRV_PCM_INFO_RESUME is deliberately absent: the device loses stream
+ * synchronization across a suspend, so the ALSA core should return -ESTRPIPE
+ * and have userspace re-prepare rather than issue TRIGGER_RESUME.
  */
 #define JOCKEY3_PCM_INFO	(SNDRV_PCM_INFO_MMAP |		\
 				 SNDRV_PCM_INFO_INTERLEAVED |	\
@@ -2895,6 +2942,7 @@ static int jockey3_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			urb_stream->running = true;
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
 			urb_stream->running = false;
 			break;
 		default:
@@ -3953,6 +4001,94 @@ static int jockey3_post_reset(struct usb_interface *intf)
 	return 0;
 }
 
+static int jockey3_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		dev_dbg(&intf->dev, "USB suspend, stopping URBs\n");
+
+		/*
+		 * Before rate_mutex below: a tick blocked on that mutex resumes
+		 * the moment this drops it, and the flag is what stops it
+		 * restarting the ring. See jockey3_recover_urb_stream().
+		 */
+		set_bit(JOCKEY3_FLAG_SUSPENDED, &chip->flags);
+
+		/* Notify ALSA core to transition state and unblock userspace */
+		if (chip->pcm)
+			snd_pcm_suspend_all(chip->pcm);
+
+		/*
+		 * Stop the physical URBs under rate_mutex, matching
+		 * jockey3_restore_device() on the resume side -- otherwise a
+		 * suspend could land in the middle of a rate change.
+		 */
+		scoped_guard(mutex, &chip->rate_mutex)
+			jockey3_stop_urbs(chip);
+	}
+	return 0;
+}
+
+static int jockey3_restore_device(struct jockey3_chip *chip, bool reset)
+{
+	int ret;
+
+	guard(mutex)(&chip->rate_mutex);
+
+	/*
+	 * Cleared under the mutex, before the restart below that
+	 * jockey3_recover_urb_stream() defers to. A tick cannot slip in between:
+	 * it needs this same mutex to restart anything.
+	 */
+	clear_bit(JOCKEY3_FLAG_SUSPENDED, &chip->flags);
+
+	if (reset) {
+		ret = jockey3_initialize_ploytec(chip, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = jockey3_set_rate(chip, chip->current_rate, true);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Report the failure up: the PM core logs a failed resume, and unlike the
+	 * reset path there is no queued recovery on the way that would pick this
+	 * up on its own.
+	 */
+	ret = jockey3_start_urbs(chip, false);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Failed to start URBs while restoring device: %d\n",
+			ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int jockey3_resume(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		dev_dbg(&intf->dev, "USB resume, restoring device\n");
+		return jockey3_restore_device(chip, false);
+	}
+	return 0;
+}
+
+static int jockey3_reset_resume(struct usb_interface *intf)
+{
+	struct jockey3_chip *chip = usb_get_intfdata(intf);
+
+	if (chip && intf == chip->intf0) {
+		dev_dbg(&intf->dev, "USB reset resume, restoring device\n");
+		return jockey3_restore_device(chip, true);
+	}
+	return 0;
+}
+
 static const struct usb_device_id jockey3_ids[] = {
 	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_ME_PID), .driver_info = JOCKEY3_ME },
 	{ USB_DEVICE(RELOOP_VENDOR_ID, RELOOP_JOCKEY3_REMIX_PID), .driver_info = JOCKEY3_REMIX },
@@ -3981,6 +4117,9 @@ static struct usb_driver jockey3_driver = {
 	.disconnect = jockey3_disconnect,
 	.pre_reset = jockey3_pre_reset,
 	.post_reset = jockey3_post_reset,
+	.suspend = jockey3_suspend,
+	.resume = jockey3_resume,
+	.reset_resume = jockey3_reset_resume,
 	.id_table = jockey3_ids
 };
 
-- 
2.47.3

