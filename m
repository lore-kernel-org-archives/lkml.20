Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741B13790B;
	Sat, 17 Oct 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225340; cv=none; b=k76VoEEmhKTAXHwXjZoxuw55gQ3EjjEmJbk4aic7Pr8T3bfxVwoJJf5kbNaYnTY5ph37THJhLwXAcFYuuKzhHvvf+/jZK9pwouCpQOU/0n9offPqeKmCsOIECmoQ0O2IW4zq8/265qiHRWnufQ/ixzJdXzJkbzWB9PXYc2C6Z7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225340; c=relaxed/simple;
	bh=Gg957mHYAAWMYAihy378T/4kzalWQSyQ1gwNDIaZzPQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EqHJeQeXJhnu9LOVKuxjrKBlRbKK3qiOHgQM99au+n7HHMA7mg/njZwFzXteE/sIDnuHoQho/fV7K7GWbFZsdj+4w3ClYMa+oNWWdBZw0d9jkF50qTRQo9Ybu7TpsIcOgefkhJ/6kQam6ZLhB21QhcukZ4pLf7FIUgbJ6cCt4Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MDNjEid4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SPCGB5yE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hygChbwm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+UsN1DIm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MDNjEid4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SPCGB5yE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hygChbwm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+UsN1DIm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F3D11F74C;
	Sat, 17 Oct 2026 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFtEiHl6F37lzneEJSukh91KBvyeE72zd/sae8MsorI=;
	b=MDNjEid4O2CsCSdj++KALHftUQ5xRZ5Qa77oUtLHFa1pUVlRwD/591G4fR5Aldz2li5aw8
	XNoGDX8xpHzKSgoAA/J/H1ZqDeZEPXRMlI6Xrkxq4Am5YEeUoPlHPrGJA06YMXh28yPg0v
	0sISXxkrYahfDlQys4nmQlTyzPmmVKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFtEiHl6F37lzneEJSukh91KBvyeE72zd/sae8MsorI=;
	b=SPCGB5yE+ERC+P7VbMlY/unnm/FT3wtbHZSms3d4chi77Xn5uySLOqfYWxtNS6Gc+c77fm
	MpeqBoeqDqJYgsDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hygChbwm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+UsN1DIm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFtEiHl6F37lzneEJSukh91KBvyeE72zd/sae8MsorI=;
	b=hygChbwmh/pOAKUP3phg5IglTsaEDDJVuINE6RMpUKd4LI+TgCE9loZbif1BVx3M6WIrSH
	9Hvj8SNNEiSERd09aA2dOlPz3ecgdzRUsUdAa3PTN/724Z35zVxbPHZCQhRxlNLVy7tSXg
	3w13qzctkFCvgKWEptSn73H5kK9WzqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFtEiHl6F37lzneEJSukh91KBvyeE72zd/sae8MsorI=;
	b=+UsN1DImw9jihRcup+1k5yDOv9TkCzeQmSuIqwqHG8rPfPtTAHgc9EUcRANoWuoiOvV961
	XVd+X0zJDwt83UCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE9F0133A7;
	Sat, 17 Oct 2026 08:22:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bjTfLzYw02ryIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Oct 2026 08:22:14 +0000
Date: Sat, 17 Oct 2026 10:22:14 +0200
Message-ID: <87mrsc20uh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: jack: Protect the index scan against control removal
In-Reply-To: <pm-pmb-f08c844bb1163c8d4fa1-v2-2f3c99e40f90134846ee@gmail.com>
References: <pm-pmb-f08c844bb1163c8d4fa1-v2-2f3c99e40f90134846ee@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6F3D11F74C
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 17 Oct 2026 09:00:58 +0200,
Cen Zhang wrote:
> 
> A control found during a jack-name index scan must remain alive until
> snd_ctl_find_id() finishes comparing its ID and count. However,
> get_available_index() calls it without holding card->controls_rwsem.
> With CONFIG_SND_CTL_FAST_LOOKUP enabled, the lookup loads a raw control
> pointer from ctl_hash and dereferences it in elem_id_matches() without
> any lock that excludes removal.
> 
> This can happen when a jack is created while a different jack owner on
> the same card removes an existing control with the same name and index.
> For example, probe and unbind of different HDA codecs can reach these
> paths on a shared card if their generated jack names match.
> The codec device locks do not serialize operations on different
> codecs. The unbind path can free the control during the index scan:
> 
>   Codec A: probe                  Codec B: unbind
>   --------------                  ---------------
>   get_available_index()
>     snd_ctl_find_id()
>       kctl = xa_load(...)
>                                   hda_codec_driver_remove()
>                                     snd_hda_codec_cleanup_for_unbind()
>                                       snd_hda_jack_tbl_clear()
>                                         snd_device_free()
>                                           __snd_device_free()
>                                             snd_jack_dev_free()
>                                               snd_ctl_remove()
>                                                 snd_ctl_remove_locked()
>                                                   __snd_ctl_remove()
>                                                     snd_ctl_free_one()
>                                                       kfree(kctl)
>       elem_id_matches(kctl, ...)
>         read freed id/count -> UAF
> 
> Hold controls_rwsem for read across the index scan so removal cannot
> free a control until the lookup has finished using it. Release the lock
> when get_available_index() returns, before the caller adds the new
> control under the write lock.
> 
> Fixes: 38ea4c3dc306 ("ALSA: control: Optimize locking for look-up")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

Applied to for-next branch now.

There is no real race in the currently used code (it's called only at
the card probe time, hence no race against the card removal), but it's
a generic helper that may be used at any moment, so it's good to cover.


thanks,

Takashi
