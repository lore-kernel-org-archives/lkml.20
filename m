Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5363CE489
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552977; cv=none; b=gFx9KUTn67rBZF7YTba7ifJ4xiGiSYhehIo6UskgZAxhI48U9bFRUQ5QM2xROQXuKV7kvaA8t19jYO41nD3D/Bw37ph6Hqamano+4QrFtw9RMifXY84Sonxe1suRv16w6/ABO8aDmCefVAb0BaVJd5l6NIa5XF/uy2aA098cCE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552977; c=relaxed/simple;
	bh=wQsA10BEqiV/7ACOyetkUXXIH9J9C+vOrbs7ldgFeKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASmBB3eFffFRmz9t7eIUuZzQenrMyyf/uola8BN/b/vgzgv8nyprLQyWlNx/MoUevFNPeo6W2Noj1/UnsQ45g/pcvNqZsAcg5kGXuFs8Rm/f7hQpVferCXjRyv0mkneNhRKlx0AG1Km84wSsH3EoVnBiRoXI9jabwnUIebV0HVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B73B1F7D1;
	Fri,  9 Oct 2026 13:36:14 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C97D1326D;
	Fri,  9 Oct 2026 13:36:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P8nmNMztyGoIaQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 09 Oct 2026 13:36:12 +0000
Date: Fri, 9 Oct 2026 14:36:11 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz, 
	ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: memory: fix truncation removing mapped folios
Message-ID: <asjr2zCp1BVtfpTV@pedro-suse.tail5790ac.ts.net>
References: <0d2a1809fa1cfc22ad3df26ec28b2d30e5cdf3bd.1791540483.git.baolin.wang@linux.alibaba.com>
 <asjXJZap53yJWMYi@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asjXJZap53yJWMYi@gremlin>
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spam-Flag: NO
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 1B73B1F7D1
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [0.00 / 50.00]
X-Spam-Score: 0.00

On Fri, Oct 09, 2026 at 01:00:52PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Fri, Oct 09, 2026 at 06:12:03PM +0800, Baolin Wang wrote:
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 1f5d5f7d39cd..0272217ad7b0 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> 
> > @@ -2044,16 +2053,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
> >  	 * to ensure they are still none, thereby preventing the pte entries
> >  	 * from being repopulated by another thread.
> >  	 */
> > -	if (can_reclaim_pt && direct_reclaim && addr == end)
> > +	if (can_reclaim_pt && direct_reclaim && addr == end) {
> > +		/* rmap changes need to be observed before e.g PTEs get zapped. */
> > +		smp_wmb();
> 
> What does this pair with? You should always say what in the comment.

Yep, this is missing a rmb to pair with. The diff I posted at
https://lore.kernel.org/linux-mm/asigKktcrSY80A_2@pedro-suse.tail5790ac.ts.net/
had one in zap_pmd_range(), which admittedly isn't the greatest. I'm not sure if
there's a better way to do this.

> 
> rmb/wmb are generally not needed vs. acquire/release. Are you sure a wmb is
> right here?

I don't think that works, because __folio_remove_rmap has a ton of stuff going
on, some implying full ordering, others not. Plus you'd need to switch the pmd
dereference to something like an smp_load_acquire().

-- 
Pedro
