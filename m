Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23804A0141
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048242; cv=none; b=Xm8BNGV9njZbbQ3N5A49BN348fIgHziRDuWTpzKRzNwiwioB3Tyy1J1VhVrQxGKFROARGMAYYtyuJ2363X33iFxjmVdCSDtkO6DrffVqP9VCc4MpffO+S8R3aH/JosKDbjzWdPY+Iw6el+GtfnkcNy9sNGveX8e4RptwIO5ZCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048242; c=relaxed/simple;
	bh=Aknm2FKmjnrOuteUbfvKEDuvifc80MwIlVtoftv8mgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ko+zxEyh4YeH5udzUWKlJtPWA25L02Dwrxan5Eo4LQ4+RljxQsSQgHUcf5uIHqRgcCzDtSYZ/AWkp2Cma7kkRw5sYkxbNVUEi1PMiRADwfE06tIvHUrZ+hu8Xvz5XgMROUMTSCHJhdrIhRA749cCvZXe0v0iWjfVQJxzLCkOqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j00D8+5W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j00D8+5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81471F00899;
	Thu, 10 Sep 2026 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048236;
	bh=2Zyq+M8PkbCuol0oMRfsYKnJaMSeruYuwwQ+Za3eJWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j00D8+5WBvvgtePwmcUTZwR4/e9jpT6UAtMI2fuh6T2E2K/qQbB+NrWmtZtkevve6
	 P628D+mJt4eG1F46p3oSH3FmkM9ZreGsoBxKPr+UEonN/lktvXOOKV+OSLSblr6Gvv
	 nFIFoj9cIzsV9VKSq1smcUrIoKHLokLRpaq/tIlbe3AnyWhVv06uCY0F5CH7k3rV9V
	 xbZ8jPnKkUH6xCWCEC9jIa26pJOeLA7I1mFKUfaU7XPUAKGzX39aKiPZ74a0BF/+wi
	 CuD1Y4zG2v2k+y8srQVIu82NX4RiaR21voioo0Lzn8vtsLlIGM43OXjZE988H7GC6Z
	 hSTXsRIS2AOcg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3A580198003A;
	Thu, 10 Sep 2026 09:50:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 10 Sep 2026 09:50:33 -0400
X-ME-Sender: <xms:o7WiapMA5ZYLv0l1u-q3Q948NDdNTquzrCza38GpTucWddg-gkiFAg>
    <xme:o7WiajAWLh850YP4Dl5hCV6ce800SEVdqzdNFw4ZbeW1-IpUeP533TvtF2m2TCEUt
    NN5ff3HUKBjsqJ87eFUY08kkJXZ9QiJZtvql2BU2tWfYwROzbLZ7DQ>
X-ME-Received: <xmr:o7WiashDBVKK0Au7xbKcz9IaHDZz-ELoWkklmHj2W4_IkxtxhKia6wiMHVo>
X-ME-Proxy-Cause: dmFkZTGVBT71C7FGJ01T6J2UqH+Pi6wNZKGiTgwF7S9p/aCc0zCAXAuAMT/w3/NjT0H+7r
    7fm9ak9wYpA9hlu1uygj5ql4In2cxLpabYHyYjdRq4Ex09QbfWhwYkSlUWEiEgKDtFlk6E
    DKclzpl3GoADoRIKuxrLqLu7GHhh62DsLl2kTqbAAsipMyXMHV1I+aP0vA34B2aG8VHg0K
    3YFXtDtxd398gCYFU3vtCJWK9kir9GxrwKXs64iv7yMKNFLP+RLrDApV1kw3PY4ilySoxm
    r+mGzrL7lncFxihhj4CmZT7LwPmAgAQWUV5TG00b2op39e9fFzrAVDvVYP+koiS5eIOxaf
    kAB+AbhujOvkvSZHTmblWNjGtUeTnXowRYMfFTBAf0Ty0JmlfPwLKju26jupTYYyyyHLGQ
    EIy7bUWY+ekXNOf1jLx6+6yfibq9Fq7Tj8B9ob57uTKlVDYbdtn9MQ2RZCavmWjTlVAWlN
    1S4HeDEXt+KToZfW7hup78qC7dlSB/Co0S/+3f4mXzrrhu8nM6qXfDm7mIIubCxO3uDsPG
    1c1EVQMGPUMGfO0imDSXS//8tqxsQiDANNsdyb17XSemT9Kxp+hf0vrCUx//sqxk6V2DE/
    zEJwPeL8LDYLn64IHFe6VRdZV1BWeR3slFsBpRm+MEgh0mqZapdcRaZAKSUg
X-ME-Proxy: <xmx:o7WiaodoCCRhHCWSxmavRGtYkaYzJYKkPfChMHziTVVuCZrGexCTgQ>
    <xmx:o7Wiag3ljJ85hhKeoFRel9qlCTYVDm1s9CywIdUbF_NH5nFUVSFk5g>
    <xmx:o7WiagoiAWdDHfmcZst_Qg6VpEm0wCEdAKLj8GgVRoid-FMHxUiqeQ>
    <xmx:o7Wiaq5R7zggsCVfMakZkc8OwEVaxisUBMSsDcBXg6VrqZgwf68SXw>
    <xmx:o7WiaoW_pbmF3eyny5h1PeM8bM3RlT9iuVvY40Dblgakh02vu1wnsX9x>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 09:50:26 -0400 (EDT)
Date: Thu, 10 Sep 2026 14:50:25 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 	Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 	Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 	Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, 	Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Xu Xin <xu.xin16@zte.com.cn>, 	Chengming Zhou <chengming.zhou@linux.dev>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
 Chris Li <chrisl@kernel.org>, 	Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, 	Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>,
 	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, 	linux-kernel@vger.kernel.org,
 Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: Re: [PATCH v2] mm: implement and use vma_anon_tracked(), silence
 KCSAN
Message-ID: <aqKzUTPbh1qcKs4a@thinkstation>
References: <20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org>

On Thu, Sep 10, 2026 at 02:18:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> Provide a function to abstract the common task of checking whether
> a VMA is faulted in or not.
> 
> A VMA or mmap lock must be held when calling this function. For an attached
> VMA the transitions between unfaulted/faulted state are:
> 
>        Transition        |              VMA/mmap Lock state
>  ------------------------|-----------------------------------------------
>    unfaulted to faulted  | write lock OR read lock + mm->page_table_lock
>    faulted to unfaulted  | write lock
> 
> So vma_anon_tracked() never provides a false positive (the lock precludes
> it), but if only a read lock is held, a negative result must be re-checked
> with mm->page_table_lock held.
> 
> Detached VMAs cannot be concurrently manipulated as they are removed from
> the maple tree so require no guarantees.
> 
> Use data_race() to silence KCSAN about non-existent data races between
> concurrent vma->anon_vma read/write on optimistic fault tests.
> 
> Also while here, const-ify vma_is_attached(), vma_assert_stabilised() and
> dependants.

If you end up respinning anyway, this would be a natural separate
prep patch.

> Finally, update the core VMA merge/split, rmap, mremap, KSM and fault
> preparation callers which test vma->anon_vma directly to use
> vma_anon_tracked() instead.
> 
> Note that the lockless read in reusable_anon_vma() is doing more than
> checking whether the VMA is faulted - it is returning the anon_vma to be
> used on fault, so this check is not altered.
> 
> There is one odd one out - file_backed_vma_is_retractable() - which holds
> neither a VMA nor mmap lock and is stabilised by the file rmap lock only.
> 
> Therefore just add a comment to explain why the direct vma->anon_vma check
> is required.
> 
> Reported-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> Closes: https://lore.kernel.org/all/20260829100034.423064-1-trintaeoitogc@gmail.com/
> Closes: https://lore.kernel.org/all/20260909115723.528501-1-trintaeoitogc@gmail.com/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> v2:
> - Renamed vma_is_faulted() to vma_anon_tracked() as per David.

I don't particularly like vma_anon_tracked(), but naming is hard...

From quick grep, it seems you missed two cases of direct readers:

  hugepage_vma_revalidate():

      if (expect_anon && (!(*vmap)->anon_vma || !vma_is_anonymous(*vmap)))

  vma_needs_copy():

      if (src_vma->anon_vma)

Worth fixing? If it is intentional, add a comment why. I don't see it.

Anyways:

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
