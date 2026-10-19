Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904DE500A8A;
	Mon, 19 Oct 2026 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419729; cv=none; b=KHuxoCj+3XFl+1RZCOKCikaHKU9T9RSiqdI4oqcTtYhPdld5Cdiq+j8l2EDt35NFuj7WsyImFPCvBTAlh35KFQLyoLluciGsiEXhr7afDAxYCA2Fe+JKWUPAMS+H+CWcy2GrC9Q2MS+0RLyEbhfm7V2Xv0vWvmB9tUMX3Yra+Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419729; c=relaxed/simple;
	bh=ZdfX0Nanzy4EcV0T0a7O+qQxy6lo+1BO1eB1RtJ0N7Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eC0sALXzDi2ApCJOIKSy9hRInLUJO6KX9ffhfPtxPPvoXoxaPYVJdt5Ku1ebvpgzx18Y+IeQSRuwzPOZFd6MCYkibItgMXjrtD/NkR/hPiiVMYi0IKHedaZ65tqRjdGqz5yT5RQCn/LhqbkCHG/0cAGEHQZK3zWruedSKFuwovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wqd3EWyo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9dNDu6qv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wqd3EWyo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9dNDu6qv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wqd3EWyo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dNDu6qv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wqd3EWyo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dNDu6qv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A441421C64;
	Mon, 19 Oct 2026 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792419726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vF0Olg4YvIthv/sPhgSo3kpD1iVaKfFVtNL8I+lNbro=;
	b=wqd3EWyof9G4nhkOB5yJqJ5F9Q0V4ycIe/dM6w6NdZEQdXtPKT//3H/TboMMbraVADwaE2
	RMJJgsZovVo+WhSva1yquK9raVEiudjbYcQn1LoAtDWOrx8heUUMn+C+SvD9nhG7+o4UD5
	J9ijOsAjKjLV/ozaFNIfdxmnX02hSuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792419726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vF0Olg4YvIthv/sPhgSo3kpD1iVaKfFVtNL8I+lNbro=;
	b=9dNDu6qvXtomakfryfQBBUUDfsPPSOJ4646hSw6Pgt81qL9JyKQwegJN/NU7Q6wQswAbZa
	1Eb8NUbwE0kK4vCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792419726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vF0Olg4YvIthv/sPhgSo3kpD1iVaKfFVtNL8I+lNbro=;
	b=wqd3EWyof9G4nhkOB5yJqJ5F9Q0V4ycIe/dM6w6NdZEQdXtPKT//3H/TboMMbraVADwaE2
	RMJJgsZovVo+WhSva1yquK9raVEiudjbYcQn1LoAtDWOrx8heUUMn+C+SvD9nhG7+o4UD5
	J9ijOsAjKjLV/ozaFNIfdxmnX02hSuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792419726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vF0Olg4YvIthv/sPhgSo3kpD1iVaKfFVtNL8I+lNbro=;
	b=9dNDu6qvXtomakfryfQBBUUDfsPPSOJ4646hSw6Pgt81qL9JyKQwegJN/NU7Q6wQswAbZa
	1Eb8NUbwE0kK4vCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46684136CC;
	Mon, 19 Oct 2026 14:22:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3J+nB44n1mqyYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 14:22:06 +0000
Date: Mon, 19 Oct 2026 16:22:05 +0200
Message-ID: <875wyxahyq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcmtest: Pin the module while pattern files are open
In-Reply-To: <pm-pmb-1ce354e709dbab28e563-v2-6b2ea0aa16ec39442f6d@gmail.com>
References: <pm-pmb-1ce354e709dbab28e563-v2-6b2ea0aa16ec39442f6d@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Mon, 19 Oct 2026 11:04:42 +0200,
Cen Zhang wrote:
> 
> The fill_pattern_fops table must remain alive until the final release
> of each pattern debugfs file. It has no .owner, so the fops_get() call
> in full_proxy_open_regular() does not take a PCMTest module reference.
> 
> With snd-pcmtest loaded as a module, a user with permission to open a
> fill_patternN file and unload the module can retain the descriptor
> across normal unload, provided no PCM file or other module reference
> prevents it. The following ordering is possible:
> 
>   Pattern file user                   Module unload
>   -----------------                   -------------
>   open(fill_patternN)
>     full_proxy_open_regular()
>       fops_get(fill_pattern_fops)
>         owner == NULL: no module pin
>   keep the descriptor open
>                                       mod_exit()
>                                         clear_debug_files()
>                                           debugfs_remove_recursive()
>                                           drain active operations
>                                       return from mod_exit()
>                                       free_module()
>                                         free the module image
>   close(fd)
>     full_proxy_release()
>       read real_fops->release -> UAF
>       fops_put(real_fops)
>         read real_fops->owner
>       access freed module memory
> 
> Even though the table has no release callback, reading those fields
> is a use-after-free and can fault. The retained dentry keeps the
> proxy's bookkeeping alive, but does not retain the module storage.
> 
> Set .owner to THIS_MODULE so the existing fops_get()/fops_put() pair
> pins PCMTest until final release has finished accessing the table.
> Normal module unload is then blocked while any pattern file is open.
> 
> Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

Applied now.  Thanks.


Takashi
