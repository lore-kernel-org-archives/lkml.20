Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF344A3F9;
	Thu,  3 Sep 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451513; cv=none; b=DIxsM5H2cn6YC08/tSkPYojZvq7sz+sVMXe2ldcy77gr9OAXgW/9zEsrMuWT/STj7t4d9zgOBs4KSf3rOaJQt/OiilmRG8EGv1xwIusR+/8PPKCJ/ddoxBu3lai32ReMdDqk/mMDzYpdM2YUqT/QslawrvPJ+caw99+7UGbgL7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451513; c=relaxed/simple;
	bh=17RZR2ZTMt59sbwE6Mx8M/WpENZsr6g+2QL+Zhn3GOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnrGrEsW07+hbAgzPXiCH14seZN13RiT1WfT2nhcWA0OCvFveLiDt/jkp0x5XmaR0D8OF9Byyl84sIsaqtLPcmumwfyaD3eri0YrOd8crvvb/J72k4gfLAGhaMfgeipAOwRTWOJ79UrDLgvdZNVowE1heXRxYI8HlWPAVevFCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RKeubK/D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=97CXDKZT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oRtIfLCl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3yXVa0Ro; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RKeubK/D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="97CXDKZT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oRtIfLCl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3yXVa0Ro"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D84AF1FAC5;
	Thu,  3 Sep 2026 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpFSt+M0gpbm3frk/kVuPHJG1gAoCphQnHc2kyplzUU=;
	b=RKeubK/DnJ4KIaWzkHLFYF73WgVMis7ejEXObz94cgqALbI5dfZYDM/IIwP4aOun4jeotI
	gDd5YwBW1AGyR5U7vBNfnV7NcIMU/WOdXJNjevf0wKXilZlzav8+WqQtAZPvbpd42Jyyju
	nlEB5tB02kAOs6ngqD+riHTbekT1ckc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpFSt+M0gpbm3frk/kVuPHJG1gAoCphQnHc2kyplzUU=;
	b=97CXDKZTpFxoYDxw2zRln4pC5/LboXleYY37xS1Z4VDmnGvIcd1UzqugWehy5mSZ2p0ro4
	I/ewDv1rVJENreBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oRtIfLCl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3yXVa0Ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpFSt+M0gpbm3frk/kVuPHJG1gAoCphQnHc2kyplzUU=;
	b=oRtIfLCl4Q6thfoxg/dR7db2wXySUdP4ieSeuSLdXdjjzZu0bOIMUr+H/vX6bNiXVD0zAE
	vWZdvEoizWghNm7Nl+bse9D30r6ey19FYz9yDVW+PYy+ECHrHCUWhQxgsl55JNGBcpc3n/
	npYPPHMZykoWemTsRgDncmU1DgcBfqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpFSt+M0gpbm3frk/kVuPHJG1gAoCphQnHc2kyplzUU=;
	b=3yXVa0RowgGbyFymZb3hOvPe0/xVoAPOa+x1N9YAKVtcoxL6TG6ToR4cE0e53n1ldE4AHm
	xjkV18WX88+M0qCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96278136E6;
	Thu,  3 Sep 2026 16:05:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eIN3I6yamWo2dQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 16:05:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH v2 1/3] ALSA: usb: ua101: Avoid embedded URBs
Date: Thu,  3 Sep 2026 18:04:37 +0200
Message-ID: <20260903160458.1938392-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903160458.1938392-1-tiwai@suse.de>
References: <20260903160458.1938392-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: D84AF1FAC5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

UA101 driver uses URBs embedded in struct ua101, and this is basically
a buggy implementation nowadays; since a URB is managed with a
refcount, this may lead to a UAF when the URB is released
asynchronously.

For addressing the problem, this patch converts the embedded URBs to
ones that are properly allocated via usb_alloc_urb().  The
iso_frame_desc[] is gone, as it's allocated together by
usb_alloc_urb().

Along with the dynamic allocation of each URB, the ua101.urbs[]
becomes a static array of struct ua101_urb, and struct ua101_urb
contains the pointer to struct ua101.  Those are needed to handle the
ready_list linked list in the complete callback.

No functional changes, only compile-tested.

Link: https://lore.kernel.org/20260903130757.0668310a.michal.pecio@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/misc/ua101.c | 102 ++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 48 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index b9a62e94e06c..860a62a3d74b 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -109,10 +109,10 @@ struct ua101 {
 		unsigned int buffer_pos;
 		unsigned int queue_length;
 		struct ua101_urb {
-			struct urb urb;
-			struct usb_iso_packet_descriptor iso_frame_desc[1];
+			struct urb *urb;
 			struct list_head ready_list;
-		} *urbs[MAX_QUEUE_LENGTH];
+			struct ua101 *ua;
+		} urbs[MAX_QUEUE_LENGTH];
 		struct {
 			unsigned int size;
 			void *addr;
@@ -167,15 +167,15 @@ static void abort_usb_playback(struct ua101 *ua)
 		wake_up(&ua->alsa_playback_wait);
 }
 
-static void playback_urb_complete(struct urb *usb_urb)
+static void playback_urb_complete(struct urb *urb)
 {
-	struct ua101_urb *urb = (struct ua101_urb *)usb_urb;
-	struct ua101 *ua = urb->urb.context;
+	struct ua101_urb *ua_urb = urb->context;
+	struct ua101 *ua = ua_urb->ua;
 
-	if (unlikely(urb->urb.status == -ENOENT ||	/* unlinked */
-		     urb->urb.status == -ENODEV ||	/* device removed */
-		     urb->urb.status == -ECONNRESET ||	/* unlinked */
-		     urb->urb.status == -ESHUTDOWN)) {	/* device disabled */
+	if (unlikely(urb->status == -ENOENT ||	/* unlinked */
+		     urb->status == -ENODEV ||	/* device removed */
+		     urb->status == -ECONNRESET ||	/* unlinked */
+		     urb->status == -ESHUTDOWN)) {	/* device disabled */
 		abort_usb_playback(ua);
 		abort_alsa_playback(ua);
 		return;
@@ -184,18 +184,19 @@ static void playback_urb_complete(struct urb *usb_urb)
 	if (test_bit(USB_PLAYBACK_RUNNING, &ua->states)) {
 		/* append URB to FIFO */
 		guard(spinlock_irqsave)(&ua->lock);
-		list_add_tail(&urb->ready_list, &ua->ready_playback_urbs);
+		list_add_tail(&ua_urb->ready_list, &ua->ready_playback_urbs);
 		if (ua->rate_feedback_count > 0)
 			queue_work(system_highpri_wq, &ua->playback_work);
 		ua->playback.substream->runtime->delay -=
-				urb->urb.iso_frame_desc[0].length /
+				urb->iso_frame_desc[0].length /
 						ua->playback.frame_bytes;
 	}
 }
 
 static void first_playback_urb_complete(struct urb *urb)
 {
-	struct ua101 *ua = urb->context;
+	struct ua101_urb *ua_urb = urb->context;
+	struct ua101 *ua = ua_urb->ua;
 
 	urb->complete = playback_urb_complete;
 	playback_urb_complete(urb);
@@ -248,7 +249,8 @@ static void playback_work(struct work_struct *work)
 {
 	struct ua101 *ua = container_of(work, struct ua101, playback_work);
 	unsigned int frames;
-	struct ua101_urb *urb;
+	struct ua101_urb *ua_urb;
+	struct urb *urb;
 	bool do_period_elapsed = false;
 	int err;
 
@@ -275,23 +277,24 @@ static void playback_work(struct work_struct *work)
 			ua->rate_feedback_count--;
 
 			/* take URB out of FIFO */
-			urb = list_first_entry(&ua->ready_playback_urbs,
-					       struct ua101_urb, ready_list);
-			list_del(&urb->ready_list);
+			ua_urb = list_first_entry(&ua->ready_playback_urbs,
+						  struct ua101_urb, ready_list);
+			list_del(&ua_urb->ready_list);
+			urb = ua_urb->urb;
 
 			/* fill packet with data or silence */
-			urb->urb.iso_frame_desc[0].length =
+			urb->iso_frame_desc[0].length =
 				frames * ua->playback.frame_bytes;
 			if (test_bit(ALSA_PLAYBACK_RUNNING, &ua->states))
 				do_period_elapsed |= copy_playback_data(&ua->playback,
-									&urb->urb,
+									urb,
 									frames);
 			else
-				memset(urb->urb.transfer_buffer, 0,
-				       urb->urb.iso_frame_desc[0].length);
+				memset(urb->transfer_buffer, 0,
+				       urb->iso_frame_desc[0].length);
 
 			/* and off you go ... */
-			err = usb_submit_urb(&urb->urb, GFP_ATOMIC);
+			err = usb_submit_urb(urb, GFP_ATOMIC);
 			if (unlikely(err < 0)) {
 				abort_usb_playback(ua);
 				abort_alsa_playback(ua);
@@ -342,7 +345,8 @@ static bool copy_capture_data(struct ua101_stream *stream, struct urb *urb,
 
 static void capture_urb_complete(struct urb *urb)
 {
-	struct ua101 *ua = urb->context;
+	struct ua101_urb *ua_urb = urb->context;
+	struct ua101 *ua = ua_urb->ua;
 	struct ua101_stream *stream = &ua->capture;
 	unsigned int frames, write_ptr;
 	bool do_period_elapsed;
@@ -413,7 +417,8 @@ static void capture_urb_complete(struct urb *urb)
 
 static void first_capture_urb_complete(struct urb *urb)
 {
-	struct ua101 *ua = urb->context;
+	struct ua101_urb *ua_urb = urb->context;
+	struct ua101 *ua = ua_urb->ua;
 
 	urb->complete = capture_urb_complete;
 	capture_urb_complete(urb);
@@ -427,7 +432,7 @@ static int submit_stream_urbs(struct ua101 *ua, struct ua101_stream *stream)
 	unsigned int i;
 
 	for (i = 0; i < stream->queue_length; ++i) {
-		int err = usb_submit_urb(&stream->urbs[i]->urb, GFP_KERNEL);
+		int err = usb_submit_urb(stream->urbs[i].urb, GFP_KERNEL);
 		if (err < 0) {
 			dev_err(&ua->dev->dev, "USB request error %d: %s\n",
 				err, usb_error_string(err));
@@ -442,8 +447,8 @@ static void kill_stream_urbs(struct ua101_stream *stream)
 	unsigned int i;
 
 	for (i = 0; i < stream->queue_length; ++i)
-		if (stream->urbs[i])
-			usb_kill_urb(&stream->urbs[i]->urb);
+		if (stream->urbs[i].urb)
+			usb_kill_urb(stream->urbs[i].urb);
 }
 
 static int enable_iso_interface(struct ua101 *ua, unsigned int intf_index)
@@ -508,7 +513,7 @@ static int start_usb_capture(struct ua101 *ua)
 		return err;
 
 	clear_bit(CAPTURE_URB_COMPLETED, &ua->states);
-	ua->capture.urbs[0]->urb.complete = first_capture_urb_complete;
+	ua->capture.urbs[0].urb->complete = first_capture_urb_complete;
 	ua->rate_feedback_start = 0;
 	ua->rate_feedback_count = 0;
 
@@ -550,7 +555,7 @@ static int start_usb_playback(struct ua101 *ua)
 		return err;
 
 	clear_bit(PLAYBACK_URB_COMPLETED, &ua->states);
-	ua->playback.urbs[0]->urb.complete =
+	ua->playback.urbs[0].urb->complete =
 		first_playback_urb_complete;
 	scoped_guard(spinlock_irq, &ua->lock) {
 		INIT_LIST_HEAD(&ua->ready_playback_urbs);
@@ -580,7 +585,7 @@ static int start_usb_playback(struct ua101 *ua)
 			add_with_wraparound(ua, &ua->rate_feedback_start, 1);
 			ua->rate_feedback_count--;
 		}
-		urb = &ua->playback.urbs[i]->urb;
+		urb = ua->playback.urbs[i].urb;
 		urb->iso_frame_desc[0].length =
 			frames * ua->playback.frame_bytes;
 		memset(urb->transfer_buffer, 0,
@@ -1059,7 +1064,7 @@ static int alloc_stream_urbs(struct ua101 *ua, struct ua101_stream *stream,
 			     void (*urb_complete)(struct urb *))
 {
 	unsigned max_packet_size = stream->max_packet_bytes;
-	struct ua101_urb *urb;
+	struct urb *urb;
 	unsigned int b, u = 0;
 
 	for (b = 0; b < ARRAY_SIZE(stream->buffers); ++b) {
@@ -1070,23 +1075,24 @@ static int alloc_stream_urbs(struct ua101 *ua, struct ua101_stream *stream,
 		while (size >= max_packet_size) {
 			if (u >= stream->queue_length)
 				goto bufsize_error;
-			urb = kmalloc_obj(*urb);
+			urb = usb_alloc_urb(1, GFP_KERNEL);
 			if (!urb)
 				return -ENOMEM;
-			usb_init_urb(&urb->urb);
-			urb->urb.dev = ua->dev;
-			urb->urb.pipe = stream->usb_pipe;
-			urb->urb.transfer_flags = URB_NO_TRANSFER_DMA_MAP;
-			urb->urb.transfer_buffer = addr;
-			urb->urb.transfer_dma = dma;
-			urb->urb.transfer_buffer_length = max_packet_size;
-			urb->urb.number_of_packets = 1;
-			urb->urb.interval = 1;
-			urb->urb.context = ua;
-			urb->urb.complete = urb_complete;
-			urb->urb.iso_frame_desc[0].offset = 0;
-			urb->urb.iso_frame_desc[0].length = max_packet_size;
-			stream->urbs[u++] = urb;
+			urb->dev = ua->dev;
+			urb->pipe = stream->usb_pipe;
+			urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
+			urb->transfer_buffer = addr;
+			urb->transfer_dma = dma;
+			urb->transfer_buffer_length = max_packet_size;
+			urb->number_of_packets = 1;
+			urb->interval = 1;
+			urb->context = &stream->urbs[u];
+			urb->complete = urb_complete;
+			urb->iso_frame_desc[0].offset = 0;
+			urb->iso_frame_desc[0].length = max_packet_size;
+			stream->urbs[u].ua = ua;
+			stream->urbs[u].urb = urb;
+			u++;
 			size -= max_packet_size;
 			addr += max_packet_size;
 			dma += max_packet_size;
@@ -1104,8 +1110,8 @@ static void free_stream_urbs(struct ua101_stream *stream)
 	unsigned int i;
 
 	for (i = 0; i < stream->queue_length; ++i) {
-		kfree(stream->urbs[i]);
-		stream->urbs[i] = NULL;
+		usb_free_urb(stream->urbs[i].urb);
+		stream->urbs[i].urb = NULL;
 	}
 }
 
-- 
2.55.0

