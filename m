Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A9409266
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028080; cv=none; b=j4udnxxROYsX9a/Scj9rglZrUP1skmt2H+pXFEBrjBhzjP60pIwX+ndzPSf0S+298zxkBqbZq0neS6YRNAmGEw1+RxRl552mwyLXOSy+nCVNPLLtnDuJKRIZDYcJVcnqKMWSB5qHkQlioO+X9ayX7gqTQnp7htEGx9e1o4HtLKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028080; c=relaxed/simple;
	bh=mvf4tT3qyVQ5qSeR5/mA7bz6/OSaH7qJ1i9sSUmphc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjhETxXdGwFB2SJDgliHqRB9zclzMn7s35gMVV79EQxEXnFnyjnutlU9E1+ab3AyfrAyuPu2ZxGjAlMqD4BL411btCojNr3bkeaHdFmt6VC9ZULFcsdFOzyFiTFqJkj5SjooOtHvum7vo6cw3mP0w9veiXnY7XpAGezVPC0U2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRuWfG+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRuWfG+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86AA1F000FF;
	Thu, 10 Sep 2026 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028078;
	bh=mvf4tT3qyVQ5qSeR5/mA7bz6/OSaH7qJ1i9sSUmphc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GRuWfG+ERt4+xZknkajh3piUbexT6bu5syNLFw1uW5AqgAaw11neKGUjHKMvFgh55
	 BlknpZffvbW2Yyp62yTcwnbEtuLI8JV570rB194qwgZII1FQIB2tjyfHwKQA4JZh8W
	 1PnWW7gGmqgXxG60fpyqC3G0z9cphDtUzChBqXh5aAc82noNGUbbuaeiabrumyfi/V
	 5e8iZkpH8ELp6m8w8NIJYyQdlfqxOAbesXRgwTgIxojBOBDsr1zWBwN5D+OvKSyZYg
	 SB5WGD2GMVNhAaLVaphvBO6pRwDD1Sd7g97ybvGM/9LjxjaP32uZzxvdDYYYo1zun8
	 2GorJ5tXK8HRQ==
Date: Thu, 10 Sep 2026 09:14:28 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: Re: [PATCH] mm: implement and use vma_is_faulted(), silence KCSAN
Message-ID: <aqJmt_rQCTodhJuj@gremlin>
References: <20260909-vma-is-faulted-v1-1-3a701f48984a@kernel.org>
 <3a261c3e-4c26-41b3-b55f-5800ae1081f3@kernel.org>
 <aqGJx-uQjN8-DEBe@gremlin>
 <c1f21bf2-71e3-4537-a000-fd0e95257759@kernel.org>
 <aqGaNT1M-csCCQk0@gremlin>
 <58173517-fb38-4508-ac8f-ccffb299be6d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58173517-fb38-4508-ac8f-ccffb299be6d@kernel.org>

On Thu, Sep 10, 2026 at 09:46:23AM +0200, David Hildenbrand (Arm) wrote:
> >
> > Actually how about:
> >
> > vma_anon_rmap_tracked()?
>
> Or just
>
> vma_anon_tracked?

Yeah works for me! Will respin with that.

>
> >
> > Then it speaks to what anon_vma is actually for, the fact the VMA has an
> > anon_vma assigned like that means it is tracked by the anon_vma, and it
> > abstracts the actual mechanism?
> Yeah, this goes into the right direction.

Yeah agreed!

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
