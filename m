Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485601;
	b=d3rZ8PFjXhVYksG0jSaMuJ82BwVD82J2RBSPdssNx3tp2LREA2th+8uftJutBjE+yqW3
	 Na2xn3OWh6dmc4mUVM4GLAqLGxDKraFxDerIMx6ysBIeacfnkyhbfe4QAFMDj3akWRAq2
	 zTW1rhTJlyRJOBt1mI2CVQRkbjRUYcGYZD75taPj8bM/3OY9tMXM+/oLelLqB+ZckXgnr
	 TlfZ6JLlmrYROLHXcTn+BjcHiaojjnv2kWuvT+lkWOg9S3qRS8IUBznJLofLACa3sGIdz
	 MB02a087/zR8YyMJQoBfrObGoOWaS4g3h/+MwPXxeGIb2Ueq/GE6uauTKaVPtfZPCqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485601;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=TChGTrDHNB5QqhBMTsSAeSTKwZNndXnxQSxafmG9rWU=;
	b=visNntHoTJx4vuhSEOS3hOVE4uG/UnIf9cYQNAkfa4BnxpoybIGHEjJei+MeZFbQSXch
	 6yhiaGs84MTd+/dOK7KVJKmXN5cJ51iICWXe5cu/g+kuUnyUO36V7meHIpOSktWlyO7XX
	 CNLwjrBn1xZUOlPx8YELDncU2cMAKjSYB0H6Ifl5CW5Ol3J5B6sWxnuyZuu43YWDCGGd7
	 U/JvzjR2A+U0rxZSliAlEWJmaxWQ5+crTNOb9igOSKPcCPj+azKSJdiQL/SYNYRy0xWXF
	 cR7mfI2kZY8ucB7PhFuzFXZ8jGSyBTpUhwVDsk+MiUHbMjol8UahNfvkfnohlsCLP3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=P9W3X1Gf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FoT1lzTT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=P9W3X1Gf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FoT1lzTT;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0451606A333;
	Tue, 20 Oct 2026 08:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0451606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=P9W3X1Gf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FoT1lzTT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=P9W3X1Gf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FoT1lzTT
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 08A351F388;
	Tue, 20 Oct 2026 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792485599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TChGTrDHNB5QqhBMTsSAeSTKwZNndXnxQSxafmG9rWU=;
	b=P9W3X1GfOjZxuA1WpZJM3o41Wnc0IqOwRQV5Zpih0QVUYBz9kUD3jTnbdeHf69zpOIYRN4
	ahwWsALKFKL+N3p8viD8PSxyqALPgOqJtzxKHCYSlgJhzgq4XsUiooVZCHMaj3AhmslQ2/
	xg/xw/gmneMWb7HRz8nOW75s89tfk1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792485599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TChGTrDHNB5QqhBMTsSAeSTKwZNndXnxQSxafmG9rWU=;
	b=FoT1lzTTxgTIPbLDPG6wqLlPnbKHFoErBgBHCkxX48+fboJ7XuzAgQ65O7xCnvTM4n3Y5A
	/8RVdCUxFCtRYjBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792485599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TChGTrDHNB5QqhBMTsSAeSTKwZNndXnxQSxafmG9rWU=;
	b=P9W3X1GfOjZxuA1WpZJM3o41Wnc0IqOwRQV5Zpih0QVUYBz9kUD3jTnbdeHf69zpOIYRN4
	ahwWsALKFKL+N3p8viD8PSxyqALPgOqJtzxKHCYSlgJhzgq4XsUiooVZCHMaj3AhmslQ2/
	xg/xw/gmneMWb7HRz8nOW75s89tfk1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792485599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TChGTrDHNB5QqhBMTsSAeSTKwZNndXnxQSxafmG9rWU=;
	b=FoT1lzTTxgTIPbLDPG6wqLlPnbKHFoErBgBHCkxX48+fboJ7XuzAgQ65O7xCnvTM4n3Y5A
	/8RVdCUxFCtRYjBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD4DF136CC;
	Tue, 20 Oct 2026 08:39:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lDBiIN4o12pISQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 08:39:58 +0000
Date: Tue, 20 Oct 2026 10:39:58 +0200
Message-ID: <87h5igix41.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
In-Reply-To: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
References: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
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
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 20 Oct 2026 04:29:24 +0200,
Cen Zhang wrote:
> 
> The prealloc proc write callback changes a substream's DMA buffer under
> pcm->open_mutex. Final PCM cleanup frees that buffer without the mutex,
> before removing the stream proc entries. A pending callback can therefore
> race the free or allocate a replacement after the final buffer cleanup.
> 
> This is reachable through codec-only HDA sysfs unbind while the card
> remains registered. With CONFIG_SND_VERBOSE_PROCFS, HDA creates writable
> prealloc files with a nonzero maximum. Buffer a valid size different from
> the current preallocation and leave the file open, without a PCM runtime.
> Cleanup reaches snd_pcm_free() through hda_codec_driver_remove(),
> snd_hda_codec_cleanup_for_unbind(), codec_release_pcms() and
> snd_device_free(). The proc file pins the card module, not a codec PCM
> reference, so it does not prevent this component cleanup.
> 
> The text write is applied at file release, rather than by write(2).
> A close in the gap can leave a replacement buffer behind:
> 
>   PCM component cleanup           prealloc file close
>   ---------------------           -------------------
>   snd_pcm_free()
>     free preallocated buffers
>                                   snd_info_text_entry_release()
>                                     snd_pcm_lib_preallocate_proc_write()
>                                       allocate replacement buffer
>                                       replace dma_buffer
>     snd_pcm_free_stream()
>       remove and drain proc files
>       free substream
> 
> The same late allocation can occur without a concurrent close: the later
> proc rundown itself invokes the buffered write callback. In either case,
> there is no final buffer free after the callback installs its replacement.
> 
> Move each substream's preallocation free into snd_pcm_free_stream(),
> after snd_pcm_stream_proc_done() has removed the proc entries and drained
> their callbacks. Keep rundown outside open_mutex, which the callback needs
> to finish. Both stream directions and construction-error cleanup still
> free their preallocations before destroying the substreams.
> 
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>  sound/core/pcm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> index 1e4e0ecb3dbd..ce577c303a1c 100644
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -825,6 +825,7 @@ static void snd_pcm_free_stream(struct snd_pcm_str * pstr)
>  	substream = pstr->substream;
>  	while (substream) {
>  		substream_next = substream->next;
> +		snd_pcm_lib_preallocate_free(substream);
>  		snd_pcm_timer_done(substream);
>  		kfree(substream);
>  		substream = substream_next;
> @@ -861,7 +862,6 @@ static int snd_pcm_free(struct snd_pcm *pcm)
>  	}
>  	if (pcm->private_free)
>  		pcm->private_free(pcm);
> -	snd_pcm_lib_preallocate_free_for_all(pcm);
>  	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]);
>  	snd_pcm_free_stream(&pcm->streams[SNDRV_PCM_STREAM_CAPTURE]);
>  	kfree(pcm);

I believe a better fix is to handle the disconnection of procfs more
properly.  The hda codec driver calls snd_device_disconnect() for each
pcm, but in the PCM side, the procfs removal relies on the card level
disconnection (snd_info_card_disconnect()).

That is, something like below works instead?


thanks,

Takashi

--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -1119,6 +1119,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 	for (cidx = 0; cidx < 2; cidx++) {
 		if (pcm->streams[cidx].dev)
 			snd_unregister_device(pcm->streams[cidx].dev);
+		snd_pcm_stream_proc_done(&pcm->streams[cidx]);
 		free_chmap(&pcm->streams[cidx]);
 	}
 	return 0;

