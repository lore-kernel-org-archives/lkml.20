Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DC38BF9C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565280; cv=none; b=EEuKpGlMVfZ/GXt5G5h1Wabq5PUG68wY33oIePKF47nVZlFJVh9dSnQEdycvL0fUAIuyIbhp3m0n6QFH0IC+VzFjo9Dr4wFJKDw/GLe4W0tlkRaRWyLDzOFdDTUwllD07DfCqH+sYAdRqQ0U7FNTRwyuvCXWJf1WudzvLYmpvzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565280; c=relaxed/simple;
	bh=2WAdkMYgRGUTXnMdMJOTh+zsmGlRYP//b7xhAlgvo+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4WYmyRQqunxxuUiLp/XFRRp8sFh5iFUVDbWSIXSajkG2mDCciqIOYZfzC0ujwyhgWHXEefcaRRMMixlqcfSx+CXSncB5zN7Il0tbnBoUGw3SOB9hc9kHFLP3vHztvym8ooz1E3CH1utHXw6XLqWHbrUXY9+KlSRh7Mu+kWpvA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OKCsDWz3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ihvZr9z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d91JU66W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KcOgOphY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OKCsDWz3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ihvZr9z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d91JU66W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KcOgOphY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8AA341F38F;
	Fri,  9 Oct 2026 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791565275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vW0Z2YAuAu+y8eIrdsV6xo/3lhL0j96EwTJkuyKSiGc=;
	b=OKCsDWz3wZV/8UaBe+UwL8bAGZn28d4+ndjd2+913xamP3KKFqiOuRWdmQOSPqjhHfKe1I
	8XxN95oMrOeYsTgm0GwbCfgFaHvuD22uAsam9qRnIwsdvs27dSVq7eEZRxEuJqvPAqZB3T
	LJAWbkl+4VWbApHIGCmK0vfoBAbZf9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791565275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vW0Z2YAuAu+y8eIrdsV6xo/3lhL0j96EwTJkuyKSiGc=;
	b=7ihvZr9zEtieha8PAh591N/iiz0shJn69GqfbBgcXSetCQHxVkUGU++BFLHFBhEsheaJ7/
	ShMpCIES+yjXZcBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791565274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vW0Z2YAuAu+y8eIrdsV6xo/3lhL0j96EwTJkuyKSiGc=;
	b=d91JU66WRMzXd7zRM6eggu3mIm+JqAdqCRcNy0PkpaQYmeQLLxs4IEEjC2/apuUrMzv54n
	85kZJh8uFRuPwnRPCl3o9SpCW4zLZG5oOeznc4uogR9B0shOyP0rnFgWPzUDoS42oQ00j5
	spzO3QAnbRdxiwddAGDD+Bz5u4Ehbkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791565274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vW0Z2YAuAu+y8eIrdsV6xo/3lhL0j96EwTJkuyKSiGc=;
	b=KcOgOphYjoBpLH5XvcGPKwluCvsx/EtxvBd50Y30X38vBcdx9NA46So2xq9bLLEhZ/kRZY
	PDiBDxf9xLeCgnCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 761371326D;
	Fri,  9 Oct 2026 17:01:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +KsMEdkdyWouRAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 09 Oct 2026 17:01:13 +0000
Date: Fri, 9 Oct 2026 18:01:11 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, akpm@linux-foundation.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz, 
	ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: memory: fix truncation removing mapped folios
Message-ID: <askdZgd5P986OSMx@pedro-suse.tail5790ac.ts.net>
References: <0d2a1809fa1cfc22ad3df26ec28b2d30e5cdf3bd.1791540483.git.baolin.wang@linux.alibaba.com>
 <asjXJZap53yJWMYi@gremlin>
 <asjr2zCp1BVtfpTV@pedro-suse.tail5790ac.ts.net>
 <62e0ce97-1016-4f82-af38-7703c8cffefa@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e0ce97-1016-4f82-af38-7703c8cffefa@linux.alibaba.com>
X-Spam-Flag: NO
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.968];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Fri, Oct 09, 2026 at 09:53:55PM +0800, Baolin Wang wrote:
> 
> 
> On 10/9/26 9:36 PM, Pedro Falcato wrote:
> > On Fri, Oct 09, 2026 at 01:00:52PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Fri, Oct 09, 2026 at 06:12:03PM +0800, Baolin Wang wrote:
> > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > index 1f5d5f7d39cd..0272217ad7b0 100644
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > 
> > > > @@ -2044,16 +2053,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
> > > >   	 * to ensure they are still none, thereby preventing the pte entries
> > > >   	 * from being repopulated by another thread.
> > > >   	 */
> > > > -	if (can_reclaim_pt && direct_reclaim && addr == end)
> > > > +	if (can_reclaim_pt && direct_reclaim && addr == end) {
> > > > +		/* rmap changes need to be observed before e.g PTEs get zapped. */
> > > > +		smp_wmb();
> > > 
> > > What does this pair with? You should always say what in the comment.
> > 
> > Yep, this is missing a rmb to pair with. The diff I posted at
> > https://lore.kernel.org/linux-mm/asigKktcrSY80A_2@pedro-suse.tail5790ac.ts.net/
> > had one in zap_pmd_range(), which admittedly isn't the greatest. I'm not sure if
> > there's a better way to do this.
> 
> I don't think we need an rmb to pair with. This is because the
> folio_mapped() check in __filemap_remove_folio() cannot be reordered
> (guarded by spinlock) with the pmd_none() check in zap_pmd_range().

Why? spin_lock has ACQUIRE semantics, which are one-way permeable. Earlier
loads and stores do not necessarily happen-before anything after the ACQUIRE.
Unless you mean something else.

> 
> We just need to guarantee that when we find a pmd_none(), the removal of the
> folio's mapping (via tlb_flush_rmaps()) is already observed.
> 
> 
> > > rmb/wmb are generally not needed vs. acquire/release. Are you sure a wmb is
> > > right here?
> > 
> > I don't think that works, because __folio_remove_rmap has a ton of stuff going
> > on, some implying full ordering, others not. Plus you'd need to switch the pmd
> > dereference to something like an smp_load_acquire().
> 
> Agree.

-- 
Pedro
