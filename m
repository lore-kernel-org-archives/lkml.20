Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635A18C933;
	Thu,  1 Oct 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852705; cv=none; b=XqFhvyDbwlF4ble0HvkfSnKNIEdSov/Ul8JN/Lx6LyqOvzSMWQA5FvtYVQVCtzsPV6nKGeiqDilHRAjipx09E2Ju0i9URRiczr3Y3ujEeIWsUwpEfSCj4THI0icxilr4bqRomV2jIFbzeafO3YHNAB6X8QQ2YdhIpmEm9xCVMnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852705; c=relaxed/simple;
	bh=pI6sr78ibrejopRo58K7w+0do14veYrdzmujTjCOPeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdktSyuMf44WeZzKuPfwxn5FpcLNouFFawf6Z2dJpJIPLdYggvgbP3QE4cXecAuNoCq1jcTk/BhJjyBsrg4zEnM+j6Fq8gorazDWwsID5yxKPoe5WSdHwrzDttxW2uI4iWQ7PCPuvr/l3TRZNJiyJZXoo8HeWHhG04o0bwvqd4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I8QnrUtL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6rvaKW0s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cm8UE28l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x6Gk7gfH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I8QnrUtL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6rvaKW0s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cm8UE28l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x6Gk7gfH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5972E21DB5;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1Zmp8DaWmXNsEBOjOkInvu/JbMj2EeSUhCQnzY5ZNw=;
	b=I8QnrUtLiTySrAjADe33EfaPDregiN3sCdDugwuK0eT5HV20tGSsoPQZS5WGdVERGfGlIF
	v/W0sbDVAjgDnM25iJod9SdyfQt5dql64Xb2agIkyM/6rgWBV/Esy3PNQc/zAAYm/WMfad
	n9NY9lFnDEHlldvstptXaqcbn6kMFSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1Zmp8DaWmXNsEBOjOkInvu/JbMj2EeSUhCQnzY5ZNw=;
	b=6rvaKW0sSun5Yx3IvmFJULJxhppF9AdtrXWv6/qufHpHevE3OS6iKWJ0bsVhljU30+lIAF
	EQtxOAC0odBmt6AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Cm8UE28l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=x6Gk7gfH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1Zmp8DaWmXNsEBOjOkInvu/JbMj2EeSUhCQnzY5ZNw=;
	b=Cm8UE28lrCQesRhyZfGuaMR0hIDcivukZIe3RYgCoxkZ++Ksr18ki6pjCMzrCJeStbgQB+
	Srk4kARKPp7k0+Hqw5/vudyA91lXFtE1aQ0vNEyVnxQK6y7Z6HeZI+aDmf+Z6nlkoXgkeh
	DY9rdkiUa09MjdvRwPg17kuowEdQYsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1Zmp8DaWmXNsEBOjOkInvu/JbMj2EeSUhCQnzY5ZNw=;
	b=x6Gk7gfHGt0KbTRzEoDiH+azIpZu5635G6RXDzqinxtDvHslXHETKNSvPjue8/2gDyrNi7
	OJKGtvgUNouZHhCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1619613B5C;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 02/32] ALSA: sc6000: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:42 +0200
Message-ID: <20261001110447.486782-3-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5972E21DB5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sc6000.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index cd3a63c7c2a7..31a13bdb3bfb 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -572,14 +572,14 @@ static void snd_sc6000_free(struct snd_card *card)
 		sc6000_setup_board(card->dev, sc6000->vport, 0);
 }
 
-static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
+static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 {
 	static const int possible_irqs[] = { 5, 7, 9, 10, 11, -1 };
 	static const int possible_dmas[] = { 1, 3, 0, -1 };
 	int err;
 	int xirq = irq[dev];
 	int xdma = dma[dev];
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_sc6000 *sc6000;
 	struct snd_wss *chip;
 	struct snd_opl3 *opl3;
@@ -696,14 +696,10 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 		return err;
 
 	dev_set_drvdata(devptr, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
-{
-	return snd_card_free_on_error(devptr, __snd_sc6000_probe(devptr, dev));
-}
-
 #ifdef CONFIG_PM
 static int snd_sc6000_suspend(struct device *devptr, unsigned int dev,
 			      pm_message_t state)
-- 
2.55.0

