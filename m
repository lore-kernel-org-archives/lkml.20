Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821FC39E194;
	Tue,  8 Sep 2026 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851542; cv=none; b=ULTW69vrCVMJ/ymY9Fx3prIjZF7X7lRezv25Ny7smw3tG9EuW/WtOF8OcORuCYjy5tTgsRhKEtHAsC9BntyhH06Nvi2tHvMmvxKabAmwEcmEMbgp0eH2HQwJPSQtCgyeQqtRzWEOCwh5M6SJPjZ/GU7jO+aMXtTgTQk6D5aRjcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851542; c=relaxed/simple;
	bh=COuG8udEer5h9zv3uB62XfLheQ2UWG8P/LIDq9udE7E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDCQy6kJoAi3GnncyNLRDWVw1GqxetLbfH5lU6dtKxwbvPXWMtneD1NCJnzn+1idYsmewb+MXFuCLY18Ys4N78uHDkrFIFUCfxIcGVUZzgrmC2WfvXYnLPGP2t4KcG7ldMTaJaU83j6XK9499itVpxSbpOx3bWt7O82zLjpRsjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=De2uB3Jl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jeN5sIGy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ReDqClOG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o2aXTwgk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="De2uB3Jl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jeN5sIGy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ReDqClOG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o2aXTwgk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 474ED1F460;
	Tue,  8 Sep 2026 07:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788851534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/O6UCTLl7RYoMDJqjN1WLTnpGFkFGo9YDpHEImr6wn4=;
	b=De2uB3Jl4QuhtfHJnIM7p9oSuhIIjuvzILw9IM0liTpG0Ot4O3cJ5qNgrf52SkdE3mb08d
	GO++MSYstvkhXj4T1SOozC0615IhWQ9NHE343SQsr7fFQa6A6a/5RMCKgBrrjuehU+KWSM
	JlIJQORHD8wH34Ry1eULNvPZVUiafXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788851534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/O6UCTLl7RYoMDJqjN1WLTnpGFkFGo9YDpHEImr6wn4=;
	b=jeN5sIGyD105QzxrXYctOyphkiuIozYTLTkquJtK2f+aIHULs2J9dl1ArISTgcIxT34+pb
	OAAVmx5eR7k8cvCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788851530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/O6UCTLl7RYoMDJqjN1WLTnpGFkFGo9YDpHEImr6wn4=;
	b=ReDqClOGJFlmZ6It43qTL3zdwvRJ36SwHIJcDlqtaXIZ3SMr04pTakluedD7oZYDmG/SX3
	huVWfWA5lY1h4/6N7+d6LQiKxVVQ50iGFyoOLipfLEJp5QeShWnWewx7p1RC3JCyMw0Q88
	qjHyKVZ6a0n9PSyT6J242R18A0cOgIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788851530;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/O6UCTLl7RYoMDJqjN1WLTnpGFkFGo9YDpHEImr6wn4=;
	b=o2aXTwgk/Y7W0JEduKD7MKZMvSGOXE/U1aihqw7iv8qsotw9cxs/VFMRq2hYRwO0T73BfL
	Ve6GB+GUlcQByCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0473C1347F;
	Tue,  8 Sep 2026 07:12:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /mFWO0m1n2p/UAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Sep 2026 07:12:09 +0000
Date: Tue, 08 Sep 2026 09:12:09 +0200
Message-ID: <87cxuoqks6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio: Add quirks for HP Elite x3 Lap Dock
In-Reply-To: <20260908-uac-hp-elite-x3-lap-dock-v1-0-e226cfe4038e@rong.moe>
References: <20260908-uac-hp-elite-x3-lap-dock-v1-0-e226cfe4038e@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,rong.moe:email,suse.de:mid]
X-Spam-Flag: NO

On Mon, 07 Sep 2026 21:34:38 +0200,
Rong Zhang wrote:
> 
> The HP Elite x3 Lap Dock is a laptop-like external display device with a
> FHD screen, a keyboard, and a MT touchpad. It can be connected via USB-C
> or Miracast. As an e-waste collector, I recently brought one for 69 CNY
> (10.2 USD). The price already indicates how broken the device's design
> and compatibility are ;-P
> 
> When connecting via USB-C, the video source is, of course, DisplayPort
> Alternate Mode. However, the audio source has nothing to do with the
> DisplayPort signal and is actually from a builtin UAC device.
> 
> The builtin UAC device provides three Alternate Settings:
> 
> - 1:1 - Capture, S16_LE, 8000/32000/44100/48000Hz
> - 2:1 - Playback, S16_LE, 48000Hz
> - 2:2 - Playback, S24_3LE, 48000Hz
> 
> Unfortunately, the last one is broken because:
> 
> - it doesn't accept SET_CUR(SAMPLE_RATE). QUIRK_FLAG_FIXED_RATE works
>   around it, however...
> - it constantly produces severe harmonic distortion once the capture
>   stream is also opened. The interface 2 must be closed and reopened to
>   make it recover. IOW, simply closing the capture stream makes no
>   difference.
> 
> Considering that S24_3LE offers no additional benefit on small speakers
> compared to S16_LE, and 2:1 is always usable as an alternative, skip 2:2
> to get rid of the trouble.
> 
> Setting chip->setup to any non-default value disables the fixup and
> reenables 2:2 (in this case QUIRK_FLAG_FIXED_RATE is required).
> 
> Quirky device sample:
> 
>   usb 7-1.4: new full-speed USB device number 50 using xhci_hcd
>   usb 7-1.4: New USB device found, idVendor=03f0, idProduct=0c56, bcdDevice= 0.00
>   usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>   usb 7-1.4: Product: HP Elite x3 Lap Dock
>   usb 7-1.4: Manufacturer: HP
>   usb 7-1.4: Found last interface = 0
>   usb 7-1.4: 1:1: add audio endpoint 0x81
>   usb 7-1.4: Creating new data endpoint #81
>   usb 7-1.4: 1:1 Set sample rate 48000, clock 0
>   usb 7-1.4: 2:1: add audio endpoint 0x1
>   usb 7-1.4: Creating new data endpoint #1
>   usb 7-1.4: 2:1 Set sample rate 48000, clock 0
>   usb 7-1.4: 2:2: add audio endpoint 0x1
>   usb 7-1.4: 2:2 Set sample rate 48000, clock 0
>   usb 7-1.4: 2:2: cannot set freq 48000 to ep 0x1
>   usb 7-1.4: [9] FU [Sidetone Playback Switch] ch = 1, val = 0/1/1
>   usb 7-1.4: cannot set ctl value: req = 0x4, wValue = 0x200, wIndex = 0x900, type = 4, data = 0x40/0x0
>   usb 7-1.4: [9] FU [Sidetone Playback Volume] ch = 1, val = -17664/0/128
>   usb 7-1.4: [2] FU [Headset Playback Switch] ch = 1, val = 0/1/1
>   usb 7-1.4: [2] FU [Headset Playback Volume] ch = 2, val = -18944/0/1
>   usb 7-1.4: [6] FU [Headset Capture Switch] ch = 1, val = 0/1/1
>   usb 7-1.4: [6] FU [Headset Capture Volume] ch = 2, val = -18944/0/1
>   input: HP HP Elite x3 Lap Dock Consumer Control as /devices/pci0000:00/0000:00:08.3/0000:c9:00.4/usb7/7-1/7-1.4/7-1.4:1.3/0003:03F0:0C56.0033/input/input129
>   input: HP HP Elite x3 Lap Dock as /devices/pci0000:00/0000:00:08.3/0000:c9:00.4/usb7/7-1/7-1.4/7-1.4:1.3/0003:03F0:0C56.0033/input/input130
>   hid-generic 0003:03F0:0C56.0033: input,hiddev100,hidraw8: USB HID v1.11 Device [HP HP Elite x3 Lap Dock] on usb-0000:c9:00.4-1.4/input3
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Rong Zhang (2):
>       ALSA: usb-audio: Convert snd_usb_apply_interface_quirk() into a switch statement
>       ALSA: usb-audio: Add quirks for HP Elite x3 Lap Dock

Applied both to for-next branch.  Thanks.


Takashi
