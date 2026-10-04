Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74E259C82;
	Sun,  4 Oct 2026 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138582; cv=none; b=O1jO2plCaITGywhaddPs/sqbwlzwVlPvmL6RiWpnsPh7kIjAt5ZPQ1tw13d8FDq9qt43IptqBR3XG0kXLtK73WQGwLcnWzlUSQw2zg0kmH9wtZ2Ann/FnWaEkbBYJF9mo1LAX7ztL3hQ3xVnq1yfOJeSuLHZYOB41rVdUsr5fa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138582; c=relaxed/simple;
	bh=1DkCzYgczgfyTHUVXWLRITtR0aP3fDg1WiB9WV69Tpk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UT3+/DDnqGhhKUAxez8ZJmXfUZqetoMS9PeGBjcfZVtMsr43A1eFH20plHUi+s9qhqaLV6/Bj6fOLZei/VmnqktmyyFlN55deIi7a09kYGxkEAcj3xdqL8CgXDsDjvgLe3il7NrGEywqYFju+19IbVBr2RsgQ4nHeVbAHxMt4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vwn/0SLk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=36+1ujXz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TMlrkwx4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hg8/Lh/p; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vwn/0SLk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="36+1ujXz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TMlrkwx4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hg8/Lh/p"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 20A241F441;
	Sun,  4 Oct 2026 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBCH3BOczBFV34h0sL92LKJbK3Oj4U1Y4dkL5hqmctA=;
	b=vwn/0SLkO2IjZjQtkRPIC73eH2YpOBYp+JXQd+Hbk474PyY9+RPwE5vpQfUoHZ716m4uHO
	AnqmTQt+iHKtGM2N1V4tZKMGl0NyXmz0ofVmwR0aiClSLvOVOgE2JYPUQW21MkVRksjjLl
	Q9hZ43Uw5qbLukJxGmgMrGj+vMw5zXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBCH3BOczBFV34h0sL92LKJbK3Oj4U1Y4dkL5hqmctA=;
	b=36+1ujXzC6eY4T9Xn0l9tjTTg/qeo9QKBzKQR1squXtUi8Ru2e/FVJUncdnH3B9GX7l3MD
	ERDDNV74ajre++CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791138571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBCH3BOczBFV34h0sL92LKJbK3Oj4U1Y4dkL5hqmctA=;
	b=TMlrkwx4OSa+Vo8VqgyHXyxFD33ZSsV9xhcstAhjAbHEuVt7qnGPO0Tml76cbUdGPAHtFY
	tqcz+8zfOyeUfGNSbkr+yeurJ9xQkmgPwzmzl9TCXCwJpQjfy9uij+x00qGcCDSupDWXi0
	DiR+jJOy0aBSoH1jqs+3Ps33NvHRTDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791138571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBCH3BOczBFV34h0sL92LKJbK3Oj4U1Y4dkL5hqmctA=;
	b=Hg8/Lh/pDfj0UoyV92urxCdB83Ta6hiJ3vRUjmQ6MeCbNbR4ntTcoRSzEL7Liu1DJWmCXF
	RLflE1iQ4pSBZMBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF549133CF;
	Sun,  4 Oct 2026 18:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SF4gLgqbwmqTVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 18:29:30 +0000
Date: Sun, 04 Oct 2026 20:29:26 +0200
Message-ID: <87a4otiak9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: tjdqudcks0424@naver.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: pcmtest: handle multiple wraps in random capture fill
In-Reply-To: <20261003101854.1423146-1-tjdqudcks0424@naver.com>
References: <20261003101854.1423146-1-tjdqudcks0424@naver.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,naver.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[naver.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Sat, 03 Oct 2026 12:18:54 +0200,
tjdqudcks0424@naver.com wrote:
> 
> From: Sung Byeongchan <tjdqudcks0424@naver.com>
> 
> The random capture helpers assume that the data generated for one timer
> tick wraps the DMA ring at most once. However, b_rw describes 200 ms of
> audio because the timer runs at 5 Hz, so it can be several times larger
> than a small ring.
> 
> For 48 kHz, S16_LE, four-channel capture with a 512-frame buffer, the DMA
> ring is 4096 bytes while one tick generates 76800 bytes. After filling the
> 4096-byte tail, the existing code issues a second 72704-byte write from the
> ring base, writing 68608 bytes beyond the ring. Both interleaved and
> non-interleaved capture are affected.
> 
> KASAN reports the first write into the adjacent free page as a
> use-after-free in the random-byte generator. The underlying defect is an
> out-of-bounds write from the live DMA ring, not a stale DMA allocation.
> 
> Split each random write repeatedly at the interleaved ring or per-channel
> block boundary. Keep the hardware-pointer update exactly once after the
> complete logical write.
> 
> The issue reproduced on three of three clean boots. With this change, the
> same vulnerable geometry completed six times without a sanitizer finding.
> Boundary, pattern-fill, no-timer, open/close, and module-reload controls
> also completed normally.
> 
> snd-pcmtest is a test driver, and selecting random fill requires an
> administrator-controlled module parameter. The written values come from the
> kernel random generator; no privilege escalation or attacker-controlled
> write primitive was demonstrated.
> 
> Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI Codex
> Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>

Applied to for-next branch now.  Thanks.


Takashi
