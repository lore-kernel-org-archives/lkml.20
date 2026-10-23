Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738460;
	b=m3pbVa5MzAyuWbyiM/N8Yyfrt8s2EXLV1lnkuB51G0VwIL+abm19EipITgKbHgHw/DnH
	 bHh+06B5MApeXGVMvUqidluMf09k3GATh8y8so0/AcwYs5+ER5uc3heUPY1LGQWW8P1cc
	 ZFNeFjSrH6ZvKCc9SMKrdZYDJU4KSMVYrSIsglmtUCHyVdfktQELKRGmgN45fxXNbLy57
	 QeTa90n38PegF5OILppGpMNevydqd5BeApMhjbpSseU+HcIMEqPC7/VHvJWyUByRKVL3b
	 NxX4n8p4I/d8tIN+4KwRWYwZm1qQw9LBvQWocYWzY+VI6dFxcmYmgkz2NSOXiOwxzWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738460;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vkPUzX7yhv3Hj1YrE4gniaaxsv2duW0NiwdJ652sT1E=;
	b=CBS8wTx7aKm/St2erAHnijWnF6/szrNbwjdlq7CDjqOCasmFv46ew/j+NgF5UuaPxyUO
	 AXPt2bAXT1oOMUroG24mFuHQ8788E4sIideYP7BybUxObcxb2r2KhuNlh0YPCAyzEO8ir
	 /cV+8Z4nEKO3Twsgq7A0Xu9mbvs19DO+OglkNSLs5wX9W6u+bjQzU2ktZMuhvq1R5qccD
	 aCJxRAA15OxPfAbzw/dG7z3fpXcRfZcAvu1d17GFoaIIdV/eN9Lb0eS5vNGwBfaCTrlUf
	 A6p36r0fEDnhXGiGIJaLPvt26UQNenCSkV3gdhJkhHJNw5O13H7qvFUGGZxxeRV89dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=U9NDiSg5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DBC606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DBC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=U9NDiSg5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC32C1691;
	Thu, 22 Oct 2026 23:54:15 -0700 (PDT)
Received: from [10.163.161.88] (unknown [10.163.161.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4574F3F7D8;
	Thu, 22 Oct 2026 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792738458; bh=n9iGNDoxlwolv/doJTrw9CQIV0VtE1mAf67LSVSFTkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9NDiSg5x3wMh7Dn/T+WLMA7s67zHvMpwLFZue2JOpO+uC+wR7Nb2WZ6SnuFFtNAr
	 56iU0zsI0Fpwb9hFfmGoi6l6OjLMtft5Pa/UfcrAXXvEhAaC6qcMvQn/4LvPcJfq45
	 uYukVwJDKDgW3ZzCeNtEXsdyHhtuDIbyu1sbXud0=
Message-ID: <18c9c7bd-0d89-45dd-8425-64f10e83fbb1@arm.com>
Date: Fri, 23 Oct 2026 12:24:13 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: reject overflowing vm_map_ram page counts
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Shubhang Kaushik <shubhang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23/10/26 5:05 am, Shubhang Kaushik (Ampere) wrote:
> vm_map_ram() converts its unsigned int page count to an unsigned long
> byte size without checking for overflow.
> 
> On 32-bit kernels, a count greater than ULONG_MAX >> PAGE_SHIFT wraps
> the byte size.  vm_map_ram() passes that size to both alloc_vmap_area()
> and vmap_pages_range(), so it can allocate and map only the wrapped
> number of pages while returning success for the original larger request.

I would expect the caller to take care of this?

In vmap(), the check is count > totalram_pages(), is this check more
appropriate to be used in vm_map_ram too?

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

