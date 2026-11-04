Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753005;
	b=Vd4aNax7WS02uYnvCiAhgPKWJ4V6Jk3bJZZ2MrCm+4ErTRWsnCwRENMrFgtVkm09Icex
	 VRY14QdVHcTAtF2H5MM4wt4raYkiPSlXjaSIBfirae15sIxKDUCSuQ3Q5MqLozh/ffE2V
	 BunKnhSWxxMelTtcluf+9l4W4jnpaM5T6Zant8q9yl7brOvUTw6VRiejxJDdzWdMaTgDg
	 KRPB6Ifh1/s21U5NDzg/rGbElRq5ZWNxaR+35Dv6znpbLSeQCj8sxaKo0yWnVWL2h5dR9
	 b3XjMhFjLi59FCqysZV+a2BfqNucXfvF8lc0ZUfeFRgqsICQ6iVAhlojU2BsIVq049g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753005;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BxN183u4KZBYO0Z1LYyG6Hk9J0ZY7HIldlj4rccCYNQ=;
	b=cbmf5aDGZsXAzjqk8ss/mbvHVgFfkTHrLQh1nLLHaRX7dCYHjufxJCOnTcAb12/xXCF6
	 CXuSDCoEQptrFeaAHVNZuBv47wpP7Ke6J1U/cjG7x0c/XiJ8eUhXzCPG+UufW8DHeISq1
	 ThxWtX9xh7jlbmRPs3hufYS27oTuAnZldqEW2WzxiJFnbYli5BkdL6x3End4TChs/v+td
	 PDODLzXte1wjaUX4KYQEh/fDz8sDNgJarJOCSLbgp6UURKS6yT/1Hsn3k8ZqiPlCokDhL
	 qFF2e8PC3gZ5tfaL6St6BmgcbaN9WSF/ickXhprZTwhZYzErL758yE+F/wb1M9LqP0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lY9xLFc1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01FE606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lY9xLFc1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C081F00A1C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753004;
	bh=BxN183u4KZBYO0Z1LYyG6Hk9J0ZY7HIldlj4rccCYNQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lY9xLFc1lh28lDdpeB2+pBZzt5R9gBoe6AkIqA1oRg4A9lL88Oa08cSUW4zXtlBt1
	 OCI874pm8I8RSeP5+Il8gMjb5OxLLJTH1vmUeMTbl/4g8uKotJyNPcFbAlQn4lVsTt
	 rDCJJrHQ2swSHBhqcLyG01hUqvWLjOfBXWzaeArrONHouxtJ3pKu++tjXrf7W+qnad
	 skgk7aTbT11skVjQMGX2cV2GSf+E/4aK/LpM5yFsjKffsHwl1DC5LbtYlXyDFivGNV
	 MQC9b92cClNfMOOC/sTZ3qmWiQzwgv2QyF+iB4d6ycQ6nwWMfXXdxKay/HMIEsKKdG
	 UrPFQofWdduSg==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e6eb77f0bso19940385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxz+qptTklADjwX4qWkjwCbR+Mxhi6aMZIYICusFVO15BJZmMEYQ2vV+F6Vo5dNKiqBF37cTN4rXAzWQFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lEvOOeUSa7yEYaJ1Uuijx3V2UHOMCKQf8PcfaC///4fgEs/AK
	JBoZuxZzCye52vsdzi8K9B7ttLYCZd0qoHtR3VKpxK0t+E2FEos0cQfbD6uPjDH+IKWHucEK0o4
	Ws6l5TNAXlPRRpdVJ7SAaxyKAFLB/20w=
X-Received: by 2002:a05:620a:6402:b0:93b:d7a2:83d1 with SMTP id
 af79cd13be357-944217e5808mr2603278285a.64.1793753003736; Tue, 03 Nov 2026
 16:43:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104002420.433876-1-bingjiao@google.com>
In-Reply-To: <20261104002420.433876-1-bingjiao@google.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 4 Nov 2026 08:43:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z5M1KiFJbC3ed_572Z22qadmgnJdO3jKnEJbvpPEykZA@mail.gmail.com>
X-Gm-Features: AclHuK9QTXGS6QfVjUVofxOTNtsuXKl-ipR_9YuybED-4phC26SwGpv3dsR-WW8
Message-ID: <CAGsJ_4z5M1KiFJbC3ed_572Z22qadmgnJdO3jKnEJbvpPEykZA@mail.gmail.com>
Subject: Re: [PATCH] mm/vmscan: skip lazyfree folios when demoting in shrink_folio_list()
To: Bing Jiao <bingjiao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Oscar Salvador <osalvador@suse.de>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Yang Shi <shy828301@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:24=E2=80=AFAM Bing Jiao <bingjiao@google.com> wrot=
e:
>
> shrink_folio_list() currently demotes lazyfree (MADV_FREE) folios to
> lower-tier memory instead of discarding them. In the earlier patch
> series [1] that commit 26aa2d199d6f ("mm/migrate: demote pages during
> reclaim") was based on, demotion was inside the PageAnon(page) &&
> PageSwapBacked(page) block with a comment to skip MADV_FREE pages. When
> that commit moved do_demote_pass above the block to also demote file
> pages, the PageSwapBacked check excluding lazyfree pages was dropped.
>
> Demoting lazyfree folios during reclaim does not make sense. Userspace
> already marked the contents as discardable under memory pressure. Even
> if MADV_FREE is treated as a cache to avoid page allocation and zeroing,
> folios in shrink_folio_list() have already aged to the tail of the
> inactive LRU, and demoting them still allocates a new page on the lower
> tier, copies stale data, and unmaps the PTE.
>
> Skip folio_test_lazyfree(folio) in the do_demote_pass check so lazyfree
> folios proceed to the normal reclaim path in shrink_folio_list().
>
> Link: https://lore.kernel.org/r/1560468577-101178-6-git-send-email-yang.s=
hi@linux.alibaba.com [1]
> Signed-off-by: Bing Jiao <bingjiao@google.com>
> ---

This makes sense to me. Lazyfree folios can be freed
directly, and we're already in the reclaim path. Allocating
and copying them seems wasteful.

It would be even better to have some real-world workload data
to back this up?

Best,
Barry
