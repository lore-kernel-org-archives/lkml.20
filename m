Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352643CE71;
	Sun, 27 Sep 2026 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538895; cv=none; b=AK0WAMAuxeEYtc2GEPG5sSKwAAe4LR+9WyiGYAjeOzmSWJ5vD+15wh565mbZARmEbT9Z2XHH/c/uDwIWPqvI56WavUmtZayXVtkeGrm81AjEhLMK/9LjBii5ax7SL6YgSNF9XqGAYldBJbFiLump/yQdiyzIMOs8p7VLDfahwjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538895; c=relaxed/simple;
	bh=LhI68KTLydITauvcFqK2EZYAkeR4lJMuUQpic5g/8a8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XMr8Tz9nc4QzSZuXcaKeTuSgeWawEHhZoxA4dQaISI+E/qzS8thL4GHNDNJfZvDkz+Y6YkjFpVRCp9Pd4L0GF91nhL/A4QtssG5lSoiPu/ngBNvozDG63GpG7+0Qizh/JREjDWFH3rW5rBLYg/bVpPXFKfJ8/z2GjeZfRI8Atu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yX64huLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yX64huLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAEC1F000FF;
	Sun, 27 Sep 2026 19:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790538893;
	bh=syrXrC34qOwYKtXT+0y34VtSNtk9nNOuE8xaaaEO4v8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=yX64huLrYBvawjHjNMziGPcDF408jVy97eCQhDGEdK9ruUIWtHuIYsE+mhNMfqt18
	 Nqxac4sU4f16KAf+zoUW04JYqXg33sc2tfOTTb0EWu8wdgVWka3mOOBCFT22odBp06
	 Fd3pMy/8/YX3DJSXlv/le88Lqf3alNmdUMlUep3Y=
Date: Sun, 27 Sep 2026 12:54:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>, David Hildenbrand
 <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan
 Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, Lorenzo Stoakes
 <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng
 <qi.zheng@linux.dev>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Lance Yang
 <lance.yang@linux.dev>
Subject: Re: [PATCH v5 00/12] mm: Switch device DAX to section-based vmemmap
 optimization
Message-Id: <20260927125452.0c1ec382905482841a4faef7@linux-foundation.org>
In-Reply-To: <FB00943F-8DB1-4BEE-BF37-701785DE2DDE@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
	<20260926225105.a56f29d76b2f496c8dc2dac0@linux-foundation.org>
	<FB00943F-8DB1-4BEE-BF37-701785DE2DDE@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Sep 2026 18:51:15 +0800 Muchun Song <muchun.song@linux.dev> wrote:

> 
> 
> > On Sep 27, 2026, at 13:51, Andrew Morton <akpm@linux-foundation.org> wrote:
> > 
> > On Sun, 27 Sep 2026 10:54:29 +0800 Muchun Song <songmuchun@bytedance.com> wrote:
> > 
> >> After the HugeTLB conversion, optimized vmemmap state is described by
> >> the memory section and the sparse-vmemmap population path can allocate or
> >> reuse shared tail vmemmap pages based on that metadata. Device DAX still
> >> uses the older DAX-specific population model, including a separate tail
> >> vmemmap page reservation and architecture-specific logic to locate or
> >> populate reusable tail pages.
> >> 
> >> This series makes device DAX use the same section-based model. Device DAX
> >> records the compound page order from pgmap->vmemmap_shift in section
> >> metadata before vmemmap population, uses the common per-zone shared tail
> >> vmemmap page, and drops the extra reserved tail page. The powerpc radix
> >> path is updated to use the same shared tail-page helper, so the generic
> >> and powerpc DAX paths follow the same reservation model.
> > 
> > Thanks, I've updated mm-unstable to this version.
> 
> Thanks.
> 
> > 
> > Sashiko asked a thing:
> > https://sashiko.dev/#/patchset/20260927025441.741633-1-songmuchun@bytedance.com
> 
> Sashiko said page->refcount can overflow by incrementing it over 2.14 billion
> times when mapping more than **524 TB** of DEV-DAX memory on a single NUMA
> node, where the pages share the same node, order, and zone.
> 
> I am not aware of any practical hardware configuration approaching this
> topology today.
> 
> Handling that theoretical limit would add non-trivial lifetime or
> architecture-specific teardown complexity. Without a concrete hardware
> requirement, I prefer not to over-engineer the current series. We can revisit
> it when such a system or use case becomes realistic.

OK.  Presumably it would be cheap to add a check for this craziness and
return ENOSOMETHING?
