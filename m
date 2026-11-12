Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451805;
	b=e/uNWd1RgjCXnovxMRGeCdpY0BIP01WXnhJU81QX7KUijMAfkK3uuY7dhHWaZP7udVyp
	 0xTMve5US9FArimvjxsKRcsfljmGX3MD69pUL5cI83gx/Iu16zJbhxEnxhxeTxavzv/8m
	 w08hucOcGMsghJXcK6aATr9vYFc5HZY7H3mo3m7F/gasaS1dkzYkEzzAjzHuFfSf5OC/4
	 kishNBvEreYM4DwIDYjuqPMxCOj89CrxpkOC6a7SN5pn2x0qFDk9dMP5F0bNRT5Owd7It
	 Hz2ue2kfPrIB7ryatmyCGMHZJQU3Vijh6ljYvO9hzJJRY7AmGC76EuwNUYcoqrxhp5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451805;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=7Sw15fLJElTIXiA3Qe5WXtECxHOt5O6ombPZ3J8UKq8=;
	b=Z5YrJ8dSMA412xqIvYGmktoQYSxWX/I6AEB446jgZ1Ud1ILOZ5aA3hUZRBK9xPJQa2D3
	 YparqV2zNU/IDrc06WQoTCN5x8hIe8DFKvlFpK61pOOaH+7DtHkmidEv/kEF1Yb/UPK1Y
	 dUY8TRpt279+K8lr99J9y3xcqr3XXrG7pr1jCIXx9SASyh4Xr+LSKyNoAPo6yMnYsaZE7
	 v8d8xktO2vtfjVgHcUwqGA3xJhjmOw6OhgVqp5DIz0qvydEIoE/Ro0WUknXRShRwmYvjr
	 kn4xvXlBkeqbbbvZZ+WncWgcid5q/dnkDYyICJFhvu/zijFYNzD76GDjCkPoTsbYArQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YzGrzmHr;
	arc=none smtp.remote-ip=95.215.58.167
Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51573606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51573606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YzGrzmHr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N31htkiw7FeFclqPnxejrLhX+YXxP1RzI9SGKIi5828=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794451802; v=1; x=1795056602;
 b=YzGrzmHrmkAvLjtEQ0tx1a5d1kXvDK8yiijclYAhGn+60DKOnMsqbLOsMYqt5phJio+KFQAN
 9pDk96x/GnNjkNQq7jbH0xMRoq5RjkWr8Mlu2E4tZhBd2badnKnO+HvRkWWXn5zXo5SKnYuaLp6
 y3MLawk8E9vPBsSqy+tpyeoE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 2bcdc9690615e9fb;
	Thu, 12 Nov 2026 02:50:01 +0000
X-Mizu-Trace-ID: 2bcdc9690615e9fb
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
Subject: Re: [PATCH] mm: list_lru: fix NULL deref when a folio moves to the
 root memcg
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261112024140.648088-1-shakeel.butt@linux.dev>
Date: Thu, 12 Nov 2026 10:49:44 +0800
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
Message-Id: <26CC0CD2-97FE-4842-AE51-605EC77AC91D@linux.dev>
References: <20261112024140.648088-1-shakeel.butt@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 12, 2026, at 10:41, Shakeel Butt <shakeel.butt@linux.dev> =
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
> Fix it by skipping the root memcg in the slow path too. The root needs
> no lists of its own.
>=20
> Fixes: ae64f07a6a40 ("mm: list_lru: introduce =
folio_memcg_list_lru_alloc()")
> Reported-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
>=20
> ---
> mm/list_lru.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index d1d256822ccc..566691ca3dd8 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -645,9 +645,15 @@ int folio_memcg_list_lru_alloc(struct folio =
*folio, struct list_lru *lru,
> 	if (likely(res))
> 		return 0;
>=20
> -	/* Allocation may block, pin the memcg */
> +	/*
> +	 * Allocation may block, so pin the memcg. If the folio's cgroup
> +	 * was removed after the check above, the folio has moved up to =
a
> +	 * parent memcg, which can be the root. The root uses the global
> +	 * lists and has no parent, so skip it.
> +	 */
> 	memcg =3D get_mem_cgroup_from_folio(folio);
> -	res =3D __memcg_list_lru_alloc(memcg, lru, gfp);
> +	if (!mem_cgroup_is_root(memcg))

How about using memcg_list_lru_allocated() to check this, it's =
consistent with
the above check?

Thanks,
Muchun

> +		res =3D __memcg_list_lru_alloc(memcg, lru, gfp);
> 	mem_cgroup_put(memcg);
> 	return res;
> }
> --=20
> 2.53.0-Meta
>=20

