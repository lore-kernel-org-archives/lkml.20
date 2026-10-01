Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEC63AE71C;
	Thu,  1 Oct 2026 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860704; cv=none; b=uyKxoCagAMaqdDBuwcuJamx3BUxgIBxfhab/Y2bTYqHWuFJxOObU52kAhJjihQqqrwgusCN33Nt6x7dKeMma4Hiu8JB8izw3aMNQbPwd4ccX4QseCb6wYjj1fURrQACcUDdCw1G/fmdAeJH6xsyic0j/sl09ncFW2S8ycrRZGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860704; c=relaxed/simple;
	bh=NqxwnCmqUV5q2fm4qS3QMgek2iUIqQ1M6SqGILmj9h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhrLc7eZSBwW0OhZsmDtSGBIIIsPhRBZ/cGUlBTJDDluUwAZvUn2cKbjV09rOThAvRMexR03e/uXHWFK/tx+zhPi5FLC4Tpunw9/HhJOyjpwla0yTw3FFrFMdKk25Eq/sFSQ0Xoio0eEb29D6X/Q59SIpDYNfi7e43j+qFKMxoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j0rZHw+c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j9KvMm1U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XT9VzrNr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6AwuWf2l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j0rZHw+c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j9KvMm1U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XT9VzrNr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6AwuWf2l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E93C21E46;
	Thu,  1 Oct 2026 13:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790860696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sFHvDWG2SsMU/PE1kNPbQQApG3pH5skCn6MZaeSImEA=;
	b=j0rZHw+ctBwiIgL0+LsO6eYgs+AenSqQTRt5SlHRxfwPbuxVQAlwOPtCbxxygxDObS2v1A
	PHEFhvQPjpA/+z95ye1cieNsajwpe4o7es8fpIn2m3SrmMPzCcavzYoYEF//FCNGFFPedt
	QsasOxaDhD9jEnW55Fn85qbAopHeWLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790860696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sFHvDWG2SsMU/PE1kNPbQQApG3pH5skCn6MZaeSImEA=;
	b=j9KvMm1UKfFvrmdi2iIGzvrDmTOoxvaWhh8XyoIZVKfqFnPkWKrEyEctOQPuNqQX7iQRfE
	K3L4wBHQKFE/IoCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790860692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sFHvDWG2SsMU/PE1kNPbQQApG3pH5skCn6MZaeSImEA=;
	b=XT9VzrNrIQiNOP9sAC7nanpjjKnnW8zZw16Q09Ee4A7/fF0AajIEr3ZKFtcUtsoUO5VkpF
	Dmp/RuHydwgkgL5o3HyYHEMQisgFvEMeq3zr+JBFTkOoaMJwUTf7j0uGRdXDK/D9QHNqLH
	0Z7M+sE/C1KVokJV9refGTVBF4AMFj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790860692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sFHvDWG2SsMU/PE1kNPbQQApG3pH5skCn6MZaeSImEA=;
	b=6AwuWf2lmudTxBaSRtF8mEcdageHQAh5F+j+qGhWKZ1n8NFxm809plvZBTo+ZcZz3P7qz7
	V+LI2oLQhLiDARAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CFDF134B3;
	Thu,  1 Oct 2026 13:18:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ql+2AJRdvmpCJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 13:18:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: core: Make sure to call snd_card_disconnect() at freeing
Date: Thu,  1 Oct 2026 15:18:09 +0200
Message-ID: <20261001131810.527650-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

When a card object gets freed via devres, it might be freed without
calling snd_card_disconnect(), and it might forget to release some
resources such as the procfs that gets deleted at the disconnect call.

Add an explicit call of snd_card_disconnect() at snd_card_do_free()
for assuring the preparation for cleanup.

Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This patch is required as a prerequisite for the recent cleanup series
to use auto-cleanup:
  http://lore.kernel.org/20261001110447.486782-1-tiwai@suse.de

 sound/core/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index 0897b3a11617..764d3d1073e7 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -564,6 +564,10 @@ static int snd_card_do_free(struct snd_card *card)
 	bool managed = card->managed;
 
 	card->releasing = true;
+
+	/* for case without explicit disconnect call (e.g. via devres) */
+	snd_card_disconnect(card);
+
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
 	if (snd_mixer_oss_notify_callback)
 		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
-- 
2.55.0

