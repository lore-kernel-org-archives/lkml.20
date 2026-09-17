Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C8249F11A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638527; cv=none; b=L9IB10mtHcupv3TF8j17rNeqigNvEehGgCFN4U0Kcm3Nlr1FlD9P56iCmCM/8FMuUJHgnjlqiifkwCDNoUpYonWfUhnk/9Fr+MVkqH8oCGBAK59spT7VfpjJq4Qc47Gt3ptGcj+8TrUPui7Bog/DHMAGAfPfEu3nF1zuunfwcX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638527; c=relaxed/simple;
	bh=cvbrrCjlcJUDVupgfBYiXkVaVkcnO7ArmWsB4gBXvVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQxMp42tbPsld4sqVd6+Szuzwu88WmNwKPpUe1NdnR6H2nSBI62rjgxgFlH4YEcpPdIfVBh702LfWnoUbzxjK7rOARBoPSNvBcppkKgVgUrbtHJYlC+1LlQBwcGcolpU9xE4o86WAf3p9GMrNHa8FOggzCJ6hhgudr5WKIl9uM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXQbRdQb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXQbRdQb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58101F000FF;
	Thu, 17 Sep 2026 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789638509;
	bh=SSQlyaKBFOXmjTXXwb4CnAc04mzkW2ufkK1lWWnGyPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RXQbRdQbaMBgU589o6W6PG3uphqN8mz/5BLM7kb4FOOK2HUFAR93FxbAoJTEAO8Bu
	 eBoMaio317U16mMAW0vaD84KGV27INu10hhQohZWaKuKgfSOO3qZzptjmllqY/CUt/
	 IuuDdJMQ0mKaF3URDpMUpD2v9wmA5TOXdERqKfg6G4aBNbU+E4K218mD0RumAFV1Mt
	 COnZBQ1CMqCB/u9P+dkXryFycmkanLLTAJtGqNyQEtHTufZKXMU081Bw99vgtS9b0W
	 qM4li9bj33ALeGiPbwdYhg9T2fzZ9DGvn14y4LfOgNz2xVrwZu3cOup4lJ6KfrLH9o
	 JwkgKTsO8Aq7Q==
Date: Thu, 17 Sep 2026 10:48:17 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: Re: [PATCH v2] mm: implement and use vma_anon_tracked(), silence
 KCSAN
Message-ID: <aqu3VY-PgJQYJVHz@gremlin>
References: <20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org>
 <aqKzUTPbh1qcKs4a@thinkstation>
 <aqgQw6moAuJYCVw8@gremlin>
 <4b2c99f6-d7c0-42a2-bf9a-e85061d53c93@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b2c99f6-d7c0-42a2-bf9a-e85061d53c93@kernel.org>

On Thu, Sep 17, 2026 at 11:45:12AM +0200, David Hildenbrand (Arm) wrote:
> On 9/14/26 17:21, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 10, 2026 at 02:50:25PM +0100, Kiryl Shutsemau wrote:
> >> On Thu, Sep 10, 2026 at 02:18:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> >>> Provide a function to abstract the common task of checking whether
> >>> a VMA is faulted in or not.
> >>>
> >>> A VMA or mmap lock must be held when calling this function. For an attached
> >>> VMA the transitions between unfaulted/faulted state are:
> >>>
> >>>        Transition        |              VMA/mmap Lock state
> >>>  ------------------------|-----------------------------------------------
> >>>    unfaulted to faulted  | write lock OR read lock + mm->page_table_lock
> >>>    faulted to unfaulted  | write lock
> >>>
> >>> So vma_anon_tracked() never provides a false positive (the lock precludes
> >>> it), but if only a read lock is held, a negative result must be re-checked
> >>> with mm->page_table_lock held.
> >>>
> >>> Detached VMAs cannot be concurrently manipulated as they are removed from
> >>> the maple tree so require no guarantees.
> >>>
> >>> Use data_race() to silence KCSAN about non-existent data races between
> >>> concurrent vma->anon_vma read/write on optimistic fault tests.
> >>>
> >>> Also while here, const-ify vma_is_attached(), vma_assert_stabilised() and
> >>> dependants.
> >>
> >> If you end up respinning anyway, this would be a natural separate
> >> prep patch.
> >
> > Yup will do, Pedro also asked for this!
> >
> >>
> >>> Finally, update the core VMA merge/split, rmap, mremap, KSM and fault
> >>> preparation callers which test vma->anon_vma directly to use
> >>> vma_anon_tracked() instead.
> >>>
> >>> Note that the lockless read in reusable_anon_vma() is doing more than
> >>> checking whether the VMA is faulted - it is returning the anon_vma to be
> >>> used on fault, so this check is not altered.
> >>>
> >>> There is one odd one out - file_backed_vma_is_retractable() - which holds
> >>> neither a VMA nor mmap lock and is stabilised by the file rmap lock only.
> >>>
> >>> Therefore just add a comment to explain why the direct vma->anon_vma check
> >>> is required.
> >>>
> >>> Reported-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> >>> Closes: https://lore.kernel.org/all/20260829100034.423064-1-trintaeoitogc@gmail.com/
> >>> Closes: https://lore.kernel.org/all/20260909115723.528501-1-trintaeoitogc@gmail.com/
> >>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >>> ---
> >>> v2:
> >>> - Renamed vma_is_faulted() to vma_anon_tracked() as per David.
> >>
> >> I don't particularly like vma_anon_tracked(), but naming is hard...
> >
> > Yeah it was a compromise because David and I disagreed on naming (again ;)
> >
> > I think vma_has_anon_rmap() is a better compromise?
>
> Yeah let's go for that.

Ack will do thanks!

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
