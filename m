Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23032C8B;
	Wed, 14 Oct 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968875; cv=none; b=ouZbPN15MrJV0/vdyLGgePMm/ITAvZmy3pfj4N/QafoRH6o3grVqyipWJmq9JB2ZDLj3qDlf0MnE4SGz0MMEWk4UCG8DuxfHNd0wrW6nj8EJjTIuhBVVHekWL/gvpn/R0GDYvRl6EkuMj87YmRiXopAaWx/388ILJi5ly2MkQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968875; c=relaxed/simple;
	bh=+sytG3GqjHQaGXrAR1AlLbnbpJYVlpwiko92M/+C308=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3PwU38iygYySJ8rYUjlT8ga5NJQRjP+wwBHw+MlVLSHrdM8V1zq2yHRzvMwawpzZz+00UKmArMYgTNfQ24kAGRFeaR6EeG14REoAZpcEcay1K2hOcyp1OtNOFlsHU5w/PF7sj4xgCqf1DkPh12DDSkOVc82HDqhw1F9INrSiI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EMSQhp44; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=24+lN2g5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p+p98mkg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c6fgq3h3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EMSQhp44";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="24+lN2g5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p+p98mkg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c6fgq3h3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF3BB1F8C3;
	Wed, 14 Oct 2026 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791968872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FP90KWgbNiXmLYEU497aFKoMKdh7qj6xiMjN9XsiPPU=;
	b=EMSQhp44v2JIAXFS2jUTybOdNE+Kbf/v+2BJSR4vWBN787K/AgcHw4I1jkvraXhhInzRRy
	8bpuiZxB51sfFSH1r+BXCesuSc1iMLQyrpJez/BCMDVqMgE4+9nvWimk1dnCfT0s3JNmAM
	EoAEn3WqbQaV3GTjzppvfhCyFlifNAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791968872;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FP90KWgbNiXmLYEU497aFKoMKdh7qj6xiMjN9XsiPPU=;
	b=24+lN2g5CS9nj7BRlE1D7nGgtw4uUKDZ2Qj0JacsnIHr2oGS+Yoj9qiOMScUBPpf2Dd6st
	RgIduWyNeRJRGfDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=p+p98mkg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c6fgq3h3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791968871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FP90KWgbNiXmLYEU497aFKoMKdh7qj6xiMjN9XsiPPU=;
	b=p+p98mkgqTgYymsWKMDXxAE4R/CT88NFsS+9Z8UjfeXE1sqd708jpsp912y60KV9Qr/wfS
	tPOND/oPtliprFnt8AiUxChDsrxRS7Zh/wnsaiWNis2HCTxBqIKg2CTF7T27uBlRcK5wcR
	EG83JTfkEKMkFvezm39jKnW2L4eSa2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791968871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FP90KWgbNiXmLYEU497aFKoMKdh7qj6xiMjN9XsiPPU=;
	b=c6fgq3h3Ix0oH1S4FGJUz5l/1QBb0/kbQqZN+Y/KYu6HW7+rAWK5QjRdRXC5CGtIexZv3v
	y3oeReZ6f3HAbOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BE32133F1;
	Wed, 14 Oct 2026 09:07:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MUmtEGdGz2qUFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 09:07:51 +0000
Date: Wed, 14 Oct 2026 11:07:50 +0200
Message-ID: <87v774ejkp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	sammiee5311@gmail.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
In-Reply-To: <CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
	<877bjkg35f.wl-tiwai@suse.de>
	<CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,kernel.org,linutronix.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: EF3BB1F8C3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Wed, 14 Oct 2026 10:35:24 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> >
> > Hmm, it's not clear how this happens.  It looks like a typical
> > obscuration by AI reports...
> >
> > Basically dummy_hrtimer_sync_stop should handled the hrtimer cancel,
> > but maybe the problem is rather its lack at releasing?  If so, the
> > patch below should cover instead.
> >
> >
> > thanks,
> >
> > Takashi
> 
> Thank you for looking at this. My commit message did not explain the
> scenario clearly. Sorry for the confusion.
> 
> The observed failure involves a PREPARE ioctl on a surviving linked
> substream. The test opens two dummy capture substreams, A and B, with
> the hrtimer backend selected, configures both with HW_PARAMS, and links
> them with LINK. It then performs the final close of A while issuing
> PREPARE on B. It does not issue START.
> 
> On the current for-next source, the close path is:
> 
>   snd_pcm_release_substream(A)
>     snd_pcm_drop(A)
>     do_hw_free(A)
>       snd_pcm_sync_stop(A, true)
>     dummy_pcm_close(A)
>       dummy_hrtimer_free(A)
>         kfree(dpcm)
>     pcm_release_private(A)
>       snd_pcm_unlink(A)
>     snd_pcm_detach_substream(A)
> 
> So the close path already synchronizes the timer before freeing dpcm.
> The gap is between driver close and unlink. snd_pcm_drop() leaves the
> linked group in SETUP. The release path calls do_hw_free() directly;
> unlike the HW_FREE ioctl wrapper, that helper does not change the
> runtime state to OPEN. A therefore remains linked and in a state that
> snd_pcm_pre_prepare() accepts until the later unlink.
> 
> The relevant ordering is:
> 
>   Target A final close              PREPARE on linked peer B
>   --------------------              ------------------------
>   snd_pcm_drop(): group -> SETUP
>   do_hw_free(): synchronize timer
>   dummy_pcm_close(): free dpcm
>                                     Take link read lock
>                                     Walk group, including A
>                                     Accept A's SETUP state
>                                     dummy_pcm_prepare(A)
>                                       Read freed timer_ops
>   pcm_release_private()
>     snd_pcm_unlink(): link write lock
> 
> PREPARE holds the link read lock and the participating runtime buffer
> mutexes. Driver close does not hold those locks across the free. Timer
> cancellation waits for timer callbacks, but does not wait for this
> separate PREPARE action. The later unlink is what prevents another
> group action from visiting A.
> 
> >
> > -- 8< --
> > --- a/sound/core/pcm_native.c
> > +++ b/sound/core/pcm_native.c
> > @@ -2301,6 +2301,8 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
> >         result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
> >         /* runtime->control->appl_ptr = runtime->status->hw_ptr; */
> >
> > +       snd_pcm_sync_stop(substream, true);
> > +
> >         return result;
> >  }
> >
> 
> Synchronizing a pending hrtimer callback before release is sensible.
> For the linked PREPARE ordering above, though, I think an additional
> lifetime step may still be needed. PREPARE on B can start after the
> extra sync_stop() has completed and after A's close has freed dpcm,
> while A is still linked. It can then reach A's prepare callback as
> shown above. Waiting for timer callbacks alone does not exclude that
> later group action.

That's not what I didn't understand: do both A and B use the same
device?  The release shouldn't happen until all detached, so the
prepare and the release can't happen concurrently for the same device.

If A and B are for different devices, they don't interfere with each
other in the case of dummy driver.


Takashi
