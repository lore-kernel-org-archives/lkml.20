Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961213;
	b=GsYw7S/G1OXz4ni9+H0NIjhyEyQ3Xl/0JDsWTYKDJxoNw5kliKXjxhe8Vtu1/QTrZBsR
	 ZXSHohLWdGnOEnTjdx7N8CI5m40DzTG0Hx0LmoLYAbGNZ7Xe9JXKHulYO4Os7HTFWGSEU
	 Hc1Bz4IoF5IRR2B9ci6zH0vTpOlZy3RrWwPVgykKlUMEa3C+q2q1CaBakBoP7+xf9b29o
	 3owblEqD1zlHb+Mc+i3rSaGArl4V2M1vE46Ib4yYD9kRqOFggWnBvzwb41c99eHp/7SJ0
	 N6dZbyNFGu3hP22FUIoUUMouSaMfJuoISHjMov7APKCmWf5oSzmQWc55Tyd5LzdIpqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961213;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q5rL/OHFjebg1wLzCka65mzT99/hbjQbazf5QBMxzS4=;
	b=DjirRIvnEzdpjE7Y1zoe5A/XmZDmoXxQBEjpYcnaeiBHgcALIIUrhvU8Lv28OMS0g9pn
	 UySY0JcENoo8tCgkEcTrwXZHBZfxETV/p3a3O75HjkaGGa9Vc6pPwG/zYnWNH4RzQM1iL
	 AYPgp5ORpfyRe95J3T17sILC0xqxb1pXr/2OPKAcRVQ+q7i81jhHa5U45KDy/TKRbgwgd
	 cZByNwXvwpeh0SP8YLAnmcNHsYtYqxC9qZH70ZgKAv/Dp3smjfzP3OSMCij1tjZAnFl8O
	 V+wGubpsQno5JD0buiNtb7gSCQgHJXgbc9WE9l4y1Y/azdypFR801N+uDxAcDGs6D2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpTYkSUs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC034606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpTYkSUs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669911F0089F;
	Fri,  6 Nov 2026 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793961212;
	bh=q5rL/OHFjebg1wLzCka65mzT99/hbjQbazf5QBMxzS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SpTYkSUs/REzgKMD7aXY4IOucPQLQqZc1nsQ5ceA5XxrllnWtc8VbVxs7QW5DN/o8
	 UyUVOTUwbZkpyy886dlbraxbWlv2EsUefqGVRjOFu3EpQbt1oBS19cr/1aceYy9CAs
	 2ZYRp9W14Y/lJWsogyksODEM9xgqnx2GsZMjuHEU/gvsilnkLNwg0zzOs/RYPZzmYe
	 TFr2yN+eXxyJQckYu6sopBnz78AwKvbrmiJdlWbjTzCk2xOGT1cCJK5kzTpzycRDkE
	 9qdmt0/8uLDXaOKexk9u7us6XXwHnjdCRt3kHeQNDf0UiWHx2nghxytSRxJa7OE/j6
	 AT/P5dzOMJkBA==
Date: Fri, 6 Nov 2026 10:33:26 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <au2sZrlidH_f39kL@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <551892bd-d7ca-4c79-9c7b-9d3d08c913e4@gmail.com>
 <au2lAPUNPlRtaeFY@gremlin>
 <5c084ac1-930d-40c7-b6d0-b56673da9cf5@gmail.com>
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
In-Reply-To: <5c084ac1-930d-40c7-b6d0-b56673da9cf5@gmail.com>

On Fri, Nov 06, 2026 at 11:29:00AM +0100, Jose A. Perez de Azpillaga wrote:
> >> with pages_to_scan below 4 the batch is 0, so under constant contention
> >> we keep dropping the lock at the cursor and never scan anything, don't we?
> >
> > This feels like repackaged AI review...
> >
> > The mmap lock won't be eternally contended and if it is, with pages_to_scan
> > under 4, I think that's fine.
> >
> > Alternatively could make that >= an == and the post-++ a pre-++ and the 0 will
> > never be hit in this case.
> >
> > Or could have a minimum cap.
>
> with >= a minimum cap needs to be 2, since the cursor can stop at hend
> inside the VMA we just scanned and the walk lands on it again after the
> drop. with == only batch - 1 VMAs get scanned per cycle, so a batch of 1
> scans nothing, today's batch-0 loop at pages_to_scan 4..7, and a batch
> of 2 hits the hend case. it's safe from 3 up.

Please don't copy/paste LLM responses. I'm sure it's in good faith, but it's not
helpful. I will run any changes through AI myself.

--
Cheers, Lorenzo
