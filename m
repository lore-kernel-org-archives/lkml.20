Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962363;
	b=HmXB03XjxnL0itKLWaOBWmUb7NF399lfVOXveSeaVvOU568hJGC1qHexKAJLGtIJL83w
	 C6PcFk4c/fAq5g4nurwfszFn9SU4jubl0E8bN016Zy5a5Vw2zAbIU3i2j0qY0d19TLhIA
	 9luiQ7vNzOX6n+f8PExTqYA6WPu8HfMR5IHRLfcyDW0kCOeTzz8vdJT0hmBoK7bBZfSLP
	 BvlQCY+XnvvLkl7qhjPOEav6Pqc55zxMAJn7y25oA0PjrGreSG9dxrJA3+ZMec4rTcy4Q
	 OyPYqwlQKdLEQeXoJos6nW6VpDHQzxD0uq8toNN5yMF6pE7BIdsKfgkMMNMW9Kcwlsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962363;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IipRvfPIMKelf4OlAzS0rfpJdyGEHggDGJZF0EnJ3IA=;
	b=oqM5aZLjoX4ZYN9gV7Jvpf+fLPZbobMSTCe9KZXfa2bjbGGK72a+1j2eZ5ztD55cdi+W
	 VrWwpvFEVaTY8xZq5fIr/A9QO2wb27SQDTU3bB3gjXXrlw5wfAn091lpqCAIEhkEfbxwF
	 vILa3dN77/ogWeY5UW6GafhOwi+YWNwDT6NvSNyZZ4KxS+gaxDtxfA35shMngay+W8RHc
	 c5Mqs/j0AkWXIC0etDoaibbe2aC0WhVpHKMJYFGTaFQsv/pEEwnjDnpz6+L5uWgGq++up
	 RrC0RG3iRlfNCa7BCJUEdLt0kWZuEvpuIASH7lkHbwRaPpBgxMxXPDyxrrwqPMp6Xag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1KHYVFy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64924606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1KHYVFy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6151F0089F;
	Fri,  6 Nov 2026 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962363;
	bh=IipRvfPIMKelf4OlAzS0rfpJdyGEHggDGJZF0EnJ3IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O1KHYVFygZZchPdjIwJte/lvHxpw2lNPlReMb4MMCSMUsNgNbaCXBSI9Yxkg6dHie
	 LNURJoc7p6V9oLGlFhJpjUNCR3k25Oj8Th22ywgA72JFQJ6m9rARKrxIKNgZ4r+owm
	 f5KdKMUFVUSAxv6ChwixgB2HD8i1YGJv+x+VyeCfXIFi+7iInPzfgnqj56VGACpfCH
	 FelX1NyVxb6H/spDXbm2vzujlj4ffQakN8rW9Wm9QSHmirLzsVskLmji1AXSNIePv0
	 GVuGb1hq8lvPhCUoUpqZi/yXzOfHyHilXX836cltlW4vQ1lqueQNTXXCIwj3LjTZWe
	 zIoDeDIqU/KFQ==
Date: Fri, 6 Nov 2026 10:52:37 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <au2xMK2bKlpYsE_Y@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <a6333eb2-d51f-4947-bde6-f61ef52efb69@linux.alibaba.com>
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
In-Reply-To: <a6333eb2-d51f-4947-bde6-f61ef52efb69@linux.alibaba.com>

On Fri, Nov 06, 2026 at 05:38:27PM +0800, Baolin Wang wrote:
> >   		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
> > -			/* Unable to collapse, skip to the next candidate. */
> > -			mm_slot->address = ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> > +			const unsigned long next =
> > +				ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> > +
> >   			cc->progress++;
> > +			/* Check for overflow. */
> > +			if (unlikely(next < vma->vm_end)) {
> > +				vma = NULL;
> > +				break;
> > +			}
> > +			/* Unable to collapse, skip to the next candidate. */
> > +			mm_slot->address = next;
> >   			continue;
> >   		}
>
> IMO, these changes seem to belong in patch 2?

You're right, will move them there on next respin, thanks!

--
Cheers, Lorenzo
