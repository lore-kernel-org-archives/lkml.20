Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC90B1A6806
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890860; cv=none; b=eanHgsxRUnyTHmPMOmyNCsPQFX/DTejIs7VegPmLeuQuReBV1Qp5fjAsVZiZ3xQnJ+RLNk00RWzGCbQgXyqHXLq67qYI7w4GYrN0ANp1t2TexRoqVQcQZbVnxvaw9uS+jpPRBQcOJdq3jGHK1DlQL8fOfisNmBPTdsctNI/2tzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890860; c=relaxed/simple;
	bh=Fpj/D1+n+MtEOOr2BiKuEo2/UxpLlUdcI8LnwOsahQU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TwLVazmxAGsy6gndqgWKOk5MbND6dZiMRnKP12d0jSbYy5MuOHCd0+J1COH2t1HkhmCNvW0rPXHcNRjoeAaHW6ZngZWNzVQD+FbjtBWgH0hsd3qYtV7AneHC0tSRrluRf5XUzetVsya8qkOl8voowyuskpkd9EzaT8xlOiay9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zjLx3msp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zjLx3msp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14971F000E9;
	Fri, 28 Aug 2026 04:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787890858;
	bh=Ms9ElGpndu/p4gAL+/SKqDdyKJI1gRddTa0Oo3jugRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zjLx3mspMsqvC1HC1b68Q2TAPPBiegAYK1vMXjHWbHsBl6g/VajdsK5FR+eAyvi1F
	 h9ITZW4jAjHz3Jf/1OaOPRdXpT2i0FRvzG+vdptj0x7fqAtE3Fd9WftVeStw48HUK7
	 y785cuFytGJWnBqFNF+dHyeUqtyv5WtSX/XEmMzQ=
Date: Thu, 27 Aug 2026 21:20:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, David Hildenbrand
 <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko
 <mhocko@suse.com>, David Laight <david.laight.linux@gmail.com>,
 "Liam R . Howlett" <liam@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v5 00/17] mm: Introduce section-based vmemmap
 optimization for HugeTLB
Message-Id: <20260827212057.37cf374d95450d325e5fce63@linux-foundation.org>
In-Reply-To: <20260825084608.47437-1-songmuchun@bytedance.com>
References: <20260825084608.47437-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 16:45:51 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> HugeTLB vmemmap optimization currently has its own early boot setup
> path. It pre-populates optimized vmemmap mappings before the normal
> sparse-vmemmap population code runs, and sparsemem carries
> SPARSEMEM_VMEMMAP_PREINIT only to support that special case.
> 
> That makes the HugeTLB vmemmap optimization path harder to share with
> other users of sparse-vmemmap optimization and leaves a fair amount of
> HugeTLB-specific boot-time state in the generic memory initialization
> flow.
> 
> This series introduces section-based vmemmap optimization support in
> the sparse-vmemmap code and switches HugeTLB bootmem pages over to it.
> Instead of having HugeTLB pre-populate optimized vmemmap mappings
> itself, HugeTLB now records the compound page order in the corresponding
> memory sections. The generic sparse-vmemmap population path can then
> allocate or reuse shared tail vmemmap pages based on section metadata.

Thanks, I've added this to mm.git's mm-new branch.  After -rc1 I'll
move it into the mm-unstable branch, and thereby into linux-next.
