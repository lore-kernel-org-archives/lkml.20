Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DC3914EE;
	Wed,  2 Sep 2026 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333104; cv=none; b=h9/WCSdHICmQHHfcGQN1F3VvsMSWIVnagX1faUa+f/un0lryoL4oQBWkhE7mU45hnBPRewofNnXcYI6kA2soLM81dJrsLRSud+jIjgwH+Uh3nsB7vIkM4Lyle1FtjOwCHR4CxNNIpZqFURkcx/J37kDsnr0otAhdTQDFRY9Ac38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333104; c=relaxed/simple;
	bh=GV6M4cdU6qGF0k2bEfa0CLsqFP4nNxHbu59ZoT9VHG4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVuiRYTumxC8LaPTKZ+kZhAj1WJMTUn3g5Oik5B2y22kyWwYCPbHN8Uqma+lXSMTT1quMAEm9chtRiRyB0Wk8rCiFvTsYJSVRjCNKThHBxFZM+wDFjhouxABqhlSfx61rzwIDsv8k4Xbt/CRU2kaxDSrM8pD8MGZC9CJKUrlxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KiEXrVGS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jGvh4fX3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m6OdI7YS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QTn1zXGN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KiEXrVGS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jGvh4fX3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m6OdI7YS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QTn1zXGN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 82E161F8C3;
	Wed,  2 Sep 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788333096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hznd+LNCBrhd+1iZfo6p7nZyidViG6hmD5KLN07B/WI=;
	b=KiEXrVGSdL5yLNPu8UTkw5ctwH5FwBu2KmXsPHljKbBNtFW6sQkZlhVbuDgAuXHVPFLRlR
	kA7VNUF0t2DiSvA0U2s2DaO2ezJnO6EaduxCkI7udX7X4Cl0yMKtAP/me6xbp1G+qfOBnJ
	puiCfppBsnJXKKhvkLG1G9o4BgMr4DI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788333096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hznd+LNCBrhd+1iZfo6p7nZyidViG6hmD5KLN07B/WI=;
	b=jGvh4fX3PNhJk+C7OwUiMfJ1JO67Bd9wwACTIt/z8Cjr/zdY/XwYDU/Ep27e4f9O+O7H9z
	k2jE19DZj0NFnCBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788333092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hznd+LNCBrhd+1iZfo6p7nZyidViG6hmD5KLN07B/WI=;
	b=m6OdI7YSI8hVIJjIqU6zXUQYd8EUu+vzzRpqS9APAFm41hcRZkF/RcnPUeXZlFVzO3CDyG
	j8o7drnT3cr9bpFYynPeyokZ7ZpOIS3XdwgiN/wUudlD1ypVYzwXRvvS0MrCj11p4Em356
	ZGJIE08ZC1NBnqP22lOdh8r05SVitOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788333092;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hznd+LNCBrhd+1iZfo6p7nZyidViG6hmD5KLN07B/WI=;
	b=QTn1zXGNy3TenmUtj1ejbp2LCsQpcLhScYNChSGe7RKx622d8o/DibWR5fQaKYWNxpJ34r
	B+J8nD5ofJEK4kCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3573513736;
	Wed,  2 Sep 2026 07:11:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 79W9CyTMl2qSVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 07:11:32 +0000
Date: Wed, 02 Sep 2026 09:11:31 +0200
Message-ID: <87ecfcb00s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Qingyu Zhang <usupergate@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] ALSA: ump: NULL deref of legacy_rmidi after parse sets parsed
In-Reply-To: <CAPBHdakPAZfcP9PTKHiTQMHeEi8g7Xemg_UOByZAqKx6epxJ3A@mail.gmail.com>
References: <CAPBHdanmknKKhhc+5r8jPsnyZW8LYVq0qpzfEVrvjL3i5sNuJQ@mail.gmail.com>
	<87mru0b1z3.wl-tiwai@suse.de>
	<CAPBHdakPAZfcP9PTKHiTQMHeEi8g7Xemg_UOByZAqKx6epxJ3A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Wed, 02 Sep 2026 08:58:34 +0200,
Qingyu Zhang wrote:
> 
> Dear Takashi,
> 
> Thank you for your email. The formatted patch with the Signed-off-by
> tag is attached; please check.

The Signed-off-by tag must be with a real name (or a known identity).
Please resubmit with the corrected tag.  And, at best, not as an
attachment to this thread, but a new thread via git-send-email or
such.


thanks,

Takashi

> 
> Yours,
> Ian
> 
> >
> > On Wed, 02 Sep 2026 04:07:30 +0200,
> > Qingyu Zhang wrote:
> > >
> > > Hello,
> > >
> > > ump_legacy_set_rawmidi_name() snprintf()s into ump->legacy_rmidi->name
> > > when ump->parsed is true, but parsed is set at the end of
> > > snd_ump_parse_endpoint() *before* snd_ump_attach_legacy_rawmidi().
> > > A UMP packet in that window NULL-derefs.
> > >
> > > Type: null-pointer dereference
> > >
> > > * Summary
> > >
> > > snd_ump_parse_endpoint() always does:
> > >
> > >        error:
> > >                ump->parsed = true;
> > >                ...
> > >
> > > ump_handle_ep_name_msg():
> > >
> > >        if (ret && ump->parsed) {
> > >                ump_set_rawmidi_name(ump);
> > >                ump_legacy_set_rawmidi_name(ump);  /* rmidi may be NULL */
> > >        }
> > >
> > > ump_legacy_set_rawmidi_name():
> > >
> > >        rmidi = ump->legacy_rmidi;
> > >        snprintf(rmidi->name, ...);   /* no NULL check */
> > >
> > > This runs from snd_ump_receive() on the USB input URB complete path
> > > (in interrupt).
> > >
> > > * Affected
> > >
> > > 37e0e14128e0. Needs CONFIG_SND_UMP, CONFIG_SND_UMP_LEGACY_RAWMIDI,
> > > CONFIG_SND_USB_AUDIO, a MIDI 2.0 gadget or device. KASAN.
> > >
> > > The natural window is parse-done vs attach. The QEMU PoC widens it
> > > with a kprobe on snd_ump_receive (poc/widen_ump.c) plus dummy_hcd
> > > configfs midi2, because the un-widened window is short.
> > >
> > > * Reproduction
> > >
> > >        # dummy_hcd + configfs usb_gadget midi2.usb0 (see poc/run.sh)
> > >        # with widen_ump.ko: force parsed=1, legacy_rmidi=NULL on receive
> > >
> > > KASAN: null-ptr-deref in snprintf from ump_legacy_set_rawmidi_name
> > > <- ump_handle_ep_name_msg <- snd_ump_receive <- input_urb_complete.
> > > Then "Fatal exception in interrupt".
> > >
> > > * Expected
> > >
> > > legacy_rmidi helpers no-op until attach has stored the pointer.
> > >
> > > * Actual
> > >
> > > IRQ-context NULL deref.
> > >
> > > Please consider the suggested patch
> > >
> > > Thanks.
> > >
> > > Suggested patch:
> > > ```
> > > diff --git a/sound/core/ump.c b/sound/core/ump.c
> > > index d183c8a000bd..3d1a2ed3b476 100644
> > > --- a/sound/core/ump.c
> > > +++ b/sound/core/ump.c
> > > @@ -1335,6 +1335,8 @@ static void update_legacy_names(struct
> > > snd_ump_endpoint *ump)
> > > {
> > >     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> > >
> > > +    if (!rmidi)
> > > +        return;
> > >     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
> > >     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
> > > }
> > > @@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct
> > > snd_ump_endpoint *ump)
> > > {
> > >     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> > >
> > > +    if (!rmidi)
> > > +        return;
> > >     snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
> > >          ump->core.name);
> > > }
> > > ```
> >
> > Thanks for the report.  The suggested code change looks good.
> > Could you submit a patch in the proper format for upstreaming
> > (especially with your Signed-off-by tag)?
> >
> >
> > thanks,
> >
> > Takashi
> From: Ian <usupergate@gmail.com>
> Date: Mon, 31 Aug 2026 17:00:00 +0800
> Subject: [PATCH] ALSA: ump: do not touch legacy_rmidi before it exists
> 
> snd_ump_parse_endpoint() sets ump->parsed on every exit, including
> error, before the caller attaches the legacy rawmidi device.
> ump_handle_ep_name_msg() then treats parsed as "legacy_rmidi is live"
> and calls ump_legacy_set_rawmidi_name(), which snprintf()s into
> ump->legacy_rmidi->name. If a UMP packet arrives in that window
> (IRQ path from snd_ump_receive), legacy_rmidi is still NULL
> (KASAN null-ptr-deref in snprintf).
> 
> Guard the legacy helpers. parsed only means endpoint info was
> parsed, not that legacy_rmidi exists.
> 
> Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian <usupergate@gmail.com>
> ---
> diff --git a/sound/core/ump.c b/sound/core/ump.c
> index d183c8a000bd..3d1a2ed3b476 100644
> --- a/sound/core/ump.c
> +++ b/sound/core/ump.c
> @@ -1335,6 +1335,8 @@ static void update_legacy_names(struct snd_ump_endpoint *ump)
>  {
>  	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
>  
> +	if (!rmidi)
> +		return;
>  	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
>  	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
>  }
> @@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct snd_ump_endpoint *ump)
>  {
>  	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
>  
> +	if (!rmidi)
> +		return;
>  	snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
>  		 ump->core.name);
>  }
