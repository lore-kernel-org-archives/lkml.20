Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E7377541;
	Fri, 28 Aug 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924993; cv=none; b=Zu0fpWsmh1YI7lXb64nUWaGlda4CZha6EAMuSrJF0gdYPaUSxG+j4VZ6Rax13pBABvyTZJarMjOycrhgmsEi9DIdVChpwy7f6a2e7Jp4rL7mkg4wcxtuJOre1zGBjPZBSgGUS8Eiu/AOgtFToIaIXF3XvCItf5BpwvZ3ujoJswc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924993; c=relaxed/simple;
	bh=L/vtVOuW152LypUSH+OZVSSz4b7e/pD6T/lCivxelpw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/nITJSS6qp/XJ4b3MHbYkxeLFgu09b9wdhFA5+eDbWQhDdEjwuLZzRzbzT67HvLA64w8PfhDOOt4LQrHFnkLi3SzFRlCK3r5X2K6aoz3iD8/bMAhrBTF5LtWRG4ixP5C6kiAe9FRkQXdwiAgwxrOLOUtvgE5Z9TMDHKRg1uwz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uZaK880V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yqOZ/ggz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iQIxoWgQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1z2TNRvZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uZaK880V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yqOZ/ggz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iQIxoWgQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1z2TNRvZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4F0F1FDEF;
	Fri, 28 Aug 2026 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787924962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXlN0Lemb4BL44E4k0eIHMPf36FJp1GheSM6Mt20CWI=;
	b=uZaK880VjicEmP7d0TP/bv5QZh6K9ANPOEdEamUCkpzpSCqoUBKQFutMzghSoq/cg3cMDT
	rVtQ2nIitBuJibstKhYhF6LUqgFwPfY1oLNJ95qq8CEJv9qGsLSs1NcWJ5DacQfAkKeH/S
	ymTUBRKW55su3OylNxqXzGuGvTATJ/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787924962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXlN0Lemb4BL44E4k0eIHMPf36FJp1GheSM6Mt20CWI=;
	b=yqOZ/ggzHYj84l8iGctiqty9wE+Oi8xlaPUpfeQ/YwRjq8sieVxnJZ+Ao0AULUSgktDisa
	4DjrCygDyiZDT9Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787924957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXlN0Lemb4BL44E4k0eIHMPf36FJp1GheSM6Mt20CWI=;
	b=iQIxoWgQGPyhEjwUKjrx6IrY0pVrjYDG0GwMfREUNmaB2LXUw38LebcIn3APWoDnvlWlG7
	SPTphIQZee8R5LIIYLFY+KpRujPpweIeLbCTh8O7nh4VF36UneiEeinRuOpnHpv7DuGJ4x
	afvCg42KNWbfymexS+/fZdbcGO/6Dqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787924957;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OXlN0Lemb4BL44E4k0eIHMPf36FJp1GheSM6Mt20CWI=;
	b=1z2TNRvZvz1wc81sz2aHdHV3Ki7W+n94JmbiugyVM2kjQI4qctymKc7BH/L1XwlCrnIhTE
	A/qvWYLwUcuZhuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B8A31352D;
	Fri, 28 Aug 2026 13:49:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2/WxIN2RkWpzBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Aug 2026 13:49:17 +0000
Date: Fri, 28 Aug 2026 15:49:17 +0200
Message-ID: <87se3ytkwy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: ALSA: usb-audio: guessed channel positions on a device that names its channels
In-Reply-To: <CABXGCsPh2d=1tJzszkFFQS=WrtNh3pD+Mhv_uj9VE2w58QPQrA@mail.gmail.com>
References: <CABXGCsPh2d=1tJzszkFFQS=WrtNh3pD+Mhv_uj9VE2w58QPQrA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 24 Aug 2026 00:55:21 +0200,
Mikhail Gavrilov wrote:
> 
> Hello,
> I ran into this setting up a Topping M62 on Linux. It is a USB
> interface with ten playback channels and sixteen capture channels --
> five stereo pairs out, a set of inputs and loopback returns in. Nothing
> about it is a home cinema. But alsamixer labels its playback controls
> M62 Front, Rear, Center, Woofer and Side, its capture controls Mic
> Front, Rear, Center, Woofer and Side, and a player that lists ALSA
> devices directly offers "5.1 Surround output to Front, Center, Rear and
> Subwoofer speakers" for it. Choosing one of those gives silence or the
> wrong pair, and nothing explains why.
> 
> The layout is not in the descriptors. Every AudioStreaming interface on
> this device declares bmChannelConfig 0x00000000. It comes from
> convert_chmap() in sound/usb/stream.c:
> 
> } else {
> /* If we're missing wChannelConfig, then guess something
>    to make sure the channel map is not skipped entirely */
> if (channels == 1)
> chmap->map[c++] = SNDRV_CHMAP_MONO;
> else
> for (; c < channels && *maps; maps++)
> chmap->map[c++] = *maps;
> }
> 
> for (; c < channels; c++)
> chmap->map[c] = SNDRV_CHMAP_UNKNOWN;
> 
> The standard position list is walked positionally, so channel 3 becomes
> FC, channel 4 LFE and so on, while the honest answer the next lines
> already use for the tail -- SNDRV_CHMAP_UNKNOWN -- never reaches the
> head.
> 
> What makes this more than an unlucky guess is that the device does say
> what its channels are, in the field beside the one we read:
> 
> bNrChannels            10
> bmChannelConfig    0x00000000
> iChannelNames          11 Playback 1
> 
> bNrChannels            16
> bmChannelConfig    0x00000000
> iChannelNames          21 Analogue 1
> 
> iChannelNames indexes the name of the first channel and the rest follow
> in order. Reading those string descriptors from the same Linux machine
> gives:
> 
> 11  Playback 1        21  Analogue 1      29  Loopback 1
> 12  Playback 2        22  Analogue 2      30  Loopback 2
> 13  Playback 3        23  AUX 1           31  Loopback 3
> 14  Playback 4        24  AUX 2           32  Loopback 4
> 15  Playback 5        25  BT 1            33  Loopback 5
> 16  Playback 6        26  BT 2            34  Loopback 6
> 17  Playback 7        27  Mobile 1        35  Loopback 7
> 18  Playback 8        28  Mobile 2        36  Loopback 8
> 19  Playback 9
> 20  Playback 10
> 
> That is the hardware, exactly: two microphone inputs, a stereo AUX, a
> Bluetooth return, a phone return and eight loopback returns. In
> sound/usb the field appears only in validate.c, counted towards a
> descriptor's expected length and never read.
> 
> Two questions, then, and I would rather ask than send a patch that
> guesses at the answer.
> 
> Should the positional guess stop where the position list stops meaning
> anything? For two channels it is almost always right and clearly
> useful. For ten or sixteen it is not uncertain but wrong, and UNKNOWN
> is both honest and already available.
> 
> And is there interest in surfacing iChannelNames at all? The chmap API
> is positional and has no room for free text, so this is not a matter of
> filling in a map -- it would need somewhere new to live, and I do not
> want to invent that unilaterally. But devices do provide these names,
> and on an interface with ten identical-looking channels they are the
> only thing that tells a user which is which.
> 
> Happy to write either patch if a direction is agreeable.

I'd say yes for both.  It's beyond the standard definition, so we'd
just need to do the best.


thanks,

Takashi
