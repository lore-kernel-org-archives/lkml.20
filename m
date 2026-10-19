Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431988;
	b=QQfPq6iqxDW+Zv6blnQhVQ3k92660LXMRF1inZqVBqgp0mI1IkWNzO8TFDa/7yoYSvNn
	 8mJ87caTq5mewCwz0GgSYuuBMJFZ/wDNBcclhNU5TLj8IS4i542ZpAJbwZwHog1Hg0a8c
	 L1pKegUs34h5L/xb2HAXqkpd2MEmGgDJjgpng/5zcBhNGXAUz+mgdtadXP7wLh1DmG8Ml
	 MOS1HK8qjGJnfiRvJ2z0iYk8Ue8xEJjYLp22vAgHim2OkGbvM90RmQMXRuyseaQ/k63SO
	 1jGChOTNElGJVbnm14/XPBz/S13xS0mvOByQXRcgaAnEhoX+V0N4yinlckkhwN481mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jkf2p3Yvk86JX0dg/KREj4i5SusGhhmuiwUVlhZfCCI=;
	b=sOSnhwW9nOHL1XBsrSj8Uw/QXFsG7aPeI6VCSmvx0EeAhZy5xGFtLi2PDiNQlI76W9aY
	 pVkXnKW0StUA9SXmQRFksuHiiRFm49jb9dw43MZFLZp4pPEruJ5b3XrViTJ3WvIYIZnQs
	 55jBbKG6Hr6XPZHZrYvSACscNERrZl6YTZKThWPI0D2rV63gk0ICDmn6vDILcRbmJe/PK
	 agYtTkcLyKbTf+1a5hjTLa1Gcwo/3IYXHrm3yorZWjHAssoW0ihp/QVzCgGgWQMUQAfCw
	 rSWPOMvFd/jEZw6TBrH5nzpufjURdxETN1ks5+mICf5e8o1hgkELBudub/xD1QXtFww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X301t+EK;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A560A2623
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12A560A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X301t+EK
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1437960241.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431987; x=1793036787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jkf2p3Yvk86JX0dg/KREj4i5SusGhhmuiwUVlhZfCCI=;
        b=X301t+EKsyNqRx4opKqYt48MLDjEzst8liwu3GyXkUv4vK6e+cAL07Kwq6607YMb5e
         cghucPC6sU/eO82WL3HnYZ1oZrtxVq/TV/xEnMBS6CXZx/nnSHMDoCPlR9dYylVLWZmp
         UAat/dBembiBtyC2UrYeCbtu2XW83Txrz7SJn2WucJrfCFqH0IyNZf/6GNNJmQOzQT6x
         RxUgq5nrLo5kT7SDsECTQ5zzJp0rZuS4Sc2XKh2ua2lf8MWrF42BgyHo+Jrapm12DMUj
         7BTBnZRQS+DxHqmMTDXNy9qcjrD4KkNs/Id6o/4BH4QMGmjgaDMYZvyVm6yzFb4urfhr
         KNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431987; x=1793036787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jkf2p3Yvk86JX0dg/KREj4i5SusGhhmuiwUVlhZfCCI=;
        b=TJwK8Yv15As+/AroKfgI6/ec+S+os53Qjt7zprpG8+kHfYvnnxRYYqKF6vc/Zwy1uf
         f2VcsZ+VbttobdiJ078kR/pyXe7PGHuImJMgSvG1zUdvnDSE2nlaIHSZlqMDobNZ9Zkx
         MJCME+Qb6e4jR+uAz2tUTPkmcqgzW6nBLItHwJ+sKxoIceSrrx1IZMcgQOYXmAmFHXku
         GMMkqBbRLtNWc7dMMbKm+8I3g50rz8tRZmy8PFjIU5PyEKiwW7GrfNKq6KxWXbM2Ezb+
         ZNwExlm0p1DEfn59t0RrRZECZzEtc9ZYNjsWdBM4Ef0Frjf9CVpLyoqr+S5JXDnh36NF
         jNNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFKkQyg5y2Kh8nm6+5uhgUmZt2YfGmJFivZtjPKmS1SeeEjK2s932K25OAK5T1FxNRK1H4/2bydMLCqqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgFaciLcVwptIP+qDd9U2ouMvuW7pBHEK6hBfsjcAV+MdDlj5k
	27d7XKS/yaE7PjBAyFeobIrE3xE692zynyQwuYndfqaRhe6xhTSfHTA2
X-Gm-Gg: AYBFou0P0KYCQ0583ZtBRNnTOJ61agm++XEJbjP4FH44t6yDn7iKTYvykY3SG0GAePU
	lIT4ZlAxZQHA5m6YRJ3TZU7k1zbjP+6KRswRf0bS3Xux6ELc2JD1pQaReWhcQZfcuK3tZqpc6Xo
	JxoibxJFyK/uHlstdVZTeX2+OvtbhxyPboTTJbAKN2ye2V7+bFk1gYiF97gUrqErSrw6cSbFrh0
	kFPygpmuwdh/k9uLJvlc847k3gyj4Zn297zDoOofk9EJzBWEQU2CC/h5+VoyIzJf+/e0DvDlinQ
	1JJRwNH5CKTugQoF7He974BQtPG/EC2PxFDybRjXJzYYzTeaYs55FtXofQRB8O21zAwCvkLivwB
	a+u7fb1yAnoR1aW54OYIQF+mKX8FxSyR0s87dliDqytqrK4XFppE0iiDHIixTA+D6lLiotmwHd7
	g7m/YWUMv0ikzNh9k2R2LASG4QrHlS2+XXWvlHEJm0SB2QlwDbsEhXFQPiVjR9gHEKUhdbi3oiB
	9z35et6XliC58iqifviQIOm6S/m5mOjw2xRy9NOwKankv/6vDbBJhcjC+lH94X3Z0S4V2ZtNFHf
	lcAtK65X6kFK8e7Nd/3CJfCGSGKscCo=
X-Received: by 2002:a05:6102:f0e:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7cc3672e0b9mr2437979137.4.1792431986523;
        Mon, 19 Oct 2026 10:46:26 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:25 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/13] ALSA: jockey3: Coalesce several packets into one URB
Date: Mon, 19 Oct 2026 13:44:39 -0400
Message-ID: <20261019174445.1931263-8-fvdpol@gmail.com>
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

Let one bulk URB carry up to eight Ploytec packets, to cut the rate of
completion interrupts.

A Ploytec packet is 512 bytes, which is the high-speed bulk maximum
packet size. A transfer of N packets is therefore the same on the wire
as N transfers of one packet, and the device cannot tell them apart.

.hw_params picks N per direction as the largest power of two whose
packets fit in one period, so a small period falls back to one packet
per URB. The transfer buffers are allocated at the maximum. Changing N
only changes the transfer length of each URB at its next resubmission;
the ring is not torn down.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/jockey3.c | 249 +++++++++++++++++++++++++++++++-----
 1 file changed, 219 insertions(+), 30 deletions(-)

diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index d2f4714dbd8b9..74fe5676273d2 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -15,12 +15,14 @@
 #include <linux/delay.h>
 #include <linux/jiffies.h>
 #include <linux/bitops.h>
+#include <linux/log2.h>
 #include <linux/mutex.h>
 #include <linux/wait.h>
 #include <linux/cleanup.h>
 #include <sound/core.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include "ploytec_proto.h"
 #include "ploytec_codec.h"
 
@@ -145,6 +147,37 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
 
 #define JOCKEY3_N_URBS 8
 
+/*
+ * Maximum Ploytec packets per URB ("N"), per direction. Several packets are
+ * coalesced into one USB bulk transfer to cut the completion-interrupt rate
+ * (rationale and measurements in re/streaming_overhead.md).
+ *
+ * The live N is not fixed: jockey3_pcm_hw_params() picks it per stream open,
+ * per direction, as the largest power of two that fits the requested period
+ * size, and stores it in struct jockey3_pcm_urb_stream's @n_shift/@n_pkts.
+ * These two values are only the *ceiling* on that choice, and the width the
+ * URB transfer buffers are allocated at (JOCKEY3_*_XFER_SIZE) -- which is why
+ * the ceiling has to be a compile-time constant. Two separate constants, not
+ * one, so the ceiling can be tuned per direction if the firmware ever turns
+ * out to accept coalescing on one direction but not the other.
+ *
+ * Changing the live N never reallocates or tears down the URB ring: only
+ * urb->transfer_buffer_length varies. PLOYTEC_PKT_SIZE (512) is exactly the
+ * USB high-speed bulk max-packet size, so an N x 512 B transfer is
+ * indistinguishable on the wire from N separate 512 B ones; the firmware
+ * cannot tell the two apart. The buffers stay allocated JOCKEY3_*_XFER_SIZE
+ * wide regardless of the N in use.
+ *
+ * A live N of 1 in both directions must be byte-for-byte identical to a
+ * driver without coalescing: every packet loop below is keyed off the live
+ * @n_pkts and degenerates to the original single-packet code path at N=1.
+ */
+#define JOCKEY3_PLAYBACK_N	8
+#define JOCKEY3_CAPTURE_N	8
+
+#define JOCKEY3_PLAYBACK_XFER_SIZE	(JOCKEY3_PLAYBACK_N * PLOYTEC_PKT_SIZE)
+#define JOCKEY3_CAPTURE_XFER_SIZE	(JOCKEY3_CAPTURE_N * PLOYTEC_PKT_SIZE)
+
 /* Consecutive URB transport errors tolerated before a direction is given up on */
 #define JOCKEY3_MAX_URB_ERRORS 8
 
@@ -153,7 +186,8 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * @substream: the open ALSA substream, or NULL; @lock
  * @anchor: anchor holding the submitted URBs, for stop/kill
  * @urbs: the URB ring
- * @bufs: transfer buffer for each URB
+ * @bufs: transfer buffer for each URB, allocated at the maximum N; @n_pkts,
+ *	not this width, governs how many bytes an URB actually transfers
  * @urbs_in_flight: number of submitted URBs; diagnostic, must reach 0 after a stop
  * @lock: protects the fields marked "@lock" below; IRQ-safe leaf
  * @dma_off: byte offset into runtime->dma_area, i.e. the hardware pointer; @lock
@@ -171,6 +205,13 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *	re-anchor a URB after the kill has drained the anchor.
  * @consec_errors: consecutive URB transport errors; @lock. Reset on any
  *	successful completion and by jockey3_start_urbs().
+ * @n_shift: log2 of the Ploytec packets per URB ("N") the next resubmission
+ *	will carry, in [0, 3]; @lock. Set by jockey3_pcm_hw_params() from the
+ *	period size and reset to the default by jockey3_pcm_close(), so an idle
+ *	direction never runs at a stale N. Changing it does not tear the ring
+ *	down -- the wire cannot tell one N x 512 B transfer from N separate ones
+ *	-- so each URB picks up the value at its next resubmission.
+ * @n_pkts: 1 << @n_shift, mirrored for loop bounds; @lock
  */
 struct jockey3_pcm_urb_stream {
 	struct snd_pcm_substream *substream;
@@ -186,6 +227,8 @@ struct jockey3_pcm_urb_stream {
 	wait_queue_head_t drain_wait;
 	bool stopping;
 	unsigned int consec_errors;
+	u8 n_shift;
+	u8 n_pkts;
 };
 
 /**
@@ -581,11 +624,12 @@ static void jockey3_capture_callback(struct urb *urb)
 	struct jockey3_chip *chip = urb->context;
 	struct jockey3_pcm_urb_stream *urb_stream = &chip->capture;
 	struct snd_pcm_substream *substream = NULL;
+	int n_pkts = 0;
 	bool period_elapsed = false;
 	bool data_valid = true;
 	bool active = false;
 	bool stopping;
-	int ret;
+	int sp, ret;
 
 	atomic_dec(&urb_stream->urbs_in_flight);
 
@@ -608,11 +652,32 @@ static void jockey3_capture_callback(struct urb *urb)
 	if (unlikely(jockey3_is_disconnected(chip)))
 		return;
 
-	if (data_valid && unlikely(urb->actual_length < PLOYTEC_PKT_SIZE)) {
-		dev_err_ratelimited(&chip->intf0->dev,
-				    "Capture URB too small: %d; required at least %d\n",
-				    urb->actual_length, PLOYTEC_PKT_SIZE);
-		data_valid = false;
+	/*
+	 * The firmware fills a multi-packet capture URB completely rather than
+	 * terminating at one 512 B packet, so the expected case is
+	 * actual_length == JOCKEY3_CAPTURE_XFER_SIZE. Derive the count from
+	 * what actually came back rather than assuming N, in case that
+	 * changes under load or on other firmware revisions.
+	 */
+	if (data_valid) {
+		n_pkts = urb->actual_length / PLOYTEC_PKT_SIZE;
+		if (unlikely(n_pkts == 0)) {
+			dev_err_ratelimited(&chip->intf0->dev,
+					    "Capture URB too small: %d; required at least %d\n",
+					    urb->actual_length, PLOYTEC_PKT_SIZE);
+			data_valid = false;
+		} else if (unlikely(urb->actual_length % PLOYTEC_PKT_SIZE)) {
+			/*
+			 * A short trailing partial packet: use the
+			 * complete ones and drop the rest, but this should
+			 * not happen on firmware behaving as described above
+			 * -- log it once so a change in device behavior is
+			 * visible instead of silently discarded audio.
+			 */
+			dev_warn_once(&chip->intf0->dev,
+				      "Capture URB length %d not a multiple of %d, using %d packet(s)\n",
+				      urb->actual_length, PLOYTEC_PKT_SIZE, n_pkts);
+		}
 	}
 
 	/* Step 1: Safely fetch the pointer and join the safe zone */
@@ -626,7 +691,9 @@ static void jockey3_capture_callback(struct urb *urb)
 			active = true;
 			substream = urb_stream->substream;
 
-			period_elapsed = jockey3_process_in_packet(chip, urb->transfer_buffer);
+			for (sp = 0; sp < n_pkts; sp++)
+				period_elapsed |= jockey3_process_in_packet(chip,
+					urb->transfer_buffer + sp * PLOYTEC_PKT_SIZE);
 		}
 	}
 
@@ -653,6 +720,7 @@ static void jockey3_capture_callback(struct urb *urb)
 		 * to an anchor jockey3_stop_urbs() has already drained.
 		 */
 		if (!urb_stream->stopping && !jockey3_is_disconnected(chip)) {
+			urb->transfer_buffer_length = urb_stream->n_pkts * PLOYTEC_PKT_SIZE;
 			atomic_inc(&urb_stream->urbs_in_flight);
 			usb_anchor_urb(urb, &urb_stream->anchor);
 			ret = usb_submit_urb(urb, GFP_ATOMIC);
@@ -687,8 +755,14 @@ static void jockey3_silence_out_packet(u8 *buf)
  */
 static void jockey3_init_out_packet(u8 *buf)
 {
-	buf[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
-	buf[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+	int sp;
+
+	for (sp = 0; sp < JOCKEY3_PLAYBACK_N; sp++) {
+		u8 *sub = buf + sp * PLOYTEC_PKT_SIZE;
+
+		sub[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+		sub[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+	}
 }
 
 static void jockey3_playback_callback(struct urb *urb)
@@ -697,11 +771,12 @@ static void jockey3_playback_callback(struct urb *urb)
 	struct jockey3_pcm_urb_stream *urb_stream = &chip->playback;
 	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
 	struct snd_pcm_substream *substream = NULL;
+	unsigned int submit_pkts;
 	bool period_elapsed = false;
 	bool data_valid = true;
 	bool active = false;
 	bool stopping;
-	int i, ret;
+	int i, sp, ret;
 
 	atomic_dec(&urb_stream->urbs_in_flight);
 
@@ -723,8 +798,21 @@ static void jockey3_playback_callback(struct urb *urb)
 	if (unlikely(jockey3_is_disconnected(chip)))
 		return;
 
-	/* Step 1: Safely fetch the pointer and join the safe zone */
+	/*
+	 * Step 1: Safely fetch the pointer and join the safe zone.
+	 *
+	 * @n_pkts is captured once here and reused below for the MIDI/sync
+	 * loop and the resubmit's transfer_buffer_length, rather than re-read
+	 * at each site: jockey3_pcm_hw_params() can change it concurrently
+	 * (under the same lock), and this URB's buffer must only ever claim
+	 * to carry as many freshly written packets as it actually filled
+	 * this callback. Reading a larger value at resubmit than was used to
+	 * fill would send stale packets left over from an earlier, larger N
+	 * instead of tearing the ring down.
+	 */
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		submit_pkts = urb_stream->n_pkts;
+
 		if (data_valid)
 			urb_stream->consec_errors = 0;
 
@@ -734,9 +822,12 @@ static void jockey3_playback_callback(struct urb *urb)
 			active = true;
 			substream = urb_stream->substream;
 
-			period_elapsed = jockey3_process_out_packet(chip, buf);
+			for (sp = 0; sp < submit_pkts; sp++)
+				period_elapsed |= jockey3_process_out_packet(chip,
+					buf + sp * PLOYTEC_PKT_SIZE);
 		} else {
-			jockey3_silence_out_packet(buf);
+			for (sp = 0; sp < submit_pkts; sp++)
+				jockey3_silence_out_packet(buf + sp * PLOYTEC_PKT_SIZE);
 		}
 	}
 
@@ -744,12 +835,16 @@ static void jockey3_playback_callback(struct urb *urb)
 	 * Every packet reserves one slot for a MIDI OUT byte. Nothing feeds it
 	 * yet, so it carries the idle byte.
 	 */
-	buf[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+	for (sp = 0; sp < submit_pkts; sp++) {
+		u8 *sub = buf + sp * PLOYTEC_PKT_SIZE;
 
-	/* Ploytec Sync byte and gap padding */
-	buf[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
-	for (i = PLOYTEC_SYNC_BYTE_OFFSET + 1; i < PLOYTEC_PKT_SIZE; i++)
-		buf[i] = 0x00;
+		sub[PLOYTEC_MIDI_OUT_OFFSET] = PLOYTEC_MIDI_IDLE_BYTE;
+
+		/* Ploytec Sync byte and gap padding */
+		sub[PLOYTEC_SYNC_BYTE_OFFSET] = PLOYTEC_SYNC_BYTE_VALUE;
+		for (i = PLOYTEC_SYNC_BYTE_OFFSET + 1; i < PLOYTEC_PKT_SIZE; i++)
+			sub[i] = 0x00;
+	}
 
 	/*
 	 * Step 2: Safe Zone. ALSA core can't free 'substream' because
@@ -774,6 +869,7 @@ static void jockey3_playback_callback(struct urb *urb)
 		 * to an anchor jockey3_stop_urbs() has already drained.
 		 */
 		if (!urb_stream->stopping && !jockey3_is_disconnected(chip)) {
+			urb->transfer_buffer_length = submit_pkts * PLOYTEC_PKT_SIZE;
 			atomic_inc(&urb_stream->urbs_in_flight);
 			usb_anchor_urb(urb, &urb_stream->anchor);
 			ret = usb_submit_urb(urb, GFP_ATOMIC);
@@ -941,6 +1037,7 @@ static int jockey3_start_urbs(struct jockey3_chip *chip)
 {
 	int i, ret, first_err = 0;
 	int n_playback = 0, n_capture = 0;
+	u8 playback_n_pkts, capture_n_pkts;
 
 	if (jockey3_is_disconnected(chip))
 		return -ENODEV;
@@ -966,7 +1063,23 @@ static int jockey3_start_urbs(struct jockey3_chip *chip)
 		chip->midi_consec_errors = 0;
 	}
 
+	/*
+	 * Each direction's ring is armed at its own current N, which at probe is
+	 * the JOCKEY3_PLAYBACK_N/JOCKEY3_CAPTURE_N default.
+	 *
+	 * Both are read once here rather than per iteration: they are written
+	 * under the stream lock, which is not held here, so a re-load could
+	 * leave URBs in the same ring armed at different lengths.
+	 */
+	playback_n_pkts = READ_ONCE(chip->playback.n_pkts);
+	capture_n_pkts = READ_ONCE(chip->capture.n_pkts);
+
 	for (i = 0; i < JOCKEY3_N_URBS; i++) {
+		chip->playback.urbs[i]->transfer_buffer_length =
+			playback_n_pkts * PLOYTEC_PKT_SIZE;
+		chip->capture.urbs[i]->transfer_buffer_length =
+			capture_n_pkts * PLOYTEC_PKT_SIZE;
+
 		atomic_inc(&chip->playback.urbs_in_flight);
 		usb_anchor_urb(chip->playback.urbs[i], &chip->playback.anchor);
 		ret = usb_submit_urb(chip->playback.urbs[i], GFP_KERNEL);
@@ -1099,10 +1212,12 @@ static const struct snd_pcm_hardware jockey3_pcm_hw_playback = {
 	.channels_max		= 4,
 	.buffer_bytes_max	= 1024 * 1024,
 	/*
-	 * One playback URB carries one packet of 10 frames * 4 channels * 3
-	 * bytes = 120 bytes. A URB reports at most one elapsed period, so the
-	 * minimum must cover at least one packet, or a period boundary inside a
-	 * URB could be missed entirely.
+	 * One playback URB carries a packet count chosen per open by
+	 * jockey3_pcm_hw_params(), of 10 frames * 4 channels * 3 bytes = 120
+	 * bytes each. period_elapsed is OR'd across the packet loop in
+	 * jockey3_playback_callback(), so the minimum must cover at least one
+	 * packet, the smallest a URB can ever carry (N=1), or a period boundary
+	 * inside a URB could be missed entirely.
 	 */
 	.period_bytes_min	= PLOYTEC_PLAYBACK_FRAMES * 4 * 3,
 	.period_bytes_max	= 512 * 1024,
@@ -1120,9 +1235,10 @@ static const struct snd_pcm_hardware jockey3_pcm_hw_capture = {
 	.channels_max		= 6,
 	.buffer_bytes_max	= 1024 * 1024,
 	/*
-	 * One capture URB carries one packet of 8 frames * 6 channels * 3 bytes
-	 * = 144 bytes; see the playback .period_bytes_min comment above for why
-	 * the minimum must cover at least one packet.
+	 * One capture URB carries a packet count chosen per open (see
+	 * jockey3_pcm_hw_params()) of up to 8 frames * 6 channels * 3 bytes =
+	 * 144 bytes each; see the playback .period_bytes_min comment above for
+	 * why the minimum must cover at least one packet.
 	 */
 	.period_bytes_min	= PLOYTEC_CAPTURE_FRAMES * 6 * 3,
 	.period_bytes_max	= 512 * 1024,
@@ -1164,6 +1280,8 @@ static int jockey3_pcm_close(struct snd_pcm_substream *substream)
 	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
 	struct jockey3_pcm_urb_stream *urb_stream =
 		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	unsigned int default_n = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				 JOCKEY3_PLAYBACK_N : JOCKEY3_CAPTURE_N;
 
 	dev_dbg(&chip->intf0->dev, "PCM close stream %d\n", substream->stream);
 
@@ -1175,6 +1293,16 @@ static int jockey3_pcm_close(struct snd_pcm_substream *substream)
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
 		urb_stream->substream = NULL;
 		urb_stream->running = false;
+
+		/*
+		 * A closed direction is not covered by jockey3_pcm_hw_params()
+		 * any more, so its N would otherwise sit at whatever the last
+		 * open left it at -- possibly a small, period-tuned value that
+		 * has nothing to do with the next stream to open it. Reset to
+		 * the default here so an idle direction always runs at a safe N.
+		 */
+		WRITE_ONCE(urb_stream->n_shift, ilog2(default_n));
+		WRITE_ONCE(urb_stream->n_pkts, default_n);
 	}
 
 	return 0;
@@ -1304,9 +1432,61 @@ static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version
 	return 0;
 }
 
+/**
+ * jockey3_pcm_set_n() - choose and arm this direction's packets per URB
+ * @chip: driver state
+ * @substream: the substream hw_params was just called for
+ * @hw_params: the negotiated parameters
+ *
+ * Chooses how many Ploytec packets each USB bulk URB on this direction
+ * carries, called "N" below for brevity: the largest power of two with
+ * N * pkt_bytes <= period_bytes. A big period gets the full coalescing
+ * saving, a tiny one falls back to N=1 automatically via .period_bytes_min.
+ * Takes effect without tearing the URB ring down -- the firmware cannot tell
+ * an N x 512 B bulk transfer apart from N separate 512 B ones, so each URB on
+ * this direction simply picks up the new N at its own next resubmission; the
+ * ring turns over onto it within at most JOCKEY3_N_URBS completions. See
+ * re/streaming_overhead.md for the rationale and measurements.
+ */
+static void jockey3_pcm_set_n(struct jockey3_chip *chip, struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *hw_params)
+{
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	unsigned int period_bytes = params_period_bytes(hw_params);
+	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned int pkt_bytes = is_playback ? PLOYTEC_PLAYBACK_FRAMES * 4 * 3 :
+						  PLOYTEC_CAPTURE_FRAMES * 6 * 3;
+	unsigned int max_n = is_playback ? JOCKEY3_PLAYBACK_N : JOCKEY3_CAPTURE_N;
+	unsigned int n = max(period_bytes / pkt_bytes, 1U);
+	u8 n_shift = clamp_t(u8, ilog2(n), 0, ilog2(max_n));
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		WRITE_ONCE(urb_stream->n_shift, n_shift);
+		WRITE_ONCE(urb_stream->n_pkts, 1 << n_shift);
+	}
+
+	dev_dbg(&chip->intf0->dev, "hw_params: %s using %u packet(s)/URB (period_bytes=%u)\n",
+		is_playback ? "playback" : "capture", 1U << n_shift, period_bytes);
+}
+
+static int jockey3_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	jockey3_pcm_set_n(chip, substream, hw_params);
+
+	return 0;
+}
+
 static const struct snd_pcm_ops jockey3_pcm_ops = {
 	.open = jockey3_pcm_open,
 	.close = jockey3_pcm_close,
+	.hw_params = jockey3_pcm_hw_params,
 	.prepare = jockey3_pcm_prepare,
 	.trigger = jockey3_pcm_trigger,
 	.sync_stop = jockey3_pcm_sync_stop,
@@ -1454,7 +1634,7 @@ static int jockey3_init_playback_urbs(struct jockey3_chip *chip)
 	int i;
 
 	for (i = 0; i < JOCKEY3_N_URBS; i++) {
-		chip->playback.bufs[i] = kzalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+		chip->playback.bufs[i] = kzalloc(JOCKEY3_PLAYBACK_XFER_SIZE, GFP_KERNEL);
 		if (!chip->playback.bufs[i])
 			return -ENOMEM;
 
@@ -1466,7 +1646,7 @@ static int jockey3_init_playback_urbs(struct jockey3_chip *chip)
 
 		usb_fill_bulk_urb(chip->playback.urbs[i], dev,
 				  usb_sndbulkpipe(dev, PLOYTEC_EP_NUM_PCM_OUT),
-				  chip->playback.bufs[i], PLOYTEC_PKT_SIZE,
+				  chip->playback.bufs[i], JOCKEY3_PLAYBACK_XFER_SIZE,
 				  jockey3_playback_callback, chip);
 	}
 
@@ -1479,7 +1659,7 @@ static int jockey3_init_capture_urbs(struct jockey3_chip *chip)
 	int i;
 
 	for (i = 0; i < JOCKEY3_N_URBS; i++) {
-		chip->capture.bufs[i] = kzalloc(PLOYTEC_PKT_SIZE, GFP_KERNEL);
+		chip->capture.bufs[i] = kzalloc(JOCKEY3_CAPTURE_XFER_SIZE, GFP_KERNEL);
 		if (!chip->capture.bufs[i])
 			return -ENOMEM;
 
@@ -1489,7 +1669,7 @@ static int jockey3_init_capture_urbs(struct jockey3_chip *chip)
 
 		usb_fill_bulk_urb(chip->capture.urbs[i], dev,
 				  usb_rcvbulkpipe(dev, PLOYTEC_EP_NUM_PCM_IN),
-				  chip->capture.bufs[i], PLOYTEC_PKT_SIZE,
+				  chip->capture.bufs[i], JOCKEY3_CAPTURE_XFER_SIZE,
 				  jockey3_capture_callback, chip);
 	}
 
@@ -1697,6 +1877,15 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	 */
 	atomic_set(&chip->playback.urbs_in_flight, 0);
 	atomic_set(&chip->capture.urbs_in_flight, 0);
+	/*
+	 * Default N until the first hw_params() picks a period-tuned value
+	 * (jockey3_pcm_set_n()); matches the width the URB buffers below are
+	 * actually allocated at, and jockey3_init_out_packet() primes.
+	 */
+	chip->playback.n_shift = ilog2(JOCKEY3_PLAYBACK_N);
+	chip->playback.n_pkts = JOCKEY3_PLAYBACK_N;
+	chip->capture.n_shift = ilog2(JOCKEY3_CAPTURE_N);
+	chip->capture.n_pkts = JOCKEY3_CAPTURE_N;
 
 	chip->xfer_buf = kmalloc(USB_XFER_BUF_SIZE, GFP_KERNEL);
 	if (!chip->xfer_buf) {
-- 
2.47.3

