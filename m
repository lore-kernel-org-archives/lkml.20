Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793774821;
	b=OzlmcmWeFDXcIIhX2bTB3VxoX9AA0WBpUzN/O2D4nI+ZxglCJJkubx5fTWzj91qPGB0X
	 ny53c7vO5R/PvdVLmRlltwxqoa9We+XwQP4SkfV1DYgp6N4shuTZRjKpAD7ptvTOYdsHl
	 QAbyMDPxywkAWCw87/uvH+KQowsqQH9z5ZQVKiRKfLGsSXZrFMmPpJgN69TCPNrGtDufV
	 OMWAcheuD6bU1C6xfR2vfBrR81F6b53pT5jNej+pjWZWdSvOi69uQVl9BELAwNHTO0URm
	 /jsYOzZxeCj2UgC7zE3C0Y5cssrMgPXK7BjI9/kT37BiWQ0igHdtHVtS/6v3B2UMpXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774821;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Loz+p/M+jnoTqP1meBOYhbLrzGt57kks0nCU6EVr6Kc=;
	b=koRjnaLBVfKZevPJhGOD7tDmPhFiapIK/uJrm+nNO0OXXxYHk3G6lJmJPF9/YtRQXO7W
	 5/T0Z/tclJzF60MwFT4OcpZGntmJIp9IR4khJWfz2u9ONYZVr/279Au9lXGE0iChWdvZX
	 +JllJUssAhTdJPrIztCXNgWBRzJ6LGk4+1T8zNf1fXp6/dTLmUM8OXgL+TPWxe0LK1Q5q
	 Lo1olsfhzj3/W1OY64qt1zjENk6PrOTtZ413K6XNOF5YKLx/HSGab3qDGJ4+gLl25v9jO
	 u5ylGee6oByWw/V6dvh38Trh/4dHoTZCDweCMK0IRRjwxBHfpqPT2DRiD7EqMWhaqMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=N61KI5CH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2747C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=N61KI5CH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD731F000C1;
	Wed,  4 Nov 2026 06:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793774820;
	bh=Loz+p/M+jnoTqP1meBOYhbLrzGt57kks0nCU6EVr6Kc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=N61KI5CHDe5LYICh8Hl7RuN6JYH6LTql8ZDpZi22hXl4MpiUlrkCjGBsiQZSHWlzo
	 mHeYonZ58J/bQsegiSWgsVj+OLQqMLqAeW6Jh9ro4bGT+mFRthY8lY+D1Gd7GvIMH5
	 gKMuF9KmLOFzxBLpvY5VmInAAASKNPLMOkM7DFoI=
Date: Tue, 3 Nov 2026 22:46:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, Qi
 Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, James
 Houghton <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] mm: Decouple folio-based vmemmap optimization
 from HugeTLB
Message-Id: <20261103224659.2865b9ff27d09994949edd78@linux-foundation.org>
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 10:34:58 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> Hi,
> 
> Section-based vmemmap optimization is implemented in sparse-vmemmap.c,
> while folio-based optimization currently lives in hugetlb_vmemmap.c.
> The latter is tightly coupled to HugeTLB-specific state even though the
> underlying page-table remapping operates on one folio at a time.
> 
> To make these interfaces easier to maintain, the folio-based remapping
> mechanics first need a boundary that is independent of HugeTLB-specific
> state and raw address ranges. This will allow the mechanics to be moved
> into a common vmemmap optimization layer alongside the section-based
> interface.
> 
> This series establishes that boundary through three folio-oriented
> operations, each with a distinct role:
> 
>   - vmemmap_optimize_folio() optimizes the vmemmap backing of a folio;
>   - vmemmap_restore_folio() restores the vmemmap backing of a folio; and
>   - vmemmap_pteify_folio() converts the vmemmap backing of a folio to
>     PTE mappings.
> 
> Together, these operations encapsulate the address-range calculation and
> remapping mechanics for a folio. HugeTLB wrappers retain policy decisions
> such as eligibility, optimized state, batching and TLB flush handling.
> 
> Patches 1-8 generalize the underlying vmemmap remapping infrastructure by
> removing HugeTLB-specific assumptions and simplifying remap control and
> resource handling. Patches 9-12 then establish folio-oriented operations
> for optimization, restoration and PTE conversion.
> 
> The implementation remains in hugetlb_vmemmap.c for now. A follow-up can
> move the folio-based operations into the common vmemmap optimization layer
> once the interface boundary is in place.
> 

Thanks.  I fed this into my evolving LLM-controlled testing setup and it
said

: I tested all twelve patches together in an x86-64 Debian VM under
: QEMU/KVM, with 4 KiB base pages and KASAN enabled.
:
: I grew the pool by 64 two-MiB huge pages and drained it again. With
: vmemmap optimization enabled, the kernel released 448 vmemmap pages
: on growth and restored all 448 on shrink, in each of three cycles.
: With optimization disabled, the vmemmap count stayed constant. I also
: faulted in a single surplus huge page. It released seven vmemmap pages
: and restored all seven when I unmapped it.
:
: I tested both boot-reserved and runtime-allocated 1 GiB huge pages.
: For the runtime case, I grew the pool from zero to one, drained it,
: and allocated again. I mapped the page and wrote and verified a byte
: in every 4 KiB base page. After unmapping it, I demoted it to 512
: two-MiB huge pages and drained the resulting pool.
:
: All twelve programs in the HugeTLB selftest group passed, including
: the cgroup reservation, fault-charge and reparenting tests. Both
: soft-offline cases passed, as did all twelve poisoned-page read test
: cases. I saw no HugeTLB warnings or KASAN reports.
:
: On a diagnostic build, I failed the head-page allocation and, in a
: separate run, interrupted optimization after three PTEs had changed.
: The trace showed rollback restoring the two tail entries to distinct
: backing pages. The folio remained usable in both runs. I also failed
: restoration after three of seven replacement pages had been allocated.
: All three were freed, the retry succeeded, and the metadata count
: returned to its starting value.
:
: I configured QEMU with two virtual NUMA nodes, each with two vCPUs
: and 4 GiB of RAM. On each node, I forced the batched pre-split to
: fail. The trace showed the remap splitting the same PMD and completing
: a range flush before replacing its first PTE. Folios on each node
: shared a tail backing page distinct from the other node's. I drained
: each node's pool in turn and verified data in a live folio on the other.
:
: Finally, on the kernel without diagnostic hooks, I grew and drained
: both pools during active page-cache reclaim. Over 40 cycles all 640
: folios optimized and restored, and the OOM-kill count stayed flat.
:
: Tested-by: Andrew Morton <akpm@linux-foundation.org>

