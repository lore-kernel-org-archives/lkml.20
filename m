Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1D4D7D58
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717539; cv=none; b=PY/N6p8ernhdNLaaG1oxR12A1KYXqLMw4mG8uqD1Z7ZxXAyVjVRhRYz6Su1pszb9CFB+ikprXMlcIQVlFSUNJZPv4Sk1qt3WDp1/jn0/yU6mxdJ5mX5JgW6mMeUWndx9DnswKQXuAVoekGBFwZtV0Nkz/34OfEXBnAUKwnXCPIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717539; c=relaxed/simple;
	bh=OK+EpHpi4poGy0QL/33jw6ruvWFS1a881nUPOmEBxzI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=prx2NcNjnRGuj3Ce80ZdlQIHuNjScv/JK2Ox/tp+lmxI3haMAY4DNDB4kiS122tAZ+IUNah3pRPbQMeondB1uM+zlIZrb9eCqyUbmbJwv0Xw/tVbQqlDkfSmyKICGtbXQZmGoCeFMDdhvVcNMdNBN0YKtSPmVLJVoR+95n5enRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=D3vyCbxH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D3vyCbxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068751F000FF;
	Tue, 29 Sep 2026 21:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790717535;
	bh=bV1wlokKdVHLqPHNGwe/7vIopeMXy+gYUFpopQWEIt4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D3vyCbxHxJQ+aX1/mUxGlNGRXygGdhx3UDqmwRpHjeF9SrqNpUku1TQDoU18Eju+A
	 Uvj+PN6PuV8lgvO1Uo60ys6S+sVxEDTN6T7mEYU3V9canHRrMkOUhO9Qkzk7wqeFeb
	 v6vUPVcDn5zBCzMO6qK/hPO0ApMIFdNMFlbEMsgk=
Date: Tue, 29 Sep 2026 14:32:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport
 <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, muchun.song@linux.dev
Subject: Re: [PATCH v3 0/6] mm: Unify device DAX and HugeTLB vmemmap
 population paths
Message-Id: <20260929143214.9061bcf284369163192968d1@linux-foundation.org>
In-Reply-To: <20260929053231.66085-1-songmuchun@bytedance.com>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 13:32:25 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> This v3 is based on mm-new commit 2ddb90ee544a, which contains v5 of
> "mm: Switch device DAX to section-based vmemmap optimization" [1].
> 
> This series is split out from the earlier, larger series "mm: Generalize
> HVO for HugeTLB and device DAX" [2]. While the parent series generalizes
> vmemmap optimization across HugeTLB and device DAX, this subset addresses
> a single, self-contained step: unifying their vmemmap population paths.
> 
> After the preceding Device DAX conversion, both HugeTLB and Device DAX
> describe optimized vmemmap mappings through memory-section metadata and
> use per-zone shared tail vmemmap pages. The generic code, however, still
> carries a Device DAX-specific population flag and compound-page population
> path, along with arguments and helpers needed only by that path.
> 
> This series first removes VMEMMAP_POPULATE_DAX and moves selection and
> reference handling for the shared tail page into the common vmemmap
> population path. It then removes the generic Device DAX-specific
> compound-page population path and routes section vmemmap population
> through vmemmap_populate(). The powerpc radix path continues to use its
> architecture-specific compound-page population implementation for
> optimizable sections.
> 
> The remaining patches remove the unused ptpfn argument, open-code
> vmemmap_populate_address() now that no caller needs its returned PTE, and
> add a warning for inconsistent zone initialization of shared tail vmemmap
> pages.
> 
> This is the fourth smaller step toward the broader HVO generalization.
> After this series, HugeTLB and Device DAX use the same population model
> instead of parallel generic paths, while powerpc keeps its
> architecture-specific implementation.

afaict the whole series is "no functional changes intended".  Apart
from [6/6]'s new WARN_ON.

And [3/6] is the one which could cause unintended fuctional changes!

Thanks.  I'll queue it.  Reluctantly.  We're up to 688 MM patches this
cycle and it's time to stop.

