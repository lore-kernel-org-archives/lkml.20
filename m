Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616753F58C9;
	Thu, 15 Oct 2026 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081160; cv=none; b=PONKBITkJ6j7vVeiffUcthsfK4Ws9rSNZzkG7sccJ5iwVP5mV132D48gX95WKogNEs1eixuZw787pqvuU5d9oNlmaWwmydefHvuVhPdLqXFMclDEVPGFt20Vrce8Sl8sZ2SYPj5+AgBnT0YmloRgZCQVCjye3KZvFj7X6HkoLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081160; c=relaxed/simple;
	bh=po5HXruJpwckTyR/+Me64XnkD9DYoZAB1kvgWOOPowY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=obEFdx7xGa+Hhqz/cBy6LMAZTbobFwfcUCHrdlT5SIBrz3ZQquTfGTbjACjtOeVPKQXBn4uvAWQrf2sxkfCI7B0MUMJmCAmbyp4M8BdtzlxdgJ68xISmHNu0oFu/5KlGpKGODqNah5nqZsdzzqcNf+0W60jE8wrhD/BFNu9awbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jnsJflig; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PzpPbSFV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jnsJflig; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PzpPbSFV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jnsJflig";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PzpPbSFV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jnsJflig";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PzpPbSFV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 047A421ED3;
	Thu, 15 Oct 2026 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792081147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zJZhRIe66HcRNNvyY919R4QDhAQ13Lm7znLAWVOc0s=;
	b=jnsJflig+ig9tOhZgThNbrvstn8x/yLUl5dAr9X7u2e8iTrkllCEMaECCkNgOTOAT/loEZ
	S8IgKGlDA3AyZoN0nFqbhm0Y+MbUqQuQDqqOAzo9Q3oawFMRA7oVkFuoj1j4b7fdcnxNs5
	ScnbOs2mUHGBz9zXJImwgMlsUH7nQWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792081147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zJZhRIe66HcRNNvyY919R4QDhAQ13Lm7znLAWVOc0s=;
	b=PzpPbSFVNvrd8OHtTUFUhuFHoPHS1hMqNUup/vYpZ6waP21iRsPrj/yLoE56eco2D0upOj
	v8KrGN6fXItTGRAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jnsJflig;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PzpPbSFV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792081147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zJZhRIe66HcRNNvyY919R4QDhAQ13Lm7znLAWVOc0s=;
	b=jnsJflig+ig9tOhZgThNbrvstn8x/yLUl5dAr9X7u2e8iTrkllCEMaECCkNgOTOAT/loEZ
	S8IgKGlDA3AyZoN0nFqbhm0Y+MbUqQuQDqqOAzo9Q3oawFMRA7oVkFuoj1j4b7fdcnxNs5
	ScnbOs2mUHGBz9zXJImwgMlsUH7nQWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792081147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1zJZhRIe66HcRNNvyY919R4QDhAQ13Lm7znLAWVOc0s=;
	b=PzpPbSFVNvrd8OHtTUFUhuFHoPHS1hMqNUup/vYpZ6waP21iRsPrj/yLoE56eco2D0upOj
	v8KrGN6fXItTGRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 747261321C;
	Thu, 15 Oct 2026 16:19:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C6WTEvr80GpeAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 16:19:06 +0000
Date: Thu, 15 Oct 2026 18:19:06 +0200
Message-ID: <87h5in6io5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	cassiogabrielcontato@gmail.com,
	kees+treewide@kernel.org,
	yilinzhang@moonshot.ai,
	sammiee5311@gmail.com,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <CAFRLqsUY+RhE=CsMHAvcQtUmwE_hd4_WUhJKSJiwdUUE3a--Yg@mail.gmail.com>
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
	<87zewgcuhy.wl-tiwai@suse.de>
	<CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
	<87qzhrmnz3.wl-tiwai@suse.de>
	<CAFRLqsUY+RhE=CsMHAvcQtUmwE_hd4_WUhJKSJiwdUUE3a--Yg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 047A421ED3
X-Rspamd-Action: no action
X-Spam-Level: 
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
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,intel.com,kernel.org,moonshot.ai,linutronix.de,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[treewide];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.01

On Thu, 15 Oct 2026 17:35:30 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> Takashi Iwai <tiwai@suse.de> 于2026年10月15日周四 15:18写道：
> >
> > The patch I submitted yesterday is such an attempt:
> >   https://lore.kernel.org/20261014141212.316223-1-tiwai@suse.de
> >
> > Unfortunately it couldn't be reviewed by Sashiko, as it's based on my
> > latest tree.  And now I noticed that there is still a potential race,
> > and fixed now.  Will resubmit v2 patch.
> >
> >
> > thanks,
> >
> > Takashi
> 
> After read the v2 patch. I also have a minor concern: is there still a
> lifetime window between snd_refcount_put() and snd_refcount_sync()?
> 
> 
> Suppose drain(A) has pinned B's runtime, and close(B) has completed
> unlink and drop. Could the following happen on two CPUs?
> 
>   drain(A)                         close(B)
>   --------                         --------
>   finish_wait(&rt->sleep, &wait);
>   snd_refcount_put(&rt->refcnt):
>     decrement count to zero
>                                    snd_refcount_sync(&rt->refcnt);
>                                      /* sees zero and returns */
>                                    ...
>                                    snd_pcm_detach_substream(B);
>                                      kfree(rt);
>     wake_up(&rt->refcnt.waiter);
> 
> Here rt is B's runtime. Since wait_event() can return on its initial
> condition check, could the final wake_up() access the embedded
> waitqueue after rt has been freed? A holds its own stream lock at
> this point, while B has already been unlinked.

Yes, and it's covered by another patch:
  https://lore.kernel.org/20261015112256.3902-1-tiwai@suse.de


thanks,

Takashi
