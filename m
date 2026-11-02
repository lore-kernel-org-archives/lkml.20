Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618629;
	b=vfiwBsDMv1d6PZIEltQYHGmSjnq7NqpX+BJlzQBqPrX4Ysw+hwTEhCfu1FLtdFrLLyvj
	 N4LVUdxSfEw6y4Z9Oda8uTd4qyUsMvfpIMivRSou02lGYdhOMm3Q7IvOBlkv3kUmvEzLw
	 rzuBwjDJNP4NgayxcyE0sMg3m8pjO9pJnFdgVTJZRtIDAHlpiyPMAt9fPOTHqjNiN0aPy
	 zX0awYP5wOXGbHur+Pj7PYhQVg9wF6lz/rAan2vETOxuT/VImIHNNE7erDj2kwUBjoHMI
	 jr8nRVKcbHfbjNotbVJrtrD/qIQy5engZAYZDYV29cvSoy1rf5mQ6Y8U82Gf3qTT0uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618629;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=n6NfCHnVx9kytp3OhQJ7dq15Lhd2bRs4v++E+zqaDh4=;
	b=AfKVP00ll0lo+6jn3yvVFF/gIOmjXFCLaqgveBDGskbXoaosmHxvYqQXa0UOo8IiZf7E
	 efEueF4PxnclZ/6iIERRAxs3k9eBtxpKh6T6cL35j8+L2E6VwxQ+aKQIIzHVHgGjuzyOt
	 OilHsxLd6vFOh8BPpmO5tvzO1spoiCzlc/ChkVyASo/VuKhqlKdaELzbf/SzqG6dS55XR
	 TAIIqulVQCG49LkJNwqhABogB/+ER29iaR8HLvs7/fo2qgWk+WTFtSWJC+z6u5RwoUrOa
	 2bHI3X7smVJr2xJZ0OxoflpVAZZPwpjj9N+TiCnnR5lj8bigipWOBURr6mMNZ8UEHeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=caGB6z+V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5FD606C40C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=caGB6z+V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4149A1F00A17;
	Mon,  2 Nov 2026 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618628;
	bh=n6NfCHnVx9kytp3OhQJ7dq15Lhd2bRs4v++E+zqaDh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=caGB6z+VcMlU0pEGChtAWc15s+WU9ArcVv9YatmCUi8uxOx3lVEPKgiy8v/0qiOQd
	 uuGx4N4CrPIdYuShMm3MgDqO0KfP1tOzu72sWRYLVbVZ4ZTJ+7fj2nmOwHFwCgQhCr
	 embqWcQJKQnvvi3DkQSTBfoTNJa/Rc8ziZ15Xlc7UlspvmTCzoFOUHd/paznqwBFYf
	 GlAZ3PbmZTrqASpg2gFC+V3CHnlmFOPxFZoKsGrpbgtQmhbM0O5EiV474mltPxz8wl
	 Y4UkFg70o8tuSsDAVOOdwm08fvbyXTxK/KEEXXGM1FpdMvrFN2kt4AnUTwB/+YJr0M
	 lwawhQE9bPO4g==
Date: Mon, 2 Nov 2026 11:23:43 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, akpm@linux-foundation.org, 
	xu.xin@linux.dev, chengming.zhou@linux.dev, aarcange@redhat.com, riel@redhat.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/ksm: avoid anon_vma UAF during page merging
Message-ID: <auhyO_ZZ5fFYvjOi@gremlin>
References: <20261031182256.40205-1-zhaogongyi@bytedance.com>
 <79820b33-7e74-4e12-926f-1e03987d7bda@kernel.org>
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
In-Reply-To: <79820b33-7e74-4e12-926f-1e03987d7bda@kernel.org>

On Sun, Nov 01, 2026 at 07:11:25PM +0100, David Hildenbrand (Arm) wrote:
> On 10/31/26 19:22, Zhao Gongyi wrote:
>
> Hi,
>
> thanks for the report! CCing Lorenzo.
>
> > KASAN reports a use-after-free in page_address_in_vma() while ksmd
> > merges pages. ksmd keeps a folio reference across an mmap_lock drop,
> > during which mremap() can remove its last mapping and free its
> > anon_vma. page_address_in_vma() then dereferences the stale pointer
> > from folio->mapping.

Fun fun. KSM is dropping the lock then assuming the VMA doesn't change.

I want to take a different approach to this fix so I'll take it over.

>
> Do you have a link to the report or the actual KASAN report?

Thanks, the attached report is useful.

--
Cheers, Lorenzo
