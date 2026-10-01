Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DB3503BE0;
	Thu,  1 Oct 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852726; cv=none; b=BdOvol2NvuPmPOaF8EPyM2CiXdnU/5UzKW7qA0OZjCC2JKvrmSk9EA4US7VKNtL1eJuvZq6G2/BVabrLZKzgL19lTTIGjHLMhY03kuAj4AEaJNnieWQNHLnlJuLuTNedKKkVHZ4V1xJkyKus6htns2yZMgo0CSlt4DXToWj1JmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852726; c=relaxed/simple;
	bh=0XRQx/UgCUqDxMOhY94ua4OwVz8oW7C4mXwNYnKLKok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9Wa/LsFt52r97LJV/qk6blH376ceHdVb50VUFn4rDUyJPydu0n7huhsBWE7R3FjKR1tgMZ283eyniP4ofXPXvWbIcJBEx7KwKKU3d9CZD+BHhd4VAqoj6pUpFJnJzo+6NG6Af99L3DPKSv/PdDf+/+75curZV1mrmU4JMa6+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WrmPBknE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AEIT491W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gHn60T3Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Fjpz1KDH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WrmPBknE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AEIT491W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gHn60T3Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fjpz1KDH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 537A31FD0D;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIk0IkWMS0t0vqixpiPLrg9xIxvEJxZW5SXz7bcOaEE=;
	b=WrmPBknE1EROmoKcPbgfKLyp8yI6hhcSYKt09+smnnucukhGCDne1xgAr0IjpCxxiDrTmH
	CZgxjudq0e4Yxb7WivErbG4sCTMb98AJ59+/c2NGhWeITgq3R1PfbNZt4t00onPJytxKmB
	OLqF0eHfRBXEWaYF3z5xy/ggEYP1mA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIk0IkWMS0t0vqixpiPLrg9xIxvEJxZW5SXz7bcOaEE=;
	b=AEIT491W2rvRIil0LanRcfRYq5Pv+GgJNxILXq5VGf4f6hCYb3LwemGvwdrsARZOiQGfgU
	R3PU9avAI9z9qFAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gHn60T3Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Fjpz1KDH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIk0IkWMS0t0vqixpiPLrg9xIxvEJxZW5SXz7bcOaEE=;
	b=gHn60T3QrQvOppoXXkXm+ohjHi73f8RH5mqdOPZHSKIokqp6Uoi0PgYNbP+UWIWQJb5222
	khDJ0GkDDyuBUnZCJ3+g05nXIbfHeL/po71sFBSnySIN9srkqOQdg5gCeuw2R9ZG+7JsBE
	SYInphyh5usq+NC6Z10u4CC3qL7WBNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIk0IkWMS0t0vqixpiPLrg9xIxvEJxZW5SXz7bcOaEE=;
	b=Fjpz1KDHrb0I5c6JyOJIAtTw3pnBOU6NUl0WsE6fpV5OrmNf47IaFGxzssMenC50n9O8pj
	ziNJ5r8hMqIza9AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C560613B75;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T27
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 26/32] ALSA: rm96: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:06 +0200
Message-ID: <20261001110447.486782-27-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 537A31FD0D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme96.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 892fcc598557..a6cd66d22d5b 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -2356,12 +2356,12 @@ static void snd_rme96_card_free(struct snd_card *card)
 }
 
 static int
-__snd_rme96_probe(struct pci_dev *pci,
-		  const struct pci_device_id *pci_id)
+snd_rme96_probe(struct pci_dev *pci,
+		const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct rme96 *rme96;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	int err;
 	u8 val;
 
@@ -2420,16 +2420,11 @@ __snd_rme96_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_rme96_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_rme96_probe(pci, pci_id));
-}
-
 static struct pci_driver rme96_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_rme96_ids,
-- 
2.55.0

