Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667338;
	b=EFacTAUbDAOHEo/Ug6V5kmn090Foa6uEEnGKFaoillMIvjhnvo8rfbzlCTooDdSMOufx
	 YFlFEaPtbk2dhoR+s3VdvHH1XrDrbq3HruCpqoHBIOe0O3uc75HKskBWbQWzPkml98O2j
	 t88H2K0dRIjT2zPBFf9S9DSHuCrdCu8YpN4r7fz7UeSC93FoHZ0MJGSLOznDA0iO2s1Ci
	 hhA+xvs7VuaOV34zxwsZcKad7F54ATWSSvcfgzAtkRCJhLzCwSPJitRNnQL2mowv3CEsK
	 hucoIcLYEVZJkkY866RdZZVt5jACW++h65mURq8Ho2mS77fwl5IbqBNdIluz0Jp2QEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667338;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=rBi4lWQrOHOZYA9k5q2BBaVXS5keKJnwsmafTMtCy34=;
	b=ZafkbgtCKPlYiU1i5/qF8mARfpf2qcNP67GdmuZc4MAVDJGSVaGnDStesLTQhOJBSKNS
	 8MK3YZ++GptQzD+2EOwF1Uz8yfDPJuZR17IA+k548n4NOeYHKtAtQTLGN9iqefHIDKvyV
	 VSH3PUSdbdtU3BpHWkkErVGuWwVlK/nMiuCjXZFsvcCaJZ4vSHeR79GHy4ryGBsXww09J
	 v75BjthNROWFXZmQuZ8EEa61fQ8zMKcD1SpzSuPzHLdY6gTL1HhRmF6FzfWR+iriGkSft
	 hRUOmCXY/zsdx2j6X9oRVNhcARWAmns3XBITqIn3WKO8dRCvGutAuk5Q//2aLmnPcnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JsKe62nf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YI1YwiIm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JsKe62nf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YI1YwiIm;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B36606A31D;
	Thu, 22 Oct 2026 11:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B36606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JsKe62nf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YI1YwiIm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=JsKe62nf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YI1YwiIm
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D98CA21FB7;
	Thu, 22 Oct 2026 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792667335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBi4lWQrOHOZYA9k5q2BBaVXS5keKJnwsmafTMtCy34=;
	b=JsKe62nfZg9gvfHsOblaltxiXND6Odw2nJZe1XOD9fQ1MhfdZFW4b6M+wPxu4DzSJnbtVG
	ER5V0WRL1v9vZcPvQibwyZztXbMowRkCLUnYxbPjfqIT39Dh1CegmU1P4ZNZkn3Ss11QXT
	KIsZrsZUZFBAIfIIUKxCBISICZ/Nf4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792667335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBi4lWQrOHOZYA9k5q2BBaVXS5keKJnwsmafTMtCy34=;
	b=YI1YwiImUR5vQaI+hX/NT1HSlNSyW9F3I43RmfpJ3SGd98hitdEt4cojg/KsQMwuY413Yg
	/MGJxVX69zIRP3DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792667335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBi4lWQrOHOZYA9k5q2BBaVXS5keKJnwsmafTMtCy34=;
	b=JsKe62nfZg9gvfHsOblaltxiXND6Odw2nJZe1XOD9fQ1MhfdZFW4b6M+wPxu4DzSJnbtVG
	ER5V0WRL1v9vZcPvQibwyZztXbMowRkCLUnYxbPjfqIT39Dh1CegmU1P4ZNZkn3Ss11QXT
	KIsZrsZUZFBAIfIIUKxCBISICZ/Nf4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792667335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBi4lWQrOHOZYA9k5q2BBaVXS5keKJnwsmafTMtCy34=;
	b=YI1YwiImUR5vQaI+hX/NT1HSlNSyW9F3I43RmfpJ3SGd98hitdEt4cojg/KsQMwuY413Yg
	/MGJxVX69zIRP3DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 899AA133F3;
	Thu, 22 Oct 2026 11:08:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YOJfGMfu2WpiVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Oct 2026 11:08:55 +0000
Date: Thu, 22 Oct 2026 13:08:55 +0200
Message-ID: <87h5iec7qw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Drain proc writers before freeing preallocated buffers
In-Reply-To: <CAFRLqsUjzhcMwCZb+LNCGFFbHv=GF+2+StrbHH0md4REgyADJw@mail.gmail.com>
References: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
	<87h5igix41.wl-tiwai@suse.de>
	<CAFRLqsVe0JjW9VTbjBG9w00LFuQBxyK3CCjTnqaCXzcUPDCE4w@mail.gmail.com>
	<87v76uccta.wl-tiwai@suse.de>
	<CAFRLqsUjzhcMwCZb+LNCGFFbHv=GF+2+StrbHH0md4REgyADJw@mail.gmail.com>
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
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -12.30

On Thu, 22 Oct 2026 12:56:37 +0200,
Cen Zhang wrote:
> 
> Takashi Iwai <tiwai@suse.de> 于2026年10月22日周四 17:19写道：
> >
> > On Thu, 22 Oct 2026 10:58:02 +0200,
> > Cen Zhang wrote:
> > >
> > > Hi Takashi,
> > >
> > > Takashi Iwai <tiwai@suse.de> 于2026年10月20日周二 16:40写道：
> > > >
> > > > I believe a better fix is to handle the disconnection of procfs more
> > > > properly.  The hda codec driver calls snd_device_disconnect() for each
> > > > pcm, but in the PCM side, the procfs removal relies on the card level
> > > > disconnection (snd_info_card_disconnect()).
> > > >
> > > > That is, something like below works instead?
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > > > --- a/sound/core/pcm.c
> > > > +++ b/sound/core/pcm.c
> > > > @@ -1119,6 +1119,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
> > > >         for (cidx = 0; cidx < 2; cidx++) {
> > > >                 if (pcm->streams[cidx].dev)
> > > >                         snd_unregister_device(pcm->streams[cidx].dev);
> > > > +               snd_pcm_stream_proc_done(&pcm->streams[cidx]);
> > > >                 free_chmap(&pcm->streams[cidx]);
> > > >         }
> > > >         return 0;
> > > >
> > >
> > > Sorry for the delayed reply — something came up to me over the past
> > > few days.
> > >
> > > Thanks for the review. Handling the proc entries at PCM disconnect
> > > looks like a better approach.But I noticed two possible issues with
> > > adding the call here: proc removal can invoke a prealloc release
> > > callback that takes open_mutex, which is already held; freeing the
> > > subtree also leaves pstr->oss.proc_entry pointing to freed storage
> > > until final unregister.
> >
> > Hm, basically we don't have to release the resources but just
> > disconnect procfs (that guarantees that the pending callbacks are
> > finished).  So how about something like below instead?
> >
> > > I'll follow your approach, but perform proc rundown outside open_mutex
> > > and retain the entry objects until final cleanup. I'll also prevent subsequent
> > > card registration from republishing the disconnected entries.
> >
> > But those are assumptions: the proc rundown must be after all pending
> > stuff is gone and it shouldn't be called until the next registration.
> > And, running re-registering before the complete release is already
> > fundamentally broken, and that should be addressed instead.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > -- 8< --
> > diff --git a/include/sound/info.h b/include/sound/info.h
> > index adbc506860d6..4b08a32ff4fe 100644
> > --- a/include/sound/info.h
> > +++ b/include/sound/info.h
> > @@ -117,6 +117,7 @@ struct snd_info_entry *snd_info_create_module_entry(struct module *module,
> >  struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
> >                                              const char *name,
> >                                              struct snd_info_entry *parent);
> > +void snd_info_disconnect_entry(struct snd_info_entry *entry);
> >  void snd_info_free_entry(struct snd_info_entry *entry);
> >
> >  int snd_info_card_create(struct snd_card *card);
> > diff --git a/sound/core/info.c b/sound/core/info.c
> > index c4d57d0809ad..bb9f564001ea 100644
> > --- a/sound/core/info.c
> > +++ b/sound/core/info.c
> > @@ -737,6 +737,15 @@ static void snd_info_clear_entries(struct snd_info_entry *entry)
> >         entry->p = NULL;
> >  }
> >
> > +void snd_info_disconnect_entry(struct snd_info_entry *entry)
> > +{
> > +       if (entry && entry->p) {
> > +               proc_remove(entry->p);
> > +               guard(mutex)(&info_mutex);
> > +               snd_info_clear_entries(entry);
> > +       }
> > +}
> > +
> >  /**
> >   * snd_info_free_entry - release the info entry
> >   * @entry: the info entry
> > @@ -749,11 +758,7 @@ void snd_info_free_entry(struct snd_info_entry * entry)
> >
> >         if (!entry)
> >                 return;
> > -       if (entry->p) {
> > -               proc_remove(entry->p);
> > -               guard(mutex)(&info_mutex);
> > -               snd_info_clear_entries(entry);
> > -       }
> > +       snd_info_disconnect_entry(entry);
> >
> >         /* free all children at first */
> >         list_for_each_entry_safe(p, n, &entry->children, list)
> > diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> > index 1e4e0ecb3dbd..58098ee894a1 100644
> > --- a/sound/core/pcm.c
> > +++ b/sound/core/pcm.c
> > @@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
> >         return 0;
> >  }
> >
> > +static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
> > +{
> > +       snd_info_disconnect_entry(pstr->proc_root);
> > +}
> > +
> >  static int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr)
> >  {
> >         snd_info_free_entry(pstr->proc_root);
> > @@ -580,6 +585,7 @@ static int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream)
> >
> >  #else /* !CONFIG_SND_VERBOSE_PROCFS */
> >  static inline int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr) { return 0; }
> > +static inline void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr) { return 0; }
> >  static inline int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr) { return 0; }
> >  static inline int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream) { return 0; }
> >  #endif /* CONFIG_SND_VERBOSE_PROCFS */
> > @@ -1119,6 +1125,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
> >         for (cidx = 0; cidx < 2; cidx++) {
> >                 if (pcm->streams[cidx].dev)
> >                         snd_unregister_device(pcm->streams[cidx].dev);
> > +               snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
> >                 free_chmap(&pcm->streams[cidx]);
> >         }
> >         return 0;
> 
> Agree that. But I moved proc rundown outside open_mutex because
> proc_remove() can invoke the
> prealloc release callback, which takes that mutex.

OK, it makes sense.


Takashi
