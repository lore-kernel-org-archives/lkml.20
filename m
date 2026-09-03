Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76794A1DF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439170; cv=none; b=SkzNSKSdjYxImZrkYlXNdueknO0DITxRB3D0vZzJjs7UQ5YFx6R0klNv4evtmFQmHQarVaHPfaZXoHa9UKuHYpchaZMksuVuhzrtLM23HqhBwRwZJhLNAQFwD0gp+jNzZBwyJdJFlrI+Lago/hUni5sN6iHvr+yhj1/RCCDvGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439170; c=relaxed/simple;
	bh=y3sEyJ9cEnffrNDW84pQaeftTV0gUQIfo8/BTHG9Hnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsYlgMTTTz8N33+hbhAQLTAOpPU9H4PLsT75Rc6KaN91kI59iHZ+zH9Yu+hLo7U7RqWlBW141oYQGciRiFWyVmys8dBaOAW1AdJUi5FvN+T5BtY5bgt8WFlifnHFtNOLafctodqjdHSawCJUAhyviL8SlUKoSfISdREliqqqmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Inoo8fUP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Inoo8fUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05C51F00A3A;
	Thu,  3 Sep 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788439168;
	bh=9ryI59nFheCyodltaNYiaFw2/xCwHS5lRcpCtYO6UO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Inoo8fUPGSNJErxjcu2YCMxci49DLzOd5zaOA4Vbj0yx43UjFdql/ieUY8GuVL5VR
	 UYBNyKpbpS+1IQjpAPSKab2ElCpMF+xXLZuvq1USTjFRLmfzYn9dVFTMmKOicqCmvv
	 wLofrQxS3HJh27LqOGEqJCd3TqPGazfJfh/6xsTy1xzUw3VM8wGxjhp1y8hEsNicTk
	 7uZCZa0CnfhWVb+Q/a9v1X21NoaQjTBEGCg5yOFr3ddY2AK5OUHc0ypyt6rvPDouao
	 scyo46aH+/bgUPEqhMj1m9k7vlezKCy1TO+isK9/RFIn8qrVgxkmFX3J040v8mkxDX
	 8J53zeGgvxvkg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8B196198003A;
	Thu,  3 Sep 2026 08:39:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 03 Sep 2026 08:39:26 -0400
X-ME-Sender: <xms:fGqZauPqkognvLO22ue7MYKMtaaL06W0DJXtdhbCF1OGIlfm9ocDxg>
    <xme:fGqZakjEa9-8LgEmHQN0uURotx45Ldev0j-KRJ4fOWn9ZABkC6P9qNlMYvuTgnYhy
    Y6ZrbycAL7K8359QtaemOuZu-Mh3FSX8y2Vgm8FAR9HTBoY4NHLnh0o>
X-ME-Received: <xmr:fGqZak5NRnAjj-ZvDc06pxtf0rfSJb_xQO1UPA5thiNXRRe-n99fIP67zZY>
X-ME-Proxy-Cause: dmFkZTF3zqPAAnIhb1YeMy24bRFWG3v32j09ZcqUOBuX3KYWzX7uJHPyWLP1Hj9+S4IwNa
    PEy+WtiDNm+MM9ovDxTHTFHgV04t/PKrt0NTN2ImGOgKC4nHBzHRP+V+NxyT+08Bw87TIP
    xDC4nnEMRVpoPDvzrvVp9/5IZQW8mgfOG0RwDIlK2TCv0z/bMQfFNMgnsMbeO0IPRHxTqE
    iW97TQlsSv9lKHgjhUMt4Sbntwm6GwEkMRqP0CPAl7hHyI006Lnh3QbvG4Wjp+y1LpKi8x
    rTWSl+P8HlEZ3jJJh9dvoiRgnQ3kpBf8Z3mAxfDoB8l/wr5EUjDhaN7di1qQ8wqK5RwRcg
    Tq1uklzx6pXzETlUF0tyDjbgcjmvjl7QmUvkQjOMPzvrColSeg5ZmXqq510TJyG/7ZyPyh
    RJCoz2aQNYCKgDtjTYbz3puc4VdUHq2W4TZ2YC+GaDCN6d0b07AwRoj0Ue/2fHA8M4hSP4
    8KqmvyJ2odJp7N61NrgMzMvbPE76WPVOGQLYG8ARqhApN6595Owmkzn7hEhaVQct5WLi7c
    Db27T3XWTxzdKzVCOI8Ay045x4cc2Nkri+oSRFoRA++Onlp0P7ayTUlt0ga6SCgFWxxQP8
    6e94A5yG7KJDM3FibVG+VZjuBXbOL/O3Kx9KU+PuL/NNWqDLGGyO2vkG+OVg
X-ME-Proxy: <xmx:fGqZardd_pIo-mypn-5cHUYN5lCsKTQy5MDZCbcxrXqDiG3q9LzCvQ>
    <xmx:fGqZatDYhUl6DJFgIzmturDS6uUSJbhUSSP2ywuuSxMkYiNO3pMyQg>
    <xmx:fGqZaqBuDq6kROnAhM9fG3_dWo6DCopeBGn-5mo2ukRZWLKVNu8NuA>
    <xmx:fGqZavb1BEVb8GbuaBEXLt1WMLttuqklOmmIo-Hq3n4oDlLXCCEehQ>
    <xmx:fGqZanwJRry7LHd7EMAiJvVYi6vDq9ESarqQgB8I0vLYmqNXbkZFQB8b>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 08:39:23 -0400 (EDT)
Date: Thu, 3 Sep 2026 13:39:22 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mm/gup_test: safely calculate GUP batch size
Message-ID: <aplp-uM2oQtjuWnZ@thinkstation>
References: <20260903115033.162218-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903115033.162218-1-sarthak.sharma@arm.com>

On Thu, Sep 03, 2026 at 05:20:33PM +0530, Sarthak Sharma wrote:
> __gup_test_ioctl() calculates the end of a GUP batch using:
> 
> next = addr + nr * PAGE_SIZE;
> 
> If nr is too large, it can cause next to overflow and wrap around.
> If it wraps, the next > end check is bypassed and a large value
> of nr is passed to the GUP call, even though the pages array was
> allocated according to gup->size. This can lead to out of bounds writes.
> 
> Also, when fewer than PAGE_SIZE bytes remain, the calculated batch
> contains zero pages. The code still calls GUP functions with pages + i,
> which can point past the allocated array.
> 
> Calculate nr by taking the minimum of the number of pages per call and
> the pages remaining in the address range. Stop processing when no
> pages remain and calculate the end of the batch using this bounded
> value of nr.
> 
> Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

On nit below.

> ---
> Sashiko reported the issue fixed by this patch while reviewing the patch
> "mm/gup_test: report actual pinned bytes". That patch has been applied to
> mm-new. Since the two fixes are independent, this revision contains
> only the GUP batch size fix.
> 
> Changes in v4:
> - Simplify batch clamping logic as suggested by Kiryl
> - Don't call GUP functions for an empty batch
> - Drop the pinned byte reporting patch since it has been applied to mm-new
> 
> v3: https://lore.kernel.org/all/20260901083452.115365-1-sarthak.sharma@arm.com/
> 
>  mm/gup_test.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/gup_test.c b/mm/gup_test.c
> index 185ba3bb8ed1..1b64e932c4c5 100644
> --- a/mm/gup_test.c
> +++ b/mm/gup_test.c
> @@ -139,11 +139,12 @@ static int __gup_test_ioctl(unsigned int cmd,
>  		if (nr != gup->nr_pages_per_call)
>  			break;
>  
> +		nr = min_t(unsigned long, gup->nr_pages_per_call,
> +			   (end - addr) / PAGE_SIZE);

I personally would rather have it in two statements, as I suggested
initially:

		nr = gup->nr_pages_per_call;
		nr = min_t(unsigned long, nr, (end - addr) / PAGE_SIZE);

It seems to be more readable to me.


> +		if (!nr)
> +			break;
> +
>  		next = addr + nr * PAGE_SIZE;
> -		if (next > end) {
> -			next = end;
> -			nr = (next - addr) / PAGE_SIZE;
> -		}
>  
>  		switch (cmd) {
>  		case GUP_FAST_BENCHMARK:
> 
> base-commit: 178b3d97bf1f15f598ea7cc615a40c115e528e1c
> -- 
> 2.53.0
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
