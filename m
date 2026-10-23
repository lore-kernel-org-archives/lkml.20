Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762844;
	b=ap4N7lw4iWne6W1jkMkctb3PBZjtLjqpQGipZiEJwCcy5Mnh8ojIlGQdcf9ksTWT4tmO
	 O7e3N2iCe0/hc/OOLf5MFrVnGfZxRl3swuhCuQLBCTJtSPXA5H6glQ1FECk8rAUSgA1Pm
	 bukcFFCUDImzTQ3RcY5IDZAhwRHiIHdP72SUmraIejdsTZxJ/s/3cYI6YKdjd1qL6pVVP
	 UzP5lQ6XDykClTIuBkc7GG8qbm775Fm5A4nAWaQTIUioMw74QC0VHu+yW7hGgX+k1ZfCT
	 5lfrbIMI4+VHqK46B2tYDp7lywAHJgKX8VtmFr3a2wWuHUPZF2Qt1A679j3xi7H6KTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762844;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=SqPWe8jUwsEiysPMDY1oozYUTr1AP+MgkHGYsTgCMDU=;
	b=mIWKxKJ7ohsrZHHI7YPtzMQVkUf7eCYJO3s5JDNUk+hLprgfBxrXJrnZym8duDjS812M
	 UBt/U26WwdDncJ3cIlogIoSoJh8HjF50LaQtL9xBzwhB9R17QTEHhX3EY9ioOUlznzvJ3
	 P9d7WxndOS0qZsuZIRQfkhd8UWtQF4i6O9VvGb66Y48Y1MOw97MciZW05y7rd2fDG9VMs
	 fQSOOOAKbOMz+gGJ12jZvBN6WQvRLQmnWqP0+76bSS79CXp0+5CIFHHzDkfpLR5PAJnNX
	 8tFyw8bQGshjlpNrJGy9qgSTEH+rS4zMd09wMOgvFJD+B104BGRw2dSpuEppCLlJIJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=haCWz66g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="WRVuO1//";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=haCWz66g;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="WRVuO1//";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C8606A334;
	Fri, 23 Oct 2026 13:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F8C8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=haCWz66g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WRVuO1//;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=haCWz66g;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WRVuO1//
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3399B220E2;
	Fri, 23 Oct 2026 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SqPWe8jUwsEiysPMDY1oozYUTr1AP+MgkHGYsTgCMDU=;
	b=haCWz66gbtUKdRJvqhr+3cmotdzCD+Q/7JicGhk+dawXYoe9eRLwajwOyeJ9VSr/c5M4on
	56bp1cfY9mADYS8yXzImuy+RgZdDJN8Xjx9UibVfWaact1TH3qYjCnxsQVdDa8hDIb0EOC
	G5fccWYqfltQcoZzwMaGoJBmb6ZOcvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SqPWe8jUwsEiysPMDY1oozYUTr1AP+MgkHGYsTgCMDU=;
	b=WRVuO1//52ZyLU0AujOXd1hOT9v35WdQMU881BvFwevyIAMdzHGXGUnUwy1NGNSi7l/TNr
	VAGJ69UiISqudkAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=haCWz66g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="WRVuO1//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SqPWe8jUwsEiysPMDY1oozYUTr1AP+MgkHGYsTgCMDU=;
	b=haCWz66gbtUKdRJvqhr+3cmotdzCD+Q/7JicGhk+dawXYoe9eRLwajwOyeJ9VSr/c5M4on
	56bp1cfY9mADYS8yXzImuy+RgZdDJN8Xjx9UibVfWaact1TH3qYjCnxsQVdDa8hDIb0EOC
	G5fccWYqfltQcoZzwMaGoJBmb6ZOcvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SqPWe8jUwsEiysPMDY1oozYUTr1AP+MgkHGYsTgCMDU=;
	b=WRVuO1//52ZyLU0AujOXd1hOT9v35WdQMU881BvFwevyIAMdzHGXGUnUwy1NGNSi7l/TNr
	VAGJ69UiISqudkAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF7F3133F6;
	Fri, 23 Oct 2026 13:40:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PK1eK9hj22ohVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:40:40 +0000
Date: Fri, 23 Oct 2026 15:40:40 +0200
Message-ID: <87cxt0a61z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v3] ALSA: pcm: Drain proc callbacks at device disconnect
In-Reply-To: <pm-pmb-2439c851f82c443c3600-v7-2774a482b7f03e1fef60@gmail.com>
References: <pm-pmb-2439c851f82c443c3600-v7-2774a482b7f03e1fef60@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,suse.de,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 3399B220E2

On Thu, 22 Oct 2026 12:58:20 +0200,
Cen Zhang wrote:
> 
> Disconnecting an individual PCM leaves its proc files accessible until
> snd_pcm_free_stream(). HDA codec-only sysfs unbind can take this path
> while the controller and card remain registered. An open proc file pins
> the card module, but does not hold a codec PCM reference.
> 
> With CONFIG_SND_VERBOSE_PROCFS, a prealloc write is buffered until file
> release. Without an attached PCM runtime, its release can replace the
> DMA buffer after final PCM cleanup has already freed the preallocation:
> 
>   HDA codec unbind                  prealloc file release
>   ----------------                  ---------------------
>   hda_codec_driver_remove()
>     snd_hda_codec_disconnect_pcms()
>       snd_device_disconnect()
>         snd_pcm_dev_disconnect()
>         /* proc nodes remain */
>     snd_hda_codec_cleanup_for_unbind()
>       codec_release_pcms()
>         snd_device_free()
>           snd_pcm_free()
>             free preallocated buffer
>                                     snd_info_text_entry_release()
>                                       snd_pcm_lib_preallocate_proc_write()
>                                         replace DMA buffer
>             remove stream proc nodes
>             free substream
> 
> The later proc rundown can itself invoke this buffered write and leave
> the replacement allocation without a final free. A concurrent release
> can also overlap the earlier buffer cleanup.
> 
> Extract snd_info_disconnect_entry() from snd_info_free_entry() to remove
> proc nodes and drain callbacks without freeing the info entry objects.
> Use it for both stream directions at PCM disconnect. Finish the existing
> PCM state and device disconnection under open_mutex, then drop that lock
> before proc rundown: even an otherwise idle proc file can run its
> buffered release callback, which takes open_mutex, during proc_remove().
> 
> Keep entry ownership and final cleanup unchanged, including the saved
> OSS child entries. As with existing info entry teardown, callers must
> serialize registration with disconnection and release.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied now.  Although we still may have some issues about the
concurrent codec release and probe, this should be treated better in
the upper layer.


thanks,

Takashi
