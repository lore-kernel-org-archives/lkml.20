Received: from mail-m19731118.qiye.163.com (mail-m19731118.qiye.163.com [220.197.31.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C0945D905;
	Fri, 11 Sep 2026 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118060; cv=none; b=gJsab+usyfhRIXsZnJKmO4mvDIK9k5jFfa505s1c+2Nry+Bcl+6lu2NmxLjAYfR1HFpVHF19dkgZxJUmxG3+nwsWvnuUuViFW6ZyeZtTLptZqJkl1iEEFT8dawPvkCctnnaKTfLwQ8iiFShIDhm9ra2uQOmVz81zCLmTInaLTZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118060; c=relaxed/simple;
	bh=qxVNMX40CNQMQpVGltOdYeoTsYxN5+q1bx7KbFStMPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1ZRtP0Ey/WNG/xOoTwv0YWl2RVV8fYD38yGIn768326DGw8Rh/j2RM7Y655QxX+a9AagKB1rosIPsI1nYy711S7ZCOMFbpkAN+2qzklYMi/To3r0989RoDjGGmO74Yzg7wuReDgfeU71icM2D1i3jrPe601cIU3ug/Ap88Kejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ef640672;
	Fri, 11 Sep 2026 15:58:28 +0800 (GMT+08:00)
Message-ID: <d8d34e16-57fa-48b7-93a9-afbf4b950ce6@easystack.cn>
Date: Fri, 11 Sep 2026 15:58:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: Zi Yan <ziy@nvidia.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
 <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
 <6e8bfb0d-d595-4e6b-9536-0323ada57e25@easystack.cn>
 <b8e23456-00af-4097-a769-210a087d2b90@kernel.org>
 <22D1EC4B-FBCB-421E-B8DA-345B5F3505FB@nvidia.com>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <22D1EC4B-FBCB-421E-B8DA-345B5F3505FB@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f79a0bc0229kunmf7504aa32b18de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH04dVk9MGklKShlPS04aS1YVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+



在 2026/9/9 23:54, Zi Yan 写道:
> On 9 Sep 2026, at 6:28, David Hildenbrand (Arm) wrote:
> 
>> On 9/9/26 04:35, zhen.ni wrote:
>>>
>>>
>>> 在 2026/9/8 22:30, David Hildenbrand (Arm) 写道:
>>>> On 9/7/26 10:26, Zhen Ni wrote:
>>>>> This patch series adds process and memory cgroup filtering support to
>>>>> page_owner. Following the previous series that introduced print_mode and
>>>>> NUMA node filters:
>>>>>     https://lore.kernel.org/linux-mm/20260707115411.1714314-1-
>>>>> zhen.ni@easystack.cn/
>>>>>
>>>>> This series adds filtering capabilities to page_owner, allowing users to
>>>>> filter output by specific processes and memory cgroups. Users can now
>>>>> filter page_owner output by PID, TGID, COMM (with wildcard support), and
>>>>> memory cgroup path. This makes page_owner debugging more focused and
>>>>> efficient for tracking memory allocations in specific contexts.
>>>>>
>>>>> Targeted filtering provides significant performance benefits on large memory
>>>>> servers by reducing both execution time and output size. By filtering at the
>>>>> kernel level before reading, only relevant page allocations are processed,
>>>>> dramatically reducing the amount of data that needs to be handled in userspace.
>>>>
>>>> page_owner is used for debugging. Why do we have to add kernel code to make it
>>>> faster?
>>>>
>>>> How much faster are we talking about?
>>>
>>> On my VM with just 2GB of RAM, the raw page_owner output takes real
>>> 0m6.178s. Filter it down to PID 1, and it drops to real 0m0.286s. Handle
>>> mode takes real 0m0.938s — roughly an 85% speedup. I've also tried this
>>> on a 1TB server, and it's very slow. The numbers would look even more
>>> extreme.
>>>
>>> You're right that execution time isn't the main concern for a debug
>>> tool. But that's kind of the point — I'm trying to optimize the current
>>> execution flow of page_owner, reduce unnecessary overhead, and make the
>>> tool more user-friendly (especially for servers with 1TB+ of memory).If
>>> the user only cares about a specific slice of memory, why dump
>>> everything from the kernel side and then filter it all over again in
>>> userspace? Might as well filter at the source.
>>
>> Because it results in less kernel code  :)
>>
>> And less kernel code is good. Unless unavoidable.
> 
> An alternative is to add BPF hooks like bpf_iter to do the filtering
> and by default, when no BPF program is attached, everything is printed.
> 
> 

I’ve also thought about a similar approach—perhaps a new bpf_iter type
that could iterate over all pages by PFN. The advantage would be that
you can fully customize what you want to print and what you want to
filter. However, doing so would require refactoring the entire
page_owner, and I’m not sure whether it’s worth pursuing in this
direction.I’d also like to hear everyone’s thoughts on this.

Thanks,
Zhen
