Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC648643C;
	Mon, 14 Sep 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403048; cv=none; b=S43BAIgcolFC3PYPlRCSlDUqgYFH68uLb4UXk/uGWL7mmvcDGsuseJocmmkiESgXLmaHCyTEF77vfttBqGaWjPEcjYs1Kotk3PpI2++hASCwhNw6FXqq1QGm05Uu48zeWJoGzi8DHyuIjmTB7QS4BKkje2tA0vDWrOJ2cxvYw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403048; c=relaxed/simple;
	bh=+NdozowMdphetA0zQFAJRhWplAmxKijy+gb2jeGjyPg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsQGg32jQbJTDKA7EhFwuEA7150sNNRG0WCQBc3KQzJa+1tmbYC1PvtcSyco2+7RxEP5/5wfWU+NkVvSzjR6I6FvxAOe2oDtUPTbmc9R+15b1x9rhkVSDOEVs9yTtPfohJ9PSHb7nIZDeJrzlBtZlWIje/00rIaLO+6N5OCaWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tFbQgBrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2buZGqmm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YmN6irtK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YBDS0iPB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tFbQgBrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2buZGqmm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YmN6irtK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YBDS0iPB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3A8C21A05;
	Mon, 14 Sep 2026 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789403041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6lqfpXTVo+dnwW2VxAaJ5wF0ATAmAFT8iz2ps6p218=;
	b=tFbQgBrSAspIeJ4HQklfUHzgOxEsGs6s7odgea4+EClvDnOQNtFZs2GDM/xy0JalbF1mzL
	3ERClIUUdvWm/BndhdolcBUWKF+b1SqJcXxUqi/V/sxu6NGw7peLSf+GLav6wWCWybdHlu
	lkKPXD/rwDYOXdIa5tiXbnRKRldUKCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789403041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6lqfpXTVo+dnwW2VxAaJ5wF0ATAmAFT8iz2ps6p218=;
	b=2buZGqmmENbdoBC2LFh49mFNEe2YBjHe5+pA4RghO0LTulAnW+6CkjRLhc36fExrPV5JDm
	CjOVdIhi+eebkpBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789403036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6lqfpXTVo+dnwW2VxAaJ5wF0ATAmAFT8iz2ps6p218=;
	b=YmN6irtKjlA2JzWDLSdG5Jt33G5Qhd7m5Ubh+PhI+ltDoWO8MqSZO81VTbBOO9PnTfeSop
	KM0EyHCYdfKR6eh+CGFrrYE2xixG8u5kNYQqtagtyY2z6246hDo30VHZ3KYIeo/K01cEWb
	v6SwWjNNJEd9+BRmKEfdQS8ePktmRKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789403036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W6lqfpXTVo+dnwW2VxAaJ5wF0ATAmAFT8iz2ps6p218=;
	b=YBDS0iPB/eCBGn3X/n4i/9gYikja6SUXgRQc+wpQn9q46mcayZX+fwZTpu2E/n2k95r1lT
	KekQaL8alUdJcDCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C12D13515;
	Mon, 14 Sep 2026 16:23:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O0TiJJwfqGr1JgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:23:56 +0000
Date: Mon, 14 Sep 2026 18:23:56 +0200
Message-ID: <871pavol7n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rithvik Vibhu <rithvikvibhu@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix Acer Nitro 5 AN515-57 mic resume
In-Reply-To: <20260904231545.33505-1-rithvikvibhu@gmail.com>
References: <20260904231545.33505-1-rithvikvibhu@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Sat, 05 Sep 2026 01:15:45 +0200,
Rithvik Vibhu wrote:
> 
> The existing pin-configuration quirk exposes headset mic pin 0x19, but
> the ALC295 loses the correct combo-jack state across suspend-to-RAM
> (S3). After resume, pin 0x19 can remain falsely present after unplug and
> the capture mixer can remain routed away from the internal mic on pin
> 0x12. The failure occurs on both 6.12 and v7.2-rc7.
> 
> Give subsystem 1025:1539 a model-specific fixup which initializes the
> Acer combo-jack coefficients, enables the full Realtek CTIA/OMTP
> headset state machine, gates the headset mic with the reliable
> headphone pin 0x21, and feeds the corrected cached jack state through
> generic HDA mic autoswitching. This keeps the actual capture mux
> synchronized across boot, hotplug, unplug and S3 resume.
> 
> Apply the correction from both the headphone and microphone callback
> paths. A direct event from mic pin 0x19 otherwise bypasses the headphone
> hook and can restore the unreliable raw pin sense. Invalidate and
> refetch pin 0x21 when handling such an event before deriving the
> corrected microphone state.
> 
> Pin 0x21 indicates that a combo-jack plug is present but cannot
> distinguish three-pole headphones from a four-pole headset.
> Consequently, as with other headphone-gated mic configurations, a
> three-pole plug is exposed as a headset mic.
> 
> Tested with cold boot and repeated S3 cycles in the unplugged and
> four-pole-headset states, including unplug and reinsert after resume.
> 
> Fixes: 51db05283f7c ("ALSA: hda/realtek: Enable headset mic for Acer Nitro 5")
> Cc: stable@vger.kernel.org # 6.12+
> Assisted-by: LLM
> Signed-off-by: Rithvik Vibhu <rithvikvibhu@gmail.com>

Thanks for the patch.

I guess I understand most of the intentions in your code, but it looks
a bit too complex and handling things unnaturally.  After all, there
is no similar code there, which already appearing suspicious.

Can this be handled better with the gating stuff in
sound/hda/common/jack.c, instead?


Takashi


> ---
> The 6.12.y backport requires adaptation because the Realtek codec code
> is located in sound/pci/hda/patch_realtek.c there.
> 
> base-commit: 3b26ceef88c110f4d188387cffa0df78657be904
> 
>  sound/hda/codecs/realtek/alc269.c | 105 +++++++++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 95b40a177..f1a83908e 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -3740,6 +3740,103 @@ static void alc2xx_fixup_headset_mic(struct hda_codec *codec,
>  	}
>  }
>  
> +static void alc295_acer_nitro_mic_autoswitch(struct hda_codec *codec,
> +					     struct hda_jack_callback *jack)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	struct hda_jack_tbl *hp_jack, *mic_jack;
> +	hda_nid_t hp_pin = alc_get_hp_pin(spec);
> +	bool auto_mic = spec->gen.auto_mic;
> +	bool hp_present;
> +
> +	hp_jack = snd_hda_jack_tbl_get(codec, hp_pin);
> +	mic_jack = snd_hda_jack_tbl_get(codec, 0x19);
> +	if (!hp_jack || !mic_jack) {
> +		codec_warn(codec, "failed to find Acer Nitro combo-jack entries\n");
> +		return;
> +	}
> +
> +	/* A mic callback must not reuse a possibly stale cached HP sense. */
> +	if (jack && jack->nid == 0x19)
> +		hp_jack->jack_dirty = 1;
> +	hp_present = snd_hda_jack_detect(codec, hp_pin);
> +
> +	/*
> +	 * The codec reports a stale or inverted presence state for mic pin 0x19
> +	 * after S3.  Pin 0x21 continues to track the shared combo jack reliably,
> +	 * so use it as the presence source for 0x19.  Leave the entry clean so
> +	 * the normal report pass does not immediately replace this value with a
> +	 * broken raw pin-sense read.
> +	 */
> +	mic_jack->pin_sense &= ~AC_PINSENSE_PRESENCE;
> +	if (hp_present)
> +		mic_jack->pin_sense |= AC_PINSENSE_PRESENCE;
> +	mic_jack->jack_dirty = 0;
> +
> +	/* Route the actual capture mux from the corrected jack state. */
> +	spec->gen.auto_mic = 1;
> +	snd_hda_gen_mic_autoswitch(codec, jack);
> +	spec->gen.auto_mic = auto_mic;
> +}
> +
> +static void alc295_acer_nitro_hp_automute(struct hda_codec *codec,
> +					  struct hda_jack_callback *jack)
> +{
> +	/* Refresh the reliable HP jack and the Realtek headset mode first. */
> +	alc_update_headset_jack_cb(codec, jack);
> +	alc295_acer_nitro_mic_autoswitch(codec, jack);
> +}
> +
> +static void alc295_fixup_acer_nitro_headset_mode(struct hda_codec *codec,
> +						 const struct hda_fixup *fix,
> +						 int action)
> +{
> +	struct alc_spec *spec = codec->spec;
> +	static const struct hda_pintbl pincfgs[] = {
> +		{ 0x19, 0x03a1103c },
> +		{ }
> +	};
> +
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		snd_hda_apply_pincfgs(codec, pincfgs);
> +		alc_update_coef_idx(codec, 0x45, 0xf << 12 | 1 << 10, 5 << 12);
> +		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
> +	}
> +
> +	alc271_hp_gate_mic_jack(codec, fix, action);
> +	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
> +
> +	if (action == HDA_FIXUP_ACT_PROBE) {
> +		int int_mic_idx = -1, headset_mic_idx = -1;
> +		int i;
> +
> +		for (i = 0; i < spec->gen.input_mux.num_items; i++) {
> +			if (spec->gen.imux_pins[i] == 0x12)
> +				int_mic_idx = i;
> +			else if (spec->gen.imux_pins[i] == 0x19)
> +				headset_mic_idx = i;
> +		}
> +		if (int_mic_idx < 0 || headset_mic_idx < 0) {
> +			codec_warn(codec,
> +				   "failed to find Acer Nitro mic mux entries\n");
> +			return;
> +		}
> +
> +		spec->gen.am_num_entries = 2;
> +		spec->gen.am_entry[0] = (struct automic_entry) {
> +			.pin = 0x12,
> +			.idx = int_mic_idx,
> +		};
> +		spec->gen.am_entry[1] = (struct automic_entry) {
> +			.pin = 0x19,
> +			.idx = headset_mic_idx,
> +		};
> +		spec->gen.hp_automute_hook = alc295_acer_nitro_hp_automute;
> +		spec->gen.mic_autoswitch_hook =
> +			alc295_acer_nitro_mic_autoswitch;
> +	}
> +}
> +
>  static void alc245_fixup_hp_spectre_x360_eu0xxx(struct hda_codec *codec,
>  					  const struct hda_fixup *fix, int action)
>  {
> @@ -4335,6 +4432,7 @@ enum {
>  	ALC287_FIXUP_THINKPAD_I2S_SPK,
>  	ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
>  	ALC2XX_FIXUP_HEADSET_MIC,
> +	ALC295_FIXUP_ACER_NITRO_HEADSET_MODE,
>  	ALC289_FIXUP_DELL_CS35L41_SPI_2,
>  	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
>  	ALC256_FIXUP_HEADPHONE_AMP_VOL,
> @@ -6854,6 +6952,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc2xx_fixup_headset_mic,
>  	},
> +	[ALC295_FIXUP_ACER_NITRO_HEADSET_MODE] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc295_fixup_acer_nitro_headset_mode,
> +	},
>  	[ALC289_FIXUP_DELL_CS35L41_SPI_2] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = cs35l41_fixup_spi_two,
> @@ -7177,7 +7279,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57",
> +		      ALC295_FIXUP_ACER_NITRO_HEADSET_MODE),
>  	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC287_FIXUP_ACER_MICMUTE_LED),
>  	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1025, 0x159e, "Acer Nitro 5 AN515-46", ALC2XX_FIXUP_HEADSET_MIC),
> -- 
> 2.55.0
