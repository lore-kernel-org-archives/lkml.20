Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACBF380FD3;
	Tue, 29 Sep 2026 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659925; cv=none; b=JvFLPM/YZNPR0TQ55j9Xy1Ta6+sX8+6sokmKTIo0tAWi9CwrdddvJAmeYn9XNIEyRdeGXWCVaAAQ/zRH9haKACqLk3GVrd4WV4o796H3KE0mLzaRE0YP1qsjrXtH7c4+KdIsOF+dT4hP4ec6HwlQQRHz0A4JSUJA4QSdNUZuoDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659925; c=relaxed/simple;
	bh=iUw3/obCm1MQfI9bKOipd5iRwJpdduxVN646vRJsLqQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2bqnjv0Q1b9ROy1LIErAZNTXVEYfyyWQZQ5h/v8fKYxtzBMmbWuN/WSCLquqQatrrXl/cyw146xRyRX+nqSVNp1PMp/CQevyLi1Zc8Uu0uK10khGqN92kRiTaxnvLGekNgG4wPbJqpWFQZGEjjReV5AqVRULslmkZMWDdj6lFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mpyrwFgY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TOupxGPq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eglAp8gE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=13DkDUjo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mpyrwFgY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TOupxGPq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eglAp8gE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="13DkDUjo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 46F5F1F395;
	Tue, 29 Sep 2026 05:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790659917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1whwS6XNabN05kvzdX1N5ShdvqEr8l939ollBBDNS0=;
	b=mpyrwFgYk1YWoowHUFGtj55L2g3+4z+Fa3NnUIuSvPuk1frnSm6mSzhsv/L6W9mdUgDFXv
	1C+8wDHTZFtvIUa+atAX0PsSZoTq+zOfwbTD1mCOdApIJEBx8oleUnvvxhdNXBWJSw0S14
	FuKXOy3vUoryVQx5AgZCQjdXQXO0iZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790659917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1whwS6XNabN05kvzdX1N5ShdvqEr8l939ollBBDNS0=;
	b=TOupxGPqYY1+Yixr0e5b1y4Rv4H5b9qixKbz98eV/TDPe6Z8BrSJytTRSiTpWg0QBWvzCS
	zWEe3pzxqBBqA7Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eglAp8gE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=13DkDUjo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790659913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1whwS6XNabN05kvzdX1N5ShdvqEr8l939ollBBDNS0=;
	b=eglAp8gEsTrpsq8q0+vuTd+JwC3XH97CSvKsb6L5gXBO8ri5yX8yB0oIBejef7Qops/A8k
	nlHFR6u7/GvL/cebuXvlvQZamPwsgWm7aemoYDPy6ll7wTZGdsU9eEysb6NATEH88iinHy
	8z2+MD6tTDAISAeMa8kJxOCeUpiGXvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790659913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D1whwS6XNabN05kvzdX1N5ShdvqEr8l939ollBBDNS0=;
	b=13DkDUjoxt60IXdlBWdMr3IOYtdgoWnj2GOTUwmNgT5mqEaYGMKYNpVdkHkGHhWoEXLi15
	Neytgu6j9khELZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C71F4133F1;
	Tue, 29 Sep 2026 05:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ve4XJkhNu2o/FwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 05:31:52 +0000
Date: Tue, 29 Sep 2026 07:31:52 +0200
Message-ID: <87wls439o7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Preston Lam <plamlam99@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Laptop 15-fd2xxx
In-Reply-To: <20260928231621.1672704-1-plamlam99@gmail.com>
References: <20260928231621.1672704-1-plamlam99@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 46F5F1F395
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 29 Sep 2026 01:16:21 +0200,
Preston Lam wrote:
> 
> The HP Laptop 15-fd2xxx (PCI SSID 103c:8e43, Realtek ALC236) has a
> speaker mute LED on the F5 key and a microphone mute LED on the F8 key.
> Neither lights up, because the model has no quirk entry and only the
> generic HP vendor fallback (ALC269_FIXUP_HP_MUTE_LED) is applied.
> 
> Probing the codec with hda-verb showed how the LEDs are wired:
> 
>  - mute LED: COEF index 0x07, bit 0, on NID 0x20 (set = LED on)
>  - mic mute LED: codec GPIO0, active low (driven low = LED on)
> 
> Driving GPIO1 and GPIO2 did not light the mute LED. This wiring is
> exactly what the existing ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO fixup
> implements (COEF 0x07 bit 0 for the mute LED, GPIO0 with inverted
> polarity for the micmute LED), so use it for this model. The sibling
> HP Laptop 15-fd0xxx (103c:8dd7) already uses the same fixup.
> 
> Tested on this machine running Ubuntu 7.0.0-34-generic (SOF driver, the
> quirk built into snd-hda-codec-alc269 from Ubuntu's 7.0.0-34.34 source
> tree): the hda::mute and hda::micmute LEDs are created, follow the
> Master mute state and the Dmic0 capture switch respectively, and the
> F5 and F8 keys toggle them correctly. Muting the microphone also
> silences the capture stream. The LEDs also kept the correct state across
> an s2idle suspend/resume cycle (speaker muted in one run, microphone in
> another) and still responded to mute changes afterwards; long suspends
> were not tested. The desktop session was SwayFX (wlroots) with PipeWire,
> which only changes the mute state through the normal mixer controls; no
> other desktop was tried. Not tested on a mainline kernel tree directly;
> the change is only the quirk table entry.
> 
> AI assistance: this patch, the hardware analysis behind it (probing the
> codec with hda-verb and choosing the existing fixup) and this commit
> message were written by Claude Code (Anthropic, model claude-sonnet-5-5).
> The submitter ran the privileged commands and reboots and reported the
> LED behavior; Claude Code ran the tests and read the kernel logs.
> 
> Assisted-by: Claude:claude-sonnet-5-5
> Signed-off-by: Preston Lam <plamlam99@gmail.com>

Applied now.  Thanks.


Takashi
