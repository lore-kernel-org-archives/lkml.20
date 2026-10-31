Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461681;
	b=gYY6WH3nNcyM/Gp/ySQpTVERzEdfD8WqTLdlcfCWgOXdIgvrtj0yXFgGufGQ4Y+TOcuL
	 GoZSJ2lgc+E9EKiF+Td3oeiJWo6G4YSm8Y5+LpHP6d1vxubWLTm/mtERsnqOs+t/++C3T
	 xNe/nV5pwohOpWLgHjeQ2TtYmdR7iLWnMDPx/HggzKf+RFipHXv9/m9U2tjnZwgUfZWzj
	 s+vYnDTtqVeLbk5V9QdlgYrRNcYTSi7Sm0aaDVM44kYlnvwJt9dN3sUD1CV+s32W8I2yK
	 rU3dsO32k80BcA9RcxWBORiOntsIJtNEqkyjftKpJZn5bcUnFKgsQCKvAZyppJalSoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461681;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=A5k/Y0kA1DCh5JOK4tdKXsPq9J4F1pYp144dZpEi0Iw=;
	b=r/JRHp1jFsQWxcJ2UEdVDfjTbLV38cNnTDDs1Qp3NOTF6ppkDk0cWQyWBTEghf2Aql5x
	 j+bfH06enYXwJlHll8JfLhaTQ4D8rRvgx4QefyGJBWDcwdwX/nU9+1QNr6wVSUDVSX79R
	 q39rSteMPLL/y3UbUGJZMhYx0kdmIaA/g3+cOZLEVh8T6B00rpP190cDuzkj3Z+jFHKmd
	 e5lIAmg+O6aE1fcTBV7XhjzWsDIMCGTHhzSZ02Re3RbugBJm8VfLIbl7IwmgNagO1H+20
	 J0pqLxxtKn1hUbce2cfNIvGk9jxHKkk8nEx+575WauL5c1M55WNvnOD4Bc6gEdp81+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vy82+wyI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PPsQB+Qg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vy82+wyI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PPsQB+Qg;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF42606A31A;
	Sat, 31 Oct 2026 15:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vy82+wyI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PPsQB+Qg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vy82+wyI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PPsQB+Qg
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 403C11F76B;
	Sat, 31 Oct 2026 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A5k/Y0kA1DCh5JOK4tdKXsPq9J4F1pYp144dZpEi0Iw=;
	b=vy82+wyI/eAwSibYhKHOrcctfakqYMaoqiC5mzBH0CYVguh52soa+WHTQ/h89d47dzO2XR
	dyzU1XI79Q2QDlCEL0UfioGb+TBWizInxou/4aLxaakEzBriN1P1DMWfrFKnBHxvk/yiM8
	ANP4Zvzv40VZDRboSbE5g9SpXWXRL54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A5k/Y0kA1DCh5JOK4tdKXsPq9J4F1pYp144dZpEi0Iw=;
	b=PPsQB+QgUIL7ytYugPnV0YHujw8XACAO40VFXg7EKvzBLLr0mF/aDgYpMisnVyn4quiO+d
	Yy6W/XDEvW5HEjAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A5k/Y0kA1DCh5JOK4tdKXsPq9J4F1pYp144dZpEi0Iw=;
	b=vy82+wyI/eAwSibYhKHOrcctfakqYMaoqiC5mzBH0CYVguh52soa+WHTQ/h89d47dzO2XR
	dyzU1XI79Q2QDlCEL0UfioGb+TBWizInxou/4aLxaakEzBriN1P1DMWfrFKnBHxvk/yiM8
	ANP4Zvzv40VZDRboSbE5g9SpXWXRL54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A5k/Y0kA1DCh5JOK4tdKXsPq9J4F1pYp144dZpEi0Iw=;
	b=PPsQB+QgUIL7ytYugPnV0YHujw8XACAO40VFXg7EKvzBLLr0mF/aDgYpMisnVyn4quiO+d
	Yy6W/XDEvW5HEjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E104013432;
	Sat, 31 Oct 2026 15:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ELlXLa4N5moOIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:47:58 +0000
Date: Sat, 31 Oct 2026 16:47:58 +0100
Message-ID: <874ie1swgh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Doe <coolcrew45@disroot.org>
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add speaker depop sequence to alc225_shutup
In-Reply-To: <20261029055945.188723-1-zhangheng@kylinos.cn>
References: <20261029055945.188723-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 29 Oct 2026 06:59:44 +0100,
Zhang Heng wrote:
> 
> Mute speaker pins and disable their pin widgets, with a 75 ms delay
> after each step, before cutting EAPD in alc225_shutup().  This
> prevents the pop noise that occurs on suspend when the amplifier
> loses its input signal while still powered.
> 
> Reported-by: John Doe <coolcrew45@disroot.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221616
> Tested-by: John Doe <coolcrew45@disroot.org>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

This will be applied to all devices that use ALC225 codec, so the
influence is pretty high.  Are you sure that it's the only and best
way to address the problem of the reported device?


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 23329d5887a5..67ce5b130f81 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -665,6 +665,7 @@ static void alc225_shutup(struct hda_codec *codec)
>  	struct alc_spec *spec = codec->spec;
>  	hda_nid_t hp_pin = alc_get_hp_pin(spec);
>  	bool hp1_pin_sense, hp2_pin_sense;
> +	int i;
>  
>  	if (!hp_pin)
>  		hp_pin = 0x21;
> @@ -698,6 +699,16 @@ static void alc225_shutup(struct hda_codec *codec)
>  		alc_update_coef_idx(codec, 0x4a, 3 << 10, 0);
>  		alc_enable_headset_jack_key(codec);
>  	}
> +
> +	for (i = 0; i < spec->gen.autocfg.speaker_outs; i++)
> +		snd_hda_codec_write(codec, spec->gen.autocfg.speaker_pins[i], 0,
> +				    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> +	msleep(75);
> +	for (i = 0; i < spec->gen.autocfg.speaker_outs; i++)
> +		snd_hda_codec_write(codec, spec->gen.autocfg.speaker_pins[i], 0,
> +				    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
> +	msleep(75);
> +
>  	alc_auto_setup_eapd(codec, false);
>  	alc_shutup_pins(codec);
>  	if (spec->ultra_low_power) {
> -- 
> 2.25.1
> 
