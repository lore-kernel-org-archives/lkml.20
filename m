Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628DC3806D2;
	Thu,  3 Sep 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451513; cv=none; b=m9ZKedIMlOLaO03cQrS/ANqlXxxRtJfcCdmBhTWRefg/0xDLkWy9VPeihIDViQrZolS3n+iygcaRo4mxtQFt+ZYVfYcljVfUUa3hC/qOXheWNHR4co2MADuJmTKhEagxQ39frZ84sD51mZMRdwVHGcH95pAanwkKFOJAzr5Bp4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451513; c=relaxed/simple;
	bh=LCw+wioHfEMflbDoNm2jee/VHPg6gaXQlxDgakjuaaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mknb4guMUn5jbyMmGSqMVI49qgr8ZdczYNLEEBLFRLgqDXAiQeqEzd7A2eV8aURpltG5vFHftvqpx77j1r2OPKGqggJQDGuhpX0+66FZmzalyTulvWfbvguYtmlO0qUqx97OQ9nyG4GZExjDZnxNs0za9W6yvjvjtgqG1Blw8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p0e5WjCv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=74JIz03J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGhn9/Km; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4EiYsBjG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p0e5WjCv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="74JIz03J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGhn9/Km";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4EiYsBjG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3272A21F96;
	Thu,  3 Sep 2026 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo4Kf8r9V3Se93h4wPj7DQauWWOEBF1zw3z/jmaN9v8=;
	b=p0e5WjCvVJSom47VNOVkaQyAO+LcsBsxq8Y20vJsYGhGeiREroTP+1YdVZotOkoO9+Bt6s
	/CLXjGFyU1E39CivQo9YRxsrvF4NxlyuT+QWYM/+UWwnZcq4D1xPYPMskvJYKBEAG1lKLT
	gPcevdYlQkPuElbM0X1pZs5P0z+XrLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo4Kf8r9V3Se93h4wPj7DQauWWOEBF1zw3z/jmaN9v8=;
	b=74JIz03J1ctvjpb8J8qGMqlDVz6bzVwZiLJ/vpyKT/f/kjRlJ3TjzTrOlN217+GFTLY6EW
	cea3vPf4s+QB7fDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="DGhn9/Km";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4EiYsBjG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788451501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo4Kf8r9V3Se93h4wPj7DQauWWOEBF1zw3z/jmaN9v8=;
	b=DGhn9/Km7Ll3uPd8ANAdi726wg3hQh9+O2s4CTQzcIBiz9cn5Ivv0JxenpTYi3uzAQGuji
	zrIKfjEArvVp7Aw4iSAtnNePqctdJ5LzYPtb2IpxNull3WC7PdflgeKa/k+3b4LzlkS+gG
	2S9rD81wIO2pbv1cBMaWjLUJmMSFJPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788451501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mo4Kf8r9V3Se93h4wPj7DQauWWOEBF1zw3z/jmaN9v8=;
	b=4EiYsBjGw0BNIDTO4aVUI2tC8nujW09suwUkNyMMIVh7qZOhjQLywqckZCSh5nWBS72qpE
	XefqO6HGNcBWioDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2A1113736;
	Thu,  3 Sep 2026 16:05:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0DFcLqyamWo2dQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 16:05:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH v2 2/3] ALSA: usb: hiface: Avoid embedded URBs
Date: Thu,  3 Sep 2026 18:04:38 +0200
Message-ID: <20260903160458.1938392-3-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 3272A21F96
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

The hiface driver uses URBs embedded in struct pcm_urb, and this is
basically a buggy implementation nowadays; since a URB is managed with
a refcount, this may lead to a UAF when the URB is released
asynchronously.

For addressing the problem, this patch converts the embedded URBs to
ones that are properly allocated via usb_alloc_urb().

The conversion is rather straightforward; pcm_urb.instance became a
pointer, assigned/freed via usb_alloc_urb() and usb_free_urb(), and
the call with this is corrected accordingly.

Along with it, the resource release is done in the common destructor
that is called from both at the error path and the disconnect.

No functional changes, only compile-tested.

Link: https://lore.kernel.org/20260903130757.0668310a.michal.pecio@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: use a common destructor at error path and disconnect

 sound/usb/hiface/pcm.c | 44 ++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index cd1a4c871c5d..3157952e4c1d 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -24,7 +24,7 @@
 struct pcm_urb {
 	struct hiface_chip *chip;
 
-	struct urb instance;
+	struct urb *instance;
 	struct usb_anchor submitted;
 	u8 *buffer;
 };
@@ -193,7 +193,7 @@ static void hiface_pcm_stream_stop(struct pcm_runtime *rt)
 			if (!time)
 				usb_kill_anchored_urbs(
 					&rt->out_urbs[i].submitted);
-			usb_kill_urb(&rt->out_urbs[i].instance);
+			usb_kill_urb(rt->out_urbs[i].instance);
 		}
 
 		rt->stream_state = STREAM_DISABLED;
@@ -215,9 +215,9 @@ static int hiface_pcm_stream_start(struct pcm_runtime *rt)
 		rt->stream_state = STREAM_STARTING;
 		for (i = 0; i < PCM_N_URBS; i++) {
 			memset(rt->out_urbs[i].buffer, 0, PCM_PACKET_SIZE);
-			usb_anchor_urb(&rt->out_urbs[i].instance,
+			usb_anchor_urb(rt->out_urbs[i].instance,
 				       &rt->out_urbs[i].submitted);
-			ret = usb_submit_urb(&rt->out_urbs[i].instance,
+			ret = usb_submit_urb(rt->out_urbs[i].instance,
 					     GFP_ATOMIC);
 			if (ret) {
 				hiface_pcm_stream_stop(rt);
@@ -334,7 +334,7 @@ static void hiface_pcm_out_urb_handler(struct urb *usb_urb)
 	if (do_period_elapsed)
 		snd_pcm_period_elapsed(sub->instance);
 
-	ret = usb_submit_urb(&out_urb->instance, GFP_ATOMIC);
+	ret = usb_submit_urb(out_urb->instance, GFP_ATOMIC);
 	if (ret < 0)
 		goto out_fail;
 
@@ -492,16 +492,18 @@ static int hiface_pcm_init_urb(struct pcm_urb *urb,
 			       void (*handler)(struct urb *))
 {
 	urb->chip = chip;
-	usb_init_urb(&urb->instance);
+	urb->instance = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb->instance)
+		return -ENOMEM;
 
 	urb->buffer = kzalloc(PCM_PACKET_SIZE, GFP_KERNEL);
 	if (!urb->buffer)
 		return -ENOMEM;
 
-	usb_fill_bulk_urb(&urb->instance, chip->dev,
+	usb_fill_bulk_urb(urb->instance, chip->dev,
 			  usb_sndbulkpipe(chip->dev, ep), (void *)urb->buffer,
 			  PCM_PACKET_SIZE, handler, urb);
-	if (usb_urb_ep_type_check(&urb->instance))
+	if (usb_urb_ep_type_check(urb->instance))
 		return -EINVAL;
 	init_usb_anchor(&urb->submitted);
 
@@ -520,24 +522,26 @@ void hiface_pcm_abort(struct hiface_chip *chip)
 	}
 }
 
-static void hiface_pcm_destroy(struct hiface_chip *chip)
+static void hiface_pcm_destroy(struct pcm_runtime *rt)
 {
-	struct pcm_runtime *rt = chip->pcm;
 	int i;
 
-	for (i = 0; i < PCM_N_URBS; i++)
-		kfree(rt->out_urbs[i].buffer);
+	if (!rt)
+		return;
 
-	kfree(chip->pcm);
-	chip->pcm = NULL;
+	if (rt->chip)
+		rt->chip->pcm = NULL;
+
+	for (i = 0; i < PCM_N_URBS; i++) {
+		usb_free_urb(rt->out_urbs[i].instance);
+		kfree(rt->out_urbs[i].buffer);
+	}
+	kfree(rt);
 }
 
 static void hiface_pcm_free(struct snd_pcm *pcm)
 {
-	struct pcm_runtime *rt = pcm->private_data;
-
-	if (rt)
-		hiface_pcm_destroy(rt->chip);
+	hiface_pcm_destroy(pcm->private_data);
 }
 
 int hiface_pcm_init(struct hiface_chip *chip, u8 extra_freq)
@@ -587,8 +591,6 @@ int hiface_pcm_init(struct hiface_chip *chip, u8 extra_freq)
 	return 0;
 
 error:
-	for (i = 0; i < PCM_N_URBS; i++)
-		kfree(rt->out_urbs[i].buffer);
-	kfree(rt);
+	hiface_pcm_destroy(rt);
 	return ret;
 }
-- 
2.55.0

