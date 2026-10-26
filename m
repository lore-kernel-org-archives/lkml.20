Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002213;
	b=1pOD6ed7cHjuNmbO/e4HcDZPYIwiDGHAdGWtbguVj0CsvkOzUWK4H/W6YqWj9FQgWJO0
	 LZJyjAYy9gZZEdg0ZVkaarrnQZQLWXfwgtQgUfWuZ6DtzqvqpjDKlDxYDJyKVm/iXpHnU
	 V53JUYKQWgxkSdx+fRwWlC2jSAygvAP+grCr7l/Gxyq9wJ5KO/CCeHozGLtwkzX5CCHIh
	 64jR/T58ZxqwzanQx/5EHmt7docqIjr4g9wUuHrAFIn+WTUaTtePgdzkDoKxsDbXwmCHN
	 011ywhWLFKmF7u5FlmVjWqHtmoA1Qnc+MU1aPYXrB/I0g48T9WdUUVNeu+pvYHB6h+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002213;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=bshICqdUzBB4/c189FBQy9woiTuRIh58eCa1412pbbs=;
	b=OiSdsJVrgJHRVBr2cPr+tQxzJ2MZZFUA/8CPmJkF4c9Ex+62Y/E1jEYS3ZkEH6Atb5oR
	 YDzbUn7X8zxP7esHisOtmZJnhVwfQEKkszFWJCUgCP7IXIVyUvKRsrcqNICAvElqd0gL3
	 AcPUDKHYkJynojCDfo7BLXLyLEuJFCupBR8UepPZlXHyzTkqnkKgl9J7nXbJGqMg7q4mH
	 uHKbr3SZbsMzl9FEdpujxC5wb1IIhDcyXAfd3vfCsJYixPjp6mK2Yh9ztaWRoR360JfU2
	 Zln2WeSksF3+U4Y+tQE/CRfR+lfYIGMpHjN3fiAwNKfTBlmYARiucN/WW0BOiskL2jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nJihmMW9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1pgdIMq+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nJihmMW9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1pgdIMq+;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E494606A31A;
	Mon, 26 Oct 2026 08:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E494606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nJihmMW9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1pgdIMq+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nJihmMW9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1pgdIMq+
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F7EA1F7A7;
	Mon, 26 Oct 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793002211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bshICqdUzBB4/c189FBQy9woiTuRIh58eCa1412pbbs=;
	b=nJihmMW93UkI7GO0eNfLe6GQK780yro7hd4GccCZBI6K+mtAV1jQV9miOR4KKvMo2dle6O
	C3wFQ8FrNCMkxrYUEnklNQR5sooODA7LjjxSdNQawwl1g+zxh08Zje9URjE8u73rkos1Dp
	dD53gtIVJmAgcFUlqhFl1zO2WQGR9/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793002211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bshICqdUzBB4/c189FBQy9woiTuRIh58eCa1412pbbs=;
	b=1pgdIMq+O5y8jrgWVDwfAo8UZ22sn7i9KXsaY7IWKdecG8lHGgAeqvgiBcKIOpRxEF6Z4B
	X0Lg3zV2JBBcLNBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793002211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bshICqdUzBB4/c189FBQy9woiTuRIh58eCa1412pbbs=;
	b=nJihmMW93UkI7GO0eNfLe6GQK780yro7hd4GccCZBI6K+mtAV1jQV9miOR4KKvMo2dle6O
	C3wFQ8FrNCMkxrYUEnklNQR5sooODA7LjjxSdNQawwl1g+zxh08Zje9URjE8u73rkos1Dp
	dD53gtIVJmAgcFUlqhFl1zO2WQGR9/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793002211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bshICqdUzBB4/c189FBQy9woiTuRIh58eCa1412pbbs=;
	b=1pgdIMq+O5y8jrgWVDwfAo8UZ22sn7i9KXsaY7IWKdecG8lHGgAeqvgiBcKIOpRxEF6Z4B
	X0Lg3zV2JBBcLNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 117AE13319;
	Mon, 26 Oct 2026 08:10:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gztzNuIK32qSJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Oct 2026 08:10:11 +0000
Date: Mon, 26 Oct 2026 09:10:10 +0100
Message-ID: <87se1s6fx9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: tiwai@suse.com,
	ivan.orlov0322@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcmtest: Reject invalid fill_mode values
In-Reply-To: <20261026031655.2699561-1-sammiee5311@gmail.com>
References: <20261026031655.2699561-1-sammiee5311@gmail.com>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,perex.cz,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80

On Mon, 26 Oct 2026 04:16:55 +0100,
HyeongJun An wrote:
> 
> The fill_block() function handles only fill_mode 0 (random) and 1
> (pattern). With any other value it writes nothing and does not move the
> buffer position. A capture stream then gets no data, and a read fails
> with -EIO after the timeout. Nothing in the kernel log says why.
> 
> Check the value in a set callback, so a bad value is rejected both when
> the module is loaded and when the parameter is written.
> 
> Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>

Applied now.  Thanks.


Takashi
