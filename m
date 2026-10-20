Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502074;
	b=4Zec9Hx3YRSWUUkARze4YxK+PU+l9v6Bdqf5mf8MaxtFwKn3iwmmGLeq1ubFSElCU8h6
	 oCVOVuB+soOuUMMEzWQ4J6cI9s3mwIx4CfgnkeiNZkEMoUOtECHlxjE1mP6aWEag5GJ+t
	 khv2k9501B9wMIG/WcJ2Hdg+JuKjWpbWqqNEJf7h0Jkcs/IkG0NKD3P4tf8Avc98L0zW5
	 IiBhZn2JtGkNglzy8afef2AVMXhTZR7xWqeVGrcSZojX6MQ8zrHWrh6f5iMRdg2/XT+e3
	 VN9bGiG5F6+HJymuBD8erbF50e2KacEqhuWujZkeHcnp7G8c+B5EW/q+Lhb8wU41PmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502074;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spamd-Result;
	bh=a1ETZyjvNwOwK4fQTnW5uRndAC7ozp+fDrrvFgWzdeg=;
	b=GLln3HdpysJAQd2Xj/pwLdTbGx6zTcS4UnQlPBfm23uixHeXnEYOK6RmDZdjNt8vgSc5
	 GUVDB5LJJJ8CUw9998IRLORQljxlZK7b7UODiupLL2OhEBsSV6LeTZwQQLPLmUsOwvIVe
	 Xem0MDwBaH38vfbdJrqxKkX5YabdRMqv+bs40HxI5TutqE4D3TfRqoHl/dJD645tW1brD
	 FDfUehvv2BP43sanho55WB7dXu0RZhgQXNxbXCEGmuc9AIJFpojKYL8vKWoVyDNrzAEz4
	 JBWwDOEdjFkUwijGGeBsyHG6qZN3+MBh6MjjL2SCWjVR970TJlnwZo5kx0K6l6Nt6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G3KrAC1s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mt4HeleZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G3KrAC1s;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mt4HeleZ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F32606A31A;
	Tue, 20 Oct 2026 13:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G3KrAC1s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mt4HeleZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G3KrAC1s;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mt4HeleZ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A500A21C73;
	Tue, 20 Oct 2026 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792502071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1ETZyjvNwOwK4fQTnW5uRndAC7ozp+fDrrvFgWzdeg=;
	b=G3KrAC1sdKe+TWF6hcUlR8TLEDj1yrCx9a3SiwDdvW+D/HcRZszmwGB034oD5pfaGGk88/
	f4xncI+bw2Qc4T/g38uLgwwP1EXhEBPj3s6Lbi1Pq4EFp/6w3VtEKGVGkIkjsXHt/MX7PX
	HJWrXFA4rWChUw57U0Mob+60tMp2tzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792502071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1ETZyjvNwOwK4fQTnW5uRndAC7ozp+fDrrvFgWzdeg=;
	b=mt4HeleZZwrgN6iMwaPXzrsplTXnSB0rg185iYo27vfJ0Bpuey57hZq8NUakJw07XAoeTS
	7wZmdNXlbshwFZDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792502071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1ETZyjvNwOwK4fQTnW5uRndAC7ozp+fDrrvFgWzdeg=;
	b=G3KrAC1sdKe+TWF6hcUlR8TLEDj1yrCx9a3SiwDdvW+D/HcRZszmwGB034oD5pfaGGk88/
	f4xncI+bw2Qc4T/g38uLgwwP1EXhEBPj3s6Lbi1Pq4EFp/6w3VtEKGVGkIkjsXHt/MX7PX
	HJWrXFA4rWChUw57U0Mob+60tMp2tzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792502071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1ETZyjvNwOwK4fQTnW5uRndAC7ozp+fDrrvFgWzdeg=;
	b=mt4HeleZZwrgN6iMwaPXzrsplTXnSB0rg185iYo27vfJ0Bpuey57hZq8NUakJw07XAoeTS
	7wZmdNXlbshwFZDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 586CB136CC;
	Tue, 20 Oct 2026 13:14:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JjqCDjdp12pBbwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 13:14:31 +0000
Date: Tue, 20 Oct 2026 15:14:30 +0200
Message-ID: <874iegh5u1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Frank van de Pol <fvdpol@gmail.com>
Cc: tiwai@suse.de,
	perex@perex.cz,
	corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/13] ALSA: jockey3: Add support for Reloop Jockey 3 DJ controllers
In-Reply-To: <20261019174445.1931263-1-fvdpol@gmail.com>
References: <20261019174445.1931263-1-fvdpol@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Mon, 19 Oct 2026 19:44:32 +0200,
Frank van de Pol wrote:
> 
> Hi Takashi, Jaroslav, and the ALSA community,
> 
> v5 is v4 split into a series, as Takashi asked. While splitting it,
> reviewing each patch on its own turned up a few small opportunities to
> harden the driver further. They are listed below and folded into the
> patch that introduces the code they touch. Apart from those and the
> KUnit fix, the code at the end of the series is the code of v4.
> 
> Link: https://lore.kernel.org/all/20260925021915.78909-1-fvdpol@gmail.com/
> 
> Changes v4 -> v5:
> 
>  - Split the single patch into 13 patches (see below).
>  - Move the KUnit batch-equals-single test buffers to the heap. On the
>    stack they exceeded -Wframe-larger-than on 32-bit (1440 > 1280 bytes
>    on arm-allyesconfig). Reported by the kernel test robot; the fix is in
>    patch #5.
>    Link: https://lore.kernel.org/all/202609260711.YnOvPZGc-lkp@intel.com/
>  - Replace the per-model Assisted-by: lines with a single
>    "Assisted-by: LLM" as suggested.
>  - Probe (patch 1):
>    - initialize fw_version before it is logged;
>    - validate the endpoints on altsetting 1 only, the setting the driver
>      selects;
>    - move the card slot handling out of probe() into helpers;
>    - stop the initialization retry loop as soon as EP0 stops answering,
>      instead of retrying for ~20 s;
>    - free the card with snd_card_free_when_closed() on the probe error
>      path, because snd_card_register() can fail after it has created
>      device nodes.
>  - Ratelimit the short capture URB error (patch 4).
>  - Build the codec lookup tables only once (patch 6).
>  - Every stall recovery now reports an xrun on both directions,
>    including a recovery started from .prepare while the sibling stream
>    is running (patch 8).
>  - .prepare waits for a recovery that is already in flight before it
>    lets a stream start (patch 8).
>  - An idle capture stall no longer sets the watchdog's tick rate
>    (patch 9).
> 
> How the series is split:
> 
>    1  probe skeleton: device IDs, endpoint checks, the Ploytec
>       initialization handshake, a card with no devices
>    2  bulk streams: the three URB rings, running with idle payloads
>    3  PCM playback, with the portable encoder
>    4  PCM capture, with the portable decoder
>    5  KUnit tests for the codec
>    6  optimized 64-bit and 32-bit codec variants
>    7  several packets per URB optimization
>    8  recovery of a stalled stream, and USB reset handling
>    9  watchdog for stalls in a running stream
>   10  sample rate switching
>   11  MIDI
>   12  power management
>   13  documentation
> 
> Takashi's list also named mixer support. The device has no hardware
> mixer or volume controls that the driver could expose, so there is no
> patch for it. The only control elements are the channel maps, which
> arrive with PCM in patches 3 and 4.
> 
> Notes on the split:
> 
>  - Every patch builds on x86_64, i386, arm64 and armhf clean at W=1,
>    and is checkpatch --strict and kernel-doc clean. At W=12 and under
>    sparse the only warnings are shadowing reports caused by kernel
>    macros: the index[] module parameter shadowing the index() builtin,
>    and the __ret locals of the wait_event*() family. The KUnit suite passes at
>    every step from patch 5 on, and from patch 6 on that holds for both
>    the optimized and the portable codec.
>  - From patch 2 on, the driver services all three bulk endpoints.
>    Later patches only change what goes into the packets and what is
>    taken out of them. I did this because the firmware is sensitive to
>    deviations from the vendor sequence, and someone bisecting should be
>    able to boot any patch with the device attached.
>  - The rate is fixed at 44.1 kHz until patch 10.
>  - Two function arguments exist before their second caller, to avoid
>    changing signatures inside the series: bounce_alt0 in
>    ploytec_initialize_device() (patch 1) and cold_init in the rate
>    setting path (patch 2). Both get their other caller in patch 10, and
>    the commit messages say so.
>  - The comment blocks at the top of jockey3.c (device model, resource
>    lifetime, locking) grow with the code they describe.
> 
> Testing:
> 
>  - The series was tested cumulatively, to check that it is bisectable.
>    For each N from 1 to 12, I built the tree with patches 1..N applied,
>    loaded the module on x86_64 with the device attached, and ran the
>    checks that the functionality present at that point allows: a smoke
>    run for patches 1-6, the functional suite for patches 7-12, with an
>    operator for the MIDI cases. At every step the device is detected and
>    bound without errors, and what a step adds works as described in its
>    commit message. Patch 13 is documentation only.
>  - These runs are on the final content of each patch, including the
>    fixes listed above.
> 
> Best regards,
> Frank
> 
> 
> Frank van de Pol (13):
>   ALSA: jockey3: Add probe skeleton for Reloop Jockey 3 DJ controllers
>   ALSA: jockey3: Start the bulk streams
>   ALSA: jockey3: Add PCM playback
>   ALSA: jockey3: Add PCM capture
>   ALSA: jockey3: Add KUnit tests for the Ploytec codec
>   ALSA: jockey3: Add optimized codec variants
>   ALSA: jockey3: Coalesce several packets into one URB
>   ALSA: jockey3: Recover a stalled stream
>   ALSA: jockey3: Add a watchdog for mid-stream stalls
>   ALSA: jockey3: Add sample rate switching
>   ALSA: jockey3: Add MIDI support
>   ALSA: jockey3: Add power management
>   ALSA: jockey3: Add driver documentation

Thanks, this makes it much easier to digest and review.
Now it's already a time for 7.4 merge window, so I'll check the series
after merge window is closed.  Meanwhile, Sashiko already reviewed,
and you can enjoy its complaints :)


Takashi
 
