Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1D3DAAD2;
	Wed,  7 Oct 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393658; cv=none; b=uG7CZiC/psU16uvXU0ZGJ1V7beLYw4RR3cus4KtAGOwvc3VtfOPfy2cwNaWRBlRz49gkcb14g9rwWVasT4lfPtE+Oj4r66qRxiRz5i4Phe36BYbh3J/qh7QRwiM2mq6NSA8U+ziyTLF80qMm1rg9lhaw/5B5tVXN/ok4Adj0wAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393658; c=relaxed/simple;
	bh=YqdcpTJqYZjlmX/P/LKvgMu8wTHnl7Gwap2cRMrTaB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPUQq13wpeM0A33otbqkOBpR9gLIe1eDhVzMFHCtnmsgQG5Kf4aiBUGNtz73yYhXdPqyVKrxkMESP2tHVpKDXimIkl+OOGDpgl7bbJzDsCv3FUjwp2tA3aibSpz1oZ7AMbI/qvke9xSvhu/q5AUyV2YXRze5wX/QFGJy5hnL7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R1FeFqCI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mq/E6POg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R1FeFqCI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mq/E6POg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R1FeFqCI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mq/E6POg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R1FeFqCI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mq/E6POg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD50B1F44F;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=R1FeFqCIjKL/F5S+9boRGY6FOwshVBq89H3yskQQ+kWD9o10WWbYRoOLdRXP6Sgr9nun+h
	DnPwON7G6uT90yooSTtmCiRyhoVLfoLKPnrjUgnbOmfAB6yeiSdUb0lX+9xHBwz4GHG+pw
	v+p7CZHW+tuwKGyzwQxCwGIJTNYPwOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=Mq/E6POgcI1Ok5cnZ+XtaqZm3jjHptzKstbPF2O4qyyZgoTNQ5NSv1zjO03OGL2lyJyqsb
	B3t4z383BYB8QJAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R1FeFqCI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Mq/E6POg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791393655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=R1FeFqCIjKL/F5S+9boRGY6FOwshVBq89H3yskQQ+kWD9o10WWbYRoOLdRXP6Sgr9nun+h
	DnPwON7G6uT90yooSTtmCiRyhoVLfoLKPnrjUgnbOmfAB6yeiSdUb0lX+9xHBwz4GHG+pw
	v+p7CZHW+tuwKGyzwQxCwGIJTNYPwOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791393655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgLxZv35CgS7g0IWTbXthBD3uAd5BPazCxgcizGnc9s=;
	b=Mq/E6POgcI1Ok5cnZ+XtaqZm3jjHptzKstbPF2O4qyyZgoTNQ5NSv1zjO03OGL2lyJyqsb
	B3t4z383BYB8QJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63178139BD;
	Wed,  7 Oct 2026 17:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8rcALXZ/xmp1CgAAD6G6ig:T9
	(envelope-from <tiwai@suse.de>); Wed, 07 Oct 2026 17:20:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] ALSA: core: Add missing barriers for power_ref vs card->shutdown
Date: Wed,  7 Oct 2026 19:20:44 +0200
Message-ID: <20261007172051.13240-9-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007172051.13240-1-tiwai@suse.de>
References: <20261007172051.13240-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: DD50B1F44F

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

