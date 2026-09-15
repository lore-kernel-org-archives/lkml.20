Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC716472094;
	Tue, 15 Sep 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467415; cv=none; b=pGfNon5WH4HsaxOT4+iIVgeOgC49EyHEXZvwH3H6tOLEuUHy2nsMtXsV7aZxFPRjkcDfHeJK8jLPzNKUhvyd7OfJeF6sk64frxgFaK/JJSF5+56lhmt80bOK0N5WiVzoGxhWxFqiENttn+EBWYPLLT3RoaNzPzHULVAKg0s+R4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467415; c=relaxed/simple;
	bh=C4yRxSfVSIRGnUBQ1sQ3h8/nfsgzMLoa2UEnR8NgmcE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eltIM2aEvvlmfARzGE2eHM9xz8BePXkk1IgtT3g50QyLkejoljCwOtZxTnRL4bRufyr7fdSsvUhR6l6WJcmx7V+lI309cTOYEQNi+NXDMCYuCkjAkCgrO7uckyOa0ixskYJ3ONQGAFEarrKMfWWIjHL/5PLzKvsanoebDOxPN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=j4pb9/cg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rfoTwnzD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HHNMbr9+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZLxul2vQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j4pb9/cg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rfoTwnzD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HHNMbr9+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZLxul2vQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ADD231FD70;
	Tue, 15 Sep 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789467407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYb6fGrCRKEdGMcgtBLtYOoHrz3Xd7vS7twX3p5ntG4=;
	b=j4pb9/cg3turjQztT4XQLq3xNJ12oBRbeLG7PSb5U6vVgbRpkC/lwxWDgtTPQYxtv/YSfe
	D/zkFadNRy+1ESf0e9OiF8YaTaD14p07yh7j6WLy7o/Ecf+ynXHZN1ff35wM6jbJhuZ4J/
	Yfu7BGMsnlhetNsuA/lTo7tvqB+S+kM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789467407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYb6fGrCRKEdGMcgtBLtYOoHrz3Xd7vS7twX3p5ntG4=;
	b=rfoTwnzD/lKS5NkNbDDkBmArfKXfS3SIYIwk1sAsKgOZrQutzDHcZ38MPWylbwBpoBAKle
	NUtJxjKMtdpiuGDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789467403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYb6fGrCRKEdGMcgtBLtYOoHrz3Xd7vS7twX3p5ntG4=;
	b=HHNMbr9+mLdSmbLzkolRHWgtS0pbFIyiQDsZUj17to2JszCR+uJfna6cF8V/C8W9EOp7nN
	OlvKqdZXTl0c8goc68WIQalE/QYRliycDJmqEA7jYSUMItCap591rba2Gcwitrd9tCcIQd
	taGpMFlq0xpCNUJ6U4eobohBfHaRcxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789467403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYb6fGrCRKEdGMcgtBLtYOoHrz3Xd7vS7twX3p5ntG4=;
	b=ZLxul2vQqLUHmJE79qA+Di4Y4QCOy0xGE6HPzuiiNJL+Ud0qo5qHRjMM5uSblW5nLB3804
	xsQCiAsELKIpdXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63D8D13806;
	Tue, 15 Sep 2026 10:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bueUEAsbqWpkIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Sep 2026 10:16:43 +0000
Date: Tue, 15 Sep 2026 12:16:42 +0200
Message-ID: <87fqzan7jp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven 'Steve' Kendall <skend@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
In-Reply-To: <20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org>
References: <20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,jack_detect_work.work:url,msgid.link:url,chromium.org:email,imap1.dmz-prg2.suse.org:helo]

On Tue, 15 Sep 2026 04:11:38 +0200,
Steven 'Steve' Kendall wrote:
> 
> On some models like the Dell Inspiron 15 3520, jack
> detection does not work. This patch switches to
> delayed work to fix jack plug on Chrome OS.
> 
> Assisted-by: LLM
> Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>

The code change looks acceptable, but the patch description gives too
little information.

And, should we apply it unconditionally all models with this codec?


thanks,

Takashi

> ---
> Changes in v3:
> - Unified sleep time for both cases.
> - Removed some superfluous logic after some additional testing.
> - Link to v2: https://patch.msgid.link/20260718-fix-headphone-plug-cirrus-dell-v2-1-f88121570d62@chromium.org
> 
> Changes in v2:
> - Changes from v1 have been removed.
> - New approach uses delayed work and also solves the issue on this machine.
> - I'm now using the latest release of b4. Hopefully this addresses the formatting issues I was having!
> - Link to v1: https://lore.kernel.org/r/20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org
> ---
>  sound/hda/codecs/cirrus/cs8409.c | 43 +++++++++++++++++++++++++++++++++++++---
>  sound/hda/codecs/cirrus/cs8409.h |  2 ++
>  2 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
> index c43ff3ef75b6e..1300571e4b6ae 100644
> --- a/sound/hda/codecs/cirrus/cs8409.c
> +++ b/sound/hda/codecs/cirrus/cs8409.c
> @@ -56,6 +56,10 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
>  }
>  
>  static void cs8409_disable_i2c_clock_worker(struct work_struct *work);
> +static void cs8409_jack_detect_worker(struct work_struct *work);
> +static void cs42l42_run_jack_detect(struct sub_codec *cs42l42);
> +static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr);
> +static int cs8409_i2c_write(struct sub_codec *scodec, unsigned int addr, unsigned int value);
>  
>  static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
>  {
> @@ -69,6 +73,7 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
>  	codec->power_save_node = 1;
>  	mutex_init(&spec->i2c_mux);
>  	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock_worker);
> +	INIT_DELAYED_WORK(&spec->jack_detect_work, cs8409_jack_detect_worker);
>  	snd_hda_gen_spec_init(&spec->gen);
>  
>  	return spec;
> @@ -115,6 +120,28 @@ static void cs8409_disable_i2c_clock_worker(struct work_struct *work)
>  	cs8409_disable_i2c_clock(spec->codec);
>  }
>  
> +/*
> + * cs8409_jack_detect_worker - Perform initial jack detection once hardware is settled
> + *
> + * Defer initial jack detection. On ChromeOS and possibly other platforms this
> + * delay is required for jack detection to work as expected.
> + */
> +static void cs8409_jack_detect_worker(struct work_struct *work)
> +{
> +	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, jack_detect_work.work);
> +	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
> +
> +	if (spec->init_done && spec->build_ctrl_done && !cs42l42->hp_jack_in) {
> +		int reg_ts_status = cs8409_i2c_read(cs42l42, CS42L42_TSRS_PLUG_STATUS);
> +
> +		/* error case */
> +		if (reg_ts_status < 0)
> +			return;
> +
> +		cs42l42_run_jack_detect(cs42l42);
> +	}
> +}
> +
>  /*
>   * cs8409_enable_i2c_clock - Enable I2C clocks
>   * @codec: the codec instance
> @@ -954,6 +981,8 @@ static void cs8409_remove(struct hda_codec *codec)
>  	/* Cancel i2c clock disable timer, and disable clock if left enabled */
>  	cancel_delayed_work_sync(&spec->i2c_clk_work);
>  	cs8409_disable_i2c_clock(codec);
> +	/* Also cancel jack detect work */
> +	cancel_delayed_work_sync(&spec->jack_detect_work);
>  
>  	snd_hda_gen_remove(codec);
>  }
> @@ -1026,6 +1055,8 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
>  	/* Cancel i2c clock disable timer, and disable clock if left enabled */
>  	cancel_delayed_work_sync(&spec->i2c_clk_work);
>  	cs8409_disable_i2c_clock(codec);
> +	/* Also cancel jack detect work */
> +	cancel_delayed_work_sync(&spec->jack_detect_work);
>  
>  	snd_hda_shutup_pins(codec);
>  
> @@ -1196,20 +1227,26 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
>  	case HDA_FIXUP_ACT_INIT:
>  		cs8409_cs42l42_hw_init(codec);
>  		spec->init_done = 1;
> +		/*
> +		 * On resume, schedule delayed jack detect to allow the CS42L42
> +		 * to settle after reset before running detection.
> +		 */
>  		if (spec->init_done && spec->build_ctrl_done
>  			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
> -			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +			schedule_delayed_work(&spec->jack_detect_work,
> +					      msecs_to_jiffies(CS8409_JACK_DETECT_DELAY_MS));
>  		break;
>  	case HDA_FIXUP_ACT_BUILD:
>  		spec->build_ctrl_done = 1;
> -		/* Run jack auto detect first time on boot
> +		/* Schedule jack auto detect first time on boot
>  		 * after controls have been added, to check if jack has
>  		 * been already plugged in.
>  		 * Run immediately after init.
>  		 */
>  		if (spec->init_done && spec->build_ctrl_done
>  			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
> -			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +			schedule_delayed_work(&spec->jack_detect_work,
> +					      msecs_to_jiffies(CS8409_JACK_DETECT_DELAY_MS));
>  		break;
>  	default:
>  		break;
> diff --git a/sound/hda/codecs/cirrus/cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
> index be1714a84fff4..dca9b31aeebfc 100644
> --- a/sound/hda/codecs/cirrus/cs8409.h
> +++ b/sound/hda/codecs/cirrus/cs8409.h
> @@ -247,6 +247,7 @@ enum cs8409_coefficient_index_registers {
>  #define CS8409_CS42L42_AMIC_PIN_NID		CS8409_PIN_ASP1_RECEIVER_A
>  #define CS8409_CS42L42_DMIC_PIN_NID		CS8409_PIN_DMIC1_IN
>  #define CS8409_CS42L42_DMIC_ADC_PIN_NID		CS8409_PIN_DMIC1
> +#define CS8409_JACK_DETECT_DELAY_MS		100
>  
>  /* Dolphin */
>  
> @@ -339,6 +340,7 @@ struct cs8409_spec {
>  	unsigned int i2c_clck_enabled;
>  	unsigned int dev_addr;
>  	struct delayed_work i2c_clk_work;
> +	struct delayed_work jack_detect_work;
>  
>  	unsigned int playback_started:1;
>  	unsigned int capture_started:1;
> 
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
> 
> Best regards,
> --  
> Steven 'Steve' Kendall <skend@chromium.org>
> 
