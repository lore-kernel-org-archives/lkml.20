Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B344FD794
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739246; cv=none; b=J55qcxm13wPUcMVbEpmTWN7ELmMw1iI619IBDIFy/MZTs1BlBgFzkiMTcTpElPB7LVtvfdTROIVpFyInqABe9WpadaGWxqkX8M0fkJbg8SmzHyFg0LJuoedplH4pjiK1h5kIqWDauEAhGdyLe5CMycEBy1vR1haTacWr5T/KQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739246; c=relaxed/simple;
	bh=vRhekCbcc3+pAPZNXd8eQ0Vpow3bKuWj40H6tyImgyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWf6J0HySJy/fnIoYmMzBTBlCxkM8YvSz93fyAjUdTB3QUuWLI89tbbDqoNV62jodz5ldTx74OI03RcIPPxINd9LL2MJiWY5K3Smv3R5lxbwYAGlGctsSwKu43XhAysFd/CkbsN2o9+qJAycK+Cs4Ff211XefWZKM6kC1ur5TyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFxgHBw5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFxgHBw5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBDA1F000FF;
	Fri, 18 Sep 2026 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739245;
	bh=/62Itz9ZVEP0zggPXLCqWvGm+Y+VvQklNgINkbgT9M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TFxgHBw5WL1s4T0/X9Swei6eD4x4Z2OYGP+cC9STQoY8kz375zB/9zhqEA3d/XnAd
	 0wKyjB9TZGfdqdfVhbuSXnB/M+SI+XP58hhmyQ5E2V/ytQxA9s5nmP79DcU9zIqvq5
	 Dc7D3iDql6zv0Qhb/twW8G03PPJ/6mjh0Hp4UqdBh3iocoBvjP4TCbc2eSJ+IYYGMv
	 YJB29ic4HQny56fh+laAy9BrT631vFzEb+5TdeqIG/7k4s+/n9OaMchNPur7fs46el
	 FjK2YHZIIqfDcr9oGQQVnmqIBo5KrHcb1PP5ZUI0IDJL7/Kv/xNFsde0aojCvSHfT0
	 4RUrN4Q0AI1wA==
Date: Fri, 18 Sep 2026 14:47:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mm: update comments to refer to anon rmap rather
 than anon_vma
Message-ID: <aq0_uROeGtsyVJgU@gremlin>
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
 <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
 <aq0dInU5aaJN_eMa@pedro-suse.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0dInU5aaJN_eMa@pedro-suse.lan>

On Fri, Sep 18, 2026 at 12:31:50PM +0100, Pedro Falcato wrote:
> On Thu, Sep 17, 2026 at 08:47:43PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Now that vma_has_anon_rmap() abstracts whether a VMA has an anonymous
> > reverse mapping, remove references to anon_vma and instead reference the
> > anon rmap.
>
> Hmm, I guess this is where we figure out if "drop the anon rmap" or "insert the
> anon rmap" or "iterate anon rmaps" makes sense, language wise.

 Insert: vma->anon_vma = <something>
   Drop: vma->anon_vma = NULL
Iterate: iterate over vma->anon_vma

So I think reasonable-ish.

>
> Wouldn't the rmap be the map itself (e.g the current cursed
> anon-vma-anon-vma-chain structure, or in the Glorious Future your remap
> tracking tree)?

A reverse mapping is the folio -> vma mapping so a VMA can possess it or
not.

And the glorious future (TM) will have to track whether this state exists or
not.

In any case, if we change our minds on the naming, we can change it again very
easily in the future :)

>
>
> >
> > The anon_vma is an implementation detail and should be treated as such.
> >
> > Do not update mm/rmap.c which implements the anon_vma mechanism as it is
> > reasonable to directly reference it there.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Anyway, you're the native speaker here, so I'll let you decide:

I'm a native speaker compromising on the name I'd actually like to have ;)

is the least-worst alternative right now I think!

>
> Acked-by: Pedro Falcato <pfalcato@suse.de>

Thanks!

>
> Thank you for the series!
>
> --
> Pedro

--
Cheers, Lorenzo
