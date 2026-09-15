Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4292A422E3F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444355; cv=none; b=thwFfcfFskBzjaIrfkzf5DrIjKsRXSXLoApE0nVub8dC3MeXuJQ+wEF5kPj5FekV/ZlPFNvJfnwNDNdwQy2lAhC4ai0WPBYXG4H3U883btfKos4zypQioUnf2IOGvqmqNavsX9yLFXW10w+kWlb1fiUnqTnp2LWYmUBpmgAuoKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444355; c=relaxed/simple;
	bh=Co6SXIL0Bncyw5H+la1E66Ec/i8oPza1k5EsbVdTuhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5Sp+DPG/+4DRppDLKru07AbCQp4Mlw2xaB8OIwqeKYCMSHALKKvUqmo02F5kBwknMZQ4Y+uXdnFNs4m6rxST3U5k34+l5ssuSzjyOQHlNez/4LjQvU89Kowp1YV3Sk+CLNFI7r8LhNGZ9YawzKeu9PS8dJtrXJlmEaCNEiTzVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F5yUp1ZH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F5yUp1ZH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E6AA1570;
	Mon, 14 Sep 2026 20:52:27 -0700 (PDT)
Received: from [10.164.19.33] (unknown [10.164.19.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C3663F7B4;
	Mon, 14 Sep 2026 20:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789444351; bh=Co6SXIL0Bncyw5H+la1E66Ec/i8oPza1k5EsbVdTuhs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F5yUp1ZHoPolXZeL2ixVMvITqQi5Z/TW2mpm07PlQtH+pCqBJDqMSskR89AlSqbPn
	 h2nsK4H02OHf2rQSyH+EyGGwcVW/DTcdxwRPq1ylTuQlyc3Ry39lxBDEupZJ+pkeRx
	 yUhPktMNKmQ4DbkhtcuwMnrmq8PknY+b+GOrM1k0=
Message-ID: <e9d2c977-fd94-4e3b-a859-99d2f7c06818@arm.com>
Date: Tue, 15 Sep 2026 09:22:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm/vmalloc: group xa_init with vbq field
 initializations
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-1-526f68559706@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260914-vmalloc_study-v1-1-526f68559706@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/09/26 9:04 am, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Move xa_init() next to the other vbq field initializations instead of
> after the unrelated vfree_deferred setup.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---

LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  mm/vmalloc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 859e6d2d57a3..117483dd048c 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5585,10 +5585,11 @@ void __init vmalloc_init(void)
>  		vbq = &per_cpu(vmap_block_queue, i);
>  		spin_lock_init(&vbq->lock);
>  		INIT_LIST_HEAD(&vbq->free);
> +		xa_init(&vbq->vmap_blocks);
> +
>  		p = &per_cpu(vfree_deferred, i);
>  		init_llist_head(&p->list);
>  		INIT_WORK(&p->wq, delayed_vfree_work);
> -		xa_init(&vbq->vmap_blocks);
>  	}
>  
>  	/*
> 

