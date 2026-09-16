Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC114F6469;
	Wed, 16 Sep 2026 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565907; cv=none; b=uhdCScLoqoIP4dcvydjIOK0lXk/H4dGR5gjbNiuc32KgOPIupDRITffSi9zWv6gEuIYyVArTYLCgYOASiBamToz/BfyTdCDGid/8WrGz3ocOvHCzG6uzq1/ERnjjldECQinXPRFJg47CgsNsuaxs1R6+ennCfnHipbAFHi3QfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565907; c=relaxed/simple;
	bh=fuBsbpigXt8rl/xctfu6h4Htdp0PNGGgrkMRqR0Fo90=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iovQFCdFukKjmiShb+dy3+FuQTKD7BigR17o/S9DVSl/OQyxPngAvok10UAHxLMeLGFc5pTpTo6Jw6ExQddPsgRAGIuwb4dTeeUI0Fb92YwLqFMbI/W/b5dshMWnPG/deXGBmvnvQvk7NOGh0BDW4H0lYi7AiCxwHVay8ZZ2xj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pNfxbv5e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hw2nSju/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uU/pgSib; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DbDmEYYo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pNfxbv5e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hw2nSju/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uU/pgSib";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DbDmEYYo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B014821B17;
	Wed, 16 Sep 2026 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789565887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThsH8r1A3eSYCfF5vCHdWdVDmJLOjxaFxZk4Ur818XM=;
	b=pNfxbv5eOS65FsIoi+q21OpCAbLo3BAiSjbniG2YuOUv/bEcmMhI72A2WnO0xIKXXnqo+G
	TgHG0Wt63uM7lyVKY09gcXwh410dNeMTuIQ1/ajLX7A4rf3nNSfuyNPK/igKlFreE93yOE
	bp/7mGKBD37n0bTDU653peDM+sRUyd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789565887;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThsH8r1A3eSYCfF5vCHdWdVDmJLOjxaFxZk4Ur818XM=;
	b=hw2nSju/r1VZo9eqEV7wdmDWFdaSF+1iE2eWgI02GN+Jqsn9Pnb3EUON7e2EH3gkA2M5aZ
	rJxVuJn4b9lUIjCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789565883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThsH8r1A3eSYCfF5vCHdWdVDmJLOjxaFxZk4Ur818XM=;
	b=uU/pgSibs/k7zjqKhG5RJ81cOSCI5OZvAoPdddBlis82K4bfgdGoXBEDCU/1PH9z772/J/
	SoKR69T9In3tP5Udek1vUd0VqSFTcdeTDkozH7Fz8Sg1Em09/ChpjKbM3A1VNjojTDghLX
	Gbr6DUK6tvzhyof9ikw76a6fYyfIT50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789565883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThsH8r1A3eSYCfF5vCHdWdVDmJLOjxaFxZk4Ur818XM=;
	b=DbDmEYYoSjTIwSVjPPxYGhKHwGyddVVDxXK71BWhHA7mR4jzG8IyZO+RdxSUBGgipeB17C
	XdofkGy0W7w9eSBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 540A61348F;
	Wed, 16 Sep 2026 13:38:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w8V8CrubqmoNKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 16 Sep 2026 13:38:03 +0000
Date: Wed, 16 Sep 2026 15:38:02 +0200
Message-ID: <87ecetjozp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Isma=EFl?= Bahloul <i.bahloul01@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 0/3] ALSA: usb: add RME Babyface Pro driver (proprietary mode)
In-Reply-To: <20260914172334.49074-1-i.bahloul01@gmail.com>
References: <20260914172334.49074-1-i.bahloul01@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Mon, 14 Sep 2026 19:23:31 +0200,
Ismaïl Bahloul wrote:
> 
> Hi,
> 
> This is v4 of the RFC for a driver for the RME Babyface Pro in its
> proprietary USB mode (VID 0x2a39, PID 0x3fc0).  In that mode the PCM
> stream runs on interrupt endpoints instead of the class-compliant
> isochronous path, so it cannot be a quirk on top of snd-usb-audio and
> needs a standalone driver, modelled on snd-usb-caiaq.
> 
> Changes since v3:
> 
>  - A real bug in the crosspoint routing matrix, found while trying to
>    hardware-verify the dB TLV metadata added to the crosspoint faders
>    (below): the AN1/2 output's own crosspoint fader had no audible
>    effect on the signal, for every source, for as long as the matrix
>    has existed - a generated tone swept from off through +6 dB
>    produced no change at all, while the identical control targeting
>    any other output tracked the fader correctly. The vendor software's
>    own capture shows why: for this one output it always writes a
>    second register (the "low map") alongside the usual crosspoint
>    address, at the same value; the driver wrote only the usual
>    address. Three call sites (the live control, the probe-time
>    default, and the reconnect/resume replay) needed the same fix,
>    folded into one exported helper. Verified fixed with the same
>    tone-sweep method that found it, and that a real crosspoint value
>    survives an actual unbind/rebind, both the cached control and the
>    audible level.
> 
>  - Two real bugs found, diagnosed and fixed by David Fredman, who also
>    became this driver's second tester, on an original (2015, non-FS)
>    Babyface Pro:
> 
>    * The stream URBs were submitted without URB_NO_TRANSFER_DMA_MAP
>      even though their buffers come from usb_alloc_coherent(), so the
>      USB core tried to map them a second time and failed with -EAGAIN
>      on any IOMMU-translated host.  That is the default on current AMD
>      and Intel desktops, which means v3 as posted would not have
>      streamed at all on most machines.  Every other sound/usb driver
>      that allocates coherent buffers sets this flag; this one was the
>      exception.
> 
>    * The mic preamp gain register was decoded as a 5-bit value plus a
>      rotating transaction counter.  Bits 5-7 are in fact the fine part
>      of the gain: value = (fine << 5) | coarse, coarse 3 dB per step
>      saturating at 20, fine the 0-2 dB remainder.  The control was
>      therefore reaching 21 of its 66 positions, and because the
>      rotating value landed in those same bits, the gain actually
>      applied depended on where the rotation stood - the same requested
>      setting did not give a repeatable gain.  Measured on hardware
>      before and after: 0.808 dB per dB of control, against 1.000 after
>      the fix.
> 
>  - The power-on masters no longer come up at unity, and the -20 dB
>    safety default is scoped to the two analog outputs only.  The
>    routing default sends all 14 sources into every output at unity,
>    and they sum, on every fresh module load before alsa-restore can
>    restore the user's levels; AN1/2 and PH3/4 now come up at -20 dB,
>    the level the hardware's own DIM button writes.  The four digital
>    outputs (AS1/2, ADAT3/4, ADAT5/6, ADAT7/8) keep the vendor
>    software's own 0 dB default instead, since nothing downstream of a
>    digital feed can be damaged by a loud signal the way a speaker or a
>    pair of headphones can - David Fredman flagged that the original
>    six-output default reached those too, for no reason a receiving
>    digital device could infer.
> 
>  - The driver is no longer FS-specific.  It runs unmodified on an
>    original (2015) Babyface Pro; the two models share VID:PID,
>    bcdDevice and iProduct shape, and nothing in the descriptors tells
>    them apart.  card->driver, the card id, the shortname and the
>    Kconfig text are model-neutral accordingly.  This seemed worth
>    getting right before the strings are frozen by a release, since
>    card->driver is what alsa-lib configs and UCM profiles match on.
> 
>  - The front-panel DIM button acts now instead of only being decoded.
>    SET already toggled phantom from the same poll.  Its scope (Phones
>    only) matches the one vendor capture we have of it; whether that is
>    the only possible target or just the default "Main Out" assignment
>    is an open protocol question, noted rather than guessed at.
> 
>  - Added dB TLV information to the preamp gain, trim and crosspoint
>    controls; only the output masters had any before.  Hardware-
>    verifying the crosspoint curve is what surfaced the routing bug
>    above.
> 
>  - Fixed a state-restore bug in the input trim: it is one shared
>    register per input pair but two per-channel controls, and the
>    restore replayed the pair from its even index, so a trim set on the
>    odd channel was silently dropped on re-probe.
> 
>  - Split into three patches rather than the four of v3.  The v3 split
>    put the mixer in its own patch, which meant earlier patches carried
>    stub control functions that later patches replaced.  The mixer and
>    the core share the device state structure and the whole
>    save/restore path, so that seam was artificial.  The front panel
>    and the DSP EQ are genuinely separable: each of the three patches
>    here contains only final code, nothing a later patch rewrites, and
>    each builds in-tree on its own.
> 
> Known limitations, stated up front:
> 
>  - USB autosuspend is not supported.  It is explicitly disabled at
>    probe rather than left as an untested path: the panel poll and
>    keepalive work items run continuously and nothing pairs
>    usb_autopm_get/put around the stream.  S3 suspend/resume works and
>    is tested.
> 
>  - A few protocol details are not fully pinned down and are documented
>    as open: the preamp readback index semantics, a width
>    strip-ownership edge case, whether DIM's scope is reassignable with
>    TotalMix's Main Out setting, and the exact high-frequency warping
>    of the EQ coefficients against the vendor curve.  None of them
>    affect the shipped controls.
> 
>  - The latency profile is chosen at load time through the
>    frames_per_urb and nurbs module parameters; changing it means a
>    module reload.  Runtime reconfiguration is a follow-up.
> 
> Validation: a full-duplex sweep across the whole rate x period matrix
> with a signal-integrity tap, 30 start/stop cycles, mixer-state restore
> across an interface unbind/rebind, and a mid-stream disconnect - 40 of
> 40 on the current tree.  Each patch was also built in-tree on its own
> against next-20260911.
> 
> I am still mainly after feedback on the interrupt-URB PCM design, the
> control naming and topology, and the subdirectory layout.
> 
> Disclosure: the reverse-engineering (decoding the USB captures, the
> magic packets and the front-panel behaviour) and substantial portions
> of the kernel implementation were written with heavy assistance from
> AI coding assistants, credited per patch as Assisted-by.  All of it
> was verified by hand on real hardware; the human authors remain
> responsible for the result via Signed-off-by.
> 
> Thanks for reading,
> Ismaïl
> 
> Ismaïl Bahloul (3):
>   ALSA: usb: add RME Babyface Pro driver (proprietary mode)
>   ALSA: usb: babyfacepro: add the front-panel poll and controls
>   ALSA: usb: babyfacepro: add the hardware DSP EQ

It's good that you started splitting, but they are still too coarse
and too big to review.  Try to split harder.

For example, try to start with a very minimalistic core code: doing
only probe, disconnect and PCM operations.  No mixer, equalizer, or
whatever.  Just let module probed and running PCM -- that's the first
step.  This could be even multiple patches if you can split well.

Then, start adding mixers.  Also, no single commit but try to add
piece-by-piece.

Then, the rest features.  The suspend/resume comes mostly last, for
example.

But, before all; please give more "big picture" of your
implementations as a proper documentation.  This isn't for AI but for
human who need to read and review the code.


thanks,

Takashi
