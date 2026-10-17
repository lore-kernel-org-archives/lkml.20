Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A92E11C7;
	Sat, 17 Oct 2026 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234059; cv=none; b=VXqTZ3ErwGciKcLS84v+bChJeWJLh0nSfWDjj27VgP1GMsjnbDY+OPDw132so0Guihmt+gMiK4PT4dzHGicqoIBtF7CGJ+g3Oi+mccimazbPrmp0t42sGLdiEHpY62y+cn2EIwlF9Hh51XUAxx2o6UgJJD+T3/SClnGnvLgDzN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234059; c=relaxed/simple;
	bh=39ARCK9lcPsfXWBXoRLwKxpJzdqrE4HnnoCnP90p7tY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbePGOwiD/poBh64/oqbhti114TKK9wtLVzLHUostXyj4jurgHXC+sSbvrMC82Om2G1utTUzex7tDqbB4ln8aIe+nltKhsEQKPPNTo//kPzQ7zEux+vqg+0aomv7bhKAbhhb4wrLtaSYah5kFN4Y0eLMb3wRu6IEWFMJnWx7WdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hwKgMiCV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xf915SPl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P0Blv9Sx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qE/5ILiK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hwKgMiCV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xf915SPl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P0Blv9Sx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qE/5ILiK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7957821CD8;
	Sat, 17 Oct 2026 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792234055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68vfiRaa2us99PpsAAvgS26dgF1NtVVNahsovh1xngs=;
	b=hwKgMiCVndqsj2U+MtzeDjQQg3iIURaakwW8YMRJ6L7g974pQK1et4LiD4MqhcXsg2rOK8
	26ouepzXognVzxqPAPYH5JdfhWzCyxKAU1z03xv4xvSXSAquYWCC9jfljjdF9UWx9H1srJ
	p98Wso/IhVf8bShoqSYXbIW++C2770U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792234055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68vfiRaa2us99PpsAAvgS26dgF1NtVVNahsovh1xngs=;
	b=Xf915SPlPfOW1n8HBTAq2WyojbeJWZNXXqnW/YbkinizCfC0f6u6Iep0whi5mmb+C0Vq4g
	eatH7WJ8aIpu9kAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792234054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68vfiRaa2us99PpsAAvgS26dgF1NtVVNahsovh1xngs=;
	b=P0Blv9SxbcS8QvFGrJAuBn9S6eJVgeETAITrfYUaQRZUZFnEa4NlFQY3UDdAGxkzT/JkYG
	5kjpRRBNmLc+0Bib/NXdgrigj84JgdmyiULmHCMgZLHbD4gFfhZT+1Ufw5NoSgCDasiW9X
	b0fdnGo4ieJGVjsqG9x5mXeZE52h6p0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792234054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68vfiRaa2us99PpsAAvgS26dgF1NtVVNahsovh1xngs=;
	b=qE/5ILiKwyaZseNPgG0nbgzBY9JvOxdElGEtkAfAhonGZTyvmLrEvRsyMlDHyt4mWvYeh5
	EIo/qErv90kL15AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06B0D133A7;
	Sat, 17 Oct 2026 10:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LzuHM0VS02pJMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Oct 2026 10:47:33 +0000
Date: Sat, 17 Oct 2026 12:47:33 +0200
Message-ID: <87bj8s1u4a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: info: Serialize freeing with recursive registration
In-Reply-To: <87ecdo1uud.wl-tiwai@suse.de>
References: <pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com>
	<87ld7w20ok.wl-tiwai@suse.de>
	<CAFRLqsVs8BGNHb8qG6nnrCc=fafMYAmCSDuXDb8uBRBrgJhnEA@mail.gmail.com>
	<87ecdo1uud.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

On Sat, 17 Oct 2026 12:31:54 +0200,
Takashi Iwai wrote:
> 
> On Sat, 17 Oct 2026 11:27:54 +0200,
> Cen Zhang wrote:
> > 
> > Hi Takashi,
> > 
> > >
> > > Does the above crash really happen with unmodified code?
> > > The PCM oss proc unregister is per card, hence there can't be race
> > > between register and unregister for the same card.
> > >
> > > The hardening itself in the proc code is good, per se (although it's
> > > doubtful whether we really need a global mutex from the performance
> > > POV), though.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > 
> > 
> > Thank you for the review. The quoted KASAN report used scheduling
> > instrumentation
> > and a small test module that called snd_card_register() on an already registered
> > dummy card.
> > 
> > But reviewing the source, I found a concrete scenario involving
> > existing in-tree callers that appears to allow this race.
> > 
> > Consider a registered card with PCM A and its published OSS proc
> > entry. A later bind of another codec B on the same card can reach
> > hda_codec_driver_probe(), which calls snd_card_register() when
> > !bus_probing && card->registered.
> > 
> > At the same time, snd-pcm-oss can be unloaded while the card remains
> > registered, provided no active OSS references prevent the unload.
> > alsa_pcm_oss_exit() calls snd_pcm_notify(..., 1), which invokes
> > n_unregister() for the registered PCM devices and frees their OSS
> > proc entries.
> > 
> > The interleaving I believe the source permits is:
> > 
> >   HDA codec B probe                  snd-pcm-oss module exit
> >   -----------------                  -----------------------
> >   snd_card_register(card)
> >     snd_device_register_all(card)
> >     /* PCM register_mutex released */
> > 
> >                                      lock(register_mutex)
> >                                      n_unregister(PCM A)
> >                                        snd_info_free_entry(entry)
> >                                          proc_remove(entry->p)
> >                                          lock(info_mutex)
> >                                          entry->p = NULL
> >                                          unlock(info_mutex)
> >                                          /* entry still linked */
> > 
> >     lock(snd_card_mutex)
> >     snd_info_card_register(card)
> >       snd_info_register(card->proc_root)
> >         find PCM A's linked entry
> >         lock(info_mutex)
> >         recreate proc node with
> >           entry as private data
> >         unlock(info_mutex)
> >     unlock(snd_card_mutex)
> > 
> >                                      unlink entry
> >                                      kfree(entry)
> >                                      unlock(register_mutex)
> > 
> > The card-info traversal does not hold the PCM register_mutex, and
> > OSS notifier removal does not take snd_card_mutex. The parent proc
> > directories also remain present because the card and PCM A have
> > not been removed.
> > 
> > This appears to allow the new proc node to retain a pointer to the
> > freed entry. A subsequent open could then reach alloc_info_private()
> > with that stale pointer. Please let me know if I have overlooked
> > another serialization point in this path.
> 
> OK, the arbitrary OSS removal is the problem child.
> 
> IMO, instead of hardening piece-by-piece in ad hoc ways, we can pin
> the OSS PCM and mixer module when any card is added and unpin at the
> card removal, so that we can't unload OSS modules while there are any
> actually used cards.

I meant something like below (totally untested)


Takashi

-- 8< --
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index f1fa42e634fc..2e686bd6c5f9 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -1309,13 +1309,18 @@ static int snd_mixer_oss_free1(void *private)
 static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 {
 	struct snd_mixer_oss *mixer;
+	int err;
 
 	if (cmd == SND_MIXER_OSS_NOTIFY_REGISTER) {
-		int idx, err;
+		int idx;
 
 		mixer = kzalloc_objs(*mixer, 2);
 		if (mixer == NULL)
 			return -ENOMEM;
+		if (!try_module_get(THIS_MODULE)) {
+			kfree(mixer);
+			return -ENODEV;
+		}
 		mutex_init(&mixer->reg_mutex);
 		err = snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MIXER,
 					      card, 0,
@@ -1325,6 +1330,7 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 				"unable to register OSS mixer device %i:%i\n",
 				card->number, 0);
 			kfree(mixer);
+			module_put(THIS_MODULE);
 			return err;
 		}
 		mixer->oss_dev_alloc = 1;
@@ -1358,7 +1364,9 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 		if (cmd == SND_MIXER_OSS_NOTIFY_DISCONNECT)
 			return 0;
 		snd_mixer_oss_proc_done(mixer);
-		return snd_mixer_oss_free1(mixer);
+		err = snd_mixer_oss_free1(mixer);
+		module_put(THIS_MODULE);
+		return err;
 	}
 	return 0;
 }
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index bd19328dca9e..3d35f9d2d675 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -3151,6 +3151,9 @@ static void register_oss_dsp(struct snd_pcm *pcm, int index)
 
 static int snd_pcm_oss_register_minor(struct snd_pcm *pcm)
 {
+	if (!try_module_get(THIS_MODULE))
+		return -ENODEV;
+
 	pcm->oss.reg = 0;
 	if (dsp_map[pcm->card->number] == (int)pcm->device) {
 		char name[128];
@@ -3207,6 +3210,7 @@ static int snd_pcm_oss_unregister_minor(struct snd_pcm *pcm)
 {
 	snd_pcm_oss_disconnect_minor(pcm);
 	snd_pcm_oss_proc_done(pcm);
+	module_put(THIS_MODULE);
 	return 0;
 }
 
