Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CE412C16;
	Thu,  1 Oct 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852719; cv=none; b=vAw6ohdBmO4R7+3JGmZX3RyRwcISBuCaYz7clMxQgvTzoyVhyrPblx/ERmKnEEtzU+3i8CTfQHnE3J9QHFsvt2xFA3KK2YMZCphMe3Gj+yyi2Z4uyGcLiMnL8hF2/XNR5cQGeJYhMD8v0oUAumpWBGsaTmtbg8Pzsn6RAVADej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852719; c=relaxed/simple;
	bh=H6ubs2mBsDBNgql8UBM7XE7fQqJ7GnbViybvkNww7Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2HmQiDFjpPGaPLOwfvaylXIEuTmfOQ2XIlBCVggBD9TRjOWQjqzPXWbi+BXl5mk8ML8PMMgYSHud1MZM8SuowInyph8iJeZLVQWh5XFJD/y6TY7nYYPJzM5kRgzak9bf6ZxBmt/HaQ0f+8U1VNY9TDuuUT1K9Eu2+31A2Q9sHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IWZgcOXb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T4PdeAn8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g+P0YeCk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/eK7ayZ4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IWZgcOXb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T4PdeAn8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g+P0YeCk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/eK7ayZ4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1A131FCE8;
	Thu,  1 Oct 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzxoJdbBXu1JmBgWntvd6Coj1Vm7/+hgz1foRdTKXFs=;
	b=IWZgcOXbPES6CWTBsk+gMhP/UqgAGZgplfimwD/UO7h3vI2luBguJsAqNAoJtWcUmr7QAo
	9vkT8djDwzZhGxK+GBb82tFR3VEs3Syv2jwnqCJmnJqWKnHweNlEtsI5AcFOImDw2hRCdS
	LzPc/nK5CN2HcRnFMllwzCNDnFW4AgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzxoJdbBXu1JmBgWntvd6Coj1Vm7/+hgz1foRdTKXFs=;
	b=T4PdeAn8aYm/hIkQqdb9zVtzaHdHKsgfIgiHYLVjfXfP0qgtoUWh8QSR5k9Nh0yzeqi46B
	iMUq/ogMucps2LCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g+P0YeCk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/eK7ayZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzxoJdbBXu1JmBgWntvd6Coj1Vm7/+hgz1foRdTKXFs=;
	b=g+P0YeCkKNqJXkdVjnOskiw4yar8Wqkp7UlA9R7PLCfb0iTHOD+Y9I9xBdvXEoPKTr7HgF
	b+EvoX2Qfh/7zFfdy7LO4lov26zeA8dmPggU/wQCd1yymh6secoKTo9swg8+4/4EiTS9xx
	wQGJjU5J4DCMJghQiX73AbK4zpsgBaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qzxoJdbBXu1JmBgWntvd6Coj1Vm7/+hgz1foRdTKXFs=;
	b=/eK7ayZ4NCQnqdGHq79JYc8YhlJJeDMATQy4wuLa8w4t/vpwxd0NikzKSPY6mrZ113fAPV
	E/1sd9v8bAM/CbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA2B013B68;
	Thu,  1 Oct 2026 11:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T15
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 14/32] ALSA: emu10k1x: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:54 +0200
Message-ID: <20261001110447.486782-15-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001110447.486782-1-tiwai@suse.de>
References: <20261001110447.486782-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F1A131FCE8
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1x.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index ed4630c8342b..b763e98caf82 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1447,11 +1447,11 @@ static int snd_emu10k1x_midi(struct emu10k1x *emu)
 	return 0;
 }
 
-static int __snd_emu10k1x_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
+static int snd_emu10k1x_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct emu10k1x *chip;
 	int err;
 
@@ -1506,16 +1506,11 @@ static int __snd_emu10k1x_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_emu10k1x_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_emu10k1x_probe(pci, pci_id));
-}
-
 // PCI IDs
 static const struct pci_device_id snd_emu10k1x_ids[] = {
 	{ PCI_VDEVICE(CREATIVE, 0x0006) },	/* Dell OEM version (EMU10K1) */
-- 
2.55.0

