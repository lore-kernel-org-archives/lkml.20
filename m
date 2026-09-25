Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970E1EBFE0;
	Fri, 25 Sep 2026 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339118; cv=none; b=W8EKzzGnkWzVSY7aGoUNp1havNOPubxRshVBn6bFthDFuBVDgagR7HknYjhO7HIcXyi00yaXG36TgmhIinQop2q9niBn1+EJ8jGg2anTkrnVMi85T1QBMP/q6ghcmxs+iA/TwfsRrelLC8yxQfoG0TJJV2jMjbCnAjCkwIVu7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339118; c=relaxed/simple;
	bh=JCgnCvcKVsUZGrAO57CLAcI9YQpX8ZSZY22q8GU5cMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAzUcFs2IN7tP3REfQqxkgY4CrzhGwX26h8Fqjv9GzOnt0OHuuvLcuMkVFT3YOMuj199i/HL7nXfeiZNRmfcBo8jfWiSzuHbjQUC6ivvRldkB9/K93OyhrfGkUrKj1CrXTN5VHBeU3ZPkw3J0ezsQfiiJoeGg8LqvLP+JMmie08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuxNTmDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuxNTmDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295FC1F000FF;
	Fri, 25 Sep 2026 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790339117;
	bh=pVULUEXez1WbsKogCQF+NXH+CdUvjoOCba6Mjip/S3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VuxNTmDdLrgXTka0KkEdNQlwznHECnKpoJiZYDqVZ6YeMsk4upvaAOJEGMw1JAJ95
	 /lJ7eoFe3U7un0e04MDnnxCisI+gkPCqmvs5guVXEpsAVu0hy6WQr3e+Q2zsPOsQjo
	 ZbFPcyqEiZODzygcEGyZT4px4xpBhQYsnaJE1J0vL0qmzIZZyUzMswSn07hL4CM/QL
	 XQtk9s193nvOWj4yTzvZ/EOLC9Lyejn0Yd2IksrQycHBT9IJy6/dVFnHkxAP6Hoqdk
	 KAz76F+iw1F0xKf9E5DMjP/4Wq+cOgEiFi6CNiSmokwT+0SE2HscFFcLJhkhYM8P3P
	 37dLCQQJWDjUg==
Date: Fri, 25 Sep 2026 13:25:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Hajime Tazaki <thehajime@gmail.com>, Johannes Berg <johannes.berg@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Ricardo Koller <ricarkol@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the uml tree with the mm tree
Message-ID: <arZnyHpnr3cl1uTD@gremlin>
References: <arZg--vlHZ0LAzKg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arZg--vlHZ0LAzKg@sirena.org.uk>

On Fri, Sep 25, 2026 at 12:54:35PM +0100, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the uml tree got a conflict in:
>
>   arch/um/Kconfig
>
> between commit:
>
>   f56266a653013 ("mm: make userland page table freeing RCU-safe")
>
> from the mm tree and commit:
>
>   626ff2b34dbb7 ("um: allow deselecting CONFIG_MMU")

Oh nice, nommu UML coming then :)

>
> from the uml tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/um/Kconfig
> index 94b8ff70f578b,59d62c74fc41f..0000000000000
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@@ -44,10 -45,16 +45,15 @@@ config UM
>   	select HAVE_SYSCALL_TRACEPOINTS
>   	select THREAD_INFO_IN_TASK
>   	select SPARSE_IRQ
>  -	select MMU_GATHER_RCU_TABLE_FREE if MMU
> + 	select UACCESS_MEMCPY if !MMU
> + 	select GENERIC_STRNLEN_USER if !MMU
> + 	select GENERIC_STRNCPY_FROM_USER if !MMU
>
>   config MMU
> - 	bool
> + 	bool "MMU support"
>   	default y
> + 	help
> + 	  Turning this off allows a nommu build, say Y.
>
>   config UML_DMA_EMULATION
>   	bool

LGTM thanks!

--
Cheers, Lorenzo
