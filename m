Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A420470445
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784808; cv=none; b=Tp88D4qo5fPvDQS38oi4FZRTr+sbKui0LCH8XE/tNL6R0Qq4UpbYdXgtKjHLf+wvclshkI3qomRcQw3PK4HRXzFG3tBTLx5y7YYSalF1Qk4TOvfNBsyx5+fk6planxW79OvroBRAD2GtQDkqlECBaFvSfgwt1P4PrWeYhoqDZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784808; c=relaxed/simple;
	bh=6Dcl3/qbz0suLvU8G8wAafLZdOFfXyzm0RVgRiZXCi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8qTsDMim/riy87O1uAJjjChxfVtMdyLK98o93t73gxZz5L8A0BuFkbBotHCoA2bqxbaLlTSpbfsQ500oAyJ+8A+gAd11vgc8C4VYYVybeJwRGSOacnayyi9aFwSVMWh4lZyUXr/jbmy8Nz//bBxtRiRy1QdhKTVShY7UN5moTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tvVmb+Po; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VoRH8w3x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UBDLdDXn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vX0CPsyR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tvVmb+Po";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VoRH8w3x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UBDLdDXn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vX0CPsyR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 21C901F747;
	Mon,  7 Sep 2026 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788784800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pk4FrYT7aiylp0H0naPLYagevGfRK76pHeKCW/5mVIQ=;
	b=tvVmb+Pok2ZhZ4+p0aGso8BiJvkq8RyqMLDDtYppcpA6YsUEkmV8jmcWd8Op9MMyHKMhZF
	vQheBW3XOHbs+s79IbEZPcDxnhd7yveWPO5zr1s8MVEg2vlK+3MEMIMF0Am9JZbmk4miRd
	2eLodhcWkh2j6Hokv98tyKW3ELgrB38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788784800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pk4FrYT7aiylp0H0naPLYagevGfRK76pHeKCW/5mVIQ=;
	b=VoRH8w3xgCULktwu9+LloVbLO/K2QUCTYYnqFp46So2N7hPodItUGH2vGbyRy13a3gMLyb
	6GkbSUHiN/8CS2AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788784796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pk4FrYT7aiylp0H0naPLYagevGfRK76pHeKCW/5mVIQ=;
	b=UBDLdDXntRx+yaMxoHPtQCr7ZV+phbQ/P7z/8A4lJfCyPQntpu2gC8OpCND5BCetuE7fbE
	nhBv89knvHbEWq5SxIU3VaLFpo0Vyn2KZbq6WeE5WOArWXAOdGl2j8WbBz2aC8+meQ7fps
	7zPFHxcoWKwDkR64wJmRLEnBfvkPNvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788784796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pk4FrYT7aiylp0H0naPLYagevGfRK76pHeKCW/5mVIQ=;
	b=vX0CPsyRcLAfrUzNUGKte9vRDXHgaRCHmkiQrggfGSaviyRxMezYxRrb5+Z6QVQyV4MGLy
	lbt1TsnpeSFg0zAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F2E01339B;
	Mon,  7 Sep 2026 12:39:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VtrLD5uwnmpZOgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 07 Sep 2026 12:39:55 +0000
Date: Mon, 7 Sep 2026 13:39:53 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mike Kaplinskiy <mike@recall.ai>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Message-ID: <ap6wMOvQ1IID_koO@pedro-suse.tail5790ac.ts.net>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
 <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>
 <aprjOxDy3JCPb2oa@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aprjOxDy3JCPb2oa@gremlin>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,recall.ai:email,pedro-suse.tail5790ac.ts.net:mid,suse.de:email]
X-Spam-Flag: NO

On Fri, Sep 04, 2026 at 05:01:37PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Fri, Sep 04, 2026 at 04:24:59PM +0100, Pedro Falcato wrote:
> > On Fri, Sep 04, 2026 at 04:12:53PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
> > > entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
> > > for the former and a tree walk and swap in to swap cache for the latter.
> > >
> > > MAP_PRIVATE-file backed mappings straddle the two and currently get treated
> > > as if they were purely file-backed, meaning any swapped out private pages
> > > remain swapped out.
> > >
> > > Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
> > > mappings and performing both walks in this case.
> > >
> > > Since the logic checks for vma->anon_vma this means un-CoW'd
> > > MAP_PRIVATE-file backed mappings retain only the single file walk.
> > >
> > > Reported-by: Mike Kaplinskiy <mike@recall.ai>
> > > Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> > > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > ---
> > >  mm/madvise.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 73c2901b9adb..d0510dd49dde 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -297,10 +297,12 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
> > >  	loff_t offset;
> > >
> > >  #ifdef CONFIG_SWAP
> > > -	if (!file) {
> > > +	if (!file || (vma_is_cow_mapping(vma) && vma->anon_vma)) {
> >
> > Couldn't this all be simplified to
> >
> > 	if (vma->anon_vma) {
> >
> > ? swapin needs anon pages to have been faulted-in. Non-cow mappings won't
> > have an anon_vma, nor will fully empty anonymous VMAs (and that's fine).
> > Right?
> 
> Hmm good point :)
> 
> Though the
> 
> 	if (!file)
> 		return 0;
> 
> Would have to be outside of the block to avoid an anon unfaulted (nop) from
> being skipped.
> 
> And it's a real improvement to have unfaulted anon skip...
> 
> But I find that version is documenting what's going on a lot less.
> 
> Since both anon and MAP_PRIVATE file-backed are CoW mappings we could just
> reference that.
> 
> Andrew - could you swap the patch out in-place with below? Thanks!
> 
> Cheers, Lorenzo
> 
> ----8<----
> From a706374a1186b6b4409a0e760e8728bcadba0c96 Mon Sep 17 00:00:00 2001
> From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
> Date: Thu, 3 Sep 2026 20:08:39 +0100
> Subject: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
>  MADV_WILLNEED
> 
> Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
> entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
> for the former and a tree walk and swap in to swap cache for the latter.
> 
> MAP_PRIVATE-file backed mappings straddle the two and currently get treated
> as if they were purely file-backed, meaning any swapped out private pages
> remain swapped out.
> 
> Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
> mappings and performing both walks in this case.
> 
> Since the logic checks for vma->anon_vma this means un-CoW'd
> MAP_PRIVATE-file backed mappings retain only the single file walk.
> 
> Reported-by: Mike Kaplinskiy <mike@recall.ai>
> Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM, thanks!

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
