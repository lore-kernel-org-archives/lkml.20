Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFBB280325
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788136390; cv=none; b=BWahT51qpwOuZ+HtSOyMUCU3Y+DPFZl07/vA56yAL6TU1Rr6ZeG4lmjvjd+zRgupFDEP70gd2Z0OjyuVsr1anbqFbZcnyFw0d2gEo38UAkqDkS6yvDw3oskSxW0Swi/d/Nv6UYqmSr3SRQzbJmBke0L+AHFNEO8hPCrEvC2RyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788136390; c=relaxed/simple;
	bh=UdjFAwySgiqEIxDcAIopZxl6iO6u5/17KxGerJe3TkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrDkOHhrxMQF0ODfpYlL7wRRgTKEpVve4INwysYmRlMCP4iiUROPj3O3OgiUH+n+0Or+L9trBzSdVkjlxv4ZEdnY5rdubDtRalmmNVxboOJiYJSHKGrKP+3oxjlwosiMTR9w9Lot8zcrZ8uJCcH9JQrpzwCZl/tdawy3LG5o6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=OCmelH2I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RpxQvsoh; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="OCmelH2I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RpxQvsoh"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 72C95EC0100;
	Sun, 30 Aug 2026 20:33:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 30 Aug 2026 20:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788136386; x=
	1788222786; bh=lJPZCOLUDNk+g6cYgbr1iPsO5mhcNg4J4ioSHDPrZzQ=; b=O
	CmelH2IdrjYn+bNwwwhrxZVydaRfNGuwp1PZU5tE8CeSV9af5FkMFp1aAZU98ffS
	tjLkPLY8r48f8zNo2K42YWTNI2TM1noM29FCSCPxM7x2TtLmzmq9V5gNj1ycJW2q
	7q0WU2K0AFt7DTHgh00L7gkJZVZT8vx5ASEU2bDdNO023pXHfJkPTSmnW0EgMilU
	G7tiLA1pwkMJvOEP1xPlNEv5TVTOwfeFNOL3hUU2BcY7pj5fVKnB67Bas+D1ARXt
	0kEZcBGg+3Rhc19SaJKS4Kyu5ggYpmQJd3WDRA7LNYkDgnCTIQgGa8u1l/b2TQsx
	lD4ivyNg/wj9bcieMHXFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788136386; x=1788222786; bh=lJPZCOLUDNk+g6cYgbr1iPsO5mhcNg4J4io
	SHDPrZzQ=; b=RpxQvsohqxwK6JUe9I1qFnA4xYca/pTCvYXLSqxn3A81E0zU4H1
	F13noCR91GcBL/1Y1YJ47n22BWhAZ3gCv+kNsWjs06RDKNSc1bHliu/n+5lGbdBV
	MX0oHU1rkGIaa/y/08kZL6woyhABvPIWb6iB0WedetbZTOu3+/mYj8/ml8iWUtn4
	cbhHU0DyEkuxxs/8IOPKWT3Lw0msoLjscRlrD028TWuPwCluOuNAt+1+0opaBTBT
	zevvyEyR9eaSHx2AEAPmmjTig4rs/Wdb/4QoWTqocUElLEZcbkTA+CAbiZTtt3+4
	Rq3qYfynZyrNwJ3Txq9NOy60DBzmv1a+9Qg==
X-ME-Sender: <xms:wMuUashmOIEJMK-IAgNtOy9BHlHXjkLM3x9UmGE9OSqnK7OXcIxwSA>
    <xme:wMuUar3Y24WYrNNkb8frTWR4kapMOngfq30hF801UHZmxtZjm9maS2HXaFt7ApEXp
    J50SyCyNm8mOD5yyw9VFSbv9vEQuOPK8h9N3tf20aE3IAMPU88rNIo>
X-ME-Received: <xmr:wMuUatCsHhXp2QN_Z431LzCXG8n2LrVi8Wy7sQSztbtHChLKasyfXA5vXbA>
X-ME-Proxy-Cause: dmFkZTGWxIZKkq3xUOgUH4ygv02cvLsZ+hD3NKWU+FsQjPNSZgCQwwPv+JmWL5uCS4cqsg
    3/sT4jCc0KHHG/Z8X0iJgpyNqUAuNz3xsso6DalAvRQKx5sqad53FONoT3236JY1ymED6h
    ZN8kzGUvseACenUQxSwpIBP1MTBMcg5gVzZZ97jTCcLtIAP0NKZSI+azvAoiaQaNjpqH3F
    wCCZD0BK9KSJVz+IMysk4BmIlj4bMsjPYymXcytnWPsV3t5kGLyCE3x83J0C6qbL5n6mSq
    uPuKxKEFN1BWy1CEoDRkvwP1K74G1vsxqWfRCTguUzbdHZtLkLD9HdVbXGqU8xqM2pD8Nj
    YnePeSeUFlIlmf3OOJO9zq909PkrNP2XHZzYzawt/dX7y9EtzL9tFTZAmuszAP1Jkt7pjL
    IogkAI6Swucxn86WJAsRSt13R0laSBo8y9vDzafncz+Po+mK+1dtwxWvJ1Mr+sW5uI7HFU
    y9lYQuIsCBGIjXhl0GQcGpabjnyCwU0vPoaCVXbAdR+7t2GVBKjR6e/JxBcsHN1plYfnQG
    vkSEyBRWJaeWOiHix/tnpIpw5onSGN/KSCynDx0mhuqNOwASo3OTReKPms1rUFmmA80YuO
    vJQ9wWLZVtDf4AodRcnzqlkXDomOo4f4ay1mHeseWItXomCNbiOx7zmnTb5w
X-ME-Proxy: <xmx:wMuUagFAFFWbY2YjWwrsV20OPBml9H2Nk2101ufKBG8yzBEXh8dE7w>
    <xmx:wMuUauCpvGk6DTb_7Vqwd0UFqATo4PgnGgQixx7xGeOvEVL1lG25nQ>
    <xmx:wMuUaqb8YcMT644qNhyozAIWGQW3TbFh3tzLrfw507XEmoKSeI3AnA>
    <xmx:wMuUamPzfSGhBpdUc7tEQO7KLDjN7DPHYKID1D9tvYN8iM_NBJF1bw>
    <xmx:wsuUal5jylNIC9RMDN8Wv07F436UfPYuSnMuUrC-hyYzYxvUbkRSJaCx>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Aug 2026 20:33:04 -0400 (EDT)
Date: Mon, 31 Aug 2026 01:33:02 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>, Balbir Singh <balbirs@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, hannes@cmpxchg.org, lance.yang@linux.dev, 
	hughd@google.com, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
	liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, ryan.roberts@arm.com, 
	balbirs@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
Message-ID: <apTKkAkdUZYv-Zab@thinkstation>
References: <20260826162101.1314941-2-kirill@shutemov.name>
 <20260827163838.1813081-1-usama.arif@linux.dev>
 <DL07CYI5866P.2HCBRH4BWPMKN@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL07CYI5866P.2HCBRH4BWPMKN@nvidia.com>

On Thu, Aug 27, 2026 at 09:57:20PM -0400, Zi Yan wrote:
> On Thu Aug 27, 2026 at 12:38 PM EDT, Usama Arif wrote:
> > On Wed, 26 Aug 2026 17:20:57 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:
> >
> >> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >> 
> >> deferred_split_isolate() probes each queued folio with folio_try_get().
> >> folio_try_get() failure is treated as a lost race with folio_put(): clear
> >> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
> >> the folio off the queue.
> >> 
> >> The folio_put() race is the most common case for !folio_try_get(), but
> >> it is not the only option. Another scenario is folio_ref_freeze().
> >> 
> >> A zero refcount in such cases does not mean the folio is going away.  It
> >> means "don't touch me" and current deferred_split_isolate() doesn't
> >> respect it. It can lead to unqueueing folios from the deferred list for
> >> no reason:
> >> 
> >>     CPU 0                            CPU 1
> >>     ---------------------------      ------------------------------
> >>     freeze a mapped folio            deferred_split_scan()
> >>       folio_ref_freeze()               folio_try_get() fails
> >>                                        folio_clear_partially_mapped()
> >>                                        NR_ANON_PARTIALLY_MAPPED--
> >>                                        folio off the queue
> >>     give up, put it back
> >>       folio_ref_unfreeze()
> >> 
> >> The folio is still partially mapped, but it is no longer a split candidate.
> >> Nothing queues it again until part of it is unmapped once more.
> >> 
> >> Skip the folio instead: whoever freezes the folio, owns it and owner is
> >> responsible for its fate. It also covers the folio_put() case:
> >> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
> >> 
> >> Reported-by: Lance Yang <lance.yang@linux.dev>
> >> Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
> >> Assisted-by: Claude-Code:claude-opus-5
> >> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> >> ---
> >>  mm/huge_memory.c | 19 ++++---------------
> >>  1 file changed, 4 insertions(+), 15 deletions(-)
> >> 
> >> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >> index ced400f72d43..6281ed993243 100644
> >> --- a/mm/huge_memory.c
> >> +++ b/mm/huge_memory.c
> >> @@ -4590,22 +4590,11 @@ static enum lru_status deferred_split_isolate(struct list_head *item,
> >>  	struct folio *folio = container_of(item, struct folio, _deferred_list);
> >>  	struct list_head *freeable = cb_arg;
> >>  
> >> -	if (folio_try_get(folio)) {
> >> -		list_lru_isolate_move(lru, item, freeable);
> >> -		return LRU_REMOVED;
> >> -	}
> >> +	/* Lost race to folio_put() or the folio is under folio_ref_freeze() */
> >> +	if (!folio_try_get(folio))
> >> +		return LRU_SKIP;
> >
> > I think we might have a problem here for ZONE_DEVICE folios?
> 
> For coherent ZONE_DEVICE folios, yes. IIRC, private ZONE_DEVICE folios
> are not added to deferred split queue.
> >
> > This assumes the final put always dequeues the folio, but ZONE_DEVICE folios
> > bypass the generic folio_unqueue_deferred_split() path.
> > With memcg disabled, this can leave a recycled folio linked on the
> > deferred-split list?
> >
> > Should we dequeue folios in free_zone_device_folio()?
> 
> I think so, before mem_cgroup_uncharge().
> 
> But it is a pre-existing issue. We need a separate patch unqueuing
> folios in free_zone_device_folio() to fix commit a30b48bf1b24
> ("mm/migrate_device: implement THP migration of zone device pages").

Agreed, and it is inert today: nothing allocates a large coherent folio.

amdkfd is the only driver with a coherent pgmap and it hands out order-0
pages, and test_hmm builds its coherent chunk the same way. With test_hmm
taught to hand out PMD sized folios, memcg on gives the WARN_ON_ONCE() in
uncharge_folio() and cgroup_disable=memory gives list_del corruption once
the driver reuses the page.

I am not sure what the right solution is: keep such pages off the queue
or dequeue them on free? Or both?

Balbir, I don't know much about zone device. Do you want to take it on?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
