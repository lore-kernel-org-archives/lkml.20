Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660773;
	b=sZ3WVdy6VqsiNMpRU9hNvd/HuNlXlvqOQ5i43bmSrAbV2v8hSnGMDrlGU6Ko0rnSCz+a
	 0LN2J8IbXtOUWptPnbEEEhgop1d46tasLF/8Hsgp1AgrlctOz7xyEcaQKjiBgmwSU5iv1
	 3mj+8rx/Q2P3Vn8HPIZob7agNekdQd1tesxCNaPyoAbcwVZHg3MzfCmkQvWCXhbmjr7G1
	 z5BshoTM77kMnQMW9iW3V/iY9gg4LV3pRc55y239fsjr0CCKfhBBF3/tKhuu0UjK9V52q
	 RMJM8WXRuNrYNnphM/jQFfSumMft6WOr5Gs4Y8LSEs4cRhyXmLheI7k++MNvSEW4vSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660773;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=XxPZypQu3cOj/HQc7QB52O3r1+r0rt6pzjYk1yydPZM=;
	b=s1ks3+2fgSj6hsm4/pXLJ8I06PKCEtA+TzTvWNMIqRN2ma4tsixiae7Cw2LgNFNFCbhB
	 aHi8I4O0yjXSX/0dbOtUCqJsOhYIedqYBWKAAYBolZupFvHPUiwB/N8oTlQUjcmWeBXhU
	 NkOS7xIz+xIcaAxH/dPiPHQtYJSv1f784velbr1UQH/0JmFoiSCDUEjXgryu1jezBwDo7
	 JVD20eXN1X59+lfrI0XImYXMLIuG/VxYSHaKzwiFJ3/o7mhuJLvx67LdkQvWs2RwXKxHb
	 JK3uO7/cIJ7xkRGDnbZ4M1RbdqWRhNIYJbVDVyMVu/3uhBi8NOihdujEbyQ7pUcOMcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="ZEGiKcd/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=a0oy+wGg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="ZEGiKcd/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=a0oy+wGg;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A74606A323;
	Thu, 22 Oct 2026 09:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A74606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZEGiKcd/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=a0oy+wGg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZEGiKcd/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=a0oy+wGg
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B1A922111;
	Thu, 22 Oct 2026 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792660770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XxPZypQu3cOj/HQc7QB52O3r1+r0rt6pzjYk1yydPZM=;
	b=ZEGiKcd/uM6SgkU63gvOh8ew7ovUjN6rG8yYzSeEW91DOfFTwj5c8p9OUFxrRdSfddUCjT
	oEDVygYwpdC0IR8JOukMkeh2R+aKwac+ljvYTgGbjDaxh7xV24o8SPwC3/ohdT9vlgYGeo
	EPbsucCPx+civosia93nglhbLE8bXL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792660770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XxPZypQu3cOj/HQc7QB52O3r1+r0rt6pzjYk1yydPZM=;
	b=a0oy+wGgQ+9JKH6ZiNOQHSXnIFvY4dtvhp37Ebcu/QMVnltx+Xj2b71xS8jIgvZNlsJedL
	3ux5DAZs7Yr8c7DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792660770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XxPZypQu3cOj/HQc7QB52O3r1+r0rt6pzjYk1yydPZM=;
	b=ZEGiKcd/uM6SgkU63gvOh8ew7ovUjN6rG8yYzSeEW91DOfFTwj5c8p9OUFxrRdSfddUCjT
	oEDVygYwpdC0IR8JOukMkeh2R+aKwac+ljvYTgGbjDaxh7xV24o8SPwC3/ohdT9vlgYGeo
	EPbsucCPx+civosia93nglhbLE8bXL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792660770;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XxPZypQu3cOj/HQc7QB52O3r1+r0rt6pzjYk1yydPZM=;
	b=a0oy+wGgQ+9JKH6ZiNOQHSXnIFvY4dtvhp37Ebcu/QMVnltx+Xj2b71xS8jIgvZNlsJedL
	3ux5DAZs7Yr8c7DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3292A133F3;
	Thu, 22 Oct 2026 09:19:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sDBIAiLV2WqTXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Oct 2026 09:19:30 +0000
Date: Thu, 22 Oct 2026 11:19:29 +0200
Message-ID: <87v76uccta.wl-tiwai@suse.de>
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
In-Reply-To: <CAFRLqsVe0JjW9VTbjBG9w00LFuQBxyK3CCjTnqaCXzcUPDCE4w@mail.gmail.com>
References: <pm-pmb-2439c851f82c443c3600-v4-9e7df0ea42c36afe6171@gmail.com>
	<87h5igix41.wl-tiwai@suse.de>
	<CAFRLqsVe0JjW9VTbjBG9w00LFuQBxyK3CCjTnqaCXzcUPDCE4w@mail.gmail.com>
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
Content-Type: text/plain; charset=ISO-2022-JP
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

On Thu, 22 Oct 2026 10:58:02 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> Takashi Iwai <tiwai@suse.de> 于2026年10月20日周二 16:40写道：
> >
> > I believe a better fix is to handle the disconnection of procfs more
> > properly.  The hda codec driver calls snd_device_disconnect() for each
> > pcm, but in the PCM side, the procfs removal relies on the card level
> > disconnection (snd_info_card_disconnect()).
> >
> > That is, something like below works instead?
> >
> >
> > thanks,
> >
> > Takashi
> >
> > --- a/sound/core/pcm.c
> > +++ b/sound/core/pcm.c
> > @@ -1119,6 +1119,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
> >         for (cidx = 0; cidx < 2; cidx++) {
> >                 if (pcm->streams[cidx].dev)
> >                         snd_unregister_device(pcm->streams[cidx].dev);
> > +               snd_pcm_stream_proc_done(&pcm->streams[cidx]);
> >                 free_chmap(&pcm->streams[cidx]);
> >         }
> >         return 0;
> >
> 
> Sorry for the delayed reply ― something came up to me over the past
> few days.
> 
> Thanks for the review. Handling the proc entries at PCM disconnect
> looks like a better approach.But I noticed two possible issues with
> adding the call here: proc removal can invoke a prealloc release
> callback that takes open_mutex, which is already held; freeing the
> subtree also leaves pstr->oss.proc_entry pointing to freed storage
> until final unregister.

Hm, basically we don't have to release the resources but just
disconnect procfs (that guarantees that the pending callbacks are
finished).  So how about something like below instead?

> I'll follow your approach, but perform proc rundown outside open_mutex
> and retain the entry objects until final cleanup. I'll also prevent subsequent
> card registration from republishing the disconnected entries.

But those are assumptions: the proc rundown must be after all pending
stuff is gone and it shouldn't be called until the next registration.
And, running re-registering before the complete release is already
fundamentally broken, and that should be addressed instead.


thanks,

Takashi

-- 8< --
diff --git a/include/sound/info.h b/include/sound/info.h
index adbc506860d6..4b08a32ff4fe 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -117,6 +117,7 @@ struct snd_info_entry *snd_info_create_module_entry(struct module *module,
 struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 					     const char *name,
 					     struct snd_info_entry *parent);
+void snd_info_disconnect_entry(struct snd_info_entry *entry);
 void snd_info_free_entry(struct snd_info_entry *entry);
 
 int snd_info_card_create(struct snd_card *card);
diff --git a/sound/core/info.c b/sound/core/info.c
index c4d57d0809ad..bb9f564001ea 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -737,6 +737,15 @@ static void snd_info_clear_entries(struct snd_info_entry *entry)
 	entry->p = NULL;
 }
 
+void snd_info_disconnect_entry(struct snd_info_entry *entry)
+{
+	if (entry && entry->p) {
+		proc_remove(entry->p);
+		guard(mutex)(&info_mutex);
+		snd_info_clear_entries(entry);
+	}
+}
+
 /**
  * snd_info_free_entry - release the info entry
  * @entry: the info entry
@@ -749,11 +758,7 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 
 	if (!entry)
 		return;
-	if (entry->p) {
-		proc_remove(entry->p);
-		guard(mutex)(&info_mutex);
-		snd_info_clear_entries(entry);
-	}
+	snd_info_disconnect_entry(entry);
 
 	/* free all children at first */
 	list_for_each_entry_safe(p, n, &entry->children, list)
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 1e4e0ecb3dbd..58098ee894a1 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -520,6 +520,11 @@ static int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr)
 	return 0;
 }
 
+static void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr)
+{
+	snd_info_disconnect_entry(pstr->proc_root);
+}
+
 static int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr)
 {
 	snd_info_free_entry(pstr->proc_root);
@@ -580,6 +585,7 @@ static int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream)
 
 #else /* !CONFIG_SND_VERBOSE_PROCFS */
 static inline int snd_pcm_stream_proc_init(struct snd_pcm_str *pstr) { return 0; }
+static inline void snd_pcm_stream_proc_disconnect(struct snd_pcm_str *pstr) { return 0; }
 static inline int snd_pcm_stream_proc_done(struct snd_pcm_str *pstr) { return 0; }
 static inline int snd_pcm_substream_proc_init(struct snd_pcm_substream *substream) { return 0; }
 #endif /* CONFIG_SND_VERBOSE_PROCFS */
@@ -1119,6 +1125,7 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 	for (cidx = 0; cidx < 2; cidx++) {
 		if (pcm->streams[cidx].dev)
 			snd_unregister_device(pcm->streams[cidx].dev);
+		snd_pcm_stream_proc_disconnect(&pcm->streams[cidx]);
 		free_chmap(&pcm->streams[cidx]);
 	}
 	return 0;
