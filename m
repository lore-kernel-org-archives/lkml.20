Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464052;
	b=MVEqTGbJwl2fbqb12OnIYAHsVtS74np1m5XZqlNdH6kfbIsQEdOIKbOtYUwpUgjNjRU3
	 L7QWpz08yh9BQi4xjfBTuqGZUdkl3/WbaCZNm1BmO+t4YaVQFMD3Do8/FsRCd9CuV0/oL
	 M4G+32Dxhle8I7xdqnVn/poNvp1Kok5a2bnRUhrzVCLUf6xZNf7QSNn22EclSD+g1vUQ0
	 e05C9gcY8cqidalnP28Y62sVgjHB8ve14Ztinbmkla3tTSkjnQiTS93IUjVa1r3G8MzN1
	 PAPKQQXCKOIRiotSmdhtBIzdI08KgTR7JxxDHN88WQzLNrRorzggrA/15XAAROTllxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464052;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=GOjmMfTwWFwzvXb2vdAWJAzj6RNRi2ZVVOIySaF3Bow=;
	b=JFOMGxypRATAFYtXihFsWumEjUF/k4YAIngd+Pvy9sQDsHmsnka+zEdAM2KujJvXEb0P
	 jlZGo/TBQ2hrQecBjHpy+154nHEo/l0/KoLLWFbBiMKEZMxWoAbLf3BPC5LwpJifs6DzN
	 D7T/w8LpXBjsupET4Lq1Q+2tGjE1LcHa3V4BVH/MYozPswd3aLNPFh4I9SiOjRLvQpYle
	 Yl/o7ynttEDdfuz1ukCtG+4H+GK+KQAstJhnGGxTrEyPPHOf0zSuq92D7MzykRmZSWk8g
	 ZYgsHI+LGRjB0YDjwZEJjkFUhoYn2cv3fMUNU3mDafrYr+PYG3EcGo/mmL68qUeU9kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VK8Gx9qj;
	arc=none smtp.remote-ip=91.218.175.47
Received: from mta0.migadu.com (out-47.mta0.migadu.com [91.218.175.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C488606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C488606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VK8Gx9qj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GOjmMfTwWFwzvXb2vdAWJAzj6RNRi2ZVVOIySaF3Bow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794464049; v=1; x=1795068849;
 b=VK8Gx9qjg1UfqX+Y7HCzmtNTJ05Pth5kjeiYQrvJj3vK/3a1vXA5pR3YQsshpyW0a9LhqcbM
 9F0v6U5MgLsQk14FiTUk2u9AWQ598/yfYz2Jx20uIwRVO9pEkEmBxrIkzJFW+0fucxrSZoh+fl6
 Efbvlkqn64yIbBHI+gDXT4hQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6bdb3bd2c51ec464;
	Thu, 12 Nov 2026 06:14:09 +0000
X-Mizu-Trace-ID: 6bdb3bd2c51ec464
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2] mm: list_lru: fix NULL deref when a folio moves to the
 root memcg
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261112061231.2469026-1-shakeel.butt@linux.dev>
Date: Thu, 12 Nov 2026 14:13:49 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>,
 Meta kernel team <kernel-team@meta.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Chris Mason <mason@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <46D53C33-558F-43A7-870A-F8BB7F176245@linux.dev>
References: <20261112061231.2469026-1-shakeel.butt@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 12, 2026, at 14:12, Shakeel Butt <shakeel.butt@linux.dev> =
wrote:
>=20
> folio_memcg_list_lru_alloc() makes sure that a folio's memcg has its
> own lists in a list_lru, such as the THP deferred split queue. It =
looks
> up the folio's memcg twice: a fast path under RCU checks if the lists
> exist, and a slow path takes a reference and allocates them. The fast
> path returns early for the root memcg, which uses the global lists.
> The slow path does not check for the root.
>=20
> The memcg can change between the two lookups: when a cgroup is
> removed, its folios are moved to the parent memcg. If the folio is
> moved up to the root in between, the slow path gets the root, and
> __memcg_list_lru_alloc() dereferences the root's parent, which is =
NULL.
>=20
> Users see a NULL pointer dereference oops while a THP is allocated,
> such as in a page fault, in khugepaged or at swap-in. tmpfs huge pages
> are affected too, and for them the oops can also happen in reclaim,
> for example in kswapd. The task that hits the oops is killed, or the
> machine panics if panic_on_oops is set.
>=20
> The race is narrow: the folio has to be moved up to the root right
> between the two lookups. For example, its cgroup is directly below the
> root and is removed, or has its memory controller disabled, at that
> moment.
>=20
> Fix it by checking memcg_list_lru_allocated() again in the slow path,
> like the fast path does. It returns true for the root, which needs no
> lists of its own.
>=20
> Fixes: ae64f07a6a40 ("mm: list_lru: introduce =
folio_memcg_list_lru_alloc()")
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Muchun Song (ByteDance) <muchun.song@linux.dev>

Thanks.

