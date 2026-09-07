Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDBE4CB8BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790188; cv=none; b=ePchLb3j2F2ywtCVGq9xMkJUFwtNkhVV1vjO3AN8I/hZ04rC53zZofD+4RPDM4w8oUX44T+hUHJc+wKTej4sSWhm793F8r9bqaPHABC8PwFshfv18Rmr3kJS7JxJoUIGPkllKSuQrbuvrFg/BFEB7MLI82IGrH4LC6cnQY9/eA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790188; c=relaxed/simple;
	bh=rTay0ynTtyuA1ni5GZkbgljkFVPS9BQkY1FUxVOnvak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U10yWdeum8XUGp5bdV8E0HPDMo6MvhxmAhtty5VNfCMtaajF6ApnzJ84DlTcCGokGfB9eqJ8rJNv70rc65VuWaOf6AcFOIUStW9KFoMO/3urr7avWH+CbUXznaAJ2PM36OQcg9kAccdkw7iRZCe5JRWBVknvzRtYwg4uFH0iyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzNgA4dk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzNgA4dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B47F1F00A3A;
	Mon,  7 Sep 2026 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788790184;
	bh=mAPqbLuFWuncpfCHNeDVN/DPeOZ1rIcAQsi7S3J/KLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mzNgA4dk5MDoIQMR4mG95VGzCkXjcuxufKDW86PLFRn1GlfZY+y28XlxJAko9nGgB
	 9w5/MPHbjvi0kPHuQauMQMjqUH01jA9CC37OlmxiVSbUCn04LghqaEgD7iX5C1B/NS
	 +4XOO8W2ZdVFtfeoTu09pHGRohSD6b9IggFFL6SkpQM9MoIFnyHrG/hg1y206BgCAp
	 wzCUP6tMtvWnHGnbYsuRPyln1cRnPl+5DX/70RgFuUvAgsirpLq5+KpNzud2EpG1lM
	 7ltil5AgtWizfYFknlU+LI+J4zLVL8HANDx66IcYpHgruh8p9SfWVFmHJKIA6qJS5+
	 vAb2SdmgsgjxQ==
Message-ID: <f21ab49e-b61e-43fa-8846-e5ff6a7b25b3@kernel.org>
Date: Mon, 7 Sep 2026 16:09:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: remove unused totalram_pages_inc() and
 totalram_pages_dec()
To: Tal Zussman <tz2294@columbia.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901-mm-remove-unused-helpers-v2-0-f6474e169c23@columbia.edu>
 <20260901-mm-remove-unused-helpers-v2-2-f6474e169c23@columbia.edu>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260901-mm-remove-unused-helpers-v2-2-f6474e169c23@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 21:38, Tal Zussman wrote:
> totalram_pages_inc() and totalram_pages_dec() have had no callers since
> commit 7fbc5e26123e ("memblock: extract page freeing from
> free_reserved_area() into a helper") and commit 287b89773d81
> ("powerpc/pseries/cmm: Use adjust_managed_page_count() insted of
> totalram_pages_*"), respectively. Remove them.
> 
> Drop the totalram_pages_inc() stub from tools mm.h too.
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  include/linux/mm.h       | 10 ----------
>  tools/include/linux/mm.h |  4 ----
>  2 files changed, 14 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e3736c42c4db..c105a3758915 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -57,16 +57,6 @@ static inline unsigned long totalram_pages(void)
>  	return (unsigned long)atomic_long_read(&_totalram_pages);
>  }
>  
> -static inline void totalram_pages_inc(void)
> -{
> -	atomic_long_inc(&_totalram_pages);
> -}
> -
> -static inline void totalram_pages_dec(void)
> -{
> -	atomic_long_dec(&_totalram_pages);
> -}
> -
>  static inline void totalram_pages_add(long count)
>  {
>  	atomic_long_add(count, &_totalram_pages);
> diff --git a/tools/include/linux/mm.h b/tools/include/linux/mm.h
> index 84b5954f66c3..d586a510e6e1 100644
> --- a/tools/include/linux/mm.h
> +++ b/tools/include/linux/mm.h
> @@ -33,10 +33,6 @@ static inline phys_addr_t virt_to_phys(volatile void *address)
>  	return (phys_addr_t)address;
>  }
>  
> -static inline void totalram_pages_inc(void)
> -{
> -}
> -
>  static inline void totalram_pages_add(long count)
>  {
>  }
> 

Also very nice!

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
