Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400813;
	b=bqvfPL3csNiG1bncDbRhZ3rTHKsqi0bGGzhCSOnhspI0QwXCR3K2/+jg2JAQ0ko+U7S2
	 zQ5/pa+Sj3NsGA60jFHoNBxrThWMPPC2SsQyWMA5eBHgrI5/WUvplmGCez/q1FDRgIyLE
	 6noKKDp5hm1tbAi5AABilFuJHJYWLnMJ8vgiDIvIARyM70+4hEeTLZ4qvPiwqa9g1Di8H
	 9gSGRVGU/Nf8i/a7HGahkAD816sdLMSJGuOkbbJ4yh06ZJSYzs+ULorfZ6D4BzVbS7AI9
	 ULu3IpaM5PlBvls84ZM40+jD7vxGP8qY0KJLKAhOUGcyx/FHNU5VOQw5eF9v5d3UWXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400813;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qgplpSXFt9kNZV/HSecSD7mDG6E06HWpXDTh4/+g358=;
	b=EnjJeHVuCzCMFsume7IKL8RHCa/hU6QIF/oGMP1nzs8X5gdTvZHqDByHc6nkJ5W7MaJf
	 5lDzS/oEqPJI3L0Pd5w/N0sjGHK24b+AcigY3n4RnzSKIMTLGLvNbFGvV2lSqYhNaLFhP
	 j2bjyUxEujiJnOs2KM/EPxHjA+4ianVFI7owEJHigYiF5XxS5cl9XymI5G0SBRlreeWpI
	 +EhdJ3vKQ+zB7zsT3dSEpBZFuzKd7AspoEZn1pOQArkGBFROAQw6xsbzpPva9GK5pDQiO
	 kOI9wt5gRDMZYWCRCICI1Vl+uNPaLFI/6KYpXoCLsIBRPLn6o7JSvDLJ6hCH+YYJqMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b="i/OUSg5+";
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E643F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E643F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=i/OUSg5+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qgplpSXFt9kNZV/HSecSD7mDG6E06HWpXDTh4/+g358=; b=i/OUSg5+TWZLA3ta+dWabCdJVi
	jY05z81FkSAAcSbMoB29HH0MA37UEyYshhkkQgNWPlCbrxAb/v4xM4M/M1SDmLsCBIDKayH18b/7i
	U+sIAp+35gY2bayXcIthW38UCXVTVqbbmebLp1h+CMkep3t2A5U2Y/utsr5bZ+C+xVZIqYRvtZJ0l
	zDBoSXGAoD+cGGObD8w9k7oHYQdD0uFAcVoF92iCT68qZ7MQ+Bgotwsz6iA2UdzP4CHb1K6Q7jfMb
	11YO7tO3KrUSX488TbUxn0euCie3ZRlbCNgHtPYZk5+rKUocYl9xcNPQJrHDeDbP619XQNF45ObDQ
	ZiYmtjGw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7cV-00000009pUo-101v;
	Wed, 11 Nov 2026 12:40:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C10C8300969; Wed, 11 Nov 2026 13:40:06 +0100 (CET)
Date: Wed, 11 Nov 2026 13:40:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Pedro Falcato <pfalcato@suse.de>, Borislav Petkov <bp@alien8.de>,
	Bharata B Rao <bharata@amd.com>,
	Hrushikesh Salunke <hsalunke@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Message-ID: <20261111124006.GI2668564@noisy.programming.kicks-ass.net>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>

On Mon, Nov 09, 2026 at 07:15:51PM +0000, Shivank Garg wrote:
>  static void clear_contig_highpages(struct page *page, unsigned long addr,
> +		unsigned int nr_pages)
>  {
> +	unsigned int i;
> +
> +	might_sleep();
> +
>  	/*
>  	 * When clearing we want to operate on the largest extent possible to
>  	 * allow for architecture specific extent based optimizations.
>  	 *
> +	 * clear_user_highpages() (and primitives clear_user_pages(),
> +	 * clear_pages()) do not call cond_resched(). That is fine on
> +	 * preemptible kernels, where the scheduler can preempt the clearing
> +	 * at any point, so clear the whole range at once. Otherwise, clear
> +	 * one page at a time and reschedule in between.
>  	 */
> +	if (IS_ENABLED(CONFIG_PREEMPTION)) {
> +		clear_user_highpages(page, addr, nr_pages);
> +		return;
> +	}
>  
> +	for (i = 0; i < nr_pages; i++) {

FWIW one could do:

	for (int i = 0; i < nr_pages; i++) {

and forgo the earlier variable declaration.

>  		cond_resched();
> +		clear_user_highpage(page + i, addr + i * PAGE_SIZE);
>  	}
>  }
