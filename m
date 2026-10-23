Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754537;
	b=Tsxq4SICankfc1DAwxQckLQtEDIRX5F3Jj1Rdi8qhnxpIAQjbtC3Raza1pBuAVOQxD1T
	 Mj3qsDvJQ4nAZwR7GmBhKiqFN41UPUKTB3DWp25FivNS2P971KFJwB1FhuykjxlxsY3Sh
	 OizVsGIbcAonk8TtnTZgLwfHiMlVi56m61l1c09GRBrZX87ErBHgEDchg8NgiWLOesiqR
	 9dU1W2/n3OvlJXPqMQ4YZjTc+P8a/L/YCK1jsw4PBZhXd4pVyGBBOAjWfAmDSaTBS/NCK
	 l+Bx+SH4mMrJjOM6TnJXG0OfQ3BBr9d3HLZoVWCXq/qg2MLUDsaa67w3M9KO5Be1msw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754537;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2JIr32shhDAdFV4wsdsTH1dxV1roHF7U6GHSm//gPNQ=;
	b=V55c7fnSesw5IUzf60AOkywoelP1mMKk0AK503374juNhopL8JQBwqqTnUAaCKqV3FzW
	 t1vJnDYv7xSUi2nwOrLRRPpYjF+HoFJAd9Ep8JDdcgRf4tY3sbwV7EEhgVN+6RIjguC/F
	 1OqfQ4wAJRZ/CizmJitEXjxWDZ/pDb9GfL7ezMN/5SVHKf2Nzcwk0QIX/ZLIPZuGWmNwh
	 GbM611jeOaFAs3kvrT9LW04E/GZ0B9KAxlkxQBTL86BIic0kRUfTMEv9HSc4xpQJUyaXl
	 oRcVEACMhrqBtbUkEua3/fzfjZDjsb5j4ElE86d8zGbdvYaGyWPQ/vItfjhJNIVKb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ixSxhJ1+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E670C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E670C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ixSxhJ1+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED3F11691;
	Fri, 23 Oct 2026 04:22:12 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BE893F7B4;
	Fri, 23 Oct 2026 04:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792754536; bh=pEs3PZgwiPiqg6sjwJKr14el93Iv6edM6dGsgzxNJl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixSxhJ1+Dmcvys/GZodc/+Jt78DSK1F+KDsahqOP1t17iU5/s1dFp6AHOvHfZ0RX8
	 zUkOa7zeXfylmXrT6WH7q1TN9ptVS9xK92BqBWue/SJ7NrlKTjjUFLhfanIEp3hAJg
	 F59g27ySewmTyN0ZYl4/69ocRJLGqL+8SEJBX6HY=
Date: Fri, 23 Oct 2026 16:52:12 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Shubhang Kaushik <shubhang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: reject overflowing vm_map_ram page counts
Message-ID: <y5yuwnmvq5nouoitqj6lloz6hepha6cf6vmh42rer2zhgv32au@vbvr3ohn24tf>
References: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org>
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
In-Reply-To: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org>

On Thu, Oct 22, 2026 at 04:35:20PM -0700, Shubhang Kaushik (Ampere) wrote:
> vm_map_ram() converts its unsigned int page count to an unsigned long
> byte size without checking for overflow.
> 
> On 32-bit kernels, a count greater than ULONG_MAX >> PAGE_SHIFT wraps
> the byte size.  vm_map_ram() passes that size to both alloc_vmap_area()
> and vmap_pages_range(), so it can allocate and map only the wrapped
> number of pages while returning success for the original larger request.
> 
> For example, with 4 KiB pages, a count of 1048577 produces a
> PAGE_SIZE byte size after wrapping, allowing a one-page mapping.
> 
> Reject page counts whose byte size cannot be represented.
> 
> Fixes: db64fe02258f ("mm: rewrite vmap layer")
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
>  mm/vmalloc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bea9f76ed7e74247d4ce919250c2f02dd5c36483..e98d3aa551fe205ebd9826daad9ad6bd578b91ea 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3083,10 +3083,15 @@ EXPORT_SYMBOL(vm_unmap_ram);
>   */
>  void *vm_map_ram(struct page **pages, unsigned int count, int node)
>  {
> -	unsigned long size = (unsigned long)count << PAGE_SHIFT;
> +	unsigned long size;
>  	unsigned long addr;
>  	void *mem;
>  
> +	if (count > ULONG_MAX >> PAGE_SHIFT)
> +		return NULL;

Could vm_map_ram() ever be called with such a large number as count ?

> +
> +	size = (unsigned long)count << PAGE_SHIFT;
> +
>  	if (likely(count <= VMAP_MAX_ALLOC)) {
>  		mem = vb_alloc(size, GFP_KERNEL);
>  		if (IS_ERR(mem))
> 
> ---
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
> change-id: 20261022-vmalloc-reject-overflow-e532c556f3fa
> 
> Best regards,
> -- 
> Shubhang Kaushik (Ampere) <sh@gentwo.org>
> 
