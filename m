Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B03F8250
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910696; cv=none; b=N9dlPxlebkWvtK78Kt/tPqyAlg9i9IplHCiKLBNpEElJVC0mSnOqY7mnuhjHi0QlBsDJj6iP6wZVqyDWRYxrBJ+XBzXdSvbzXXuDJB0D1I2ZEfDyvp5/nENUlj3yiG/3c/MZ+yGM5Q4RDN5LEDjsnYHWfHpZ2v3kbNRCIpYqNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910696; c=relaxed/simple;
	bh=3PStnsUt6VRufWKyuqUAheBUMCxtmEWpaivRJW6aBrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMGHezY9X4gHPe01dOfWbzTxwy0Y/hQfNNStWYdZuIpWk+++/rJ5rD0p/g9eZ/Tt0shhTDMbE4rVrIIt3XTaRM9SviOuIb0QWbhN1jrNN4j2D08YvYQdXslMLGvsf+r+OrotCcZm4AAYFXCWfTaNmyZ/UNamXdVrvDtFnvk6DW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AuAugLz5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=w9PAlSro; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vwZWjkmp; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zOFEXp6m; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AuAugLz5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="w9PAlSro";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vwZWjkmp";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zOFEXp6m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DEA81FAB9;
	Fri, 28 Aug 2026 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787910683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/SC0x8DTBKDmHj9hGfT16aGVihuMj8DZti8odJ28I0=;
	b=AuAugLz5wnJQlIzxuvc6m4hN3wJCR14KMSEC1ea5h9sVG3kqorgTbB8QYDxWn3XP4HktrL
	JpfQPFGNVT+I4LqP75NsE0MwcAtX8Zy8OF0SgC1p93oBMBPI3WTda9CKZGltWzA8rrV4N0
	XNSOX6/TbPJpBjq6JdS7Ij7gNRJeSOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787910683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/SC0x8DTBKDmHj9hGfT16aGVihuMj8DZti8odJ28I0=;
	b=w9PAlSroXD2jDcmTupPg9dYSgQaZp6/DZxUJc75qR888prnAFV6GYFiMa948hFfmVU6BJO
	PocCsOlbktsEYhCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=vwZWjkmp;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=zOFEXp6m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787910679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/SC0x8DTBKDmHj9hGfT16aGVihuMj8DZti8odJ28I0=;
	b=vwZWjkmplxrhilhIAtAfoPgp5xWzKsR0UUIybX8/TyEHhKI1xF6VODDJ0h7POK9ZSYjWBa
	J9NCp1OzDaG/eiHHKWe1Z+rL72Y1Any7lCFggz8YFcLHs/VD6LGmneCxaH8WnPTQ/FkF+U
	2Xvh7H4sXb7TwMpfqY8mKTNuUCFyRPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787910679;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/SC0x8DTBKDmHj9hGfT16aGVihuMj8DZti8odJ28I0=;
	b=zOFEXp6mWDWDrIWZbIRTE/CPjeIUVg79k7cPqkk1pTjxkk8UcbEfYKFU6vvYGySRESSdKi
	fEktTsrl6nqvhsDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EF7F13515;
	Fri, 28 Aug 2026 09:51:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id StalAxdakWp7EAAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 28 Aug 2026 09:51:19 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 97BF9A1324; Fri, 28 Aug 2026 11:51:10 +0200 (CEST)
Date: Fri, 28 Aug 2026 11:51:10 +0200
From: Jan Kara <jack@suse.cz>
To: Tao Cui <cui.tao@linux.dev>
Cc: brauner@kernel.org, jack@suse.cz, kees@kernel.org, cyphar@cyphar.com, 
	containers@vger.kernel.org, linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH 2/2] userns: don't clear the install target map on
 map_write() failure
Message-ID: <37ur33kehusvq7scjflrr3df6d36xtaminoricp6ituocpapef@3we4ql6o2ozz>
References: <20260828091659.358700-1-cui.tao@linux.dev>
 <20260828091659.358700-3-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828091659.358700-3-cui.tao@linux.dev>
X-Spam-Score: -4.01
X-Rspamd-Queue-Id: 2DEA81FAB9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.cz:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Flag: NO

On Fri 28-08-26 17:16:59, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> At the out: label of map_write() the destination map is also cleared
> (map->forward = NULL; map->reverse = NULL; map->nr_extents = 0)
> whenever the write failed and the extent arrays had to be freed.
> 
> However, the destination map is written by the successful install
> block above, which has no failure exit; every error path reaches
> out: without having touched it.  A second write to a mapped
> namespace is also rejected with -EPERM before any parsing happens,
> so the clearing can never roll back a previously installed map
> either.
> 
> The three assignments just zero an already-zero map.  Remove them.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>

I agree this is a dead code but it kind of makes it easier to argue about
the correctness of the error handling branch. I guess I'll leave it to for
Christian to decide whether he wants to take this or not.

								Honza

> ---
>  kernel/user_namespace.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> index e9e04ce167df..cef5e71779f6 100644
> --- a/kernel/user_namespace.c
> +++ b/kernel/user_namespace.c
> @@ -1104,9 +1104,6 @@ static ssize_t map_write(struct file *file, const char __user *buf,
>  	if (ret < 0 && new_map.nr_extents > UID_GID_MAP_MAX_BASE_EXTENTS) {
>  		kfree(new_map.forward);
>  		kfree(new_map.reverse);
> -		map->forward = NULL;
> -		map->reverse = NULL;
> -		map->nr_extents = 0;
>  	}
>  
>  	mutex_unlock(&userns_state_mutex);
> -- 
> 2.43.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
