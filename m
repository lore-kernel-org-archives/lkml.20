Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433217;
	b=FxkBusSuT7+LJxG08yRIbtQhVBM7q6zshFITH8SdmBd+3Ooa2ng12DBu3cYPG833EPBm
	 EZvHbR0POjs2CiQeu6oJT4hgVN+XCeaxvglIhpLDn9keUHw/hyFcdMU8W9KXshnBUK51a
	 EWwNH0FTT9fsjlkQV1GNcgzQx1QX7EHznf2ZVHyJb80K2/l7oYhZI0megKAiiPmyhC8zU
	 xn3ajS/uOWSraMUxnv1GTHrJxzplgXKJgKFG6eN69zLbaeLdS32A4u2st/AbWTDNc7TY0
	 pwVHDmay50lMpJ8mPc0JR77+tI7Npig6rcBBIB/+TZd+9/0JgYU082G94zcHXVvPeow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433217;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=ioSI7gBw8YYoN6MLWx+msBLUE4+P0kKiCbDQC4i4rL0=;
	b=tXv/2J3/p+IKGO9ehjYd1Aa00F/EnzcGuTnuDm0GNKJMqBTNUzEmpK07zsLaGRnpPluO
	 lxj1h01Jl0Rc9Y1+9asuHKUieIMxQCHlV95TrZGZqYkpEfE8+UrhFx7hLkIVwlh3y7yko
	 35B55V9D8fTG39j0EOgFtJoBTky9BWTe3Rsk+1zVRWUfVXB9wo6goLl83de8T53ZcikUY
	 XHs+4IGcUjMzk2gjo9gIK7NGsSDJtOtCrqgiWLQQI7ql6Mcc2eGIgIpKzSnwdSV7NLQaO
	 /bm0PMZsiT0GVxBBbCiKcvGXeTzXWD8Q18KJKZ8t18/cMcOxzz0c2vi3bMQO+4KHcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="LlgVLh/4";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FEGecQ6S;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0SdrosE0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="+9cY/0vH";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2764606A31E;
	Mon, 19 Oct 2026 18:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2764606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LlgVLh/4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FEGecQ6S;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0SdrosE0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+9cY/0vH
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 07E8121C8E;
	Mon, 19 Oct 2026 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792433215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioSI7gBw8YYoN6MLWx+msBLUE4+P0kKiCbDQC4i4rL0=;
	b=LlgVLh/4dT3cbN8iKL0f6acPZSj5fZHgdXTYvmXVWs2zemev3otltlBFw9HkhRLy8pgd56
	E1U/iDqLlmckSZSNa+GPjCa6nrZJ3mMrVsi+i/6bJlQ/gSkejB8lw3fmJ8xUBWKCJ0HHFL
	/I0i7TlAHEWYM+cbEp3WqrxzH5Fu+WQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792433215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioSI7gBw8YYoN6MLWx+msBLUE4+P0kKiCbDQC4i4rL0=;
	b=FEGecQ6SDiAFO4OXrjQ1AdB1ae7TIvCyBAu46IYIvTlkZo1+8Yi59oMiBnz8eozNjPQ4qO
	s6VHN7jA9uYmRMAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792433214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioSI7gBw8YYoN6MLWx+msBLUE4+P0kKiCbDQC4i4rL0=;
	b=0SdrosE0Pr6BY0pH1nNnFaGmdwHC5Hf0iGuU1P7UQOb+l7IU7tA+ndUlHMoCooxE1kCR+v
	e6k6ynRmIi7ThNYrRFyW4fddnhmWizW03ISfwDbB1lZj9cx7wGHOq24auVVr7s+74Hhvif
	4TKECsf/4XBC7WF/E8PIVV9ntTuXeP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792433214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioSI7gBw8YYoN6MLWx+msBLUE4+P0kKiCbDQC4i4rL0=;
	b=+9cY/0vHKJ7WEsRLzZL7v9HyI2VEBDhPMZ2hahTH14ZKY23+9syhVT1FoSatz4acbjOPDv
	hX6RhQjtBFXGZfCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0E72136CC;
	Mon, 19 Oct 2026 18:06:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LiusIT1c1moeTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 18:06:53 +0000
Date: Mon, 19 Oct 2026 20:06:53 +0200
Message-ID: <87se21imyq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Moroz Tymofii <moroztymofii@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute LED on HP Pavilion 15-eg2xxx
In-Reply-To: <20261019164725.10666-1-moroztymofii@gmail.com>
References: <20261019164725.10666-1-moroztymofii@gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 19 Oct 2026 18:47:25 +0200,
Moroz Tymofii wrote:
> 
> The HP Pavilion 15-eg2xxx (103c:89f6) uses GPIO bit 4
> for its speaker mute LED.
> 
> Enable the existing ALC287 GPIO LED fixup for this system.
> 
> Tested on Linux 7.3-rc7 without an hda_model override.
> The F5 LED follows speaker mute/unmute correctly, and
> audio playback works normally.
> 
> Signed-off-by: Moroz Tymofii <moroztymofii@gmail.com>

Applied now.  Thanks.


Takashi
