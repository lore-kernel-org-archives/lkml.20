Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A759B3CF1E5;
	Wed, 14 Oct 2026 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969752; cv=none; b=PWk8LDhReoFcIIa0//CDH+510SMxdsg2GAOcYiQAtvsXkGHeoDAD0ztRtyyy1LPmVTKk85UlzQGDytL4Xt/04Dci5lpzhwPm/QiGsQ6DdiEj31KdPwaRx3xaaueEHK57oiKni2+nISRorBjzBEs+PGB5wp0V9L5yG351tACietc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969752; c=relaxed/simple;
	bh=Yu8KnzuuFGuq8WeevNJspjvH1jvmlPFXd5lsYZVXhm0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHDwjHaT/d91x4eMvE1NGmzfPaUi2uuOw1HggdBAuF/Ws+ygzss6qGlRVQTb26W836cUVzafajCE88OY/koMQuHgJBQaKYaK39E9+oiX5yusUhb4K7hm+DydNOqZu+C3JX7S5c7TzC7o9iXOx7OVtK8u7ueYv0Tztcgfz+E+oS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v4LgnKMl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dww2QqGl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v4LgnKMl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Dww2QqGl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v4LgnKMl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dww2QqGl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v4LgnKMl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dww2QqGl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 60CB91F7C9;
	Wed, 14 Oct 2026 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791969748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N1LPMGX2+0AXm9VKGbVPh+oqgLL3cjDfrsEfZy9HKjk=;
	b=v4LgnKMlRIKnFPQFq79garBlZrgZ+BkGDhGzBUHihTFvW6cx6VzvA436Kczkp1hBkWq4Yk
	TIJcnojCdd/dDYh97N2+B1ZatYw4YAImiH2rsac5OaGdaivW6dPd8KgD7xDby8kwZGQnhC
	osIigq8gVLvYC6KQ4TydP2qkQJ3rsyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791969748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N1LPMGX2+0AXm9VKGbVPh+oqgLL3cjDfrsEfZy9HKjk=;
	b=Dww2QqGlcRjVPMryHn9qW3ODC8nAZTt8Gzqlc+8IE7RgXoKI+xGtFWGz5XAQidIqHwATBu
	SJJOO+PzZNP4pzBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v4LgnKMl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Dww2QqGl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791969748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N1LPMGX2+0AXm9VKGbVPh+oqgLL3cjDfrsEfZy9HKjk=;
	b=v4LgnKMlRIKnFPQFq79garBlZrgZ+BkGDhGzBUHihTFvW6cx6VzvA436Kczkp1hBkWq4Yk
	TIJcnojCdd/dDYh97N2+B1ZatYw4YAImiH2rsac5OaGdaivW6dPd8KgD7xDby8kwZGQnhC
	osIigq8gVLvYC6KQ4TydP2qkQJ3rsyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791969748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N1LPMGX2+0AXm9VKGbVPh+oqgLL3cjDfrsEfZy9HKjk=;
	b=Dww2QqGlcRjVPMryHn9qW3ODC8nAZTt8Gzqlc+8IE7RgXoKI+xGtFWGz5XAQidIqHwATBu
	SJJOO+PzZNP4pzBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E2E5133F1;
	Wed, 14 Oct 2026 09:22:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id czfLNdNJz2o0JwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 09:22:28 +0000
Date: Wed, 14 Oct 2026 11:22:27 +0200
Message-ID: <87se28eiwc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/realtek: Limit Line In boost and ADC gain on DECENTA MATX03
In-Reply-To: <20261013120327.998217-1-wangdich9700@163.com>
References: <20261013120327.998217-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[163.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: 60CB91F7C9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 13 Oct 2026 14:03:27 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The DECENTA MATX03 (ALC897, SSID 1e0b:1297) exposes a high gain
> range on both the Line In pin boost and the ADC input amp. Pin 0x1a
> reports nsteps=0x03 with stepsize=0x27, that is 0, 9.75, 19.5 and
> 29.25 dB. ADC 0x08 reports nsteps=0x3f with stepsize=0x02, that is
> 0 to 31.5 dB in 0.5 dB steps, and defaults to 0x3f (maximum). The
> combined 60.75 dB analogue cascade overloads the front-end when the
> source level is high, producing audible harmonic distortion during
> Line In monitoring.
> 
> Add a new fixup alc897_fixup_limit_linein_boost that overrides the amp
> capabilities of the Line In and external Mic pins to nsteps=1 (max
> ~11.75 dB), and also limits the ADC input amp to nsteps=1 (max ~0.5 dB).
> The total gain drops from 60.75 dB to ~12.25 dB, eliminating the
> clipping. Internal and dock mic pins are excluded to avoid affecting
> built-in microphones.
> 
> Tested on the affected machine: with the fixup applied, Line In
> recording at maximum source volume is clean, and dmesg confirms the
> fixup is picked:
> 
>   ALC897: picked fixup alc897-limit-linein-boost (SSID)
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---
>  sound/hda/codecs/realtek/alc662.c | 50 +++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
> index eff7c83b9c59..a140891d51fa 100644
> --- a/sound/hda/codecs/realtek/alc662.c
> +++ b/sound/hda/codecs/realtek/alc662.c
> @@ -198,6 +198,49 @@ static void alc897_fixup_lenovo_headset_mode(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc897_fixup_limit_linein_boost(struct hda_codec *codec,
> +					    const struct hda_fixup *fix, int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
> +	int i;
> +
> +	if (action != HDA_FIXUP_ACT_PROBE)
> +		return;
> +
> +	for (i = 0; i < cfg->num_inputs; i++) {
> +		hda_nid_t nid = cfg->inputs[i].pin;
> +		unsigned int defcfg;
> +
> +		if (cfg->inputs[i].type != AUTO_PIN_LINE_IN &&
> +		    cfg->inputs[i].type != AUTO_PIN_MIC)
> +			continue;
> +
> +		defcfg = snd_hda_codec_get_pincfg(codec, nid);
> +		if (snd_hda_get_input_pin_attr(defcfg) == INPUT_PIN_ATTR_INT ||
> +		    snd_hda_get_input_pin_attr(defcfg) == INPUT_PIN_ATTR_DOCK)
> +			continue;
> +
> +		snd_hda_override_amp_caps(codec, nid, HDA_INPUT,
> +					  (0x00 << AC_AMPCAP_OFFSET_SHIFT) |
> +					  (0x01 << AC_AMPCAP_NUM_STEPS_SHIFT) |
> +					  (0x2f << AC_AMPCAP_STEP_SIZE_SHIFT) |
> +					  (0 << AC_AMPCAP_MUTE_SHIFT));
> +	}
> +
> +	for (i = 0; i < spec->gen.num_all_adcs; i++) {
> +		hda_nid_t adc = spec->gen.all_adcs[i];
> +		unsigned int caps;
> +
> +		caps = query_amp_caps(codec, adc, HDA_INPUT);
> +		if ((caps & AC_AMPCAP_NUM_STEPS) >> AC_AMPCAP_NUM_STEPS_SHIFT > 1) {
> +			caps &= ~AC_AMPCAP_NUM_STEPS;
> +			caps |= (0x01 << AC_AMPCAP_NUM_STEPS_SHIFT);
> +			snd_hda_override_amp_caps(codec, adc, HDA_INPUT, caps);
> +		}
> +	}
> +}
> +

I guess there aren't so many pins and ADCs, and the quirk is very
specific to the model, so you can just write a few
snd_hda_override_amp_caps() for the fixed hard-coded NIDs.

The alc269_fixup_limit_int_mic_boost() is applied to lots of different
models, hence it handles in a generic way, OTOH.

>  static const struct hda_quirk alc662_fixup_tbl[] = {
> @@ -859,6 +907,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1c6c, 0x1239, "Compaq N14JP6-V2", ALC897_FIXUP_HP_HSMIC_VERB),
>  	SND_PCI_QUIRK(0x1e63, 0x6d9a, "F+ FLAPTOP r", ALC897_FIXUP_HP_HSMIC_VERB),
>  	SND_PCI_QUIRK(0x1f66, 0x0202, "Beelink SER6 Max 6900", ALC897_FIXUP_BEELINK_SER6_AMP),
> +	SND_PCI_QUIRK(0x1e0b, 0x1297, "DECENTA MATX03", ALC897_FIXUP_LIMIT_LINEIN_BOOST),

The table is sorted in PCI SSID order, so please put at the right
position.

> @@ -954,6 +1003,7 @@ static const struct hda_model_fixup alc662_fixup_models[] = {
>  	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
>  	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
>  	{.id = ALC897_FIXUP_UNIS_H3C_X500S, .name = "unis-h3c-x500s"},
> +	{.id = ALC897_FIXUP_LIMIT_LINEIN_BOOST, .name = "alc897-limit-linein-boost"},
>  	{}
>  };

Nowadays we don't want a model name addition unless it's really
needed.  The existing quirk can be applied with an alias instead of a
model name string.


thanks,

Takashi
