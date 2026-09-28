Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937784EE876;
	Mon, 28 Sep 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613259; cv=none; b=SFcV62P+rSdi+ryTds3VOov1Jv51Mv/awr9cdvrz2df8oVRwvaQLNnzKwZ0Zflw6FiRHIxdkAYnhOB4/MmtFQkxqcgN8SGcZ/b6XkCd7EkVPGa3ahl+1VoP7clTp8qxzif7c7WrxsK9fRDdSZzNx/QE9IfYTps94K/X2qfhoOH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613259; c=relaxed/simple;
	bh=20WVoy/0dZtQ+YAWy18LCp3XUskdKV6R/BPG6fUKvKI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMIxOyjvkI0ncFt9lgJJgwdun6WVwIeoDaSWx0pOY0EgoXVK/FLwddW2Xvx2noH+jwuCp7HMyvZaqFz6zEsO/sVEAgPMTcnXp8SPOu4kIYfY2S3JtO6qEWn36MGP7lQuEy/UKSTqYfcTdjhDVN/w8dzBKeATjdykdTpUwsRqK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H5G3Lyk7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aG+pKWe1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zgMyt/qL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jjF4u2mz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H5G3Lyk7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aG+pKWe1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zgMyt/qL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jjF4u2mz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2AD991FA83;
	Mon, 28 Sep 2026 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790613251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN2PRWxytax/7GwUj4v0mSRTB6n+YoSA9iFWLx95deo=;
	b=H5G3Lyk7QiG9h3HFui64kiTCJsBopTeEv3uP43DWmkV7p0o/Rjjb2Sj8V9LeT5wFYEHk+t
	UPZp8T0H4IkhI6Hndj2HnEtPwcryCrUQQyhDfDyeWgtcNZvC2nQf6cG/Lp2r8didl/zmkE
	mjXr6ZpJEFVTtlFSe13Izn9xldfaIq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790613251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN2PRWxytax/7GwUj4v0mSRTB6n+YoSA9iFWLx95deo=;
	b=aG+pKWe1Oeq/89ObS7o4PXLzhGEdWm+2CHCuAY0joSX+AdnRQ2/AxcVbIr+05ZqgvB6Gf2
	LCazXiP5E62ttlCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="zgMyt/qL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jjF4u2mz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790613247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN2PRWxytax/7GwUj4v0mSRTB6n+YoSA9iFWLx95deo=;
	b=zgMyt/qLP2+lgJgQmoE2CXbj0MB7pSUjh93vauF9iSi6Hzf91ovdp+CDqAj6HVJx3WXP9S
	f/htPMsIgTVkY10uufQwvpnziQ31LcFBGDCSgYL7YIlsByh0Yhkx2j3GtvqHZiaagXjFs3
	rsHQ41velMI8RrevXiTY6W2rZmU1/bQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790613247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UN2PRWxytax/7GwUj4v0mSRTB6n+YoSA9iFWLx95deo=;
	b=jjF4u2mzt/Gxk74Pn0zz9JxFAj6P2CsBxKtEyy0HrLsarR0NUXaM6QtLli59znJ3Jl6n5z
	zbyZjN3pmRnRQ9Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7094133F1;
	Mon, 28 Sep 2026 16:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WFhKJ/6WumrAAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 16:34:06 +0000
Date: Mon, 28 Sep 2026 18:34:06 +0200
Message-ID: <871pad49oh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Frank van de Pol <fvdpol@gmail.com>
Cc: perex@perex.cz,
	corbet@lwn.net,
	khan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/1] ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
In-Reply-To: <875wzp4a3i.wl-tiwai@suse.de>
References: <20260925021915.78909-1-fvdpol@gmail.com>
	<875wzp4a3i.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 2AD991FA83
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Mon, 28 Sep 2026 18:25:05 +0200,
Takashi Iwai wrote:
> 
> On Fri, 25 Sep 2026 04:19:13 +0200,
> Frank van de Pol wrote:
> > 
> > Hi Takashi, Jaroslav, and the ALSA community,
> > 
> > Apologies for the long gap since v3. This is not simply v3 with the review
> > comments addressed -- I went back to the reverse engineering, and a fair
> > amount of what came out of it changed the driver structurally.
> > 
> > The patch has grown accordingly: v3 was 8 files and 1613 insertions, this is
> > 17 and 7326.  Most of that is not new logic: of the roughly 5700 added
> > lines, about 2100 are comments, 1660 are KUnit tests and generated test
> > vectors for the codec, 249 are the new jockey3.rst documentation, and only
> > about 1300 are executable code.  The rest is blank lines and Kconfig
> > plumbing.
> > 
> > The relatively large number of comments comes from the deliberate decision
> > to include what I learned from the protocol analysis with the relevant
> > section of code.  The parts that most need explaining (the bit-plane wire
> > format, device initialization, why the URBs run for the device's whole
> > lifetime, the locking order etc.) cannot be verified by reading the code
> > alone.  ploytec_codec.c is over half comment for that reason: the DOC: block
> > deriving the format from the board's I2S and DMA geometry is effectively the
> > specification the optimized variants implement.
> > 
> > Previous version:
> > v3: https://lore.kernel.org/all/20260622011131.1748298-1-fvdpol@gmail.com/
> > 
> > Changes v3 -> v4:
> > 
> >  - Reworked the locking architecture around an explicit hierarchy: a
> >    process-context rate_mutex outermost, then IRQ-safe leaf spinlocks for
> >    playback, capture and MIDI that are never nested in one another.
> >    Documented in jockey3.c.
> > 
> >  - Fixed the capture stall after a sample-rate change, eliminating the USB
> >    device reset that recovery used to require.  The reset rate per rate
> >    change went from 19.3% to zero, with a 98k clean streak on arm64 and 61k
> >    on x86_64.
> > 
> >  - Rewrote the bit-plane codec: a portable reference implementation plus
> >    32-bit and 64-bit SWAR variants selected at compile time, called through a
> >    batch API at the driver's real batch sizes. Against the same machine's
> >    reference build, the optimized path measures 11.0x encode / 7.8x decode on
> >    x86_64 and 6.9x / 6.1x on arm64. KUnit tests validate all variants against
> >    an independently derived model of the wire format.
> > 
> >  - Added URB coalescing.  The driver used to submit one 512-byte packet per
> >    URB, fixing the completion rate at 9923/s at 44.1 kHz and 21600/s at 96
> >    kHz for as long as the device was plugged in, used or not.  N packets per
> >    URB (N a power of two, 1 to 8) are now chosen per PCM open from the
> >    requested period size.
> > 
> >  - Fixed a cold-boot initialization race. Straight after power-on the device
> >    accepts the entire init sequence, reports success on every transfer, takes
> >    playback samples, but its audio engine never starts. Bisected over 100
> >    cold boots to between 144 and 156 ms after enumeration; the driver now
> >    waits 250 ms before its first control transfer, close to the 297-308 ms
> >    the Windows driver waits.
> > 
> >  - Added a URB liveness watchdog. Every error path hangs off a URB
> >    completion, so a device that stops completing URBs produces no error, no
> >    xrun and no log line. A work item now reports either direction silent for
> >    20 ms and enters the recovery ladder on a stall onset.
> > 
> >  - Hardened handling of an unresponsive device: an EP0 error-class predicate
> >    aborts the handshake before usb_set_interface() is reached, since the USB
> >    core disables an interface's endpoints as its first action and does not
> >    re-enable them on the failure return.
> > 
> >  - Added Documentation/sound/cards/jockey3.rst
> > 
> >  - Addressed the v3 review comments.
> > 
> > 
> > Testing:
> > 
> > Validated with an automated hardware-in-the-loop framework written for the
> > purpose: probe and unbind endurance, PCM cycling, every rate in both
> > directions, period and buffer boundary matrices, duplex, xrun injection,
> > rate-change soaks, suspend/resume, USB disconnects via hub port power
> > switching, and cold-boot cycling through a network-controlled mains switch. 
> > Some of the figures above come from runs of tens of thousands of iterations.
> > 
> > Exercised on real hardware on x86_64, i386, arm64 (Raspberry Pi 4) and
> > armv6/armhf (Raspberry Pi 1B -- functional but tight at 88.2/96 kHz), with
> > x86_64 and arm64 also run under a KASAN + lockdep debug kernel.  The codec
> > KUnit suite additionally tested under UML and QEMU on i386, arm, arm64,
> > riscv and s390 (test big/little endianness).
> > 
> > 
> > Two things I would rather state than have found:
> > 
> >  - The mitigation stack around the rate-change stall is now practically
> >    dormant since the rate-change improvement.  I kept it as cheap insurance;
> >    happy to remove it.
> > 
> >  - The 250 ms settling delay in jockey3_initialize() runs on the
> >    USB hub thread.  I can move initialization off the probe path if you
> >    prefer, though that introduces complexity to avoid races.
> > 
> > 
> > I look forward to your review/feedback.
> > 
> > Best regards,
> > Frank
> > 
> > Frank van de Pol (1):
> >   ALSA: usb: Add support for Reloop Jockey 3 DJ controllers
> > 
> >  Documentation/sound/cards/index.rst           |    1 +
> >  Documentation/sound/cards/jockey3.rst         |  249 +
> >  MAINTAINERS                                   |    8 +
> >  sound/usb/Kconfig                             |    1 +
> >  sound/usb/Makefile                            |    1 +
> >  sound/usb/jockey3/.kunitconfig                |   13 +
> >  sound/usb/jockey3/Kconfig                     |   60 +
> >  sound/usb/jockey3/Makefile                    |    7 +
> >  sound/usb/jockey3/jockey3.c                   | 4060 +++++++++++++++++
> >  sound/usb/jockey3/ploytec_codec.c             |  656 +++
> >  sound/usb/jockey3/ploytec_codec.h             |   44 +
> >  sound/usb/jockey3/ploytec_codec_kunit.c       |  871 ++++
> >  .../usb/jockey3/ploytec_codec_test_vectors.h  |  793 ++++
> >  sound/usb/jockey3/ploytec_midi.c              |   83 +
> >  sound/usb/jockey3/ploytec_midi.h              |   36 +
> >  sound/usb/jockey3/ploytec_proto.c             |  365 ++
> >  sound/usb/jockey3/ploytec_proto.h             |   78 +
> >  17 files changed, 7326 insertions(+)
> >  create mode 100644 Documentation/sound/cards/jockey3.rst
> >  create mode 100644 sound/usb/jockey3/.kunitconfig
> >  create mode 100644 sound/usb/jockey3/Kconfig
> >  create mode 100644 sound/usb/jockey3/Makefile
> >  create mode 100644 sound/usb/jockey3/jockey3.c
> >  create mode 100644 sound/usb/jockey3/ploytec_codec.c
> >  create mode 100644 sound/usb/jockey3/ploytec_codec.h
> >  create mode 100644 sound/usb/jockey3/ploytec_codec_kunit.c
> >  create mode 100644 sound/usb/jockey3/ploytec_codec_test_vectors.h
> >  create mode 100644 sound/usb/jockey3/ploytec_midi.c
> >  create mode 100644 sound/usb/jockey3/ploytec_midi.h
> >  create mode 100644 sound/usb/jockey3/ploytec_proto.c
> >  create mode 100644 sound/usb/jockey3/ploytec_proto.h
> 
> Thanks for the update.  I think overall the code would be OK, but
> the problem is that it's a way too big single patch to digest.
> 
> Could you try to instruct LLM for splitting logically for easier
> reviews?  It could be like starting with the core probe skeleton,
> polytec core stuff, basic PCM loops, the mixer support, the MIDI
> support, kunit, documentation, something else I forgot, etc.

And, you don't have to list up all models you've used in Assisted-by
tag; just put a single "Assisted-by: LLM" should suffice (and even
preferred).


Takashi
