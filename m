Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D152231A23;
	Tue,  6 Oct 2026 17:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308415; cv=none; b=HrsXKHfKz4x4GnqYm7eMk8DBrHV3aP83HeWx93dwAiOosLtWoiuMnNo4Vq2M29kFs3XmQ2xFomtKhMi2R/fD38bSe3kIfRz7rELL78HaoLTq55qFuNC6p/KYAwmKO8mnamaXGzZv0RXwWiVQTfEI4NSaR/bhhq/dkOpCHFAZVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308415; c=relaxed/simple;
	bh=d58UHG2Lr+TOqR3cJdxt8Y3o/BpAdWtFie8vc3xkxME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rt++/ySJmDJPDjnGieZcURcWvzWeuCNd73QO5jWBfqUVzsvzTbCWIIXbPv+qN3ERWcv3/sEnWstKEQpVWwpwl/c58Eny9veERVaklD2t57oFQCmLL+C1Z6ItR9zP1v52u9p4OgLfbfViLKhfSJi1ZFv+XiU+E/azmQ075cHp2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kuArslrX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A+t3XCOD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jasOKAIA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=84eLpGrl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kuArslrX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A+t3XCOD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jasOKAIA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="84eLpGrl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 627B021F2C;
	Tue,  6 Oct 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tA5WT7wGF8vx2aUZyI887dMxvrpAa8Xkr/OBf6QAdyc=;
	b=kuArslrXRFkwCVJ3X/IC9zl6L2+BFFs93s5sv4z6dJA4OYI7VlSVjJio46YYixlE3YI7Tz
	E7WbqQ9eO0T03Tj+Jd5HcXbJEbPJTfwGVQpqaT0OuMpJFmYP4K2IJV1yLoyOTM+1PHTX5H
	SPc+g68NMConkSJf+60Twzu4tYU+74U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tA5WT7wGF8vx2aUZyI887dMxvrpAa8Xkr/OBf6QAdyc=;
	b=A+t3XCOD9XxOQxLnsw2tQYw+SmqTxMwt+CAgOOzR31jaagk7/xmSC6+3pj+/gnnmw0cEwA
	zTPCK4YVt11HXuCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791308404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tA5WT7wGF8vx2aUZyI887dMxvrpAa8Xkr/OBf6QAdyc=;
	b=jasOKAIAQmtRbmWPHhcNqJNB/sYy2MeYObixBVGnCdRAqFyinGeZw7leTSxBmOc10xuEw8
	TYWBXb0c0aoo+FPZXecaUioWa5+4tp39GhcJvOKF9EJzoJiOv3JvCKnPo/JOcMPQWwb9gd
	4BUXSfgojJwUxCrlvaTfUTcvOmlRUpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791308404;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tA5WT7wGF8vx2aUZyI887dMxvrpAa8Xkr/OBf6QAdyc=;
	b=84eLpGrlxsLZ7yZu0bJ9xyYUcz3KwoB3WkjF7HkgodnUb1n/5XYmgV9pf5Taatd3GVgokk
	Yxx8WlVVqJLjESCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4BD813B82;
	Tue,  6 Oct 2026 17:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qpimInMyxWr1eAAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 17:40:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ALSA: pcmtest: Fix leak at probe error
Date: Tue,  6 Oct 2026 19:39:54 +0200
Message-ID: <20261006174002.703431-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006174002.703431-1-tiwai@suse.de>
References: <20261006174002.703431-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.997];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

When an error happens at probe of pcmtest driver before
snd_card_register() succeeds, we have to release the card explicitly,
but it's not done, leading to a potential memory leak.

Use the new auto-clean mechanism to handle the error case at probe.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcmtest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index fea9580593e6..4733f7c7729f 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -596,7 +596,7 @@ static int snd_pcmtst_create(struct snd_card *card, struct platform_device *pdev
 
 static int pcmtst_probe(struct platform_device *pdev)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct pcmtst *pcmtst;
 	int err;
 
@@ -620,6 +620,7 @@ static int pcmtst_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, pcmtst);
+	card = NULL; /* probe succeeded, don't release as error */
 
 	return 0;
 }
-- 
2.55.0

