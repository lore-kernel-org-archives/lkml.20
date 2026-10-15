Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4155D886;
	Thu, 15 Oct 2026 18:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090590; cv=none; b=txHnZ1XC6pBiIQ1Kx/mSPK/1l/Q8/ZCBy/MVyx/pBkom6K/sLl3wygpL5e3ejJ+tXoEDczLEFJRty1K4snJ08XAnXWgVmRWgjTJZXqPtImLaHXQMc+MnXsSMXzCIfZ51L7linxD2+XO4sxhmg7kBNZqbPlizeIsl6ds8lcVYKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090590; c=relaxed/simple;
	bh=TpL3AL+DPLyvjc59lhaDDL+UzcNvTzAPwCOP4r44f/c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cfXCriGKiXK8p1Nb2yBphZejYccqCBanr5kJH9mq6Rxg2XRy2wTxY/LsmMVyo0oVR8OPMmAOzUFWEnAxB2ASFY5qCMHiSfgk6s67ieUYQmORD6vtK5+G4WpR2XU3jFzPlCflO/oH5+8BPuEa3Tjk+J2MEu0oZCMRqPaUbNLjVdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DZByGVhl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1/9Sl0xs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xYpch03A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BQW3L8Sj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DZByGVhl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1/9Sl0xs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xYpch03A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BQW3L8Sj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6BD9E21FB2;
	Thu, 15 Oct 2026 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792090584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DYdVznP4V2nXI5G3D8OFKhVnP9OHZHEq/UKx3pvMMg=;
	b=DZByGVhlaJWR0AXGe09JZxo5azVqC0JmifzxIo47AAqRaUiWABzpAF3XC1q5Rn6yyLw38f
	woZUhrZsDAyx1urs63lyZVQadFafGXBmKcMDt7xKIiyKqOTZPFoxZRHhOpTYf0CgkOILxi
	lf6v54xJnh2KhTpLP64qbsNcIWN9LI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792090584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DYdVznP4V2nXI5G3D8OFKhVnP9OHZHEq/UKx3pvMMg=;
	b=1/9Sl0xstsljIX60qqJ4rtNhMC5pjY1eX7p2gmllfUwTypIP6p8uaroFTVyJaSWu5LXRbR
	sntqv42EMf+b0wDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792090583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DYdVznP4V2nXI5G3D8OFKhVnP9OHZHEq/UKx3pvMMg=;
	b=xYpch03AooGnsUxSnXua5WzLWaeE2N4rNHTSSTXtY6Z6ehiOIPp2/I3POy0E7zkvI1angN
	bVzLzva+7MhANwulceQOyR7QTFEZ1rwEuBN0k2fpvbFRceF6wavzyKGWxC2lZlfBXZ3/oz
	FJ6VAWkvZ8+9KiwW345cFnEJCx/qAjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792090583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DYdVznP4V2nXI5G3D8OFKhVnP9OHZHEq/UKx3pvMMg=;
	b=BQW3L8SjnE28Yyd+pXYP0KWbN6y79CvwN68ogeaVP1lnCWBbMuqGVkMfm/zPbH8JphlcNY
	suNexLdRFkjabdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26C901321C;
	Thu, 15 Oct 2026 18:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zJWOItUh0WrbIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 18:56:22 +0000
Date: Thu, 15 Oct 2026 20:56:21 +0200
Message-ID: <874iem7pyi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Apply sync-stop at SNDRV_PCM_IOCTL_DROP ioctl
In-Reply-To: <c2bc1478-5999-455f-bd67-8b536c452215@samsung.com>
References: <20261014142454.320703-1-tiwai@suse.de>
	<CGME20261015183022eucas1p10d5777e112c34458f4b360407d2228c4@eucas1p1.samsung.com>
	<c2bc1478-5999-455f-bd67-8b536c452215@samsung.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 15 Oct 2026 20:30:21 +0200,
Marek Szyprowski wrote:
> 
> On 14.10.2026 16:24, Takashi Iwai wrote:
> > When a PCM stream is stopped via SNDRV_PCM_IOCTL_DROP ioctl, it calls
> > snd_pcm_stop() but sync-stop operation is missing.  Although this is
> > usually no big issue, let's add snd_pcm_sync_stop() call, just to be
> > sure.
> >
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/core/pcm_native.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> > index 6c379068b54c..7ffbf2c0ea92 100644
> > --- a/sound/core/pcm_native.c
> > +++ b/sound/core/pcm_native.c
> > @@ -2332,6 +2332,8 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
> >  	result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
> >  	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
> >  
> > +	snd_pcm_sync_stop(substream, true);
> > +
> >  	return result;
> >  }
> 
> This patch landed in today's linux-next as commit fdf9a21cda78 ("ALSA: pcm: Apply
> sync-stop at SNDRV_PCM_IOCTL_DROP ioctl"). In my tests I found that it triggers
> the kernel bug about invalid context for sleeping.
> 
> It looks that thissnd_pcm_sync_stop() should be called outside the scope of
> the guard(pcm_stream_lock_irq)(substream).

Gah, obviously it's calling in a wrong context, and I overlooked
guard() line.

I'm going to submit the trivial fix.


thanks,

Takashi
