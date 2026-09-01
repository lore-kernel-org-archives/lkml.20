Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F8F38F926;
	Tue,  1 Sep 2026 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264464; cv=none; b=oPG02jVjnj+lwSXeGd0J7jTHZGdoJUhabUPQG0xWJxcmshJsxuiL1xavyZ9NlK8gmJdtjsr1/PHCqDnAhV1N5843SrO/L9SWF91d9rPoJ03KZT93losrW7/IRW7yOsAukyY+lISNDjCu5Rkw5+XMuLnHcK+B7RmVBStwVxBkSrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264464; c=relaxed/simple;
	bh=xS0p7eMGg8FbKTE8HSzHffCSILcS34d+HUQe7mmWxa0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEQqs8TTcBJYn6B3FTfKgqXATmSHMrE0C2cFo/UU51+AORxpSuDVoVo+Jyv9GYvIKNKIQEk4kaGnLSQVRptBXGkI80NHouyKNUd6ulR+8eYweMY+6MrRhTQqNq9awGT0APUD+ye7fW+/6He1WEasn5vkH9i4nD4rpQXvksu/czc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eqkOw8rL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CR1LTNve; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kiE3mv24; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EyWKZMjW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eqkOw8rL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CR1LTNve";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kiE3mv24";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EyWKZMjW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E62681FCE4;
	Tue,  1 Sep 2026 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788264456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TuzsBV1zRn+YRKNKFMpDJCUI0dP2J7UENxLZObRDc+w=;
	b=eqkOw8rLJjetpSAraZ6CwIeTZt3zEBLgfmbIPbHKcuZHMoET4X3SYk9606IrFpGVfJAgp/
	8OzNcQpqB22V11ltMS7FStzGtcZsSbdqMZda0pIXA7QTwU0ERm67KCJXViPETOAWwZxAIt
	XeIDP54CFe+68Rf90oK1l5mTOhAolBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788264456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TuzsBV1zRn+YRKNKFMpDJCUI0dP2J7UENxLZObRDc+w=;
	b=CR1LTNveVlo+6JX/SBEK6H8fQE+djTLJcKsj/G8BwWitPDxNL9SOLLwP4OxP2xIceOU3Iu
	Ws+To2f2A2WggpBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kiE3mv24;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EyWKZMjW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788264451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TuzsBV1zRn+YRKNKFMpDJCUI0dP2J7UENxLZObRDc+w=;
	b=kiE3mv24ufHZ1ZhT4MeqYt8jzc8h59A1ylUpPX5YXMT0YLCNsi5B/PXNfFl+CyR8QkJfpw
	7FazUWFoETlt/Uw+YOHDwOlaAdR9qEhCtaG16UNDvAe51qxaW6OIi6KACbkbiPMZL1ItH0
	yxvGtlzEq0s4w3ubVYR9YOMY9e8f8As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788264451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TuzsBV1zRn+YRKNKFMpDJCUI0dP2J7UENxLZObRDc+w=;
	b=EyWKZMjW0hoAbcG5IHX66HtY/++Wyhzkc9GK6LPHdCmvWUIFfN6Xzo6ySfEIuP6i6cA97H
	wUVmYmBy8o0P0YBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92667136B2;
	Tue,  1 Sep 2026 12:07:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mPgjIwPAlmp3YgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 12:07:31 +0000
Date: Tue, 01 Sep 2026 14:07:27 +0200
Message-ID: <87o6ehcgzk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: casey@samaritansolutions.net,
	Casey Tunturi via B4 Relay <devnull+casey.samaritansolutions.net@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: reset link for HP ENVY 27-p014
In-Reply-To: <20260828-hp-envy-27-hda-reset-v1-1-0da50c215148@samaritansolutions.net>
References: <20260828-hp-envy-27-hda-reset-v1-1-0da50c215148@samaritansolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: E62681FCE4
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[casey.samaritansolutions.net];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-info.sh:url,samaritansolutions.net:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Fri, 28 Aug 2026 22:29:28 +0200,
Casey Tunturi via B4 Relay wrote:
> 
> From: Casey Tunturi <casey@samaritansolutions.net>
> 
> While bringing up audio on an HP ENVY 27-p014, I found that the normal
> link reset only discovers the HDMI codec. The CX20753/4 at address 0
> appears after a second CRST pulse, with STATESTS left alone and no fixed
> delays.
> 
> I added that pulse when address 0 is missing, and again before the codecs
> resume. Initial setup uses immediate commands long enough to add the
> codec, then returns the controller to CORB/RIRB.
> 
> That brought analog audio up at boot, and capture kept working through
> four deep suspend and resume cycles.
> 
> Signed-off-by: Casey Tunturi <casey@samaritansolutions.net>

Thanks for the patch.  But I must say that it's very hackish, and
we should reconsider to make the changes a bit more generic or
cleaner.

But, first off, could you give more details about your hardware?
At best, give alsa-info.sh output (run with --no-upload option and
attach the output).

Now more about the code change:

> +static u16 hp_envy_27_reset_link(struct azx *chip)
> +{
> +	struct hdac_bus *bus = azx_bus(chip);
> +	u32 gctl;
> +	u16 statests;
> +	int timeout;
> +
> +	snd_hdac_bus_stop_chip(bus);
> +
> +	gctl = snd_hdac_chip_readl(bus, GCTL);
> +	snd_hdac_chip_writel(bus, GCTL, gctl & ~AZX_GCTL_RESET);
> +	for (timeout = 250; timeout; timeout--) {
> +		if (!(snd_hdac_chip_readl(bus, GCTL) & AZX_GCTL_RESET))
> +			break;
> +		udelay(1);
> +	}
> +
> +	gctl = snd_hdac_chip_readl(bus, GCTL);
> +	snd_hdac_chip_writel(bus, GCTL, gctl | AZX_GCTL_RESET);
> +	for (timeout = 250; timeout; timeout--) {
> +		if (snd_hdac_chip_readl(bus, GCTL) & AZX_GCTL_RESET)
> +			break;
> +		udelay(1);
> +	}
> +
> +	statests = snd_hdac_chip_readw(bus, STATESTS);
> +	bus->codec_mask |= statests;
> +	snd_hdac_bus_init_chip(bus, false);
> +
> +	return statests;

Can't the standard snd_hdac_bus_reset_link() work?  If not, we may
tweak there in the standard code instead of open-code here.

>  static void __azx_runtime_resume(struct azx *chip)
>  {
>  	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
> @@ -1003,6 +1043,8 @@ static void __azx_runtime_resume(struct azx *chip)
>  
>  	azx_init_pci(chip);
>  	hda_intel_init_chip(chip, true);
> +	if (chip->pm_prepared && hp_envy_27_needs_reset(chip))
> +		hp_envy_27_reset_link(chip);

So you need a bus reset always at each S3/S4 resume?
Or could this be conditional?

> +static int hp_envy_27_probe_codec(struct azx *chip)
> +{
> +	struct hdac_bus *bus = azx_bus(chip);
> +	struct hda_codec *codec = NULL;
> +	bool use_pio;
> +	int probe_mask;
> +	int err;
> +
> +	if (!hp_envy_27_needs_reset(chip) || (bus->codec_mask & BIT(0)))
> +		return 0;
> +	if (!(hp_envy_27_reset_link(chip) & BIT(0)))
> +		return -ENODEV;

Trying the bus reset at probe is understandable, but...

> +	probe_mask = chip->codec_probe_mask;
> +	use_pio = bus->use_pio_for_commands;
> +	chip->codec_probe_mask = BIT(0);
> +	bus->use_pio_for_commands = true;
> +	err = snd_hda_codec_new(&chip->bus, chip->card, 0, &codec);
> +	chip->codec_probe_mask = probe_mask;
> +	if (!err && codec)
> +		err = snd_hda_codec_configure(codec);
> +	else if (!err)
> +		err = -ENODEV;
> +	bus->use_pio_for_commands = use_pio;

... those look too ugly.  The use of PIO mode isn't mentioned in the
description, either.  Maybe PIO mode should be used always for your
board?

> @@ -2444,6 +2519,8 @@ static int azx_probe_continue(struct azx *chip)
>  		pm_runtime_allow(&pci->dev);
>  		pm_runtime_put_autosuspend(&pci->dev);
>  	}
> +	if (hp_envy_27_needs_reset(chip))
> +		pm_runtime_forbid(&pci->dev);

Add to power_save_denylist, instead.


thanks,

Takashi
