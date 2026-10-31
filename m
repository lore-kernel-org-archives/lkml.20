Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460836;
	b=vGdPug/PVLXmtQDXOuf85UDW2q4p9DeWWO2zP7y49kAZAmm1oBZpzmrDj4lHBugtFGj8
	 2QXbIPSacJV8pizUkafpQ/zV00SFXLEFjnigRrTwBMDaZ4zNPh9zocV2HPKUCLW/a4mnV
	 OdTse7jdybDnDYfvQv+UqPz+mo/FaWPJFzgQraYk4ASlHG9z1SlwrkRcs0BRsnaHbO37p
	 PICQf2u3EtjVuaaBtM76yoJQD7yRCf6Y304H5J/G1qtJ3lBJ8BlMSkInwYJefSaNs5d/F
	 HMW5qZlKQlS5pvHzPZgMHD4QMAX+KR6Ini2VSmhRa3JLT0WC5cOTEXJGA13lPQIw8ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460836;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=WfhUhxIoNw61PePQ91ZJypsCM2WwlGxXue4drgr2wEw=;
	b=ongNO/QF07IKdb0hXpjM6uJm5W+4OiRzH2Z9u4To8IeXjBiKgEOlAd1QBhsPSV0AlL9J
	 SO6A91rwsbu7v0D9yQaNUx/0A5uaK3M9d/XsTXrGzXmS7lPKvyIRBvLNk1VO/UPDVVliN
	 pUPcHZBU1pEQ0ifE6GTXX3O8Se9SWw61tSgL619C1KQ9Z2Pxqohw0FuvaYhVwuOyEouE6
	 Kv4BHVq5necxFQj+wSLRFqp+UJGfBxDu8bL+TcKUHejcc7rhmoLQITG7+hKFxgx8KBGUc
	 CFiCQzuA7gjKEtHtk+L67B9sB0UKEpNHd+HDPBTTj6RiJmzBEoob7W2xVyse5qDLsXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sR2lUWe4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kjRz0Ln4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sR2lUWe4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kjRz0Ln4;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87D606A31C;
	Sat, 31 Oct 2026 15:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D87D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sR2lUWe4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kjRz0Ln4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sR2lUWe4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kjRz0Ln4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4BC141F749;
	Sat, 31 Oct 2026 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793460834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfhUhxIoNw61PePQ91ZJypsCM2WwlGxXue4drgr2wEw=;
	b=sR2lUWe4xU1Om44/X8r5M3wyH1LXwRX3TatX7c6BAyTRjgOrZVuz8M4PzIyO0E7fDV4/7D
	vmCKPb4rA7y0ZyO3PLPiZaShaJ1ObzNE+zHt7HUHY4NnIsHXRII2NbACfKM9c6pgXbB67q
	uYXzaBsqaJRwX71NPPBt+rpzezg/UmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793460834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfhUhxIoNw61PePQ91ZJypsCM2WwlGxXue4drgr2wEw=;
	b=kjRz0Ln43Pgai+VG76NyfTbclG+jkmQ95Oc63H9rijGCvof2DT7mzzm0PYxIb3rINpRn3E
	OTyF5ZeidpFLyXBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sR2lUWe4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kjRz0Ln4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793460834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfhUhxIoNw61PePQ91ZJypsCM2WwlGxXue4drgr2wEw=;
	b=sR2lUWe4xU1Om44/X8r5M3wyH1LXwRX3TatX7c6BAyTRjgOrZVuz8M4PzIyO0E7fDV4/7D
	vmCKPb4rA7y0ZyO3PLPiZaShaJ1ObzNE+zHt7HUHY4NnIsHXRII2NbACfKM9c6pgXbB67q
	uYXzaBsqaJRwX71NPPBt+rpzezg/UmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793460834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WfhUhxIoNw61PePQ91ZJypsCM2WwlGxXue4drgr2wEw=;
	b=kjRz0Ln43Pgai+VG76NyfTbclG+jkmQ95Oc63H9rijGCvof2DT7mzzm0PYxIb3rINpRn3E
	OTyF5ZeidpFLyXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC76113432;
	Sat, 31 Oct 2026 15:33:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7wtQKGEK5mpbEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:33:53 +0000
Date: Sat, 31 Oct 2026 16:33:53 +0100
Message-ID: <87fqxlsx3y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sasha Levin <sashal@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: memalloc: Free the new pages when WC DMA mapping fails
In-Reply-To: <20261028144441.992127-1-sashal@kernel.org>
References: <20261028144441.992127-1-sashal@kernel.org>
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
X-Rspamd-Queue-Id: 4BC141F749
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Wed, 28 Oct 2026 15:44:41 +0100,
Sasha Levin wrote:
> 
> snd_dma_wc_alloc() keeps the newly allocated pages in a local variable,
> and snd_dma_alloc_dir_pages() stores them in dmab->area only after
> ->alloc() returns.  If dma_map_single() fails, the error path passes
> dmab->area to do_free_pages() instead, and that is still NULL at this
> point for the usual callers.
> 
> The pages are then leaked with their write-combining attribute still
> set, set_memory_wb() warns about the zero address, and for buffers
> larger than a page free_pages_exact() goes on to free the struct pages
> of the bogus addresses 4096, 8192 and so on.  With CONFIG_DEBUG_VM that
> hits the VM_BUG_ON() in free_pages():
> 
>   kernel BUG at mm/page_alloc.c:5600!
>   RIP: 0010:free_pages_exact+0xcb/0xd0
>   Call Trace:
>    snd_dma_wc_alloc+0x14f/0x160 [snd_pcm]
>    snd_dma_alloc_dir_pages+0x4f/0x80 [snd_pcm]
> 
> This was reproduced on an x86 guest without swiotlb by allocating
> SNDRV_DMA_TYPE_DEV_WC buffers for a device with a 24-bit streaming DMA
> mask, so that dma_map_single() fails.
> 
> Free the pages that were just allocated.
> 
> Fixes: c880a5146642 ("ALSA: memalloc: Use proper DMA mapping API for x86 WC buffer allocations")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Applied now.  Thanks.


Takashi
