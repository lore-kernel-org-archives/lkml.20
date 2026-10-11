Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7A2FABFB;
	Sun, 11 Oct 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708642; cv=none; b=aQFWvzcS1Kw2Ikb7afvRaRIH7wuV4gjEWnHUyitJ9xk7WnLfiSO03CFb1+XermBFWF7JPUr2UyuzY0xDEEZ0Pmd/lu+Qynd1QI0RGxowAHDhMlP0OeMovuK/BNbBYKZUh76dhlKnID9TgykrzGhw5CyOZuSEn0AR7urZXOgf/Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708642; c=relaxed/simple;
	bh=ZGj0xPJukrRHSpXGnJ0vaz819V2VNvt3b1zuZ0wtFNg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E64y1Wjutr0FJX3YeA+N5fFXvJD8F9pbP6WA5Nxo7qD/sppxpjcWvMXbFddmpZJODMvIrX1EBPEy+z6ts8fNlJ5VVvp0nwX5y/mQ2JqEOTQQ5cCIHlTVRLVHKwIqkDnJ46vHmlh8ztvSjjkoO9G4cUgNgGeHWJrsNlGJBSv/iqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wsa/R3Qb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mB/JjmBq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wsa/R3Qb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mB/JjmBq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wsa/R3Qb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mB/JjmBq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wsa/R3Qb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mB/JjmBq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 872521F7A5;
	Sun, 11 Oct 2026 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791708639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckEEjk5SCcouA2hL7mCK+PwAE/AY0VucOLXpfw3sk/Q=;
	b=wsa/R3QbmTPI96KZUnI3H5gSgaAo26dJE3UIyHh7uiPt+ZeNC9SVICD8an870xRH/VYsOR
	aDcen+gWhd41Ep7idRRF/KcK5UEwRX+clIutlywcDfY5gq6K/WuK+rHk6L2j5k5w/fTC/L
	anC8HvPNZcubv77/eCV1pAAQxxuYyYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791708639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckEEjk5SCcouA2hL7mCK+PwAE/AY0VucOLXpfw3sk/Q=;
	b=mB/JjmBqVD22urhn7tctZ3ryDn4ZSALwM6dQPfE6yc7fD1jW0V/NTh8ATwSP5mZiwOgetF
	89kT2Hz0Atoc4bBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="wsa/R3Qb";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="mB/JjmBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791708639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckEEjk5SCcouA2hL7mCK+PwAE/AY0VucOLXpfw3sk/Q=;
	b=wsa/R3QbmTPI96KZUnI3H5gSgaAo26dJE3UIyHh7uiPt+ZeNC9SVICD8an870xRH/VYsOR
	aDcen+gWhd41Ep7idRRF/KcK5UEwRX+clIutlywcDfY5gq6K/WuK+rHk6L2j5k5w/fTC/L
	anC8HvPNZcubv77/eCV1pAAQxxuYyYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791708639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckEEjk5SCcouA2hL7mCK+PwAE/AY0VucOLXpfw3sk/Q=;
	b=mB/JjmBqVD22urhn7tctZ3ryDn4ZSALwM6dQPfE6yc7fD1jW0V/NTh8ATwSP5mZiwOgetF
	89kT2Hz0Atoc4bBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B92513408;
	Sun, 11 Oct 2026 08:50:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yRphAt9Ny2qyEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 11 Oct 2026 08:50:39 +0000
Date: Sun, 11 Oct 2026 10:50:38 +0200
Message-ID: <87ik38ipsx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maksim Krasutski <krasutskimaksim@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute LEDs on HP ENVY 17-cr1xxx
In-Reply-To: <20261010185335.30949-1-krasutskimaksim@gmail.com>
References: <20261010185335.30949-1-krasutskimaksim@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 872521F7A5
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 10 Oct 2026 20:53:35 +0200,
Maksim Krasutski wrote:
> 
> The HP ENVY Laptop 17-cr1xxx with subsystem ID 103c:8be8 uses an
> ALC245 codec and two CS35L41 I2C speaker amplifiers. Its existing
> quirk configures the amplifiers but does not enable the speaker
> and microphone mute LED handlers.
> 
> Select ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS to retain the
> amplifier setup and enable both mute indicators.
> 
> The equivalent change was tested on an HP ENVY 17-cr1xxx running
> Kubuntu 26.04.1 with kernel 7.0.0-38-generic. Both keyboard mute
> indicators were confirmed working.
> 
> Fixes: aa8e3ef4fe53 ("ALSA: hda/realtek: Add quirks for various HP ENVY models")
> Assisted-by: LLM
> Signed-off-by: Maksim Krasutski <krasutskimaksim@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
