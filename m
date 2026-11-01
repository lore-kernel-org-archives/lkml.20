Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547451;
	b=s+qKQIhR6pUOH7auquC2l7rps6gHiLYtUXaKd7par24MjKzscxS1ChR5U8P7BYouTOAo
	 Xp77zfHOoufZ6Os36qCTlcF33Zw+zdjZ7YYvOmNYXvu2wGDy1kNX51TOsMYjQG22WH+3p
	 Z4Pr/SG8gzvKb4skq3a0MhIcFDP+LhzW9mQH1o+pNssQKDQdDlfydAoHvYKNR3x8R4o4m
	 pY+z/pVgBZ+Gkc7nRRj2PnvJ4WYxmLorjkVpi1XVnhmpcZBjx3pac2runk5WTzUhPzTvL
	 xCXmcXZzhORkjov45XvCVCp5vV4NHtEHf6iFu8g36r6Vy/shPMwv8SZP/xyq/D/uruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547451;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=6lUU6hIrCqmK8U6bSvEGJzBOY/PrPmDQJZCn4oelURE=;
	b=yZKQMcHA7ZcRuSCtDPzqfkgK3tR2q/8xpQD1E6x/W4dijELKXIwEQgWy8CZ/8Z3qcj/S
	 Ts5781yHhI6Nu5z7mt1J9qz8Z4HTvrOooGHzyEU/IUYKE2YfmQpil/35GtGGPejnyhKfX
	 eqyt9thxk2N+lriclOXxi4p+9Xw3WmZee/wHXVoQ0NvvDIYn06ZpEzVau9Z9dY6Bw/22o
	 EGGFDyzVX+up7jzFRhwx5KRnPfQsdsu9PU04WkPWfeQWkwSLOJBom7OLixf4JVXnAiKzV
	 2W36hhQRYURRkesQA5J8RxdDk+Qg8Y8O2fQGNjeAbVToJUfz4z2/R22z2EYlQTPLN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lvg9o+vz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D0Cg91Vz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lvg9o+vz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D0Cg91Vz;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E209F606A324;
	Sun,  1 Nov 2026 15:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E209F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lvg9o+vz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D0Cg91Vz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lvg9o+vz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=D0Cg91Vz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15C7A220D5;
	Sun,  1 Nov 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793547449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lUU6hIrCqmK8U6bSvEGJzBOY/PrPmDQJZCn4oelURE=;
	b=Lvg9o+vzLXcy+1tr39kjrqqDr7XXfPbpL5EqLGRT+jrba3ytXrG+OUYP5AHlIuP2lEyJyL
	bjL6GyvkTC0KK/IUqm1A8G2SYMUynfgLMD6aBHy/HRjh05mVZBwe3zMlnbtqTztMk3ubtt
	l34fmVMM6JpuVp0rQPbgxtcycQ5u8wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793547449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lUU6hIrCqmK8U6bSvEGJzBOY/PrPmDQJZCn4oelURE=;
	b=D0Cg91VzPK1rM3fMHcZkNpgmLLSOfCQ+JYY2OhKeeR8rYB/W1dD2aLlqIj07yYZ9517+U5
	5vXqLEjbu2xnO/BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793547449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lUU6hIrCqmK8U6bSvEGJzBOY/PrPmDQJZCn4oelURE=;
	b=Lvg9o+vzLXcy+1tr39kjrqqDr7XXfPbpL5EqLGRT+jrba3ytXrG+OUYP5AHlIuP2lEyJyL
	bjL6GyvkTC0KK/IUqm1A8G2SYMUynfgLMD6aBHy/HRjh05mVZBwe3zMlnbtqTztMk3ubtt
	l34fmVMM6JpuVp0rQPbgxtcycQ5u8wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793547449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lUU6hIrCqmK8U6bSvEGJzBOY/PrPmDQJZCn4oelURE=;
	b=D0Cg91VzPK1rM3fMHcZkNpgmLLSOfCQ+JYY2OhKeeR8rYB/W1dD2aLlqIj07yYZ9517+U5
	5vXqLEjbu2xnO/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B82EC13314;
	Sun,  1 Nov 2026 15:37:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id weCGI7hc52qMMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 01 Nov 2026 15:37:28 +0000
Date: Sun, 01 Nov 2026 16:37:28 +0100
Message-ID: <87h5i0pnpj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shivam Madlani <shivammadlani5@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP OmniBook 7
In-Reply-To: <20261101143818.17714-1-shivammadlani5@gmail.com>
References: <20261101143818.17714-1-shivammadlani5@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Score: -12.30

On Sun, 01 Nov 2026 15:38:18 +0100,
Shivam Madlani wrote:
> 
> The HP OmniBook 7 Laptop 14-fr0xxx (PCI SSID 103c:8e3b) uses an ALC245
> codec with CS35L41 amplifiers. The existing quirk
> ALC287_FIXUP_CS35L41_I2C_2 does not configure the speaker mute or
> mic-mute LEDs, leaving them non-functional.
> 
> Switch to ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED, which controls
> the speaker mute LED via COEF index 0x0b, the mic-mute LED via GPIO
> 0x04, and chains to the CS35L41 amplifier setup. Also update the model
> name from the internal board codename ("HP Agusta") to the retail
> product name.
> 
> Signed-off-by: Shivam Madlani <shivammadlani5@gmail.com>

Applied now (with Fixes tag).  Thanks.


Takashi
