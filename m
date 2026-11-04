Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811917;
	b=i0IRCwEPHvu5yKkUXhUfL4UlWMYFaJgCCo6NuBWyj5xXMnHWKuaCu0cAkoKj76I2u9uc
	 VdM0wB6kHLNgr7kdFTeFKlEEJQwEU8PzXBkMl2roQPHQIPFPBZj65Wv4dEStR3ZLkj2dz
	 bPf4oDN6MfVpGkKUA2TB+Q9aiVbYNtqpzng5ImKE/lilIZ/8AHr08SpltGhNgQ3mui+K1
	 MgMX6TF3xZ9GALUI2zCTPs0iV0cXpN27q11tm2Id6h5KX4+QAXnBQmlToDp2+NBLwTEGI
	 mwWcFjhJsMlV2CEg7sQLc4su3L+qDYiiB41piFMG01GcBHTSmr6OKHpTzH7rX1x0/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811917;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=b9mqyszWE+s/BPty+6IDSzsJ4NwhbEuImRQIx+oQ6vk=;
	b=vbXeaGkggj4pVDChKVVYXedyA/+0E0wrHH0SKGB9GAUnAlS7fyr5jXZYDZQ/qxrYXSpT
	 vmHB6cWy0Z60onnzhb6eCI/Ke0tcbWlpCd9xZmr9WE9k9fOSk3PF7ANlxefTZlmIJnV0C
	 qdSKBDnrTguIVopmXXeduCRDOp1raTWtEHuxd01LpLVxf5OFMVzZC+nNlQaiHj/m7+rod
	 mzpB0Z+F+V2gLydSQ9FhHGX5KRV1u6XYxPuBBBPvNyPoPj7qTpXW+DZN/6IYjPwmIo+E8
	 lJmk0Ox1xsVfrmNK+LONqsy/ymyy9TcMqn3T22TXvuH6gzjGVImFI2mMoKotUm3SkPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0PrlmqZ7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Eg7DTDv0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0PrlmqZ7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Eg7DTDv0;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADEF606A335;
	Wed,  4 Nov 2026 17:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADEF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0PrlmqZ7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Eg7DTDv0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0PrlmqZ7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Eg7DTDv0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4523421E54;
	Wed,  4 Nov 2026 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793811915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b9mqyszWE+s/BPty+6IDSzsJ4NwhbEuImRQIx+oQ6vk=;
	b=0PrlmqZ75ck00LecdruTFdvtoJhhd8opM0DkyouxvNVErPKr7xWeBEIk7XFaZVjKeUkfsh
	UtrYTyI9IdJq+unu/uVDA6YuXMhZW6eJmAw0fAid0Q6A0EsLtIV2C6by3o3O2GjYXCtg6T
	fsZQIl/AD1GIxKGuzbNZXe7UEdVa8rY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793811915;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b9mqyszWE+s/BPty+6IDSzsJ4NwhbEuImRQIx+oQ6vk=;
	b=Eg7DTDv0Vporxnb2UM2iuNmOgpkYfxjeKQUbJ7y2UOiCjhkoTPDfdllOlIzO4L0fA5iU/p
	o1DhSgSvKa/Vw2CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0PrlmqZ7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Eg7DTDv0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793811915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b9mqyszWE+s/BPty+6IDSzsJ4NwhbEuImRQIx+oQ6vk=;
	b=0PrlmqZ75ck00LecdruTFdvtoJhhd8opM0DkyouxvNVErPKr7xWeBEIk7XFaZVjKeUkfsh
	UtrYTyI9IdJq+unu/uVDA6YuXMhZW6eJmAw0fAid0Q6A0EsLtIV2C6by3o3O2GjYXCtg6T
	fsZQIl/AD1GIxKGuzbNZXe7UEdVa8rY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793811915;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b9mqyszWE+s/BPty+6IDSzsJ4NwhbEuImRQIx+oQ6vk=;
	b=Eg7DTDv0Vporxnb2UM2iuNmOgpkYfxjeKQUbJ7y2UOiCjhkoTPDfdllOlIzO4L0fA5iU/p
	o1DhSgSvKa/Vw2CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED3B5134A5;
	Wed,  4 Nov 2026 17:05:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CY80Mspl62pXEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 17:05:14 +0000
Date: Wed, 04 Nov 2026 18:05:14 +0100
Message-ID: <87fqxgttmd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: rafael.gago@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hdsp: allow sample rate changes from hw_params
In-Reply-To: <20261101-hdsp-sound-v1-1-f39f185400b5@gmail.com>
References: <20261101-hdsp-sound-v1-1-f39f185400b5@gmail.com>
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
X-Rspamd-Queue-Id: 4523421E54
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.01

On Sun, 01 Nov 2026 16:18:50 +0100,
Rafael Gago via B4 Relay wrote:
> 
> From: Rafael Gago <rafael.gago@gmail.com>
> 
> hdsp_set_rate() refuses to switch between single, double and quad
> speed whenever capture_pid or playback_pid is set. Both are set in the
> PCM open callbacks, so the substream that asks for the new rate in
> hw_params always blocks itself:
> 
>   cannot change speed mode (capture PID = -1, playback PID = 4242)
> 
> As a result no application can move an HDSP from 48 kHz to 96 kHz (or
> to 192 kHz on the H9632) through the normal ALSA API. Rate changes
> within one speed mode work, and a speed mode change only works through
> the "Sample Clock Source" control while no PCM is open, which is what
> users have to script around today.
> 
> The restriction exists because a speed mode change moves the channels
> to other DMA buffer slots (hdsp->channel_map) and changes the channel
> count, which must not happen under a substream that was already set up
> with the old layout. The substream calling hw_params is about to be set
> up anyway, so it is not such a substream.
> 
> Pass the requesting substream to hdsp_set_rate() in place of the
> called_internally flag, and from hw_params only refuse the speed mode
> change if the other direction is open and past the OPEN state, that is,
> it has hw_params of its own. A substream of another process is still
> turned away by the existing check in snd_hdsp_hw_params(), and requests
> from the controls and from card initialization (substream == NULL) keep
> the old rule of no open substreams at all.
> 
> A duplex client therefore opens both directions, sets hw_params on the
> first one (which may change the speed mode) and then on the second one
> at the same rate. To change the speed mode later it has to hw_free or
> close the other direction first.
> 
> Tested on an HDSP 9632 (v7.0 based kernel, same hdsp.c as v7.0) with
> aplay/arecord -M on hw:DSP: one stream moves the clock between 44.1k,
> 48k, 88.2k, 96k and 192k in both directions; alsaloop runs duplex in one
> process at 48k/12ch, 96k/8ch and 192k/4ch; while another process plays
> at 96k, a capture at 96k works and one at 48k or 192k is still refused;
> the "Sample Clock Source" control is still refused while a stream is
> open. REAPER on raw ALSA now changes the project rate between speed
> modes without presetting the clock first. Also built with W=1 on
> current mainline without warnings.
> 
> Only the HDSP 9632 was available for testing; the Digiface, Multiface,
> RPM and 9652 were not. The change is not model specific: the speed
> mode switch itself is the same code the "Sample Clock Source" control
> already runs on every model, and it still only happens while no stream
> is transferring data. The per-model channel counts and channel maps
> come from the driver's existing tables.
> 
> A Claude AI coding assistant (Claude Code) read the driver, wrote this
> change, the changelog and the tests at the request of the submitter,
> who reviewed them.
> 
> Signed-off-by: Rafael Gago <rafael.gago@gmail.com>

The idea sounds fine and the code looks mostly OK.
But there could be a race as Sashiko suggested:
  https://sashiko.dev/#/patchset/20261101-hdsp-sound-v1-1-f39f185400b5%40gmail.com
Could you check it?


thanks,

Takashi
