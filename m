Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A3751CF76;
	Fri, 16 Oct 2026 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167603; cv=none; b=oYMSbLlJQ6c6ptfhtQTghLXw+6akqBFhQ78ecWVACusFSv7NZh1k1ryyqsH+YtsWWP3QvtfK+qtABX8p9xVlippUD39UF7pnC+Cf+Tr5P0xvcuGdnRO56wVx3SMN9bLSRTuuzD8g3TKWpe1DF+u+20SPkUEzF3jkD890uf6ZNuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167603; c=relaxed/simple;
	bh=/lKrQFyta8QLxX62lnkZUsj+dSAF9U/3lREY8Cl4wSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mlPjipyVx5kNXzLp1bL5mj7LMAMxvVQOHrA4+OSI1cm9zLWvFgKoTjjiTqRHfdISy+W+nn/2jiLpF4LrodAjuLMTy7tgdI1j7NsqHFLPAOP07fKWn4SguUM7WgqRy3rKoASGlUhqdUifsWBKW4ypFd0d6G626z/W87atQYZlNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Py8IXrVJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TiG4gRm2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Py8IXrVJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TiG4gRm2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Py8IXrVJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TiG4gRm2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Py8IXrVJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TiG4gRm2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 516531F385;
	Fri, 16 Oct 2026 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792167595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ci3DCBgL1Yv1CsdNSUIvIbqTLXZCNxHei8umf+UEn8I=;
	b=Py8IXrVJw7p6u2BeD9Mbx2Od9c1Me/MjpUPH8rZWA3NO7giVCEPVoLiUe76tw1MRrEwBiN
	sdZs8pmkI8rCoiaIXuOfxXA3Vw4PjREctiODO/96imKonXBMINliWwMCKN4/Er2n6VQAfP
	PdeWNJh5NmYTMhGkABrZ+4X1s/qdpr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792167595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ci3DCBgL1Yv1CsdNSUIvIbqTLXZCNxHei8umf+UEn8I=;
	b=TiG4gRm23u8uGXstiPfPRGp9gsQPJ3w06O3bo9HJhuXqYHo40NHq4XYNet9Fy9StmfHnDs
	RD/99QAH9jaIfcAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Py8IXrVJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TiG4gRm2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792167595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ci3DCBgL1Yv1CsdNSUIvIbqTLXZCNxHei8umf+UEn8I=;
	b=Py8IXrVJw7p6u2BeD9Mbx2Od9c1Me/MjpUPH8rZWA3NO7giVCEPVoLiUe76tw1MRrEwBiN
	sdZs8pmkI8rCoiaIXuOfxXA3Vw4PjREctiODO/96imKonXBMINliWwMCKN4/Er2n6VQAfP
	PdeWNJh5NmYTMhGkABrZ+4X1s/qdpr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792167595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ci3DCBgL1Yv1CsdNSUIvIbqTLXZCNxHei8umf+UEn8I=;
	b=TiG4gRm23u8uGXstiPfPRGp9gsQPJ3w06O3bo9HJhuXqYHo40NHq4XYNet9Fy9StmfHnDs
	RD/99QAH9jaIfcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 145DC1339F;
	Fri, 16 Oct 2026 16:19:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PqqAN6pO0mq4HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 16:19:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: emux: Skip events until fully initialized
Date: Fri, 16 Oct 2026 18:19:52 +0200
Message-ID: <20261016161953.482441-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 516531F385
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

The emux synth creates a sequencer port and then continues
initializing the port attributes.  It allows the port receiving
already input events even though the synth stuff hasn't been fully
initialized.  Similarly, upon the releasing, it clears up the voices,
etc, then detaches the port.  This may leave some pending voices
before the detaching.

For addressing such races, introduce a simple guard to skip the event
processing in the premature or teardown phases.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/emux_synth.h  | 1 +
 sound/synth/emux/emux_oss.c | 4 ++++
 sound/synth/emux/emux_seq.c | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/include/sound/emux_synth.h b/include/sound/emux_synth.h
index 2c0a976e00ab..29b15576e9e6 100644
--- a/include/sound/emux_synth.h
+++ b/include/sound/emux_synth.h
@@ -128,6 +128,7 @@ struct snd_emux_port {
 	struct snd_emux *emu;
 
 	char port_mode;			/* operation mode */
+	bool ready;			/* ready for processing input? */
 	int volume_atten;		/* emuX raw attenuation */
 	unsigned long drum_flags;	/* drum bitmaps */
 	int ctrls[EMUX_MD_END];		/* control parameters */
diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index 30e353e7323d..9c3d02e65f53 100644
--- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -129,6 +129,7 @@ snd_emux_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
 	reset_port_mode(p, arg->seq_mode);
 
 	snd_emux_reset_port(p);
+	WRITE_ONCE(p->ready, true);
 	return 0;
 }
 
@@ -182,6 +183,7 @@ snd_emux_close_seq_oss(struct snd_seq_oss_arg *arg)
 	if (snd_BUG_ON(!emu))
 		return -ENXIO;
 
+	WRITE_ONCE(p->ready, false);
 	snd_emux_sounds_off_all(p);
 	snd_soundfont_close_check(emu->sflist, SF_CLIENT_NO(p->chset.port));
 	snd_seq_event_port_detach(p->chset.client, p->chset.port);
@@ -304,6 +306,8 @@ snd_emux_event_oss_input(struct snd_seq_event *ev, int direct, void *private_dat
 	p = private_data;
 	if (snd_BUG_ON(!p))
 		return -EINVAL;
+	if (!READ_ONCE(p->ready))
+		return 0;
 	emu = p->emu;
 	if (snd_BUG_ON(!emu))
 		return -EINVAL;
diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index 01ad5b12b680..1f1518506031 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -96,6 +96,7 @@ snd_emux_init_seq(struct snd_emux *emu, struct snd_card *card, int index)
 		snd_emux_init_port(p);
 		emu->ports[i] = p->chset.port;
 		emu->portptrs[i] = p;
+		WRITE_ONCE(p->ready, true);
 	}
 
 	return 0;
@@ -239,6 +240,8 @@ snd_emux_event_input(struct snd_seq_event *ev, int direct, void *private_data,
 	port = private_data;
 	if (snd_BUG_ON(!port || !ev))
 		return -EINVAL;
+	if (!READ_ONCE(port->ready))
+		return 0;
 
 	snd_midi_process_event(&emux_ops, ev, &port->chset);
 
-- 
2.55.0

