Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085998;
	b=D4UppsgeGVB5MV5Nd1aQEmGE0n31l5QwvsgQG+WXZF1s2Pzb4z4S/n3dAPhZeaW58A8C
	 sf0q02O5rngaL2ARJP6+2FV2kdZbt0Ov9dHjQhF//3PsnEbPzmyBCjT1g0uOF/XZ2KRWR
	 yqm5PEKYYtWfy3ZCxsaxJ7SVLrmuvNXfBYG44U20Rha7kxqxOLTvIoNcHMO1b7SzDRh/p
	 VeFEQgK4DEkWjFr6ppDM56pX8JjGGmVSnSoDjYkjyabO4Bowk0G/o24DDkP5wnNhyagAb
	 aJy3PkTs/TiHI63jxyWWAkxC2bbNIcS5prh4XZ9LP+tOrRdlDQcLzAzXav+O2TEkFHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085998;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=yAZGsIyf5mfem4c6a6XJIBFQ5FbA7tpD36GRhxtwhGo=;
	b=nvF/jPnR7qMBLsYBxDdXR8891apAI9wiilJuBc8wX+QpRNn9cMXukunVvUhWWRt6iBvQ
	 bGZcY4kVRmDhFZpD/Ie+mTMzNv4WngL8F2Jo+FOT6kFOxvEzuv84VUOHHIqo01NkoGaaf
	 YWDRlwbqbtMXQZOzGyUeelmyc7Tit7ZQICxgvAK9A70KOeiPJIYT+3Z37c7FduQo+kzSQ
	 FPtPDCpd5HmRdw/W0zyEvguwfn2CZiNE2xTjpKXTcx0vQhtZBpK/MLkqevvWl0cnxJv+L
	 27CV3ntKX09CnHe6m2Xkz5uM71ljk5bZT1PIPsZqm15DhycYk1rkiGQI5YIPLtjx9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f9cQLM9d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IX4PTdFw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f9cQLM9d;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IX4PTdFw;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9007B606A31F;
	Tue, 27 Oct 2026 07:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9007B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f9cQLM9d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IX4PTdFw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=f9cQLM9d;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IX4PTdFw
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A7FE1F7B6;
	Tue, 27 Oct 2026 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793085995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAZGsIyf5mfem4c6a6XJIBFQ5FbA7tpD36GRhxtwhGo=;
	b=f9cQLM9dYDMQf8oZc0V40RBGd2u+cFpuENcq/lUQzX+mqqHpuV8DudV/DG5kMKm0hycZiJ
	74iMnDzmXE20Y2oIHUBMx7dXUaiVAT3DBFsYXqwCoww53b8vGySAAi5RlMmU+oc4mopLoS
	LkRYJhZWA+70Hy+dEI+9VnRNyOF3RJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793085995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAZGsIyf5mfem4c6a6XJIBFQ5FbA7tpD36GRhxtwhGo=;
	b=IX4PTdFwFQjuf9JIy6jdbEQU4pP7aBFIw13MMT3AQZmyz+3DUY3D5asibeakVVnI8okQnV
	yd3ozZ+gCb1sXVAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f9cQLM9d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IX4PTdFw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793085995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAZGsIyf5mfem4c6a6XJIBFQ5FbA7tpD36GRhxtwhGo=;
	b=f9cQLM9dYDMQf8oZc0V40RBGd2u+cFpuENcq/lUQzX+mqqHpuV8DudV/DG5kMKm0hycZiJ
	74iMnDzmXE20Y2oIHUBMx7dXUaiVAT3DBFsYXqwCoww53b8vGySAAi5RlMmU+oc4mopLoS
	LkRYJhZWA+70Hy+dEI+9VnRNyOF3RJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793085995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAZGsIyf5mfem4c6a6XJIBFQ5FbA7tpD36GRhxtwhGo=;
	b=IX4PTdFwFQjuf9JIy6jdbEQU4pP7aBFIw13MMT3AQZmyz+3DUY3D5asibeakVVnI8okQnV
	yd3ozZ+gCb1sXVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 301BB13319;
	Tue, 27 Oct 2026 07:26:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TzI6AitS4GqEUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 07:26:35 +0000
Date: Tue, 27 Oct 2026 08:26:34 +0100
Message-ID: <87tsm738ph.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xie Youtian <xiedada@xiedada.net>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: hda/conexant: Fix swapped speaker/headphone outputs on Huawei MateBook 16s
In-Reply-To: <20261025080044.85736-1-xiedada@xiedada.net>
References: <20261025080044.85736-1-xiedada@xiedada.net>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 7A7FE1F7B6

On Sun, 25 Oct 2026 09:00:44 +0100,
Xie Youtian wrote:
> 
> On the Huawei MateBook 16s (2023) with a Conexant SN6140 codec (codec
> SSID 0x19e5:0x3291), the speaker amplifier and the headphone jack are
> both fed from the analog output line of pin 0x16: the jack through a
> tap that needs GPIO1 enabled and driven low, and the speaker amp
> switched by the EAPD of pin 0x17 - none of which matches the BIOS pin
> config.  The generic parser therefore routes audio to the wrong
> physical output and never powers the jack:
> 
>  * headphones plugged: the headphone path (DAC 0x10 -> pin 0x16)
>    drives the speakers while the jack stays silent
>  * headphones unplugged: the speaker path (DAC 0x11 -> pin 0x17) feeds
>    no transducer at all and the machine stays silent
> 
> Route the shared line to the DAC of whichever output path is currently
> active, so a manual route selection keeps working on the shared line,
> open or close the jack tap accordingly, and gate the speaker amp
> through EAPD.  The verbs are applied from a private jack callback (the
> generic unsol->automute path never fires on this machine while a stream
> keeps the codec awake), and a delayed recheck re-applies everything
> from a settled sample - only while the codec is already powered - and
> resyncs the jack state cached for userspace, since any reader of the
> pin sense can see stale data for a short while after a codec power
> transition.  The 600 ms recheck delay matches the factory Windows
> driver's plug-detection restart window.
> 
> The factory Windows driver groups codec SSIDs 0x19e5:0x3291 through
> 0x3294 into a single audio configuration, so the siblings very likely
> share this wiring; only 0x3291 could be tested.
> 
> Tested on the machine: headphone/speaker switching in both directions,
> during playback, over the bare PCM path and through PipeWire, and
> across suspend/resume.
> 
> Problem detection and the verb-level hardware experiments were
> performed with the help of an AI coding assistant, with all audible
> verification done by ear on the actual hardware by the submitter; the
> fix was drafted by the assistant and then reviewed, understood,
> adjusted and tested by the submitter.
> 
> Link: https://github.com/geniusinsanity/huawei-matebook16s-speaker-fix
> Signed-off-by: Xie Youtian <xiedada@xiedada.net>
> 
> ---
> Changes in v4 (addressing review comments):
> 
>  - The recheck now runs in up to three waves (600 ms apart) instead of
>    a single shot, and when the codec is not active it consumes a wave
>    and retries instead of dropping the fixup: the audio server
>    reconfigures its route in several steps spread over more than one
>    delay, and a runtime suspend in between must not lose the tail.
>  - Wrap the Headphone/Speaker playback switch controls so manual route
>    changes through alsamixer (no session manager) also trigger the
>    recheck.

The code change looks overly too complex, which is a typical behavior
by AI coding.  So, sorry, I can't take this as is.

The routing shouldn't be changed in that way.  In general, if the
routing by the generic parser is wrong, the first thing you can do is
to give some hints for better routing.  In the worst case, you can
enforce the connection by giving the static list, too.


thanks,

Takashi


> ---
>  sound/hda/codecs/conexant.c | 261 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 261 insertions(+)
> 
> diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
> index 9bfdbf5c9032..d171bce34d84 100644
> --- a/sound/hda/codecs/conexant.c
> +++ b/sound/hda/codecs/conexant.c
> @@ -43,6 +43,12 @@ struct conexant_spec {
>  	unsigned int gpio_mute_led_mask;
>  	unsigned int gpio_mic_led_mask;
>  	bool is_cx11880_sn6140;
> +
> +	/* quirk for Huawei MateBooks with Raptor Lake */
> +	struct hda_codec *rpl_recheck_codec;
> +	struct delayed_work rpl_recheck_work;
> +	snd_kcontrol_put_t *rpl_orig_switch_put;
> +	int rpl_recheck_arms;
>  };
>  
>  
> @@ -203,6 +209,15 @@ static void cx_auto_shutdown(struct hda_codec *codec)
>  
>  static void cx_remove(struct hda_codec *codec)
>  {
> +	struct conexant_spec *spec = codec->spec;
> +
> +	/* stop the quirk recheck before the spec is freed below; only the
> +	 * quirk ever initializes the work item
> +	 */
> +	if (spec->rpl_recheck_codec) {
> +		spec->rpl_recheck_codec = NULL;
> +		cancel_delayed_work_sync(&spec->rpl_recheck_work);
> +	}
>  	cx_auto_shutdown(codec);
>  	snd_hda_gen_remove(codec);
>  }
> @@ -312,6 +327,7 @@ enum {
>  	CXT_FIXUP_HP_A_U,
>  	CXT_FIXUP_ACER_SWIFT_HP,
>  	CXT_FIXUP_HUAWEI_MATEBOOK_HP,
> +	CXT_FIXUP_HUAWEI_MATEBOOK_RPL,
>  };
>  
>  /* for hda_fixup_thinkpad_acpi() */
> @@ -863,6 +879,243 @@ static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
>  	{}
>  };
>  
> +/*
> + * Huawei MateBooks with Raptor Lake and SN6140 (e.g. the MateBook 16s
> + * 2023): the speaker amp and the headphone jack are both fed from the
> + * pin 0x16 line.  The speaker amp is gated by the EAPD of pin 0x17, the
> + * jack tap by GPIO1 - none of which matches the BIOS pin config.  Point
> + * pin 0x16 at the DAC of whichever output path is currently active,
> + * gate the speaker amp via EAPD, and open or close the jack tap
> + * accordingly, so the shared line drives exactly one transducer.
> + */
> +static bool cxt_matebook_raptor_lake_dac_active(struct hda_codec *codec,
> +						hda_nid_t dac);
> +static bool cxt_matebook_raptor_lake_sense(struct hda_codec *codec);
> +
> +static bool cxt_matebook_raptor_lake_dac_active(struct hda_codec *codec,
> +						hda_nid_t dac)
> +{
> +	return !(snd_hda_codec_amp_read(codec, dac, 0, HDA_OUTPUT, 0) &
> +		 AC_AMP_MUTE);
> +}
> +
> +static void cxt_matebook_raptor_lake_coerce(struct hda_codec *codec)
> +{
> +	bool hp_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x10);
> +	bool spk_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x11);
> +	bool hp;
> +
> +	/* which path carries signal decides; if both or neither DAC is
> +	 * active (paused, master-muted, mid-transition) fall back to the
> +	 * jack state
> +	 */
> +	if (hp_dac == spk_dac)
> +		hp = cxt_matebook_raptor_lake_sense(codec);
> +	else
> +		hp = hp_dac;
> +
> +	snd_hda_codec_write_cache(codec, 0x16, 0,
> +				  AC_VERB_SET_CONNECT_SEL, hp ? 0x0 : 0x1);
> +	/* the tap path needs pin 0x17 selected and driving, whatever the
> +	 * parser does to what it thinks is a speaker pin
> +	 */
> +	snd_hda_codec_write_cache(codec, 0x17, 0,
> +				  AC_VERB_SET_CONNECT_SEL, 0x0);
> +	snd_hda_codec_write_cache(codec, 0x17, 0,
> +				  AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40);
> +	snd_hda_codec_write_cache(codec, 0x17, 0,
> +				  AC_VERB_SET_EAPD_BTLENABLE, hp ? 0x0 : 0x2);
> +	/* the tap follows the opposite way: closed while the speaker path
> +	 * is active so the shared line drives exactly one transducer
> +	 */
> +	snd_hda_codec_write_cache(codec, 0x01, 0,
> +				  AC_VERB_SET_GPIO_MASK, 0x02);
> +	snd_hda_codec_write_cache(codec, 0x01, 0,
> +				  AC_VERB_SET_GPIO_DIRECTION, 0x02);
> +	snd_hda_codec_write_cache(codec, 0x01, 0,
> +				  AC_VERB_SET_GPIO_DATA, hp ? 0x00 : 0x02);
> +}
> +
> +/* read the pin sense directly: snd_hda_jack_detect() returns the
> + * cached state, which is exactly what a bounce-healing re-read must
> + * not trust
> + */
> +static bool cxt_matebook_raptor_lake_sense(struct hda_codec *codec)
> +{
> +	return !!(snd_hda_codec_read(codec, 0x16, 0,
> +				     AC_VERB_GET_PIN_SENSE, 0) &
> +		  AC_PINSENSE_PRESENCE);
> +}
> +
> +static void cxt_matebook_raptor_lake_apply(struct hda_codec *codec, bool hp)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +
> +	spec->gen.hp_jack_present = hp;
> +	snd_hda_gen_update_outputs(codec);
> +	cxt_matebook_raptor_lake_coerce(codec);
> +}
> +
> +/* at init or from the delayed recheck: behave like a fresh jack event
> + * unless the mixer switches disagree with the jack state - a manual
> + * route selection - in which case only the routing verbs follow them
> + */
> +static void cxt_matebook_raptor_lake_reconcile(struct hda_codec *codec)
> +{
> +	bool hp = cxt_matebook_raptor_lake_sense(codec);
> +	bool hp_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x10);
> +	bool spk_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x11);
> +
> +	/* when the settled sample disagrees with the cached one, the cache
> +	 * and the userspace jack state must follow, or the audio server
> +	 * keeps routing for the stale view
> +	 */
> +	if (snd_hda_jack_detect(codec, 0x16) != hp) {
> +		snd_hda_jack_set_dirty_all(codec);
> +		snd_hda_jack_report_sync(codec);
> +	}
> +	if (hp_dac == spk_dac || hp_dac == hp)
> +		cxt_matebook_raptor_lake_apply(codec, hp);
> +	else
> +		cxt_matebook_raptor_lake_coerce(codec);
> +}
> +
> +/*
> + * Right after the codec powers back up every reader of the pin sense -
> + * ours and the parser's alike - can see garbage.  Re-apply everything
> + * from a settled read a bit later, which heals any misguess made at
> + * init or during a jack event.
> + */
> +static void cxt_matebook_raptor_lake_recheck(struct work_struct *work)
> +{
> +	struct conexant_spec *spec = container_of(work, struct conexant_spec,
> +						  rpl_recheck_work.work);
> +	struct hda_codec *codec = spec->rpl_recheck_codec;
> +	bool active;
> +
> +	if (!codec)
> +		return;
> +	/* never force a resume and never wait for an ongoing suspend:
> +	 * only run while the codec is already active; if it is not, try
> +	 * again while there are arms left instead of dropping the fixup
> +	 */
> +	active = pm_runtime_get_if_active(&codec->core.dev) > 0;
> +	if (active) {
> +		codec_dbg(codec, "matebook-rpl: recheck\n");
> +		cxt_matebook_raptor_lake_reconcile(codec);
> +		pm_runtime_put_autosuspend(&codec->core.dev);
> +	}
> +	/* the audio server reconfigures its route in several steps spread
> +	 * over more than a single delay; keep re-reading until the state
> +	 * settles
> +	 */
> +	if (spec->rpl_recheck_arms-- > 0)
> +		mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
> +				  msecs_to_jiffies(600));
> +}
> +
> +/* shared event body: apply at once from the raw sample - sleeping here
> + * is not allowed (callbacks race teardown) - and let the delayed
> + * recheck heal whatever a bouncing contact made it misread
> + */
> +static void cxt_matebook_raptor_lake_event(struct hda_codec *codec)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +
> +	if (!spec->rpl_recheck_codec)
> +		return;
> +	codec_dbg(codec, "matebook-rpl: event\n");
> +	cxt_matebook_raptor_lake_apply(codec,
> +				       cxt_matebook_raptor_lake_sense(codec));
> +	spec->rpl_recheck_arms = 2;
> +	mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
> +			  msecs_to_jiffies(600));
> +}
> +
> +/* the parser reprograms pin 0x17 and the DAC amps on output updates */
> +static void cxt_matebook_raptor_lake_update_outputs(struct hda_codec *codec)
> +{
> +	cxt_matebook_raptor_lake_event(codec);
> +}
> +
> +/* our own jack callback: the generic unsol -> automute chain stays
> + * silent on this machine while a stream keeps the codec awake
> + */
> +static void cxt_matebook_raptor_lake_jack_event(struct hda_codec *codec,
> +					       struct hda_jack_callback *jack)
> +{
> +	cxt_matebook_raptor_lake_event(codec);
> +}
> +
> +/* a manual route selection in the audio server rewrites the DAC amp
> + * switches directly through the mixer; that emits no kernel event, so
> + * wrap the switch controls and re-run the reconcile from the delayed
> + * work once the new state has settled
> + */
> +static int cxt_matebook_raptor_lake_switch_put(struct snd_kcontrol *kcontrol,
> +					       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
> +	struct conexant_spec *spec = codec->spec;
> +	int ret = spec->rpl_orig_switch_put(kcontrol, ucontrol);
> +
> +	if (ret > 0 && spec->rpl_recheck_codec) {
> +		spec->rpl_recheck_arms = 2;
> +		mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
> +				 msecs_to_jiffies(600));
> +	}
> +	return ret;
> +}
> +
> +static void cxt_matebook_raptor_lake_wrap_switch(struct hda_codec *codec,
> +						 const char *name)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +	struct snd_kcontrol *kctl;
> +
> +	kctl = snd_ctl_find_id_mixer(codec->card, name);
> +	if (!kctl || kctl->put == cxt_matebook_raptor_lake_switch_put)
> +		return;
> +	spec->rpl_orig_switch_put = kctl->put;
> +	kctl->put = cxt_matebook_raptor_lake_switch_put;
> +}
> +
> +static void cxt_fixup_matebook_raptor_lake(struct hda_codec *codec,
> +				  const struct hda_fixup *fix, int action)
> +{
> +	struct conexant_spec *spec = codec->spec;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		spec->gen.automute_hook = cxt_matebook_raptor_lake_update_outputs;
> +		INIT_DELAYED_WORK(&spec->rpl_recheck_work,
> +				  cxt_matebook_raptor_lake_recheck);
> +		spec->rpl_recheck_codec = codec;
> +		break;
> +	case HDA_FIXUP_ACT_PROBE:
> +		cxt_matebook_raptor_lake_wrap_switch(codec,
> +						     "Headphone Playback Switch");
> +		cxt_matebook_raptor_lake_wrap_switch(codec,
> +						     "Speaker Playback Switch");
> +		break;
> +	case HDA_FIXUP_ACT_INIT:
> +		/* the parser's own view is the best guess at init; the
> +		 * delayed recheck above heals whatever it gets wrong
> +		 */
> +		snd_hda_jack_detect_enable_callback(codec, 0x16,
> +						    cxt_matebook_raptor_lake_jack_event);
> +		cxt_matebook_raptor_lake_reconcile(codec);
> +		spec->rpl_recheck_arms = 2;
> +		mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
> +				 msecs_to_jiffies(600));
> +		break;
> +	case HDA_FIXUP_ACT_FREE:
> +		cancel_delayed_work_sync(&spec->rpl_recheck_work);
> +		spec->rpl_recheck_codec = NULL;
> +		break;
> +	}
> +}
> +
>  static const struct hda_fixup cxt_fixups[] = {
>  	[CXT_PINCFG_LENOVO_X200] = {
>  		.type = HDA_FIXUP_PINS,
> @@ -1062,6 +1315,10 @@ static const struct hda_fixup cxt_fixups[] = {
>  			{ }
>  		},
>  	},
> +	[CXT_FIXUP_HUAWEI_MATEBOOK_RPL] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = cxt_fixup_matebook_raptor_lake,
> +	},
>  };
>  
>  static const struct hda_quirk cxt5045_fixups[] = {
> @@ -1164,6 +1421,10 @@ static const struct hda_quirk cxt5066_fixups[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),
>  	SND_PCI_QUIRK(0x19e5, 0x3289, "Huawei Matebook", CXT_FIXUP_HUAWEI_MATEBOOK_HP),
> +	SND_PCI_QUIRK(0x19e5, 0x3291, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
> +	SND_PCI_QUIRK(0x19e5, 0x3292, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
> +	SND_PCI_QUIRK(0x19e5, 0x3293, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
> +	SND_PCI_QUIRK(0x19e5, 0x3294, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
>  	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
>  	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
>  	SND_PCI_QUIRK(0x1d05, 0x3012, "MECHREVO Wujie 15X Pro", CXT_FIXUP_HEADSET_MIC),
> -- 
> 2.56.0
> 
