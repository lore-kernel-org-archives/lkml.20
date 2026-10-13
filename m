Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F3F47ACC7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887604; cv=none; b=skFP4M0jgf64o3yRZqbf4ZRvMpRtvCOJSeOTHt4Iih4i134gO0zJuhfQq588f7r6P9/5ARcrXq1o/vWgrVa9sD8UGpTBmPHqK1pxenhen5n2LtvzRZPaznIahYq9wS6YD27cnyUgT05mgfcLVorleuYn5S9hr1FPQ7qPfbLImlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887604; c=relaxed/simple;
	bh=XzS7ZZaqQDXfcYnYL4PkBv95T37MmZj8GXp420YL5mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFOt1wpTvMkbRiaV0okC5vB3xSZoo7gRgTPBFkmWTYBEqY7EZ2v/bYcWxz1+HyS5mXjO4uFOw9CLu4UXP2pJ1ONc2p9Dayr8U5VKvVZMEiO/O/1IgYbvmVDc4iYTqu+LoT+TrrkOOtrl0WrD8i4tgi/e/yqFPfuPbiIAf5M5NSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKHPTuBm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKHPTuBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCF01F000FF;
	Tue, 13 Oct 2026 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791887603;
	bh=UFfNmiQ8uFdg5KDWX8jozlYpSU9VWRxyP54Yxnv2AEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jKHPTuBmLFZipjd9P4kREgUhXNCvJCeC2JaAU0iC/JBffENTSJaTkCZu7s981u7Uk
	 det8OEUxoTnC8iAQKoOaSIgcf6KGQXWjftcVGVZxviw8jds4C/5PHzbNy6VceuuE7z
	 js+VQ/jlz6s2zAY5fYrPzab0LyQsPk5m6vjpIxzE1rFqG3mywMVnKL+kjsHd4xcISb
	 h/k9nDaErnfi6zJjuqMY8rUGSUKpgwi6ruLawoqF61ZVJYp19sXUwQncH3+hYbfgEh
	 UXFgb5mGrfeEc5HkZmqzQKUDuLBsQ4UwI2UBAQDWgNuknib9mIp1606vArV28lOrJB
	 7Y0Xht+9Z2FbQ==
Date: Tue, 13 Oct 2026 13:33:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	peterx@redhat.com, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com
Subject: Re: [PATCH] selftests/mm: fix uffd move-pmd test crash on 64K base
 page systems
Message-ID: <as4I7OKld_XJbdb3@kernel.org>
References: <20261011163527.95988-1-zenghui.yu@linux.dev>
 <67c30e4c-3576-4ded-a71f-b49075ed42e3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67c30e4c-3576-4ded-a71f-b49075ed42e3@kernel.org>

On Tue, Oct 13, 2026 at 09:39:54AM +0200, David Hildenbrand (Arm) wrote:
> On 10/11/26 18:35, Zenghui Yu wrote:
> > From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> > 
> > uffd_move_pmd_test()/uffd_move_test_common() splits the test area into
> > chunks of chunk_size and moves them one by one.  On arm64 with 64K base
> > pages the chunk_size (read_pmd_pagesize()) is 512MB, which is larger than
> > the whole 32MB (UFFD_TEST_MEM_SIZE) test area:
> > 
> >   step_count = nr_pages / (chunk_size / page_size) == 0
> > 
> > Because chunk_size > page_size, the test then aligns both areas up to
> > 512MB, which points far outside of the 32MB mappings, and decrements
> > step_count, which underflows to ULONG_MAX.  The verification loop then
> > runs away and the first dereference of area_src faults with a SIGSEGV.
> > 
> > Skip the test when a single chunk cannot fit into the test area.
> 
> That leaves 64k untested, though? Why not adjust the chunk size accordingly?

To test anything PMD on arm64 with 64k pages we need to adjust
UFFD_TEST_MEM_SIZE to have at least 4 pages, i.e 2G :)

Maybe we want UFFD_TEST_MEM_SIZE to scale with the page size?
 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.
