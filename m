Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536968;
	b=e0VXMtR+eApAbTqb1GN/44XBGjhw5VesIZakiDdU178debxu1pFcqyEFh2sP1cyPQv3K
	 cE3lr5dMJQvTrfP7+fsf1pY2TvgSNXHYdsRJ4G8iZWvBiFWLqVvFvhTYSvY46/2uiwo6p
	 lNA8enxLRkN0GwiUsvWY29292vIz3ORn7VsWGuaFKKuQXamxijmsQuRkUDmjxoaPdf9F0
	 MgS3VF3eXAQ/abRdHTymJ7ELeyXgOwDTMOwvSyKp5SIMTvsofFJsm9BnNd2+dkjb5y8rq
	 i2RqXyrzxaRxy3vRcxu5zrl+nyEfEdIYb8UTUdCq0txcxm71GWU0Er9sVDFv/bILgxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3Raodpl8vL3TKabak0c6oEO9mzM/EGv53fn3bT+vKQ4=;
	b=WFvFT0gg34aLU6x1l0ZsBbFVqXU3E+nochJEQ289wfvqhDJdg9pr7ZV11aY1JaPH/T+B
	 7v/OY2YAxLA03m8ufJ7vYDRpExFWdlyuSTz9py6JRvPVL169BRj8dIXpmhhrHC3S3iZ/v
	 1PM52h9jTMV8ZzmUfDw22mYF1ackFlkByROBBCfmYqESeUqplti46jl3ImwoNEzTZcfvL
	 U7DQk8yffFNS72ja4EseMAhkUN1x06R4ZC9e9pfLmxST+4h2lQdesdtny06PTAKB/GdAZ
	 1biyJJFlXVtIEXdS5ASsoP1RoJkCFQPDcjFt2vEKTyLxqJhxi2nFP6OcSeftSenpyOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DpNmXlrE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFB606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DpNmXlrE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373D81F000C5;
	Fri, 13 Nov 2026 02:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794536967;
	bh=3Raodpl8vL3TKabak0c6oEO9mzM/EGv53fn3bT+vKQ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DpNmXlrEQvDVvglPuf+1xK3d6VyatMSOfSp9Nwd5YSKyaYMcPJWknK9bPWrRtfmPO
	 E8D3nr1+eAAKcqnnr11SLSDjXz6zjLjdh1BKIUK+Fz/hh8KxeOoSlwhPCeQ3HvexuB
	 M2Wp4WK/bjvmjZCNWalm7fFis28J5dMyDNUjFYNo=
Date: Thu, 12 Nov 2026 18:29:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Eliav Farber <farbere@amazon.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau
 <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 <x86@kernel.org>, William Kucharski <william.kucharski@linux.dev>, Vishal
 Moola <vishal.moola@gmail.com>, "Alex Williamson" <alex@shazbot.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] mm/huge_memory: don't warn when a page table
 blocks a huge pfn insert
Message-Id: <20261112182925.6ce741ec3584e9401ed94238@linux-foundation.org>
In-Reply-To: <20261112051440.16140-4-farbere@amazon.com>
References: <20261112051440.16140-1-farbere@amazon.com>
	<20261112051440.16140-4-farbere@amazon.com>
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

On Thu, 12 Nov 2026 05:14:39 +0000 Eliav Farber <farbere@amazon.com> wrote:

> insert_pmd() and insert_pud() treat a non-empty entry at their own level
> as a leaf and compare its PFN against the one being inserted. A page
> table installed by a concurrent order-0 fault also makes the entry
> non-empty, and pmd_pfn()/pud_pfn() then report the PFN of that table,
> which never matches. insert_pmd() warns unless the entry is the huge
> zero PMD, and insert_pud() warns on any mismatch.
> 
> A VM_PFNMAP mapping with both ->fault and ->huge_fault can produce the
> mixed orders: an order-0 fault installs a page table over an address
> while a concurrent huge fault on the same address reaches insert_pmd().
> Changing an mm's THP policy while another thread faults the same PMD,
> for example with prctl(PR_SET_THP_DISABLE), is enough to do it.
> 
> Compare the PFN only for a leaf entry. A page table is not an error, so
> take the existing out_unlock path, which returns VM_FAULT_NOPAGE and
> lets the access refault onto the smaller entry.

Thanks.  Sashiko says this fixes a cant-happen.

	https://sashiko.dev/#/patchset/20261112051440.16140-1-farbere@amazon.com

> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")

But that's because Sashiko only considered f9e54c3a2f5b.

It seems that DRM shmem and Panthor and mshv pass FAULT_FLAG_WRITE and
can reach the warnings.

So... patch looks good but the Fixes: might be inaccurate.  

Fixes: c6f3c5ee40c1 ("mm/huge_memory.c: fix modifying of page protection by insert_pfn_pmd()")

might be better.

Also, we don't want current production kernels to do this so please
consider adding an explicit cc:stable to the patch.

