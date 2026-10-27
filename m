Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086711;
	b=CgRMlY4uY4mibs0iQxCopTJzqazxu+EMEmCYZbh8McysUf0qRJm0phQCGH46qa40bLNj
	 AWcPcMJBcGwPgcQ+zv1rMXPTpfR+qchJrFGIi7oS+9FHCoSfkkTpKtJ4SsZ0xs7H26Fb1
	 4riNhNILGW1EjA2fS0LPqewOXMLjQ27rxlZ1F4klvYkUNGDNQ+z9WOYzcNBX/wA8yMz2Q
	 yUt7LmjRDkl1ljqXnThXXgz8MpsTbWftE+5E8QE5H1gyXAMdfB5tceCnFDKE+wFVlHD+t
	 J5NqjaBgVfAdUkG03o5O3F5U9pv69STKa8hOingk4s1bKctvDcPm2dRCx7kctvu2UqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086711;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=JLs/MuVAir29RzCv6U4V5WqIO3KGcInyBz7SPGgxlT4=;
	b=HeEI/tcLjspgrbo49lPsz2ehU5LgXRQfkZX8uaxilsQIErnMr0SYgyCpALAwt/vgHCt3
	 ENmFTDdIU48TfJMyWWsxXaOe+yVjhiqiVt+J7bz2CRALjRdLLN89dIu6o3GcfeswfOS/+
	 y0GPSuK5GPO5Yzdavn3W4FadmDtFf5vKgHODMLIgVG5MTLpGFd4RoPLy2PJIVNqQO5lsd
	 NpA2hVMal1Do1qxAGP52tEJC3f/jLqcNS4M6H6DdOfAK/wLO9YV/SNWkuSeWIcXNYOLvA
	 /M7uQfkT5XufobJnijW/Wh8sSTNTa6GXQZXuBY6HC4XZ1S90fjCUHaoFTzRCAGsajmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AkKdBDII;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="53V36o/g";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fx89WmOB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dcyGWjJc;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35BD606A31B;
	Tue, 27 Oct 2026 07:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D35BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AkKdBDII;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=53V36o/g;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fx89WmOB;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dcyGWjJc
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE3451F445;
	Tue, 27 Oct 2026 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLs/MuVAir29RzCv6U4V5WqIO3KGcInyBz7SPGgxlT4=;
	b=AkKdBDIIHlo8hO4yAZ2zzsK0rRLfTHA/SUA2vNIWWgsMv1yWgjS58jExwHeu4DyZon1M3z
	zZwgI6wX5T+9ML1HiKZ2HF1oBqaOwdCUFF7+4Dg5lbN4cD3JTgdOa9Wqmc/YDy5qefL1TO
	abARPFaFd+hpTQbU7070Sk0QMntgGaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLs/MuVAir29RzCv6U4V5WqIO3KGcInyBz7SPGgxlT4=;
	b=53V36o/gEVCfotj3p+0D2Oo0s81hlc7o+Hr4T6ED2RRfZOMcUu9C2xivKnhFprAMqOgUo+
	TmYJDeGRjMY4CTBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fx89WmOB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dcyGWjJc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793086708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLs/MuVAir29RzCv6U4V5WqIO3KGcInyBz7SPGgxlT4=;
	b=fx89WmOBzX8ytsiG20BSc8RXJiPwjdifX/JWOn8QzIG+v4vMT9NTVh4zxfJpDPbyl91gjU
	uotgb5txV40N0O1lQ0tC3fSGILHu3u3yTRXUug99XMNtmYqmpmslQ2MRwyty5iXW6yVc7t
	Y7fDHV5VgGA0R3qVeWxr+27lUQMNY5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793086708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLs/MuVAir29RzCv6U4V5WqIO3KGcInyBz7SPGgxlT4=;
	b=dcyGWjJcgXPDo8+xR8USNE81WYlcptKjX5MLzZPDiz1CfPHtwgBkmldr6kE6IEALOaWgW9
	1DhI7lNzExMqnYAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DC4713319;
	Tue, 27 Oct 2026 07:38:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VvXtHPRU4GolXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 07:38:28 +0000
Date: Tue, 27 Oct 2026 08:38:26 +0100
Message-ID: <87pkwv385p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is stuck
In-Reply-To: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
References: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
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
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -11.01
X-Spam-Level: 
X-Rspamd-Queue-Id: EE3451F445

On Mon, 26 Oct 2026 13:57:51 +0100,
Stjepan Poljak wrote:
> 
> Switching a bus-powered USB keyboard off and on can be too quick for the
> hub to report a disconnect. The device comes back unconfigured at the old
> address, and its input endpoint then fails forever:
> 
>   - with -EPIPE, which snd_usbmidi_urb_error() logs and treats as
>     "continue", so the URBs are resubmitted at once and the log fills
>     with "urb status -32" every few milliseconds;
>   - or with -EPROTO/-ETIME/-EILSEQ, retried silently every 100 ms.
> 
> Either way the rawmidi device stays, reads never fail and no data ever
> arrives, so the instrument goes silent until the cable is replugged.
> 
> Retry a stalled input endpoint through the error timer like the other
> errors, and when input stalls, or keeps failing for 2 s with no
> successful URB, queue a USB reset. snd-usb-audio has no pre_reset or
> post_reset, so the reset unbinds and re-probes the card, and userspace
> sees an ordinary unplug and replug. A real unplug normally reaches
> disconnect() long before 2 s. If the host misses that as well, as
> dwc_otg does behind a hub, the input stalls and the reset finds no
> device, which ends in the same disconnect.
> 
> The queued reset is dropped without a word if usb_lock_device_for_reset()
> fails (e.g. -EBUSY when the device lock is held for over a second), so
> while input keeps failing, queue another one every 2 s.
> 
> Output endpoints are left as they are.
> 
> Tested on a Raspberry Pi 3B+ (dwc_otg, Raspberry Pi 6.12.61 kernel) with
> a Nektar Impact LX49+ (2467:2015) behind the on-board hub. Without this
> patch, switching the keyboard off and on left it silent, with "urb
> status -32" logged every few milliseconds. With it, each off/on cycle
> logged a single "MIDI input not recovering (urb status -32), resetting
> device", and the keyboard was re-enumerated and playing again 2.8-4.0 s
> later, including two cycles 9 s apart. Left switched off for 3 minutes,
> it was reset, disconnected cleanly and enumerated normally when switched
> back on. Unplugging the cable went the same way: the input stalled, the
> reset found no device and disconnected it, and plugging it back in
> enumerated it normally. No warnings while playing normally over about
> three hours.
> 
> Also tested on x86_64 (xHCI, 7.0 kernel): there the host sees both the
> off/on cycle and an unplug as ordinary disconnects, so no reset is
> queued and input resumes after re-enumeration as before.
> 
> Assisted-by: LLM
> Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>

This doesn't look like a problem to be worked around in the USB audio
driver side, but better to be addressed in the USB core, IMO.

Please try that, or ask USB guys.  If they find this should be rather
fixed in that way, I can reconsider and review again.


thanks,

Takashi
