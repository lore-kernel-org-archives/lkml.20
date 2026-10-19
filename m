Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA5D4F183F;
	Mon, 19 Oct 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420035; cv=none; b=ANOcF9J6YkHqzMcNBBQyPp+2L3eT9IAF8J9WxHgKR4DJ1oohju4I8XPZKczu7udWcGCqjLbFC2GyppvSPv95Xozgin1L/BqGI4JIEnFjxsXxn+OgxNNnjrq4ywzGhD4oHplcATcJgP42vmJfFKwUUom6PBbqSOYl19jUg6udbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420035; c=relaxed/simple;
	bh=fE8YliARBcejpVDVSUFjtkET5cfYYsMdzGxAWb8nalE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMpyssHfe5zrGlrMTgkiNmr/tH+Pxuc5xywAnFAjFoz9X7abHutAfw5KURMTj7ydCDE19G/W3LX86FtPlaIvVHguiDUlmI+NuW8FtJ9oOnb7luudzPpD4RuZmwjDvjeds4bYqXSaQIk0DM8+4+Uat3CiQ8kgxAcRcsdA3gtKP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QGBXnh1x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ExcsGnVW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QGBXnh1x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ExcsGnVW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QGBXnh1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ExcsGnVW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QGBXnh1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ExcsGnVW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9AEAF1F7A2;
	Mon, 19 Oct 2026 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792420032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3KIrH4FhdU9IDzA6AC2t/4xN4JectowNV3AfnWmucY=;
	b=QGBXnh1xP2q0+bIcqpFHLUuLlIRBjGbsC9ECl+jXmw3K3USQG9p3YDY7zL4G7kSjTE5EUo
	YXuQzAIHPiugS36ufpxSmrk5OIHYg1M8+t93C/DzxsVvIELQFeQLqsTbSpi56OaJlQvuTB
	kWZ4Plk1OCzS8+LObhN9WyxnqJjE95g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792420032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3KIrH4FhdU9IDzA6AC2t/4xN4JectowNV3AfnWmucY=;
	b=ExcsGnVWZ18EvLdaP7rLqeQvSIPuZ6LTEqXYmzRddnXr877pEVvaJPabYfBdv5IGBSQMNU
	YHLRKa/AMxw7bmDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792420032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3KIrH4FhdU9IDzA6AC2t/4xN4JectowNV3AfnWmucY=;
	b=QGBXnh1xP2q0+bIcqpFHLUuLlIRBjGbsC9ECl+jXmw3K3USQG9p3YDY7zL4G7kSjTE5EUo
	YXuQzAIHPiugS36ufpxSmrk5OIHYg1M8+t93C/DzxsVvIELQFeQLqsTbSpi56OaJlQvuTB
	kWZ4Plk1OCzS8+LObhN9WyxnqJjE95g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792420032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3KIrH4FhdU9IDzA6AC2t/4xN4JectowNV3AfnWmucY=;
	b=ExcsGnVWZ18EvLdaP7rLqeQvSIPuZ6LTEqXYmzRddnXr877pEVvaJPabYfBdv5IGBSQMNU
	YHLRKa/AMxw7bmDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 487A4136CC;
	Mon, 19 Oct 2026 14:27:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LSjkB8Ao1mqpZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 14:27:12 +0000
Date: Mon, 19 Oct 2026 16:27:11 +0200
Message-ID: <8733u1ahq8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: jack: Pin the module while debugfs files are open
In-Reply-To: <pm-pmb-431ddb947e1a13b95d3a-v3-02d37dd7b4eb4774e100@gmail.com>
References: <pm-pmb-431ddb947e1a13b95d3a-v3-02d37dd7b4eb4774e100@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.980];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 19 Oct 2026 12:30:54 +0200,
Cen Zhang wrote:
> 
> With CONFIG_SND=m and CONFIG_SND_JACK_INJECTION_DEBUG enabled, an in-tree
> HDA jack creates these debugfs files through snd_jack_new() and
> snd_jack_add_debugfs(). Their file_operations live in snd, but none sets
> .owner. full_proxy_open_regular() therefore takes no snd module reference
> when it calls fops_get(real_fops).
> 
> A debugfs descriptor can outlive removal of its HDA card. Once the card
> and dependent modules, including the OSS emulation modules, have been
> removed, snd can be unloaded while that descriptor is still open:
> 
>   Descriptor holder                   Card/module teardown
>   -----------------                   --------------------
>   open jack debugfs file
>     full_proxy_open_regular()
>       fops_get(real_fops)
>         owner == NULL: no snd pin
>   keep descriptor open
>                                       remove HDA card
>                                         snd_card_disconnect()
>                                           snd_jack_dev_disconnect()
>                                           remove debugfs nodes
>                                         snd_jack_dev_free()
>                                       unload dependent modules
>                                       rmmod snd
>                                         alsa_sound_exit()
>                                         free_module(): unmap snd
>   close descriptor
>     full_proxy_release()
>       read real_fops->release
>       fops_put(real_fops)
>         read real_fops->owner
> 
> debugfs_remove() drains active operations, but does not wait for idle
> open descriptors. Release deliberately bypasses removal protection and
> reads the real table even when no release callback is installed. The
> last close can therefore access unloaded snd storage.
> 
> Set .owner to THIS_MODULE in all six tables. The existing proxy
> fops_get()/fops_put() pair then keeps snd loaded through the final table
> access on close.
> 
> Fixes: 2d670ea2bd53 ("ALSA: jack: implement software jack injection via debugfs")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied now.  Thanks.


Takashi
