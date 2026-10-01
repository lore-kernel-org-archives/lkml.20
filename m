Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD8B4EF12C;
	Thu,  1 Oct 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852715; cv=none; b=o+tfRW9dDvHoVF0MKS3AguC7VksUmVSpYMpEE0JtJX+5ATp47ACPYG8r0Q7mPQ47UKdkkglE0jHQbiMyQ4E38Xw/QhG1k7KA7D2zZ5/z5nw32WM4TlSWIQD3Ed7E/AyH9DX44oqV6Nv82z/gm3k33/iCBitjJ+nS5Wawa8mQbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852715; c=relaxed/simple;
	bh=s3A0Fj6mioUWRGs543eFBM0FoR5fi4dKkdMHpeiuN8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8tOLdnRUyjKJcxVtmIjgkS4zhMeSbsf3rUeoNP4aUGfb/+N6GoGExZ7eFjm4aYn0uNVzlMfZlZfz3s1rP9Mc2vpaOyzxbgOuMZQpUOeLhKi//k8kObwV5RXQwHWzE8Dh6EVHobRy/TcWlgQHe5bXPB8oiP2y1PfCuuS2D0cME8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KxBMq/pi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sFK392F+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V5SA9PrG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kOPAlHXp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KxBMq/pi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sFK392F+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V5SA9PrG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kOPAlHXp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FA3D1FCED;
	Thu,  1 Oct 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2O1hwBkwKOoz6OS7XYy7fot5Ir1/GBTlYkyQCN65No=;
	b=KxBMq/pitukvNqr5BZ2vIPI2c8oQHvn9d9VPxtJeve6Xn30dR5XZNYzFmmuu5GrXwPRhHe
	ngWWD4iZnHAOcYSUGDlBjp2uhFLPitCQZqgytfCgbWUHPU04ZI1tLEUGcPT7zf5flTtfA/
	YuCmEx+XzOZ3b1AqL7MV1L9QfGeY2sg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2O1hwBkwKOoz6OS7XYy7fot5Ir1/GBTlYkyQCN65No=;
	b=sFK392F+9b5z/+WjFa7rj/WElRP1fQhZvHIWE+wou2jH50dL9sCq1a97bXpyvDIo5srOuE
	7OMm/TArxjH2tuAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V5SA9PrG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kOPAlHXp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2O1hwBkwKOoz6OS7XYy7fot5Ir1/GBTlYkyQCN65No=;
	b=V5SA9PrGNBPJaRrkVMurgrrZW+3H3iUlFHpAjk9V0jkEyXojpW36jvcZ+hzZUVjjAJqFdN
	n0lFSGE1zcnyrxW4u8n/SWcUFiViELD6V/k497sH4raQCbl1AnZzqRcCC2CiuGTGALLGWi
	5BZpoDOIdu5ORM2Hs2ysz60VcE3d2qI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2O1hwBkwKOoz6OS7XYy7fot5Ir1/GBTlYkyQCN65No=;
	b=kOPAlHXpAMBj+kkyllPvYDS2R2TqVzgNqrmV2G29PcmOHi66NNL2aZShhNmtPJATHPBsL1
	9lspP4iaduqhtZDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29F3513B63;
	Thu,  1 Oct 2026 11:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T10
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 09/32] ALSA: bt87x: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:49 +0200
Message-ID: <20261001110447.486782-10-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 1FA3D1FCED
X-Rspamd-Action: no action
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
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
 sound/pci/bt87x.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 383def1f2af7..be402b94da17 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -798,11 +798,11 @@ static int snd_bt87x_detect_card(struct pci_dev *pci)
 	return SND_BT87X_BOARD_UNKNOWN;
 }
 
-static int __snd_bt87x_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int snd_bt87x_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_bt87x *chip;
 	int err;
 	enum snd_bt87x_boardid boardid;
@@ -878,16 +878,11 @@ static int __snd_bt87x_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	++dev;
 	return 0;
 }
 
-static int snd_bt87x_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_bt87x_probe(pci, pci_id));
-}
-
 /* default entries for all Bt87x cards - it's not exported */
 /* driver_data is set to 0 to call detection */
 static const struct pci_device_id snd_bt87x_default_ids[] = {
-- 
2.55.0

