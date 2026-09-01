Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4108640A924;
	Tue,  1 Sep 2026 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274529; cv=none; b=Vw53I28WQVlTrn2ksZO7KuwLLtdC+cvQq87rWyyTbbS1X20cXLWWctricyqxMcaxq0CeTxlowgPE13AGMLcI5mUlN4sJjShU1Zy/kelddmWkwtjZ8HRVCIFbW5RjfnYHAddv71TS+ltbDO2yVbuhZ1kSQVyht8jhBR6ifHffOIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274529; c=relaxed/simple;
	bh=UZcL5xCFT2VzPmjPj64F1fB5jIqvmQNMw+Syr7UvUwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fnoFizXWZQte5WoLrznGKrMlHCiT/a1voMWCil0yAv6/qw6lRA1A6yOqQXezjEO/mIbmue8cIdFeN3L3WEjlrmY3BjpzrhsRdxJZPkh/jDMZXIZxnqkiQ3Y/Hc0Ihd/ipDbdnOhGtstNAZRiZ9KyZdidl1wN3AhyGKs1fc3NeUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2LqY0csf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q2TaIMwV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qOFnijFy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=upS+lYof; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2LqY0csf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q2TaIMwV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qOFnijFy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="upS+lYof"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BF201F399;
	Tue,  1 Sep 2026 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788274522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=usj2g0t4xwIGOyAseUkM+POeJ2pw3ILZIkI3bovALxE=;
	b=2LqY0csfgmVyPu9G5G0JCUPOk5Nx0WDRHbZPOB0TLPuDELBXF7SbTb4Esjf1g7K1g1Obse
	zXAD+3jXZ7cMyld64amyO1TjPn2UG6lb1sykdWGsXqmGv5tCTzxSXNqp+KU5t71cGrUynl
	NGKbmzYInGjKKAtqwXUVt47AoYkYp8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788274522;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=usj2g0t4xwIGOyAseUkM+POeJ2pw3ILZIkI3bovALxE=;
	b=Q2TaIMwV8bgLLB2+p/nsepL4GVtwfCzDaIj8uyoSkQbtD1D7LbNbNgp6zUrP7dqmDXNtAR
	qeUG1AdMtMq77kDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788274518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=usj2g0t4xwIGOyAseUkM+POeJ2pw3ILZIkI3bovALxE=;
	b=qOFnijFyXSO82FdQQCIoloTgyHNwVwIhu43kC+lcyDpo+zZcabPYbdxngzXDC9Ay7pPrg9
	mgA9yfPk4uixZvy64j7HIF9iiLGn1LUYAVx5vJHknF4MEMVqgTcyLLmz2PGgQrVKLuFRfR
	LM63Yy0SlVk2h8Qclz9midhHu6pBwXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788274518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=usj2g0t4xwIGOyAseUkM+POeJ2pw3ILZIkI3bovALxE=;
	b=upS+lYofVF40bp3Mm+EiMrEAkJhCOsZdIyb/7dgtVQ3hz78xpcKbkZHLar0qxVIUucP6CG
	sphz/vuV6sVEOrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4FA71369E;
	Tue,  1 Sep 2026 14:55:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z1FjM1XnlmpDDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 14:55:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edward Adam Davis <eadavis@sina.com>
Subject: [PATCH] usb: gadget: midi2: Fix the jack descriptor array sizes
Date: Tue,  1 Sep 2026 16:52:46 +0200
Message-ID: <20260901145512.785142-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sina.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,sina.com:email,syzkaller.appspot.com:url,appspotmail.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[sina.com]
X-Spam-Flag: NO

The jack in/out descriptor arrays in struct f_midi2_usb_config have
the size of MAX_CABLES, which look reasonable -- but it turned out to
be incorrect.  Namely, the entries for those arrays are added from
both inputs and outputs, hence for each loop cycle, it adds two, ended
up with as twice as the expected size.  This inconsistency may result
in potential OOB when a large number of jacks are set up via configfs,
although the max number of cables (the loop count) is limited to
MAX_CABLES.

For addressing it, correct the jack_ins & jack_outs array sizes to
twice, MAX_CABLES * 2.

Fixes: 856fa444b098 ("usb: gadget: midi2: Dynamically create MIDI 1.0 altset descriptors")
Reported-by: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c35f34092a4bc9855be6
Link: https://lore.kernel.org/20260826134606.127250-1-eadavis@sina.com
Cc: Edward Adam Davis <eadavis@sina.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/gadget/function/f_midi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index a4b72a6fad8a..091e9220fcbb 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -1634,8 +1634,8 @@ struct f_midi2_usb_config {
 
 	/* MIDI 1.0 jacks */
 	unsigned char jack_in, jack_out, jack_id;
-	struct usb_midi_in_jack_descriptor jack_ins[MAX_CABLES];
-	struct usb_midi_out_jack_descriptor_1 jack_outs[MAX_CABLES];
+	struct usb_midi_in_jack_descriptor jack_ins[MAX_CABLES * 2];
+	struct usb_midi_out_jack_descriptor_1 jack_outs[MAX_CABLES * 2];
 };
 
 static int append_config(struct f_midi2_usb_config *config, void *d)
-- 
2.55.0

