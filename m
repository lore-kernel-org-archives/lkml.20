Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431979;
	b=sm0KhTw/hjAPRc1jsKvsw6HSfsKmsvmxJHOK/S70VHcHY8sufrpoSpGY4y0en/Amugtr
	 1XuijcD7FG0hE1isCd9N39piA/QHpGOs1WB2yY3IxF/FxzuAAfjeMtLkYj9QeG27MkFG3
	 Cs30NZMT2eEb+6+1Dzms43mrSrNf+u1d+IpGmhpu2J3emcNbRdcV09QkQK5FXCJ9iwUTf
	 cdFc/J4AuB5pFBtj/fBUwC+ryO9Dc+tDrWV7+3MCkrCdrw1i5s+aodhgaqPwJ2u3VcFc2
	 YnN+S1IWB2Xk40sEWtZrPmHj2sFyo9Y74FVmKZzaEbEHPH0kAtcNxs5EC8IUvQYUxFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZyzzjPnCfSTy9NfEOfW3QSpVqstDfZxiu//B8rjJ33k=;
	b=GvVwkxfHRWT6mITM6QLpTkxl9OZuSuX6I7wPlR38XKvUdOrU05Cnc86kKgQliqVBVVs3
	 N2BE40m9J72GY/URYlsBFlDi4hHTj6yBG6JxBpnKaZm3cz/dvrka4nlA7fwiusiTvVlzA
	 6n2j2n9/mK0XZtXDuJ9osUh6vPpIit2OeY4nx8Rq9f3OfsnT71mOohPNW60609gSlJLwL
	 47MYw//Q0+6pfOS3YLei5zA00yCSefATW7QktgbM3C6EuJoWkoWtKhMLfhOp760Fw3oHp
	 manzZKMm/ESimq4IJ7AutQA9M4rVTFQb/QIwypvtB36sTIq0+xDv/TSJSs/fAnLedGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="QT8H/033";
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23572606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23572606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QT8H/033
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so742265137.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431977; x=1793036777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZyzzjPnCfSTy9NfEOfW3QSpVqstDfZxiu//B8rjJ33k=;
        b=QT8H/033LSAUSAxibjqgFAusMg403IsvvlKUwAOyLQ2/0OP96jxYoSfwPTFmxSgEts
         vZYNVJOp7MgA3hfB15WmD1t+dNUqmjXWeDMmzeelqbrU7yB3y3UWstCPf9xA70C7DbBc
         VT1NMOT/Obk4lfSJs9AbZkRF2gtQIR2URxJdM/I3JFt9+Yen0tN8HKKpux9Gv6bwSaJv
         D7qf5KYuYW8n2Z0xxAUxMPgkUdYT/vofanS1uVgUI3SHY0NLNsjVp/dNUpDr+e7plNwM
         wxwxfulpz+0Fm4eSps0joPqnaGOUhz1M/eVncZ4Y17KPzOt+s2rA0v1n5AKh2G+p3aKu
         0EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431977; x=1793036777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZyzzjPnCfSTy9NfEOfW3QSpVqstDfZxiu//B8rjJ33k=;
        b=ZqlHRtiY1ai+5QB4NxM76O4O/xsRQxYD7vrZ+HuIBVmzfZGhiF1ZJi28ezdu1nyXNT
         kbekDTGhIj9j3yK1PO5pJQOqgcPtzkqaPZClEpzl7NrAFIPmrch1tfQ1nunjopaK0ikv
         aOVaiBVYg1YIJlBG71zHD9iImL1MOIRJy2NFZgbxgPKT8gErW335XiNfDfWNqFEoO758
         qGqECqz9qyiLcVbwrCl3VAWlo8X1TUP0hZ7TK7jdi+NXmN2ulb2Vj28KA2s2vlkA7PR/
         m/7U1w9aocwKKthRwAixrHwZS9QfXHGZ31DmJU48PD5JzspgW7iaxtl5xUhQxTeGmzuH
         891w==
X-Forwarded-Encrypted: i=1; AKwUvBx+oMhhJgt3pxxIHinqaU6olLGo1ZM9Swyd4ODWbFGoHBx0iokhKf7/so4qepIoRANXa4W/pcFLUqHfIIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq8NHpZsZP7VXB2gCjV0lsuMwwmh3r0XfBqjbkfAEzBkxV6hzX
	sJZ59ZPIJ8twSMBiAOuiK3yFjYzdQDb4QYZBHUbW8uxOkmAzUGhjETS1
X-Gm-Gg: AYBFou3+5mMAST19ZKjv8bA+1zpWAo+U3M4N9U0D/bkWIRheJpm3iNbcV8nDd0MLQq6
	1knbehDQ8aoSz+cuoiOVU///3wtKNDKiMZJGmtqrryz7iNqhD1EPoG7b1N61J9fygw+/qxIsJz3
	8V+j76OpBalP/y5HHIHG8IBb5AdifD8ruw5oZDIr4M2Fur1vyV0jUMxCSGdqIHc6krlXIsumjzs
	1JdtaAJhkGugQY+LAVFxtEnA4smxM5bCzbCh743KE7QC5eUz97BKkpX/9EDZvYF1buevSDsu+my
	bpKMmd+bQjl2ef5nJ0yOJ1EPjTqSOSFixxpRZF4LXckrJPNySU7c5kDY+R2xOVVsgEGvdB2OiXS
	wpZLXBxRWOFjVwupOTne6phulTLwRvr7TyI6gE5ikKgiIBJP1yDrK9xqs/bxaB/hacXF5VonCM5
	ZktWT9bjKb9HE4UXeEUpKTN/id16ruhwGcdAHky5KAQPJqXtaF8fuCfeNntfzNeZVUYoGyoDgYc
	dZqIa0sslJiePsZrum3AaLZ9jStn8bNqlO8jJyrXhTMOf1WPyF8hdmYmka0yFpGS+RE/L6K5XWv
	HlWW4D7KaARijADk+pLSP4K02xW/caA=
X-Received: by 2002:a05:6102:80a5:b0:7c2:799c:9031 with SMTP id ada2fe7eead31-7cc36a743a4mr1957214137.30.1792431976701;
        Mon, 19 Oct 2026 10:46:16 -0700 (PDT)
Received: from alsa-dev.int.suenodeluz.com.do ([74.244.193.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3adfd0sm790707241.12.2026.10.19.10.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:46:16 -0700 (PDT)
From: Frank van de Pol <fvdpol@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	fvdpol@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/13] ALSA: jockey3: Add PCM playback
Date: Mon, 19 Oct 2026 13:44:35 -0400
Message-ID: <20261019174445.1931263-4-fvdpol@gmail.com>
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

Add a PCM device with a 4-channel, 24-bit playback stream at 44.1 kHz,
and the encoder that turns S24_3LE frames into the Ploytec wire format.

The wire format is bit-plane interleaved rather than sample-interleaved:
every byte on the wire holds one bit of each channel. The comment at the
top of ploytec_codec.c explains where that layout comes from. This patch
adds the portable implementation, which is written to be read as a
definition of the format. Optimized variants follow once tests exist.

The URBs keep running as before. The PCM callbacks only decide whether
the playback completion handler fills a packet from the ALSA buffer or
with silence:

 - .trigger and .pointer run with the stream lock held and must not
   sleep, so they only take the stream's own spinlock.
 - The completion handler drops that spinlock before it calls
   snd_pcm_period_elapsed(), which takes the stream lock.
 - .sync_stop waits for completion handlers that may still touch the
   substream or its buffer before the core frees either.

The channel map marks the master pair as FL/FR and leaves the headphone
pair unpositioned, because it is a second stereo output and not a pair
of rear speakers.

Assisted-by: LLM
Signed-off-by: Frank van de Pol <fvdpol@gmail.com>
---
 sound/usb/jockey3/Kconfig         |   1 +
 sound/usb/jockey3/Makefile        |   2 +-
 sound/usb/jockey3/jockey3.c       | 455 +++++++++++++++++++++++++++++-
 sound/usb/jockey3/ploytec_codec.c | 101 +++++++
 sound/usb/jockey3/ploytec_codec.h |  26 ++
 5 files changed, 571 insertions(+), 14 deletions(-)
 create mode 100644 sound/usb/jockey3/ploytec_codec.c
 create mode 100644 sound/usb/jockey3/ploytec_codec.h

diff --git a/sound/usb/jockey3/Kconfig b/sound/usb/jockey3/Kconfig
index 5714f46c57de3..83135d65b3ffd 100644
--- a/sound/usb/jockey3/Kconfig
+++ b/sound/usb/jockey3/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_USB_JOCKEY3
 	tristate "Reloop Jockey 3 support"
+	select SND_PCM
 	help
 	  Say Y here to include support for the Reloop Jockey 3 DJ controllers.
 	  These devices utilize a non-standard, proprietary Ploytec USB
diff --git a/sound/usb/jockey3/Makefile b/sound/usb/jockey3/Makefile
index 4a3d02b7176e0..0e81aea50f9ac 100644
--- a/sound/usb/jockey3/Makefile
+++ b/sound/usb/jockey3/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SND_USB_JOCKEY3) += snd-reloop-jockey3.o
-snd-reloop-jockey3-y := jockey3.o ploytec_proto.o
+snd-reloop-jockey3-y := jockey3.o ploytec_proto.o ploytec_codec.o
diff --git a/sound/usb/jockey3/jockey3.c b/sound/usb/jockey3/jockey3.c
index 351612b1fbe33..3863ed12cf566 100644
--- a/sound/usb/jockey3/jockey3.c
+++ b/sound/usb/jockey3/jockey3.c
@@ -11,12 +11,16 @@
 #include <linux/usb.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/bitops.h>
 #include <linux/mutex.h>
+#include <linux/wait.h>
 #include <linux/cleanup.h>
 #include <sound/core.h>
 #include <sound/initval.h>
+#include <sound/pcm.h>
 #include "ploytec_proto.h"
+#include "ploytec_codec.h"
 
 #define RELOOP_VENDOR_ID         0x200c
 #define RELOOP_JOCKEY3_ME_PID    0x1019
@@ -72,9 +76,14 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * - EP 0x86 IN:  PCM capture
  * - EP 0x83 IN:  MIDI input
  *
+ * Audio is not sample-interleaved but bit-plane interleaved; see
+ * ploytec_codec.c for the wire format and the encode implementation.
+ *
  * URBs run free for the lifetime of the device rather than being started and
  * stopped around PCM use: the playback stream must keep flowing because it
- * carries MIDI OUT, and the device expects a continuous packet stream.
+ * carries MIDI OUT, and the device expects a continuous packet stream. The PCM
+ * callbacks therefore only toggle whether a URB's payload is filled from (or
+ * copied to) an ALSA buffer.
  */
 
 /**
@@ -85,9 +94,9 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * card would instead be freed from the devres unwind inside
  * usb_unbind_interface(), where snd_card_free() blocks until userspace has
  * closed every file descriptor on the card -- on an unplug that unwind runs on
- * the USB hub work queue, so a single process holding the card open would
- * stall hotplug for the whole hub. Every other USB sound driver in the tree
- * avoids that the same way.
+ * the USB hub work queue, so a single process sitting on a PCM fd would stall
+ * hotplug for the whole hub. Every other USB sound driver in the tree avoids
+ * that the same way.
  *
  * That splits teardown in two, and the split is the thing to keep straight:
  *
@@ -103,7 +112,9 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *   returns; see jockey3_free_resources().
  *
  * struct jockey3_chip lives in card->private_data, so it is freed with the
- * card and outlives the USB binding.
+ * card and outlives the USB binding -- which is what makes it safe for an ALSA
+ * callback that is still in flight during an unplug to keep dereferencing it.
+ * Such a callback finds JOCKEY3_FLAG_DISCONNECTED set and returns -ENODEV.
  *
  * probe's error path performs the disconnect half by hand and ends the same
  * way, with snd_card_free_when_closed(): a failing snd_card_register() may
@@ -117,6 +128,17 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  * There are three locks, all IRQ-safe leaf spinlocks: playback.lock,
  * capture.lock and midi_lock. They are never nested inside one another;
  * anything that needs more than one takes them in sequence, not nested.
+ *
+ * Against the ALSA core the order is::
+ *
+ *     snd_pcm_stream_lock  ->  playback.lock / capture.lock
+ *
+ * which is why the URB completion handlers drop their stream spinlock before
+ * calling snd_pcm_period_elapsed() or snd_pcm_stop_xrun(); both take the
+ * stream lock, and taking it while holding ours would invert the order.
+ *
+ * .trigger and .pointer are called by the core with the stream lock held and
+ * interrupts disabled, so neither may sleep.
  */
 
 #define JOCKEY3_N_URBS 8
@@ -126,11 +148,21 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
 
 /**
  * struct jockey3_pcm_urb_stream - per-direction PCM streaming state
+ * @substream: the open ALSA substream, or NULL; @lock
  * @anchor: anchor holding the submitted URBs, for stop/kill
  * @urbs: the URB ring
  * @bufs: transfer buffer for each URB
  * @urbs_in_flight: number of submitted URBs; diagnostic, must reach 0 after a stop
  * @lock: protects the fields marked "@lock" below; IRQ-safe leaf
+ * @dma_off: byte offset into runtime->dma_area, i.e. the hardware pointer; @lock
+ * @period_off: bytes accumulated towards the current period; @lock
+ * @running: stream is triggered and its payload should be filled; @lock
+ * @callbacks_active: number of URB completions currently inside the "safe zone"
+ *	where they may still touch @substream or runtime->dma_area; @lock. The
+ *	last one out wakes @drain_wait. A count rather than a flag because there
+ *	are JOCKEY3_N_URBS URBs per direction and their completions can overlap
+ *	on SMP.
+ * @drain_wait: waited on by jockey3_pcm_sync_stop() until @callbacks_active is 0
  * @stopping: set by jockey3_stop_urbs() before the anchor is killed, cleared by
  *	jockey3_start_urbs(); @lock. Tested by the completion handler inside the
  *	same critical section that anchors and resubmits, so a callback can never
@@ -139,11 +171,17 @@ MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
  *	successful completion and by jockey3_start_urbs().
  */
 struct jockey3_pcm_urb_stream {
+	struct snd_pcm_substream *substream;
 	struct usb_anchor anchor;
 	struct urb *urbs[JOCKEY3_N_URBS];
 	unsigned char *bufs[JOCKEY3_N_URBS];
 	atomic_t urbs_in_flight;
 	spinlock_t lock;	/* protects this stream's state; IRQ-safe leaf */
+	unsigned int dma_off;
+	unsigned int period_off;
+	bool running;
+	unsigned int callbacks_active;
+	wait_queue_head_t drain_wait;
 	bool stopping;
 	unsigned int consec_errors;
 };
@@ -153,10 +191,11 @@ struct jockey3_pcm_urb_stream {
  * @card: the ALSA card; read-only after probe
  * @dev: the USB device; read-only after probe. Referenced for the chip's
  *	lifetime, as @intf0 and @intf1 are, because the card can outlive the
- *	unbind and usb_disconnect() would otherwise free them before
- *	jockey3_free_resources() runs, which releases them.
+ *	unbind and usb_disconnect() would otherwise free them underneath an ALSA
+ *	entry point. Released by jockey3_free_resources().
  * @intf0: interface 0, which the driver is bound to; read-only after probe
  * @intf1: interface 1, claimed explicitly because it owns EP 0x86
+ * @pcm: the PCM device; read-only after probe
  * @xfer_buf: bounce buffer for EP0 control transfers, USB_XFER_BUF_SIZE bytes.
  * @flags: JOCKEY3_FLAG_* bits, atomic bitops
  * @dev_idx: card slot held in jockey3_devices_used
@@ -173,6 +212,7 @@ struct jockey3_chip {
 	struct usb_device *dev;
 	struct usb_interface *intf0;
 	struct usb_interface *intf1;
+	struct snd_pcm *pcm;
 	unsigned char *xfer_buf;
 	unsigned long flags;
 	unsigned int dev_idx;
@@ -239,6 +279,69 @@ static inline bool jockey3_is_disconnected(const struct jockey3_chip *chip)
 	return test_bit(JOCKEY3_FLAG_DISCONNECTED, &chip->flags);
 }
 
+static inline struct jockey3_pcm_urb_stream *jockey3_get_pcm_urb_stream(struct jockey3_chip *chip,
+									const int direction)
+{
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		return &chip->playback;
+	else
+		return &chip->capture;
+}
+
+static bool jockey3_process_out_packet(struct jockey3_chip *chip, u8 *urb_buf)
+{
+	struct snd_pcm_substream *substream = chip->playback.substream;
+	struct jockey3_pcm_urb_stream *urb_stream = &chip->playback;
+	struct snd_pcm_runtime *runtime;
+	unsigned int pcm_buffer_size;
+	unsigned int alsa_frame_size;
+	unsigned int frames_in_batch;
+	unsigned int bytes_avail;
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
+	alsa_frame_size = runtime->channels * 3;  // 4 * 3 = 12 bytes
+
+	while (f < PLOYTEC_PLAYBACK_FRAMES) {
+		/* calculate how many samples we can process in one batch */
+		frames_in_batch = PLOYTEC_PLAYBACK_FRAMES - f;
+		bytes_avail = pcm_buffer_size - urb_stream->dma_off;
+
+		/* Respect circular buffer wrap-around */
+		if (bytes_avail < frames_in_batch * alsa_frame_size)
+			frames_in_batch = bytes_avail / alsa_frame_size;
+
+		if (frames_in_batch == 0)
+			break;
+
+		ploytec_encode_batch(urb_buf + f * PLOYTEC_PLAYBACK_FRAME_SIZE,
+				     runtime->dma_area + urb_stream->dma_off,
+				     frames_in_batch);
+
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
@@ -292,6 +395,43 @@ static void jockey3_warn_unexpected_stop(struct jockey3_chip *chip, bool stoppin
 			     type, status);
 }
 
+/**
+ * jockey3_report_xrun() - tell userspace this direction lost its data
+ * @urb_stream: the affected direction
+ *
+ * Reports an xrun on the open substream, if there is one. Nothing else in the
+ * driver can do this safely by hand: snd_pcm_stop_xrun() takes the stream lock,
+ * and the documented order is snd_pcm_stream_lock -> urb_stream->lock, so the
+ * call has to be made with our spinlock dropped. Between dropping it and taking
+ * it again the substream could be freed underneath us, which is what the
+ * callbacks_active "safe zone" prevents -- jockey3_pcm_sync_stop() waits for
+ * that count to reach zero before the ALSA core releases the buffer.
+ *
+ * Callers must hold neither @urb_stream->lock nor any driver mutex.
+ */
+static void jockey3_report_xrun(struct jockey3_pcm_urb_stream *urb_stream)
+{
+	struct snd_pcm_substream *substream = NULL;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (urb_stream->running && urb_stream->substream) {
+			/* Join the safe zone so the substream cannot be freed below */
+			urb_stream->callbacks_active++;
+			substream = urb_stream->substream;
+		}
+	}
+
+	if (!substream)
+		return;
+
+	snd_pcm_stop_xrun(substream);
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (!--urb_stream->callbacks_active)
+			wake_up(&urb_stream->drain_wait);
+	}
+}
+
 /**
  * jockey3_err_device_gone() - did the device simply leave?
  * @err: a transfer's return value
@@ -375,6 +515,8 @@ static bool jockey3_urb_error_give_up(struct jockey3_chip *chip,
 		"%s stopped after %u consecutive URB errors; deferring recovery\n",
 		type, errors);
 
+	jockey3_report_xrun(urb_stream);
+
 	return true;
 }
 
@@ -432,6 +574,19 @@ static void jockey3_capture_callback(struct urb *urb)
 		jockey3_resubmit_failed(chip, ret, "capture");
 }
 
+/*
+ * Fill the sample area of a playback packet with silence, for when there is
+ * no PCM data to send.
+ *
+ * Only the sample area is touched: everything from PLOYTEC_MIDI_OUT_OFFSET
+ * onwards -- the MIDI slot, the sync byte and the trailing gap -- is rewritten
+ * unconditionally by jockey3_playback_callback() immediately afterwards.
+ */
+static void jockey3_silence_out_packet(u8 *buf)
+{
+	memset(buf, 0, PLOYTEC_MIDI_OUT_OFFSET);
+}
+
 /*
  * Prime a freshly allocated playback buffer so the first URB, which is
  * submitted before any completion handler has run, carries a valid idle
@@ -449,7 +604,10 @@ static void jockey3_playback_callback(struct urb *urb)
 	struct jockey3_chip *chip = urb->context;
 	struct jockey3_pcm_urb_stream *urb_stream = &chip->playback;
 	unsigned char *buf = (unsigned char *)urb->transfer_buffer;
+	struct snd_pcm_substream *substream = NULL;
+	bool period_elapsed = false;
 	bool data_valid = true;
+	bool active = false;
 	bool stopping;
 	int i, ret;
 
@@ -473,6 +631,23 @@ static void jockey3_playback_callback(struct urb *urb)
 	if (unlikely(jockey3_is_disconnected(chip)))
 		return;
 
+	/* Step 1: Safely fetch the pointer and join the safe zone */
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		if (data_valid)
+			urb_stream->consec_errors = 0;
+
+		if (data_valid && !urb_stream->stopping &&
+		    urb_stream->running && urb_stream->substream) {
+			urb_stream->callbacks_active++;
+			active = true;
+			substream = urb_stream->substream;
+
+			period_elapsed = jockey3_process_out_packet(chip, buf);
+		} else {
+			jockey3_silence_out_packet(buf);
+		}
+	}
+
 	/*
 	 * Every packet reserves one slot for a MIDI OUT byte. Nothing feeds it
 	 * yet, so it carries the idle byte.
@@ -484,10 +659,21 @@ static void jockey3_playback_callback(struct urb *urb)
 	for (i = PLOYTEC_SYNC_BYTE_OFFSET + 1; i < PLOYTEC_PKT_SIZE; i++)
 		buf[i] = 0x00;
 
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
 	ret = 0;
 	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
-		if (data_valid)
-			urb_stream->consec_errors = 0;
+		/* Leave the safe zone; last one out wakes any waiter */
+		if (active && !--urb_stream->callbacks_active)
+			wake_up(&urb_stream->drain_wait);
 
 		/*
 		 * Keep resubmitting the URB while the interface is alive. The
@@ -591,7 +777,8 @@ static void jockey3_stop_urbs(struct jockey3_chip *chip)
 	/*
 	 * usb_kill_urb()/usb_kill_anchored_urbs() do not return until the
 	 * completion handler of each URB has finished, so no callback can still
-	 * be running once these return.
+	 * be in its safe zone once these return -- no separate drain is needed
+	 * here (jockey3_pcm_sync_stop() covers the ALSA buffer-teardown path).
 	 *
 	 * Worth spelling out for the anchored form, which keeps getting read as
 	 * a use-after-free: __usb_hcd_giveback_urb() does unanchor before
@@ -797,6 +984,190 @@ static int jockey3_set_rate(struct jockey3_chip *chip, unsigned int rate, bool c
 	return 0;
 }
 
+/*
+ * SNDRV_PCM_INFO_BATCH: the hardware pointer only advances once per completed
+ * bulk URB (a whole Ploytec frame group), never per sample, so userspace must
+ * not assume a sample-accurate position.
+ */
+#define JOCKEY3_PCM_INFO	(SNDRV_PCM_INFO_MMAP |		\
+				 SNDRV_PCM_INFO_INTERLEAVED |	\
+				 SNDRV_PCM_INFO_BLOCK_TRANSFER |\
+				 SNDRV_PCM_INFO_BATCH |		\
+				 SNDRV_PCM_INFO_MMAP_VALID)
+
+#define JOCKEY3_PCM_RATES	SNDRV_PCM_RATE_44100
+
+static const struct snd_pcm_hardware jockey3_pcm_hw_playback = {
+	.info			= JOCKEY3_PCM_INFO,
+	.formats		= SNDRV_PCM_FMTBIT_S24_3LE,
+	.rates			= JOCKEY3_PCM_RATES,
+	.rate_min		= 44100,
+	.rate_max		= 44100,
+	.channels_min		= 4,
+	.channels_max		= 4,
+	.buffer_bytes_max	= 1024 * 1024,
+	/*
+	 * One playback URB carries one packet of 10 frames * 4 channels * 3
+	 * bytes = 120 bytes. A URB reports at most one elapsed period, so the
+	 * minimum must cover at least one packet, or a period boundary inside a
+	 * URB could be missed entirely.
+	 */
+	.period_bytes_min	= PLOYTEC_PLAYBACK_FRAMES * 4 * 3,
+	.period_bytes_max	= 512 * 1024,
+	.periods_min		= 2,
+	.periods_max		= 1024,
+};
+
+static int jockey3_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	int ret;
+
+	dev_dbg(&chip->intf0->dev, "PCM open stream %d\n", substream->stream);
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	runtime->hw = jockey3_pcm_hw_playback;
+
+	/* The period accounting assumes a whole number of periods per buffer */
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
+
+	/* Substream registration under spinlock to ensure memory consistency to the ISR*/
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		urb_stream->substream = substream;
+	}
+
+	return 0;
+}
+
+static int jockey3_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+
+	dev_dbg(&chip->intf0->dev, "PCM close stream %d\n", substream->stream);
+
+	/*
+	 * No drain is needed here: the ALSA core has already run .sync_stop via
+	 * snd_pcm_release_substream() -> snd_pcm_drop() -> do_hw_free(), which is
+	 * also where runtime->dma_area is released.
+	 */
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		urb_stream->substream = NULL;
+		urb_stream->running = false;
+	}
+
+	return 0;
+}
+
+/**
+ * jockey3_pcm_sync_stop() - wait for in-flight URB callbacks to drain
+ * @substream: the substream being stopped
+ *
+ * Waits for every URB completion that could still touch this stream's substream
+ * or runtime->dma_area to leave its safe zone.
+ *
+ * The ALSA core calls this from snd_pcm_do_prepare() and from do_hw_free()
+ * *before* snd_pcm_lib_free_pages() releases the buffer, and only when the
+ * stream actually ran (runtime->stop_operating). It runs in process context
+ * with no stream lock held, so sleeping here is safe: a callback in its safe
+ * zone has dropped urb_stream->lock and may freely take the stream lock, so the
+ * stream lock -> urb_stream->lock order is never inverted.
+ *
+ * Return: 0 always; a timeout is logged but cannot usefully be reported.
+ */
+static int jockey3_pcm_sync_stop(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	long remaining;
+
+	spin_lock_irq(&urb_stream->lock);
+	remaining = wait_event_lock_irq_timeout(urb_stream->drain_wait,
+						urb_stream->callbacks_active == 0,
+						urb_stream->lock,
+						msecs_to_jiffies(1000));
+	spin_unlock_irq(&urb_stream->lock);
+
+	if (!remaining)
+		dev_err(&chip->intf0->dev,
+			"Timeout draining %s URB callbacks\n",
+			substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+
+	return 0;
+}
+
+static int jockey3_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+
+	dev_dbg(&chip->intf0->dev, "PCM prepare stream %d\n", substream->stream);
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		urb_stream->dma_off = 0;
+		urb_stream->period_off = 0;
+	}
+	return 0;
+}
+
+/*
+ * Called by the ALSA core with the substream stream lock held and interrupts
+ * disabled, so this callback must never sleep.
+ *
+ * Lock order here is snd_pcm_stream_lock -> urb_stream->lock, which is why the
+ * URB callbacks drop urb_stream->lock before calling snd_pcm_period_elapsed().
+ */
+static int jockey3_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+
+	dev_dbg(&chip->intf0->dev, "PCM trigger stream %d, cmd %d\n", substream->stream, cmd);
+
+	if (jockey3_is_disconnected(chip))
+		return -ENODEV;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_START:
+			urb_stream->running = true;
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+			urb_stream->running = false;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static snd_pcm_uframes_t jockey3_pcm_pointer(struct snd_pcm_substream *substream)
+{
+	struct jockey3_chip *chip = snd_pcm_substream_chip(substream);
+	struct jockey3_pcm_urb_stream *urb_stream =
+		jockey3_get_pcm_urb_stream(chip, substream->stream);
+	unsigned int dma_off;
+
+	scoped_guard(spinlock_irqsave, &urb_stream->lock) {
+		dma_off = urb_stream->dma_off;
+	}
+	return bytes_to_frames(substream->runtime, dma_off);
+}
+
 static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version)
 {
 	int ret;
@@ -820,6 +1191,15 @@ static int jockey3_initialize_ploytec(struct jockey3_chip *chip, u32 *fw_version
 	return 0;
 }
 
+static const struct snd_pcm_ops jockey3_pcm_ops = {
+	.open = jockey3_pcm_open,
+	.close = jockey3_pcm_close,
+	.prepare = jockey3_pcm_prepare,
+	.trigger = jockey3_pcm_trigger,
+	.sync_stop = jockey3_pcm_sync_stop,
+	.pointer = jockey3_pcm_pointer,
+};
+
 static int jockey3_initialize(struct jockey3_chip *chip, int model)
 {
 	int ret;
@@ -1051,6 +1431,44 @@ static int jockey3_validate_endpoints(struct usb_interface *intf0, struct usb_in
 	return 0;
 }
 
+/*
+ * Channel maps.
+ *
+ * This device exposes several independent stereo pairs, which is a different
+ * thing from a multichannel speaker arrangement -- and speaker positions are
+ * all the chmap enum can express. Claiming, say, RL/RR for the headphone pair
+ * would invite an audio server to treat a cue output as rear speakers, so the
+ * discrete pairs are reported as SNDRV_CHMAP_UNKNOWN.
+ *
+ * The one exception is the playback Master pair, which is marked FL/FR so that
+ * userspace (PipeWire and friends) can identify the device's primary output.
+ *
+ * Physical layout:
+ *   Playback: 1-2 Master Out L/R, 3-4 Headphone L/R
+ */
+static const struct snd_pcm_chmap_elem jockey3_playback_chmap[] = {
+	{ .channels = 4,
+	  .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
+		   SNDRV_CHMAP_UNKNOWN, SNDRV_CHMAP_UNKNOWN } },
+	{ }
+};
+
+static int jockey3_init_pcm(struct jockey3_chip *chip)
+{
+	int ret = snd_pcm_new(chip->card, CARD_NAME " Audio", 0, 1, 0, &chip->pcm);
+
+	if (ret < 0)
+		return ret;
+
+	strscpy(chip->pcm->name, CARD_NAME " Audio", sizeof(chip->pcm->name));
+	chip->pcm->private_data = chip;
+	snd_pcm_set_ops(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK, &jockey3_pcm_ops);
+	snd_pcm_set_managed_buffer_all(chip->pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
+
+	return snd_pcm_add_chmap_ctls(chip->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+				      jockey3_playback_chmap, 4, 0, NULL);
+}
+
 static void jockey3_setup_card_names(struct jockey3_chip *chip, int driver_info)
 {
 	/*
@@ -1097,7 +1515,7 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	 * devres unwind inside usb_unbind_interface(), where snd_card_free()
 	 * blocks until userspace closes every file descriptor on the card. On an
 	 * unplug that unwind runs on the USB hub work queue, so one process
-	 * holding the card open would stall hotplug for the whole hub. The card is
+	 * sitting on a PCM fd would stall hotplug for the whole hub. The card is
 	 * released from jockey3_disconnect() with snd_card_free_when_closed()
 	 * instead, which is what every other USB sound driver does; the
 	 * resources that outlive it go in card->private_free below.
@@ -1132,6 +1550,8 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 
 	init_usb_anchor(&chip->playback.anchor);
 	init_usb_anchor(&chip->capture.anchor);
+	init_waitqueue_head(&chip->playback.drain_wait);
+	init_waitqueue_head(&chip->capture.drain_wait);
 
 	/*
 	 * From here on every failure goes to err_free_card, and the card slot is
@@ -1168,6 +1588,10 @@ static int jockey3_probe(struct usb_interface *intf, const struct usb_device_id
 	if (ret < 0)
 		goto err_free_card;
 
+	ret = jockey3_init_pcm(chip);
+	if (ret < 0)
+		goto err_free_card;
+
 	jockey3_setup_card_names(chip, usb_id->driver_info);
 
 	if (card->id[0] == '\0')
@@ -1220,7 +1644,8 @@ static void jockey3_disconnect(struct usb_interface *intf)
 	struct jockey3_chip *chip = usb_get_intfdata(intf);
 
 	/*
-	 * Latch DISCONNECTED first, and for EITHER interface.
+	 * Latch DISCONNECTED first, and for EITHER interface. Every ALSA entry
+	 * point tests it on the way in.
 	 *
 	 * Doing it for interface 1 as well is what covers the unbind order. The
 	 * driver is bound to both interfaces and the USB core takes them down
@@ -1260,7 +1685,10 @@ static void jockey3_disconnect(struct usb_interface *intf)
 		 * snd_card_free_when_closed() disconnects the card now and frees
 		 * it once userspace has closed it -- it never blocks, which is
 		 * the whole point of not using a managed card (see the comment in
-		 * jockey3_probe()). @chip lives in card->private_data and may be gone
+		 * jockey3_probe()). It runs snd_pcm_stop(DISCONNECTED) under the
+		 * stream lock on the way, which drives our .trigger and clears
+		 * 'running' with the proper locking, so there is nothing to clear
+		 * here by hand. @chip lives in card->private_data and may be gone
 		 * the moment this returns, so nothing below may touch it.
 		 */
 		snd_card_free_when_closed(chip->card);
@@ -1302,3 +1730,4 @@ module_usb_driver(jockey3_driver);
 MODULE_AUTHOR("Frank van de Pol <fvdpol@gmail.com>");
 MODULE_DESCRIPTION(CARD_NAME " ALSA Driver");
 MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: snd-pcm");
diff --git a/sound/usb/jockey3/ploytec_codec.c b/sound/usb/jockey3/ploytec_codec.c
new file mode 100644
index 0000000000000..2c431853b8434
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_codec.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec PCM encoding functions for the S24_3LE format (3 bytes per sample)
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#include <linux/string.h>
+#include "ploytec_codec.h"
+
+/**
+ * DOC: Why the wire format looks like this
+ *
+ * The "bit-plane" layout implemented below is not an arbitrary scramble; it is
+ * a direct image of how the hardware moves audio. On the Jockey 3 the USB
+ * device controller (NXP ISP1583) runs in split-bus mode, and the serial
+ * data lines of the capture ADCs are wired straight onto the low bits of its
+ * 16-bit DMA bus - one converter per bus bit. The controller samples the whole
+ * bus once per bit clock and streams the result to the host, so every byte on
+ * the wire is a snapshot of all the channel data lines at one instant.
+ *
+ * Decoding a frame is therefore a transpose:
+ *
+ * - The byte index is one bit-clock tick, most significant bit first: wire
+ *   byte 0 carries bit 23 of the current sample, wire byte 23 carries bit 0.
+ * - The bit position within each byte is one physical converter line, that is
+ *   one channel (bit 0, bit 1, bit 2, ... for successive converters).
+ * - The frame is two 24-byte halves, the left and right sub-frames of the
+ *   underlying I2S frame. On capture an 8-byte gap sits between and after the
+ *   halves: it is the unused tail of each 32-bit I2S slot (64-byte frame).
+ *   Playback is generated on the byte-wide microprocessor bus instead, so its
+ *   slots are packed to 24 bits with no gap (48-byte frame).
+ *
+ * Because the geometry follows from the I2S timing and the DMA bus width, it
+ * is fixed regardless of how many converters are populated. That is why the
+ * codec always works in 8-channel-wide slices and simply ignores the bit
+ * positions that carry no converter (the Jockey 3 populates three capture
+ * lines and two playback lines).
+ *
+ * This is a model inferred from the board schematic and the observed stream
+ * rather than from vendor documentation, but it accounts for every bit of the
+ * format the functions below implement.
+ */
+
+/*
+ * This implementation of the Ploytec codec performs a bit gather/scatter
+ * operation with minimal optimization. It mainly serves as a readable
+ * definition of the wire format.
+ */
+
+/**
+ * ploytec_encode_s24_3le() - Encode 4-channel S24_3LE to 48-byte Ploytec frame
+ * @dest: 48-byte destination buffer
+ * @src: 12-byte source buffer (4 channels * 3 bytes)
+ *
+ * Ploytec Bit-Plane Interleaving (Playback):
+ * The firmware uses a non-standard "bit-plane" format where bits from different
+ * channels are interleaved into the same byte.
+ * - Each 48-byte frame carries one PCM frame: a single sample for each of
+ *   the 4 channels, spread one bit per wire byte.
+ * - Bytes 0-23: ALSA Channels 1 & 3
+ * - Bytes 24-47: ALSA Channels 2 & 4
+ * - Within each 24-byte block, bits are grouped by significance:
+ *   - [0-7]: Most significant bits
+ *   - [8-15]: Middle bits
+ *   - [16-23]: Least significant bits
+ * - bit 0 of each byte corresponds to the first channel in the pair.
+ * - bit 1 of each byte corresponds to the second channel in the pair.
+ */
+static inline void ploytec_encode_s24_3le(u8 *dest, const u8 *src)
+{
+	int i;
+
+	for (i = 0; i < 8; i++) {
+		/* First 24 bytes: odd channels (ALSA Ch 1 & 3) */
+		dest[i]      = (((src[2] >> (7 - i)) & 1) << 0) | (((src[8] >> (7 - i)) & 1) << 1);
+		dest[8 + i]  = (((src[1] >> (7 - i)) & 1) << 0) | (((src[7] >> (7 - i)) & 1) << 1);
+		dest[16 + i] = (((src[0] >> (7 - i)) & 1) << 0) | (((src[6] >> (7 - i)) & 1) << 1);
+
+		/* Second 24 bytes: even channels (ALSA Ch 2 & 4) */
+		dest[24 + i] = (((src[5] >> (7 - i)) & 1) << 0) | (((src[11] >> (7 - i)) & 1) << 1);
+		dest[32 + i] = (((src[4] >> (7 - i)) & 1) << 0) | (((src[10] >> (7 - i)) & 1) << 1);
+		dest[40 + i] = (((src[3] >> (7 - i)) & 1) << 0) | (((src[9]  >> (7 - i)) & 1) << 1);
+	}
+}
+
+/**
+ * ploytec_encode_batch() - Encode a number of 4-channel S24_3LE to 48-byte Ploytec frames
+ * @dest: n_frames * 48-byte destination buffer (Ploytec playback frame)
+ * @src: n_frames * 12-byte source buffer (4 channels * 3 bytes)
+ * @n_frames: number of frames to process in this batch
+ */
+void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames)
+{
+	for (int f = 0; f < n_frames; f++) {
+		ploytec_encode_s24_3le(dest, src);
+		dest += PLOYTEC_PLAYBACK_FRAME_SIZE;
+		src += PLOYTEC_PLAYBACK_PCM_FRAME_SIZE;
+	}
+}
diff --git a/sound/usb/jockey3/ploytec_codec.h b/sound/usb/jockey3/ploytec_codec.h
new file mode 100644
index 0000000000000..32660f1b4350a
--- /dev/null
+++ b/sound/usb/jockey3/ploytec_codec.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   ALSA driver for Reloop Jockey 3 devices
+ *   Ploytec PCM encoding functions for the S24_3LE format (3 bytes per sample)
+ *
+ *   Copyright (c) 2026 by Frank van de Pol <fvdpol@gmail.com>
+ */
+
+#ifndef __SOUND_USB_JOCKEY3_PLOYTEC_CODEC_H
+#define __SOUND_USB_JOCKEY3_PLOYTEC_CODEC_H
+
+#include <linux/types.h>
+
+/*
+ * Playback: 4 channels of S24_3LE (3 bytes/sample).
+ * The *_FRAME_SIZE values are the Ploytec wire format; the *_PCM_FRAME_SIZE
+ * values are the corresponding ALSA-side frame.
+ */
+#define PLOYTEC_PLAYBACK_FRAMES		10	// number of samples per frame
+#define PLOYTEC_PLAYBACK_FRAME_SIZE	48
+#define PLOYTEC_PLAYBACK_PCM_FRAME_SIZE	12	// 4 channels * 3 bytes
+
+/* batching of the sample processing */
+void ploytec_encode_batch(u8 *dest, const u8 *src, const int n_frames);
+
+#endif /* __SOUND_USB_JOCKEY3_PLOYTEC_CODEC_H */
-- 
2.47.3

