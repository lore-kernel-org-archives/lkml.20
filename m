Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D0492E30;
	Thu, 10 Sep 2026 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055561; cv=none; b=ryA86hwQx6APiJujxUKhD1YQrdbo4mIeVtPYM0ZNcmGs04cRYoGaS7N8QpyIpgxwRTdSSjBpb5Mj9zHV5xynlGChxF3/GEqVQOPdmHKC+URLcw0LKtF/b1uOA4xpEZ+PiMGwRlZR1i+MyY4A8yw0EEA4aKNjraSu1ruDXMBkwUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055561; c=relaxed/simple;
	bh=kufypT4S9NUjeZfkepyxr9aHzu+0Er6XovkdVvK94r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hoLOor1zV/1zhkmQ1YQrG4TuoknHNQ5W7OYrr4/XKWHHyVn/jUcfTfHhDBledfTF2XtNI/YM7d2TiMqygh6iQOZTMBtTax4MsFwlpzk0O/ULbN3QAh+i7vUjoYIxNe5x5+zyRQGDfeWf6Oy2jcQqIp+KnujvGLwS53zCtrSTh1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dbnm5GdE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6GSbguRH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ax0KOReE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eaeGnexl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dbnm5GdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6GSbguRH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ax0KOReE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eaeGnexl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2F1391FE11;
	Thu, 10 Sep 2026 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789055553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vQhHkwYHas8QQNo35ZoBgpqwWAUU8mpVL8gzXTB8YO4=;
	b=dbnm5GdE7zel7+frgcd45k9WcKNPzEvN1EnomFn14agoLIvle1tjKlzEU0lsoCjmXLm0Kw
	R/ir1oT/Q5RWajsvd6yCsbxnYnh+vBaEB8ZyTO6Kdb1xt4GXNlh4ffb9bEiZDE5vr6dNjS
	wdBOyyhNgx7pyGK/OIiwiorg+g6PgQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789055553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vQhHkwYHas8QQNo35ZoBgpqwWAUU8mpVL8gzXTB8YO4=;
	b=6GSbguRHmKA4gXF9BF0mXhw8/kny7Ld4aID3GCW6vJFT8Pum/PRvri5LgxQUfV/sBApIts
	50Pfn5pwOk2sEaDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789055549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vQhHkwYHas8QQNo35ZoBgpqwWAUU8mpVL8gzXTB8YO4=;
	b=ax0KOReE+D6YXF0qYOHv9TcDkwKPyjoRXccYY2VRHcgdlzot8WKeW79N26tvj1QwiMzjah
	eABPSo9n9ts0IhmH4WfiLx+AmRc3RPUb/HO9DrtvWyNXVO9Bvth1DZFCmUbsrW+nDE4iwJ
	sWennMIDVcabUQuqh/Bhtkz3+KV57wM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789055549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vQhHkwYHas8QQNo35ZoBgpqwWAUU8mpVL8gzXTB8YO4=;
	b=eaeGnexlBx4I+vp5k68fJoEMz9KsVAx0QANTJxTJCDd2rRH1CZLF1NtDzmzpjB/qlg+lNs
	DKxbxFd/wVa0EjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C035F137FD;
	Thu, 10 Sep 2026 15:52:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BL2TLTzSompRKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Sep 2026 15:52:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: bcd2000: Fix race between rawmidi and disconnect
Date: Thu, 10 Sep 2026 17:52:23 +0200
Message-ID: <20260910155227.996210-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Although we tried to fix the potential UAF issues at USB disconnect on
bcd2000 driver, there is still an overlooked case -- namely, when a
rawmidi trigger callback has been already running at USB disconnect
handling, the in-flight function (e.g. bcd2000_midi_send()) could
still access the URB, because the previous URB NULL-check & clearance
was considered only for the URB complete callbacks, but not about the
parallel rawmidi operations.

For addressing the race, this patch introduced a new spinlock that
covers each rawmidi operation as well as the rawmidi handling in the
complete callback.  The URB is cleared with the lock, so it guarantees
that the pending rawmidi task already finished or a NULL check is
effective.

Fixes: 459d3a64766f ("ALSA: bcd2000: clear the URB pointers on disconnect")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/bcd2000/bcd2000.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/sound/usb/bcd2000/bcd2000.c b/sound/usb/bcd2000/bcd2000.c
index c5c542d17ccc..2bd49bf82748 100644
--- a/sound/usb/bcd2000/bcd2000.c
+++ b/sound/usb/bcd2000/bcd2000.c
@@ -43,6 +43,7 @@ struct bcd2000 {
 	struct usb_interface *intf;
 	int card_index;
 
+	spinlock_t midi_lock;
 	int midi_out_active;
 	struct snd_rawmidi *rmidi;
 	struct snd_rawmidi_substream *midi_receive_substream;
@@ -90,6 +91,8 @@ static void bcd2000_midi_input_trigger(struct snd_rawmidi_substream *substream,
 						int up)
 {
 	struct bcd2000 *bcd2k = substream->rmidi->private_data;
+
+	guard(spinlock_irqsave)(&bcd2k->midi_lock);
 	bcd2k->midi_receive_substream = up ? substream : NULL;
 }
 
@@ -195,6 +198,8 @@ static void bcd2000_midi_output_trigger(struct snd_rawmidi_substream *substream,
 {
 	struct bcd2000 *bcd2k = substream->rmidi->private_data;
 
+	guard(spinlock_irqsave)(&bcd2k->midi_lock);
+
 	if (up) {
 		bcd2k->midi_out_substream = substream;
 		/* check if there is data userspace wants to send */
@@ -219,6 +224,7 @@ static void bcd2000_output_complete(struct urb *urb)
 		return;
 
 	/* check if there is more data userspace wants to send */
+	guard(spinlock_irqsave)(&bcd2k->midi_lock);
 	bcd2000_midi_send(bcd2k);
 }
 
@@ -234,6 +240,8 @@ static void bcd2000_input_complete(struct urb *urb)
 	if (!bcd2k || urb->status == -ESHUTDOWN)
 		return;
 
+	guard(spinlock_irqsave)(&bcd2k->midi_lock);
+
 	if (urb->actual_length > 0)
 		bcd2000_midi_handle_input(bcd2k, urb->transfer_buffer,
 					urb->actual_length);
@@ -348,16 +356,26 @@ static int bcd2000_init_midi(struct bcd2000 *bcd2k)
 	return 0;
 }
 
+static void bcd2000_midi_free(struct bcd2000 *bcd2k,
+			      struct urb **urb_p)
+{
+	struct urb *urb = *urb_p;
+
+	if (!urb)
+		return;
+
+	usb_poison_urb(urb);
+	scoped_guard(spinlock_irq, &bcd2k->midi_lock)
+		*urb_p = NULL;
+
+	usb_free_urb(urb);
+}
+
 static void bcd2000_free_usb_related_resources(struct bcd2000 *bcd2k,
 						struct usb_interface *interface)
 {
-	usb_poison_urb(bcd2k->midi_out_urb);
-	usb_poison_urb(bcd2k->midi_in_urb);
-
-	usb_free_urb(bcd2k->midi_out_urb);
-	usb_free_urb(bcd2k->midi_in_urb);
-	bcd2k->midi_out_urb = NULL;
-	bcd2k->midi_in_urb = NULL;
+	bcd2000_midi_free(bcd2k, &bcd2k->midi_out_urb);
+	bcd2000_midi_free(bcd2k, &bcd2k->midi_in_urb);
 
 	if (bcd2k->intf) {
 		usb_set_intfdata(bcd2k->intf, NULL);
@@ -393,6 +411,7 @@ static int bcd2000_probe(struct usb_interface *interface,
 	bcd2k->card = card;
 	bcd2k->card_index = card_index;
 	bcd2k->intf = interface;
+	spin_lock_init(&bcd2k->midi_lock);
 
 	snd_card_set_dev(card, &interface->dev);
 
-- 
2.55.0

