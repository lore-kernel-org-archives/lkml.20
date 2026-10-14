Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F61314A98;
	Wed, 14 Oct 2026 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969823; cv=none; b=tLpo2JVzhOqfikGEdMtRZkHEky2HNoR832l1GX1T02In3Rom95kZj5WCyw6EOFnGaaq1yssznpZo7Slco0e/8z1HAO2XT2npDRsnzBq9k1+FiGkJLn5IudzhI7Stby3UmtB2UxHmV7LbuUjMTCiVu/8xeprNtE1Iu4gevF/YO8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969823; c=relaxed/simple;
	bh=RKJYCUNfQkdHhg9j/IYsMFPuert6ncgeEzqPIvnKk+0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rf7rX7dCjJqgpeJ+Iq7Ic58H1NU30l1+fF1nYaD773uWfY7RYZcb3GQucVkGJIkhglSn1aVzNEbX8O9+A/md009p8WOprtALEkMbIiEahSstsddxkneGGjgYoxcN1C0MVTHfGPsknZ7NLD9QBKAcx8Y+iPFWFkWIAgR5MuQfHwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N0sFtIwW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F6A49gG2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N0sFtIwW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F6A49gG2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N0sFtIwW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F6A49gG2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N0sFtIwW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F6A49gG2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73A8C221B5;
	Wed, 14 Oct 2026 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791969820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7lgXXH6tUZK7csw9p8EwVpbEyz3RC4PRS8XP6H+IJU=;
	b=N0sFtIwW2EVlvy6zH0p6QrWNAILSF+bDpJc7095ox8JqmImbAvbJyg8BDxbirrVuLkdUR+
	PU5z+6uOwA8vN68fk6qIlzZVGynV7o6mSpwbLjMMRaFTeGWNdBCUiLuhTsK/ZX+WbPs508
	vZdtOwpwFBgKp9fzcFY4kRILOgwY2mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791969820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7lgXXH6tUZK7csw9p8EwVpbEyz3RC4PRS8XP6H+IJU=;
	b=F6A49gG2VyEEJAIC2iIFGuxySEMN54OrL5Is7J86399SWStIs1Fa3KRbb+bGEATWK9itNS
	Ig88b+Ijpn1PtMDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N0sFtIwW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=F6A49gG2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791969820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7lgXXH6tUZK7csw9p8EwVpbEyz3RC4PRS8XP6H+IJU=;
	b=N0sFtIwW2EVlvy6zH0p6QrWNAILSF+bDpJc7095ox8JqmImbAvbJyg8BDxbirrVuLkdUR+
	PU5z+6uOwA8vN68fk6qIlzZVGynV7o6mSpwbLjMMRaFTeGWNdBCUiLuhTsK/ZX+WbPs508
	vZdtOwpwFBgKp9fzcFY4kRILOgwY2mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791969820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7lgXXH6tUZK7csw9p8EwVpbEyz3RC4PRS8XP6H+IJU=;
	b=F6A49gG2VyEEJAIC2iIFGuxySEMN54OrL5Is7J86399SWStIs1Fa3KRbb+bGEATWK9itNS
	Ig88b+Ijpn1PtMDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 240E3133F1;
	Wed, 14 Oct 2026 09:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SDtOOhtKz2pDKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 09:23:40 +0000
Date: Wed, 14 Oct 2026 11:23:39 +0200
Message-ID: <87qzhseiuc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Marco Giunta <marco_giunta@outlook.it>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P AFR10
In-Reply-To: <87qzhyj8b7.wl-tiwai@suse.de>
References: <SN6PR19MB2303D726352EEE508A70D6D4FC922@SN6PR19MB2303.namprd19.prod.outlook.com>
	<87qzhyj8b7.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 73A8C221B5
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[outlook.it];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[outlook.it,suse.com,perex.cz,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 10 Oct 2026 09:58:36 +0200,
Takashi Iwai wrote:
> 
> On Fri, 09 Oct 2026 17:58:10 +0200,
> Marco Giunta wrote:
> > 
> > Add codec SSID entries for the Lenovo Legion R9000P AFR10 (83F6),
> > which uses the same ALC287 + AW88399 smart amplifier configuration
> > as the existing supported Legion models.
> > 
> > DSDT inspection confirms identical AWDZ8399 ACPI device layout
> > with reversed I2C addresses. The channel swap quirk applies.
> > 
> > Codec SSIDs (Lenovo vendor ID 0x17aa):
> > 
> > * 0x3934: Legion R9000P AFR10 (AMD)
> > * 0x3935: Legion R9000P AFR10 (AMD)
> > 
> > Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
> > ---
> > Note: this patch depends on the following commits, which are currently in
> > linux-next but not yet in tiwai/sound:
> > 
> > * commit 664824782df6 ("ASoC: aw88399: skip BSTS check when boost
> >   converter is bypassed")
> > * commit c5f615536405 ("ASoC: aw88399: remove bsts_unreliable
> >   workaround")
> > * commit 7df0f9ee9c5a ("ALSA: hda: aw88399: Switch to use
> >   acpi_bus_get_primary_device()")
> >   
> > The first two change the property table in aw88399_hda.c, simplifying
> > aw88399_apply_legion_quirks() to just aw88399_swap_channels(); the third
> > shifts by one the line count in aw88399_hda_acpi_probe().
> > Without these commits, this patch will not apply cleanly. Hence, for
> > simplicity, I based it on linux-next. I am happy to rebase on tiwai/sound
> > if preferred (after these changes are merged).
> 
> OK, so this obviously needs ASoC PR at first.
> Mark, could you send the stuff for pre-7.4?

Mark, any chance to get this?


thanks,

Takashi
