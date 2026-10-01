Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C6503BF3;
	Thu,  1 Oct 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852732; cv=none; b=DGh+ldgBdEJx17OgglJkFZw0z3/PJQg8k2O6Kcp/fqvXhQFFr/0iSu3H+8t5F/Kp44E5Ev9zp9++ycNw1DVeY13mffK4GlL93MjnPiWfUg+9xMQ0j6/svcirP7ZWYnudDXVoYnNAWhDtzvL8V/1o4e8jZuTvk1jCNQ8jF4OkJmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852732; c=relaxed/simple;
	bh=OsOvyJE8fo2gmiO0CAvGKL/92yro/rMXcHoRhhfYUVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMzQsheS4eQQXj4c/7ETIvksMK9UPIZGKopwM2QMYphzbelFac2PZZ/1XiUqgHtlPZTbrKTn6P7YPeUq5Ao6etwZNBaryTDWE2ziLph01g346KFv6fZitm0bJcJ4YaAljwwWbApUV6GGLGOy41kwB+7nfBC5tlVT+/UcssFNzZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h6R4FJmD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KRzAGUbl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ympEtUY/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+lUwF44+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h6R4FJmD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KRzAGUbl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ympEtUY/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+lUwF44+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D2EF21F35;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSCitydm0xFinZumQOZRAeqxKVlPNiSlnA+G1lwwCMc=;
	b=h6R4FJmDxdVHBkqSBDcKCNKFtm+ihZIYU/ulfUpUZDwVQF83x/KycONCNXI9W3B66rtjW7
	2x0TMf/7ua/hL0gi6L17hTIXUaZVLVBIM0vUdp195qg4uIk79eia3TqfFU424HxjOlqdWj
	HQnrTbdeO7dhmhRKguEFulS/bVdIJAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSCitydm0xFinZumQOZRAeqxKVlPNiSlnA+G1lwwCMc=;
	b=KRzAGUblFlF3wAAGFXEdEdOFWlPazeyAfMYF/6LI6dIC2nXEwQkHieEtRyIp4XvdGxfW93
	fOF3I4naqYRXhFCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ympEtUY/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+lUwF44+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSCitydm0xFinZumQOZRAeqxKVlPNiSlnA+G1lwwCMc=;
	b=ympEtUY/xhVkKomKvtBzVtGCBMPYF1qbMVM1SvN+AKvZ0fEazM7JKuS2nMS3AOwazgSSDe
	VkyxryzoSNBAQsGKahHFJRcobw7shrRHtwztG/jQ0w2HgKN2m8Yp3aLufuL/uYXN3OtmYw
	7SmOfRi9YhsRiYyr9f8dQC9Zng4SPaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSCitydm0xFinZumQOZRAeqxKVlPNiSlnA+G1lwwCMc=;
	b=+lUwF44+d5tRhSq92P0F5L+iN+LQ2rNJJ5HEoq9kSwKhjgziIZHJPtIVUJWenC4Vpv5UwK
	OpuFO8VWMk6FQjCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B54C13B73;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T25
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 24/32] ALSA: riptide: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:04 +0200
Message-ID: <20261001110447.486782-25-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1D2EF21F35
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 697fece744e7..f3d24d9d9516 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -2020,10 +2020,10 @@ static void snd_riptide_joystick_remove(struct pci_dev *pci)
 #endif
 
 static int
-__snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_riptide *chip;
 	unsigned short val;
 	int err;
@@ -2117,16 +2117,11 @@ __snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_riptide_probe(pci, pci_id));
-}
-
 static struct pci_driver driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_riptide_ids,
-- 
2.55.0

