Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465851;
	b=AhAvmYqhgVO8m/BJsE+2MlAgaWIDSEdsEFcmS4p3zzeqWpSMvOQxFyJ9867qj14L8ler
	 gkQvm5gbU2Mui3OJ8Kyf2eabeCpgCd3E3kAXzM0eW5EVnd/1ZwtgLpHYNJdagg9yVCZ8t
	 s3QCAbiRNDkwGs/iXqrQpLWNiD1Pkx9q8bNwJ+rulzVVIKva0YLYGZyrCYicaAIUK/O4j
	 MpFKVzNxU2TQfTxoGVliKksuyEo0vL5Q+7CWjh8urtoUEc03Rg6nGhooQREbD+baGv/O1
	 4HfV4+sbQ5/tXNyK3VUb6vmNwEMMn4EUHALY4e5Pl23lbyU+snIUui2l+9oX0ZgNcoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465851;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=YBhiIwvADJajh3RbHDwL/JDcA8HU7Bu/kdL+MLxWhn4=;
	b=vl+OIglsGMwln1v1cACtP8v9wRJM1ppNrSXNaG82kFkwIxtYfjzta57fxuXPA+lWxajM
	 9UC5zSFGGoVr7pyLn6MFzhPv4GEFgEDwAxIO7/Z69DYdqdn1KjRIQHH9Dzy+7JMgx6LI+
	 4zFrY6EFDXtfZC5r+odJixwRh1pBPez2zhOQVw4FD5/056JejkijIadnL77S7DVFmvIj2
	 RikhBUg1J9AHskERqgrvJ802rpsE46RZ+GmDURVwuJRHmc9fzJnJeaOEjE8jUotb0Nahl
	 2u1ZEQnyNhwY9De+zqxMCcMLsoAcgowlrPyOT8SqQJ91ci30bf5ukvD1JxFJbaCJ7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AQim8VLD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+B+Rr1Nb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SShI2Dm8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8xljWlZX;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27A606A31C;
	Sat, 31 Oct 2026 16:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B27A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AQim8VLD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+B+Rr1Nb;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SShI2Dm8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8xljWlZX
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 96BB31F38F;
	Sat, 31 Oct 2026 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793465848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YBhiIwvADJajh3RbHDwL/JDcA8HU7Bu/kdL+MLxWhn4=;
	b=AQim8VLDAfZ2B0MG15a44DFFH3lTH9uxZ0FEkdCt+KKY9mHHnKz+udEE6ieQiE7ES1xryN
	Dt8yHRz3lyKW/kOvuacPoK7UZBmT3rGAnpuHyZ89aFDRvbOy3QiDTzpH3GNDsPI7ZHxRZ1
	kSzIY9CUiRYehWeKim59z7Sb9zl33tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793465848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YBhiIwvADJajh3RbHDwL/JDcA8HU7Bu/kdL+MLxWhn4=;
	b=+B+Rr1NbzzLi+IbWn4BrqWkUTRQakoYBuBHt9TY3gbgrT15ST2fyBPBA7djfkeGvNx3iPd
	gWTF0nLUIyC8raAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793465847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YBhiIwvADJajh3RbHDwL/JDcA8HU7Bu/kdL+MLxWhn4=;
	b=SShI2Dm8GHXidWTZIQ/+2pbnZSiXK/4tgljKcyAQtEAu76jKd12xUjUmIxE8egJKN2r9oh
	os8Z+nwFrJKmEu8DsmVXBkRo88ETIQ1muOclUW9p/IY+mYPtwXa4t6LiCf+CK4/aV52QYi
	scetrf4VO3IYvctRrnqSN7TGdpI6HY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793465847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YBhiIwvADJajh3RbHDwL/JDcA8HU7Bu/kdL+MLxWhn4=;
	b=8xljWlZXMHnEby8ymRgHWTDKAicRPYtqXs0Bg6ywWfglWBrjWqyTzUGYApBQppbsdkt2xE
	OMImbAmZl+XK2ZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28B04132D3;
	Sat, 31 Oct 2026 16:57:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AWBwO/Yd5mp8ZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:57:27 +0000
Date: Sat, 31 Oct 2026 17:57:26 +0100
Message-ID: <87bj89reo9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: RenPanpan <rppxj178543@163.com>
Cc: alsa-devel@alsa-project.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [DISCUSSION] ALSA: usb-audio: Card naming for composite devices
In-Reply-To: <20261030121740.250336-1-rppxj178543@163.com>
References: <20261030121740.250336-1-rppxj178543@163.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 30 Oct 2026 13:17:39 +0100,
RenPanpan wrote:
> 
> Hello,
> 
> I'd like to discuss an issue with USB audio card naming for composite
> devices and propose a possible improvement.
> 
> Problem
> -------
> 
> For USB composite devices containing both non-audio and UAC audio
> functions, the ALSA card shortname is derived from the device-level
> iProduct string, which describes the entire device rather than the
> audio function.
> 
> For example, the CVT Touch Device (1ff7:0f33) is a composite device
> with HID touch interfaces and UAC audio interfaces. Its iProduct is
> "Touch Device", which is the name for the whole device. The UAC
> OUTPUT_TERMINAL descriptor defines the audio function name as
> "MAXHUB Speaker" via the iTerminal string descriptor (index 14).
> 
> Currently, the ALSA card name shows "Touch Device", which does not
> identify the audio function. The UAC mixer code already reads
> iTerminal for mixer control names (e.g. "MAXHUB Mic" from the
> Microphone INPUT_TERMINAL's iTerminal=17), but the card naming
> function (usb_audio_make_shortname) does not use iTerminal.
> 
> Proposed approach
> -----------------
> 
> When the USB device is composite (i.e. it has non-audio interfaces),
> prefer the Speaker OUTPUT_TERMINAL's iTerminal string as the card
> shortname, instead of the device-level iProduct. If iTerminal is not
> set (zero) or not readable via usb_string(), fall back to iProduct
> (existing behavior).
> 
> Non-composite (dedicated audio) devices are not affected and continue
> to use iProduct.
> 
> The composite device detection checks whether any interface has a
> non-Audio class. The iTerminal reading uses the existing
> snd_usb_find_csint_desc() helper to parse OUTPUT_TERMINAL descriptors
> in the Audio Control interface's extra data. The iTerminal field is
> the last byte of the descriptor, common to both UAC1 (bLength=9) and
> UAC2 (bLength=12).
> 
> As an immediate fix, I have also prepared a quirk entry for 1ff7:0f33
> to override the card shortname to "MAXHUB Speaker" directly.
> 
> Questions for the community
> ----------------------------
> 
> 1. Is this approach reasonable for composite devices, or should it
>    remain a per-device quirk?
> 
> 2. Are there concerns about changing card names for existing composite
>    USB audio devices that have iTerminal set? For example, UCM profile
>    matching or PulseAudio device identification.
> 
> 3. Would it be preferable to also check the IAD's iFunction field
>    before falling back to iTerminal, or is iTerminal sufficient?
> 
> 4. Are there known composite USB audio devices where the iTerminal
>    string might be empty or contain unexpected content?
> 
> I have tested the quirk approach on a MT81C device (Kylin V10-SP1)
> and it works correctly. The iTerminal approach compiles but has not
> been tested on multiple devices yet.
> 
> Any feedback would be appreciated.
> 
> Best regards,
> RenPanpan

I took your first fix patch as it was simple enough.
(It took time just because I was traveling in the last week.)

If it still doesn't suffice, let us know.  Thanks.


Takashi
