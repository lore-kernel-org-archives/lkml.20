Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1ED4FDA64;
	Tue, 13 Oct 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898319; cv=none; b=MgpigHrcRH8yut+pNIbMQ4vSL7M/rRWjQKp2MZfU43HMj4t8ysNSaYeZW8+WrkAzs+0pAUlX1VFaXjFiylyxMvbP+UTaoGZLcCxd+l9tb4xmej1AJiG7cewYQxyElOVQ9nJazbn5+t0NVxdAzn2ZJyPIm5y7DFpafLWyCFAsajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898319; c=relaxed/simple;
	bh=nhpa7+24lB5g+FAc6toKLSjZjcKrLUGLUtWKr2m9I/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4C3L8bxPXj3a21JQOW7ACp5SXTrO4FRxNMyX+rJhEkrZujUK3u+RQzEy5TLda+wj8rt3sFcFC9o3dfMRrZ9qpVdna7aVvbmla50wDJnaEvkHlgmAh5dxZXbYI9BuB7YwgTHoJMah5FjUWJAfcVwzSUBfLfbjhmUTtKlEAC1e2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TwM4gwzS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p/kmIdLX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TwM4gwzS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p/kmIdLX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TwM4gwzS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p/kmIdLX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TwM4gwzS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p/kmIdLX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C221F21C91;
	Tue, 13 Oct 2026 13:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791898315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=65cgr7lBEhDuuhksMJTmNeHWz8qF4friIPUXrfVfzbw=;
	b=TwM4gwzSUjhroIScDwvuj9Y+GPstlInZNIepKgTbBKI8X9oaxJNQc98hMcFE0t5wf6lAc8
	ew3IUOxpdjwn4MINA4d9xNoi5tWW55Yrl/X/oYPlvAnCKNsYb03iZ2XddtUbLHc/3qZ8Rd
	PhgA9tU1XVTF/DNhnS8q6Fk0noTIhVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791898315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=65cgr7lBEhDuuhksMJTmNeHWz8qF4friIPUXrfVfzbw=;
	b=p/kmIdLXsy/g0QFvmI+t3evDqKKa19r3BthW/o8vof9F1TkJeu6W892pt8m9hongnNiTHh
	cNidjQ7mivNEcXCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TwM4gwzS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="p/kmIdLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791898315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=65cgr7lBEhDuuhksMJTmNeHWz8qF4friIPUXrfVfzbw=;
	b=TwM4gwzSUjhroIScDwvuj9Y+GPstlInZNIepKgTbBKI8X9oaxJNQc98hMcFE0t5wf6lAc8
	ew3IUOxpdjwn4MINA4d9xNoi5tWW55Yrl/X/oYPlvAnCKNsYb03iZ2XddtUbLHc/3qZ8Rd
	PhgA9tU1XVTF/DNhnS8q6Fk0noTIhVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791898315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=65cgr7lBEhDuuhksMJTmNeHWz8qF4friIPUXrfVfzbw=;
	b=p/kmIdLXsy/g0QFvmI+t3evDqKKa19r3BthW/o8vof9F1TkJeu6W892pt8m9hongnNiTHh
	cNidjQ7mivNEcXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A95E134B8;
	Tue, 13 Oct 2026 13:31:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9Wp9F8syzmq3dwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 13:31:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda/intel: Power down GPU at error on azx_probe_continue()
Date: Tue, 13 Oct 2026 15:31:50 +0200
Message-ID: <20261013133153.78225-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C221F21C91
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01

Since the recent fix commit fbaccb1b19c7 ("ALSA: hda: intel: Don't
free card in the probe work"), we don't release the card but just
toggles the init_failed flag to stop the operation in the case of
error at probing in azx_probe_continue().  This leaves, however,
display_power() true, which may block powering down the GPU.

Put display_power(false) at the error path for avoiding the potential
blockage.

Fixes: fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe work")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 6b80b59b8743..b67d569fc859 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2453,6 +2453,7 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 	if (err < 0) {
 		if (hda->vga_switcheroo_registered)
 			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
+		display_power(chip, false);
 		if (free_on_error) {
 			pci_set_drvdata(pci, NULL);
 			snd_card_free(chip->card);
-- 
2.55.0

