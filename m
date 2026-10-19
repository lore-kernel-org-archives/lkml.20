Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431976;
	b=JVZq7ae/3s2JSG8E2Wz7FL4em1Vx35Z5O41yDHjTEA0RAQeJZ0X8ryZ5bWzDpP6+R3md
	 93BTzAIBCaBOiULrPqtRKM0J8jwy1bmDMGaldzhh+PHD4EhRPj7nnialfM2bVKWk4kaKg
	 PWqFUgGSi43BJ3tH/e0hE/+Fn6QJOI/s+A/0oxcBqdynYTeyHRI/7rQbHO5efj2t33qcY
	 k5k4BAcz3GDhLRESzJOay822y3MGTsSpywWY93mPp0OgcQ5iO2hPKtFJZs/DLGJuOXTDq
	 5ERYSaYpvokUIaqWaJ+xYvkwxyCKNSxLxu9okuMCSCcJFF4/qJ1HxD5UpoReSs1CV/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qkss9TKtGAhWgAJ+Swt6g8r3yA4LHLCHAl7CifsNLuc=;
	b=TPWI2P9lIREdnzJ1wK8CwIkbVYa9dVvnr4SxEuuLlgcDLIPCI9mP8x0eOd5Q6juTF7DF
	 w3bbYu63oxwtR/NlnIoIpodhHsK7edLmHOlxKP82j/Ds8Xb7G1amkRLLu1hZyQDL0y82a
	 hhITp1GVO6W9E1jFUGFmHkjjXmcBrMiuVikQ0nHtX3E3W8xaCm+CcAYkqZ/OMcbU+3EyL
	 3ZzSEjQ54iwTuUQxWxx4j/fhiqzPPu5I9jedO7zykRupy7pP6PCOT01Zo1PbM8gFTd+Um
	 ZB7YFNuD/2/EXv5Nowi4mQ5z6RMvN6XmYrWiXnyheniYS5kCZEYml4LMGpAbhx+uJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="QrZ//W1d";
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5591C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QrZ//W1d
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c3b75caad1so1213050137.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431974; x=1793036774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qkss9TKtGAhWgAJ+Swt6g8r3yA4LHLCHAl7CifsNLuc=;
        b=QrZ//W1dV0FMQq2xa5MOi2I7ZYIOpjtExH/XKlc8XdIXfyGWZNP5M8Pg1qVXs+bBS7
         ptfJMan6b70SZewqjmN9uB4zoN+H7wFR0U4QvB6gHCAVn03oLbu2wvb1WacqP+FRBNiM
         2ldXekzeC/f/j/0Nt/UwPBJ6UnCgww3QKe44DoyT+44MOc+s69oIVORZykTIuLo8FQre
         QTax4dZ8CVGcYOdxMuYA+F/B+AG6xW7WK4BRrxGGjtOHQbMvCilCKCXRvoKPEcbMZJ02
         znTJRQpHSERwPqQMkyfKrekE/XvCMffgPD6aW/GPlgt+iEKLj7Aa8CBgyIlDJFDQR3N3
         imHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431974; x=1793036774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qkss9TKtGAhWgAJ+Swt6g8r3yA4LHLCHAl7CifsNLuc=;
        b=CHLI8VF2dV5o9kRLKC7a6/t7BPs+0+nGmrnhdxaDUBtK2mLgo2iH6D3iy5n5CuGO8S
         7mGxv6HYJHrFV+CfflnioCWOQzoBC0Hqyb+k7OLL3yPpqHn49MdoZ019pR4pzyYuHPTN
         Ukwjdq7yBj9AVooijmO7oac2/TRCp0S/nn1fplYFBC/XhB0cCR0Mmnvlf265NFBTWUiG
         cZLWyDhKZEl1MTbMbImAuc3hlJMtNB4l04goe3UDEWKkeILWUEctTdmEwjd4sKZgZbD+
         wfX7lO9C6QLLKIhQvRB8+915IPPAcjl71fUPqK0sl6SUU66C4gNKFxd1QprnyybFpTtd
         BVOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx62/cy9QeI8AjFP4CmU5b4m2cBrxlymTCVyA12cSbZ7X41gAxOLmQ/OUrhEjp9kiji8t+c7YCH1YKnOCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFIPnSvRpf/CNuRtVPyz9yN/gbeOuXoPXVEKxmds0T0AA9tYmR
	3+En1P1N3wK/37nYBvU6a74IeCk+vTc7C//MpD02Tz2H9La06TzM3hfp
X-Gm-Gg: AYBFou3gnedH2HRLxsVxSgLUZe+tIb1fMbjqDN1CapDfoXztnISH52bAR33QfPOOAk2
	H/D2SSxc5Y1n0D5mQCenW3H+pu2BoYkOllLqr8/1Zi2pxvumQO5t07UVFke+43Uo48fXOj+LQKO
	OV4wizm3s+uXV0MuE+n+crkxCQi9kww0WqL6bfSBa3GWOFU7bV80F12wF70t6Ig7VzNrpBaHro+
	22rZbPsgregPfrWuXUjHVANl//5cRRhVBmaadvfrUdiK/fmDONd4AkJaRrD5aVqXon5Tcj+enfI
	beigsbPq4I8ePT5L6c3RexpqoAZRp2i3OSfbZ26Hdi9CQvVn54FM1WVdfviEpMdj50UjEiLfdRg
	Q2AJuXzZVSz63l4rwSPsyCChZ8Fj1RlkkqKkZrIxVcV+Y9MtEe/KIOym/djVlk9Uq8Dr2ohcy5H
	7hEwlWAEzr45sGo3kQdp2Mr1DMJXR1rtOUJ54g2sG2sLE57pU7TLf+BylPMrJSI7czuSwvRHlXs
	ksBUoJ97FkFGHm3s5+RUbh7eJZN0BflpEJfm9SbgV6Ree4HTHF6Us7GTuRXga1TvWdLQMmrS2nS
	peVp9Ib6gQfapwJ5/RWMmUGggpt4JqE=
X-Received: by 2002:a05:6102:e07:b0:7c1:7ca9:94bf with SMTP id ada2fe7eead31-7cc369ba207mr2581728137.19.1792431973660;
        Mon, 19 Oct 2026 10:46:13 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:12 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/13] ALSA: jockey3: Start the bulk streams
Date: Mon, 19 Oct 2026 13:44:34 -0400
Message-ID: <20261019174445.1931263-3-fvdpol@gmail.com>
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

Bring up the transport: program the device to 44.1 kHz, set its
streaming bit, and keep a ring of bulk URBs running on all three
endpoints for as long as the device is bound.

 - EP 0x05 OUT carries playback packets. Each packet reserves a slot
   for one MIDI OUT byte, followed by a sync byte and padding.
 - EP 0x86 IN carries capture packets.
 - EP 0x83 IN carries MIDI input.

The streams are not started and stopped around PCM use. MIDI OUT rides
in the playback packets, and the device expects a continuous packet
stream. Later patches therefore only change what goes into and comes out
of the packets. For now the playback packets carry silence and the idle
MIDI byte, and whatever arrives on the two IN endpoints is discarded.

A transport error does not disable a stream at once. The completion
handlers resubmit until JOCKEY3_MAX_URB_ERRORS consecutive errors have
been seen, then give up on that direction.

jockey3_stop_urbs() fences the completion handlers before it kills the
URBs, so a handler cannot put a URB back on an anchor that is being
drained. The "Locking" comment introduces the three spinlocks involved.

ploytec_proto.c gains the rate and streaming requests. The vendor
drivers program the rate in two shapes, one for a cold start and one for
a change on a running device. Both are added here because they are one
sequence; the second gets its caller when rate switching is added.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/jockey3.c       | 799 +++++++++++++++++++++++++++++-
 sound/usb/jockey3/ploytec_proto.c | 155 ++++++
 sound/usb/jockey3/ploytec_proto.h |  21 +
 3 files changed, 962 insertions(+), 13 deletions(-)

diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index 940f5a5b7c653..351612b1fbe33 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/types.h>
+#include <linux/atomic.h>
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/slab.h>
@@ -70,6 +71,10 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *   a reserved slot of every packet (see PLOYTEC_MIDI_OUT_OFFSET)
  * - EP 0x86 IN:  PCM capture
  * - EP 0x83 IN:  MIDI input
+ *
+ * URBs run free for the lifetime of the device rather than being started and
+ * stopped around PCM use: the playback stream must keep flowing because it
+ * carries MIDI OUT, and the device expects a continuous packet stream.
  */
 
 /**
@@ -88,11 +93,11 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *
  * - jockey3_disconnect() does everything that must happen while the device is
  *   still there: latch JOCKEY3_FLAG_DISCONNECTED (for either interface, since
- *   the core takes them down one at a time), release interface 1, and hand the
- *   card to snd_card_free_when_closed().
+ *   the core takes them down one at a time), kill the URBs, release
+ *   interface 1, and hand the card to snd_card_free_when_closed().
  *
  * - jockey3_card_free(), reached through card->private_free once the last file
- *   descriptor is closed, frees the transfer buffer and gives the card slot
+ *   descriptor is closed, frees the buffers and URBs and gives the card slot
  *   back. It runs arbitrarily long after the disconnect and must attempt no
  *   USB operation, though the objects themselves stay referenced until it
  *   returns; see jockey3_free_resources().
@@ -106,6 +111,43 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * open even there.
  */
 
+/**
+ * DOC: Locking
+ *
+ * There are three locks, all IRQ-safe leaf spinlocks: playback.lock,
+ * capture.lock and midi_lock. They are never nested inside one another;
+ * anything that needs more than one takes them in sequence, not nested.
+ */
+
+#define JOCKEY3_N_URBS 8
+
+/* Consecutive URB transport errors tolerated before a direction is given up on */
+#define JOCKEY3_MAX_URB_ERRORS 8
+
+/**
+ * struct jockey3_pcm_urb_stream - per-direction PCM streaming state
+ * @anchor: anchor holding the submitted URBs, for stop/kill
+ * @urbs: the URB ring
+ * @bufs: transfer buffer for each URB
+ * @urbs_in_flight: number of submitted URBs; diagnostic, must reach 0 after a stop
+ * @lock: protects the fields marked "@lock" below; IRQ-safe leaf
+ * @stopping: set by jockey3_stop_urbs() before the anchor is killed, cleared by
+ *	jockey3_start_urbs(); @lock. Tested by the completion handler inside the
+ *	same critical section that anchors and resubmits, so a callback can never
+ *	re-anchor a URB after the kill has drained the anchor.
+ * @consec_errors: consecutive URB transport errors; @lock. Reset on any
+ *	successful completion and by jockey3_start_urbs().
+ */
+struct jockey3_pcm_urb_stream {
+	struct usb_anchor anchor;
+	struct urb *urbs[JOCKEY3_N_URBS];
+	unsigned char *bufs[JOCKEY3_N_URBS];
+	atomic_t urbs_in_flight;
+	spinlock_t lock;	/* protects this stream's state; IRQ-safe leaf */
+	bool stopping;
+	unsigned int consec_errors;
+};
+
 /**
  * struct jockey3_chip - per-device driver state
  * @card: the ALSA card; read-only after probe
@@ -118,6 +160,13 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * @xfer_buf: bounce buffer for EP0 control transfers, USB_XFER_BUF_SIZE bytes.
  * @flags: JOCKEY3_FLAG_* bits, atomic bitops
  * @dev_idx: card slot held in jockey3_devices_used
+ * @midi_in_urb: the single MIDI IN URB; not anchored, killed directly
+ * @midi_in_buf: transfer buffer for @midi_in_urb
+ * @midi_lock: protects the MIDI fields; IRQ-safe leaf
+ * @midi_stopping: see jockey3_pcm_urb_stream.stopping; @midi_lock
+ * @midi_consec_errors: consecutive MIDI IN URB errors; @midi_lock
+ * @playback: playback streaming state
+ * @capture: capture streaming state
  */
 struct jockey3_chip {
 	struct snd_card *card;
@@ -127,6 +176,17 @@ struct jockey3_chip {
 	unsigned char *xfer_buf;
 	unsigned long flags;
 	unsigned int dev_idx;
+
+	/* MIDI Path */
+	struct urb *midi_in_urb;
+	unsigned char *midi_in_buf;
+	spinlock_t midi_lock;	/* protects the MIDI fields; IRQ-safe leaf */
+	bool midi_stopping;
+	unsigned int midi_consec_errors;
+
+	/* PCM urb streams */
+	struct jockey3_pcm_urb_stream playback;
+	struct jockey3_pcm_urb_stream capture;
 };
 
 static struct usb_driver jockey3_driver;
@@ -179,6 +239,564 @@ static inline bool jockey3_is_disconnected(const struct jockey3_chip *chip)
 	return test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
 }
 
+enum jockey3_urb_state {
+	JOCKEY3_URB_OK,		/* completed normally */
+	JOCKEY3_URB_STOPPED,	/* teardown in progress; return without resubmitting */
+	JOCKEY3_URB_ERROR,	/* transport error, potentially transient */
+};
+
+static inline enum jockey3_urb_state jockey3_urb_check(const struct urb *urb)
+{
+	if (likely(urb->status == 0))
+		return JOCKEY3_URB_OK;
+
+	if (urb->status == -ENOENT || urb->status == -ECONNRESET || urb->status == -ESHUTDOWN)
+		return JOCKEY3_URB_STOPPED;
+
+	return JOCKEY3_URB_ERROR;
+}
+
+/**
+ * jockey3_warn_unexpected_stop() - report a URB that someone else cancelled
+ * @chip: driver state
+ * @stopping: whether this direction's teardown fence was set
+ * @status: the urb->status that retired the URB
+ * @type: direction name, for the log message
+ *
+ * -ENOENT, -ECONNRESET and -ESHUTDOWN normally mean the driver killed the URB
+ * itself, and jockey3_urb_check() maps them to JOCKEY3_URB_STOPPED on that
+ * assumption. Nothing verifies it: the USB core flushes an endpoint's URBs from
+ * usb_disable_endpoint(), so an alt-setting change or an endpoint teardown
+ * started anywhere else retires the whole ring by the same route, and every URB
+ * of the direction would return here without a word.
+ *
+ * A physical unplug arrives here too and is not worth reporting.
+ * usb_disconnect() moves the device to USB_STATE_NOTATTACHED before unbinding
+ * the interfaces, so URBs that complete ahead of jockey3_disconnect() are
+ * recognized by that rather than mistaken for an unexplained teardown.
+ *
+ * This is defensive. No failure observed so far has been traced to this path.
+ */
+static void jockey3_warn_unexpected_stop(struct jockey3_chip *chip, bool stopping,
+					 int status, const char *type)
+{
+	if (stopping || jockey3_is_disconnected(chip))
+		return;
+
+	if (chip->dev->state == USB_STATE_NOTATTACHED)
+		return;
+
+	/* Ratelimited: a whole ring of URBs retires together */
+	dev_warn_ratelimited(&chip->intf0->dev,
+			     "%s URB cancelled without a driver-initiated stop: %d\n",
+			     type, status);
+}
+
+/**
+ * jockey3_err_device_gone() - did the device simply leave?
+ * @err: a transfer's return value
+ *
+ * Keyed on the error code, not on jockey3_is_disconnected(): a failed reset
+ * also leaves the device %USB_STATE_NOTATTACHED and sets that flag on its way
+ * to unbinding, and that one is a fault worth logging.
+ *
+ * Return: true if @err means the device is gone rather than misbehaving.
+ */
+static bool jockey3_err_device_gone(int err)
+{
+	return err == -ENODEV || err == -ESHUTDOWN;
+}
+
+/*
+ * An unplug fails every in-flight URB's resubmit at once, so demote that case
+ * as the submit and rate paths do. Log level only: @consec_errors comes from
+ * jockey3_urb_error_give_up() and the completion status, not from here.
+ */
+static void jockey3_resubmit_failed(struct jockey3_chip *chip, int err, const char *what)
+{
+	if (jockey3_err_device_gone(err)) {
+		dev_dbg(&chip->intf0->dev,
+			"Not resubmitting the %s URB: device is gone (%d)\n", what, err);
+		return;
+	}
+
+	dev_err(&chip->intf0->dev, "Failed to resubmit %s URB: %d\n", what, err);
+}
+
+/**
+ * jockey3_urb_error_give_up() - account for a URB transport error
+ * @chip: driver state
+ * @urb_stream: the affected direction
+ * @status: the urb->status that was seen
+ * @type: direction name, for log messages
+ *
+ * Accounts for a transport error (-EPROTO, -EPIPE, -EOVERFLOW, -ETIME, ...).
+ *
+ * These are frequently transient -- marginal cabling and some host controllers
+ * produce them routinely -- so a single one must not disable the card. Keep
+ * resubmitting while the consecutive count stays below JOCKEY3_MAX_URB_ERRORS;
+ * beyond that, stop feeding this direction.
+ *
+ * Return: true if the caller should give up and not resubmit.
+ */
+static bool jockey3_urb_error_give_up(struct jockey3_chip *chip,
+				      struct jockey3_pcm_urb_stream *urb_stream,
+				      int status, const char *type)
+{
+	unsigned int errors;
+	bool crossed_limit;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		errors = ++urb_stream->consec_errors;
+		/*
+		 * The increment and this test share one critical section, so
+		 * exactly one caller observes the transition even though up to
+		 * JOCKEY3_N_URBS completions arrive together.
+		 */
+		crossed_limit = errors == JOCKEY3_MAX_URB_ERRORS;
+	}
+
+	/*
+	 * Already given up. When the device goes away every one of the
+	 * JOCKEY3_N_URBS in-flight URBs completes with an error, so without this
+	 * the limit would be re-reported once per URB (and the stream stopped
+	 * repeatedly). Report the transition only.
+	 */
+	if (errors > JOCKEY3_MAX_URB_ERRORS)
+		return true;
+
+	dev_err_ratelimited(&chip->intf0->dev, "%s URB error: %d (%u consecutive)\n",
+			    type, status, errors);
+
+	if (!crossed_limit)
+		return false;
+
+	dev_err(&chip->intf0->dev,
+		"%s stopped after %u consecutive URB errors; deferring recovery\n",
+		type, errors);
+
+	return true;
+}
+
+static void jockey3_capture_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->capture;
+	bool data_valid = true;
+	bool stopping;
+	int ret;
+
+	atomic_dec(&urb_stream->urbs_in_flight);
+
+	switch (jockey3_urb_check(urb)) {
+	case JOCKEY3_URB_STOPPED:
+		scoped_guard(spinlock_irqsave, &urb_stream->lock)
+			stopping = urb_stream->stopping;
+		jockey3_warn_unexpected_stop(chip, stopping, urb->status, "Capture");
+		return;
+	case JOCKEY3_URB_ERROR:
+		if (jockey3_urb_error_give_up(chip, urb_stream, urb->status, "Capture"))
+			return;
+		/* Transient: resubmit, but this buffer holds no usable data */
+		data_valid = false;
+		break;
+	case JOCKEY3_URB_OK:
+		break;
+	}
+
+	if (unlikely(jockey3_is_disconnected(chip)))
+		return;
+
+	ret = 0;
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (data_valid)
+			urb_stream->consec_errors = 0;
+
+		/*
+		 * Keep resubmitting the URB while the interface is alive. The
+		 * 'stopping' test and the anchor+submit below must stay in this
+		 * one critical section: that is what stops a URB being re-added
+		 * to an anchor jockey3_stop_urbs() has already drained.
+		 */
+		if (!urb_stream->stopping && !jockey3_is_disconnected(chip)) {
+			atomic_inc(&urb_stream->urbs_in_flight);
+			usb_anchor_urb(urb, &urb_stream->anchor);
+			ret = usb_submit_urb(urb, GFP_ATOMIC);
+			if (ret < 0) {
+				atomic_dec(&urb_stream->urbs_in_flight);
+				usb_unanchor_urb(urb);
+			}
+		}
+	}
+	if (ret < 0)
+		jockey3_resubmit_failed(chip, ret, "capture");
+}
+
+/*
+ * Prime a freshly allocated playback buffer so the first URB, which is
+ * submitted before any completion handler has run, carries a valid idle
+ * packet. The buffer comes from kzalloc(), so the sample area and the
+ * trailing gap are already silent.
+ */
+static void jockey3_init_out_packet(u8 *buf)
+{
+	buf[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+	buf[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+}
+
+static void jockey3_playback_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->playback;
+	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
+	bool data_valid = true;
+	bool stopping;
+	int i, ret;
+
+	atomic_dec(&urb_stream->urbs_in_flight);
+
+	switch (jockey3_urb_check(urb)) {
+	case JOCKEY3_URB_STOPPED:
+		scoped_guard(spinlock_irqsave, &urb_stream->lock)
+			stopping = urb_stream->stopping;
+		jockey3_warn_unexpected_stop(chip, stopping, urb->status, "Playback");
+		return;
+	case JOCKEY3_URB_ERROR:
+		if (jockey3_urb_error_give_up(chip, urb_stream, urb->status, "Playback"))
+			return;
+		data_valid = false;
+		break;
+	case JOCKEY3_URB_OK:
+		break;
+	}
+
+	if (unlikely(jockey3_is_disconnected(chip)))
+		return;
+
+	/*
+	 * Every packet reserves one slot for a MIDI OUT byte. Nothing feeds it
+	 * yet, so it carries the idle byte.
+	 */
+	buf[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+
+	/* Ploytec Sync byte and gap padding */
+	buf[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+	for (i = PLOYTEC_SYNC_BYTE_OFFSET + 1; i < PLOYTEC_PKT_SIZE; i++)
+		buf[i] = 0x00;
+
+	ret = 0;
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (data_valid)
+			urb_stream->consec_errors = 0;
+
+		/*
+		 * Keep resubmitting the URB while the interface is alive. The
+		 * 'stopping' test and the anchor+submit below must stay in this
+		 * one critical section: that is what stops a URB being re-added
+		 * to an anchor jockey3_stop_urbs() has already drained.
+		 */
+		if (!urb_stream->stopping && !jockey3_is_disconnected(chip)) {
+			atomic_inc(&urb_stream->urbs_in_flight);
+			usb_anchor_urb(urb, &urb_stream->anchor);
+			ret = usb_submit_urb(urb, GFP_ATOMIC);
+			if (ret < 0) {
+				atomic_dec(&urb_stream->urbs_in_flight);
+				usb_unanchor_urb(urb);
+			}
+		}
+	}
+	if (ret < 0)
+		jockey3_resubmit_failed(chip, ret, "playback");
+}
+
+static void jockey3_midi_in_callback(struct urb *urb)
+{
+	struct jockey3_chip *chip = urb->context;
+	unsigned int errors;
+	bool stopping;
+	int ret;
+
+	switch (jockey3_urb_check(urb)) {
+	case JOCKEY3_URB_STOPPED:
+		scoped_guard(spinlock_irqsave, &chip->midi_lock)
+			stopping = chip->midi_stopping;
+		jockey3_warn_unexpected_stop(chip, stopping, urb->status, "MIDI IN");
+		return;
+	case JOCKEY3_URB_ERROR:
+		scoped_guard(spinlock_irqsave, &chip->midi_lock)
+			errors = ++chip->midi_consec_errors;
+
+		/* Already given up; see jockey3_urb_error_give_up() */
+		if (errors > JOCKEY3_MAX_URB_ERRORS)
+			return;
+
+		dev_err_ratelimited(&chip->intf0->dev,
+				    "MIDI IN URB error: %d (%u consecutive)\n",
+				    urb->status, errors);
+		if (errors == JOCKEY3_MAX_URB_ERRORS) {
+			dev_err(&chip->intf0->dev,
+				"MIDI IN stopped after %u consecutive URB errors\n", errors);
+			return;
+		}
+		break;
+	case JOCKEY3_URB_OK:
+		scoped_guard(spinlock_irqsave, &chip->midi_lock)
+			chip->midi_consec_errors = 0;
+		break;
+	}
+
+	if (unlikely(jockey3_is_disconnected(chip)))
+		return;
+
+	/*
+	 * Nothing consumes the payload yet, but the endpoint is kept polled: the
+	 * device is only ever run with all three bulk endpoints serviced.
+	 */
+	ret = 0;
+	scoped_guard(spinlock_irqsave, &chip->midi_lock) {
+		if (!chip->midi_stopping && !jockey3_is_disconnected(chip))
+			ret = usb_submit_urb(urb, GFP_ATOMIC);
+	}
+	if (ret < 0)
+		jockey3_resubmit_failed(chip, ret, "MIDI IN");
+}
+
+/**
+ * jockey3_stop_urbs() - stop all PCM and MIDI URBs
+ * @chip: driver state
+ *
+ * Fences the completion handlers, then kills every URB. Sleeps, so it must not
+ * be called from atomic context. On return no completion handler is running and
+ * none can resubmit.
+ */
+static void jockey3_stop_urbs(struct jockey3_chip *chip)
+{
+	dev_dbg(&chip->intf0->dev, "Stopping all URBs\n");
+
+	/*
+	 * Fence the completion handlers before killing anything. Each 'stopping'
+	 * store pairs with the test the matching handler makes while holding the
+	 * same lock it uses to anchor and resubmit, so once these guards are
+	 * released no handler can add a URB back to an anchor we are about to
+	 * drain. The spinlocks provide the required ordering; no explicit barrier
+	 * is needed.
+	 */
+	scoped_guard(spinlock_irqsave, &chip->playback.lock)
+		chip->playback.stopping = true;
+	scoped_guard(spinlock_irqsave, &chip->capture.lock)
+		chip->capture.stopping = true;
+	scoped_guard(spinlock_irqsave, &chip->midi_lock)
+		chip->midi_stopping = true;
+
+	/*
+	 * usb_kill_urb()/usb_kill_anchored_urbs() do not return until the
+	 * completion handler of each URB has finished, so no callback can still
+	 * be running once these return.
+	 *
+	 * Worth spelling out for the anchored form, which keeps getting read as
+	 * a use-after-free: __usb_hcd_giveback_urb() does unanchor before
+	 * urb->complete(), so the kill loop cannot find a running handler on the
+	 * list. anchor->suspend_wakeups covers it -- raised before the unanchor
+	 * and dropped after complete() returns, and usb_kill_anchored_urbs()
+	 * drains until usb_anchor_check_wakeup() sees it zero.
+	 */
+	usb_kill_urb(chip->midi_in_urb);
+	usb_kill_anchored_urbs(&chip->playback.anchor);
+	usb_kill_anchored_urbs(&chip->capture.anchor);
+
+	/* after killing the URBs there will be no in-flight requests anymore since the callback
+	 * function has been called as part of the shutdown. The number of in-flight URBs should
+	 * therefore be zero at this point. Log an inconsistency error if not.
+	 */
+	if (atomic_read(&chip->playback.urbs_in_flight) != 0)
+		dev_err(&chip->intf0->dev, "Inconsistent URB in-flight count: playback=%d != 0\n",
+			atomic_read(&chip->playback.urbs_in_flight));
+	if (atomic_read(&chip->capture.urbs_in_flight) != 0)
+		dev_err(&chip->intf0->dev, "Inconsistent URB in-flight count: capture=%d != 0\n",
+			atomic_read(&chip->capture.urbs_in_flight));
+}
+
+/*
+ * Demote an unplug. -%ENOENT stays loud: the endpoints were disabled while the
+ * driver is still bound, which takes a device reset to undo.
+ *
+ * @slot is the ring slot, or -1 for the single MIDI IN URB.
+ */
+static void jockey3_submit_failed(struct jockey3_chip *chip, int err,
+				  const char *what, int slot)
+{
+	if (jockey3_err_device_gone(err)) {
+		if (slot < 0)
+			dev_dbg(&chip->intf0->dev,
+				"Not submitting the %s URB: device is gone (%d)\n", what, err);
+		else
+			dev_dbg(&chip->intf0->dev,
+				"Not submitting %s URB %d: device is gone (%d)\n",
+				what, slot, err);
+		return;
+	}
+
+	if (slot < 0)
+		dev_err(&chip->intf0->dev, "Failed to submit the %s URB: %d\n", what, err);
+	else
+		dev_err(&chip->intf0->dev, "Failed to submit %s URB %d: %d\n",
+			what, slot, err);
+}
+
+/**
+ * jockey3_start_urbs() - submit all PCM and MIDI URBs
+ * @chip: driver state
+ *
+ * Clears the stop fences and error budgets, then submits the full URB ring for
+ * both directions plus the MIDI IN URB. Uses GFP_KERNEL, so process context
+ * only. A failure to submit one URB does not prevent the others being tried.
+ *
+ * The return value must be checked. Only a completion handler resubmits a URB,
+ * so a ring that comes up short stays short: nothing retries the URBs that
+ * failed here, and the direction runs at reduced depth for as long as the
+ * device stays bound, with no bookkeeping that would ever notice.
+ *
+ * Return: 0 on success, or the first submit error encountered.
+ */
+static int jockey3_start_urbs(struct jockey3_chip *chip)
+{
+	int i, ret, first_err = 0;
+	int n_playback = 0, n_capture = 0;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	dev_dbg(&chip->intf0->dev, "Starting all URBs\n");
+
+	/*
+	 * Clear the error budget as well: a stream that was given up on must get
+	 * a fresh JOCKEY3_MAX_URB_ERRORS allowance, otherwise the first error
+	 * after a restart would immediately exceed the stale count and give up
+	 * again with no retries.
+	 */
+	scoped_guard(spinlock_irqsave, &chip->playback.lock) {
+		chip->playback.stopping = false;
+		chip->playback.consec_errors = 0;
+	}
+	scoped_guard(spinlock_irqsave, &chip->capture.lock) {
+		chip->capture.stopping = false;
+		chip->capture.consec_errors = 0;
+	}
+	scoped_guard(spinlock_irqsave, &chip->midi_lock) {
+		chip->midi_stopping = false;
+		chip->midi_consec_errors = 0;
+	}
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		atomic_inc(&chip->playback.urbs_in_flight);
+		usb_anchor_urb(chip->playback.urbs[i], &chip->playback.anchor);
+		ret = usb_submit_urb(chip->playback.urbs[i], GFP_KERNEL);
+		if (ret < 0) {
+			atomic_dec(&chip->playback.urbs_in_flight);
+			usb_unanchor_urb(chip->playback.urbs[i]);
+			jockey3_submit_failed(chip, ret, "playback", i);
+			if (!first_err)
+				first_err = ret;
+		} else {
+			n_playback++;
+		}
+
+		atomic_inc(&chip->capture.urbs_in_flight);
+		usb_anchor_urb(chip->capture.urbs[i], &chip->capture.anchor);
+		ret = usb_submit_urb(chip->capture.urbs[i], GFP_KERNEL);
+		if (ret < 0) {
+			atomic_dec(&chip->capture.urbs_in_flight);
+			usb_unanchor_urb(chip->capture.urbs[i]);
+			jockey3_submit_failed(chip, ret, "capture", i);
+			if (!first_err)
+				first_err = ret;
+		} else {
+			n_capture++;
+		}
+	}
+	ret = usb_submit_urb(chip->midi_in_urb, GFP_KERNEL);
+	if (ret < 0) {
+		jockey3_submit_failed(chip, ret, "MIDI IN", -1);
+		if (!first_err)
+			first_err = ret;
+	}
+
+	if (n_playback < JOCKEY3_N_URBS || n_capture < JOCKEY3_N_URBS) {
+		if (jockey3_err_device_gone(first_err))
+			dev_dbg(&chip->intf0->dev,
+				"Started only %d/%d playback and %d/%d capture URBs; device is gone\n",
+				n_playback, JOCKEY3_N_URBS, n_capture, JOCKEY3_N_URBS);
+		else
+			dev_err(&chip->intf0->dev,
+				"Started only %d/%d playback and %d/%d capture URBs; ring will not refill\n",
+				n_playback, JOCKEY3_N_URBS, n_capture, JOCKEY3_N_URBS);
+	}
+
+	return first_err;
+}
+
+/*
+ * Log a failed rate-programming step at the severity it deserves: an unplug
+ * is not an error.
+ */
+static void jockey3_rate_step_failed(struct jockey3_chip *chip, int err, const char *what)
+{
+	if (jockey3_err_device_gone(err)) {
+		dev_dbg(&chip->intf0->dev, "%s: device is gone (%d)\n", what, err);
+		return;
+	}
+
+	dev_err(&chip->intf0->dev, "%s: %d\n", what, err);
+}
+
+static int jockey3_set_rate(struct jockey3_chip *chip, unsigned int rate, bool cold_init)
+{
+	int ret;
+	u32 current_hw_rate;
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	dev_dbg(&chip->intf0->dev, "Setting rate to %u Hz\n", rate);
+
+	ret = ploytec_initialize_device(chip->intf0, chip->xfer_buf, !cold_init, NULL);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to initialize device to change rate");
+		return ret;
+	}
+
+	ret = ploytec_get_rate(chip->intf0, chip->xfer_buf, PLOYTEC_RATE_IDX_DEVICE,
+			       &current_hw_rate);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to read current hardware rate");
+		return ret;
+	}
+	dev_dbg(&chip->intf0->dev, "Current hardware rate: %u Hz\n", current_hw_rate);
+
+	/*
+	 * Program the rate even when the device already reports it. Skipping the
+	 * write on a match would silently elide it during probe every time,
+	 * since initialization always asks for 44100 Hz and that is also the
+	 * device's power-on default. The write evidently does more than set a
+	 * frequency; no vendor initialization omits it. See
+	 * re/usb/init_timing_comparison.md.
+	 */
+	dev_dbg(&chip->intf0->dev, "Setting hardware rate: %u Hz\n", rate);
+	ret = ploytec_set_rate(chip->intf0, chip->xfer_buf, rate, cold_init);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to set rate");
+		return ret;
+	}
+	ret = ploytec_start_streaming(chip->intf0, chip->xfer_buf);
+	if (ret < 0) {
+		jockey3_rate_step_failed(chip, ret, "Failed to start streaming after rate change");
+		return ret;
+	}
+
+	dev_dbg(&chip->intf0->dev, "Rate set OK\n");
+	return 0;
+}
+
 static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version)
 {
 	int ret;
@@ -192,6 +810,12 @@ static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version
 		return ret;
 	}
 
+	ret = ploytec_start_streaming(chip->intf0, chip->xfer_buf);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Ploytec failed to start streaming: %d\n", ret);
+		return ret;
+	}
+
 	dev_dbg(&chip->intf0->dev, "Ploytec initialized successfully\n");
 	return 0;
 }
@@ -199,6 +823,7 @@ static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version
 static int jockey3_initialize(struct jockey3_chip *chip, int model)
 {
 	int ret;
+	int rate;
 	u32 fw_version = 0;
 
 	/*
@@ -245,6 +870,24 @@ static int jockey3_initialize(struct jockey3_chip *chip, int model)
 		 (fw_version >> 16) & 0xFF, (fw_version >> 8) & 0xFF,
 		 (fw_version >> 4) & 0x0F, fw_version & 0x0F);
 
+	rate = 44100;	// default sample rate at power-on
+	ret = jockey3_set_rate(chip, rate, true);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Fail the probe: a device that cannot accept its URBs has no working
+	 * audio and no MIDI OUT.
+	 */
+	ret = jockey3_start_urbs(chip);
+	if (ret < 0) {
+		dev_err(&chip->intf0->dev, "Failed to start URBs during initialization: %d\n",
+			ret);
+		return ret;
+	}
+
+	dev_dbg(&chip->intf0->dev, "Initialization complete.\n");
+
 	return 0;
 }
 
@@ -253,7 +896,7 @@ static int jockey3_initialize(struct jockey3_chip *chip, int model)
  * back. NULL-safe throughout, so it is correct at any point of a half-built
  * probe as well as at the end of the device's life.
  *
- * One rule governs what may go in here, stemming from where it runs:
+ * Two rules govern what may go in here, both stemming from where it runs:
  * card->private_free, i.e. after the last file descriptor on the card is
  * closed, which on an unplug is arbitrarily long after jockey3_disconnect().
  *
@@ -262,9 +905,21 @@ static int jockey3_initialize(struct jockey3_chip *chip, int model)
  *    they are unbound by now and the hardware may be gone. Reading is safe,
  *    talking is not. The dev_dbg(&chip->intf0->dev, ...) idiom is avoided too:
  *    the interface is no longer ours, so the attribution would be wrong.
+ *  - The URBs must already be dead. jockey3_disconnect() kills them, and so
+ *    does probe's error path, both before the card is released.
  */
 static void jockey3_free_resources(struct jockey3_chip *chip)
 {
+	int i;
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		usb_free_urb(chip->playback.urbs[i]);
+		kfree(chip->playback.bufs[i]);
+		usb_free_urb(chip->capture.urbs[i]);
+		kfree(chip->capture.bufs[i]);
+	}
+	usb_free_urb(chip->midi_in_urb);
+	kfree(chip->midi_in_buf);
 	kfree(chip->xfer_buf);
 
 	jockey3_release_slot(chip->dev_idx);
@@ -280,6 +935,74 @@ static void jockey3_card_free(struct snd_card *card)
 	jockey3_free_resources(card->private_data);
 }
 
+static int jockey3_init_midi_urb(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+
+	chip->midi_in_buf = kmalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+	if (!chip->midi_in_buf)
+		return -ENOMEM;
+
+	chip->midi_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!chip->midi_in_urb)
+		return -ENOMEM;
+
+	usb_fill_bulk_urb(chip->midi_in_urb, dev,
+			  usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_MIDI_IN),
+			  chip->midi_in_buf, PLOYTEC_PKT_SIZE,
+			  jockey3_midi_in_callback, chip);
+
+	return 0;
+}
+
+static int jockey3_init_playback_urbs(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+	int i;
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->playback.bufs[i] = kzalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+		if (!chip->playback.bufs[i])
+			return -ENOMEM;
+
+		chip->playback.urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
+		if (!chip->playback.urbs[i])
+			return -ENOMEM;
+
+		jockey3_init_out_packet(chip->playback.bufs[i]);
+
+		usb_fill_bulk_urb(chip->playback.urbs[i], dev,
+				  usb_sndbulkpipe(dev, PLOYTEC_EP_NUM_PCM_OUT),
+				  chip->playback.bufs[i], PLOYTEC_PKT_SIZE,
+				  jockey3_playback_callback, chip);
+	}
+
+	return 0;
+}
+
+static int jockey3_init_capture_urbs(struct jockey3_chip *chip)
+{
+	struct usb_device *dev = chip->dev;
+	int i;
+
+	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->capture.bufs[i] = kzalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+		if (!chip->capture.bufs[i])
+			return -ENOMEM;
+
+		chip->capture.urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
+		if (!chip->capture.urbs[i])
+			return -ENOMEM;
+
+		usb_fill_bulk_urb(chip->capture.urbs[i], dev,
+				  usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_PCM_IN),
+				  chip->capture.bufs[i], PLOYTEC_PKT_SIZE,
+				  jockey3_capture_callback, chip);
+	}
+
+	return 0;
+}
+
 static bool jockey3_has_bulk_endpoint(struct usb_interface *intf, u8 ep_num, bool out)
 {
 	struct usb_host_interface *alts;
@@ -403,11 +1126,24 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	chip->intf1 = usb_get_intf(intf1);
 	chip->flags = 0;
 
+	spin_lock_init(&chip->midi_lock);
+	spin_lock_init(&chip->playback.lock);
+	spin_lock_init(&chip->capture.lock);
+
+	init_usb_anchor(&chip->playback.anchor);
+	init_usb_anchor(&chip->capture.anchor);
+
 	/*
 	 * From here on every failure goes to err_free_card, and the card slot is
 	 * given back by jockey3_free_resources() rather than by err_free_idx.
 	 */
 	card->private_free = jockey3_card_free;
+	/*
+	 * card->private_data is zeroed by snd_card_new(), but be explicit:
+	 * this one is load-bearing for the stop bookkeeping.
+	 */
+	atomic_set(&chip->playback.urbs_in_flight, 0);
+	atomic_set(&chip->capture.urbs_in_flight, 0);
 
 	chip->xfer_buf = kmalloc(USB_XFER_BUF_SIZE, GFP_KERNEL);
 	if (!chip->xfer_buf) {
@@ -415,6 +1151,18 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 		goto err_free_card;
 	}
 
+	ret = jockey3_init_midi_urb(chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = jockey3_init_playback_urbs(chip);
+	if (ret < 0)
+		goto err_free_card;
+
+	ret = jockey3_init_capture_urbs(chip);
+	if (ret < 0)
+		goto err_free_card;
+
 	/* Interface 1 owns the capture endpoint (0x86) */
 	ret = usb_driver_claim_interface(&jockey3_driver, intf1, chip);
 	if (ret < 0)
@@ -438,10 +1186,11 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 
 err_free_card:
 	/*
-	 * Same order as jockey3_disconnect(): latch DISCONNECTED, and only then
-	 * let go of interface 1 and the card. All of it is safe on a half-built
-	 * chip -- everything jockey3_free_resources() touches is NULL until it
-	 * is allocated.
+	 * Same order as jockey3_disconnect(): latch DISCONNECTED, kill the URBs,
+	 * and only then let go of interface 1 and the card. All of it is safe on
+	 * a half-built chip -- the locks and anchors are initialized above with
+	 * no failure point between, and everything jockey3_free_resources()
+	 * touches is NULL until it is allocated.
 	 *
 	 * snd_card_free_when_closed() rather than snd_card_free(), as in
 	 * jockey3_disconnect(): snd_card_register() creates the device nodes
@@ -455,6 +1204,7 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	 */
 	usb_set_intfdata(intf, NULL);
 	set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
+	jockey3_stop_urbs(chip);
 	usb_driver_release_interface(&jockey3_driver, intf1);
 	snd_card_free_when_closed(card);
 	return ret;
@@ -470,16 +1220,24 @@ static void jockey3_disconnect(struct usb_interface *intf)
 	struct jockey3_chip *chip = usb_get_intfdata(intf);
 
 	/*
-	 * Latch DISCONNECTED first, and for EITHER interface. The driver is
-	 * bound to both interfaces and the USB core takes them down one at a
-	 * time. Losing either interface means the card is going away regardless
-	 * -- interface 1 owns the capture endpoint -- so there is nothing to
-	 * keep running for.
+	 * Latch DISCONNECTED first, and for EITHER interface.
+	 *
+	 * Doing it for interface 1 as well is what covers the unbind order. The
+	 * driver is bound to both interfaces and the USB core takes them down
+	 * one at a time, calling disconnect() and then usb_disable_interface()
+	 * for each, so whichever goes first has its endpoints flushed while the
+	 * other is still bound. Those URBs come back -ESHUTDOWN through the
+	 * ordinary completion path, and without this they are indistinguishable
+	 * from an endpoint torn down behind the driver's back. Losing either
+	 * interface means the card is going away regardless -- interface 1 owns
+	 * the capture endpoint -- so there is nothing to keep running for.
 	 */
 	if (chip)
 		set_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
 
 	if (chip && intf == chip->intf0) {
+		jockey3_stop_urbs(chip);
+
 		/*
 		 * Release interface 1 here, not from card->private_free: that
 		 * runs when the last file descriptor is closed, by which time
@@ -519,6 +1277,21 @@ MODULE_DEVICE_TABLE(usb, jockey3_ids);
 
 static struct usb_driver jockey3_driver = {
 	.name = "snd-reloop-jockey3",
+	/*
+	 * Tear our own URBs down rather than having the core do it first.
+	 *
+	 * Without this, usb_unbind_interface() calls usb_disable_interface()
+	 * before jockey3_disconnect(), so on an ordinary module unload the whole
+	 * ring retires with -ESHUTDOWN while the driver still believes it is
+	 * running -- indistinguishable, from inside the completion handler, from
+	 * an endpoint torn down behind our back. jockey3_disconnect() already
+	 * kills every URB, which is exactly the contract this flag asks for.
+	 *
+	 * It applies only while the device is still attached; on a physical
+	 * unplug the core kills the URBs first regardless, which is why the
+	 * completion path also tests USB_STATE_NOTATTACHED.
+	 */
+	.soft_unbind = 1,
 	.probe = jockey3_probe,
 	.disconnect = jockey3_disconnect,
 	.id_table = jockey3_ids
diff --git a/sound/usb/jockey3/ploytec_proto.c b/sound/usb/jockey3/ploytec_proto.c
index a14c6af5f9dc8..1067667a27277 100644
--- a/sound/usb/jockey3/ploytec_proto.c
+++ b/sound/usb/jockey3/ploytec_proto.c
@@ -208,3 +208,158 @@ int ploytec_initialize_device(struct usb_interface *intf, void *xfer_buf, bool b
 
 	return ploytec_get_status(intf, xfer_buf, &status);
 }
+
+/**
+ * ploytec_start_streaming - Trigger the device to start streaming
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ *
+ * Reads the status byte and writes it back with the STREAMING bit set. The
+ * write is unconditional, which is the whole point: the device already
+ * reports STREAMING set after a rate change, so a conditional write would
+ * never be issued there at all. Ending a rate change with a second status
+ * read instead left the capture endpoint failing to restart after roughly one
+ * rate change in six, so the write evidently does more than set a bit -- see
+ * re/rate_change_stall.md.
+ *
+ * The vendors do not read the status back afterwards, so neither do we.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_start_streaming(struct usb_interface *intf, void *xfer_buf)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 status;
+	int ret;
+
+	ret = ploytec_get_status(intf, xfer_buf, &status);
+	if (ret < 0)
+		return ret;
+	dev_dbg(&intf->dev, "Start Streaming: Status: 0x%02x\n", status);
+
+	return usb_control_msg_send(dev, 0, PLOYTEC_SET_STATUS, PLOYTEC_SET_STATUS_TYPE,
+				    status | PLOYTEC_STATUS_STREAMING,
+				    0, NULL, 0, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+}
+
+/**
+ * ploytec_get_rate - Read hardware sample rate
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ * @index: wIndex to read from -- PLOYTEC_RATE_IDX_DEVICE before programming,
+ *	PLOYTEC_RATE_IDX_PCM_IN to verify afterwards
+ * @rate: Pointer to store the rate
+ *
+ * The wIndex is not cosmetic. The device answers both forms: the vendor
+ * drivers read the live rate device-wide and always verify against the
+ * capture endpoint.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ploytec_get_rate(struct usb_interface *intf, void *xfer_buf, u16 index, u32 *rate)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	int ret;
+
+	ret = usb_control_msg_recv(dev, 0, PLOYTEC_REQ_GET_RATE, PLOYTEC_REQ_GET_RATE_TYPE,
+				   0x0100, index,
+				   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	*rate = (u32)buf[0] | ((u32)buf[1] << 8) | ((u32)buf[2] << 16);
+	return 0;
+}
+
+/**
+ * ploytec_set_rate - Set hardware sample rate
+ * @intf: USB interface
+ * @xfer_buf: Temporary transfer buffer
+ * @rate: Sample rate in Hz
+ * @cold_init: true when this programs the rate as part of bringing the device
+ *	up, false when it changes the rate of a device already running
+ *
+ * The vendor drivers use two shapes here, and the difference is not cosmetic.
+ * A cold init starts programming the rate after a short gap; a rate change
+ * waits longer, writes once, pauses, then repeats the burst. Both end the
+ * burst on the capture endpoint and verify from it, which is the invariant
+ * that holds across every captured vendor sequence on both platforms; the
+ * write count itself is not load-bearing. The sleeps below stand in for
+ * windows in which the vendor host sends nothing at all -- it is waiting, not
+ * polling. See re/usb/init_timing_comparison.md.
+ *
+ * Return: 0 on success (including when the post-write rate verification
+ * detects a mismatch, which is only logged), negative errno if a control
+ * transfer fails.
+ */
+int ploytec_set_rate(struct usb_interface *intf, void *xfer_buf, u32 rate, bool cold_init)
+{
+	static const u16 burst_index[] = {
+		PLOYTEC_RATE_IDX_PCM_IN,
+		PLOYTEC_RATE_IDX_PCM_OUT,
+		PLOYTEC_RATE_IDX_PCM_IN,
+		PLOYTEC_RATE_IDX_PCM_OUT,
+		PLOYTEC_RATE_IDX_PCM_IN,
+	};
+	struct usb_device *dev = interface_to_usbdev(intf);
+	u8 *buf = xfer_buf;
+	u32 current_hw_rate = 0;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(&intf->dev, "Setting rate %u Hz (%s)\n",
+		rate, cold_init ? "cold init" : "rate change");
+
+	buf[0] = rate & 0xFF;
+	buf[1] = (rate >> 8) & 0xFF;
+	buf[2] = (rate >> 16) & 0xFF;
+
+	if (cold_init) {
+		/* A fresh device gets a short gap and no separate first write. */
+		usleep_range(14000, 15000);
+	} else {
+		/* A rate change waits before touching the rate at all. */
+		usleep_range(50000, 51000);
+
+		ret = usb_control_msg_send(dev, 0, PLOYTEC_SET_RATE, PLOYTEC_SET_RATE_TYPE,
+					   0x0100, PLOYTEC_RATE_IDX_PCM_IN,
+					   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+		if (ret < 0) {
+			dev_err(&intf->dev, "Failed to set rate on EP 0x86: %d\n", ret);
+			return ret;
+		}
+
+		/* Write once, pause, then repeat the burst. */
+		usleep_range(10000, 11000);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(burst_index); i++) {
+		ret = usb_control_msg_send(dev, 0, PLOYTEC_SET_RATE, PLOYTEC_SET_RATE_TYPE,
+					   0x0100, burst_index[i],
+					   buf, 3, PLOYTEC_CTRL_TIMEOUT_MS, GFP_KERNEL);
+		if (ret < 0) {
+			dev_err(&intf->dev, "Failed to set rate on EP 0x%02x: %d\n",
+				burst_index[i], ret);
+			return ret;
+		}
+	}
+
+	if (ploytec_get_rate(intf, xfer_buf, PLOYTEC_RATE_IDX_PCM_IN, &current_hw_rate) == 0) {
+		if (current_hw_rate != rate)
+			dev_warn(&intf->dev, "Rate mismatch! Requested %u Hz, Hardware at %u Hz\n",
+				 rate, current_hw_rate);
+		else
+			dev_dbg(&intf->dev, "Rate verified as %u Hz\n", current_hw_rate);
+	}
+
+	/*
+	 * Every vendor sequence goes quiet between verifying the rate and
+	 * programming the status byte, which is the caller's next step in
+	 * ploytec_start_streaming(). The window does not vary with the rate,
+	 * so there is nothing to scale.
+	 */
+	usleep_range(50000, 51000);
+
+	return 0;
+}
diff --git a/sound/usb/jockey3/ploytec_proto.h b/sound/usb/jockey3/ploytec_proto.h
index 73bd1cf2e1337..76cead5989f42 100644
--- a/sound/usb/jockey3/ploytec_proto.h
+++ b/sound/usb/jockey3/ploytec_proto.h
@@ -32,10 +32,28 @@
 #define PLOYTEC_EP_NUM_MIDI_IN		0x03	// MIDI In (EP 0x83)
 
 /* Protocol Commands */
+#define PLOYTEC_SET_RATE		0x01	// bRequest to set sample rate
+#define PLOYTEC_SET_RATE_TYPE		0x22	// bmRequestType to set sample rate
+#define PLOYTEC_SET_STATUS		0x49	// bRequest to set device status
+#define PLOYTEC_SET_STATUS_TYPE		0x40	// bmRequestType to set device status
 #define PLOYTEC_REQ_STATUS		0x49	// bRequest to get device status
 #define PLOYTEC_REQ_STATUS_TYPE		0xC0	// bmRequestType to get device status
 #define PLOYTEC_REQ_FIRMWARE		0x56	// bRequest to get firmware version
 #define PLOYTEC_REQ_FIRMWARE_TYPE	0xC0	// bmRequestType to get firmware version
+#define PLOYTEC_REQ_GET_RATE		0x81	// bRequest to get current sample rate
+#define PLOYTEC_REQ_GET_RATE_TYPE	0xA2	// bmRequestType to get current sample rate
+
+/*
+ * wIndex values for the rate requests: zero addresses the device as a whole,
+ * an endpoint address addresses one stream. Both forms are needed -- see
+ * re/protocol_analysis.md.
+ */
+#define PLOYTEC_RATE_IDX_DEVICE		0x0000	// device-wide, used before programming
+#define PLOYTEC_RATE_IDX_PCM_IN		(PLOYTEC_EP_NUM_PCM_IN | USB_DIR_IN)	// 0x86
+#define PLOYTEC_RATE_IDX_PCM_OUT	(PLOYTEC_EP_NUM_PCM_OUT)		// 0x05
+
+/* Status Bits (bits 0-4 are observed but not understood, and unused) */
+#define PLOYTEC_STATUS_STREAMING	0x20
 
 /* Timeout for the EP0 control transfers above, in milliseconds */
 #define PLOYTEC_CTRL_TIMEOUT_MS		2000
@@ -51,6 +69,9 @@
  */
 int ploytec_initialize_device(struct usb_interface *intf, void *xfer_buf,
 			      bool bounce_alt0, u32 *fw_version);
+int ploytec_start_streaming(struct usb_interface *intf, void *xfer_buf);
+int ploytec_get_rate(struct usb_interface *intf, void *xfer_buf, u16 index, u32 *rate);
+int ploytec_set_rate(struct usb_interface *intf, void *xfer_buf, u32 rate, bool cold_init);
 int ploytec_get_firmware(struct usb_interface *intf, void *xfer_buf, u32 *fw_version);
 int ploytec_get_status(struct usb_interface *intf, void *xfer_buf, u8 *status);
 bool ploytec_ctrl_ep_unresponsive(int err);
-- 
2.47.3

