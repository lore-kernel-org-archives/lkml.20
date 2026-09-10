Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4081A31E844
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054529; cv=none; b=Y96ZdzqimcHTZ9BHIMCwOC357lsYkMGcBWocHtL5pSdJ6RXZdAyGTR/QByF1inkGYeL59wfhnLApQI4VVKArOdBqq0dHYDDp90p8i0h5iXv5h2pgfFL9jfXOpblN+XMa7OvgBzRpmNYXGB4LfltsXJnXjSj/Vpdp56pwGRCviDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054529; c=relaxed/simple;
	bh=ZhuGI+t/cpYzO7aOxfMWNdKRKkq2xUQhBDGqbx61+K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqojyqeH1RpKR3yDtmC0n0Gj5+6qTZ1pll10Zyx5zSrg3RyXT2Gmnhn1l6xhYmDwgyC6m0cVQObIw4Qk7/8kZK+a9jV1gqVWughONGxziy6dIeQe9UdxrUo6ldjs2UR+24tE9XECXpvXITQCRMiC4ATgrTy2vkqffGfUBlceOQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsxinKBC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsxinKBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7281F000FF;
	Thu, 10 Sep 2026 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789054528;
	bh=0ojLLwmXu12xZ8+dLcS0JjNT0Aa/ATM7kmu2pt8Vyzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IsxinKBCNwEikeE6CCIyrHyTHIxKYOd22GIVq4mV6a97GZ8376vW9/syFU5vyLW7g
	 0H6VzuCs36SAm1Eq5rVGxRMHC4TbTv9iEQWLngMMZmP3iyJvcnIf2yiMU5Wn0hv1nB
	 +dul08EgkBO+GIyySw67WpJhn4DdalW/2rDZLQPt2krJ8A9nlurLL3+X8VIGiX5Fhe
	 0WFqoCJikOOHQWQMVSipJIoMqN3kG9v6oIqKwbUHtMPYzjuEizgPruJqKJ2NE3q97B
	 r+eqYzCUIRsHlaGdkIHQoxg5CM82a4KLG66vf68OB7XFLJ9SiMEnuy2b5FgX2AF19L
	 tXOv+/+9CtcZQ==
Message-ID: <6ce1ee63-431a-4bfc-9027-f0d5ffbad055@kernel.org>
Date: Thu, 10 Sep 2026 17:35:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] mm/memory_hotplug: optimize zone contiguous check
 when changing pfn range
To: Yuan Liu <yuan1.liu@intel.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Cc: linux-mm@kvack.org, Nanhai Zou <nanhai.zou@intel.com>,
 Chen Zhang <zhangchen.kidd@jd.com>, Jason Zeng <jason.zeng@intel.com>,
 Chen Yu <yu.c.chen@intel.com>, Pan Deng <pan.deng@intel.com>,
 Tianyou Li <tianyou.li@intel.com>, linux-kernel@vger.kernel.org
References: <20260901052950.3284540-1-yuan1.liu@intel.com>
 <20260901052950.3284540-3-yuan1.liu@intel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20260901052950.3284540-3-yuan1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 07:29, Yuan Liu wrote:
> When move_pfn_range_to_zone() or remove_pfn_range_from_zone() updates a
> zone, set_zone_contiguous() rescans the entire zone pageblock-by-pageblock
> to rebuild zone->contiguous. For large zones this is a significant cost
> during memory hotplug and hot-unplug.
> 
> Add a new zone member, pages_with_online_memmap, that tracks the
> number of pages within the zone span that have an online memory map,
> including present pages and memory holes whose memory map has been
> initialized and for which pfn_to_online_page() succeeds.
> 
> For early boot memory, pages_with_online_memmap is calculated in
> memmap_init_zone_range(). PFNs initialized by memmap_init_range() are
> included in pages_with_online_memmap, and hole PFNs for which
> pfn_to_online_page() succeeds are also counted in
> init_unavailable_range(). For hotplugged memory,
> pages_with_online_memmap is updated through adjust_present_page_count(),
> which is called during memory online and offline operations. When
> spanned_pages == pages_with_online_memmap, every PFN in the zone span
> has a valid memmap entry, so pfn_to_page() can be called for any PFN
> within the zone span without an additional pfn_valid() check.
> 
> The counter may temporarily undercount when pages with an online
> memory map exist outside the current zone span. This can only happen
> during boot, when initializing the memory map of pages that do not
> fall into any zone span. Growing the zone to cover such pages and
> later shrinking it back may result in a value that is too small.
> This is safe, as it merely prevents detecting a contiguous zone.
> 
> The contiguity check using pages_with_online_memmap is stricter than
> the old pageblock-by-pageblock scan. The old set_zone_contiguous()
> iterated at pageblock granularity via pageblock_pfn_to_page(), so a
> zone could be marked contiguous even if a subsection-sized hole
> existed within a pageblock. The new check requires
> spanned_pages == pages_with_online_memmap, meaning every PFN in the
> zone span must satisfy pfn_to_online_page().
> 
> The following test cases of memory hotplug for a VM [1], tested in the
> environment [2], show that this optimization can significantly reduce the
> memory hotplug time [3].
> 
> +----------------+------+---------------+--------------+----------------+
> |                | Size | Time (before) | Time (after) | Time Reduction |
> |                +------+---------------+--------------+----------------+
> | Plug Memory    | 256G |      10s      |      3s      |       70%      |
> |                +------+---------------+--------------+----------------+
> |                | 512G |      36s      |      7s      |       81%      |
> +----------------+------+---------------+--------------+----------------+
> 
> +----------------+------+---------------+--------------+----------------+
> |                | Size | Time (before) | Time (after) | Time Reduction |
> |                +------+---------------+--------------+----------------+
> | Unplug Memory  | 256G |      11s      |      4s      |       64%      |
> |                +------+---------------+--------------+----------------+
> |                | 512G |      36s      |      9s      |       75%      |
> +----------------+------+---------------+--------------+----------------+
> 
> [1] Qemu commands to hotplug 256G/512G memory for a VM:
>     object_add memory-backend-ram,id=hotmem0,size=256G/512G,share=on
>     device_add virtio-mem-pci,id=vmem1,memdev=hotmem0,bus=port1
>     qom-set vmem1 requested-size 256G/512G (Plug Memory)
>     qom-set vmem1 requested-size 0G (Unplug Memory)
> 
> [2] Hardware     : Intel Icelake server
>     Guest Kernel : v7.3-rc1
>     Qemu         : v9.0.0
> 
>     Launch VM    :
>     qemu-system-x86_64 -accel kvm -cpu host \
>     -drive file=./Centos10_cloud.qcow2,format=qcow2,if=virtio \
>     -drive file=./seed.img,format=raw,if=virtio \
>     -smp 3,cores=3,threads=1,sockets=1,maxcpus=3 \
>     -m 2G,slots=10,maxmem=2052472M \
>     -device pcie-root-port,id=port1,bus=pcie.0,slot=1,multifunction=on \
>     -device pcie-root-port,id=port2,bus=pcie.0,slot=2 \
>     -nographic -machine q35 \
>     -nic user,hostfwd=tcp::3000-:22
> 
>     Guest kernel auto-onlines newly added memory blocks:
>     echo online > /sys/devices/system/memory/auto_online_blocks
> 
> [3] The time from typing the QEMU commands in [1] to when the output of
>     'grep MemTotal /proc/meminfo' on Guest reflects that all hotplugged
>     memory is recognized.
> 
> Reported-by: Nanhai Zou <nanhai.zou@intel.com>
> Reported-by: Chen Zhang <zhangchen.kidd@jd.com>
> Tested-by: Yuan Liu <yuan1.liu@intel.com>
> Reviewed-by: Jason Zeng <jason.zeng@intel.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Pan Deng <pan.deng@intel.com>
> Co-developed-by: Tianyou Li <tianyou.li@intel.com>
> Signed-off-by: Tianyou Li <tianyou.li@intel.com>
> Signed-off-by: Yuan Liu <yuan1.liu@intel.com>
> ---
>  Documentation/mm/physical_memory.rst |  6 +++
>  drivers/base/memory.c                |  7 +++-
>  include/linux/mmzone.h               | 48 +++++++++++++++++++++
>  mm/memory_hotplug.c                  | 12 +-----
>  mm/mm_init.c                         | 63 +++++++++++++++-------------
>  mm/mm_init.h                         |  6 ---
>  mm/page_alloc.h                      |  2 +-
>  7 files changed, 98 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
> index a09407d72973..2e67e8b23a99 100644
> --- a/Documentation/mm/physical_memory.rst
> +++ b/Documentation/mm/physical_memory.rst
> @@ -480,6 +480,12 @@ General
>    ``present_pages`` should use ``get_online_mems()`` to get a stable value. It
>    is initialized by ``calculate_node_totalpages()``.
>  
> +``pages_with_online_memmap``
> +  Pages within the zone that have an online memory map: present pages and
> +  memory holes whose memory map has been initialized and
> +  ``pfn_to_online_page()`` succeeds. See the comment for
> +  ``pages_with_online_memmap`` in ``include/linux/mmzone.h`` for more details.
> +
>  ``present_early_pages``
>    The present pages existing within the zone located on memory available since
>    early boot, excluding hotplugged memory. Defined only when
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 5eead3346f1e..28f9503f6a71 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -255,6 +255,7 @@ static int memory_block_online(struct memory_block *mem)
>  		nr_vmemmap_pages = mem->altmap->free;
>  
>  	mem_hotplug_begin();
> +	clear_zone_contiguous(zone);
>  	if (nr_vmemmap_pages) {
>  		ret = mhp_init_memmap_on_memory(start_pfn, nr_vmemmap_pages, zone);
>  		if (ret)
> @@ -279,6 +280,7 @@ static int memory_block_online(struct memory_block *mem)
>  
>  	mem->zone = zone;
>  out:
> +	set_zone_contiguous(zone);
>  	mem_hotplug_done();
>  	return ret;
>  }
> @@ -304,6 +306,7 @@ static int memory_block_offline(struct memory_block *mem)
>  		nr_vmemmap_pages = mem->altmap->free;
>  
>  	mem_hotplug_begin();
> +	clear_zone_contiguous(mem->zone);
>  	if (nr_vmemmap_pages)
>  		adjust_present_page_count(pfn_to_page(start_pfn), mem->group,
>  					  -nr_vmemmap_pages);
> @@ -321,8 +324,10 @@ static int memory_block_offline(struct memory_block *mem)
>  	if (nr_vmemmap_pages)
>  		mhp_deinit_memmap_on_memory(start_pfn, nr_vmemmap_pages);
>  
> -	mem->zone = NULL;
>  out:
> +	set_zone_contiguous(mem->zone);
> +	if (!ret)
> +		mem->zone = NULL;
>  	mem_hotplug_done();
>  	return ret;
>  }
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 94f9c3ff5416..7bfb871d6344 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -1043,6 +1043,21 @@ struct zone {
>  	 * cma pages is present pages that are assigned for CMA use
>  	 * (MIGRATE_CMA).
>  	 *
> +	 * pages_with_online_memmap tracks pages within the zone that have
> +	 * an online memory map: present pages and memory holes whose
> +	 * memory map has been initialized and pfn_to_online_page()
> +	 * succeeds. When spanned_pages == pages_with_online_memmap,
> +	 * pfn_to_page() can be performed without further checks on any
> +	 * PFN within the zone span.
> +	 *
> +	 * Note: this counter may temporarily undercount when pages with an
> +	 * online memory map exist outside the current zone span. This can
> +	 * only happen during boot, when initializing the memory map of
> +	 * pages that do not fall into any zone span. Growing the zone to
> +	 * cover such pages and later shrinking it back may result in a
> +	 * "too small" value. This is safe: it merely prevents detecting a
> +	 * contiguous zone.

It's actually:

[ zone span ]
[   zone pages  ]

e.g., spanned 10, initialized 15, online 10

online == spanned -> contiguous

Growing after hotplug (hotplug 5):

[ zone span                          ]
[   zone pages  ]    [   zone pages  ]

e.g., spanned 30, initialized 20, online 15

online != spanned -> not contiguous

Shrinking after hotunplug (hotunplug 5 again):

[ zone span     ]
[   zone pages  ]

e.g., spanned 15, initialized 15, online 10

online != spanned -> not contiguous although contiguous


So this can only happen after boot (during memory hotplug) when we grow and then
shrink the zone.


Should be clarified in here and in the patch description, maybe even stating an
example as above (obviously we cannot hotplug/hotunplug 5 pages ;) )

-- 
Cheers,

David
