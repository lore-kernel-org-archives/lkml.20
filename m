Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5171C3B3C0A;
	Sun, 18 Oct 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792312873; cv=none; b=YSMWx+yXrV0IT7XZuJt2OHcIUseAyYAXihX/I0JP+sOAAVTcQ11DOPCe5CpCT7qG1NUMpvEr1Uloln0rLMG47nPolHSlEoSui3PQRcwcgJ96N3lsENaCVK3/5uhkV8Hk93oJ/y1ryx9tkXSor+SojxhJMyrpHpa38Rz0siIUrJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792312873; c=relaxed/simple;
	bh=B3YaPY/TgET1ggpri53uiLDMG3UVC/Ra9mz5DuyyvTo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KwRG34PDAEdiEhcoNBCv6p7CyBS8zxS6s72RKkti6CnF2vChAIYNSpJudKp7X+C4GxqXK5fshQ0XAqnf5SEHUnMJGU3vYIJrP5koEJXqb0dLvI6rD/kZFd6j+413m9ELE78RbQe5rhhzfNb0dJlUD2Kq5HITKbkDe4rwHexLxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DlPuQdlg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6UI4S+MN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1a8ZquDX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VjkCSVh/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DlPuQdlg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6UI4S+MN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1a8ZquDX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VjkCSVh/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 361BA21CB7;
	Sun, 18 Oct 2026 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Z3ZTMxsgyyM9Mqe31xOIpN4fjhC9Vk/6zXIn7DCvs8=;
	b=DlPuQdlg+A913RMYySOGo9C3lL46Euat4rqKcd6cmQULDQKCrhi820t2rL6V4WmxkTKcAy
	/IHxmNqLZbYHzjT98HQL70lMDyaj60QZj09BuWY2I2qmFLJKO2XPNjYcAiq1T+gTRQ/YAV
	sd5L1ueyllkrL4zu/R+4kqIk0op7wiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312869;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Z3ZTMxsgyyM9Mqe31xOIpN4fjhC9Vk/6zXIn7DCvs8=;
	b=6UI4S+MN5phoHAbAnXa+WsJxWVJn+SS12vHasbVQOL/YeqtafW7Xz1ek8LelPTxWgMvLn8
	X/dDHFedJ9lz8wDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Z3ZTMxsgyyM9Mqe31xOIpN4fjhC9Vk/6zXIn7DCvs8=;
	b=1a8ZquDXg/Pb4oCP/vukVX4hLEKwpQs5RNmh106k/o+09+pQx/9b6XFhs3I/MGjjPQL7IK
	RjXxIQfbpCzF4l37WhKohIv3eruy+qC+WTl0d00qS7PXH3Ul+FYIOAeaokv4FWz8cIJyOJ
	WaJZM5/6tXNldNyyWv23BLKA2FZVec4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Z3ZTMxsgyyM9Mqe31xOIpN4fjhC9Vk/6zXIn7DCvs8=;
	b=VjkCSVh/tgat07Kq1wnFGEZut6dRoqJefeC6ReWTum3w7+Gp+Ih+CcVTHye8fk0m6HZLFp
	2cL5LBXB+z8EbiCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE47D134B3;
	Sun, 18 Oct 2026 08:41:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p0HSHyOG1GoGTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 18 Oct 2026 08:41:07 +0000
Date: Sun, 18 Oct 2026 10:41:07 +0200
Message-ID: <87zewbz9i4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v2] ALSA: oss: Keep emulation modules loaded until object teardown
In-Reply-To: <pm-pmb-26d66390a25fec9fad6c-v4-a7d8a5d3db28c5bca90a@gmail.com>
References: <pm-pmb-26d66390a25fec9fad6c-v4-a7d8a5d3db28c5bca90a@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,suse.de,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]

On Sat, 17 Oct 2026 18:04:28 +0200,
Cen Zhang wrote:
> 
> OSS proc entries and notifier callbacks can remain in use without an
> open OSS device file. Unloading snd-pcm-oss on a live card can remove a
> PCM's OSS proc entry while a repeated snd_card_register() walks the same
> entry tree:
> 
>   OSS PCM module unload                 Card registration
>   ---------------------                 -----------------
>   snd_pcm_oss_proc_done()
>     snd_info_free_entry(entry)
>       proc_remove(entry->p)
>       clear entry->p
>                                         snd_info_card_register()
>                                           snd_info_register()
>                                             republish entry
>       unlink and free entry
> 
> The new proc node then retains a pointer to freed storage. Mixer OSS
> also allows module exit to free an adapter while a card notification
> still uses it.
> 
> Following Takashi's suggestion, hold an OSS PCM module reference for
> each PCM registered with its notifier, and a mixer OSS module reference
> for each card adapter. Release them at final unregister or FREE, after
> the corresponding proc entries and adapter have been removed. Normal
> module unload can no longer initiate that removal on a live object.
> 
> Keep the PCM pin independent of oss.reg: disconnect clears that field,
> and unmapped PCMs also participate in notifier dispatch. Record whether
> a reference was acquired so BUILD-state and creation-error cleanup do
> not issue an unmatched module_put().
> 
> Protect the final PCM notifier traversal with register_mutex, matching
> notifier removal. For mixer OSS, serialize callback publication,
> withdrawal and dispatch in the core under a lifecycle mutex. Module exit
> then waits for a callback which dropped the last reference
> to return before withdrawing the callback and releasing module text.
> 
> Ignore duplicate mixer REGISTER notifications: module loading can find
> a card whose DISCONNECT has already withdrawn the mixer minor while
> retaining the adapter. Replacing it would leak the old adapter and pin.
> Keep existing card enumeration in the OSS module and drop its card
> references after the core dispatch helper returns, outside the mutex.
> The new locking is confined to lifecycle notifications.
> 
> Partial HDA codec teardown can still remove a PCM while its card stays
> registered; that object-lifetime problem requires separate treatment.
> 
> Fixes: 2471b6c80a70 ("ALSA: info: Register proc entries recursively, too")
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM
> ---
> Changes in v2:
> - Follow Takashi's suggestion to pin OSS modules until object teardown.
> - Track successful PCM pins across disconnect and unregistered cleanup.
> - Protect final PCM notifier traversal and mixer callback withdrawal across
>   the last module reference drop.
> - Keep card enumeration in the OSS module and prevent duplicate mixer
>   REGISTER notifications from replacing a disconnected adapter.
> - Leave partial HDA codec teardown for a separate fix.

Thanks, most of the stuff looks good, but a couple of points to
consider:

- Please split PCM and OSS code to individual patches.

- The new module_ref is a bit misleading name; it's no reference
  counter but just a boolean flag to indicate whether the PCM OSS
  stuff was registered or not.  Maybe 'bool registered' would be more
  intuitive?


thanks,

Takashi

> 
> Link to v1: https://lore.kernel.org/r/pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com
> 
>  include/sound/core.h       |  3 ++-
>  include/sound/pcm_oss.h    |  1 +
>  sound/core/init.c          | 29 +++++++++++++++++++++--------
>  sound/core/oss/mixer_oss.c | 36 ++++++++++++++++++++----------------
>  sound/core/oss/pcm_oss.c   | 12 ++++++++++++
>  sound/core/pcm.c           |  6 ++++--
>  6 files changed, 60 insertions(+), 27 deletions(-)
> 
> diff --git a/include/sound/core.h b/include/sound/core.h
> index 657b12e1e95b..d6584967fd49 100644
> --- a/include/sound/core.h
> +++ b/include/sound/core.h
> @@ -301,7 +301,8 @@ int snd_card_locked(int card);
>  #define SND_MIXER_OSS_NOTIFY_REGISTER	0
>  #define SND_MIXER_OSS_NOTIFY_DISCONNECT	1
>  #define SND_MIXER_OSS_NOTIFY_FREE	2
> -extern int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int cmd);
> +void snd_mixer_oss_set_notify(int (*callback)(struct snd_card *card, int cmd));
> +void snd_mixer_oss_notify(struct snd_card *card, int cmd);
>  #endif
>  
>  int snd_card_new(struct device *parent, int idx, const char *xid,
> diff --git a/include/sound/pcm_oss.h b/include/sound/pcm_oss.h
> index c96f23c7755b..fa78d7e3a3ee 100644
> --- a/include/sound/pcm_oss.h
> +++ b/include/sound/pcm_oss.h
> @@ -70,6 +70,7 @@ struct snd_pcm_oss_stream {
>  struct snd_pcm_oss {
>  	int reg;
>  	unsigned int reg_mask;
> +	bool module_ref;
>  };
>  
>  #endif /* __SOUND_PCM_OSS_H */
> diff --git a/sound/core/init.c b/sound/core/init.c
> index 9deb5e920d0d..d518cb838777 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -82,8 +82,24 @@ static int module_slot_match(struct module *module, int idx)
>  }
>  
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -int (*snd_mixer_oss_notify_callback)(struct snd_card *card, int free_flag);
> -EXPORT_SYMBOL(snd_mixer_oss_notify_callback);
> +static DEFINE_MUTEX(mixer_oss_notify_mutex);
> +static int (*mixer_oss_notify_callback)(struct snd_card *card, int cmd);
> +
> +void snd_mixer_oss_notify(struct snd_card *card, int cmd)
> +{
> +	guard(mutex)(&mixer_oss_notify_mutex);
> +	if (mixer_oss_notify_callback)
> +		mixer_oss_notify_callback(card, cmd);
> +}
> +EXPORT_SYMBOL(snd_mixer_oss_notify);
> +
> +void snd_mixer_oss_set_notify(int (*callback)(struct snd_card *, int))
> +{
> +	/* Wait for callbacks, including a final module_put(), to return. */
> +	guard(mutex)(&mixer_oss_notify_mutex);
> +	mixer_oss_notify_callback = callback;
> +}
> +EXPORT_SYMBOL(snd_mixer_oss_set_notify);
>  #endif
>  
>  static int check_empty_slot(struct module *module, int slot)
> @@ -508,8 +524,7 @@ void snd_card_disconnect(struct snd_card *card)
>  	/* at this point, they cannot respond to any calls except release() */
>  
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -	if (snd_mixer_oss_notify_callback)
> -		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_DISCONNECT);
> +	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_DISCONNECT);
>  #endif
>  
>  	/* notify all devices that we are disconnected */
> @@ -567,8 +582,7 @@ static int snd_card_do_free(struct snd_card *card)
>  
>  	card->releasing = true;
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -	if (snd_mixer_oss_notify_callback)
> -		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
> +	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_FREE);
>  #endif
>  	snd_device_free_all(card);
>  	kfree(card->components);
> @@ -912,8 +926,7 @@ int snd_card_register(struct snd_card *card)
>  		return err;
>  
>  #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
> -	if (snd_mixer_oss_notify_callback)
> -		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_REGISTER);
> +	snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_REGISTER);
>  #endif
>  	return 0;
>  }
> diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
> index f1fa42e634fc..a51bc68473e6 100644
> --- a/sound/core/oss/mixer_oss.c
> +++ b/sound/core/oss/mixer_oss.c
> @@ -1309,13 +1309,22 @@ static int snd_mixer_oss_free1(void *private)
>  static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
>  {
>  	struct snd_mixer_oss *mixer;
> +	int err;
>  
>  	if (cmd == SND_MIXER_OSS_NOTIFY_REGISTER) {
> -		int idx, err;
> +		int idx;
> +
> +		/* Module loading and card registration can both notify us. */
> +		if (card->mixer_oss)
> +			return 0;
>  
>  		mixer = kzalloc_objs(*mixer, 2);
>  		if (mixer == NULL)
>  			return -ENOMEM;
> +		if (!try_module_get(THIS_MODULE)) {
> +			kfree(mixer);
> +			return -ENODEV;
> +		}
>  		mutex_init(&mixer->reg_mutex);
>  		err = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MIXER,
>  					      card, 0,
> @@ -1325,6 +1334,7 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
>  				"unable to register OSS mixer device %i:%i\n",
>  				card->number, 0);
>  			kfree(mixer);
> +			module_put(THIS_MODULE);
>  			return err;
>  		}
>  		mixer->oss_dev_alloc = 1;
> @@ -1358,7 +1368,10 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
>  		if (cmd == SND_MIXER_OSS_NOTIFY_DISCONNECT)
>  			return 0;
>  		snd_mixer_oss_proc_done(mixer);
> -		return snd_mixer_oss_free1(mixer);
> +		err = snd_mixer_oss_free1(mixer);
> +		if (!err)
> +			module_put(THIS_MODULE);
> +		return err;
>  	}
>  	return 0;
>  }
> @@ -1367,12 +1380,12 @@ static int __init alsa_mixer_oss_init(void)
>  {
>  	struct snd_card *card;
>  	int idx;
> -	
> -	snd_mixer_oss_notify_callback = snd_mixer_oss_notify_handler;
> +
> +	snd_mixer_oss_set_notify(snd_mixer_oss_notify_handler);
>  	for (idx = 0; idx < SNDRV_CARDS; idx++) {
>  		card = snd_card_ref(idx);
>  		if (card) {
> -			snd_mixer_oss_notify_handler(card, SND_MIXER_OSS_NOTIFY_REGISTER);
> +			snd_mixer_oss_notify(card, SND_MIXER_OSS_NOTIFY_REGISTER);
>  			snd_card_unref(card);
>  		}
>  	}
> @@ -1381,17 +1394,8 @@ static int __init alsa_mixer_oss_init(void)
>  
>  static void __exit alsa_mixer_oss_exit(void)
>  {
> -	struct snd_card *card;
> -	int idx;
> -
> -	snd_mixer_oss_notify_callback = NULL;
> -	for (idx = 0; idx < SNDRV_CARDS; idx++) {
> -		card = snd_card_ref(idx);
> -		if (card) {
> -			snd_mixer_oss_notify_handler(card, SND_MIXER_OSS_NOTIFY_FREE);
> -			snd_card_unref(card);
> -		}
> -	}
> +	/* Live adapters hold module references and prevent normal unload. */
> +	snd_mixer_oss_set_notify(NULL);
>  }
>  
>  module_init(alsa_mixer_oss_init)
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> index bd19328dca9e..cc239929dfca 100644
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -3151,6 +3151,12 @@ static void register_oss_dsp(struct snd_pcm *pcm, int index)
>  
>  static int snd_pcm_oss_register_minor(struct snd_pcm *pcm)
>  {
> +	if (pcm->oss.module_ref)
> +		return 0;
> +	if (!try_module_get(THIS_MODULE))
> +		return -ENODEV;
> +	pcm->oss.module_ref = true;
> +
>  	pcm->oss.reg = 0;
>  	if (dsp_map[pcm->card->number] == (int)pcm->device) {
>  		char name[128];
> @@ -3205,8 +3211,14 @@ static int snd_pcm_oss_disconnect_minor(struct snd_pcm *pcm)
>  
>  static int snd_pcm_oss_unregister_minor(struct snd_pcm *pcm)
>  {
> +	/* BUILD-state and creation-error cleanup need not have registered us. */
> +	if (!pcm->oss.module_ref)
> +		return 0;
> +
>  	snd_pcm_oss_disconnect_minor(pcm);
>  	snd_pcm_oss_proc_done(pcm);
> +	pcm->oss.module_ref = false;
> +	module_put(THIS_MODULE);
>  	return 0;
>  }
>  
> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> index c133f23418fe..35ece386d1a2 100644
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -853,8 +853,10 @@ static int snd_pcm_free(struct snd_pcm *pcm)
>  {
>  	if (!pcm)
>  		return 0;
> -	if (!pcm->internal)
> -		pcm_call_notify(pcm, n_unregister);
> +	if (!pcm->internal) {
> +		scoped_guard(mutex, &register_mutex)
> +			pcm_call_notify(pcm, n_unregister);
> +	}
>  	if (pcm->private_free)
>  		pcm->private_free(pcm);
>  	snd_pcm_lib_preallocate_free_for_all(pcm);
> 
> base-commit: 2533eecf592c2d7434170bf9669a4270fd594ae2
> -- 
> 2.43.0
> 
