Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786385012B9;
	Tue, 29 Sep 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686450; cv=none; b=T3vfRn/eD4Ssdr0ZiwJ29Z1XzgFolFs1XSaFXNNPHCMMZsts+SNtSiOea+fnx8FeILJOC9xNJqGamMzOYQ6xZpbX5ii9pZ/hidjx2oQhbmLp85BjR0qOaHB0XGYme9WqZtGg1l507Nb65m0lYAq5j7g42re52knlUOQ73+n4tRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686450; c=relaxed/simple;
	bh=yf2/sRBSN6DjyhAn+qLyEYzwHFaHHenvCXnEqekvF5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLsgVCyMqhJGDFe6VdfFTHx9qHYwZNh2lnoOfonPOkuW40YrbP37IOgu9c5DR5gaWECbUkCvgbJLmrMG3/69/4a3YQzuO9elFovDkmuT+GYcodiH3hN2EtEmi4hSjnQzrZ2jXILnrgwBp+yS5aZNwOxHsO3vlvAtq+jsQ408gCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c/zWE+vk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=78NHePUp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NTyXPUKk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6FBd8E0G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c/zWE+vk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="78NHePUp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NTyXPUKk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FBd8E0G"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA7B421C98;
	Tue, 29 Sep 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790686441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn0CJxjJMeTCqxSmJnkx+ocdg9LJS4Xkm8aoRl78vRE=;
	b=c/zWE+vkwmMmzbOqNjxpiYyIJbcTdJ772Y2nybvWdVsdkHXZ51FUsgGpkuzKzqVvwiy8Gr
	jcEMPzMlAc9tlXESge5OWk2I7taxyk5N+LwxIY+pGeXryAPx36UGVrjsyxO90m9uNlQmvg
	I7hlBgGCWDnrWRDVINSaQ/roHztOmuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790686441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn0CJxjJMeTCqxSmJnkx+ocdg9LJS4Xkm8aoRl78vRE=;
	b=78NHePUp0L1qQ8SkTwSMw6gDCE5dXL7ZlkXEbP91UaP+3YJ00VuYIA6I0BqqJNF1kpWQeW
	lgIL1d3KgSROVrAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NTyXPUKk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6FBd8E0G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790686437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn0CJxjJMeTCqxSmJnkx+ocdg9LJS4Xkm8aoRl78vRE=;
	b=NTyXPUKkbFv29vLyMjm/W+KuA1r8o9QkkjBRJ92aHrIqw9jNeEkS8fQJIT5sKlsRmleZh2
	3lD/50n95gWk0RmdxJSnCOlWKspknvAROue0512lZprcxBshXLDwGFTrBzp/vLJZs4yks/
	CY6uw/J6CJwv8QMyv/u0LPQAqcwXWmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790686437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn0CJxjJMeTCqxSmJnkx+ocdg9LJS4Xkm8aoRl78vRE=;
	b=6FBd8E0GKtXcC5TkvehLYfBhgNrthnkVODVM5UXo6t1jGXYxE62VM/9g3wHYBbynvEwU1z
	e14VgnZbaUIYzNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9568C136E4;
	Tue, 29 Sep 2026 12:53:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jFGEFOW0u2q3dAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 12:53:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farhad Alemi <farhad.alemi@berkeley.edu>
Subject: [PATCH 1/2] ALSA: core: Check shutdown flag at D0 power-state, too
Date: Tue, 29 Sep 2026 14:53:41 +0200
Message-ID: <20260929125346.1478631-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929125346.1478631-1-tiwai@suse.de>
References: <20260929125346.1478631-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CA7B421C98
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The snd_power_ref_and_wait() skips the card->shutdown check when the
card is already in D0 state and immediately returns as successful, by
assuming the all-green in D0.  This assumption makes the code after
this sync point behaving as if all power is up and ready, even though
actually it might have been already at the disconnected state.

Add the missing check of shutdown flag there for the more consistent
behavior.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 1bcb6a2e7550..a51b71812fd9 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -1174,12 +1174,12 @@ EXPORT_SYMBOL(snd_card_file_remove);
 int snd_power_ref_and_wait(struct snd_card *card)
 {
 	snd_power_ref(card);
-	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0)
-		return 0;
-	wait_event_cmd(card->power_sleep,
-		       card->shutdown ||
-		       snd_power_get_state(card) == SNDRV_CTL_POWER_D0,
-		       snd_power_unref(card), snd_power_ref(card));
+	if (snd_power_get_state(card) != SNDRV_CTL_POWER_D0) {
+		wait_event_cmd(card->power_sleep,
+			       card->shutdown ||
+			       snd_power_get_state(card) == SNDRV_CTL_POWER_D0,
+			       snd_power_unref(card), snd_power_ref(card));
+	}
 	if (card->shutdown) {
 		snd_power_unref(card);
 		return  -ENODEV;
-- 
2.55.0

