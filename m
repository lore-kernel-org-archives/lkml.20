Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA748E0F4;
	Thu,  1 Oct 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852716; cv=none; b=GeRc8zpRMF+6ZGM10qdsSSz9PQxoMQHZqO/WSpZzc9hZHB4swoTx29p6nB2M4w0alIQuB7jQFKZgsD1EQHIz2Wbb9EdiWpxeG2RUIJb+Edadrj0nUJter8CYfctJwTUgHaz1Xu5BgQGBKgY1YePDvFCyqBe95vFcNYVfELsYp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852716; c=relaxed/simple;
	bh=UsaLigdHBa0kuqoCLMM2fJ7Tt2qZE7/q5iftrkyMHMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+cRH5gdbTUg31ATAwnALeOIJiZrprchc19S92NYDAi2QA8B4xQkTEJ6Zs/b6p+72uMGHOPybTM4ldh83qib9as1ESxnC1VlRoYJjvJURymySNJFIVXXwBPOiLJMNpJMBJonyeZtz/vYXAmDZjQlpgRgmQRsPVE3j7IyGLj58kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qdb54RyS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+9buoeuh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vjFxo4en; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xAnncrbB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qdb54RyS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+9buoeuh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vjFxo4en";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xAnncrbB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B8351FD0C;
	Thu,  1 Oct 2026 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ll90GMyI8ulQjNwmdkOOnrbgJAIYmZSgk7QY+HX3pRY=;
	b=Qdb54RySpvqpZXIk1s1csZAXO3ruXE5XddLt7RyS7e/EtV98eGdQplZSfpQh20KaO/9Zb8
	H7MtcrpMeTw77IpJY57B7RZL77Ut7Ky8p782VR4Ad985gJgqbKODOO981yiZ83eogcLz8T
	XaF+yM5eEQEiOg0e8gfKldQ/nKv4rRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ll90GMyI8ulQjNwmdkOOnrbgJAIYmZSgk7QY+HX3pRY=;
	b=+9buoeuhfv7oRpNKWWt8BT1z4U+jIZtjmsR8tD5kZkxrLFUUFeehN8j6HGnTw42JWNyHFd
	CJMsCH++XyT3mOBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vjFxo4en;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xAnncrbB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ll90GMyI8ulQjNwmdkOOnrbgJAIYmZSgk7QY+HX3pRY=;
	b=vjFxo4enYMTIK6brHYN5PoLYgULcZCUquuDUfSKrkBSI9BcqYARKiV5p2+dhYJI23YuKMj
	6V9/r4JnoawbJHUYXZQP4MbFTqNoD54l8hzHBdli/y+uOQWesu5bsWTnnS5DrBXgDGvNUP
	BMnEE+zqIw8ZCAwsLmHiQYlBFtRjT04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ll90GMyI8ulQjNwmdkOOnrbgJAIYmZSgk7QY+HX3pRY=;
	b=xAnncrbBcK1/PHnUA+Va7OWeitNXUeMluRS3uoWa3MEkndi8YEydFX9iBoiWa5KqqspsT9
	aJ5YjxeOf+UF48AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E8BD13B66;
	Thu,  1 Oct 2026 11:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T13
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 12/32] ALSA: cs5535audio: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:52 +0200
Message-ID: <20261001110447.486782-13-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 8B8351FD0C
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
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
 sound/pci/cs5535audio/cs5535audio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 0ebf6c02b1ef..a11faef4ab75 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -283,11 +283,11 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_cs5535audio_probe(struct pci_dev *pci,
-				   const struct pci_device_id *pci_id)
+static int snd_cs5535audio_probe(struct pci_dev *pci,
+				 const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct cs5535audio *cs5535au;
 	int err;
 
@@ -329,16 +329,11 @@ static int __snd_cs5535audio_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_cs5535audio_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_cs5535audio_probe(pci, pci_id));
-}
-
 static struct pci_driver cs5535audio_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs5535audio_ids,
-- 
2.55.0

