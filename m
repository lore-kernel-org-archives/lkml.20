Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB303403F4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355366; cv=none; b=T0sNNDhT9gP7mBzQ6/p3SvpjDm3gi0BFZBOgA8L/U1nkbs/BOODPkmMFwghKU+ogrB+gO6kgCDVY67P05SEWN7hK6X3RAVPNvnWsyxBJ+W8+AcGTPBvnYtqJrb6d7qiaBT4ILW680c+AGWhb4mmQWcl7Umfz1ZXfioShkqGx304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355366; c=relaxed/simple;
	bh=m+foVBAoalhqLlq2Og+IWuwZmX9gvSN2FL3MD01und4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1kp53rs+KEK+EcMWys3klxKvYYX0b/rN+VHSeAuOtvmz5LjyGak6yszeKUtK/3PbO6HodnS0KL8+HSprb94/NoAg3O9g0Ek4ayor39l/fhI5nsAvCWhGlwrNwdQNhdvjVr6e+5WWMtYoewlS7SDQvBbz2WfM+8z9hgs6vHdTBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XMm5I/3W; arc=none smtp.client-ip=91.218.175.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XMm5I/3W"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m+foVBAoalhqLlq2Og+IWuwZmX9gvSN2FL3MD01und4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789355355; v=1; x=1789960155;
 b=XMm5I/3WfwV828PwC0hisoEi0O+4sNAvlHcX6SGKGQSYvbvuRNCg4cf+v0dJ9YDn0UCzV5V8
 f4Kvd1b1SNl7KeAZqntkIJXPNF+Kjbc7DZFO2Ze5yhHO9LVcCqghfLh/w10zoXjJFQlT0n08JJY
 PWbhP/ADe60L18QKKEERwHYs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab92a83b59a5437d;
	Mon, 14 Sep 2026 03:09:15 +0000
X-Mizu-Trace-ID: ab92a83b59a5437d
X-Migadu-Flow: FLOW_OUT
Message-ID: <e21370f7-f95a-4f07-ada4-7c139628370a@linux.dev>
Date: Mon, 14 Sep 2026 11:09:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: shmem: ignore sysfs configs for shmem forced
 collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@kernel.org
Cc: ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, ljs@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/14/26 10:12 AM, Baolin Wang wrote:
> According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
> ignore any THP or mTHP interface settings.
> 
> However, after commit 26c7d8413aaf ("mm: thp: support "THPeligible" semantics
> for mTHP with anonymous shmem"), performing MADV_COLLAPSE on shmem will
> depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
> (although that is the default), which can cause MADV_COLLAPSE to fail
> unexpectedly.
> 
> Fix this by returning the result of shmem_huge_global_enabled() directly
> when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
> shmem THP/mTHP settings.
> 
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
> Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shutemov.name/
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>   - Use the correct fixes tag (per Kiryl).
>   - Collect reviewed tags from Kiryl, Zi and Lance. Thanks.
> ---
>   mm/shmem.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index c92ed17dbc4a..b572c60f2af8 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2049,8 +2049,11 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   
>   	global_orders = shmem_huge_global_enabled(inode, index, write_end,
>   						  shmem_huge_force, vma, vm_flags);
> -	/* Tmpfs huge pages allocation */
> -	if (!vma || !vma_is_anon_shmem(vma))
> +	/*
> +	 * Tmpfs huge pages allocation or forced collapse ignores
> +	 * sysfs configs.
> +	 */
> +	if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
>   		return global_orders;
>   
>   	/*

