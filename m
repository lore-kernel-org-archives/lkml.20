Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02549BD94;
	Thu, 10 Sep 2026 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051347; cv=none; b=puRR/Xpi7/lV5vHq8bG76HWPy7iEcRDNQ4WxLDSO8NwYhO37slk0OzFqQsCP6sUyayeF6k8Bm2LQxkDGTa6pD/p0fX8ZGTMtPrktaEl/l9SW/sidjhqSx9a/oMySs868/dBw8Bo9CNv8DTfGpBbvZa5IWJZRJACk3VpCg8PSC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051347; c=relaxed/simple;
	bh=nKvAjS37ofFsoaTqwVf9kCG5yWF1OQzptBUJZ/e8M6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNa/UljdCrUCY+XoNGIxutUeR33UyIDidvaKpsOhQnETYQTYlcAQeXAt53LJvIiMG4PdtbRolefVzdMMZxeeQJnG0nZRhRbK+EU1poUwjxs7qepGPEDom4h9Zv8a5aGCydkodLTB5qvJrRoMXePcA0z4m8dNpVRlteF3e2xSzNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tg3JIP7z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+c+t2R+G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tuqBJmti; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=guScsU49; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tg3JIP7z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+c+t2R+G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tuqBJmti";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="guScsU49"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1BA4B21D3D;
	Thu, 10 Sep 2026 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789051339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rzJHAZZxRdOkdADShKQfaJLBVNvFkp8HnumvkPHvunY=;
	b=tg3JIP7zWfYsIgJlNzZ4ba5mSKyn3q5Or9IwOaxi2q6b1o3LxzrBHSkeOuds9T86dXRfa5
	omzzyX/hXsZffIziZt2u80ucgi+3pdnQV26AR++AdmeuTTKHxbA7xnBGKfi2VGPYETrg0u
	2cq3fPi1KcZdXiHTU/IAFZXWdcDUgts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789051339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rzJHAZZxRdOkdADShKQfaJLBVNvFkp8HnumvkPHvunY=;
	b=+c+t2R+GHXR5fOWEEezO+QECxEycCEeC8H/vblq4XSqe8i0FxDu48WtbUpq6/oI0Xkilza
	PAOz8AZAorFHLwBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tuqBJmti;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=guScsU49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789051335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rzJHAZZxRdOkdADShKQfaJLBVNvFkp8HnumvkPHvunY=;
	b=tuqBJmtiON+cz/cUA3NSZXGkEpGUhO2MH/rG+X7pxBf/Yk1dkiYm6yRAC9Zsxf6wOTQEAb
	HjFm6LR1VmLS33kLEZvXYjz+HQ6xen0t1uaff9VZCxnPUXe4Fd/GhWm5n+maAcXeo4RRo+
	y1N8Pp6C2kr3KPXOkFdQ1XbWJQ4BpHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789051335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rzJHAZZxRdOkdADShKQfaJLBVNvFkp8HnumvkPHvunY=;
	b=guScsU49FQRhsvnZlAqcbw+ccawD0mgFghDn6yYssItm0t038meGZrUh4oFG7dE+bHpdRN
	OngxzmT0GYSFGDDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD3EB13180;
	Thu, 10 Sep 2026 14:42:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qWrOMMbBomriXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Sep 2026 14:42:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
Subject: [PATCH] ALSA: hdspm: Add a new PCI device ID (1d18:3fc6) for RME HDSPe AIO PCI express audio
Date: Thu, 10 Sep 2026 16:41:50 +0200
Message-ID: <20260910144204.973359-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 1BA4B21D3D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DISPOSABLE_ENVRCPT(0.00)[slmail.me];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[slmail.me:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DISPOSABLE_CC(0.00)[vger.kernel.org,slmail.me];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

The RME HDSPe AIO PCI express audio card has a new PCI vendor ID (1d18)
while keeping the same device ID (3fc6).  The card seems working fine by
just adding the new ID.

While we're at it, use the standard macro to cleann up the existing PCI
ID entry, too.

Reported-by: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
Closes: https://lore.kernel.org/178674392532.7.10140952469564861620.1550442282@slmail.me
Tested-by: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdspm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index d8bbedbc8ff6..95fd82bb1c6d 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -1071,14 +1071,8 @@ struct hdspm {
 
 
 static const struct pci_device_id snd_hdspm_ids[] = {
-	{
-	 .vendor = PCI_VENDOR_ID_XILINX,
-	 .device = PCI_DEVICE_ID_XILINX_HAMMERFALL_DSP_MADI,
-	 .subvendor = PCI_ANY_ID,
-	 .subdevice = PCI_ANY_ID,
-	 .class = 0,
-	 .class_mask = 0,
-	 .driver_data = 0},
+	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_XILINX_HAMMERFALL_DSP_MADI) },
+	{ PCI_DEVICE(0x1d18, 0x3fc6) }, /* RME HDSPe AIO PCI express audio */
 	{0,}
 };
 
-- 
2.55.0

