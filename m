Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7674B95AD;
	Fri, 16 Oct 2026 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167577; cv=none; b=FpIOEUSp1brXgIdZPeUGffHdyy4dyPejRNz7UhVOZNGIBEwiwz07yfurgnTGUaN3OduzHAWLFAeIkT7NVKTdIPo00uqNwTf8lbloVekFLcdh3EG+bVcWbZtzZL4kGSwZxL1hhR9WmueKBLAcQwVc2VyAT5d7dAHMQcylbtOeK+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167577; c=relaxed/simple;
	bh=FaHge6BOQYC9DUOEiYHL48sxtI2YaVLriLdnCipUaRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fD4tJNUjpJM0lsfINerbYEbJ7X8HwnQ8sd8bZkQzZXIZIwuGKclshaXi+gFyhS0jui2FuipflIMFwVzoCrElTOT7C47LrvLEcF4q3qE+rar7g/c9rP2jJBf1DubZnr+/dM6ta9nZw6PsEP7yIvr2CkBjPhmbcG1Y0KH01mlviyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DbHKdyzG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g+cbxXj+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ckn8nR7Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DIlB6vEE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DbHKdyzG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g+cbxXj+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ckn8nR7Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DIlB6vEE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12D7121CEE;
	Fri, 16 Oct 2026 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792167573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DdOOIzDuBt+xmBBXMBlcFA6zlcRSQy8J22Ffir6CcNs=;
	b=DbHKdyzGupOwy1X2u3i9Q6NmKHOCKrsVnBaGpWNlKP4ffVNHpwXaYm3zTGO5qrTIYv7Gc2
	aH3j43i9ATc3LO86aMxccdLhscoZE65Ac0I/BsDtL9aKcC8iOkykkSoEfHMwmxY7ffnCjW
	fHua11TW4RuUfPObhEXRlq8jGRn0uYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792167573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DdOOIzDuBt+xmBBXMBlcFA6zlcRSQy8J22Ffir6CcNs=;
	b=g+cbxXj+kASVd3mx21RwxqruFlvEK0ZRfazv0EZSt5e0I15w6DWY2Nfnfe8eIV9bA5tl/N
	2LdZrPyJdle7euAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792167572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DdOOIzDuBt+xmBBXMBlcFA6zlcRSQy8J22Ffir6CcNs=;
	b=ckn8nR7ZZ98gXdbfQuGgPvAy1TOMqRWVAhUoenWfzhKMcoZl0zZNAvfdxGcxDJdu6nU5y/
	3kKYEdaeGoUzQ8772de2hvJSWKbawzMuW2HchIiehdgp7hpB47IIBp0aqUFUmNVirpmG6s
	T5MSXpTYFgY0kpEtK1dCpHIBa//xNzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792167572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DdOOIzDuBt+xmBBXMBlcFA6zlcRSQy8J22Ffir6CcNs=;
	b=DIlB6vEEX8yaBbR/ndStz6hY1kNlddx4eOTeVjhq0pfA7xwZ+vHNCP/Nj5WnTWr/XLFN0L
	ESLKfisgNjNJwqDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C903B1339F;
	Fri, 16 Oct 2026 16:19:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Cz2mJ5NO0moFHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 16:19:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: seq: oss: Skip events until fully initialized
Date: Fri, 16 Oct 2026 18:19:29 +0200
Message-ID: <20261016161930.482309-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]

When an OSS sequencer device is opened, it creates a sequencer port,
then further initializes the internal states like a timer instance,
etc.  Since the sequencer port is published, an event can be already
delivered, and this may hit unexpected event handling, which can
eventually cause a NULL dereference (like the timer start/stop event
triggered before the timer initialization).

For avoiding such a race, introduce a simple guard and skips the event
processing until the port is fully initialized.
At releasing the device, in turn, clear this guard, so that any input
events will be discarded during the teardown.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_device.h | 1 +
 sound/core/seq/oss/seq_oss_event.c  | 3 +++
 sound/core/seq/oss/seq_oss_init.c   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/sound/core/seq/oss/seq_oss_device.h b/sound/core/seq/oss/seq_oss_device.h
index 935cf3df0b30..571186db4fa5 100644
--- a/sound/core/seq/oss/seq_oss_device.h
+++ b/sound/core/seq/oss/seq_oss_device.h
@@ -72,6 +72,7 @@ struct seq_oss_devinfo {
 	int cseq;	/* sequencer client number */
 	int port;	/* sequencer port number */
 	int queue;	/* sequencer queue number */
+	bool initialized;
 
 	struct snd_seq_addr addr;	/* address of this device */
 
diff --git a/sound/core/seq/oss/seq_oss_event.c b/sound/core/seq/oss/seq_oss_event.c
index 3c2cfaea94d1..cf493f6c983b 100644
--- a/sound/core/seq/oss/seq_oss_event.c
+++ b/sound/core/seq/oss/seq_oss_event.c
@@ -425,6 +425,9 @@ snd_seq_oss_event_input(struct snd_seq_event *ev, int direct, void *private_data
 	struct seq_oss_devinfo *dp = (struct seq_oss_devinfo *)private_data;
 	union evrec *rec;
 
+	if (!dp || !smp_load_acquire(&dp->initialized))
+		return 0; /* ignored */
+
 	if (ev->type != SNDRV_SEQ_EVENT_ECHO)
 		return snd_seq_oss_midi_input(ev, direct, private_data);
 
diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 6586e07431c3..6474a76a3cce 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -258,6 +258,7 @@ snd_seq_oss_open(struct file *file, int level)
 
 	client_table[dp->index] = dp;
 	num_clients++;
+	smp_store_release(&dp->initialized, true);
 
 	return 0;
 
@@ -403,6 +404,7 @@ snd_seq_oss_release(struct seq_oss_devinfo *dp)
 
 	client_table[dp->index] = NULL;
 	num_clients--;
+	smp_store_release(&dp->initialized, false);
 
 	snd_seq_oss_reset(dp);
 
-- 
2.55.0

