Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E23DA7E0;
	Tue, 13 Oct 2026 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874996; cv=none; b=nw8nVZ8r1QwA/TAXFnnxqxhXpmh0NwcTOgwETyvVIyWKMYD4R6AMdgRgnekH7R9LHYXh548luEYl7jqItw7S7yUomV77j64Ta+os6FiFCl/2aDO59gx2ZJMctxPveaLwLXj6nEK7EWy/CBotRYMzsM/9gSKPJ0a82yAxRRBVGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874996; c=relaxed/simple;
	bh=5wwJZ0vZK8hd+uIiter0JTWn8aNjRjc46wLa5gabDI4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fe22QAOwUCueB+byJXPn1R9bR2Nedl7++DVl3wA2BPvIb1Em/k2EsdD3m9bSd6yXVxCvbtjuZ65KlQefa06qU87b+hQPYwsTcKsDP0vFBnT3aVTH47DlA3X65IT+dU1NWnoMaSCjsfcjPT/J7nbjSZSGH9rpbEZ2QAMBS1+O90Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cAwwx89b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wWero+X7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cAwwx89b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wWero+X7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cAwwx89b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wWero+X7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cAwwx89b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wWero+X7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C4011F797;
	Tue, 13 Oct 2026 07:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791874992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RV646GZ4CZypeWdK6yGhZIhdHp8UUH3jItAOqBcImfI=;
	b=cAwwx89bCRIgu+0Ux1CbNBJBwBhwqtWCF8Dqu3gwC0QhVdCJuGwXpC8gfHqqEtfcDaunQG
	KEmBvgEKgc45eY1et78dmLdXCgYWd3VF9NQeSvhyRd/OTbHF8MCkNfGCL3kJQASTk9TPT0
	r4x6k+OaX8cYxDXSm+q9i0b3PxIht4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791874992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RV646GZ4CZypeWdK6yGhZIhdHp8UUH3jItAOqBcImfI=;
	b=wWero+X7VTJScJL8xcME0FOsgZT2FfclVI3pfIGcOG6kKuQgJqP25Z/wZ7yhVFfgrGMEvm
	E96kv2B2m2lBMVBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cAwwx89b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wWero+X7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791874992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RV646GZ4CZypeWdK6yGhZIhdHp8UUH3jItAOqBcImfI=;
	b=cAwwx89bCRIgu+0Ux1CbNBJBwBhwqtWCF8Dqu3gwC0QhVdCJuGwXpC8gfHqqEtfcDaunQG
	KEmBvgEKgc45eY1et78dmLdXCgYWd3VF9NQeSvhyRd/OTbHF8MCkNfGCL3kJQASTk9TPT0
	r4x6k+OaX8cYxDXSm+q9i0b3PxIht4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791874992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RV646GZ4CZypeWdK6yGhZIhdHp8UUH3jItAOqBcImfI=;
	b=wWero+X7VTJScJL8xcME0FOsgZT2FfclVI3pfIGcOG6kKuQgJqP25Z/wZ7yhVFfgrGMEvm
	E96kv2B2m2lBMVBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7F321349D;
	Tue, 13 Oct 2026 07:03:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kq+bJ67XzWquRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 07:03:10 +0000
Date: Tue, 13 Oct 2026 09:03:10 +0200
Message-ID: <87cxteozf5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan den Hollander <johan.den.hollander@finalist.nl>
Subject: Re: [PATCH] ALSA: hda/realtek: Add GPIO2 low quirk for ASUS E5402WHA
In-Reply-To: <20261013062532.216712-1-zhangheng@kylinos.cn>
References: <20261013062532.216712-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 1C4011F797
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 13 Oct 2026 08:25:32 +0200,
Zhang Heng wrote:
> 
> The internal speaker amplifier on the ASUS ExpertCenter AIO E5402WHA
> (ALC256, SSID 1043:3500) is enabled via GPIO2 and is active-low.
> Driving GPIO2 high, as ALC256_FIXUP_ASUS_AIO_GPIO2 does on the ZN270IE,
> keeps the speakers muted. Add a dedicated fixup that drives GPIO2 low
> so the internal speakers work.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221938
> Tested-by: Johan den Hollander <johan.den.hollander@finalist.nl>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>  sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 9eeb3a66b2b9..7021a573bd49 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -2809,6 +2809,19 @@ static void alc275_fixup_gpio4_off(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc256_fixup_asus_aio_gpio2_low(struct hda_codec *codec,
> +					    const struct hda_fixup *fix,
> +					    int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		spec->gpio_mask |= 0x04;
> +		spec->gpio_dir |= 0x04;
> +		spec->gpio_data &= ~0x04;
> +	}
> +}
> +
>  /* Quirk for Thinkpad X1 7th and 8th Gen
>   * The following fixed routing needed
>   * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
> @@ -4250,6 +4263,7 @@ enum {
>  	ALC256_FIXUP_ASUS_HEADSET_MODE,
>  	ALC256_FIXUP_ASUS_MIC,
>  	ALC256_FIXUP_ASUS_AIO_GPIO2,
> +	ALC256_FIXUP_ASUS_AIO_GPIO2_LOW,
>  	ALC233_FIXUP_ASUS_MIC_NO_PRESENCE,
>  	ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE,
>  	ALC233_FIXUP_LENOVO_MULTI_CODECS,
> @@ -5584,6 +5598,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		/* Set up GPIO2 for the speaker amp */
>  		.v.func = alc_fixup_gpio4,
>  	},
> +	[ALC256_FIXUP_ASUS_AIO_GPIO2_LOW] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc256_fixup_asus_aio_gpio2_low,
> +	},
>  	[ALC233_FIXUP_ASUS_MIC_NO_PRESENCE] = {
>  		.type = HDA_FIXUP_PINS,
>  		.v.pins = (const struct hda_pintbl[]) {
> @@ -8124,6 +8142,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x31e1, "ASUS B5605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x31f1, "ASUS B3605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x3391, "ASUS PM3606CKA", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x1043, 0x3500, "ASUS E5402WHA", ALC256_FIXUP_ASUS_AIO_GPIO2_LOW),
>  	SND_PCI_QUIRK(0x1043, 0x3501, "ASUS PM3606CHA", ALC256_FIXUP_ASUS_SPEAKER_COEFS),
>  	SND_PCI_QUIRK(0x1043, 0x3601, "ASUS PM5406CGA", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x1043, 0x3611, "ASUS PM5606CGA", ALC287_FIXUP_CS35L41_I2C_2),
> @@ -8786,6 +8805,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
>  	{.id = ALC256_FIXUP_ASUS_HEADSET_MODE, .name = "alc256-asus-headset"},
>  	{.id = ALC256_FIXUP_ASUS_MIC, .name = "alc256-asus-mic"},
>  	{.id = ALC256_FIXUP_ASUS_AIO_GPIO2, .name = "alc256-asus-aio"},
> +	{.id = ALC256_FIXUP_ASUS_AIO_GPIO2_LOW, .name = "alc256-asus-aio-low"},
>  	{.id = ALC233_FIXUP_ASUS_MIC_NO_PRESENCE, .name = "alc233-asus"},
>  	{.id = ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE, .name = "alc233-eapd"},
>  	{.id = ALC294_FIXUP_LENOVO_MIC_LOCATION, .name = "alc294-lenovo-mic"},

We don't need to add a fixup model string for usual cases any longer;
you can invoke the quirk with the alias.  Could you drop this part and
resubmit?


thanks,

Takashi
