Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789495;
	b=4+AV6Zpm08qLULwfLZ6jyn4P5+1T+AJjO4QBPtHV1DTGlgS7e6NqqlZMxpYum2555LEY
	 IKWC8y637d/86IdkxUeC6YFZpfX68FbNn5hAhxr0GqzBYaumd2thwyuNixOpf5Vn3PP8i
	 /s23qFOlZXKN2GACOVC+MiVOHQJQYwFPam6i0DvdOqPUoqkclY2F7lmmj6a2KIYpLAaFb
	 rQbuyoGPHu9RE6TB34xNc4eCwNbTxpX5F1qKWjbhKa6XIqEPvExBnN6uxhuUky8l5StZD
	 fJkjFbz+EAB6qWa/wPv1/Z3FFxLmG6Z1I9dsOy56Pta+m1r6kGlEyMKvqkEjPha9lZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789495;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HXDgHwIg8m4DwtOhwv+ZFMPIRE8BcYqQdrGKa3M5Pbs=;
	b=wNwN/YInuDTu/mZdqk2RK2AXFDrRCcVD+zWkQPbjcS4doVUrODb3ABY4sUua7/HBK852
	 49lvaIOVmR7RRf3JpDvsCeR6uU2B1knqHplzjUcfNTw0v/DqDoB9pZobg3asRvt5jOl+l
	 Sq1xBBZ8mA/Rtn4zErfCrJE7kGAlvANhp0+xmJEV3HxSXbJI/CSmA0EINUhcHrnpYWfO+
	 3ud8kEWsHmsI+eXnxDcAvS0TqE4fXHVqklTWf/2G5uI6/gnvhOkMcNKxljwn3oVhKRahH
	 aJWP3GCopuN75mAcf8PbyYYErbOWjq8ZuNOc31JW3m8IO/ZD/TZZa1iQzFhJgogahYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GHFQHyoD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DABF606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DABF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GHFQHyoD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 410352247;
	Wed,  4 Nov 2026 02:51:31 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D4D63F628;
	Wed,  4 Nov 2026 02:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793789494; bh=aDq3A0xHGBXoAmwsG8E6qJPjO2aDOH/ROmFDF348ug4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GHFQHyoDS3/7ZGobLiPRAROn6IMSSLdC5HWD+VfwMHO89GcuouzLbz7SYD1ktTpKf
	 w2V/XqQy7f25Se5LdBQUWjjwCK75sf23IO5xbKoqj7Y0IZoeAklgHshi/w2gf4lIHn
	 zBPgaWfM1kTR1P6/DHhrTLd8/Q2MGJtS4W1YzVQs=
Message-ID: <8a543030-d0c1-416f-8747-6cd599ad6a90@arm.com>
Date: Wed, 4 Nov 2026 10:51:30 +0000
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
Subject: Re: [PATCH] fs/resctrl: Allocate the RMID array with kvzalloc
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, bp@alien8.de, tan.shaopeng@fujitsu.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104102004.609259-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261104102004.609259-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 04/11/2026 10:20, Jinjie Ruan wrote:
> setup_rmid_lru_list() sizes rmid_ptrs[] by the whole RMID index space.
> On x86 the index is the RMID, so the array stays small. On MPAM the
> index space is the product of the PARTID and PMG ranges, and with a
> large range the array is megabytes in size.
> 
> kzalloc() needs a high-order page allocation for it, which fails once
> memory is fragmented, and a size above KMALLOC_MAX_SIZE always fails.
> resctrl then fails to mount.
> 
> Use kvzalloc(), which falls back to vmalloc().

Yep, I ran into this too when experimenting with large PARTID counts on the FVP model. I have the
same patch here [1] and plan to repost soon with some more related kmalloc to kvmalloc changes.

[1] https://lore.kernel.org/lkml/20260911160608.1091121-1-ben.horgan@arm.com/

Thanks,

Ben

> 
> Fixes: 6791e0ea3071 ("x86/resctrl: Access per-rmid structures by index")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Babu Moger <babu.moger@amd.com>
> ---
>  fs/resctrl/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index f69dbf66f42e..7713aa5d3996 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -1029,7 +1029,7 @@ int setup_rmid_lru_list(void)
>  		return 0;
>  
>  	idx_limit = resctrl_arch_system_num_rmid_idx();
> -	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
> +	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
>  	if (!rmid_ptrs)
>  		return -ENOMEM;
>  
> @@ -1125,7 +1125,7 @@ void free_rmid_lru_list(void)
>  		return;
>  
>  	mutex_lock(&rdtgroup_mutex);
> -	kfree(rmid_ptrs);
> +	kvfree(rmid_ptrs);
>  	rmid_ptrs = NULL;
>  	mutex_unlock(&rdtgroup_mutex);
>  }

