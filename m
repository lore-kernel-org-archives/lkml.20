Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94146A5EB;
	Tue,  6 Oct 2026 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294893; cv=none; b=kEs5C6FbV2/DQoMBiv0NnHmPiG/qOS7dQ5rp6/lQ2bxfBlQLhG4pGsms8CqjzCFOOqyAfrN62Fc8KsUHLvdLL6s1+XdTIwQfBcNl38kgBIQp6A8HQkQGvWDN2PvkAOzkZg+HftdHh2cKUb2CpV4JN/fgfWyPj7sntsGZ418OSj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294893; c=relaxed/simple;
	bh=TQnwdN9d1q5jYloEVajsfHFfWmX1u6LzIrLMMZ4Nnjo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UygOu1qqosG96DQgHfylNgBDeQOaGEz2kafgpVBRTaKw6L7tS7xPRRoVrJmg1vu2mbKvs4DsVaYICh9Il9q2hqHBJ4UJAJ4wolcKxLaE2qC3yZt//Eu07mzFNYFVeIcinqIkY7h6PabiuwnTm1Pkl5BWsFUQ9+vXGp2jHl9UZDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FKUynvVr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dYWyeQnb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UruqtkbI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+mybHUBR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FKUynvVr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dYWyeQnb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UruqtkbI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+mybHUBR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E839A1FB1F;
	Tue,  6 Oct 2026 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0EPHm3CnvPJM0N5fA2ceuxkbs3vgI4e/qOXRCC2Skg=;
	b=FKUynvVrqcRtWoceGk/KzRXtWsM/3rRekQWNQGDmm712NN/ANVgjf0Vn95GrpN29znEUqp
	5xD9+XSbi05lI3wFij+50ITGzneSyth3UxmJQjIdcGTEyoR4HmE6JHl4ZNSXd6i36oMCiQ
	YY+d73aKoozSX5C9C6CRHugMOUnXWzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0EPHm3CnvPJM0N5fA2ceuxkbs3vgI4e/qOXRCC2Skg=;
	b=dYWyeQnbl4Yh0PjuPgO6ilMjCeyQAGl1fGZ4AQYAQb/eccZPzVeFOwaJTXnLl1CTr89EwV
	OlV8kDtRz/GVL6Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UruqtkbI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+mybHUBR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791294879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0EPHm3CnvPJM0N5fA2ceuxkbs3vgI4e/qOXRCC2Skg=;
	b=UruqtkbIoo2/nGtOoAOXKC6zmKd3fQi8y5RS6pUxf0Zcttq/HS8jSGYKS9dXvS4KhzzYGK
	3gV8moh8SewzMvAp0sdH7HypHiR2/mFrtvyAEu1c7kraCjB1ZHDtzXviYbTt/xzCRO7/ky
	9yS37cs1jVNZiUWfEMCUAKUMT29XUTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791294879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0EPHm3CnvPJM0N5fA2ceuxkbs3vgI4e/qOXRCC2Skg=;
	b=+mybHUBREK5rUtJtgHjwoH3aizuuqi481v/BfJKLvOrFkj8ryTeAoAAYOoNbqmAv0g2/5v
	AzrkV1iXIujYxbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF89C1368D;
	Tue,  6 Oct 2026 13:54:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gpLMIZ/9xGqqAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Oct 2026 13:54:39 +0000
Date: Tue, 06 Oct 2026 15:54:39 +0200
Message-ID: <87mrsrorxc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Devin Christensen <dchristensen8@proton.me>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support
In-Reply-To: <20261005141244.2130023-1-dchristensen8@proton.me>
References: <20261005141244.2130023-1-dchristensen8@proton.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,sashiko.dev:url];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E839A1FB1F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 05 Oct 2026 16:13:12 +0200,
Devin Christensen wrote:
> 
> The Sound BlasterX AE-5 and AE-5 Plus expose a 3-pin 5V addressable RGB
> header driven directly by the CA0113 PCIe-to-HD-Audio bridge. Rather
> than using the CA0132 DSP or MMIO GPIO, the CA0113 contains an
> autonomous HDA link sniffer that snoops a designated HDA DMA playback
> stream, extracts the 24-bit GRB color payload, and serializes it as
> 800 kHz single-wire NRZ pulses to the strip (WS2812B protocol).
> 
> Expose the strip through volatile card control elements:
> 
>   "AE-5 LED Strip"        (RW, BYTES): 300-byte RGB payload representing
>                           up to 100 addressable LEDs (3 bytes per LED).
>   "AE-5 LED Strip Count"  (RW, INTEGER): Active LED count (1..100).
> 
> The controls are marked with IFACE_CARD and SNDRV_CTL_ELEM_ACCESS_VOLATILE
> so changes do not trigger unnecessary audio daemon wakeups or state
> restoration by alsactl.
> 
> Writes allocate an idle HDA playback stream, format a 32 KB DMA buffer
> populated with repeating WS2812 frames (preamble, audio words per LED,
> and reset gap), configure the CA0113 BAR2 serializers and stream-tag
> pin mux, and pulse the stream long enough for the reset latch to fire.
> Access is serialized with a per-spec mutex, and the controls are only
> registered on QUIRK_AE5 devices.
> 
> The strip transport uses snd_hdac_dsp_prepare() / snd_hdac_dsp_cleanup(),
> which require CONFIG_SND_HDA_DSP_LOADER. All strip-related code and struct
> fields are conditionally compiled under
> IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER), with a no-op stub for
> ae5_add_strip_controls() when disabled.
> 
> Signed-off-by: Devin Christensen <dchristensen8@proton.me>

Now you got a few interesting points spotted by Sashiko review.
  https://sashiko.dev/#/patchset/20261005141244.2130023-1-dchristensen8%40proton.me

Could you take a look?


thanks,

Takashi
