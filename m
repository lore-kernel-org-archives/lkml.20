Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792784306;
	b=otAgWxwrH/1hflVypaZyI2AGZLOVzNgFC4XDcoAvTmT+X0h4Utreo9SLt++b3vAlkPHX
	 V9LF3b0DvT+o34SckJdsounEnX/s1Ak39c2lmXrQ9/IiLJiVF3gkdaVRvXihfV0BaKANM
	 GhlvMsoN6IwmxKHpEwJb2Hrvhu1a+0SjKFheK0+OeL5AxK0R0/5BDuysQ5ZkUoGW2gCud
	 6VjgQcoy8gFQKBcc4vAFLs+X4JF7VNaewj7+/r17s53jg8CkmIpRbcwohR0/o753ind0E
	 0Vc4nybBL+E8ySfX/LkHIQgsRNgUtF+KMo/nCJ1E1GmqcwrXmtmwYXbtfMXe1FzQJfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792784306;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=hGaX3Nx8hnaYCeVvs2W5EdGcdnzvU81ApHISG5GBZYw=;
	b=bgHSWjejswiY80JX9x9XPDW4wi8Hp1clKVthvi57Q6qIK4GvaK50b6A7jkk5Qdc33SWp
	 D6E/sazKPOLSI7YTq7qDyemUtAgvcocZrYW/egSHF69O5EyfR9YBCAp8kie2TwcK3Qafk
	 U1a9eQW4yBZOL6hsZFPlYJgaFm9Ngj167PXQBXZoM5+N5B32d6fakFHAQl1oB9LSA2ZkR
	 +L1NulVLJQcq3H6x6VET8mQslV1Hdk+GjglfF+EhK9xcqlSR4YAklCvEFO8ykMuL8afbG
	 G6EmMY3clbWNdyYF8Q9/iGVeVw1lxX1l+q+aaCisnLRJjmNjORMs3KlthtDeFIVlyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pRKm0l6J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SXeSBLfN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pRKm0l6J;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SXeSBLfN;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E0606A31A;
	Fri, 23 Oct 2026 19:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pRKm0l6J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SXeSBLfN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pRKm0l6J;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SXeSBLfN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D79E22123;
	Fri, 23 Oct 2026 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792784303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGaX3Nx8hnaYCeVvs2W5EdGcdnzvU81ApHISG5GBZYw=;
	b=pRKm0l6J5FTuIFwUBo6yxto0WN9r2dQDQN80/3fb3cQ2iFdnPDKvs//B2UiSpSQMNXuIy1
	vbvGVsICCM2SVGF9HuBBSszk4ysGP80UnXTPI4loGvDbnYrCDCazUEYmvawbADjvQ5Aa6c
	YPfoCRrbGUYj3ssCHX2AogFHr8fNVLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792784303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGaX3Nx8hnaYCeVvs2W5EdGcdnzvU81ApHISG5GBZYw=;
	b=SXeSBLfNsvbelXV0aYiCeSaRK5BUGerBrTq+uRW6lLxFe66ioDTxU5rlHF4w7fAprbcwJD
	On76g/xyArBJFgBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pRKm0l6J;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SXeSBLfN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792784303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGaX3Nx8hnaYCeVvs2W5EdGcdnzvU81ApHISG5GBZYw=;
	b=pRKm0l6J5FTuIFwUBo6yxto0WN9r2dQDQN80/3fb3cQ2iFdnPDKvs//B2UiSpSQMNXuIy1
	vbvGVsICCM2SVGF9HuBBSszk4ysGP80UnXTPI4loGvDbnYrCDCazUEYmvawbADjvQ5Aa6c
	YPfoCRrbGUYj3ssCHX2AogFHr8fNVLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792784303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGaX3Nx8hnaYCeVvs2W5EdGcdnzvU81ApHISG5GBZYw=;
	b=SXeSBLfNsvbelXV0aYiCeSaRK5BUGerBrTq+uRW6lLxFe66ioDTxU5rlHF4w7fAprbcwJD
	On76g/xyArBJFgBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1EDA133F6;
	Fri, 23 Oct 2026 19:38:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5ChjHa6322o+TQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 19:38:22 +0000
Date: Fri, 23 Oct 2026 21:38:22 +0200
Message-ID: <87qzhg8axd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28Th?=
 =?ISO-8859-1?Q?e_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>,	Zhao
 Dongdong <zhaodongdong@kylinos.cn>,	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cmipci: Use strscpy() in snd_cmipci_create()
In-Reply-To: <20261023194059.4e307a32@pumpkin>
References: <20261022164013.95811-2-blum@kernel.org>
	<20261023194059.4e307a32@pumpkin>
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
X-Rspamd-Queue-Id: 2D79E22123
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -11.01

On Fri, 23 Oct 2026 20:40:59 +0200,
David Laight wrote:
> 
> On Thu, 22 Oct 2026 18:40:11 +0200
> Thorsten Blum <blum@kernel.org> wrote:
> 
> > To prepare for removing strlcat() from the kernel [1], use strscpy()
> > instead with the current driver name length as the append offset. Also
> > use size_t in the multi-channel branch to match strlen()'s return type.
> > 
> > No functional change.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >  sound/pci/cmipci.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
> > index 9d9f784e3a8c..5722b722da95 100644
> > --- a/sound/pci/cmipci.c
> > +++ b/sound/pci/cmipci.c
> > @@ -2980,11 +2980,15 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
> >  		query_chip(cm);
> >  	/* added -MCx suffix for chip supporting multi-channels */
> >  	if (cm->can_multi_ch) {
> > -		int l = strlen(cm->card->driver);
> > +		size_t l = strlen(cm->card->driver);
> > +
> >  		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
> >  			  "-MC%d", cm->max_channels);
> > -	} else if (cm->can_ac3_sw)
> > -		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
> > +	} else if (cm->can_ac3_sw) {
> > +		size_t l = strlen(cm->card->driver);
> > +
> > +		strscpy(cm->card->driver + l, "-SWIEC", sizeof(cm->card->driver) - l);
> > +	}
> 
> There are all sorts of reasons for not using strlcat() and various ways
> of changing code so that it doesn't need to do the string concatenation.
> But replacing calls with strlen() and strscpy() is just plain stupid.
> 
> It has no benefits and lots of downsides.

Right.  The whole actions look to me like a crusade to a wrong goal.

I was too tired of discussing the same thing again and again, so I
gave and took it once; but now I change mind and drop it again from
the queue.  The other patches from Thomas were OK as they can be seen
as optimizations, but this one has only downsides.


thanks,

Takashi
