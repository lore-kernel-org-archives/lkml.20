Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0476330301
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315932; cv=none; b=cI7MNlztqMa7RdGLN1i5aW3TqianaJJd3Dm7aruzqxIXKRYymzBYgNb+mv9b+Plvfbs6qsVff+KKxWS4yMZZBaU8BBv2rE715YNzn6h8eGajams7RlrTAKeyNUEILupizbrId/dTqkLNtwmjh+PhqICZ5jnsY9dBXmlhaSx93Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315932; c=relaxed/simple;
	bh=w9xYexThy6hv38qHzfcNpGrcvAkA/9Do2/qlxN6IaAo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=M7DWqVP5tvuaKH4Cdmm0C+n/avP3goR6KsFRi8ki+P6ENOukfga2p3d0VDRHuxXWDBLvfdF4It/SHDRNjDKEz2hbjgo/5XtbJfu8xOAau6aDc0GoLYZBc5CegBMdO+yZmSWMzUD5lZW9BubJZ8z802zz5nHDah2uY69la8wOQIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fUE0khxm; arc=none smtp.client-ip=95.215.58.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fUE0khxm"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w9xYexThy6hv38qHzfcNpGrcvAkA/9Do2/qlxN6IaAo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788315927; v=1; x=1788920727;
 b=fUE0khxmFyG+likThwC4wet/JjwniifGVFqYSv0jLQbZKpC7rQVUHsT70zpIjuG92x84luGs
 YD9CLsAM3ZwZqiP7f5bjxygQxmPPERZxcL7puubTE5FcdFrVyIcemmG70CZMj1Spty4SLu6t3w/
 DrgGdQcM+B/ygAGNfY8KA4eA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d59dde0b280e3ce1;
	Wed, 02 Sep 2026 02:25:27 +0000
X-Mizu-Trace-ID: d59dde0b280e3ce1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
Date: Wed, 2 Sep 2026 10:25:10 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?utf-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Dave Chinner <david@fromorbit.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>,
 Xunlei Pang <xlpang@linux.alibaba.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6285FA19-9A83-4BDE-84AE-CE2DA91FDA55@linux.dev>
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 1, 2026, at 19:51, Qinyun Tan <qinyuntan@linux.alibaba.com> =
wrote:
>=20
> With cgroup.memory=3Dnokmem, shrinker_memcg_alloc() fails with -ENOSYS
> for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
> back to a non-memcg-aware shrinker.  On this fallback path,
> shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
> valid id belonging to whichever memcg-aware shrinker registers first.
>=20
> __list_lru_init() copies shrinker->id unconditionally, so every
> list_lru backed by such a fallback shrinker (thp-deferred_split,
> zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
> up with lru->shrinker_id =3D=3D 0 instead of -1.
>=20
> Under nokmem the list_lru collapses to the shared per-node lists, but
> __list_lru_add() still calls set_shrinker_bit() against the memcg of
> the added object.  Most list_lru users are unaffected because their
> objects resolve to a NULL memcg without kmem accounting, but the THP
> deferred split queue holds user folios, which are charged regardless
> of nokmem.  Since no memcg-aware shrinker can register under nokmem,
> shrinker_nr_max stays 0 and every memcg's shrinker_info has
> map_nr_max =3D=3D 0, so the first folio added by khugepaged triggers =
on
> every boot:
>=20
>  WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0
>=20
> On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
> and expand the maps, there is no warning; instead bit 0 is set
> spuriously for an unrelated shrinker.
>=20
> shrinker->id is only meaningful while SHRINKER_MEMCG_AWARE is set,
> and all readers inside mm/shrinker.c already check the flag before
> using the id.  Make __list_lru_init() do the same and fall back to -1,
> so set_shrinker_bit() is never reached with a bogus id.  The stale
> shrinker->id itself is left as is; cleaning that up is a separate
> topic.
>=20
> Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with =
cgroup.memory=3Dnokmem")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

