Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324462;
	b=zEc7wbP3rvCEWwa3oxZtWjPPb7ROwwDTwJqxZglGZrvFCOFzTLRlek71QKeDtVdfagIh
	 v0jn6AjkR8Lq+H0rSe8Sm6FL3rS5iuWlH1ZEkuwrBfcvt2+0IacOjDMCllEZY38aRndgi
	 3c4a+BsFG58LWfaBb+mDnOVc1CkF8j+JsRbjdtkc6nDyDArhXj6Mm94LEP9Xnw7lnGAwJ
	 RzFOEoZs0KEuzwF8hQbbbV4nDqjs/mrQcorOVAuBI/4nVczP/FJIf2zKpjhULKbpeeYbY
	 Bk1555i87IY2Zs3NiD0SyddunBgdBQ3epuzYF7sTosS7DB7zgnLL4cMkBSSzJmsOx3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324462;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aBOpD08FcZgUdX6sSVHpe8Q+9Wl4ICsDP/3Nx2bwfmI=;
	b=siLPXYPHzdUlah+Sr8r4PGQjyfCQ6iiT1HWOLPLPgWr2a3q3cL4s8HGv/xqfDzLoVxdC
	 +HhUZ5JMQw6qK2D9xfl9uwi6DBj6xw7cYM9RlhZJ098qfom1qGzp5YaLxQfllcimgkCmE
	 TKm3oajJLFsgDX1V1faStJgCV31fnpFl/Kylp/0gkKkSdsv6lEoZygum2gC9x4b6bVTHB
	 MaWqipHGwG/tJLEdSb3KsN7EQmk7Pr1W74zlm0g4uTbP/zVO0lik633zBaaS8/y5VItmz
	 dWv6ivW6wpPQXwErR9yowvNT0TGZtpYYWrmxgfc+EmTvGnvvJBfIVfcpeMYOFj1DVSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OR+qLhkt;
	arc=none smtp.remote-ip=95.215.58.170
Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F2F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F2F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OR+qLhkt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gvY+EFrn3LUi+QbgDmol5Cy3h4iylPle2lZKtkPoW2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794324458; v=1; x=1794929258;
 b=OR+qLhktr1EIyaPLVAyrm/NiuXlWjGdVW7HFby/zGsMn7+heEFKgnhY5oqQIGGm8Uv2LKXJR
 3aLuSxxJcdB+NuBSZ8sLXvUyyMOxxUn9ohJwpqP8f7n+m3AtTmK+o4t5UG3iAPP9WeWKkhCQvpA
 RJ6Ak9Vea2mgI0vDcg/HGq8A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id dddf5df93d8bee57;
	Tue, 10 Nov 2026 15:27:38 +0000
X-Mizu-Trace-ID: dddf5df93d8bee57
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	jbohac@suse.cz,
	sourabhjain@linux.ibm.com,
	leitao@debian.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	zaslonko@linux.ibm.com,
	brads@mainlining.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory
Date: Tue, 10 Nov 2026 07:27:29 -0800
Message-ID: <20261110152731.2841707-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9d2d6f81-ceb7-48a7-99a0-18a0bb8c504f@huawei.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 18:39:34 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> 
> 
> 在 2026/11/7 0:51, Usama Arif 写道:
> > crashkernel=size,cma reserves a separate CMA pool. On systems that
> > already reserve several gigabytes with hugetlb_cma= (which is common in
> > the Meta fleet), the crash kernel cannot use that existing memory as
> > part of its working set. With hugetlb_cma=6G, requesting another 2G
> > with crashkernel=2G,cma brings the total CMA reservation to 8G, none of
> > which can serve unmovable kernel allocations.
> > 
> > Use existing HugeTLB CMA memory first for crashkernel=size,cma and
> > reserve dedicated CMA areas only for the remainder. With hugetlb_cma=6G,
> > a 2G request reuses 2G without reserving more CMA. With hugetlb_cma=2G,
> > a 4G request reuses 2G and reserves another 2G.
> > 
> > The full HugeTLB CMA pool remains available to HugeTLB and movable
> > allocations during normal operation. After a crash, the capture kernel
> > can use the selected ranges as working memory. The conventional
> > reservation is still required to hold the kernel image and initrd.
> > 
> > The ,cma option already opts into excluding userspace memory from the
> > vmcore. This includes allocated HugeTLB pages in the selected ranges,
> > which the capture kernel can overwrite. The existing dump completeness
> > and pending DMA risks apply to these ranges as well.
> > 
> > Have architecture code record the requested CMA size and perform the
> > reservation in mm_core_init_early(), immediately after
> > hugetlb_cma_reserve(). The HugeTLB CMA areas are then available for reuse
> > while memblock can still reserve any remainder.
> > 
> > Use the existing four range slots for both reused and dedicated memory.
> > Limit reused memory to the page-aligned request, account for dedicated
> > CMA alignment, and report any shortfall. Ignore malformed optional sizes
> > and reject requests that would overflow page rounding.
> > 
> > Suggested-by: Breno Leitao <leitao@debian.org>
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
> > v1 -> v2:
> > - Use existing HugeTLB CMA memory first for crashkernel=size,cma and
> >   reserve dedicated CMA areas only for the remainder. (Kiryl)
> > ---
> >  .../ABI/testing/sysfs-kernel-kexec-kdump      |  3 ++
> >  Documentation/admin-guide/kdump/kdump.rst     | 22 ++++++--
> >  .../admin-guide/kernel-parameters.txt         | 16 +++++-
> >  arch/arm64/mm/init.c                          |  2 +-
> >  arch/powerpc/include/asm/kexec.h              |  2 -
> >  arch/powerpc/kexec/core.c                     | 12 ++---
> >  arch/powerpc/mm/mem.c                         |  6 +--
> >  arch/riscv/mm/init.c                          |  2 +-
> >  arch/x86/kernel/setup.c                       |  2 +-
> >  include/linux/crash_reserve.h                 | 14 ++++-
> >  include/linux/hugetlb.h                       | 12 +++++
> >  kernel/crash_reserve.c                        | 51 ++++++++++++++-----
> >  mm/hugetlb_cma.c                              | 50 ++++++++++++++++++
> >  mm/mm_init.c                                  |  2 +
> >  14 files changed, 159 insertions(+), 37 deletions(-)
> 
> Should it be separated according to the architecture and framework code?
> 

IMO, the commit and change ins small and simple enough that it doesnt need
to be separated into different commits.


