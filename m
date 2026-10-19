Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569614C461B;
	Mon, 19 Oct 2026 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420916; cv=none; b=Sf5fVKbmVAZMJOaxSyPEhHQN+pA04kSFL3wcF2TyxqnOm5TR/iLKeOhKD0nLGnLq5v+5pKLCApTARm22V3Wf7nwK3i6Y8f0MOisMHZWcquBQrQVSu//cUvZGp+4AbA9LEtbZLQWuZnMlDHAQR1/eJpAgJxf8iHMn43MzIJiUi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420916; c=relaxed/simple;
	bh=abLucj3DA0lI2567MF6574OvpdC0Wl4RoRQGHmLME0E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqGsyFDD9XGMxLa+6sp+rNFWYIS85gXHMhyvvEKaFa9ybNuYJyGdmXBOS3aD26y5mfv3E5xEz50JnwJi9Av705eD0H9HTLdyynCm5h67P0dSJPiAd1zLQw3qgRwp1c8btxxtS23l8zJMNRObMIKITVlDqhGR/1h+0Onqu5zLu6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PfVYSCjx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AiIoj/hv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PfVYSCjx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AiIoj/hv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PfVYSCjx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AiIoj/hv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PfVYSCjx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AiIoj/hv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1211021C3B;
	Mon, 19 Oct 2026 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792420913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jeFZbr16NPzFSVR0K2kQTzpH1Abye0Ktbi4B7E6q67o=;
	b=PfVYSCjxIWkJFGxcrPxGp0RLsR3CkdXssTGBCP2M+etwk09TCJl/Wh7YzZ0KQEPq6DG6Ub
	4VW+MW5xZGVTmuJOQnvUXDBUJ+RvfLzJ/A9yqtdwBj+CDMrEi4xG6bscnqyZKsAmN7b+fI
	kpi1AjACQoybAmAdxO1py/LrNbGbdTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792420913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jeFZbr16NPzFSVR0K2kQTzpH1Abye0Ktbi4B7E6q67o=;
	b=AiIoj/hvxs/CCEaJRlm26movAjYT9FtRDBoF241MWt6umsuYQwMtXdnjGnjTxaBZ3fBFmc
	uSPiVJz0O/XWmTCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PfVYSCjx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="AiIoj/hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792420913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jeFZbr16NPzFSVR0K2kQTzpH1Abye0Ktbi4B7E6q67o=;
	b=PfVYSCjxIWkJFGxcrPxGp0RLsR3CkdXssTGBCP2M+etwk09TCJl/Wh7YzZ0KQEPq6DG6Ub
	4VW+MW5xZGVTmuJOQnvUXDBUJ+RvfLzJ/A9yqtdwBj+CDMrEi4xG6bscnqyZKsAmN7b+fI
	kpi1AjACQoybAmAdxO1py/LrNbGbdTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792420913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jeFZbr16NPzFSVR0K2kQTzpH1Abye0Ktbi4B7E6q67o=;
	b=AiIoj/hvxs/CCEaJRlm26movAjYT9FtRDBoF241MWt6umsuYQwMtXdnjGnjTxaBZ3fBFmc
	uSPiVJz0O/XWmTCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7612136CC;
	Mon, 19 Oct 2026 14:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BYGkIzAs1mpvdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 14:41:52 +0000
Date: Mon, 19 Oct 2026 16:41:52 +0200
Message-ID: <871p9lah1r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Protect channel-map reads against runtime detach
In-Reply-To: <pm-pmb-0b5d6bc7124d0b921f2c-v4-b9738bdeab8823999181@gmail.com>
References: <pm-pmb-0b5d6bc7124d0b921f2c-v4-b9738bdeab8823999181@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1211021C3B
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Mon, 19 Oct 2026 12:29:33 +0200,
Cen Zhang wrote:
> 
> Channel-map controls remain accessible between PCM opens. In-tree HDA
> code publishes the generic controls through add_std_chmaps(), so a
> SNDRV_CTL_IOCTL_ELEM_READ can overlap the final close of the same PCM
> substream.
> 
> pcm_chmap_ctl_get() checks substream->runtime and later reads its channel
> count. Final close clears and frees that runtime under pcm->open_mutex,
> while the control callback holds only controls_rwsem:
> 
>   Control GET                         Final PCM close
>   -----------                         ---------------
>   snd_ctl_elem_read()
>     down_read(controls_rwsem)
>     pcm_chmap_ctl_get()
>       check substream->runtime
>                                       lock(pcm->open_mutex)
>                                       snd_pcm_release_substream()
>                                         snd_pcm_detach_substream()
>                                           substream->runtime = NULL
>                                           kfree(runtime)
>                                       unlock(pcm->open_mutex)
>       substream->runtime->channels
>         NULL or freed-pointer access
>     up_read(controls_rwsem)
> 
> Reloading the cleared field can fault through NULL, while retaining the
> old pointer can access freed storage. controls_rwsem keeps the control
> alive, but does not serialize the matching PCM close.
> 
> Copy the channel count under open_mutex and use that scalar for the map
> lookup. Use trylock with -EBUSY because snd_pcm_dev_disconnect() takes
> open_mutex before removing controls under controls_rwsem; blocking in
> the reverse order from GET could deadlock.
> 
> Fixes: 2d3391ec0ecc ("ALSA: PCM: channel mapping API implementation")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> 
> ---
> 
> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 4d665b4148d7059402a55abb62fb24da8ff73f69..1ec7db324196f60d8c72a879c62ddae0a90ac0ff 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -2496,6 +2496,7 @@ static int pcm_chmap_ctl_get(struct snd_kcontrol *kcontrol,
>  	unsigned int idx = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
>  	struct snd_pcm_substream *substream;
>  	const struct snd_pcm_chmap_elem *map;
> +	unsigned int channels;
>  
>  	if (!info->chmap)
>  		return -EINVAL;
> @@ -2504,11 +2505,20 @@ static int pcm_chmap_ctl_get(struct snd_kcontrol *kcontrol,
>  		return -ENODEV;
>  	memset(ucontrol->value.integer.value, 0,
>  	       sizeof(long) * info->max_channels);
> -	if (!substream->runtime)
> -		return 0; /* no channels set */
> +	/*
> +	 * PCM disconnect takes open_mutex before removing controls.
> +	 * Use trylock to avoid a deadlock with controls_rwsem.
> +	 */
> +	scoped_cond_guard(mutex_try, return -EBUSY,
> +			  &info->pcm->open_mutex) {
> +		if (!substream->runtime)
> +			return 0; /* no channels set */
> +		channels = substream->runtime->channels;
> +	}
>  	for (map = info->chmap; map->channels; map++) {
>  		int i;
> -		if (map->channels == substream->runtime->channels &&
> +
> +		if (map->channels == channels &&
>  		    valid_chmap_channels(info, map->channels)) {
>  			for (i = 0; i < map->channels; i++)
>  				ucontrol->value.integer.value[i] = map->map[i];

Taking a mutex from the kcontrol here sounds a bit scary, and
moreover, we need a saner and safer way to get the runtime reference
in general.  OTOH, for a workaround of this issue, this code change
looks  simple enough, so I took as is now.


thanks,

Takashi
