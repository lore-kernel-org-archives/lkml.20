Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C3D4BD109;
	Thu,  3 Sep 2026 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447432; cv=none; b=j248OlJsm7+RS2FiTO8TiLNv6Y7jvUWxAjc+yaBT7FKNn9m44vgbDaeOOQ+PiQjCuz8uwthWTu+kfX1gNz+3L4Om2HO4s/LaIUXrTsYmPwYrDCQteKJNWYiNU3WWY4w40YmWT0WlUwLxPOCs4lsJ1fXYtz3/DYWx1rU1yyunQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447432; c=relaxed/simple;
	bh=GDa3uB0fkXXrQgDiPTKMksox3GMZrL1iToldyS3dAEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhXWd5TmqZr/GoVrfnFaNAAvp/rhi20LcDEH7hWEq+HJ0M7Hn0k1nGp/4OPrbpriqHyOWaQ+ABnp1LMVC2WP4bOLVNnbKzsfXtaSwXVV1nnIsSQMZkwU/AhD6EX7G4l/z6TMsZlPP5wOGoyPs9gYfwd8s8zyRoDA7pglfGy+EkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hMk2IhcR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/frv8Cyo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S2J4bK2x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V/sC2u9V; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hMk2IhcR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/frv8Cyo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S2J4bK2x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V/sC2u9V"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE8D421EE8;
	Thu,  3 Sep 2026 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788447422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmshAJ1731Boww9npn0a+nbYqHhhHkrhDKX1ASn8WdY=;
	b=hMk2IhcRtY7juh5BEsW7hlpIbbugQK5bsC/7vxzWSdXgg78FTQKoQrejhtpEWcxWa/YsdL
	iA/gBpsEVN+0vInA7Dd5YejEzaCmwRBAXlc+JBjLZFFUvfDPTIWvq94UGLfZ/UwVMpfmuH
	THfRqMzo6gr+t3ApkypdgUkNulM5Ui4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788447422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmshAJ1731Boww9npn0a+nbYqHhhHkrhDKX1ASn8WdY=;
	b=/frv8CyoDGy2ByD5pDztavngwBh2ZduGRWSbfiF0TRV6lyZUGjz0pT4EnNYNUs12+ww1WB
	hKbz7xKaDX/EmSDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S2J4bK2x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="V/sC2u9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788447418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmshAJ1731Boww9npn0a+nbYqHhhHkrhDKX1ASn8WdY=;
	b=S2J4bK2xmlmRA4H4jVaYzW44BQmsRgy2YjESuyGSeNdNdT79IDWNnovLhjl27i+KcQFbgy
	gE3QQEdxv/IG7e8HN0foMGwdnoWRvIJl1XfA6FkZrZa4lON4Xis6BUw8ITurw0lqczBqjm
	y/9yHFZBUYIJnC+S+ohwzzwFmxlRgxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788447418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmshAJ1731Boww9npn0a+nbYqHhhHkrhDKX1ASn8WdY=;
	b=V/sC2u9Vw6NosUMZoPJsQSANvdWPhDX3FbuGT908zqZka3ouhDMa0EobhMEmhnMNlt7Btl
	qHMvV6bFuLEkQhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75F0B13869;
	Thu,  3 Sep 2026 14:56:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SOqsG7qKmWo6MQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 14:56:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH 3/3] ALSA: usb: 6fire: Avoid embedded URBs
Date: Thu,  3 Sep 2026 16:56:45 +0200
Message-ID: <20260903145648.1914352-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903145648.1914352-1-tiwai@suse.de>
References: <20260903145648.1914352-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AE8D421EE8
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.01

The USB 6fire driver uses URBs embedded in different structs for PCM,
MIDI and communication, and this is basically a buggy implementation
nowadays; since a URB is managed with a refcount, this may lead to a
UAF when the URB is released asynchronously.

For addressing the problem, this patch converts those embedded URBs to
ones that are properly allocated via usb_alloc_urb().  The
pcm_urb.packets[] is gone, as it's allocated by usb_alloc_urb(), hence
it's found in urb.iso_frame_desc[] instead.

The conversions are rather straightforward; each embedded struct urb
is changed to a pointer, and its callers are updated accordingly.
The resource for those structs are released in the common destructor
functions (usb6fire_comm_free(), etc), which are called at both the
init error path and the disconnect.

No functional changes, only compile-tested.

Link: https://lore.kernel.org/20260903130757.0668310a.michal.pecio@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/comm.c |  35 +++++++-----
 sound/usb/6fire/comm.h |   2 +-
 sound/usb/6fire/midi.c |  36 ++++++++-----
 sound/usb/6fire/midi.h |   2 +-
 sound/usb/6fire/pcm.c  | 120 +++++++++++++++++++++++------------------
 sound/usb/6fire/pcm.h  |   5 +-
 6 files changed, 117 insertions(+), 83 deletions(-)

diff --git a/sound/usb/6fire/comm.c b/sound/usb/6fire/comm.c
index d3b7cab85699..878e9b71076a 100644
--- a/sound/usb/6fire/comm.c
+++ b/sound/usb/6fire/comm.c
@@ -21,7 +21,6 @@ enum {
 static void usb6fire_comm_init_urb(struct comm_runtime *rt, struct urb *urb,
 		u8 *buffer, void *context, void(*handler)(struct urb *urb))
 {
-	usb_init_urb(urb);
 	urb->transfer_buffer = buffer;
 	urb->pipe = usb_sndintpipe(rt->chip->dev, COMM_EP);
 	urb->complete = handler;
@@ -142,6 +141,13 @@ static int usb6fire_comm_write16(struct comm_runtime *rt, u8 request,
 	return ret;
 }
 
+static void usb6fire_comm_free(struct comm_runtime *rt)
+{
+	usb_free_urb(rt->receiver);
+	kfree(rt->receiver_buffer);
+	kfree(rt);
+}
+
 int usb6fire_comm_init(struct sfire_chip *chip)
 {
 	struct comm_runtime *rt = kzalloc_obj(struct comm_runtime);
@@ -153,14 +159,18 @@ int usb6fire_comm_init(struct sfire_chip *chip)
 
 	rt->receiver_buffer = kzalloc(COMM_RECEIVER_BUFSIZE, GFP_KERNEL);
 	if (!rt->receiver_buffer) {
-		kfree(rt);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto error;
 	}
 
-	urb = &rt->receiver;
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb) {
+		ret = -ENOMEM;
+		goto error;
+	}
+	rt->receiver = urb;
 	rt->serial = 1;
 	rt->chip = chip;
-	usb_init_urb(urb);
 	rt->init_urb = usb6fire_comm_init_urb;
 	rt->write8 = usb6fire_comm_write8;
 	rt->write16 = usb6fire_comm_write16;
@@ -175,13 +185,15 @@ int usb6fire_comm_init(struct sfire_chip *chip)
 	urb->interval = 1;
 	ret = usb_submit_urb(urb, GFP_KERNEL);
 	if (ret < 0) {
-		kfree(rt->receiver_buffer);
-		kfree(rt);
 		dev_err(&chip->dev->dev, "cannot create comm data receiver.");
-		return ret;
+		goto error;
 	}
 	chip->comm = rt;
 	return 0;
+
+ error:
+	usb6fire_comm_free(rt);
+	return ret;
 }
 
 void usb6fire_comm_abort(struct sfire_chip *chip)
@@ -189,14 +201,11 @@ void usb6fire_comm_abort(struct sfire_chip *chip)
 	struct comm_runtime *rt = chip->comm;
 
 	if (rt)
-		usb_poison_urb(&rt->receiver);
+		usb_poison_urb(rt->receiver);
 }
 
 void usb6fire_comm_destroy(struct sfire_chip *chip)
 {
-	struct comm_runtime *rt = chip->comm;
-
-	kfree(rt->receiver_buffer);
-	kfree(rt);
+	usb6fire_comm_free(chip->comm);
 	chip->comm = NULL;
 }
diff --git a/sound/usb/6fire/comm.h b/sound/usb/6fire/comm.h
index 2447d7ecf179..89976f510f6c 100644
--- a/sound/usb/6fire/comm.h
+++ b/sound/usb/6fire/comm.h
@@ -19,7 +19,7 @@ enum /* settings for comm */
 struct comm_runtime {
 	struct sfire_chip *chip;
 
-	struct urb receiver;
+	struct urb *receiver;
 	u8 *receiver_buffer;
 
 	u8 serial; /* urb serial */
diff --git a/sound/usb/6fire/midi.c b/sound/usb/6fire/midi.c
index 6b0bb096f27a..4e3b749ffccd 100644
--- a/sound/usb/6fire/midi.c
+++ b/sound/usb/6fire/midi.c
@@ -66,7 +66,7 @@ static void usb6fire_midi_out_trigger(
 		struct snd_rawmidi_substream *alsa_sub, int up)
 {
 	struct midi_runtime *rt = alsa_sub->rmidi->private_data;
-	struct urb *urb = &rt->out_urb;
+	struct urb *urb = rt->out_urb;
 	__s8 ret;
 
 	guard(spinlock_irqsave)(&rt->out_lock);
@@ -137,6 +137,13 @@ static const struct snd_rawmidi_ops in_ops = {
 	.trigger = usb6fire_midi_in_trigger
 };
 
+static void usb6fire_midi_free(struct midi_runtime *rt)
+{
+	usb_free_urb(rt->out_urb);
+	kfree(rt->out_buffer);
+	kfree(rt);
+}
+
 int usb6fire_midi_init(struct sfire_chip *chip)
 {
 	int ret;
@@ -148,8 +155,14 @@ int usb6fire_midi_init(struct sfire_chip *chip)
 
 	rt->out_buffer = kzalloc(MIDI_BUFSIZE, GFP_KERNEL);
 	if (!rt->out_buffer) {
-		kfree(rt);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	rt->out_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!rt->out_urb) {
+		ret = -ENOMEM;
+		goto error;
 	}
 
 	rt->chip = chip;
@@ -160,15 +173,13 @@ int usb6fire_midi_init(struct sfire_chip *chip)
 	spin_lock_init(&rt->in_lock);
 	spin_lock_init(&rt->out_lock);
 
-	comm_rt->init_urb(comm_rt, &rt->out_urb, rt->out_buffer, rt,
+	comm_rt->init_urb(comm_rt, rt->out_urb, rt->out_buffer, rt,
 			usb6fire_midi_out_handler);
 
 	ret = snd_rawmidi_new(chip->card, "6FireUSB", 0, 1, 1, &rt->instance);
 	if (ret < 0) {
-		kfree(rt->out_buffer);
-		kfree(rt);
 		dev_err(&chip->dev->dev, "unable to create midi.\n");
-		return ret;
+		goto error;
 	}
 	rt->instance->private_data = rt;
 	strscpy(rt->instance->name, "DMX6FireUSB MIDI");
@@ -182,6 +193,10 @@ int usb6fire_midi_init(struct sfire_chip *chip)
 
 	chip->midi = rt;
 	return 0;
+
+ error:
+	usb6fire_midi_free(rt);
+	return ret;
 }
 
 void usb6fire_midi_abort(struct sfire_chip *chip)
@@ -189,14 +204,11 @@ void usb6fire_midi_abort(struct sfire_chip *chip)
 	struct midi_runtime *rt = chip->midi;
 
 	if (rt)
-		usb_poison_urb(&rt->out_urb);
+		usb_poison_urb(rt->out_urb);
 }
 
 void usb6fire_midi_destroy(struct sfire_chip *chip)
 {
-	struct midi_runtime *rt = chip->midi;
-
-	kfree(rt->out_buffer);
-	kfree(rt);
+	usb6fire_midi_free(chip->midi);
 	chip->midi = NULL;
 }
diff --git a/sound/usb/6fire/midi.h b/sound/usb/6fire/midi.h
index 47640c845903..8716ab8a863a 100644
--- a/sound/usb/6fire/midi.h
+++ b/sound/usb/6fire/midi.h
@@ -22,7 +22,7 @@ struct midi_runtime {
 	spinlock_t in_lock;
 	spinlock_t out_lock;
 	struct snd_rawmidi_substream *out;
-	struct urb out_urb;
+	struct urb *out_urb;
 	u8 out_serial; /* serial number of out packet */
 	u8 *out_buffer;
 	int buffer_offset;
diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index d2e274b731fe..c57ef2c9f004 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -138,8 +138,8 @@ static void usb6fire_pcm_stream_stop(struct pcm_runtime *rt)
 		rt->stream_state = STREAM_STOPPING;
 
 		for (i = 0; i < PCM_N_URBS; i++) {
-			usb_kill_urb(&rt->in_urbs[i].instance);
-			usb_kill_urb(&rt->out_urbs[i].instance);
+			usb_kill_urb(rt->in_urbs[i].instance);
+			usb_kill_urb(rt->out_urbs[i].instance);
 		}
 		ctrl_rt->usb_streaming = false;
 		ctrl_rt->update_streaming(ctrl_rt);
@@ -161,13 +161,13 @@ static int usb6fire_pcm_stream_start(struct pcm_runtime *rt)
 		rt->stream_state = STREAM_STARTING;
 		for (i = 0; i < PCM_N_URBS; i++) {
 			for (k = 0; k < PCM_N_PACKETS_PER_URB; k++) {
-				packet = &rt->in_urbs[i].packets[k];
+				packet = &rt->in_urbs[i].instance->iso_frame_desc[k];
 				packet->offset = k * rt->in_packet_size;
 				packet->length = rt->in_packet_size;
 				packet->actual_length = 0;
 				packet->status = 0;
 			}
-			ret = usb_submit_urb(&rt->in_urbs[i].instance,
+			ret = usb_submit_urb(rt->in_urbs[i].instance,
 					GFP_ATOMIC);
 			if (ret) {
 				usb6fire_pcm_stream_stop(rt);
@@ -197,6 +197,7 @@ static void usb6fire_pcm_capture(struct pcm_substream *sub, struct pcm_urb *urb)
 	unsigned int total_length = 0;
 	struct pcm_runtime *rt = snd_pcm_substream_chip(sub->instance);
 	struct snd_pcm_runtime *alsa_rt = sub->instance->runtime;
+	struct usb_iso_packet_descriptor *isoc;
 	u32 *src = NULL;
 	u32 *dest = (u32 *) (alsa_rt->dma_area + sub->dma_off
 			* (alsa_rt->frame_bits >> 3));
@@ -207,8 +208,9 @@ static void usb6fire_pcm_capture(struct pcm_substream *sub, struct pcm_urb *urb)
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
 		/* at least 4 header bytes for valid packet.
 		 * after that: 32 bits per sample for analog channels */
-		if (urb->packets[i].actual_length > 4)
-			frame_count = (urb->packets[i].actual_length - 4)
+		isoc = &urb->instance->iso_frame_desc[i];
+		if (isoc->actual_length > 4)
+			frame_count = (isoc->actual_length - 4)
 					/ (rt->in_n_analog << 2);
 		else
 			frame_count = 0;
@@ -220,7 +222,7 @@ static void usb6fire_pcm_capture(struct pcm_substream *sub, struct pcm_urb *urb)
 		else
 			return;
 		src++; /* skip leading 4 bytes of every packet */
-		total_length += urb->packets[i].length;
+		total_length += isoc->length;
 		for (frame = 0; frame < frame_count; frame++) {
 			memcpy(dest, src, bytes_per_frame);
 			dest += alsa_rt->channels;
@@ -244,6 +246,7 @@ static void usb6fire_pcm_playback(struct pcm_substream *sub,
 	int frame_count;
 	struct pcm_runtime *rt = snd_pcm_substream_chip(sub->instance);
 	struct snd_pcm_runtime *alsa_rt = sub->instance->runtime;
+	struct usb_iso_packet_descriptor *isoc;
 	u32 *src = (u32 *) (alsa_rt->dma_area + sub->dma_off
 			* (alsa_rt->frame_bits >> 3));
 	u32 *src_end = (u32 *) (alsa_rt->dma_area + alsa_rt->buffer_size
@@ -263,8 +266,9 @@ static void usb6fire_pcm_playback(struct pcm_substream *sub,
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
 		/* at least 4 header bytes for valid packet.
 		 * after that: 32 bits per sample for analog channels */
-		if (urb->packets[i].length > 4)
-			frame_count = (urb->packets[i].length - 4)
+		isoc = &urb->instance->iso_frame_desc[i];
+		if (isoc->length > 4)
+			frame_count = (isoc->length - 4)
 					/ (rt->out_n_analog << 2);
 		else
 			frame_count = 0;
@@ -289,6 +293,7 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 	struct pcm_urb *out_urb = in_urb->peer;
 	struct pcm_runtime *rt = in_urb->chip->pcm;
 	struct pcm_substream *sub;
+	struct usb_iso_packet_descriptor *isoc;
 	bool period_elapsed;
 	int total_length = 0;
 	int frame_count;
@@ -299,11 +304,13 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 
 	if (usb_urb->status || rt->panic || rt->stream_state == STREAM_STOPPING)
 		return;
-	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++)
-		if (in_urb->packets[i].status) {
+	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
+		isoc = &in_urb->instance->iso_frame_desc[i];
+		if (isoc->status) {
 			rt->panic = true;
 			return;
 		}
+	}
 
 	if (rt->stream_state == STREAM_DISABLED) {
 		dev_err(&rt->chip->dev->dev,
@@ -328,12 +335,12 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 
 	/* setup out urb structure */
 	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
-		out_urb->packets[i].offset = total_length;
-		out_urb->packets[i].length = (in_urb->packets[i].actual_length
-				- 4) / (rt->in_n_analog << 2)
+		isoc = &out_urb->instance->iso_frame_desc[i];
+		isoc->offset = total_length;
+		isoc->length = (isoc->actual_length - 4) / (rt->in_n_analog << 2)
 				* (rt->out_n_analog << 2) + 4;
-		out_urb->packets[i].status = 0;
-		total_length += out_urb->packets[i].length;
+		isoc->status = 0;
+		total_length += isoc->length;
 	}
 	memset(out_urb->buffer, 0, total_length);
 
@@ -354,9 +361,10 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 
 	/* setup the 4th byte of each sample (0x40 for analog channels) */
 	dest = out_urb->buffer;
-	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++)
-		if (out_urb->packets[i].length >= 4) {
-			frame_count = (out_urb->packets[i].length - 4)
+	for (i = 0; i < PCM_N_PACKETS_PER_URB; i++) {
+		isoc = &out_urb->instance->iso_frame_desc[i];
+		if (isoc->length >= 4) {
+			frame_count = (isoc->length - 4)
 					/ (rt->out_n_analog << 2);
 			*(dest++) = 0xaa;
 			*(dest++) = 0xaa;
@@ -370,8 +378,10 @@ static void usb6fire_pcm_in_urb_handler(struct urb *usb_urb)
 					*(dest++) = 0x40;
 				}
 		}
-	usb_submit_urb(&out_urb->instance, GFP_ATOMIC);
-	usb_submit_urb(&in_urb->instance, GFP_ATOMIC);
+	}
+
+	usb_submit_urb(out_urb->instance, GFP_ATOMIC);
+	usb_submit_urb(in_urb->instance, GFP_ATOMIC);
 }
 
 static void usb6fire_pcm_out_urb_handler(struct urb *usb_urb)
@@ -534,22 +544,25 @@ static const struct snd_pcm_ops pcm_ops = {
 	.pointer = usb6fire_pcm_pointer,
 };
 
-static void usb6fire_pcm_init_urb(struct pcm_urb *urb,
-				  struct sfire_chip *chip, bool in, int ep,
-				  void (*handler)(struct urb *))
+static int usb6fire_pcm_init_urb(struct pcm_urb *urb,
+				 struct sfire_chip *chip, bool in, int ep,
+				 void (*handler)(struct urb *))
 {
 	urb->chip = chip;
-	usb_init_urb(&urb->instance);
-	urb->instance.transfer_buffer = urb->buffer;
-	urb->instance.transfer_buffer_length =
+	urb->instance = usb_alloc_urb(PCM_N_PACKETS_PER_URB, GFP_KERNEL);
+	if (!urb->instance)
+		return -ENOMEM;
+	urb->instance->transfer_buffer = urb->buffer;
+	urb->instance->transfer_buffer_length =
 			PCM_N_PACKETS_PER_URB * PCM_MAX_PACKET_SIZE;
-	urb->instance.dev = chip->dev;
-	urb->instance.pipe = in ? usb_rcvisocpipe(chip->dev, ep)
+	urb->instance->dev = chip->dev;
+	urb->instance->pipe = in ? usb_rcvisocpipe(chip->dev, ep)
 			: usb_sndisocpipe(chip->dev, ep);
-	urb->instance.interval = 1;
-	urb->instance.complete = handler;
-	urb->instance.context = urb;
-	urb->instance.number_of_packets = PCM_N_PACKETS_PER_URB;
+	urb->instance->interval = 1;
+	urb->instance->complete = handler;
+	urb->instance->context = urb;
+	urb->instance->number_of_packets = PCM_N_PACKETS_PER_URB;
+	return 0;
 }
 
 static int usb6fire_pcm_buffers_init(struct pcm_runtime *rt)
@@ -571,14 +584,17 @@ static int usb6fire_pcm_buffers_init(struct pcm_runtime *rt)
 	return 0;
 }
 
-static void usb6fire_pcm_buffers_destroy(struct pcm_runtime *rt)
+static void usb6fire_pcm_free(struct pcm_runtime *rt)
 {
 	int i;
 
 	for (i = 0; i < PCM_N_URBS; i++) {
+		usb_free_urb(rt->out_urbs[i].instance);
 		kfree(rt->out_urbs[i].buffer);
+		usb_free_urb(rt->in_urbs[i].instance);
 		kfree(rt->in_urbs[i].buffer);
 	}
+	kfree(rt);
 }
 
 int usb6fire_pcm_init(struct sfire_chip *chip)
@@ -593,11 +609,8 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 		return -ENOMEM;
 
 	ret = usb6fire_pcm_buffers_init(rt);
-	if (ret) {
-		usb6fire_pcm_buffers_destroy(rt);
-		kfree(rt);
-		return ret;
-	}
+	if (ret)
+		goto error;
 
 	rt->chip = chip;
 	rt->stream_state = STREAM_DISABLED;
@@ -609,10 +622,14 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 	spin_lock_init(&rt->capture.lock);
 
 	for (i = 0; i < PCM_N_URBS; i++) {
-		usb6fire_pcm_init_urb(&rt->in_urbs[i], chip, true, IN_EP,
-				usb6fire_pcm_in_urb_handler);
-		usb6fire_pcm_init_urb(&rt->out_urbs[i], chip, false, OUT_EP,
-				usb6fire_pcm_out_urb_handler);
+		ret = usb6fire_pcm_init_urb(&rt->in_urbs[i], chip, true, IN_EP,
+					    usb6fire_pcm_in_urb_handler);
+		if (ret < 0)
+			goto error;
+		ret = usb6fire_pcm_init_urb(&rt->out_urbs[i], chip, false, OUT_EP,
+					    usb6fire_pcm_out_urb_handler);
+		if (ret < 0)
+			goto error;
 
 		rt->in_urbs[i].peer = &rt->out_urbs[i];
 		rt->out_urbs[i].peer = &rt->in_urbs[i];
@@ -620,10 +637,8 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 
 	ret = snd_pcm_new(chip->card, "DMX6FireUSB", 0, 1, 1, &pcm);
 	if (ret < 0) {
-		usb6fire_pcm_buffers_destroy(rt);
-		kfree(rt);
 		dev_err(&chip->dev->dev, "cannot create pcm instance.\n");
-		return ret;
+		goto error;
 	}
 
 	pcm->private_data = rt;
@@ -636,6 +651,10 @@ int usb6fire_pcm_init(struct sfire_chip *chip)
 
 	chip->pcm = rt;
 	return 0;
+
+ error:
+	usb6fire_pcm_free(rt);
+	return ret;
 }
 
 void usb6fire_pcm_abort(struct sfire_chip *chip)
@@ -653,8 +672,8 @@ void usb6fire_pcm_abort(struct sfire_chip *chip)
 			snd_pcm_stop_xrun(rt->capture.instance);
 
 		for (i = 0; i < PCM_N_URBS; i++) {
-			usb_poison_urb(&rt->in_urbs[i].instance);
-			usb_poison_urb(&rt->out_urbs[i].instance);
+			usb_poison_urb(rt->in_urbs[i].instance);
+			usb_poison_urb(rt->out_urbs[i].instance);
 		}
 
 	}
@@ -662,9 +681,6 @@ void usb6fire_pcm_abort(struct sfire_chip *chip)
 
 void usb6fire_pcm_destroy(struct sfire_chip *chip)
 {
-	struct pcm_runtime *rt = chip->pcm;
-
-	usb6fire_pcm_buffers_destroy(rt);
-	kfree(rt);
+	usb6fire_pcm_free(chip->pcm);
 	chip->pcm = NULL;
 }
diff --git a/sound/usb/6fire/pcm.h b/sound/usb/6fire/pcm.h
index 5a092dfd69f5..b586fe220fd1 100644
--- a/sound/usb/6fire/pcm.h
+++ b/sound/usb/6fire/pcm.h
@@ -24,10 +24,7 @@ enum /* settings for pcm */
 struct pcm_urb {
 	struct sfire_chip *chip;
 
-	/* BEGIN DO NOT SEPARATE */
-	struct urb instance;
-	struct usb_iso_packet_descriptor packets[PCM_N_PACKETS_PER_URB];
-	/* END DO NOT SEPARATE */
+	struct urb *instance;
 	u8 *buffer;
 
 	struct pcm_urb *peer;
-- 
2.55.0

