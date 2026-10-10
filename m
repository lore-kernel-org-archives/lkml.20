Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D833537CD
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619424; cv=none; b=jtuGDNjK113aLwLs3JYgthjzNR9dcsvwlccUIO4fQIJBo/IcYHQ9pqYm+in5t+5alVeX4t7Bq+46p/Ci1HlUfkumDfNnbUL2ZpE39RXIymemUjtNoTTbb2yQOXvcXsS7Zc3yebi/qGTEOe887BQtl3OhrLTLgXSTZ00FDE8Sp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619424; c=relaxed/simple;
	bh=JH+n6y8uoqaQ0h95wOZjzeIyuo70oJ4txXScbLqKwpo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZQRlmhJ3kwOgEegkaRsKtU4d9xwfWL8xdaIppSAdW3GaETNbr4oOqHSRMFtvwf+zA8RyvoF15qSQjqOuYM4Ug6Y8REz+lGPVuiKFO0qNcPoD2wM64W8Tz/bu+bFKrxRi7JyLGxj8QbEmrS9+bnv2HO5uZrsMFE9zExzbsRaYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uakUok4F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IwktZT1i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uakUok4F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IwktZT1i; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uakUok4F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwktZT1i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uakUok4F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwktZT1i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 22D2D1F388;
	Sat, 10 Oct 2026 08:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQjEvOqLuuabg6ypgh05qmuZ8bvBqem5WqYCZ2YRH40=;
	b=uakUok4FVl52W7+TI55PIyJqQII43zO2whjI1y8pvhqFUfUMS25sgyBRWfhYseqeAqEbxx
	y+wRnIGhRQojg3SEQbruo9bX/RvFHE+I/CJReTjE0AVXztWB+yZJfittri0uVDDCVxROsS
	zUFzOyfQbnWfYwctMvZ027VA18Xz5RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQjEvOqLuuabg6ypgh05qmuZ8bvBqem5WqYCZ2YRH40=;
	b=IwktZT1ibREudtEYXmEwt/mBB0+U6spWLw5rubwsfsTWuNHHH8mJ82GnjrwmQdXlYUyhQp
	SBgFeqiimIyMOfBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQjEvOqLuuabg6ypgh05qmuZ8bvBqem5WqYCZ2YRH40=;
	b=uakUok4FVl52W7+TI55PIyJqQII43zO2whjI1y8pvhqFUfUMS25sgyBRWfhYseqeAqEbxx
	y+wRnIGhRQojg3SEQbruo9bX/RvFHE+I/CJReTjE0AVXztWB+yZJfittri0uVDDCVxROsS
	zUFzOyfQbnWfYwctMvZ027VA18Xz5RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQjEvOqLuuabg6ypgh05qmuZ8bvBqem5WqYCZ2YRH40=;
	b=IwktZT1ibREudtEYXmEwt/mBB0+U6spWLw5rubwsfsTWuNHHH8mJ82GnjrwmQdXlYUyhQp
	SBgFeqiimIyMOfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE016133F6;
	Sat, 10 Oct 2026 08:03:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SdEtIFzxyWoJTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 08:03:40 +0000
Date: Sat, 10 Oct 2026 10:03:40 +0200
Message-ID: <87mrsmj82r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alex James <igotmysoul@gmail.com>
Cc: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix internal mic capture on ASUS ROG Flow Z13 GZ302EA
In-Reply-To: <CA+YQcmcUKi98dKYRWjg8MR6hQoxoOEvXAuSDLgUUVK-L=ge7JA@mail.gmail.com>
References: <CA+YQcmcUKi98dKYRWjg8MR6hQoxoOEvXAuSDLgUUVK-L=ge7JA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 09 Oct 2026 23:19:39 +0200,
Alex James wrote:
> 
> The ASUS ROG Flow Z13 GZ302EA (Realtek ALC294, SSID 1043:1fb3) exposes
> two fixed internal mic pins, 0x12 (0x90a60140) and 0x13 (0x90a60130), as
> capture sources "Internal Mic" and "Internal Mic 1". The input mux
> defaults to 0x12, but on this model 0x12 is defective: its right channel
> rails to -32768 and the left channel carries heavy noise, so out of the
> box the internal microphone records loud noise/hum.
> Pin 0x13 captures clean audio on both channels (at lower level). The
> mic array is not reachable through the AMD ACP70/PDM path either: forcing
> it on via ACPI _WOV=1 creates the dmic-codec device but all samples rail
> at -32768, so HDA is the only usable capture path.
> The existing quirk for this SSID only initializes the two CS35L41 I2C
> smart amps (speakers). Disable the broken 0x12 pin via pincfg so that
> 0x13 becomes the sole "Internal Mic" capture source, and keep the CS35L41
> initialization by chaining it in a new fixup.
> Measured on a GZ302EA (arecord, 48 kHz S16LE, identical gain):
>   pin 0x12: L 47% clipped samples, R 15% clipped (railed noise)
>   pin 0x13: <0.3% clipped, hum components below -65 dBFS
> The fix was validated on the target hardware without building a kernel
> by applying the same pincfg override (0x12 -> 0x40000000) through a
> boot-time HDA patch firmware (snd-hda-intel patch=). With the override
> the codec parser drops pin 0x12 entirely: the card comes up with a single
> "Internal Mic" (0x13), the Capture Source mux control disappears (single
> input is hardwired), and capture is clean and stable across boot,
> suspend/resume, and PipeWire/WirePlumber route re-applies. Note that a
> runtime hda-verb override alone is not sufficient because the bus driver
> builds its pin cache at codec registration.
> Also observed on this SSID while testing: repeated
> "ALC294: Invalid fixup type 2016568172" messages in dmesg during probe
> with the current quirk; likely unrelated but worth a look.
> Link: https://github.com/CachyOS/linux-cachyos/issues/880
> Tested-by: aic0d3r <funforfreeapps@gmail.com>
> Signed-off-by: aic0d3r <funforfreeapps@gmail.com>

The blank lines and the white spaces seem broken, possibly due to your
mailer, so the patch can't be applied correctly.  Also, the
Signed-off-by tag has to be a real name (or a known identity) as it's
a legal requirement.  Yet better would be to align From tag with
Signed-off-by, too.

Could you resubmit with proper blank lines and keeping the tabs/spaces
as well as Signed-off-by/From tag corrections?


thanks,

Takashi
