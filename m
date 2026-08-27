Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB34457C7;
	Thu, 27 Aug 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830806; cv=none; b=WtGIVT/1JKeasdvAB3dWk3gjoJYBveyq6+X1VQTc1H2EntyNlL5hPDF1izvy0HBnwLJ83i2luKFxv4Y8Hhjk+StvnXH/xbnsOWWbUj+edbccdkj0AUQfG5KiexUJ0mKtkGh+Ya6Dhb7yjPCjzkDbfFCWJ7zEIEHftynzbS1BNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830806; c=relaxed/simple;
	bh=8ro+jZNFcEo++P23Nt+cPrJhOZj2Y0bNSwIIyF0sg50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWtKTFS5OCd5kAfO2aiDGSVj7jpDrLJFrFXmSEPlOO+oHQ7km2uiAAhl8RZryc/4kXeFPvBH9jUWmSeyXqPDJ5f8qQ6KDuXOWf9Xk7lf40MFR8tlejtQGfv9a4mGb8JtqLT4k7BePCT3nDcyBz1Pd0evQOfnXyLZIul8ODAXov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K+rQfJca; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=57g2cu2A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xVEzU6ka; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8nU5Nn5y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K+rQfJca";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="57g2cu2A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xVEzU6ka";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8nU5Nn5y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C30421903;
	Thu, 27 Aug 2026 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787830797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mh/Y7OSUpAjE00BNOyiNrcsicwT9JI/UljNMGboymC8=;
	b=K+rQfJcalin/z+x3NJBCQpIppMraYAgN796TX8ex71f+bX4+L3mOisrVUYKMKijGmrXJId
	v+3P8LtViqzQOYqFpUDzUYJ41jTJBcf8wMTGBQ6reG9/V4cyKJJtCcgrYcu37KCk/4/dm1
	oPezeEpAgRQ4F/H3pIsM1Kz1sN6QEVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787830797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mh/Y7OSUpAjE00BNOyiNrcsicwT9JI/UljNMGboymC8=;
	b=57g2cu2A2wUZ4gGWEN9TA+I2k4zQacierJxi/a51efdRGXVL2Z0MRMb+NbqXl6lAx9m9K0
	0mqfTitiFiSSYvBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787830793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mh/Y7OSUpAjE00BNOyiNrcsicwT9JI/UljNMGboymC8=;
	b=xVEzU6kaxV7mPjXwk/K+WdZiqvhY/aopS7H0/kCqveBHDj5fR7WTz6p/ClFRiFF4cez+pM
	MwJsOmqiKjYT76tU8Z7FPP+NaNjlKV5J3aZ1iXfFgS/fVi4Bp0VWKDHjP7w7VGEQZP6rxp
	oAnxN3yk0fbC+Sgqc4rjLv0jc74WD88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787830793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Mh/Y7OSUpAjE00BNOyiNrcsicwT9JI/UljNMGboymC8=;
	b=8nU5Nn5y0wWc/AptxGclFtVf/6D2vIWI1LS6N0jwifNi1CMugu63Bred2OE4v9PAdm8UtO
	SVbrH6D787ndv9AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5732B1352C;
	Thu, 27 Aug 2026 11:39:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id roQWFAkikGpTfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Aug 2026 11:39:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: control: Don't add invalid kcontrols to LED layer
Date: Thu, 27 Aug 2026 13:39:03 +0200
Message-ID: <20260827113951.893291-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

The kcontrol LED state layer tries to track the all associated
kcontrol elements with naive assumptions that they are readable.
But one can create a write-only element that has no get callback (even
a user element can do it), and this may lead to a NULL dereference at
the call chain of snd_ctl_led_notify(), as found by syzkaller.

For avoiding the Oops, add a sanity check of the kcontrol's info and
get callbacks, and just skip the invalid kcontrols before assigning
the kctl to the LED layer.

Reported-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/6a9007b3.1d9ded08.62e62.00cd.GAE@google.com
Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control_led.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 8cbacee57ce7..3d13bbec1c54 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -255,6 +255,8 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 	kctl = snd_ctl_find_id(card, id);
 	if (!kctl)
 		return -ENOENT;
+	if (!kctl->info || !kctl->get)
+		return -EINVAL;
 	ioff = snd_ctl_get_ioff(kctl, id);
 	vd = &kctl->vd[ioff];
 	access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;
-- 
2.55.0

