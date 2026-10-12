Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A96438466;
	Mon, 12 Oct 2026 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789581; cv=none; b=rkE3Yq8mq1mxSaXVoLe4rlbmkWz08/Fz0OkHRf+LhPEJKE+YT4QyTDiTRqxCXax/qUj1WFoc/uNTyxEHojp82NzSz+W7UUIh487m8QJyloy+jzUOUY6a7G5GXGAL3lPl8HbTDgwMCG7K6CsYQ6QrmzZqCQ0TX1zZC/Hc4/VzC8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789581; c=relaxed/simple;
	bh=DZsGIg/YsTnn0HKbxqZEV4EBW4SIpgoPgX/wROia3Fc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a63LiGTdNALgpWGXQZuAkNccDgp4hFBKMnLtS7AnOtv08xjvQocszvOyREqddTvuHTOPLYImpWBfQnEMXAMpNoTEm3UrRYspmgMOICPRGO4/53A+Vgu67/sUu4eJ5Y4CIgTcMs2W087cJTXNSxaE8YutBE9YiRKVoq+NlVCw52E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iFCwEF+7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C62EHKC5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0xcU9VA4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gElOyhvT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iFCwEF+7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C62EHKC5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0xcU9VA4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gElOyhvT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E5E521E71;
	Mon, 12 Oct 2026 07:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791789578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3akLmu2xKWew8xd8yRo/G5kfBqiAor6R9A+Ogqs3SN8=;
	b=iFCwEF+7/beBVHiiyP6b17ZeLxrG0iiuFs/M10AKlvboY53w/TfdVNV5W2kfyG6fHgIO9/
	C2kmMT0ChvOCG2ZLtl5urUCBj0bj+sbXv0VkqrkAiB4n60B485JANtXaQHIlwOfnusud47
	CEYW6yS2czwFFneK9uUvYCwhiX3P308=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791789578;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3akLmu2xKWew8xd8yRo/G5kfBqiAor6R9A+Ogqs3SN8=;
	b=C62EHKC5yCIvFfmPq+Bh1vibctAXbCauXl4vvUYEcY+bOfaU0ms67DbZAf+4v8+5avojC/
	Fg0pz0oCZWc7NTAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0xcU9VA4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gElOyhvT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791789577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3akLmu2xKWew8xd8yRo/G5kfBqiAor6R9A+Ogqs3SN8=;
	b=0xcU9VA4Dj8LlqPT1XYQot30/Plqarejb2geppZoI1GeU3Jsh7Tss/1JS8T7GMkCkb8Sgh
	KpCf/9qNOj2/gt6mac/OQMd+e7+cRTvrfzGenX0qKAp6WK8A7gge7f936IfMt/MIaiTPsn
	DMeZGpJfSLOkrb870v1rg1OCTmcWmLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791789577;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3akLmu2xKWew8xd8yRo/G5kfBqiAor6R9A+Ogqs3SN8=;
	b=gElOyhvTe7yL9OEOuKlqNmkRqft1uVT3dEEyBj2afR7vZf+Wuj4jsD1D4rlyWThh987E7G
	vOMxVsrhxBtGfbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E433F13408;
	Mon, 12 Oct 2026 07:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ld0rLgiKzGqFVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 07:19:36 +0000
Date: Mon, 12 Oct 2026 09:19:36 +0200
Message-ID: <875wz7idx3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: hda: intel: Don't free card in the probe work
In-Reply-To: <20261011200648.1662935-1-aliamemis@disroot.org>
References: <20261011200648.1662935-1-aliamemis@disroot.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3E5E521E71
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[40b06a86af225236fdb4];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,syzkaller.appspot.com:url,probe_work.work:url,disroot.org:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Sun, 11 Oct 2026 22:06:27 +0200,
Ali Ahmet Memiº wrote:
> 
> If the delayed probe fails, azx_probe_work() frees the card and clears
> the drvdata. azx_remove() reads the card before it waits for the probe
> work with cancel_delayed_work_sync() so when the device is removed while
> the probe work is running, it frees the card again after the work has
> already freed it.
> 
> Leave the card to azx_remove() and only mark the probe as failed in the
> work as is done in the vga_switcheroo path.
> 
> Fixes: 39173303c838 ("ALSA: hda: Free card instance properly at probe errors")
> Reported-by: syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=40b06a86af225236fdb4
> Signed-off-by: Ali Ahmet Memiº <aliamemis@disroot.org>

I believe this may change the behavior visible on user-space, and it's
not what we want.

For avoiding the card free, can it be the refcounting like below
instead?


thanks,

Takashi

--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1737,7 +1737,11 @@ static void azx_check_snoop_available(struct azx *chip)
 static void azx_probe_work(struct work_struct *work)
 {
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
+	struct snd_card *card = hda->core.card;
+
+	get_device(&card->card_dev);
 	azx_probe_continue(&hda->chip, true);
+	put_device(&card->card_dev);
 }
 
 static int default_bdl_pos_adj(struct azx *chip)
