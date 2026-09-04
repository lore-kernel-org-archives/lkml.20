Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F64F7989
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536635; cv=none; b=gteNe8gXxxerNsjG17pMAcpsWlT+13KWN/N67etF9pz2XdMN9RxAPs0r2jHlWAARipeg8/3h3hy8wcGXweav4dhCRIdNZ0in4yl2ASzTipGSUvMq9qbilxwbPmSKSBC+ZB26qODNXzX+n+H1ZtBkMLkATol6rWjVZOcWki9aHBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536635; c=relaxed/simple;
	bh=fbxH+HTx+b11PIUzLEkH01IS7+xPasPzFPPwJXVzkb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2uG8lhJFKP4aV94yFRFnNQGIkZrD2H2gVnJkKP5zl/reQL7YYJoN2jo7Nxmgyn+ELZ2GtOyvjKe6XWQgni5t47iSOOd5chks+/l2s6/T35MsmNd7Yv0pObdfbrIRu7QtDcKo+FpU0z0gYya8ZYHvyu2Nzj5bo36lALQMyPPdeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=uvXgKw5A; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="uvXgKw5A"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66fc2844f0eso383544d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788536632; x=1789141432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKmfbONiKhT7CrkzRLhdhFZmjYER1RIKBnciL0qdhTk=;
        b=uvXgKw5AlYJeiGyNUtAV7O9v+XWKTxR94EVSvvO+rWVpzgm0LZYyfIem1hSmUgjw2P
         vwdMdCQSkjFsCURQ+WGdkJgP+rU0uVH/0rR1CH2Oo5W71Wb3ENQYWhctJ5aialq5b5A9
         j72AI9kjYZEZPiY+++7USsnHSRshT2DkyW5+H4E2X+kpwY4pzJVCqEXhWxP9qbQCBzU2
         GU9fMFb3/0AhDHZyc5htnQs6K67Gr43tb3ftR7pGg/A6FPXDgkWU5xTMM8ps0ueOszz6
         t+ZBQJXbA6Q/AAgR6jj2Aj+hPaBMvl3Nzvwl96OBZ3P992RGB3obySehq0mg9luKOiZk
         iDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536632; x=1789141432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKmfbONiKhT7CrkzRLhdhFZmjYER1RIKBnciL0qdhTk=;
        b=PlaQP+wggYbKNqfDn0+9sr+y3UPNPF0SATNXnjH5eOIHjDOAW/ECa+1QOx8RiQiGuk
         +9wW58xLJczmgR81Qzk2cbM7dqMkZdtQ1zG/uC2wTd/FGbiAToWOtqJ5WTHA3CHwyxYM
         NB9vsSs8BEw++KqOml3Fu/Yt4/++LVJ1VEEVHVxnR2B5iSrxBa/ci/EK9So6RZ3HLIUA
         nhHW85aM+P5fdHbfu1S8/q9XZFtz78H0uzAQfibEScNf7xB3yOy0obEOKhelt+Bcc/z6
         EBS1RaI9yR774q0UlKMbJJZE3N/X30whMZZqJpkRL3OzzmWhoEId7AcEOx5lCpKI1CpZ
         Kz1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwrAQ3lcOCFWgysLNslFy8ZGU2n6G445EUPJ1w9nDEOxx/ybDTtwC2adlSDCmQlZL/ZBQFVgflTLrgsMo=@vger.kernel.org
X-Gm-Message-State: AFuF++nH6QqL/+mH3Uc5OoC/PjJiQ08SBTJnohTud3eVC23Sa3vX15XD
	7+LDcg6pDphv+R5AUng9jT34yfTeH3G7srywmNuGZxn73D0YozmKKQXyIBJnqiF7NTKsX8gfa+N
	/qociG/Y=
X-Gm-Gg: AYBFou0dGrc9ofAoHVsid1ptjDTgidQ1wXR9PaSBatfiuCAzD2Te8N4QDPGUeAnK2ol
	sekbcB5R3K0II5DP4AkUwZPkdvgtqSafCzBZE4v3reefFzoDe+OT5XfM8anNOZVz0GyM/jnkqbk
	yk44bstgCyKfydQdinEWejsKMWGTY0GPx3H4K75/j4sJ0eqTRta0CQxFNMLK3DxeOM1i5alPLGJ
	DS9YGMetdjuEBDkSqYyDQ6WleeVZOMuqKHGh/mP1anqbxtgp9rEtbwMolZ6s11U6SQYMOgfIrJI
	f+OmfxpdZ1ISRuGf25v5qsmgq+8hJtnye8Zp/AuZBL+JPfOaiL8qwcegIPSShKbwD9ltwakgCrL
	donUwUVC7WCdHSd7O6KjGy487tBncZS8ncqQgUWPa07PqLBHPQ9NeJAF9LGu8QqjkqBAkHXxl1g
	r12NAc18AccjnkIO+XLBboSZMRGI/iZFO7TubT
X-Received: by 2002:a05:690e:4419:b0:66f:c1be:84d6 with SMTP id 956f58d0204a3-66fc1bf5087mr550972d50.68.1788536631738;
        Fri, 04 Sep 2026 08:43:51 -0700 (PDT)
Received: from localhost ([2603:7001:f100:501::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664741sm23243936d6.22.2026.09.04.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:43:51 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:43:46 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nimrod Oren <noren@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <20260904154346.GB6641@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260902162323.GO3004@cmpxchg.org>
 <aphS2TancJAZLND7@gremlin>
 <20260902183752.GP3004@cmpxchg.org>
 <aplzo5Jsb6f1MdaM@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aplzo5Jsb6f1MdaM@gremlin>

On Thu, Sep 03, 2026 at 04:46:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> Looking over the sub-thread (correct me if I'm wrong) the issues seem to be:
> 
> - 512 MB pageblocks become unmoveable quicker than expected
> 
> - When trying to convert a pageblock in try_to_claim_block() 256 MiB is required
>   to be of the desired migratetype, and this is difficult to achieve vs. 1 MiB
>   (yes clearly :)
> 
> - AI training checkpointing was a problematic workload - big latency spikes and
>   timeouts. Tonnes of unmoveable memory, order-0 allocations falling back to
>   MIGRATE_MOVABLE (ugh), exhibiting try_to_claim_block() symptoms above.
> 
> I hear all of this, and to be clear - this kind of real-world data, at scale, is
> the kind of thing we should base decisions on more than anything else.
> 
> Reality > theory every time (and the more you look into the kernel you more you
> realise it's a tower of heuristics anyway, especially in classical reclaim :)
> 
> I guess what you're trying to say here is the only way in these circumstances to
> make headway would be to have more memory reserved.
> 
> But is that the right conclusion? Aren't you still screwed once those reserves
> are chomped up?
> 
> Or are you saying the increased watermark levels gets you effective
> kcompactd/kswapd sooner?

+1 Exactly! The watermarks sit on top of that reserve. Both background
reclaim and direct reclaim are thresholded such that there are always
a few pageblocks worth of free space for the allocator to choose from,
thus reducing the risk of fallbacks and block poisoning.

> The TL;DR for me is - you have a workload that's broken already with larger
> pageblock size - maybe you could test that with/without this patch and see if it
> really does help?
> 
> Anyway it seems to me all of this is essentially a (valid!) critique of
> assumptions backed into the page allocator code.

This part I don't quite follow. Why is the page allocator doing
anything wrong here?

You tell it your largest routine allocation size. It groups smaller
allocations by their ability to move into buckets of this size,
coordinates a headroom of buckets for non-violating placements, and
ensures reclaim kicks in when that headroom depletes.

You're giving it a very large bucket size and are not happy with the
headroom that commands.

[ I'll reply to the other points in your email later. ]
