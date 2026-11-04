Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776421;
	b=mInrCyEs53YhoM5Rx58qdyiK/JnefduZ1+VcWuJnVhJOdmDxc7cDNNgTHKBDIk9vV07r
	 Zf9r+BWBU2sbVmvrD8n5sTnXPW9JdXcFO22C5fd1MG3eeYWV1+HFxej88gB/giDT8z5ti
	 HfNAMMFIOW6S1/RzZ21OEDpn0YGhWwYbqWcwGyou0RgRyiIR1AxbnYEjy1LSHwAKgS5yx
	 ILQJMUCfdkCmAJ58nqV2h/kF+UlA8Fn0fh9ySXauTbE04EBGq1wivVsQ2MYUApeuiA2fT
	 f5TiZhbYW9HTZwHsH4MJX/7vqAFZquGX4BRshAl2dZ8da0iIPb204jwfSV5GtuJ6TVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776421;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=8Lnt8/tMoo9NbKOz/SXNBFlv995z7OkqDrSphzZ8pbw=;
	b=qo1mAEZXA1WLfQR6sOWsQCcFu+UGPu1uXQA1uWI6AeQFcpX3t8hD6yw/WZEIzIFnNHb8
	 +wzqsU7d5gBsu/wwfr7CceuyY+ArLcIHpcfNp/C0w3RpwX4iYD/yzb9xucwHsq+M9puSb
	 E7RgKymA3pB02C/Nyu2nLx2KnVHUR3onQadYJxP5iR+iwxcNvETiEoLxgmbGNJSmf7ZEh
	 Vh5uK7auIIYuHWtyQun/RbsyCKlBFCooQlNHnvx1E0qUNZS6hdRiZfDAxYPW4nxnAQKW8
	 PVBdCpbaJK6OS6CDLRif41onI1QeuOOuE+1/PaFs4R48F3rY+4grvCNw+GSBuEPLzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tEyh7GhZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fqgAy59x;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tEyh7GhZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fqgAy59x;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69358606A326;
	Wed,  4 Nov 2026 07:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69358606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tEyh7GhZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fqgAy59x;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tEyh7GhZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fqgAy59x
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A5D8421F99;
	Wed,  4 Nov 2026 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793776418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lnt8/tMoo9NbKOz/SXNBFlv995z7OkqDrSphzZ8pbw=;
	b=tEyh7GhZRyu/z7Oxs9/62/AFIfal/dKoTx8ZsrhvRd9NZixnpCFtwvOZ29OyGB5yBOv/UF
	E3gMO8xQ/HXsTVCV9khbJjTdlnctge0E63dlJxi5boRJ4mUsgBGFJ3tNH2C5ApRBNgCcds
	lLs/vc27B6PfC2QMWCVeozs6nwwId5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793776418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lnt8/tMoo9NbKOz/SXNBFlv995z7OkqDrSphzZ8pbw=;
	b=fqgAy59xVFI5mNzj+jvgpbba7l6/D4p4ekRsQXcKNgSij8kT7RhsjD28ZYwt75lz4oIQkR
	6+r6/AheGPY/ywCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793776418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lnt8/tMoo9NbKOz/SXNBFlv995z7OkqDrSphzZ8pbw=;
	b=tEyh7GhZRyu/z7Oxs9/62/AFIfal/dKoTx8ZsrhvRd9NZixnpCFtwvOZ29OyGB5yBOv/UF
	E3gMO8xQ/HXsTVCV9khbJjTdlnctge0E63dlJxi5boRJ4mUsgBGFJ3tNH2C5ApRBNgCcds
	lLs/vc27B6PfC2QMWCVeozs6nwwId5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793776418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lnt8/tMoo9NbKOz/SXNBFlv995z7OkqDrSphzZ8pbw=;
	b=fqgAy59xVFI5mNzj+jvgpbba7l6/D4p4ekRsQXcKNgSij8kT7RhsjD28ZYwt75lz4oIQkR
	6+r6/AheGPY/ywCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FD8A134A5;
	Wed,  4 Nov 2026 07:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uhovDiLb6mpOKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 07:13:38 +0000
Date: Wed, 04 Nov 2026 08:13:37 +0100
Message-ID: <87y0b9ul0e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: riley.redeker@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Yamaha ZG02
In-Reply-To: <20261104-yamaha-zg02-v1-1-3fd61b8c564f@gmail.com>
References: <20261104-yamaha-zg02-v1-1-3fd61b8c564f@gmail.com>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 04 Nov 2026 01:39:38 +0100,
Riley via B4 Relay wrote:
> 
> From: Riley <riley.redeker@gmail.com>
> 
> The Yamaha ZG02 game streaming mixer (0499:1516) exposes UAC2 audio
> streaming interfaces with a vendor-specific interface class. Only its
> MIDI interfaces get bound today: the Yamaha catch-all QUIRK_AUTODETECT
> entry rejects the PCM interfaces because create_auto_pcm_quirk()
> expects a UAC1-sized FORMAT_TYPE descriptor (bLength >= 8), while the
> ZG02 has the 6-byte UAC2 one. As a result no PCM device is created.
> 
> The interface layout matches the Steinberg UR22 (0499:1509):
> 
>   0: UAC2 AudioControl (vendor class), clock source ID 1
>   1: playback, 10ch S32_LE 48kHz, async isochronous OUT
>   2: capture, 4ch, isochronous IN used as implicit feedback
>   3: Yamaha MIDI
>   4: vendor bulk interface
> 
> Add the same composite quirk and QUIRK_FLAG_GENERIC_IMPLICIT_FB for
> it. The generic UAC2 implicit feedback detection does not apply here
> because it requires USB_CLASS_AUDIO.
> 
> Tested on a 7.3 kernel with this patch applied (no quirk_alias): the
> card registers as USB0499:1516, implicit feedback is set up from EP
> 0x81, and playback (voice chat and game buses) and capture (microphone)
> work. The full channel mapping (playback 1-2 voice chat bus, 3-10 game
> bus; capture 1-2 streaming mix, 3-4 microphone) was verified with
> quirk_alias=04991516:04991509, which applies the same quirk and flag
> entries.
> 
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Riley <riley.redeker@gmail.com>
> ---
> Hi,
> 
> The Yamaha ZG02 currently shows up with MIDI only and no PCM device, so
> it's unusable as a sound card on Linux.
> 
> I've been running the identical quirk via quirk_alias since 2026-11-03 in
> daily use (including voice chat), and tested this patch itself on the
> device: playback, capture and implicit feedback all work. Full lsusb -v
> output for the device is available if useful.
> 
> A UCM profile that splits the streams into Game / Chat / Microphone /
> Streaming Mix is going to alsa-ucm-conf separately.

Applied now.  Thanks.


Takashi
