Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6C3CBE6E;
	Thu,  1 Oct 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852706; cv=none; b=b17aF5431tJVvWHS2poSoGH9So/+VIboDXy5OvQjjJ9UBKUvewzm6OVhxYPzeXE1Sui9ij2jsOHJSmo6JnARYnuBrOTp+2y0BxUrzEDC2V8ZrKMRUW+ZIF5p1mUUpNma1qySYLwKETIGynQe6ZTEySD014QFjrZi2EYf/pJdzx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852706; c=relaxed/simple;
	bh=h69h47t/swlNqmgiLe5qUpUYBRHjeFJo8DSRHjhbdfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egyDdugC76M1nrE82A7EU1lMgfJug2KrFPQTlVGrH8JEBqZ8mBttnMIKSjJQwEgcRiJj7YguoTeikNBR0U+ns9hSiIah1MrjkbZGqFe0IkpPL9zmaRd6WZSu8Yu1P5GivYLDzNPzhvUKGoSaGUc2uIfVJXKKkVBs5WGHRn6xdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vPMbznUc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=64KrguFq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d5G54yKe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EUhNX1XH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vPMbznUc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="64KrguFq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d5G54yKe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EUhNX1XH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 38E4B1FCEA;
	Thu,  1 Oct 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emGjFXFwt6R85iLh7ylHvrRJLMjdhWZJ8MnTVw1hL5Y=;
	b=vPMbznUc1v+I5s545p2w9D/FYSy1ydzFvOxGvUbUi74PxBrywSh8R5ITiOTTNhoH42TBhH
	zH3xFm6nKUyjRsHQNTmfGVPplOTA+ACnBhI7fhznz4jLl6ZsoiYjGZCbYwmH+17IR0WAau
	ANwMaTPPMgfhkHSzoBjfOZf3CFbNIiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emGjFXFwt6R85iLh7ylHvrRJLMjdhWZJ8MnTVw1hL5Y=;
	b=64KrguFqnz1fg9QGxFuN9XFcuzDqa8+66AO199sGB/V50SoF66CadZpOlssquMJYo5BZI4
	SNmygzAfv1hUr6CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790852694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emGjFXFwt6R85iLh7ylHvrRJLMjdhWZJ8MnTVw1hL5Y=;
	b=d5G54yKezi3jjXS+1WbhE09gPt3bAY5j7OEIrcFOQNrbR/uc9tWo609VG0U1R45cDk5pfZ
	bIiAlG21r7ML6XoIeFUJ/bFuRTEofieIPNXwp9uHXaVsZzhD1j9AlRzpYf6GEo8iZStwnv
	NTWpZG9qHa3Ko9LrQtlo+Zjgjbx04pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790852694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emGjFXFwt6R85iLh7ylHvrRJLMjdhWZJ8MnTVw1hL5Y=;
	b=EUhNX1XHqpJLyqNGaC9k2e7SnoNQr5zRrRCFim92Uel5PSC/U0fF6GcRmnQAzkVhOBRTXN
	oF8xBAPtYY3xoSBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E516D13B5B;
	Thu,  1 Oct 2026 11:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mU58HFU+vmqGEgAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 11:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 01/32] ALSA: galaxy: Use auto-cleanup for probe card error handling
Date: Thu,  1 Oct 2026 13:03:41 +0200
Message-ID: <20261001110447.486782-2-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/galaxy/galaxy.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/isa/galaxy/galaxy.c b/sound/isa/galaxy/galaxy.c
index b0f1562d0fc0..12d4de58bb6e 100644
--- a/sound/isa/galaxy/galaxy.c
+++ b/sound/isa/galaxy/galaxy.c
@@ -478,11 +478,11 @@ static void snd_galaxy_free(struct snd_card *card)
 		galaxy_set_config(galaxy, galaxy->config);
 }
 
-static int __snd_galaxy_probe(struct device *dev, unsigned int n)
+static int snd_galaxy_probe(struct device *dev, unsigned int n)
 {
 	struct snd_galaxy *galaxy;
 	struct snd_wss *chip;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	u8 type;
 	int err;
 
@@ -595,14 +595,10 @@ static int __snd_galaxy_probe(struct device *dev, unsigned int n)
 		return err;
 
 	dev_set_drvdata(dev, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_galaxy_probe(struct device *dev, unsigned int n)
-{
-	return snd_card_free_on_error(dev, __snd_galaxy_probe(dev, n));
-}
-
 static struct isa_driver snd_galaxy_driver = {
 	.match		= snd_galaxy_match,
 	.probe		= snd_galaxy_probe,
-- 
2.55.0

