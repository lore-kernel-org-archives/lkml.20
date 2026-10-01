Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA39511E97;
	Thu,  1 Oct 2026 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852732; cv=none; b=aTFbSAcGM8kCTYNq4xX9KdAysGwRLLI1yjsDuWiwfYFv4Ni8KDxlgT/4lxB1xgnMY3HLzqPopm9aWdLV/eECK+c13RvttZGQqQcecug/0+t7NvGTGS6PxjLolU/Ie0dDxq0tHC2tZGtFat/6Ozq1dO7uvyPOPB5wlsEVGdsIKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852732; c=relaxed/simple;
	bh=B21UpqjHEox3ddzYtm6ZhhUA+nY9vZH4D3GBf8eCDCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuMbTDVvDfQjnC1/wbZLl5R+0pIG7tIUHLOsQYzjYwf1CF4kV/DjRlb1yeUTBn4Eg4hYhzg5zGxlgAQ1RuO4aW17jn9+RfFiTc6nafr1mQwRc1ohZAwNH02clGSgT8Ji5mt+ORl5/U4MgL9Ed2mMnLaYzsyq6KK+NSWRdg+wl80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KnmvlFKx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nAaaiEqn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGMcmJVS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yDIovzsU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KnmvlFKx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nAaaiEqn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGMcmJVS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yDIovzsU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4419621F6E;
	Thu,  1 Oct 2026 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWTpWthPyrh9xJ/WKYIfototQbyEpDeBWTqVJ6LLesE=;
	b=KnmvlFKxzg1QLodx2yZvXNUT+qVQdzZIObegu5TFSuU8zfnfvRo3c8hsh96lpBYZEBvRJg
	/BNdExSc+sdCi+hgNDZHxsgTArDCxRkUTzR91DMnwOa1zeF3CsTdJmrpgmWuQokFLfRrUp
	MjgqprZjl0X/IzymzsrxMtlAOgd0Wd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWTpWthPyrh9xJ/WKYIfototQbyEpDeBWTqVJ6LLesE=;
	b=nAaaiEqnnJp4RTPi+DOo29JnAkZyCg6uEZbhh2Wb3Cq79e2uccPQkw2N5J5tFzl9UzLDOw
	OajiJiznM0DPj8AA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DGMcmJVS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yDIovzsU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWTpWthPyrh9xJ/WKYIfototQbyEpDeBWTqVJ6LLesE=;
	b=DGMcmJVSsa2A1NCB7bqFU9dKlGc1vO4QoXW6OGBZQydZ+AkmRcNe09UE+VC0PRd+9u59HM
	l2aqSdKcFx8HDbZzlKpLABFlBz/LIOEvRoPRRLwm4TS/yV5BWGacyvVhCfWqJFebWSyoT9
	vIZr1k3u3tLOXBsNkYJ5MKYt0ey5LtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWTpWthPyrh9xJ/WKYIfototQbyEpDeBWTqVJ6LLesE=;
	b=yDIovzsUuofe8OrmGWIciQCuWeqL0GXuzZXoDS8vC9C5peHqH2IhtcHLVbKC2tBWHiFbbL
	dvIGXnRtKhh3JKDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A01B913B74;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T26
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 25/32] ALSA: rme32: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:04:05 +0200
Message-ID: <20261001110447.486782-26-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4419621F6E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 1d5390621908..af326de4494a 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1810,11 +1810,11 @@ static void snd_rme32_card_free(struct snd_card *card)
 }
 
 static int
-__snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct rme32 *rme32;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	int err;
 
 	if (dev >= SNDRV_CARDS) {
@@ -1858,16 +1858,11 @@ __snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_rme32_probe(pci, pci_id));
-}
-
 static struct pci_driver rme32_driver = {
 	.name =		KBUILD_MODNAME,
 	.id_table =	snd_rme32_ids,
-- 
2.55.0

