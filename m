Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334057;
	b=he3chSkyozh37UTQwEGmGSag/U9XnRHkPa2KhrDwJzHFMRtLlR/F8XZhLVBoVSIb12Q3
	 Oi8RWp9TOFGDk+OjjkUYPaaK2qQ2dqT1SsFRQninyJafz26RwajYTsUGHF7/Djf3bTL8m
	 p0lkTRVFfhik5WzUCwJQMPVb1xjXo43bSok+F9ScwrkG9S61pl4O5w8ckECm4IW3qpNxO
	 QvssfcXi0GMKCTX3LHvCvM8p59ip7yrMTv62Gyyg+u3S0Fih8DinGUF4TXOUHlEtjMXCk
	 1/lY3BrQAQeckF1/KRPIdNqykmsxQ0/s02bCvY0p3ycCE56qx85RMovsQDuS34g/Lqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334057;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=CWZ8FKCXM0Bh7P8GZIU9k1z+S20lALWHtRLyiTxNjM4=;
	b=BpYKPMw8/kENAPvZXQJDdyrtHyg0kOLcXBeT0e6ooyY+SgI02livHiTKuD7gwbhL8Hhx
	 JSvuKZAKrHRoDgrkNzz1GhuZwiYhjA4BRaNk4/J+qVJ6DIIKxt52Wlxz6Q65LmFVG8h0W
	 +OCKIO5hiQ8d/rNScVnJR5wDdkWIfieEvRYqvh6aSYuvzdGs02ZhbkAGwTQbpSjaVOsa1
	 K3o2JeMpaUJS2g0fbnE5r4wCvcn1cIr2WIlUpV6LCK2LRwDQrGyMrojSGwvsmxG+zaQR7
	 ABGVVsekufrJOz7ZpP5zP8fIHRwS8ZQyswnMppIHJz1vTUXKYJR6hOcoU2klxbXP2uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=2HGoZ5cA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B5u+hQa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=2HGoZ5cA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B5u+hQa;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA4606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDA4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=2HGoZ5cA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B5u+hQa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=2HGoZ5cA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=2B5u+hQa
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 700491F7EE;
	Tue, 10 Nov 2026 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794334054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWZ8FKCXM0Bh7P8GZIU9k1z+S20lALWHtRLyiTxNjM4=;
	b=2HGoZ5cAOrAe3mmS4+YABocIuz5Ag6pcTC2/1Th4hUMh33IHKvRa3J94SuCWU9bYSY1LCh
	szr2TDrCQA2fIWrjvWPUdBQQW796rBnwkAmGrNTVcUDZsWyWcg/2XXHZskdiVLVJqCRmvZ
	aZf/A8v5emBl6+WtPwPC//zq4xqkaN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794334054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWZ8FKCXM0Bh7P8GZIU9k1z+S20lALWHtRLyiTxNjM4=;
	b=2B5u+hQaAWTJjUZ76c4CgyQ1LGXcYy1LrN4Yg7xxgH8i7/iJaYqGENt97WeCrCaQHjvnd1
	KpMNFutH+Rr2VaBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794334054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWZ8FKCXM0Bh7P8GZIU9k1z+S20lALWHtRLyiTxNjM4=;
	b=2HGoZ5cAOrAe3mmS4+YABocIuz5Ag6pcTC2/1Th4hUMh33IHKvRa3J94SuCWU9bYSY1LCh
	szr2TDrCQA2fIWrjvWPUdBQQW796rBnwkAmGrNTVcUDZsWyWcg/2XXHZskdiVLVJqCRmvZ
	aZf/A8v5emBl6+WtPwPC//zq4xqkaN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794334054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWZ8FKCXM0Bh7P8GZIU9k1z+S20lALWHtRLyiTxNjM4=;
	b=2B5u+hQaAWTJjUZ76c4CgyQ1LGXcYy1LrN4Yg7xxgH8i7/iJaYqGENt97WeCrCaQHjvnd1
	KpMNFutH+Rr2VaBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47E0B13479;
	Tue, 10 Nov 2026 18:07:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0sQ9BWVd82pNBgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 10 Nov 2026 18:07:33 +0000
Date: Tue, 10 Nov 2026 18:07:31 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Seunghyun An <san55@wisc.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
Message-ID: <avNZtUqWhKK-7noX@pedro-suse.tail5790ac.ts.net>
References: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
 <MN2PR06MB6639D846B30A3357B01BC61DD2722@MN2PR06MB6639.namprd06.prod.outlook.com>
 <avNVoCWBhVQea7Vq@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avNVoCWBhVQea7Vq@gremlin>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wisc.edu:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30

On Tue, Nov 10, 2026 at 05:37:27PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Tue, Nov 10, 2026 at 05:32:17PM +0000, Seunghyun An wrote:
> > On Tue, Nov 10, 2026 at 03:10:40PM +0000, Lorenzo Stoakes (ARM) wrote:
> > > I introduced commit 17fd82c3abe0 ("mm/vma: add and use
> > > vma_assert_stabilised()") with the intent of picking up programmatic bugs
> >
> > Tested on an AMD EPYC 9634 (84 cores, 12 CCDs), CONFIG_DEBUG_VM=n.
> > Applied on d48723711bae; base and patched were measured on the same day.
> > Throughput figures are in faults/s; JVM pretouch time is in ms.
> >
> >                               base      patched
> >   shared-VMA faults, 7 CCDs   1.776M    1.917M   +7.9%
> >   shared-VMA faults, 12 CCDs  2.303M    2.431M   +5.6%
> >   pft, 7 CCDs                 1.910M    2.126M  +11.3%
> >   pft, 84 cores               4.201M    5.028M  +19.7%
> >   JVM G1 pretouch (32G)       1877 ms   1672 ms -10.9%
> >
> > Tested-by: Seunghyun An <san55@wisc.edu>
> 
> Thanks!
> 
> >
> > As a follow-up, I also checked whether avoiding the __vm_anon_pgoff_hi
> > read in __folio_set_anon() provides any further benefit. For comparison,
> > I tested my earlier patch 1 on top, which computes the index from
> > vm_pgoff for anonymous VMAs and avoids that read:
> >
> >                               this patch  + patch 1
> >   shared-VMA faults, 12 CCDs  2.431M      2.941M   +21%
> >   pft, 12 CCDs                2.434M      3.474M   +43%
> >
> > With pft on 12 CCDs, this patch alone is essentially unchanged from
> > base (2.442M faults/s). The additional improvement with patch 1 suggests
> > that avoiding the __vm_anon_pgoff_hi read may be worth investigating on
> > CPUs with high coherency costs between L3 cache domains.
> 
> OK that suggests there are cases other than the one you mentioned that have
> an issue.
> 
> I'm disinclined to do something like that patch, as it's rather a hack.
> 
> Cna you give me the workload you're actually exercising here? Ideally
> something that's easy for me to run + analyse locally.
> 
> I have a zen 5 with 8 CCDs so can probably exercise some stuff over here.

FWIW, some thoughts:

I don't think this is worth worrying about. For starters, the vm_refcnt
cacheline will _always_ be a point of contention, and in extreme page
faulting cases (like the benchmarks Senghyun is running) it will be
dirtied to hell. Say you want to naively get this refcount its own cacheline.
Ok, fine. You're now wasting 56 bytes of a VMA just for padding. Can we fit
more stuff in there? Ehh, kind of, but not really. In theory, perhaps struct
{} shared or the anon_vma_chain that can sometimes change. But those aren't
written to often anyway (certainly not the AVC).

On the other hand, can we get rid of this contention completely? Probably!
But also maybe not. You could try and replace the vm_refcnt with a percpu
counter. That could work, but the percpu allocator does not scale. That would
need to be addressed first.

Theoretically, were per-vma locking structured differently, you could try and
resolve page faults fully under RCU, without needing to write anywhere. It's
a nice thought, but atm is super unfeasible.

Finally, since this is a microbenchmark, I'm not sure this is worth thinking
about. Do we have (many? any?) cases where real world benchmarks hammer
page faults hard (especially on one single VMA) enough where you can see
cacheline contention? I would wager that's not very common.

-- 
Pedro
