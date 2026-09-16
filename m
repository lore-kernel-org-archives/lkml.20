Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444846A611
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574326; cv=none; b=CMbBe12/A9Rd9BgU/aBH+sZrS6ewg1PfXHggPoqUxA6ZknE+JB4TwbKI25zkn6+M8OAbxCt6AoQYShL5El0pBnNpIvbJKH5PQ+9MolvvoYGbg5MRcXXalpmWIfPTm233ka5v/DCXiO3EDdYl0Ku8XBsJbhpYzt+u6hl2jMIMYeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574326; c=relaxed/simple;
	bh=+6aMjHH+Jl+Ml/kjCyAc+ni40OSaFZs1senFwZLmkis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+vzjXlZ48jQlJRlMcwMWc9K+ICNvMdQzz3Iu6YteocE5fYzGCe8ruMHzm+FOa3ASQsLJUHCmo/QXAk8W/pDH0NsInTw8KY6QDjQgOxRH+BsQlAlOm1+BaCZLQSLxgrJVAwVywMjr102u4OZYH3e32IFxmUm4HjFMdarFCXFjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=mxy947Qa; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="mxy947Qa"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe208so11092426d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1789574314; x=1790179114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bjcBGUR39i2CtxsYZA+y8R1kv00jh+PXwHXxQnV1eiQ=;
        b=mxy947Qail07AL9t2Ag0dSp7kFCQr+bAzVIypiyzW0zASsfINssXUmISG1WGaiaxL9
         zMAIp6+RhmhTn4fPH+98BVQ7RIBBHGYvMJyFE+4/n6rubXroqjT1ofD3x7gSLqKAsZIL
         Sq92DQFsU8zhBvSCtlYaBNSrEQh18Awe6Omn32t82761kFBwE7EL0rqpnQ4QvucznX+z
         o8o1c48JZ+9pIgd8xih/5XrUvEGwFXbv3XaphihX05pMeqPSiqKen08/YeZdeXsOBFdD
         Tvnxc2uOOrhqL56m59ngfpsIWwWFEH4NN1GvRoGx6uZ82TmniIt7+/aD/m5d6CO3Xwhi
         bGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574314; x=1790179114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjcBGUR39i2CtxsYZA+y8R1kv00jh+PXwHXxQnV1eiQ=;
        b=KHsBABc1mwgYQtckSE8dWCiN8SpceenUbl2ZP33jubqZRatJDMz1sTfE9RwTvqlMmb
         rbcGH8dcl0oe5aaTOLBawtLv4lG/Yf9wt1js11xcS6lyXEvBsRHwvzx13OlO8yHehCum
         nor9r+DvPerg7WyXGk1yVzTbBAzDlXTK7hJN6enEy2XZlI+mV6fRb0tHQRHZlUewxrQh
         5/THZZvjP/wHcQJLtUFRXMzpuFlkZZSlCm2yLvFC/GvJrSUI70pGq4fD34q9XK+6gpsA
         oIXM0wf5i1O1VHsY32Hljt+y0POWP4mOax52A7ayypiJiFHvkL03wKp2qU2pFmkeccGx
         nXxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGHZFpKMwg3vLsD8HlrjuVNTrNbkbAtPCbHe3VK4qzaHL+tASB6HGCgLmKOjZlmNpy0ytOuclzzz59c+0=@vger.kernel.org
X-Gm-Message-State: AFuF++lKSfpnKxFnvuP424CgXymEeZDq1NDQXqzycTWsM0vXzNQoLAF0
	juXVgKksvALfWyExmmSE0LY59suCOx3H/piQ9mgCVZtUYUcFCaMvguWJRe8eOoOph94=
X-Gm-Gg: AYBFou1u4v8oJ6Jqrr5fyWZbOmuKiLS290Xq13oTipXqFiFBA8L1VAQGsy19RSSzW0B
	Ym4YaCNkjbzziCDU88N69KYlVdlZ1IxiAr117zyB+IWy2G6JZhcvQvdR3f+SGCdvoHqsioyZf74
	on9R9fhrx5E7BgusbIdmL2jx6Y/oDgXUtEhhWE8gujASxwiJi+rqOPoAxKY0ZsfdLgRoM/0hkbY
	C4xbO5kCohJDL2iPwjHWRS0c/Xo8vThCYXxM3UfSHDK0VsUnQkLgHPbwMpWbBneg+Dt3hJ8iV5N
	s6v7t6Jz+dBS/1eEi9K5igjAvX54HK5tLQmHD0KDY9QqkjV726LHf7NS8K1cgBLnRqSmj63ojLA
	zzmVFH3tvDGEEUkJpnYFC5oXzgcrW/mcI3mqhLt+LoACyh6oD5h3lQvoKlN2CykbpCRyYWkyPlj
	IaTDlWfN4g0gtV+YwLQBaXZOivIhLqXl+quN8NujyGCM97EnTZ0AGHpPCg9s/C3ehQRfAxNA==
X-Received: by 2002:a05:6214:1248:b0:90e:96d1:40d3 with SMTP id 6a1803df08f44-9123d7a5b32mr54271566d6.20.1789574313980;
        Wed, 16 Sep 2026 08:58:33 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be609dcsm28537916d6.15.2026.09.16.08.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:58:32 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:58:29 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Salvatore Dipietro <dipiets@amazon.it>, akpm@linux-foundation.org,
	abuehaze@amazon.com, alisaidi@amazon.com, blakgeof@amazon.com,
	brauner@kernel.org, brendan.jackman@linux.dev, david@redhat.com,
	dgc@kernel.org, dipietro.salvatore@gmail.com, djwong@kernel.org,
	hch@infradead.org, hch@lst.de, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, mhocko@suse.com, ritesh.list@gmail.com,
	rvvandan@amazon.com, stable@vger.kernel.org, surenb@google.com,
	willy@infradead.org, ziy@nvidia.com
Subject: Re: [PATCH v4] mm/page_alloc: avoid direct compaction for costly
 __GFP_NORETRY allocations
Message-ID: <aqq8pWI0u1IZNWHT@cmpxchg.org>
References: <20260905174239.99e31515fabe220aa7d8e6fa@linux-foundation.org>
 <20260910114602.926944-1-dipiets@amazon.it>
 <aqQlUr-1h07G8JWM@cmpxchg.org>
 <8d6a8a63-4adc-458a-b548-a47bf5ff8eb7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d6a8a63-4adc-458a-b548-a47bf5ff8eb7@kernel.org>

On Wed, Sep 16, 2026 at 01:24:31PM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/11/26 17:59, Johannes Weiner wrote:
> > The access to
> > MIGRATE_HIGHATOMIC that it points out is in itself too generous. This
> > seems like a real but separate bug. It will allow GFP_TRANSHUGE_LIGHT
> > into the highatomic reserves as well, for example.
> 
> I don't follow this part. For ALLOC_HIGHATOMIC you need __GFP_HIGH in
> alloc_flags_nonblocking(). So GFP_TRANSHUGE_LIGHT won't get the access, no?

rmqueue_buddy() has this:

			/*
			 * If the allocation fails, allow OOM handling and
			 * order-0 (atomic) allocs access to HIGHATOMIC
			 * reserves as failing now is worse than failing a
			 * high-order atomic allocation in the future.
			 */
			if (!page && (alloc_flags & (ALLOC_OOM|ALLOC_NON_BLOCK)))
				page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);

It says "atomic", but it's checking only ALLOC_NON_BLOCK, which is
broader than GFP_ATOMIC. alloc_flags_nonblocking();

	if (gfp_mask & __GFP_DIRECT_RECLAIM)
		return 0;

	if (gfp_mask & __GFP_NOMEMALLOC)
		return 0;

	alloc_flags |= ALLOC_NON_BLOCK;

	if (order > 0 && (gfp_mask & __GFP_HIGH))
		alloc_flags |= ALLOC_HIGHATOMIC;

So this can apply to random !direct_reclaim requests, no?

I have to correct myself on GFP_TRANSHUGE_LIGHT because it happens to
include __GFP_NOMEMALLOC, and so won't actually get ALLOC_NON_BLOCK.

But what about random GFP_NOWAIT and & ~__GFP_DIRECT_RECLAIM sites?
Those explicitly don't get watermark exemptions already, and weren't
the intent of the rmqueue_buddy() exemption above.

Something like this?

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..c79cc7aa4dff 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3246,7 +3246,8 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 			 * reserves as failing now is worse than failing a
 			 * high-order atomic allocation in the future.
 			 */
-			if (!page && (alloc_flags & (ALLOC_OOM|ALLOC_NON_BLOCK)))
+			if (!page && ((alloc_flags & ALLOC_OOM) ||
+				      ((alloc_flags & ALLOC_MASK_ATOMIC) == ALLOC_MASK_ATOMIC)))
 				page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
 
 			if (!page) {
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index b9259deddb59..11714ddca254 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -60,6 +60,9 @@
 /* Flags that allow allocations below the min watermark. */
 #define ALLOC_RESERVES (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE|ALLOC_HIGHATOMIC|ALLOC_OOM)
 
+/* Flag combination from GFP_ATOMIC */
+#define ALLOC_MASK_ATOMIC (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE)
+
 /*
  * Structure for holding the mostly immutable allocation parameters passed
  * between functions involved in allocations, including the alloc_pages*

> Unless I'm mistaken about that MIGRATE_HIGHATOMIC part, it seems all sashiko
> concerns can be dismissed and then indeed v4 is the better version.

It looks like a real issue to me, but one that already exists
independent of Salvatore's change.
