Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D454BE443;
	Wed, 14 Oct 2026 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971681; cv=none; b=NY9n71LF71SxaX50026TQIDc/s4vn3flPEVToCax8ZMMnhagBI2ELCdnImRxp5oOBkjsmOmd30wu/kt77ZttdnbjbJfl5pmfCrfDKyC2C7mmSnPx03C6t84vSSZOjkPAgeSUjHt60s7cPjHElrj6nskwa6gQ6+St4bivLaGDqSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971681; c=relaxed/simple;
	bh=cfqZbjXpaE8u8hbPc3jyZ1IbnVkhs4b653ZOWtal6to=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vELmEgoxGp2tpeD2ryNAEBt1gBeHjF7lkxiv4H6yYgnEvX8wXUxXed43srDTSiktlMleJHl85taHtZ/7P+LjbXukrwdOKwAdYG0POJNfDThEH/stRqrRiX1kmo8Sv4GObMEE9LgBUMF659Cyh5rMXG2/Y/dgJvhrI2Tq4DeIIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t12+9EEp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g70acGbT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t12+9EEp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g70acGbT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t12+9EEp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g70acGbT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t12+9EEp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g70acGbT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 03F3E21F4D;
	Wed, 14 Oct 2026 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791971678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtYVe9oNDY5yFIKd+i9xJmdGM8FrfyvrBTAwWmku7Q=;
	b=t12+9EEpV1+sI9zPAX0J1Ns5arTmYM4eYHHwC4juu6oVZTQXUuQbmFVuyFBfcT6ifHiy4D
	5EzptMi+zoRseBVNPP36p3TbLT8+K8PTMmWJzIuPHPaNfh8tKaJoFaXEb6QLjjRonsLlck
	NJ6HRjDwPACnOYltFRmFceGxWJYhJSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791971678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtYVe9oNDY5yFIKd+i9xJmdGM8FrfyvrBTAwWmku7Q=;
	b=g70acGbTKRmvQRcm1aPz1cGyzwW85ncmkBexRZSo7LfKaZW0MWbdhZvFK8P9Ba6lJRYtG4
	hPbeuPH00nzV9ICQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791971678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtYVe9oNDY5yFIKd+i9xJmdGM8FrfyvrBTAwWmku7Q=;
	b=t12+9EEpV1+sI9zPAX0J1Ns5arTmYM4eYHHwC4juu6oVZTQXUuQbmFVuyFBfcT6ifHiy4D
	5EzptMi+zoRseBVNPP36p3TbLT8+K8PTMmWJzIuPHPaNfh8tKaJoFaXEb6QLjjRonsLlck
	NJ6HRjDwPACnOYltFRmFceGxWJYhJSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791971678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtYVe9oNDY5yFIKd+i9xJmdGM8FrfyvrBTAwWmku7Q=;
	b=g70acGbTKRmvQRcm1aPz1cGyzwW85ncmkBexRZSo7LfKaZW0MWbdhZvFK8P9Ba6lJRYtG4
	hPbeuPH00nzV9ICQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 850AA1368E;
	Wed, 14 Oct 2026 09:54:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6ciCFl1Rz2qxSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 09:54:37 +0000
Date: Wed, 14 Oct 2026 11:54:37 +0200
Message-ID: <87o6cweheq.wl-tiwai@suse.de>
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
In-Reply-To: <CAFRLqsX8rqZrJfLPBOhBmuwXHq_wnxiwfxDGevfQ3wMFo2thgg@mail.gmail.com>
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
	<877bjkg35f.wl-tiwai@suse.de>
	<CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
	<87v774ejkp.wl-tiwai@suse.de>
	<CAFRLqsX8rqZrJfLPBOhBmuwXHq_wnxiwfxDGevfQ3wMFo2thgg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,kernel.org,linutronix.de,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 14 Oct 2026 11:33:54 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> >
> > That's not what I didn't understand: do both A and B use the same
> > device?  The release shouldn't happen until all detached, so the
> > prepare and the release can't happen concurrently for the same device.
> >
> > If A and B are for different devices, they don't interfere with each
> > other in the case of dummy driver.
> >
> 
> Yes, A and B use the same PCM device. The test opens
> /dev/snd/pcmC0D0c twice, and SNDRV_PCM_IOCTL_INFO reports:
> 
>   A: card=0, device=0, subdevice=0, capture
>   B: card=0, device=0, subdevice=1, capture
> 
> They are separate substreams with separate runtimes. With the hrtimer
> backend selected, dummy_hrtimer_create() allocates a separate dpcm for
> each runtime. The test configures both with HW_PARAMS and explicitly
> links them with SNDRV_PCM_IOCTL_LINK.
> 
> Sorry, I should have been clearer about what is being released. The
> PCM device remains alive throughout. The object being freed is A's
> runtime->private_data, from A's driver close callback.
> 
> snd_pcm_release_substream() checks A's own ref_count. When A's last
> file reference is closed, it calls A's driver close before unlinking
> A, even while B is still open:
> 
>   Final close of A                  PREPARE ioctl on B
>   ----------------                  ------------------
>   snd_pcm_drop(): group -> SETUP
>   do_hw_free(A)
>   dummy_pcm_close(A)
>     kfree(A's dpcm)
>                                     snd_pcm_action_nonatomic(B)
>                                       Take link read lock
>                                       Walk group: B and A
>                                       snd_pcm_do_prepare(A)
>                                         dummy_pcm_prepare(A)
>                                           Read freed timer_ops
>   pcm_release_private(A)
>     snd_pcm_unlink(A)
>   snd_pcm_detach_substream(A)
> 
> B reaches A through the PCM core's linked-group iteration:
> snd_pcm_action_group() invokes the prepare action for each member.
> A is still linked and in SETUP at that point, which the prepare state
> check accepts. The two dummy runtimes do not share their private data;
> the group action explicitly invokes A's callback with A's substream.
> 
> The final close holds pcm->open_mutex, but the PREPARE path does not
> take that mutex. PREPARE holds snd_pcm_link_rwsem for reading and the
> members' buffer mutexes; driver close does not hold those locks across
> the free. The link write lock is taken at the later unlink.
> 
> That is the overlap I meant: A's own backend data can be freed while
> A is still reachable by a PREPARE action issued through B.

OK, it's then about unlinking in addition to the sync-stop.

I believe that we should rearrange the call order of unlink; it should
be rather called at the very beginning and unconditionally.

So the revised patch is something like below.

(BTW, this will cover also a case where the link may remain when
linked to an OSS substream.)


Takashi

-- 8< --
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2792,19 +2792,17 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static void pcm_release_private(struct snd_pcm_substream *substream)
-{
-	if (snd_pcm_stream_linked(substream))
-		snd_pcm_unlink(substream);
-}
-
 void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 {
 	substream->ref_count--;
 	if (substream->ref_count > 0)
 		return;
 
+	snd_pcm_unlink(substream);
+
 	snd_pcm_drop(substream);
+	snd_pcm_sync_stop(substream, true);
+
 	if (substream->hw_opened) {
 		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 			do_hw_free(substream);
@@ -2887,8 +2885,6 @@ static int snd_pcm_open_file(struct file *file,
 		return -ENOMEM;
 	}
 	pcm_file->substream = substream;
-	if (substream->ref_count == 1)
-		substream->pcm_release = pcm_release_private;
 	file->private_data = pcm_file;
 
 	return 0;
