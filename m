Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768464DCB05;
	Mon, 19 Oct 2026 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419865; cv=none; b=bVunbbD83S5KtHYdFc4cIa6TxtBv4EtT9DAgBB6UN6Wh8k/Q/aC64sBlHVQR78i+JOoAQCsD8U7q1guQ3ZSXOldzqDcarx9AAIDI8Al8mpv3fUJVkrjR/0pBZg3ARadvvfwHeXfkxrm3JhezE+sK8ogG2s8gVo9FPkGORTDj684=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419865; c=relaxed/simple;
	bh=3B7MdByhrk1EPptVvUzibw3UCMpOimig5+KAKzMrv7E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BnX7gDGP1OtQVXu9k1H+fOa2MtAXLYUODuTSWIqrleaxdlQfYytYExBkUGQF3MwgeBqO+eU77F/3nOS0Od3wNC4W4adZQXRgbohbRokdttu6VvFhh1YmNYfz1CQlVd7uL+z6vDPGPm2R2uKk27wO++mD67Btm5OMigPHj6ekSrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ue6iEI6Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cjR2H2CO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ue6iEI6Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cjR2H2CO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ue6iEI6Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cjR2H2CO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ue6iEI6Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cjR2H2CO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 839121F444;
	Mon, 19 Oct 2026 14:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792419862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RQLVvVc/eHmNiNUzGm2R6MgNdvxEfxgILqRlIV9WxuU=;
	b=ue6iEI6YZGF3kxLC1V0AkJbq/pKtcwFUPQIPj220eDldbwMnmrvT/8m0y8xnUdKKrWTMrX
	VnT9DOb2YK/2lXIm3gP5Zoe2aq6WnZZIyOKsqn3l4/ctgJNMbnf9IgYiwCqN9DuI/1cI5z
	cqXkPar4bNqXew4DU1Wk/d7MP+etdZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792419862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RQLVvVc/eHmNiNUzGm2R6MgNdvxEfxgILqRlIV9WxuU=;
	b=cjR2H2COztLY2Lan0A/gb6zABAFDt3n2qQ14ueSz/Ifit3SiJ+tv69giMxtjjXj6YDXmND
	mCMOObc4X4OMWQCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ue6iEI6Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cjR2H2CO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792419862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RQLVvVc/eHmNiNUzGm2R6MgNdvxEfxgILqRlIV9WxuU=;
	b=ue6iEI6YZGF3kxLC1V0AkJbq/pKtcwFUPQIPj220eDldbwMnmrvT/8m0y8xnUdKKrWTMrX
	VnT9DOb2YK/2lXIm3gP5Zoe2aq6WnZZIyOKsqn3l4/ctgJNMbnf9IgYiwCqN9DuI/1cI5z
	cqXkPar4bNqXew4DU1Wk/d7MP+etdZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792419862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RQLVvVc/eHmNiNUzGm2R6MgNdvxEfxgILqRlIV9WxuU=;
	b=cjR2H2COztLY2Lan0A/gb6zABAFDt3n2qQ14ueSz/Ifit3SiJ+tv69giMxtjjXj6YDXmND
	mCMOObc4X4OMWQCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 311A6136CC;
	Mon, 19 Oct 2026 14:24:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jw0cAhYo1mqLZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 14:24:22 +0000
Date: Mon, 19 Oct 2026 16:24:21 +0200
Message-ID: <874iehahuy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Remove channel-map controls before freeing substreams
In-Reply-To: <pm-pmb-4a207d9ef3a3597a74a4-v4-80b0113669b1a62fbbe9@gmail.com>
References: <pm-pmb-4a207d9ef3a3597a74a4-v4-80b0113669b1a62fbbe9@gmail.com>
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
X-Spam-Level: 
X-Rspamd-Queue-Id: 839121F444
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, 19 Oct 2026 12:01:46 +0200,
Cen Zhang wrote:
> 
> A late HDA codec bind on an already registered card builds new PCMs
> before registering them. add_std_chmaps() publishes generic channel-map
> controls during this BUILD stage. If an earlier chmap succeeds and a
> later allocation fails, probe cleanup frees the BUILD PCM while the
> card's control device remains accessible.
> 
> These generic controls are added directly by snd_pcm_add_chmap_ctls();
> snd_hda_ctls_clear() only removes codec-tracked mixer controls. BUILD
> devices also skip dev_disconnect. snd_pcm_free_stream() then frees the
> substreams before free_chmap() withdraws their generic control:
> 
>   Late HDA codec bind / rollback        Control GET on the live card
>   ------------------------------       ----------------------------
>   hda_codec_driver_probe()
>     snd_hda_codec_build_pcms()
>       PCM is BUILD
>     snd_hda_codec_build_controls()
>       add_std_chmaps()
>         publish an earlier chmap
>         later allocation: -ENOMEM
>     snd_hda_codec_cleanup_for_unbind()
>       snd_hda_ctls_clear()
>         generic chmap remains
>       codec_release_pcms()
>         snd_device_free()
>           BUILD: skip dev_disconnect
>           snd_pcm_free_stream()
>             kfree(substream)
>                                        snd_ctl_elem_read()
>                                          down_read(controls_rwsem)
>                                          pcm_chmap_ctl_get()
>                                            walk freed substream
>             free_chmap()
>               snd_ctl_remove()
>                 wait for GET
>                                          up_read(controls_rwsem)
> 
> The control read lock cannot protect a substream already freed before
> control removal starts. The failure above occurs before
> snd_card_register(), so the PCM has not transitioned out of BUILD.
> 
> Move free_chmap() before the substream free loop. Its snd_ctl_remove()
> withdraws the control and drains readers under controls_rwsem before any
> substream is released. Normal registered-device disconnect already
> removes the control, so the later call remains harmless on that path.
> 
> Fixes: 2d3391ec0ecc ("ALSA: PCM: channel mapping API implementation")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied now.  Thanks.


Takashi
