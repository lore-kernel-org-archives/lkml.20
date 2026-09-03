Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547348A8C7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432350; cv=none; b=TGvCeh+pgsYSEMvF24TgqJzmQZGCOYB6sMriVsPD/mBr5aGWNSNTIZVCCM17cudX0YjBmY1BBRewW0DrI7E+RfGzzKAfQFMdO1Y+oNEclCey7T6qhAsWgustMGWTJxH8CQat9pM2qi5uuM4krwVHS1dg0KvP8kaIfQyd8uD0jHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432350; c=relaxed/simple;
	bh=luxgHjCI8NuRf0qdiV7rRhisYirITPEU7RHmUK3BnIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4rKcQWBaiEa18VAv6HoedwmMOWRFGfOAUEwg286hmTx+jLif2jS9iJMmOMVbwne0Y5Y3v+8p6YiLWPXy1ZmEdtzDl1RqPk36mxs5xLXiW6qZA85C9ggyav47fxWQi302BtUYQUTHk5aMUrPB/DpJf6oIIZGZwk3Oa3FZdQevS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGh3WhUT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGh3WhUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621DC1F000E9;
	Thu,  3 Sep 2026 10:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432348;
	bh=KJtCxr6SsmG+7oqPAO3/fjLakFwcn/sSc05iILsC2RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oGh3WhUToaQ5eeaXV1j2TAW1tA+oR/lSfzzF+1AQPmatJDqSYxP+bvGRp+w+NpWt5
	 78mjd3UYllWUZ/OiCqark7/aQmfpiprMWu61PvYCxedV45JUjvOdl/OD3GOAJFk35K
	 BHLHxoDosBmZ+b8042lQDw2C6ZvwYEgt1gpfrKIxP/zZglsAHR3JoVdPeCSfBvQQwu
	 Te/fNBfGKwOL7PzqhdfYGQHDLJDsRnntRlDJLRDODBTVKA0r1BGfgBoNL5u/v9Umeh
	 BRDFpmTPMobmUQMehL1zRLUWObxFxaCwQ+fklPJxkVSYazAvDG0AqA+XpIVbxxoy3T
	 KcP6xVcG0N0dA==
Date: Thu, 3 Sep 2026 11:45:42 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <aplP1oUjx96O_I69@willie-the-truck>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <551663b9-d031-4755-af7f-dc6c22524b35@arm.com>

On Wed, Sep 02, 2026 at 08:16:36PM +0530, Dev Jain wrote:
> 
> 
> On 01/09/26 6:48 pm, Karl Mehltretter wrote:
> > huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
> > permissions. For contiguous PTE mappings, break-before-make (BBM)
> > requires a TLB invalidation after clearing the set and before making any
> > entry valid again.
> > 
> > Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
> > get_clear_flush()") removed this invalidation, relying on the deferred
> > flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
> > TLB invalidation for BBM on contiguous ptes") restored it for
> > huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
> > late for the break step. The modify-prot path has the same problem.
> > 
> > Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
> > invalidated during the break step. Leave huge_ptep_get_and_clear()
> > unchanged because it is also used by teardown paths, where the deferred
> > flush is sufficient.
> > 
> > Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > ---
> 
> The transition happening here is:
> 
> old_prot+cont -> zero -> new_prot+cont ... (i)
> and then TLB flush.
> 
> Arm Arm rule R_JQQTC says:
> "For a TLB lookup in a contiguous region mapped by translation table entries
> that have consistent values for the Contiguous bit, but have the OA, attributes,
> or permissions misprogrammed, that TLB lookup is permitted to produce an OA,
> access permissions, and memory attributes that are consistent with any one
> of the programmed translation table values."
> 
> This implies that a live update like
> old_prot+cont -> new_prot+cont then TLB flush ... (ii)
> 
> is safe. Which should also imply that the transition (i) is safe,
> since the configurations the PE can observe for (ii) is the same
> for (i), except that in (ii) the PE can fault too, which is fine.

I'm not sure I agree. As written, the text above says that if the
permissions are misprogrammed (which they are in this case) then the TLB
can produce an OA consistent with any of the entries. Hopefully it just
needs some further clarification.

There are probably also cases where we're changing the attributes and the
permissions at the same time, so it's not clear to me that it's safe to
allow those to be inconsistent (e.g. tagged/guarded vs read/write). If
I was going from untagged read/write -> tagged read-only then I presumably
wouldn't expect to see a tag check fault on a write?

Will
