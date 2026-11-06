Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974613;
	b=QJoagLyhDfkU9P6qJOo9Vt8UR9EZBK7q8yBYJ/K7uBAFObcAg+bslcUW+mDKMTVc/y9s
	 vmUJVt+SLtBPCi8U9cS+mzYK78IqCqcNu+3UMFLcLpMOtHjtpknCh47lTE5+9r0kaEEkS
	 2qvycyK3YdFgdZsH3al2ENUavu4+zTMTQbdm3+SR1IIXEE++aH71F7SrzE/dtSMtvru7S
	 I12SR8oumUFecWbOPgbm/Eu9RYonVtzPtlfBEPQ5Gzxc7yrz3KxWWdiLyZrGsOZfChZex
	 fefBhx8juoC+WzcxR36l+QfKlnfzAbDxQ6c2F422l8JYLUZSDZTfbort3VPlw16p42g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974613;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=YbRvJ/bHp76KL1OEmDU1Qb2Rcrg4+B3yQbyXLRJ6Aio=;
	b=i9wNw1rRdoagQbNjObMxOkMt3B2+l+jSSH3wBBgj6Dw+ASAys+HAz6gHtGZATzgfk1aW
	 VORGalHfL2z1IuuG7qCW0lGglY18MT/ZLnYNRcuMcOZXg71XnPjMP0CcprOpJzmDlsDqv
	 F5UZunEP1gI6ZDv6af94yEe0UjEnR5/XDC7TFCHicKZJiGGoKidOBM5ad1O3exblPFjMb
	 2B6BLYkLhsHz9u0IXtSs59v9ogSXVopyYIFvk8XE6QF/wFv+rWKyePXkDJArScQam7orQ
	 Ats1sUd6LezXDUni9/lvqPi8yaBjaRbtHs1HCD78Ke6cG6sBMCFjjtYEvK9zvzq9Ytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYBPV1og;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F2F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYBPV1og
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BA81F0089F;
	Fri,  6 Nov 2026 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974613;
	bh=YbRvJ/bHp76KL1OEmDU1Qb2Rcrg4+B3yQbyXLRJ6Aio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DYBPV1ogE/bLXFI/8qugY9boxyNnRkJH+vF52rmefXvV9/QtYzE1/KEfal3C83Lk+
	 1VGRfkAn50aP4TDwE/JvkrNWozXJZHTH3kUOrLzMz5r6H2Si+PQZ0TqT1tPm3h1lC2
	 JC2q3PMIhh/mDUYhZDdIn46r6BLMibxIE/GkzVArcyXyKz768NeS+D6Vu0Yag9jgrP
	 mCWj1YQE2jhqfNg8Vh/spK5An5+Ri2gm0l/tfp/l80FnNr+aXoHb5dFeJc8J7qpjbC
	 nTeymdjQymInKOj9IF1oMLL08Zf9AC6xLU8e5d9DdWtvOSiTXsr4+NVrfeT1N2vMzq
	 LBDliO+OLOEAg==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Joanne Koong <joannelkoong@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>, 
 Usama Arif <usama.arif@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 Hugh Dickins <hughd@google.com>
In-Reply-To: <20261019230646.3510790-1-joannelkoong@gmail.com>
References: <20261019230646.3510790-1-joannelkoong@gmail.com>
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the
 lruvec lock
Message-Id: <179397460737.8873.12735484060049239618.b4-ty@b4>
Date: Fri, 06 Nov 2026 15:16:47 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Mon, 19 Oct 2026 16:06:46 -0700, Joanne Koong wrote:
> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> folio_unqueue_deferred_split() on folios where the refcount has dropped
> to zero. In these paths, folio_unqueue_deferred_split() is called with
> the lruvec lock often held (move_folios_to_lru() always holds it and
> folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
> in the batch except the first). However, it's not needed to hold the
> lruvec lock.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm: unqueue deferred split folios outside the lruvec lock
      https://git.kernel.org/mm/core/c/8c38bf2a

-- 
Cheers,

David

