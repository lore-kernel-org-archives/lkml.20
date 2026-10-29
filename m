Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280176;
	b=V/5cY7o5n+YT39yz4kR3ShuNdg56tKwFunKTkNSxrHIWfQbTDXDATwa4HMSJkglrunwF
	 3sge0t71h5/7vl5rD6IMU3Lz9GveWXWWIP4xPzVYsy2E2UO1f9k6vVCxd7ZHZaHRa6r+r
	 lAf9XbqKgnmTHY+S6gK5LMWY9bEhP5Jr7Yy6rOE/Qd6qXhoimUNYwajfrXI68La0lyg6i
	 mwReSz5uGQHK1u/hELna9irDBoNRGV69Qrl+RtpbYkCXv3JlWcwiLtUTQc52kmOe5PhHd
	 sQpTad3UVLbd7HKlzO29swDosFZoxMjatAhUXCz7f3WyFtLhFapKIyWKPZTrKWZy1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280176;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Gui9u4L/xQbNvRRjjqLlR7DBCWjTZcYwuZrUrCknkHc=;
	b=J+uPq0kHIsgw+jLVgcaaSqB2f7Ap0WZCrWzREt0xvO4z38dZ+56ePKmhj25BkyqF36+Y
	 mtpRZfgLOV0wnLRyPtjaymKdvvCFRjFm3mRii1ULEVwcSnrff9V72To+wuBjEKCK8U/bi
	 SN9KDmgcVs1y3x25ZJkUg1L8cd3AK6ub7LG9jnXBHDaSy7oYyKzmgaY8Ihv/rLbzf/V0h
	 Ywqs8Eh8ZHh+O52wlk/WguiUZ2ddFgrrOn6ltOufrx7QkdgqSDm2hCgIXt3FtJYXgHXZ1
	 JkodIiOGY5fzgHFK+FSxI0UhNa2lBV3NJFtzoaYjf423uoE81AgqL8oU0NbE1UKYSYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBcAXdVT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71028606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBcAXdVT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09161F01825;
	Thu, 29 Oct 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280176;
	bh=Gui9u4L/xQbNvRRjjqLlR7DBCWjTZcYwuZrUrCknkHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RBcAXdVTzDlQEdHvHcfy5u8SoDIYRNYoD+l06R5dEr8IiRSt1SUOgl5Ln3W1xQkRJ
	 9LCvLzzfHpYLQdKcNxw+VEwRkSCWnK2rbKwhSJF/OP9srEmBXOU9cpVFjQgZ2KdbvY
	 +4QSQaP3c+8pntVFa6bRe5u7sMIXQwwXCpNoo/BUj/JKLtnZMVuvgmNRoz4SfXLP3r
	 WN07RgB2nY8y6SilloaZLjeVqFfitSLmJzD/FoSlPgrcgfone6fxT1SapYvF9FZ8IJ
	 gREQLWU1DoQzVBwWORiVWI+354MM/fB16oY7FDSXN0u2pRKwtTRGh2uFQvA+SZoOGM
	 77RAC6TMjYTGA==
Date: Thu, 29 Oct 2026 14:22:48 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Kaitao Cheng <kaitao.cheng@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Frank van der Linden <fvdl@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH 3/3] mm/hugetlb: fix NR_HUGETLB accounting for unused
 surplus folios
Message-ID: <auNIqE_Zz5AK6-uj@localhost.localdomain>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
 <20261028113319.38544-4-kaitao.cheng@linux.dev>
 <auIORHr432BlmbrD@localhost.localdomain>
 <87146009-8E2A-467B-AAFF-8F79E9D5E32F@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87146009-8E2A-467B-AAFF-8F79E9D5E32F@linux.dev>

On Thu, Oct 29, 2026 at 11:21:47AM +0800, Muchun Song wrote:
> My thinking is that we should not use lruvec_stat_mod_folio(). Instead, we
> should use mod_node_page_state() and mod_memcg_lruvec_state()
> independently. In that case, when a new hugetlb page is allocated, we could
> account for it directly via mod_node_page_state(). The reason is tha
> lruvec_stat_mod_folio() also accounts per-memcg NR_HUGETLB; only by
> splitting the two can we minimize the problems introduced by accounting. For
> callers that need to consider memcg, mod_memcg_lruvec_state() can be used.

Ok, this sounds pretty compeling, and IMHO makes sense.

I mean I get the ideabehind this patch but it feels like papering  over 
the real problem.



> I expect that after some cleanup, there will be only one place that needs to
> handle per-node NR_HUGETLB.
> 
> Thoughts?
> 
> Thanks,
> Muchun
> 
> 
> > I will have another look later on.
> > 
> > 
> > 
> > -- 
> > Oscar Salvador
> > SUSE Labs
> 

-- 
Oscar Salvador
SUSE Labs
