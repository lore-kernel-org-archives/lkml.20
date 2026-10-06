Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749845D92B;
	Tue,  6 Oct 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294063; cv=none; b=HGOxU4SSd/uXdUIpSFzBjbsTswi+FF9DlE30W9d0AiArgp64+b8gsRhFt7Navi5GrPOOijZShAdqhb68bITyHGp8igN/1JyoERA0BxiGGBgGCfgo0kYDPY1u/TqsXS5m5s+GYauaNU5bZ4YNdZBu8gyunEntZ9Y7gGhzC/aHug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294063; c=relaxed/simple;
	bh=YqdcpTJqYZjlmX/P/LKvgMu8wTHnl7Gwap2cRMrTaB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=In7Bqj/NUjjRWXMx543DuFBrV7if3KUxQvPGPfN9ycFuEjAfKyoFSuE1gqbfQYpOMJy7RLobVlUZk7/tQ6jRp017+b+ORkhEUDVbXaVSwey2Qze2eRCyO+k4zbVkCc7eEVLL/3vOOgJnOGxDAVcF+6TrHumNIf26EiCaVbtoYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L6s4lT4T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4ITnyoYa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NxW6N49J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uuhWUzrD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L6s4lT4T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4ITnyoYa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NxW6N49J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uuhWUzrD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E5391FA83;
	Tue,  6 Oct 2026 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=L6s4lT4TaSpHf4Di2bYH6S8N9FHyWY5gf+pV9pvjn8EgpMg/qGPgt9tN4vKSLVihTNvB46
	btvh9RFNHnflNpgIuF8C+bHRAeJ0jrSvr3NiCemO5XgHOUBg7f5TIeTNeC+HHOGSXlRRz4
	jYPc1nlKa+pnNRiyRbu6dfBe6OgLx/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=4ITnyoYaXpb5LMzqTE9XYDKIIB5+v3ofmV+W2ZTQdKGZaJnpADlqLSKfgNk7EE6b4HPsAa
	kdIJkYx1e9NvqJAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=NxW6N49J5/2M/tsZ6IgZD2DiuQmf+eR2XyHpbG0PckZWbXlKHut88N4bmRYLFqeXhLfi4K
	SQUKG86+iQixr9krcbQRR9HW+YMshQIwK1nOiE2k/e+d5prZ8nLNA9J5hGFgGVpNceNUn1
	x5stJ87revc4TNr1L+jYa5VS52PVZl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=uuhWUzrDtygN9NJhuV4igclJTAvUbzLeou61UBr0CisIBuZxM4xlo5mo2pnSKsLjv4fSSC
	GXRUeUAtBA36KTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2EDD13A63;
	Tue,  6 Oct 2026 13:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1eVrAVf6xGq1cAAAD6G6ig:T9
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:40:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] ALSA: core: Add missing barriers for power_ref vs card->shutdown
Date: Tue,  6 Oct 2026 15:40:32 +0200
Message-ID: <20261006134035.478529-9-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006134035.478529-1-tiwai@suse.de>
References: <20261006134035.478529-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.994];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
X-Spam-Score: -2.79
X-Spam-Level: 
X-Spam-Flag: NO

snd_power_ref_and_wait() increments card->power_ref and then reads
card->shutdown (and the power state) locklessly, while
snd_card_disconnect() sets card->shutdown and then waits for
power_ref to drop to zero via snd_power_sync_ref().  Due to the
missing barrier on both sides, the caller proceeds with shutdown still
seen as false, while the disconnect side sees a zero refcount and
continues tearing down incorrectly.

For addressing the potential race, add smp_mb__after_atomic() after
the refcount increment and smp_mb() before snd_power_sync_ref() in
snd_card_disconnect().

Fixes: e94fdbd7b25d ("ALSA: control: Track in-flight control read/write/tlv accesses")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Assisted-by: LLM
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index 7878c0e6103c..dbe2acfa59fe 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -535,6 +535,8 @@ void snd_card_disconnect(struct snd_card *card)
 		clear_bit(card->number, snd_cards_lock);
 	}
 
+	/* order card->shutdown store against power_ref read */
+	smp_mb();
 	snd_power_sync_ref(card);
 }
 EXPORT_SYMBOL(snd_card_disconnect);
@@ -1152,6 +1154,8 @@ EXPORT_SYMBOL(snd_card_file_remove);
 int snd_power_ref_and_wait(struct snd_card *card)
 {
 	snd_power_ref(card);
+	/* order power_ref increment against card->shutdown read */
+	smp_mb__after_atomic();
 	if (snd_power_get_state(card) != SNDRV_CTL_POWER_D0) {
 		wait_event_cmd(card->power_sleep,
 			       card->shutdown ||
-- 
2.55.0

