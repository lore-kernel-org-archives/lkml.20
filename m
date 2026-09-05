Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30B430C168
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788610721; cv=none; b=nNeto5hNuVZfljfDikAS+aaHUVBVJ3RgGExYatLrauVARRV/swpOWk3f/vrcvlK5fyWn0oG/O9jpn81TDzaVBB0quczpDY9dzbQM8l75Omqv03SvEiBy6gRbkgG7XZhfvZ5Cb+OWHIVQtMZgSJNMb4fP1IF9P16HT627gQIQve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788610721; c=relaxed/simple;
	bh=ySkuT1pGEsfWYtaDY+C44/DFGOfxtIvjurzCYJAaaQE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GBGHo1+UZLt4yEEfE4OSCTMzjxmsfWXRznCYO9Trhi5Z71EBc3fUJ6ec8srMLg2f22NWBqIkg1oJBrJ40Zhwwa32IY27l3XrcDUnQuT5nJc1xbVIRup1yWqd7ch2DvyE0HVZkva4+bef4VcCnECEPg1EZKj2cMEaL/O95D0ohW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mQkaeJ+R; arc=none smtp.client-ip=91.218.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mQkaeJ+R"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ySkuT1pGEsfWYtaDY+C44/DFGOfxtIvjurzCYJAaaQE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788610716; v=1; x=1789215516;
 b=mQkaeJ+Ru1jBnLEKNvofl9iKMEqOqeWxneOId2uofPFFUrfOziGHTNyciHTMHWWBg8A5sUfK
 0Rn0I/MZJY82eJK3JfUJPFCbecRlT3WegZdFndHolumtLnfUkxX3kCUGuwvt+EZBHVFfWt/9eb3
 bUrzcsFHHYqy/YeJRNC/wV3c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b1c979f2108c0cd3;
	Sat, 05 Sep 2026 12:18:26 +0000
X-Mizu-Trace-ID: b1c979f2108c0cd3
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH RFC v2 6/6] mm/memcg: filter out reparented memcgs got
 from memcgid
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260901-bingfangguo-memcgid-rework-v2-6-8edd7f7a7251@tencent.com>
Date: Sat, 5 Sep 2026 20:18:03 +0800
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Bingfang Guo <bfguo@icloud.com>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3F681C23-8462-4BA3-B3C6-B7A45A9341DE@linux.dev>
References: <20260901-bingfangguo-memcgid-rework-v2-0-8edd7f7a7251@tencent.com>
 <20260901-bingfangguo-memcgid-rework-v2-6-8edd7f7a7251@tencent.com>
To: bingfangguo@tencent.com
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 1, 2026, at 16:58, Bingfang Guo via B4 Relay =
<devnull+bingfangguo.tencent.com@kernel.org> wrote:
>=20
> From: Bingfang Guo <bingfangguo@tencent.com>
>=20
> mem_cgroup_from_private_id() looks up the objcg that owns the id and
> returns the objcg's current memcg.  After reparenting, that memcg can
> differ from the one the id originally belonged to.
>=20
> Callers such as the list lru and workingset refault code expect to get
> back exactly the memcg referred to by the memcgid, so check that the
> returned memcg still owns the id and return NULL otherwise. In this
> case, make list_lru just skip and workingset tests use the root (as =
the
> comments said in workingset.c:460).
>=20
> Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>

We should move this patch earlier to avoid introducing the problem first
and then fixing it later.

Muchun,
Thanks.

