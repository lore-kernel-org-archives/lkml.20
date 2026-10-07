Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487E947A87A;
	Wed,  7 Oct 2026 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366190; cv=none; b=V3LnggfMve3eDFanFxkDi1se4GMiLCkxCCVAUEfAjJAkDt4iY/Pjbg/wtDpIQ9VkdoCAAiy1jXaxY+YmP3uWMebZeIaidI47Duh6/0lgHSRxhqsbylqvdf/xl0b/rJSFZ/BORfNNAIVho/5rbwVVMFkoylPaw4WUqF7BBAUKQ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366190; c=relaxed/simple;
	bh=86kVP4hAwDvn8nNmt/SxkZqmp8AhaCOB5zZGmoNKU0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsP6D8icT5KzUp9WxYyLVJ5khXdRtTeytvGrNgr0B5NStoKl3L/NX78AyXtfOuf6QjnHZUjKOTObKAQq66+X9bY4ToWr53on9s/WKlfIwBAMc1wNmweB80SXOxpSi5dvUypkJnu70DuRakC9lg+ci+ZtAE885or6x+wpGYR4bI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fdmMQfgX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0aImaO76; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W7tPT/ug; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ok3u6QKB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fdmMQfgX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0aImaO76";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W7tPT/ug";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ok3u6QKB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C46AF21EE0;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypYPmAw+J9u3YjmcSyrzqEL+7TZd4vp8blxKMkGccMU=;
	b=fdmMQfgX8q/m7LIPdTB6UPmsCl3nyuGWln6BvOS/MYMUT6l42qzXKR1BgZfgc7quIDF2N2
	oGAGe/+Rb7jVa9iLO1+9m8PgKsYI7YfA+Wnl58KtTDeD8CNLPBO0udgm005d9lJSsxsW9U
	zAudgSUumV8v9JEPRkINUBwHq0yMRQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypYPmAw+J9u3YjmcSyrzqEL+7TZd4vp8blxKMkGccMU=;
	b=0aImaO760+MmTUK4t1osiv8TIoM1guTaPDQPE6tDhG2RO+5CIpB7eDRniHftFdwhhqyvyH
	dFOd7Xg+Vc7T7lDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="W7tPT/ug";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ok3u6QKB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791366165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypYPmAw+J9u3YjmcSyrzqEL+7TZd4vp8blxKMkGccMU=;
	b=W7tPT/ug9kWWy06wY9KPuD/w+9Ye+Ry+8l279l1CqjrUw3frs3blVpvRQQYk9ZFB9FNIY+
	eIAqJ0kJR1CcwNJEMjy/irP9C4UcVb90QOyMx/x+Ay4/B1uSvskga8E7ZxK3GmMTZol4sY
	WrMalhiCzM8/Eyy7iviL+AAGMCQ/pdg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791366165;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypYPmAw+J9u3YjmcSyrzqEL+7TZd4vp8blxKMkGccMU=;
	b=ok3u6QKBJ9gvHrzMBCkiac5azYkmuTEjnzSmw1f5NVHCPhVgOGPmX2kdDXPB398cEAoi2v
	/h3RMyVjmQLDx9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CA4113B98;
	Wed,  7 Oct 2026 09:42:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AS17ChUUxmp0FQAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 09:42:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] ALSA: info: Fix memory leak at card removal
Date: Wed,  7 Oct 2026 11:42:28 +0200
Message-ID: <20261007094234.1051316-5-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007094234.1051316-1-tiwai@suse.de>
References: <20261007094234.1051316-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C46AF21EE0
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 

The fix for potential deadlock at disconnection by the commit
c7a606519533 ("ALSA: info: Fix potential deadlock at disconnection")
clears card->proc_root pointer at snd_info_card_disconnect(), in order
just to be sure.  But this leads to a memory leak of card->proc_root
content that should have been released at a later call of
snd_info_card_free().

For addressing the memory leak, simply drop the card->proc_root
clearance at snd_info_card_disconnect().

Fixes: c7a606519533 ("ALSA: info: Fix potential deadlock at disconnection")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261006174002.703431-1-tiwai%40suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/info.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index 3b8ccda04e1a..437dd797e270 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -555,7 +555,6 @@ void snd_info_card_disconnect(struct snd_card *card)
 	if (card->proc_root)
 		snd_info_clear_entries(card->proc_root);
 	card->proc_root_link = NULL;
-	card->proc_root = NULL;
 }
 
 /*
-- 
2.55.0

