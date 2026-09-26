Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541203998AE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790415122; cv=none; b=amw9pwETel2/gYCjJ1LBLEMGRRUpsVGiMO6VZ3BeP2MCTYil8ma3VphzH384lU8YFIhFT/OeZpdVhgyBgcYx0y0zWOJKiwsoq5gD0jneqogUcgLGPOKfHAydYeJMt2h5dcfddbvqqbU8Mc1AH8vF82zTdAV+HqFzBBIBOFx8E6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790415122; c=relaxed/simple;
	bh=XUA6PmnmNfxhkKLl66bVCoyIvZyJI8uTp8Eabm0lh6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GZtCnnGGiQFE8Z51adD773ji+gm9bVzTMBC5zcXFaTXtMEBaJOwcPjpoRFr5E32g+Qoe9GZ7pYCqY2ZU8FfTYLBxYCSx39HODZrdAop4+FSAQrHk78+4m3OxTFiDEItKQdJ7ovYPXr6wAl6MNqX80aMmXRAtki3ZgBrOvjz4feI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5QPVHkb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5QPVHkb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5727C1F000FF;
	Sat, 26 Sep 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790415120;
	bh=aahV+yzdFExMYzQQ+dk85KZLNDS7wQg/3/bXdqkAuRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K5QPVHkbO0pFLaCwEOWX/lc1IEnhnMfFx2Tvwe9TgoOqETu+9ttswGq7skYIVlyTk
	 vM5UiMK+EADQGe3DrTxeY2XdszOTw1m7zLkuQlLFkF+kjSuQIIcFWmeaqc5M7x0r1F
	 NlP7zcAg7LLrSwxBWhqhDHbvxcssDrfOUPD7nmF9E5o2Z1iJyKC2gMljqaLCeVbNWx
	 q55RQmOacgCAOek1cnAlt470FG6VjJsLjVZRUKzqwULlIbeXvVvNLTxmlDE0PX3Pqd
	 Ls4l3QW875CN/xouc33gBcC4fyAIVk6J7uFPYjqVRsS3zZ86/HzQhloBm8TBEcA2HO
	 hd8JhY9X7bmaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] memblock: use binary search to locate candidate
 regions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tarun Sahu" <tarunsahu@google.com>, dmatlack@google.com, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Mike
 Rapoport" <rppt@kernel.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, "Pratyush Yadav" <pratyush@kernel.org>, linux-kernel@vger.kernel.org, dev.jain@arm.com
In-Reply-To: <20260926092448.4090401-2-tarunsahu@google.com>
References: <20260926092448.4090401-1-tarunsahu@google.com>
 <20260926092448.4090401-2-tarunsahu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 09:31:59 +0000
Message-Id: <20260926093200.5727C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mm: commit message falsely claims O(N log N) worst-case complexi=
ty
--

commit ffd047af563941b5aabcd86a52d569f9b40c01ec
Author: Tarun Sahu <tarunsahu@google.com>

memblock: use binary search to locate candidate regions

This commit introduces a binary search helper, memblock_bsearch_start(),
to optimize finding candidate regions in memblock_add_range() and
memblock_isolate_range(), aiming to reduce boot-time overhead during heavy
memory fragmentation.

> Under heavy memory fragmentation (such as KHO page preservation registeri=
ng
> hundreds of thousands of disjoint folios), scanning from index 0 on every
> insertion and isolation results in O(N^2) complexity, causing boot-time
> memory retrieval to take several minutes (~268s for 393k pages).
>
> Using binary search reduces the worst-case complexity to O(N log N)
> (and O(N) for sequential appends), cutting KHO memory retrieval time
> from ~268s to ~50ms.

[Severity: Medium]
Is the claim of O(N log N) worst-case complexity mathematically accurate he=
re?

While the binary search reduces the time to locate the insertion index to
O(log N), the regions are still stored in a contiguous array. If disjoint
memory regions are inserted in an order that requires inserting into the
middle of the array, the subsequent elements still need to be shifted.

Looking at memblock_insert_region() which is called during insertion:

static void __init_memblock memblock_insert_region(...)
{
        ...
        memmove(rgn + 1, rgn, (type->cnt - idx) * sizeof(*rgn));
        ...
}

Because this memory move operation guarantees the worst-case complexity of a
single insertion remains O(N), wouldn't inserting N disjoint regions in
descending or scattered order still result in an O(N^2) worst-case time
complexity overall?

The described KHO workload sequentially appends regions, which avoids the
shifting overhead and achieves O(N) overall. Could the commit message be
updated to clarify that this patch improves sequential insertion to O(N),
but the worst-case for fragmented insertions remains O(N^2) due to the array
shifting?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926092448.4090=
401-1-tarunsahu@google.com?part=3D2
