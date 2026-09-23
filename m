Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33493016F5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145162; cv=none; b=Gqj5Pa307WJNugw31GnsgrMSTtiW+HxMbmh1zPn7sGeJB8sKwLeQ0NPCrK8tPTH4V3484JUEmnl9mmFHat14r6ePP5goykwB5Ya9/9f0K6HXgonMpBJo+6jYoh6qMII+nRwy3oqR5WIcdVOScwmyKt3/NveW2vbeKonPLLLxxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145162; c=relaxed/simple;
	bh=/5KdU9oqMfs3G4BpcnqGGCo77e13y0O9Cnm4hDnbnHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkR8ZZyEbzs44/HPllpOAa+83jnSwZF7IqvwQrr+zynPiCvB3SWLoReCpm2J3VtnTbN8LZFv3TOoAS8/TRYLu6h03gQt6fR+uj+pNqHqrSOJGcc1zZTUwtvOyjDRNTfsW2Nv1KdqgtNXAGAF/DKWcvaIOnAu05GC6byafc96PMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXRHhmrB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXRHhmrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E4A1F000FF;
	Wed, 23 Sep 2026 06:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790145157;
	bh=hUUD5AsSXzkphFJZvhrBYYbjoBXgpQvRiJn9WGnnTwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hXRHhmrB9NhcEkiy7kvByZxgQdF2vfg2sXL63KJyiVDOAbH4giWC3rrE1BYeZx3P8
	 GlMqexvqR1BEnxX+bIlseBFGTRMIe8avCCI/W/HCZEHmRS403M3NHZup7vuVRAhUgx
	 yxoCQJLQTVrxDmhTe5J9/i5t41chXhheoL4AJO/45XmGvDvFOOPQYIguBWMOgbYttC
	 2ZKj2ODVAjDOEoM3VdCfDZ6XfoXNCkjd+NalL3o1/A5G10ZWYUqS4JVQddQlZkKM6W
	 TLZIQ7Tlh7ff/pR8nFPrWCKUQ69LPN2/R7Ai7w2iOuavHVf8r0TKz6k9uKpIQ6ZX4u
	 BjFAQ7dvmSCVg==
Message-ID: <80206444-d0c3-4dab-a5e3-a2909e58ea33@kernel.org>
Date: Wed, 23 Sep 2026 08:32:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/page_alloc: let the bulk and folio allocators carry
 alloc_flags
To: Gregory Price <gourry@gourry.net>, Lance Yang <lance.yang@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, surenb@google.com, mhocko@suse.com,
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
 baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com
References: <20260914155115.439742-1-gourry@gourry.net>
 <20260922130558.48402-1-lance.yang@linux.dev>
 <arMxm4ia5Md-Zt4R@gourry-fedora-PF4VCD3F>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <arMxm4ia5Md-Zt4R@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 03:59, Gregory Price wrote:
> On Tue, Sep 22, 2026 at 09:05:58PM +0800, Lance Yang wrote:
>> 
>> On Mon, Sep 14, 2026 at 11:51:14AM -0400, Gregory Price wrote:
>> >__alloc_pages_noprof() takes an explicit alloc_flags, but the bulk and
>> >folio entry points do not, so callers cannot select allocator behaviour
>> >(e.g. an alternate zonelist) through them.
>> >
>> >Thread alloc_flags through both, matching __alloc_pages_noprof(), and
>> >keep the flag-carrying primitives mm-internal (page_alloc.h) so the
>> >public gfp.h wrappers stay flag-free:
>> >
>> > - add __alloc_pages_bulk_noprof(gfp, ..., alloc_flags) in page_alloc.h
>> >   alloc_pages_bulk_noprof() becomes a wrapper passing ALLOC_DEFAULT
>> >
>> > - give __folio_alloc_noprof() an alloc_flags parameter and moves
>> >   __folio_alloc_node_noprof() moves into page_alloc.h
>> >   __folio_alloc_noprof() is no longer exported
>> >
>> >No functional change: every caller passes ALLOC_DEFAULT.
>> 
>> Yeah, but what if a caller passes ALLOC_NOLOCK in the future?
>> 
>> __alloc_pages_noprof() checks alloc_nolock_allowed() first, but
>> __alloc_pages_bulk_noprof() can enter its fast path without that check.
>> 
>> That fast path can reach _deferred_grow_zone() or pcp_spin_trylock().
>> Shouldn't we do the same check first?
>> 
>> Or am I missing something?
>> 
>> Cheers, Lance
> 
> There is some concern around NOLOCK here yes, in fact sashiko picked
> this issue up and I've been poking at it.

It's possible to document it as unsupported, add a VM_WARN_ON_ONCE etc.
It's not necessary for bulk alloc to support ALLOC_NOLOCK just because it
takes flags. e.g. kmalloc_nolock() supports a subset of gfp flags as well.

> I've actually been reworking this patch and pulled in changes from the
> ALLOC_UNMAPPED series to address this all at once.  I've been developing
> a page allocator unit-testing harness to help validate some assumptions
> before I post it.
> 
> ~Gregory

