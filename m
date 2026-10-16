Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F12DEA8F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156731; cv=none; b=NL8Y86J6C8DZwaouSdpcI+rJUUChf6kg21DqwS002Or9E+OaGot8Q91j9EFjP7cBjaF9bTG2WlmouHGqVO8Ui5OxRY5D6CODiAL2JIgYWS1oLf1wXDU+/yaiJmEbMTno3fSRudPN/ntl1cl1cLPSbgIYk3qc9MQ2J1GygAiGXH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156731; c=relaxed/simple;
	bh=1MfDaovX0Rxo7uc1tcX7jscOcFmXuxrnuU575oK7onA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd3CuMfuI8M3cNUpCZ+xOYTryfTUXPz9AGJFGXLvloi1TAqZgodIDW7DEYR8TrU2wyykvvCNRPBEej+oaBZkBfpPGFHGgNTA784fuqEYS41+0qfNWNCBwtwho587DjczupxbykcZKPJdMqUeQ+sjKRxIc8VP4mC0FpL/QisOjqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UnmfVm1t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ev1VyZ7c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w5tKgH8+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4eNxa2jk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UnmfVm1t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ev1VyZ7c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w5tKgH8+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4eNxa2jk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92BE921C64;
	Fri, 16 Oct 2026 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792156727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvOXCsd43Usn/ts9ZeDzJEb232W8k5UHTWzvCgsNFXk=;
	b=UnmfVm1tqwplPFdONtyFvTQ1AS5VP5cTD3qAq7xlctd+CFRVtHCsgbhkCMx9uSzccqMWsN
	3q4cKvYz4btr6MgHhN7ES/xZ1Q7FEzw60UOuYHFuWX1O2iBY1g7ZVXTwc0kgnR2/sx3dBB
	XBctDAKpjnkQLXYobhahIMgRTICUFYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792156727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvOXCsd43Usn/ts9ZeDzJEb232W8k5UHTWzvCgsNFXk=;
	b=ev1VyZ7cv3eveqXi+jJAUUTkN9NMMWx5zYAdiOWV4c6zddfHkO0DgBV9/Tt8SL/eGsPU6Q
	IE+x/Fg39ceYm+Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792156726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvOXCsd43Usn/ts9ZeDzJEb232W8k5UHTWzvCgsNFXk=;
	b=w5tKgH8+hN6tM6f+SHj3du8Q1iln5C1HSTlEC76yTb/PPnf6Ntbd67FFRlPvNuzWQGJifd
	vvonu/hW2hUYbfTfWV819LHbEAsv9Bs9RXv3k1NNmpBCE8IbWqFvVXbQAl3czQrJdrGNd/
	N+H87JUNigQsOnP/0AhRsOa1tQxLYTc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792156726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvOXCsd43Usn/ts9ZeDzJEb232W8k5UHTWzvCgsNFXk=;
	b=4eNxa2jkwB9wPUj6ps1INqFC8cCFqBjjGltQCxyfJ6ZCOSlq2/OSdWhNviZc8iz/lFt9na
	RQ4TsTKuYa1RHNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 189E11339F;
	Fri, 16 Oct 2026 13:18:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mn7RNTQk0mqLAQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 16 Oct 2026 13:18:45 +0000
Date: Fri, 16 Oct 2026 14:18:43 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	david@kernel.org, ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, 
	kas@kernel.org, jack@suse.cz, djwong@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, hch@lst.de, 
	syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com, ngocthang2710.1999@gmail.com, willy@infradead.org, 
	rppt@kernel.org, ljs@kernel.org
Subject: Re: [PATCH v3 1/1] khugepaged: fix readahead lock inversion in
 collapse_file()
Message-ID: <atIiR1NWNssDvgt6@pedro-suse.tail5790ac.ts.net>
References: <20261016065920.4153-1-lance.yang@linux.dev>
 <27e5aadc-2d68-428f-a958-308e4a75c058@linux.alibaba.com>
 <atICp2NL8j2z7UFM@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atICp2NL8j2z7UFM@pedro-suse.tail5790ac.ts.net>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[16bf7cd0ebeb1de93aa5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,linux-foundation.org,kernel.org,nvidia.com,infradead.org,arm.com,suse.cz,kvack.org,vger.kernel.org,lst.de,syzkaller.appspotmail.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,imap1.dmz-prg2.suse.org:helo,linux.dev:email,syzkaller.appspot.com:url]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, Oct 16, 2026 at 12:00:24PM +0100, Pedro Falcato wrote:
> On Fri, Oct 16, 2026 at 05:57:48PM +0800, Baolin Wang wrote:
> > 
> > 
> > On 10/16/26 2:59 PM, Lance Yang wrote:
> > > collapse_file() can end up calling page_cache_sync_readahead() with
> > > source folios from earlier in the range still locked. If truncate already
> > > holds mapping->invalidate_lock exclusively and is waiting for one of
> > > those folios, readahead blocks on the same invalidate_lock and neither
> > > side can make progress.
> > > 
> > > Do readahead in a separate pass before we start holding source folios
> > > locked for collapse. Keep page_cache_sync_readahead() and its existing
> > > policy, and drop each folio's lock and reference after checking that it
> > > is uptodate. If truncate or reclaim removes a folio between the two
> > > passes, roll back instead of doing readahead again with source folios
> > > locked.
> > > 
> > > Shmem handles swapin and fallocated folios through shmem_get_folio()
> > > without taking mapping->invalidate_lock, so it isn't affected by this
> > > lock inversion.
> > > 
> > > Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
> > > Fixes: 730633f0b7f9 ("mm: Protect operations adding pages to page cache with invalidate_lock")
> > > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > > ---
> > 
> > Thanks for the fix.
> > 
> > > Thanks to Nguyen Ngoc Thang for v2. David asked for volunteers, so I'm
> > > happy to take this over.
> > > 
> > > Some older stable trees lack the folio infrastructure used here, and the
> > > code will differ for each stable tree, so each backport will need quite a
> > > bit of rework and its own review. I'm not sure whether to Cc stable here.
> > > Once we agree on the fix, I'll send a separate backport for each maintained
> > > stable tree except 5.10, which isn't affected.
> > > 
> > > v2 -> v3:
> > >   - Replace the scan-wide invalidate_lock and page_cache_ra_unbounded() with
> > >     a preparation pass using page_cache_sync_readahead().
> > >   - Roll back on a new page cache miss during collapse.
> > >   - https://lore.kernel.org/all/20260913163644.122133-1-ngocthang2710.1999@gmail.com/
> > > 
> > >   mm/khugepaged.c | 42 +++++++++++++++++++++++++++++++-----------
> > >   1 file changed, 31 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > index ef5cd6fda34f..b3f67617caf0 100644
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -2262,6 +2262,34 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
> > >   	new_folio->index = start;
> > >   	new_folio->mapping = mapping;
> > > +	if (!is_shmem) {
> > > +		/*
> > > +		 * Populate the range before accumulating locked source folios:
> > > +		 * readahead may block on invalidate_lock.
> > > +		 */
> > > +		for (index = start; index < end;) {
> > 
> > why drop xas_unlock_irq()?
> > 
> > > +			folio = filemap_lock_folio(mapping, index);
> > > +			if (IS_ERR(folio)) {
> > > +				page_cache_sync_readahead(mapping, &file->f_ra,
> > > +							  file, index, end - index);
> > > +				folio = filemap_lock_folio(mapping, index);
> > > +				if (IS_ERR(folio)) {
> > > +					result = SCAN_FAIL;
> > > +					goto rollback;
> > > +				}
> > > +			}
> > > +			if (!folio_test_uptodate(folio))
> > > +				result = SCAN_FAIL;
> > 
> > Do we need to check PG_uptodate after locking the folio? If we successfully
> > lock the folio, doesn't that mean the read I/O has completed? The following
> 
> Yes, you do; a read can "complete" without the IO having completed successfully,
> and in those cases PG_uptodate is not set, but the folio is unlocked.
> 
> Either way, why are we checking for uptodate here? We only care for starting readahead.
> Anyway, I would possibly recommend we do this as post-processing, not pre-processing.
> The current loop is a little overhead-happy.

To clarify: I would do this kind of RA as an error path if isolation failed.
Namely, at the end of rollback, after unlocking folios. It doesn't make sense
to me to do this kind of checking upfront. I don't think it's particularly
realistic that, starting RA upfront, you'd see uptodate completed folio reads
when doing the actual isolation.

-- 
Pedro
