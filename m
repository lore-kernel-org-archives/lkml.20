Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50AB211466
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788484540; cv=none; b=LQZtJDBi2lkQsKEj6aHt3rtO41g00hGd1dWQCsD5jxdAHhv11FN1KIF6abkx7jQfvEAwwIR9qr8CRErMPbZ97uyKz1FQKMyPCslFagvyiwPO1gKYWEznzl8eOPbF4fKeKN+o8REmK0Z6FRjymYS3hGafRvFIZAFD/jmi3kHMjTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788484540; c=relaxed/simple;
	bh=mI9pvaE/FRcTcfV+pCma8+jWfpyaJos11MXrPgSNWhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nx1gt/Zj9hX+NNfiE5wLygNLmRRGnw/mbGTbRjMY9VGsX558WJZ6H20nmc+QjKCXIhDJJGPYDmH26jLneVu43JLRM0YsmQNbjxuOQJ85Y93biv9aS+wgquYJwpmb14BiErvJB06PCyVOozOVwod0eQGU+AovZI2iOggFbpovYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evNIiaW9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evNIiaW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5E61F000E9;
	Fri,  4 Sep 2026 01:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788484539;
	bh=uwQWCswQTfAMG2NQ0yeJBjoZGXNcITOCNLa8T4X83UI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=evNIiaW94EMcLuuA9J3Fj8ZT01CrnUAhCCd3lBbs+LCJvRtrvRg7Uzuk/R7bInvAz
	 3W+bATDKjxlc0+saV+FREDXw8HkavdZnQJ9SQnqk7JRfpjDi3C38Try9xnvh3cBe+z
	 Tl3nnrZci4Gd+DavHIKjHJN73CwKtmVMceGx4k6De28SeI+cA8rGEzJRNp03eYNXA+
	 kYYpoxtSgaVg5EsHoxjLbgRXKxfgRKce9TtFutFDCqkE023ZloAHdDFt4dQmIwmBrt
	 H1JfFI9Y2qXrYAmYi2TgV2udezEklOf5hJ7xe+5Sr0TBvjpXsDQbx/HCtHATKSce0O
	 yVD5q1XodMeNg==
From: SJ Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memory: fix hugetlb_zap_begin() call in zap_vma_range_batched()
Date: Thu,  3 Sep 2026 18:15:31 -0700
Message-ID: <20260904011532.61272-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903173540.e8f660dcaf083946417cba3e@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 3 Sep 2026 17:35:40 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Thu,  3 Sep 2026 17:00:26 -0700 SJ Park <sj@kernel.org> wrote:
> 
> > Commit f1fc44daf618 ("mm/hugetlb: don't lock private resv_map during
> > final unmap") added zap_details parameter to hugetlb_zap_begin().  But
> > the hugetlb_zap_begin() call in zap_vma_range_batched() is not updated.
> > As a result, build fails as below.  Fix it.
> > 
> >   CC      mm/memory.o
> > .../mm/memory.c: In function ‘zap_vma_range_batched’:
> > .../mm/memory.c:2308:9: error: too few arguments to function ‘hugetlb_zap_begin’
> >  2308 |         hugetlb_zap_begin(vma, &range.start, &range.end);
> >       |         ^~~~~~~~~~~~~~~~~
> > In file included from .../mm/memory.c:48:
> > .../include/linux/hugetlb.h:253:20: note: declared here
> >   253 | static inline void hugetlb_zap_begin(struct vm_area_struct *vma,
> >       |                    ^~~~~~~~~~~~~~~~~
> 
> You cleverly pulled during the ten-minute-window after I'd pushed this
> out in order to pull it onto my build-test-machine.

What a timing :)

I just found you pushed the tree again, after dropping the commit.  I confirmed
my build setup has no problem with it.  Sorry for making this noise.

> 
> There's probably a smarter way of doing this, not sure what though.
> 
> It doesn't happen often - I usually only need to push/pull the quilt
> patches (25-new).

No worry, indeed I never had this situation before.  And this was never a real
issue for me.


Thanks,
SJ

[...]
