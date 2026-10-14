Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D713F8709;
	Wed, 14 Oct 2026 05:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791957528; cv=none; b=n7P4ZPi/KwKGwKyBMrzuhQy1gSRrEeKmHpNWvNdICjl6uKu6IoQp1d5yoYaI5QzD4H1lwdNAMrNzhIg1gtX9oVpj3IG2IL4Gyn4Q/96YRkMb4sW8BYr6vtgJBjCLEkU9IWMS5W/LQtpwSHbznpGnnB2Gz+vUVhBY3IvVvO68M1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791957528; c=relaxed/simple;
	bh=uzHTQVjbzwHgqaA1osuyDJCroFSmKNU7ohDFTfZyIlw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cR+rTglG9pRPyyi77/ZDzarSs5aohqMsb4+ZSVKThOZ8/0Cd/EcjwzRx58FWQPycIyNt73ElFMLaC6wa7vAClvaJjcMrsi82H2GstNBdEObA/96XxfgjqgXxj7BTgnxujaYOA2q4neK41UZgQQ7FlAj/0MOP7lZYUha6UEJNcEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xddBpqK9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ULSbLkkA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xddBpqK9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ULSbLkkA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xddBpqK9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ULSbLkkA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xddBpqK9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ULSbLkkA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 949641F7A9;
	Wed, 14 Oct 2026 05:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791957521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N6vXKrXcoj8QlEciPLB31/VUtQiSrhoFqJmuHorCpk=;
	b=xddBpqK9cP8dBKWBzinZWvrzJvqQ8ulQij5p/HG+NoRT06nh21vfY96G6SJQvfAoW2axER
	yNGvnXaW7/mX43aKoj03gwMdBupFsJ7+Y7Of7Mh705rrLDHql/QZ3zUUern6ldU3YRllPm
	Z4frFrBkHFfH+AYCY/DNWfUVTai+NCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791957521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N6vXKrXcoj8QlEciPLB31/VUtQiSrhoFqJmuHorCpk=;
	b=ULSbLkkAKT1P4lNp+2MoRHCWcelaYwSkJtlWstiqdNNGmzJPMifmawzmljjBp2FjTYtvxP
	a40jNADi/5279YCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xddBpqK9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ULSbLkkA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791957521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N6vXKrXcoj8QlEciPLB31/VUtQiSrhoFqJmuHorCpk=;
	b=xddBpqK9cP8dBKWBzinZWvrzJvqQ8ulQij5p/HG+NoRT06nh21vfY96G6SJQvfAoW2axER
	yNGvnXaW7/mX43aKoj03gwMdBupFsJ7+Y7Of7Mh705rrLDHql/QZ3zUUern6ldU3YRllPm
	Z4frFrBkHFfH+AYCY/DNWfUVTai+NCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791957521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N6vXKrXcoj8QlEciPLB31/VUtQiSrhoFqJmuHorCpk=;
	b=ULSbLkkAKT1P4lNp+2MoRHCWcelaYwSkJtlWstiqdNNGmzJPMifmawzmljjBp2FjTYtvxP
	a40jNADi/5279YCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 465B81368E;
	Wed, 14 Oct 2026 05:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wk0pBxEaz2okFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 05:58:41 +0000
Date: Wed, 14 Oct 2026 07:58:40 +0200
Message-ID: <87ik34g6wf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aayush Kumar <aayushkmx@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker and mic mute LEDs on IdeaPad Pro 5 14IAH10
In-Reply-To: <20261013183742.56071-1-aayushkmx@gmail.com>
References: <20261013183742.56071-1-aayushkmx@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 949641F7A9
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 13 Oct 2026 20:37:42 +0200,
Aayush Kumar wrote:
> 
> The speaker and microphone mute LEDs on the IdeaPad Pro 5 14IAH10
> do not follow the ALSA mute state. This machine has an ALC287 codec
> with SSID 17aa:3914, but shares PCI SSID 17aa:3843 with the Yoga
> Book 9i and currently gets its fixup.
> 
> Add a codec SSID quirk that runs the IdeaPad ACPI LED fixup. Chain
> the existing bass speaker amp fixup so the audio setup is retained.
> 
> Tested on the IdeaPad Pro 5 14IAH10: muting and unmuting the
> headphone sink toggled the physical speaker mute LED. Muting both
> microphone controls changed the ALSA mic LED state from 0 to 1.
> 
> Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index be5482530..44652fc43 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -4285,6 +4285,7 @@ enum {
>  	ALC295_FIXUP_HP_OMEN,
>  	ALC285_FIXUP_HP_SPECTRE_X360,
>  	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
> +	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED,
>  	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
>  	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
>  	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST,
> @@ -6435,6 +6436,12 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
>  	},
> +	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_ideapad_acpi,
> +		.chained = true,
> +		.chain_id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
> +	},
>  	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc_fixup_yoga_pro7_audio,
> @@ -8215,6 +8222,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
>  	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
> +	HDA_CODEC_QUIRK(0x17aa, 0x3914, "Lenovo IdeaPad Pro 5 14IAH10",
> +			ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP_LED),
>  	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
>  	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
>  	 * use codec SSID to distinguish them

Could you give a comment to mention shortly about the conflicting PCI
SSID?

Also, the patch doesn't apply cleanly on top of the latest sound git
tree.  Please try to rebase to for-next branch and resubmit.


thanks,

Takashi
