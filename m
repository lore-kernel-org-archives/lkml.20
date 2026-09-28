Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D48949F10E;
	Mon, 28 Sep 2026 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594032; cv=none; b=pj7ahTMic29MOK+n7WtuBss3cZHuMAGRAbc6XchsM/YlyxB1XcnzaueOGRmm0gcljSgY9v/SAs/yi++lAU6z6ajc6+SB/h9D3vrClfywxH/MRHRoWfM+XyAYrWHLnUV7O7Q2kqT295m9M0MIDM6ouQr0dnWxnVrBFbvLikiHJqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594032; c=relaxed/simple;
	bh=aRJ7x/TcmWKbQT5nksVCBDhM/dTCDl59fx8W9AKmdOo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1ENO7tDTnszl3zQxgp3t6r+Xi+DQAqjTFFJUfbFPuS1drcWCYxGVLljmipRj5l3x/y39TdMAAzYxT/MAfQfxl8b85zhj7hINg6xebC1th8GaNZJ0hnvWOCasE/h/kLzCJaZBJ7k0cN/G+TDAJBwrvjfFL/Ux4KwHEYiugdpF6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CYa6HhFm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G5ivVhAb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IDTg2gwj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2aSrRK7S; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CYa6HhFm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G5ivVhAb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IDTg2gwj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2aSrRK7S"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E01D71FB9C;
	Mon, 28 Sep 2026 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790594025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o1EOHeN74X16VIeb+VlWrCUHYQbIVvI9Iu6E5ixfWdM=;
	b=CYa6HhFmWd2jPBdr10cWG8kLvoH50e7BdxTeg7oFP/zJtnbMpBCV9KLyOUQ6A3d+Vc4sJS
	sYG0+i3mNNGnIPuj5cnYjIQI4gOzOWld/la5tYBgTuoBiNVpACGeXC3hmkajcRlVnI3Qv2
	ge1c6qmCAPeP+vUuNFpvbqpG8VgE8Vk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790594025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o1EOHeN74X16VIeb+VlWrCUHYQbIVvI9Iu6E5ixfWdM=;
	b=G5ivVhAbuiTiQ6vF4/LcM/KabbuLjoS8rFK7qHwotP3qplkanSZslD5x2od2zIZm8FeZ6T
	z/1c8ssx+aQeFsDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IDTg2gwj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2aSrRK7S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790594020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o1EOHeN74X16VIeb+VlWrCUHYQbIVvI9Iu6E5ixfWdM=;
	b=IDTg2gwj6YJtx6/tM/2eFSIYYHWg4zVo11MaiTh1ReO8Lpgy+OAa6nutAWcgWahF962rxq
	RV62uErRXITrFxegYhXEMUJXraKBF3lYr+/fcLFAl2hp5EPH/F6CGaaMjOFrsT6RwvDEpu
	FAs2DW0LLPbEeTIQXPomqbUvshc3xCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790594020;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o1EOHeN74X16VIeb+VlWrCUHYQbIVvI9Iu6E5ixfWdM=;
	b=2aSrRK7StTJjutIn2Hr7MmJAyhi90sncOhNMXNZ/cmFRDy68WYG4ciMEWFBs1W9GOZCY/W
	GHxX98n5aknyFdAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 918DE133F1;
	Mon, 28 Sep 2026 11:13:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N+NBGuRLumrfLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:13:40 +0000
Date: Mon, 28 Sep 2026 13:13:40 +0200
Message-ID: <875wzp7hnf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matt Barr <matthewjaybarr@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Drop Yoga Pro 9 16IAH10 PCI SSID quirk
In-Reply-To: <20260921214812.22139-1-matthewjaybarr@gmail.com>
References: <20260921024011.2115055-1-matthewjaybarr@gmail.com>
	<20260921214812.22139-1-matthewjaybarr@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E01D71FB9C
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 21 Sep 2026 23:48:12 +0200,
Matt Barr wrote:
> 
> The PCI SSID quirk added for the Lenovo Yoga Pro 9 16IAH10 (PCI SSID
> 17aa:3846, codec SSID 17aa:3920) also matches every other machine that
> shares PCI SSID 17aa:3846. snd_hda_pick_fixup() tries all PCI SSID entries
> before it falls back to the codec SSID, so those machines now get
> ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1 and never reach their own
> codec-SSID quirk.
> 
> The Lenovo Legion Pro 7 16IRX8H (product 82WQ) is one such machine: PCI
> SSID 17aa:3846, codec SSID 17aa:3884. Before this quirk it picked
> ALC287_FIXUP_TAS2781_I2C via the 17aa:3884 codec SSID fallback and bound
> its TAS2781 amplifier. With it, the codec never binds the amplifier and
> the internal speakers are silent:
> 
>   snd_hda_codec_alc269 hdaudioC0D0: ALC287: picked fixup  for PCI SSID 17aa:3846
> 
> versus, on a kernel without the quirk:
> 
>   snd_hda_codec_alc269 hdaudioC0D0: ALC287: picked fixup  for codec SSID 17aa:3884
>   snd_hda_codec_alc269 hdaudioC0D0: bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops ...)
> 
> Drop the PCI SSID entry. The Yoga Pro 9 16IAH10 has the same amplifier as
> the Yoga S990-16 (codec SSID 17aa:3920), so it still gets a fixup through
> the codec SSID fallback, using the existing 17aa:3920 entry. Switch that
> entry from ALC287_FIXUP_TXNW2781_I2C to ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
> which applies the DAC routing fix and then chains to
> ALC287_FIXUP_TXNW2781_I2C, so the amplifier setup is unchanged.
> 
> Fixes: 41d60cbfde10 ("ALSA: hda/realtek: Fix bass speaker DAC routing for Lenovo Yoga Pro 9 16IAH10")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220540
> Suggested-by: Zhang Heng <zhangheng@kylinos.cn>
> Signed-off-by: Matt Barr <matthewjaybarr@gmail.com>
> ---
> Hi Zhang,
> 
> Thank you for the quick review. Your suggestion is cleaner than my
> version, so this v2 uses it. I checked that the 17aa:3920 entry keeps its
> amplifier setup, since the new fixup chains into ALC287_FIXUP_TXNW2781_I2C.
> 
> v2: Reuse the existing 17aa:3920 entry instead of adding a codec SSID
>     entry, as suggested by Zhang Heng. Built against 7.2.5 and tested on
>     a Legion Pro 7 16IRX8H without the model= workaround: the codec picks
>     the 17aa:3884 quirk again, binds i2c-TIAS2781:00, and the speakers
>     work. Not tested on a Yoga Pro 9 16IAH10 (no hardware).

Applied now.  Thanks.


Takashi
