Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D71C441037;
	Tue,  1 Sep 2026 03:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788233992; cv=none; b=phZTDmNmxzwkIv4a7I6pxBQ7dsNeF+7GaGRnyHm5FpT01G+aNBwakhO1KN4XloRKdPPsGJqtrXLnLUxViczgxG7m4YiglW9VFeCP4gMMqD+klRtQ3Cav3rtzzO/tO3fb8d6p7Y9MKxThRlutAQ57CsVRJ2vUcpB6yMpVvfeLQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788233992; c=relaxed/simple;
	bh=lVzE/Y5Ujhm7lVCVr+8GgXLRwqIy8bFz+sP5/64/TbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUZhNsc1rft8sgo7NCZrzKVivMTgPFhXQeliz83KxNuw4ZFwNjWdnGadNAFwgRhXmaNtqxzcOP3y0oH8Ui9aDhZyCqeMprEf55bolzkaxpUlO6MwTF0s58a3FvWJaB9zUxPMMKPE/Sl96eAZaEEIY/5MfyHjFaJWj8qhTX31rvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1ZOcW+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1ZOcW+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB231F000E9;
	Tue,  1 Sep 2026 03:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788233991;
	bh=AndJ4eRb4pdKGxDByf2P4c70B3XEzx3uFUPqOt3vFjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F1ZOcW+GX/q3zz3IfTc1ajde78AEI40EmdOEmSdDC8yoYz/3WIP7LXMYbvKXXG71H
	 V2ViaAn4YiOy2C2I4uuzOH3fQVI0ZzXdvQw9CAmoBVj46MN42yA/8OCJx5zHKMHKCh
	 0cgRHfOrzwC4kfbiFM4lkkalBIV6otkOGyhuQPIEtiYJz81oMdOWl1hxkfBYDlT5qk
	 49Icz/S6RNGEzEH7gr0W/ooStQAxRQhmwKNW79a94HulwkGzgXvZkI81HoLZZh5qEm
	 mDN0pu79DUTzFgPSIlYyVs0kLyJM+xt5W4cAvvBDT7RGjzz4K/PLbRwAIa4RjOKdNg
	 /jAdNNYGvcyHg==
From: SJ Park <sj@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 1/2] docs/core-api: memory-allocation: add k[mz]alloc_obj() and clarify kmalloc
Date: Mon, 31 Aug 2026 20:39:38 -0700
Message-ID: <20260901033938.91859-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831-docs-memalloc-guide-v1-1-547718c274c1@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 18:13:01 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> Since v7.0 the most used memory allocation function is kzalloc_obj().
> 
> Update hte memory-allocation guide to describe k[mz]alloc_obj() family

s/hte/the/

> and make kzalloc_obj() the first answer to "How should I allocate
> memory?" question.
> 
> While on it, clarify description of kmalloc() size limitations.

Looks good improvements to me.

> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: SJ Park <sj@kernel.org>

> ---
>  Documentation/core-api/memory-allocation.rst | 30 +++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
> index 0f19dd5243239..8ecfa4d35f4f5 100644
> --- a/Documentation/core-api/memory-allocation.rst
> +++ b/Documentation/core-api/memory-allocation.rst
> @@ -19,6 +19,12 @@ Diversity of the allocation APIs combined with the numerous GFP flags
>  makes the question "How should I allocate memory?" not that easy to
>  answer, although very likely you should use
>  
> +::
> +
> +  kzalloc_obj(<VAR_OR_TYPE>);
> +
> +or
> +
>  ::
>  
>    kzalloc(<size>, GFP_KERNEL);
> @@ -139,10 +145,13 @@ allocate memory for an array, there are kmalloc_array() and kcalloc()
>  helpers. The helpers struct_size(), array_size() and array3_size() can
>  be used to safely calculate object sizes without overflowing.
>  
> -The maximal size of a chunk that can be allocated with `kmalloc` is
> -limited. The actual limit depends on the hardware and the kernel
> -configuration, but it is a good practice to use `kmalloc` for objects
> -smaller than page size.
> +Since 7.0 there are type aware kmalloc-family helpers that let you safely and
> +conveniently allocate a single object or arrays of objects with kzalloc_obj()
> +and kmalloc_obj() and their array versions kzalloc_objs() and
> +kmalloc_objs(). These helpers only need the type of the object that should be
> +allocated and the count of elements in the array for the array versions.
> +
> +As of v7.2, vast majority of the memory allocations use kzalloc_obj().

As the commit message says "Since v7.0 the most used memory allocation function
is kzalloc_obj()", should we s/7.2/7.0/ ?

I also feel like the above sentence might not really needed, or can be
version-neutral, e.g., Since its introduction, vast majoritiy of ... switched
to use ... ?  No strong opinion.

>  
>  The address of a chunk allocated with `kmalloc` is aligned to at least
>  ARCH_KMALLOC_MINALIGN bytes. For sizes which are a power of two, the
> @@ -154,9 +163,16 @@ Chunks allocated with kmalloc() can be resized with krealloc(). Similarly
>  to kmalloc_array(): a helper for resizing arrays is provided in the form of
>  krealloc_array().
>  
> -For large allocations you can use vmalloc() and vzalloc(), or directly
> -request pages from the page allocator. The memory allocated by `vmalloc`
> -and related functions is not physically contiguous.
> +`kmalloc` always allocates physically contiguous memory and the maximal size of
> +a chunk that can be allocated with `kmalloc` is limited by `MAX_ORDER`, the
> +same limit also applies to the page allocator.

I initially thought if it makes look more consistent by using kmalloc() instead
of `kmalloc`.  But seems anyway we are mixing those here and there.  So I have
no opinion.

> +
> +Internally, slab allocator differentiates allocations of different orders and
> +delegates larger allocations to the page allocator, but for the users of
> +`kmalloc` family it is entirely transparent.
> +
> +For large allocations that do not require physically contiguous memory you can
> +use vmalloc() and vzalloc() family.
>  
>  If you are not sure whether the allocation size is too large for
>  `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will
> 
> -- 
> 2.53.0


Thanks,
SJ
