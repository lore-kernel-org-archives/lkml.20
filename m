Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843647;
	b=D2bBPJQ7ClsGThZCMw681VVrM7bg5Uew8E9PmOhGzVaB2UkRHDViuYJn0Zm/pYmAlQDL
	 cBSXSSEsHXSkmU3T2TOZsN01e45Evdm2IuPJRQ3MQUcw43ZziIM6QfuoHsDvxBbWT7xTV
	 hzKoLZVFyCL1fSWT7Mw7h6CWamJOZvmp3fsmR9fq+qq/kyKz1TveHWKjdXbzbqcaPPXSz
	 kVsjhdBq6zUZYz3WTbvdifeJ+gqVWXexzt8KbX1PbTk/XrU48CFGnZRfQUlKqP6i29nTF
	 9rU6O3tAU3kHQ4KoMvqyknQ/vyto+6fQegYuTT8CMKI6VQPNbddYyCKRP7FHDEnH5SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843647;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=LP+H4x9t+eiBrd2FiZV5gCBvQSjLjhDszp6+ffw2i24=;
	b=ij5vywPOYhYHa1FCBTkr62x3eYptwJEy8lwzZX1JvV726t2uZo5XHGlcuMyDBIRxJI/Y
	 qSuZq2S49PPYCq62RwQZncW/S2qA2hN3omDehIZA72vo4eMIylOKbrl1J2fsZOPeRplxK
	 swkYYQPBaAJI7t3favCEka7wCTJlVOEoP28BMLxhidhdANCVPU8G7z/NSwTZaeKJ4x4K/
	 FaY3lJgpOyxCconclH3xjp6WpbukpKuYIvLqhP+bvagVWRDseDEaLEECbVLGNK9vF1G2W
	 sO1EGt6qJrutyXgnGxiS4pQ+fGbJiLkR1bv1C4rj27mt8ZnY2w81aGixOZ+nrlGKDzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cMG5hI0T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tEy2YW4K;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cMG5hI0T;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tEy2YW4K;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735DD606A31C;
	Mon, 16 Nov 2026 15:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 735DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cMG5hI0T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tEy2YW4K;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cMG5hI0T;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tEy2YW4K
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3B49B222EE;
	Mon, 16 Nov 2026 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LP+H4x9t+eiBrd2FiZV5gCBvQSjLjhDszp6+ffw2i24=;
	b=cMG5hI0T1cHj305KmJoLNtUnHsorlQJ787qsQk0ON7NU+ftWV8o35ZwLM2t39DU4tGNYTV
	51gRe941ZWmWDg5iXXQ1xkDXhWSbLzdUq9WNI4X1d3w0EWQkQO52X2d2FHWlZFLAleOEEL
	FXqa565LZYpkBioF7cRQjAEVKnZ2gsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LP+H4x9t+eiBrd2FiZV5gCBvQSjLjhDszp6+ffw2i24=;
	b=tEy2YW4KUco1wC/PPEoWaJF9xS6XhpQRjKlBFl6+fhLcEY+7FIl9+EZIVbuzSlgOTBbqVT
	IVMD5QkL2R/OqjDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LP+H4x9t+eiBrd2FiZV5gCBvQSjLjhDszp6+ffw2i24=;
	b=cMG5hI0T1cHj305KmJoLNtUnHsorlQJ787qsQk0ON7NU+ftWV8o35ZwLM2t39DU4tGNYTV
	51gRe941ZWmWDg5iXXQ1xkDXhWSbLzdUq9WNI4X1d3w0EWQkQO52X2d2FHWlZFLAleOEEL
	FXqa565LZYpkBioF7cRQjAEVKnZ2gsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LP+H4x9t+eiBrd2FiZV5gCBvQSjLjhDszp6+ffw2i24=;
	b=tEy2YW4KUco1wC/PPEoWaJF9xS6XhpQRjKlBFl6+fhLcEY+7FIl9+EZIVbuzSlgOTBbqVT
	IVMD5QkL2R/OqjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E54D713408;
	Mon, 16 Nov 2026 15:40:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ghjcLfsj+2otPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 15:40:43 +0000
Date: Mon, 16 Nov 2026 16:40:43 +0100
Message-ID: <875wxwyebo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sinan Turunc <enscrpt@pm.me>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usx2y: Count completions apart from the URB array length
In-Reply-To: <20261115121602.151-1-enscrpt@pm.me>
References: <20261115121602.151-1-enscrpt@pm.me>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[pm.me:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Sun, 15 Nov 2026 13:16:33 +0100,
Sinan Turunc wrote:
> 
> usx2y_rate_set() allocates a snd_usx2y_urb_seq with len set to the
> number of URBs, and i_usx2y_04int() decrements len once per completed
> URB to know when all of them are done. Since len is also the
> __counted_by() bound of the urb[] array, every access to the array after
> the first completion is out of range for UBSAN, and the cleanup loop in
> usx2y_rate_set() trips it on every prepare:
> 
>   UBSAN: array-index-out-of-bounds in sound/usb/usx2y/usbusx2yaudio.c:694:18
>   index 0 is out of range for type 'urb *[*]'
> 
> Count the completions in a separate field and leave len as the array
> length.
> 
> Tested on 7.3-rc7 with CONFIG_UBSAN_BOUNDS and an emulated US-122 over
> USB/IP: before, the report appears on every prepare; after, a 30 s
> capture stream prepares and runs without it and the rate sequence still
> completes.
> 
> Fixes: f5cc9cdfc96f ("ALSA: usx2y: Annotate struct snd_usx2y_urb_seq with __counted_by")
> Signed-off-by: Sinan Turunc <enscrpt@pm.me>

Applied now.  Thanks.


Takashi
