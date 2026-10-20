Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501823;
	b=4PdqXY+XfGDPYy3YtDdGys3kDGkvB9P/ZnXrItlyWqu8KqrOlOssgfV3LjACcOGD7/pl
	 CNWeYUb/T+NSmreyQXh7hAIQxJiQnFXL4KwWsmtn/wPKfo0Rgf3i7ad7AogCxoEQ1LwV4
	 Irlpys+Z9JSomoMfeNxmHuiRp33pYI1lDaRvwVvwhDud0CHFRhr0FsQHLvblmc2PLati2
	 Zd2Ji6/3ro1b8KeLz1hOMY6GP6r7oQ5bRmBlecpqX7Jew/cokuCu0Rwlk13IWFCUhXYGS
	 TbkdVWUZdZtLIW39Rfp7/2J/WscknTabwUTAft/+wA+ine9Fm5dX+uxU5Ivrr981Fvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501823;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=0BnxKS9cMftigYDXBbP/KKz083gk8JQ/EDhdJYhlCTg=;
	b=LF5ZWQfZgL2l9/bLhm+XISZTddlAk8GrsOES1O86HZCrurfdwZ4pxmzByS/9OJ2evooV
	 XfkLRtCYsx4h6YUYSm5457EIXzSQiGgvFUZfD0Q6X9UgLFrUgHtuOXmA+gCuORwh4342h
	 jGtvF3CU1Sxo/lS2E9t53hNiEhYDrEdlyNjBAs0yNdIx64SU+pkciV7lkNvgEqosBRAnG
	 +KbCi1QYrZ0aVU8SlNv3vRSR/cL7fhgS92rh4+opsB6HSlYoe6VH3P8fQWpTkJmCjrJTC
	 OLvClJo+cGeHaCMv/hdeuPxJq/FbEnlavwlD77sAi6rAdl2XlgsiAyb8hr1BUcVxUqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M82B3DoF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="hf4C+yf/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M82B3DoF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="hf4C+yf/";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC560A2616;
	Tue, 20 Oct 2026 13:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BC560A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M82B3DoF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hf4C+yf/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=M82B3DoF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hf4C+yf/
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 323A021BDE;
	Tue, 20 Oct 2026 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0BnxKS9cMftigYDXBbP/KKz083gk8JQ/EDhdJYhlCTg=;
	b=M82B3DoF/zItJtH/pS+p6qE2XmKlofPUYcghvIddmULke2ijLRWcszuyHSm3FdO6W9enhL
	ha10qxGw+ILnbULK7iCAFgnM0XCoSp3jUBEMz5qgyw7+i7mimehpXk0Q4tu4RVEEm1bmCT
	Js6fpBVBA5yEfLRDNVI3VjWYwgnncco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0BnxKS9cMftigYDXBbP/KKz083gk8JQ/EDhdJYhlCTg=;
	b=hf4C+yf/XnkBgVUENQ/OqObyuWq6GUwZ5NJM4MwgIxiTP3K/S0Dg2VwEDzKTnd5OYU24Lj
	y/7wZ8F4EyI3wOCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0BnxKS9cMftigYDXBbP/KKz083gk8JQ/EDhdJYhlCTg=;
	b=M82B3DoF/zItJtH/pS+p6qE2XmKlofPUYcghvIddmULke2ijLRWcszuyHSm3FdO6W9enhL
	ha10qxGw+ILnbULK7iCAFgnM0XCoSp3jUBEMz5qgyw7+i7mimehpXk0Q4tu4RVEEm1bmCT
	Js6fpBVBA5yEfLRDNVI3VjWYwgnncco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0BnxKS9cMftigYDXBbP/KKz083gk8JQ/EDhdJYhlCTg=;
	b=hf4C+yf/XnkBgVUENQ/OqObyuWq6GUwZ5NJM4MwgIxiTP3K/S0Dg2VwEDzKTnd5OYU24Lj
	y/7wZ8F4EyI3wOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3468136CC;
	Tue, 20 Oct 2026 13:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V9lTKDxo12qvagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 13:10:20 +0000
Date: Tue, 20 Oct 2026 15:10:20 +0200
Message-ID: <875wywh60z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.li];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,androos.io,gmx.li];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 20 Oct 2026 01:01:54 +0200,
Will Porter wrote:
> 
> The Audient iD14 MkI (2708:0002) keeps its monitor section, output
> routing, mixer and input options on vendor extension units. It also
> uses feature units whose descriptors declare no controls. On Linux a
> user cannot change the routing. The device powers up with every output
> on DAW Thru, which bypasses the volume knob.
> 
> This series adds those controls in a new mixer_audient_id.c, one group
> per patch. A MkI-only name map hides the generic controls that each
> group replaces. The MkII keeps audient_id14_map.
> 
> Scope: only the iD14 MkI is supported, and only its USB ID reaches the
> new code. Other Audient iD models keep the generic driver. Their units
> may differ, and this series does not cover them. The file follows
> mixer_scarlett2.c, which began with one model and added others through
> per-model tables. Names with id14_ hold the MkI's unit IDs and tables. A
> later iD model can add its own tables to this file.
> 
> sound for-next also has mixer_evo.c for the Audient EVO 4 (2708:0006).
> EVO and iD are separate Audient product lines. The iD14 MkI uses other
> units and a larger control set: a monitor controller, output routing, a
> 14 x 4 mixer and write-only controls. So this series keeps the iD line
> in its own file.
> 
> At probe the driver writes only controls that it cannot read back: the
> write-only controls (patch 4) and FU 12 (patch 5). They get the launch
> values of Audient's iD application. If a probe write fails, the control
> shows the fallback value that those patches describe. The driver does
> not write the routing or the mix. User space (alsactl, an application)
> sets the rest of the iD application's launch state.
> 
> There is no resume code. Every write to a write-only control reaches
> the device, so alsactl restore also repairs a device that was reset.
> The state across a suspend depends on the power source:
> - On USB bus power, a system suspend re-enumerates the device.
> - With its mains adapter connected, the device keeps its state across a
>   system suspend. This is also true when the host controller resets the
>   device and the card stays. The sampled readable controls did not
>   change.
> - A runtime suspend left the readable controls unchanged on both power
>   sources, with no reset logged. A runtime suspend is possible only
>   after usbhid releases the HID interface.
> 
> Patch 5 replaces the generic "Monitor Mix Playback Volume" (FU 12) with
> one of the same name, count and range. FU 12 GET CUR returns stale data
> from other units. Its Main L channel ignores writes, but Main R applies
> them. audient_id14_map already notes this asymmetry. The new control
> holds Main at 0 dB. This is a deliberate change for existing users: a
> Main R attenuation set through the generic control no longer applies.
> 
> The protocol comes from Audient's iD application (version 4.4.5 for
> macOS). USB captures of the application confirmed it.
> 
> Test setup:
> - iD14 MkI, firmware 1.1.1
> - Bazzite 44, kernel 7.2.9-ogc3.1.fc44
> - snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
>   with this series applied
> 
> Tests:
> - listening tests: routing, dim, talkback, Cue
> - a loopback cable: gain boost, polarity, FU 12 per channel
> - alsactl store and restore across a replug
> - an out-of-list routing value
> - a runtime suspend
> - three system suspends (S3) with control reads running at about 3000
>   per second: no read failed after a resume
> - the optical power-on mode, read on macOS 27.0.1 with no Audient
>   software running
> 
> The series is based on sound for-next a4ef328ce3b3. Each patch builds
> on its own there with make W=1 sound/usb/. The hardware tests used the
> complete series on 7.2.9 sources, where snd_usb_mixer_add_list() has no
> look_for_empty argument. The series passes true, which keeps that
> behaviour.
> 
> Will Porter (5):
>   ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
>   ALSA: usb-audio: Add Audient iD14 MkI monitor and routing controls
>   ALSA: usb-audio: Add Audient iD14 MkI mixer matrix
>   ALSA: usb-audio: Add Audient iD14 MkI write-only controls
>   ALSA: usb-audio: Replace the Audient iD14 MkI FU 12 control
> 
>  sound/usb/Makefile           |   1 +
>  sound/usb/mixer_audient_id.c | 790 +++++++++++++++++++++++++++++++++++
>  sound/usb/mixer_audient_id.h |   7 +
>  sound/usb/mixer_maps.c       |  10 +-
>  sound/usb/mixer_quirks.c     |   4 +
>  5 files changed, 811 insertions(+), 1 deletion(-)
>  create mode 100644 sound/usb/mixer_audient_id.c
>  create mode 100644 sound/usb/mixer_audient_id.h

FYI, I postpone this to 7.5, as 7.4 merge window was already opened
and this PR has too big changes as a last-minute fix.


thanks,

Takashi
