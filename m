Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433155;
	b=EGAQOJsz8yOQEUc3sO00dZiR/FZgZMYzyBhJjYy+dm/oGXiMN4Lf7/hoKHnIq3uPVwSf
	 AzgXTKcpod0/Q+JALTLwhvOaKSpRstaiaUsGK5SSqx8SM/ztftssBEeNyEbfq0fy967qp
	 0KZqjQJFkpB+Q2hoO8bZ2UuEdrlPI94GE2ThFOiWQ2KHsudbjhS1oa3/56LFKpFgbKbor
	 j5GzNt01asdU5DzBnmSnZQv+i70jQJEJbVT+zvRRcglrWT8UBOkmcOyBQbXBjrWlwUmdV
	 FHwYwg1vYMYvmcrmI5TVBQ3ZaG370AJirM9+VnakQ1tSq7a477GcbziT8F0BkiswTlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433155;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spamd-Result;
	bh=4Gvo8bnukDY8eu1cObMS0pQ4fQPVHYiSjCldJk9NiF8=;
	b=TwkZeuUm02KKbZuADkj1DCbwFLqXb/SfeYP7Wg5yZZWLbt4/Ny40y1kT/QJvgTljSgBZ
	 Z79SkXJr2rKncOoayIqEwsCfbE1LON7JvGBz3fsil8jMDKbAeuncdpJIXzc4H1Oc+05tm
	 8Luc3hq67+XD4CWeBjEGA5j9pEuNhM7sIGX7Q3dgAhqHfzeuUjTb239bzJluWH02kUjT5
	 4+QWS05+lgtKYBTUeCmS89eQzc71xOXKQgavv3vFpC2kN66/6sOUoJCUR5En1oMXT5LPY
	 X31Cn2yeyDeOQF0utwfPMBQ+BbGvAJKaaAoZHOuT3mfyRia6Y6ebj7wn9YsI6blR8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UcOGrVa0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UzEwFITs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NvScfP6Z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iCacHQDe;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE1606A319;
	Mon, 19 Oct 2026 18:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EE1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UcOGrVa0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UzEwFITs;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NvScfP6Z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iCacHQDe
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9F9E621C8E;
	Mon, 19 Oct 2026 18:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792433152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Gvo8bnukDY8eu1cObMS0pQ4fQPVHYiSjCldJk9NiF8=;
	b=UcOGrVa0Em3ni0Okk+tYo+pFWl1yFpUuYc2zpA4d7ImSDPyLfua5qERuKuJdKwg0TwKKuA
	M/8TqIFMl1L9EZWQzWp2hig7ce8QpKQCI8wXMRDtVFTVAf4vhum59TSqNB5RNSaMdmCWsS
	2PZbZevfEA48sYwQ+Zc0Oyg4EwtKL0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792433152;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Gvo8bnukDY8eu1cObMS0pQ4fQPVHYiSjCldJk9NiF8=;
	b=UzEwFITs1YXY2GYgSK4+bZOKriavrr/eidHI60KbC4BxQezSESwbGjoFR+4LLF13jaZkQR
	qtwIMYSXmSI0UnCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792433151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Gvo8bnukDY8eu1cObMS0pQ4fQPVHYiSjCldJk9NiF8=;
	b=NvScfP6Zyd5mWUJ4ST5u9v4dgIkjHqXWrOkqL1bwk4RMe8AdflQGO7NGYBp3u9eiKvSatH
	U/OtxAbJ05s6dRFpuufzi9C735veIAT1IFgoT8MgtSiuAph3HGKhlJrOIBWv4Dyg2aK+UA
	jRAfCQaPwGgjgAn2P/ClcsfrChkTrCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792433151;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Gvo8bnukDY8eu1cObMS0pQ4fQPVHYiSjCldJk9NiF8=;
	b=iCacHQDe8xnOzruPvkYrFpfSFNRyGDR+7r0pvL+t9kOAj1PRXJ9TgYm/dM4KqfTfeBay/Q
	rPm0Y5NqYURbK+DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D0FE136CC;
	Mon, 19 Oct 2026 18:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RKJ2Cf9b1mrRTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 18:05:51 +0000
Date: Mon, 19 Oct 2026 20:05:50 +0200
Message-ID: <87v76xin0h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: aloop: Keep shared timer callbacks alive through close
In-Reply-To: <pm-pmb-275c4399f517e09d7188-v2-2f64c1328529ef7a8fec@gmail.com>
References: <pm-pmb-275c4399f517e09d7188-v2-2f64c1328529ef7a8fec@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Mon, 19 Oct 2026 11:05:21 +0200,
Cen Zhang wrote:
> 
> The shared sound-timer callback must finish using the selected PCM
> runtimes before a close can detach them. loopback_snd_timer_period_elapsed()
> saves the active substreams under cable->lock, then drops the lock before
> calling snd_pcm_period_elapsed() or snd_pcm_stop_xrun(). The sound-timer
> backend has no per-stream close drain, and free_cable() keeps the timer
> open when the paired endpoint remains attached.
> 
> With both directions running on a shared sound timer, playback can be
> dropped and closed while a notification is pending. Capture keeps the
> timer alive, allowing this order:
> 
>   Timer callback                       Playback owner
>   --------------                       --------------
>   select playback under cable->lock
>   unlock; delay notification
>                                        DROP; HW_FREE -> OPEN
>                                        close: snd_pcm_drop(); unlock
>                                        free_cable(); peer stays alive
>   snd_pcm_period_elapsed()
>     lock stream; cache runtime
>                                        snd_pcm_detach_substream()
>                                          free runtime and its fasync
>     read runtime->fasync
> 
> The stream lock taken by snd_pcm_drop() cannot protect a notification
> that starts after it returns, and detach does not take it. The callback
> can therefore read runtime->fasync after the runtime has been freed, and
> an escaped notification can also reach a replacement runtime if the same
> substream slot is reopened before the notification resumes.
> 
> Take the existing cable->stop_count reference under cable->lock when
> selecting the targets and release it after the PCM callbacks finish,
> including the XRUN path. free_cable() already removes the closing
> endpoint under that lock and waits for stop_count before returning, so
> runtime detach and slot reuse cannot overtake the notification.
> 
> Fixes: 26c53379f98d ("ALSA: aloop: Support selection of snd_timer instead of jiffies")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

Applied now.  Thanks.


Takashi
