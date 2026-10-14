Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1046B2E7185;
	Wed, 14 Oct 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972432; cv=none; b=tAEaD9G2rXD3TCVL2WDJXFAzBZ5qZPAG6N6UiWQtP7ruUf6RShQntgsvMxPcAvpklNLQsEQwutc008ezHE+wWeqbj94tcIYXrYpIhYP9Kt67R4i3ZDW65onhnnW2yeqtCNyegUqHj2JH54Xi9OTEFAip5bal56dB+xpTOPEujwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972432; c=relaxed/simple;
	bh=ewRbFEdJzK10AsdH8UzpTsvJMSbM/G1SyD2t5Hjy02k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIOqDgHZwZkAqOLJpPrwnrpjJd5rCqM7lt9oR7I2E/6GUJw1RC6D62czS9b0vaFtR6YqoUp7jLgrtnDjkt7dadCdtUDxb0NU/bJyPC9DcEK18NsJEnsCTSjfmnbyayWi8xYHOiXzF+7HOAMge/EiNUOeqmJWJnmzf2kSHCFNhk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1QUA6xQL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dFj5/C24; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1QUA6xQL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dFj5/C24; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1QUA6xQL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dFj5/C24";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1QUA6xQL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dFj5/C24"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 41C1F1F88F;
	Wed, 14 Oct 2026 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791972423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMq6RemBayrGyjOazp2iW03XQXAwMJUvEX4tKc8utxA=;
	b=1QUA6xQLLLqqQEyb44ltaJ6i94m1i9OviIL+vJFBgCv6sfb8fF49LqaX4mdtQOGcPj8Z0E
	YPE7jty17QR+BLoMi0vFTo6t/KUT8OBf0Gr8ba4NEV9PlF9vGVP4mtCRcM0Dqqp5TDl+bJ
	vfo8PbZ1V0TpIwXZWpZp19Kvjha3S9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791972423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMq6RemBayrGyjOazp2iW03XQXAwMJUvEX4tKc8utxA=;
	b=dFj5/C24o33f6idQKUfQkVvyhiSd0MQbJzTsXKwCvYf/lGZ/vY4BT6CN1kxCM3+VDsVxgm
	hYQghzORmrdmtOCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791972423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMq6RemBayrGyjOazp2iW03XQXAwMJUvEX4tKc8utxA=;
	b=1QUA6xQLLLqqQEyb44ltaJ6i94m1i9OviIL+vJFBgCv6sfb8fF49LqaX4mdtQOGcPj8Z0E
	YPE7jty17QR+BLoMi0vFTo6t/KUT8OBf0Gr8ba4NEV9PlF9vGVP4mtCRcM0Dqqp5TDl+bJ
	vfo8PbZ1V0TpIwXZWpZp19Kvjha3S9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791972423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMq6RemBayrGyjOazp2iW03XQXAwMJUvEX4tKc8utxA=;
	b=dFj5/C24o33f6idQKUfQkVvyhiSd0MQbJzTsXKwCvYf/lGZ/vY4BT6CN1kxCM3+VDsVxgm
	hYQghzORmrdmtOCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE04B1368E;
	Wed, 14 Oct 2026 10:07:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h0ywKEZUz2q2WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 10:07:02 +0000
Date: Wed, 14 Oct 2026 12:07:02 +0200
Message-ID: <87jynkegu1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
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
In-Reply-To: <87o6cweheq.wl-tiwai@suse.de>
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
	<877bjkg35f.wl-tiwai@suse.de>
	<CAFRLqsUH-ehHgXsqFGANE2h0-3WBkeNh7-AOvf5ymWAOH5r5Mw@mail.gmail.com>
	<87v774ejkp.wl-tiwai@suse.de>
	<CAFRLqsX8rqZrJfLPBOhBmuwXHq_wnxiwfxDGevfQ3wMFo2thgg@mail.gmail.com>
	<87o6cweheq.wl-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,linutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 14 Oct 2026 11:54:37 +0200,
Takashi Iwai wrote:
> 
> On Wed, 14 Oct 2026 11:33:54 +0200,
> Cen Zhang wrote:
> > 
> > Hi Takashi,
> > 
> > >
> > > That's not what I didn't understand: do both A and B use the same
> > > device?  The release shouldn't happen until all detached, so the
> > > prepare and the release can't happen concurrently for the same device.
> > >
> > > If A and B are for different devices, they don't interfere with each
> > > other in the case of dummy driver.
> > >
> > 
> > Yes, A and B use the same PCM device. The test opens
> > /dev/snd/pcmC0D0c twice, and SNDRV_PCM_IOCTL_INFO reports:
> > 
> >   A: card=0, device=0, subdevice=0, capture
> >   B: card=0, device=0, subdevice=1, capture
> > 
> > They are separate substreams with separate runtimes. With the hrtimer
> > backend selected, dummy_hrtimer_create() allocates a separate dpcm for
> > each runtime. The test configures both with HW_PARAMS and explicitly
> > links them with SNDRV_PCM_IOCTL_LINK.
> > 
> > Sorry, I should have been clearer about what is being released. The
> > PCM device remains alive throughout. The object being freed is A's
> > runtime->private_data, from A's driver close callback.
> > 
> > snd_pcm_release_substream() checks A's own ref_count. When A's last
> > file reference is closed, it calls A's driver close before unlinking
> > A, even while B is still open:
> > 
> >   Final close of A                  PREPARE ioctl on B
> >   ----------------                  ------------------
> >   snd_pcm_drop(): group -> SETUP
> >   do_hw_free(A)
> >   dummy_pcm_close(A)
> >     kfree(A's dpcm)
> >                                     snd_pcm_action_nonatomic(B)
> >                                       Take link read lock
> >                                       Walk group: B and A
> >                                       snd_pcm_do_prepare(A)
> >                                         dummy_pcm_prepare(A)
> >                                           Read freed timer_ops
> >   pcm_release_private(A)
> >     snd_pcm_unlink(A)
> >   snd_pcm_detach_substream(A)
> > 
> > B reaches A through the PCM core's linked-group iteration:
> > snd_pcm_action_group() invokes the prepare action for each member.
> > A is still linked and in SETUP at that point, which the prepare state
> > check accepts. The two dummy runtimes do not share their private data;
> > the group action explicitly invokes A's callback with A's substream.
> > 
> > The final close holds pcm->open_mutex, but the PREPARE path does not
> > take that mutex. PREPARE holds snd_pcm_link_rwsem for reading and the
> > members' buffer mutexes; driver close does not hold those locks across
> > the free. The link write lock is taken at the later unlink.
> > 
> > That is the overlap I meant: A's own backend data can be freed while
> > A is still reachable by a PREPARE action issued through B.
> 
> OK, it's then about unlinking in addition to the sync-stop.
> 
> I believe that we should rearrange the call order of unlink; it should
> be rather called at the very beginning and unconditionally.
> 
> So the revised patch is something like below.

... and after re-reading the code, I noticed that the
snd_pcm_sync_stop() call is redundant.  After snd_pcm_drop(), the code
continues as:

	if (substream->hw_opened) {
		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
			do_hw_free(substream);
		substream->ops->close(substream);
		substream->hw_opened = 0;
	}

and do_hw_free() does call snd_pcm_sync_stop()

static int do_hw_free(struct snd_pcm_substream *substream)
{
	int result = 0;

	snd_pcm_sync_stop(substream, true);
	if (substream->ops->hw_free)
	.....

That said, the only missing piece is the rearrangement of unlinking
call order.  The hrtimer was a red herring, after all, and rather the
access to a PCM substream that is being released via the PCM link was
the real problem.

Please verify whether the fix below works for your case.


thanks,

Takashi


-- 8< --
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a845f242a163..4fea3f6df682 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2792,18 +2792,14 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
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
 	if (substream->hw_opened) {
 		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
@@ -2887,8 +2883,6 @@ static int snd_pcm_open_file(struct file *file,
 		return -ENOMEM;
 	}
 	pcm_file->substream = substream;
-	if (substream->ref_count == 1)
-		substream->pcm_release = pcm_release_private;
 	file->private_data = pcm_file;
 
 	return 0;
