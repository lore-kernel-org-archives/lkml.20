Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A86406834;
	Mon,  7 Sep 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766042; cv=none; b=dpl06pNesRHgjrmxbwJDN7ggG63en3CkU7TfJP3tb+QWPrWIqTMXu3cm/lUhbXO4Dxfe1RSfw+o/4GjEoK51dkI60vVIh9KfotmTTYOdZqaR82NylQ+nbf8iqdgHC3ro6N3IZHRpvqoDBjY9vLQKwEjnjZNpltjoHaW44x1pzUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766042; c=relaxed/simple;
	bh=sl0tLdkhp/SX5dcOoHZyYQeZFVQfUhXi9XWBUC+Z34g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGppTuByADg/EFWz8714/rW5NxGhQDorvFxt42LQtmwKoTLpBdQNJx2Sek2PQz7tjbzpd7TIJ+D93t23s88LHRw+cobXhMDYjffMg/xWVwpv3AmSu3TvzCMKKKJt6ZuEnnfYSJMtHrNnRbu0CNyxuOtZv+/01ctHHHGhNtQjWH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaxCEAdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaxCEAdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61351F00A3A;
	Mon,  7 Sep 2026 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766041;
	bh=DJZ2ds+Ren32Zxnv+Y2iOl0ccIRLQlyRg2ueg6Z/dX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kaxCEAdxYg9CRE8pfmp7dmb4yrOXZ0ZC0VXTl4O11IZ+vnzTAaLoQnEYBG8txsJd7
	 0egL71T1O2BcU6hLS/M/KYtDjOCrh0b87Q+9Kbj61wVyC2iOPMPCdzhaE0c0TAaWyY
	 u58yA8ZSSZz3aUxOesafDwytF8H5ivSl+ZGX/pcche0IbTsucjoNdxKsDBZGARFrdC
	 HQsMMdwfZnaubqShkZv3kCPIousAWG8qeWPtl3U/QHH/y8k+d22Onf6Bysru0Bx6t/
	 AirDXD9d0Q1nkCw+IoNjKrHpCRdC0RXTuKzCvB/9Z6l6vslhBzAXX6KLGxlHZZT4y3
	 q0Mva3MGcidjQ==
Date: Mon, 7 Sep 2026 08:27:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Randy Dunlap <rdunlap@infradead.org>, SJ Park <sj@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] docs/core-api: memory-allocation: clarify when to use
 kzalloc_obj and kzalloc
Message-ID: <ap5nTcKoDyiybuxH@gremlin>
References: <20260907063654.2248617-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907063654.2248617-1-rppt@kernel.org>

On Mon, Sep 07, 2026 at 09:36:54AM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Make it abundantly clear that in the most cases objects should be
> allocated with kzalloc_obj() and buffers should be allocated with
> kzalloc().
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

LGTM so

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>
> This applies on top of "docs/core-api: memory-allocation: add
> k[mz]alloc_obj() and clarify kmalloc" series
>
> https://lore.kernel.org/all/20260902-docs-memalloc-guide-v2-0-218c1a4dcb80@kernel.org
>
>  Documentation/core-api/memory-allocation.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
> index 823f7fa57429b..648222b6c8576 100644
> --- a/Documentation/core-api/memory-allocation.rst
> +++ b/Documentation/core-api/memory-allocation.rst
> @@ -23,12 +23,14 @@ answer, although very likely you should use
>
>    kzalloc_obj(<VAR_OR_TYPE>);
>
> -or
> +if you need memory for an object and
>
>  ::
>
>    kzalloc(<size>, GFP_KERNEL);
>
> +if you need memory for a buffer.
> +
>  Of course there are cases when other allocation APIs and different GFP
>  flags must be used.
>
>
> base-commit: d7dd88ed029164fe0a959e126d0ce18dd3719f89
> --
> 2.53.0
>

--
Cheers, Lorenzo
