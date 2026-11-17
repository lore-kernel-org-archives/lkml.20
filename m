Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927789;
	b=KZmqUW1QyBEl/s+40Vo6J3hOf9QCoZCOdBAkAc5M5TMbcrAQLS+IkUU6MtqYqnxkdAV2
	 wV4ReHUooezs2StefqD5OnqzFDK4vDdCLfLqfLV/rhFavy567O0oQInMUYIwaCtzFBG+X
	 0nDnt9rF9bitF59FeMMvy2ksBkJBq46qFdeKOv1IegQIYgm4s1IClBbRXkQ+ibH8rZd0A
	 i573EE845F1OGA0l/R7SIsNmL1fyJgUPV6wtungb0WeJQDLV1q+Q+uJ4B1ZwM55FfJV9F
	 6g9xogioDMpX797TUsPXWHU+1l4mBJUXuIdds58lliesMyuaiwzTT6PbxjO7IXIwLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927789;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=hUv4OKsQyvEWhazdxRtoKfFJvndmTn3Nylnfh5JBWbI=;
	b=Bu+1W/dYjgskaxrXmKO09vd3bDnluMx8rnhOQAhKFScK/H4UkH6PD8oacwbtOFFEN66A
	 C2xb7+Y8JDUNLlO8eHSrd7X5ys1RlaIHfjWZEl/GOHW543Bg3bS8ylxem1Y/aeOS7Zbma
	 7Uiu2y/vRb4/kT+IV2Z6dK+4t9iC1nIhhUIOXHpYI5rUsxwBseduizddk1cOhknvR87A5
	 GrqgMCZmjxZp6LNpEc3IyJ5qk1BHiw1/fHFJeg5k+lvTmgU54uKjeRvkVoFZyXcAjMdZv
	 ayRcW+YmLLxGF4pqHgKwmoDVOnj6qu5A4R449wQ5O3iC+Vmc3VUMQVkbxY+rGOwEIEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eew6Mzg1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6o3HwCQi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eew6Mzg1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6o3HwCQi;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9EE606A32A;
	Tue, 17 Nov 2026 15:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eew6Mzg1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6o3HwCQi;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Eew6Mzg1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6o3HwCQi
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 915301F788;
	Tue, 17 Nov 2026 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794927786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hUv4OKsQyvEWhazdxRtoKfFJvndmTn3Nylnfh5JBWbI=;
	b=Eew6Mzg15MIomChOlfwEvQKLbV/H1XvQWO4y61RQLxiNIRzDW5DqAIPiYOreK4Ft6Bog+i
	CeDsY5i1zgy8MOiZO3cA6xBP9IsHi8SmU0v+LqufEZ5xDWT3ejKuy61PrSdfbdAPrlowQ7
	y7+V3K7S+iCR1QysQvAhi+lAmsPhiqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794927786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hUv4OKsQyvEWhazdxRtoKfFJvndmTn3Nylnfh5JBWbI=;
	b=6o3HwCQiw6KSNd8lDysHbf3FLjZnN0A051S9csoB3YGzUaI4kMSAUUla9XJ3fIDBJStzV/
	KQ0DsAY5D0uSFCBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Eew6Mzg1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6o3HwCQi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794927786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hUv4OKsQyvEWhazdxRtoKfFJvndmTn3Nylnfh5JBWbI=;
	b=Eew6Mzg15MIomChOlfwEvQKLbV/H1XvQWO4y61RQLxiNIRzDW5DqAIPiYOreK4Ft6Bog+i
	CeDsY5i1zgy8MOiZO3cA6xBP9IsHi8SmU0v+LqufEZ5xDWT3ejKuy61PrSdfbdAPrlowQ7
	y7+V3K7S+iCR1QysQvAhi+lAmsPhiqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794927786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hUv4OKsQyvEWhazdxRtoKfFJvndmTn3Nylnfh5JBWbI=;
	b=6o3HwCQiw6KSNd8lDysHbf3FLjZnN0A051S9csoB3YGzUaI4kMSAUUla9XJ3fIDBJStzV/
	KQ0DsAY5D0uSFCBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D6E81334C;
	Tue, 17 Nov 2026 15:03:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lFSCDaps/GpDYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 15:03:06 +0000
Date: Tue, 17 Nov 2026 16:03:06 +0100
Message-ID: <87se0zxzyt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Validate card indices in lookup helpers
In-Reply-To: <20261117104155.3080-1-sreekuttan2156239@gmail.com>
References: <20261117104155.3080-1-sreekuttan2156239@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 915301F788

On Tue, 17 Nov 2026 11:41:54 +0100,
Sreeraj S Kurup wrote:
> 
> Ensure card indices are within the valid range before accessing
> the card array or lock bitmap in snd_card_ref() and
> snd_card_locked().
> 
> This prevents out-of-range indices from causing invalid memory
> accesses in these lookup helpers. It also protects against
> invalid indices passed by existing or future callers.
> 
> Return NULL from snd_card_ref() and 0 from snd_card_locked()
> when an invalid card index is supplied.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

If the value is out of range, it must be a bug in the driver, so this
is worth for putting either WARN_ON() or snd_BUG_ON().


thanks,

Takashi
