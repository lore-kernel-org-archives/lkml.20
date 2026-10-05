Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452094825BE;
	Mon,  5 Oct 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206831; cv=none; b=r2CIaJjXUXvWM7Fp3Pxp+PeWcZ7jJJWbbNi0+0Hbi15r053crIfsaTTFNpZy8LgLBG748lQgXMfm8Kgx0HxwJgJPaoTKUM9157r1jR1M4aYIjh0VE74Wq8KZiWmjR5AM2D+xX+94wcJiVkhQCxgMDDJNqJl62lbEtJfr+j3GXj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206831; c=relaxed/simple;
	bh=OBuKhnAld9DbBDrN9DMDLsM/V8Bk+3+MGjoVHuzdbyY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BjR51bV3QPvQ2SHKMYJjesImAumRtIQLbNHlWNUjXdIMdVV0oRSla5KHjBZ42pTfm31mWmYRE/jZalmkPXUzWmE2ZmGtOXRrUzT/Q+cCb+cIiSCxH6Dbfc5oh+svEsbrpRqTbX3YI95LZtFFLnjuC4FXB+MHh3gM3fp//5VDS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OGckAGu7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Byu8TZIP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZbI+APpX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PNh3YpmB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OGckAGu7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Byu8TZIP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZbI+APpX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PNh3YpmB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9673E1F7A5;
	Mon,  5 Oct 2026 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791206790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CL7At3AqohyJipgTvTsjYpAaZfcPG0euVlHVnAIERE0=;
	b=OGckAGu7Ng6ACGs3dzv2kDPo3E6jCSEBykPtOQt4vWP2c3TfwvH0SGREOe6/HB20YOTpLT
	wioJKQ59IsnwxRE1FsIzveVzfrXS0JWTwHx/IWhsHDL9FK/SEy4VfBocVSfyQCdEHg6I2m
	HLYlh/YyjxOnXwYQFzQ9cqEOvlw3cT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791206790;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CL7At3AqohyJipgTvTsjYpAaZfcPG0euVlHVnAIERE0=;
	b=Byu8TZIP5uzG5uM+zXxwKskUxPmyyZXbAb+ufjH+iOwA4e8slSicB/EvxYCCQAUixYN8rG
	nMeJikJn75c2/zBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZbI+APpX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PNh3YpmB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791206786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CL7At3AqohyJipgTvTsjYpAaZfcPG0euVlHVnAIERE0=;
	b=ZbI+APpXt6+lYfOrLayVU5asXqTuf5gjPL6Dv24bb9kS+ziDa4J3uzaZG3q41E/sQBjiHg
	m/eR3RWs1iMG0j7jL5YPEMXmZA9Oq0WduxR9rxkqGYYUfG1HvSQFA/Zg0NBw6xw6kuY1kS
	3id0KeYPgsZeOI1YU2jE4adYVghGCYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791206786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CL7At3AqohyJipgTvTsjYpAaZfcPG0euVlHVnAIERE0=;
	b=PNh3YpmB9jsOlsuoUQgR1vwdq0uzgucH6zeNoLEcCjOtFlfAI4cRB4u78L5YiyLNJn/qZS
	M9A+5nkNeNa7IHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AB9C132D3;
	Mon,  5 Oct 2026 13:26:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0tPODYKlw2oPbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Oct 2026 13:26:26 +0000
Date: Mon, 05 Oct 2026 15:26:18 +0200
Message-ID: <87bj98s2h1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Baoquan He <hebaoquan@kylinos.cn>,
	David
 Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List
 <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil
 Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the sound tree with the mm tree
In-Reply-To: <20261005061403.750dc014ce53e441a3ee6271@linux-foundation.org>
References: <asOIPgOu7MHRPLWU@sirena.co.uk>
	<20261005061403.750dc014ce53e441a3ee6271@linux-foundation.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.981];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9673E1F7A5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 05 Oct 2026 15:14:03 +0200,
Andrew Morton wrote:
> 
> On Mon, 5 Oct 2026 13:21:34 +0200 Mark Brown <broonie@kernel.org> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the sound tree got a conflict in:
> > 
> >   sound/mips/snd-n64.c
> > 
> > between commit:
> > 
> >   0d62c52af5499 ("ALSA: n64: don't use GFP_DMA when calling dma_alloc_coherent()")
> > 
> > from the mm tree and commit:
> > 
> >   e81f85fd3ca66 ("ALSA: mips: n64: Handle card removal properly")
> > 
> > from the sound tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks.
> 
> Easy fix: move mm's little one-liner into the alsa tree.
> 
> Takashi, please can you add this?

Sure, I applied now to sound.git tree for-next branch.

> I'll drop the mm.git copy now.


thanks,

Takashi
