Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D542F470440;
	Mon,  5 Oct 2026 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196162; cv=none; b=WgKWC9mtIfADa7Wj02vUVyDFFE2pnmPg6iDvVhg+Vzd1uOmVN8uSJXcmFiZUlHFCiT2c7DAdbycKkv06Vku4QacoI8gw1hXWB/A0NCP9GVOEdL+bQ8nLsFDoogc3UuPFO7XKyu8cdO0Vc7D71VsEDdEFaWoaTvdEirMSqQvkLQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196162; c=relaxed/simple;
	bh=mic/QPK+HcksLw4JJjL/VeyApNa5QytTXSeoqCcnXgo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3syO5co5uLgBUm8UPjGkI5DrrfjGinb5ip4nvbLCKIRfCkiB4rXVUQpcM8SV6Lt+Zi9Nwx41/jIxHYmW/EoV2cd+3p6Gg8068UdrOj71FjhFc92jngLak6a2i0c8KYSS/+bpq2J1ABIpCwNJX4RT2jILzMe5nvpqsnnf0m74h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=isFZPm5w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B34hAaAN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kxcbl+k3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ipCB1KEh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="isFZPm5w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B34hAaAN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kxcbl+k3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ipCB1KEh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DE9821A56;
	Mon,  5 Oct 2026 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791196154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=doFU5Ou9ColtE4a2X1Z4jm8WX5qy8wFA5HtGjLUD4l4=;
	b=isFZPm5wGnlPnO7UZGC/AGCJrNQIhAfwAXeTWc9uHD9eS0KW3dPFTdrZUXNoTkq/ysv9cC
	zQT9Wcv+MpSO5NAi2+p/TFXgu3xjQ2DcGEp2w+cuh49tTfZbTVvMffQunAJJsoRForOpJC
	6MEmMprjNagAQo+SN44NuNHMhBwCnXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791196154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=doFU5Ou9ColtE4a2X1Z4jm8WX5qy8wFA5HtGjLUD4l4=;
	b=B34hAaANSMFiJAEzxpglh/PyuuSkuzdMrpECJAc48vB30oWzzJbYcwOhuGyPO1uCWiN/U6
	jkDc9X7aETRK5RAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kxcbl+k3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ipCB1KEh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791196150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=doFU5Ou9ColtE4a2X1Z4jm8WX5qy8wFA5HtGjLUD4l4=;
	b=kxcbl+k3d0NnDCrFBw4W/oUhDksD6noMz98hqpdGtzeG0J4YOuGcuqJYdqDy8v+yd00EkE
	h1ZlQYQSVkYl18SQposC//zk80nwpN1Ks6oIwTlfgEtWyRmMrjt4QvyrrFzolZJm00fxsf
	CsHAsKdMNSwE2EpRk/oNdJpGRYFvmJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791196150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=doFU5Ou9ColtE4a2X1Z4jm8WX5qy8wFA5HtGjLUD4l4=;
	b=ipCB1KEhQ0839YZ+RQat5piyUQwHdNi7/S3vsKNbi66WUjlW+59PijK5vFA4aEL1ZL1MGU
	lM7wvmuqCWjwHQAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DA3E132D3;
	Mon,  5 Oct 2026 10:29:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2C2CBvZ7w2rZJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Oct 2026 10:29:10 +0000
Date: Mon, 05 Oct 2026 12:29:05 +0200
Message-ID: <87qzi4saoe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Justin Bacle <justin.bacle@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: add sample-rate quirk for Yamaha 01V96i
In-Reply-To: <20261004192102.59312-1-justin.bacle@gmail.com>
References: <20261004192102.59312-1-justin.bacle@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6DE9821A56
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Sun, 04 Oct 2026 21:20:50 +0200,
Justin Bacle wrote:
> 
> The Yamaha 01V96i exposes its audio streaming interfaces as
> vendor-specific USB class 0xff and ships no class-specific endpoint
> descriptor.  parse_uac_endpoint_attributes() therefore returns no
> attributes for the device, and without UAC_EP_CS_ATTR_SAMPLE_RATE the
> driver never issues the SET_CUR sampling-frequency request the hardware
> needs to start its USB audio stream.  The playback and capture PCMs are
> reported as RUNNING and their pointers advance, but the mixer passes no
> audio in either direction.
> 
> The vendor (Yamaha Steinberg) driver on Windows sends this request at
> startup; the generic driver does not.  Add the 01V96i to
> snd_usb_audioformat_attributes_quirk() to force the attribute on, so the
> stream is initialised the same way.
> 
> Confirmed against a usbmon capture of the Windows vendor driver: SET_CUR
> CS_SAMPLING_FREQ_CONTROL to endpoints 0x07 and 0x86 is the only
> non-standard control transfer it issues that completes successfully.
> 
> Verified on a mainline 7.2.9 kernel with a loopback test: playing a
> 440 Hz tone on USB channels 1/2 and recording USB channels 9/10 returns
> the tone unchanged at 44100, 48000, 88200 and 96000 Hz.
> 
> Tested-by: Justin Bacle <justin.bacle@gmail.com>
> Signed-off-by: Justin Bacle <justin.bacle@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
