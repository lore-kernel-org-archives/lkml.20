Received: from mail-m49231.qiye.163.com (mail-m49231.qiye.163.com [45.254.49.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD9A315D5D;
	Wed,  9 Sep 2026 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921653; cv=none; b=e05eL8xyPSddTL8D2TRbBhU0vfkDXTqfrHQJKIx/SfMJDoW/Yw2+ui+t3BUjYywiu+a5CDWkAEDNpet3S+74+MxK9gfV+ZFpIfLQfVUu3yPBA+bHFY8ex8piJTkJIXtmIsBiehKxakXFB6ISb3VaAObkSFfiC0BwBdXAvWWgp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921653; c=relaxed/simple;
	bh=EV/tgxz05EjxG1zfamVEH0rKeC48U11l8LgxR8wGTNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCnIF0d3JLqSrieVu9+kIpQ2Kh/Nm8i5L6r1v/8nZ2oZQMLZgFU3zgKK2S/1kNXCXuNzqBpDDyMgXmxNl04ap+b9jpXDkp/MqaUubmrdRVmoDrQzyHsP8fLHpa2GwfzIv9xVo82jtQmHqEHVVTD70fZ45Qx/ymHrHeBIKT+1PxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.254.49.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1eda0dd33;
	Wed, 9 Sep 2026 10:35:35 +0800 (GMT+08:00)
Message-ID: <6e8bfb0d-d595-4e6b-9536-0323ada57e25@easystack.cn>
Date: Wed, 9 Sep 2026 10:35:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
 <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa084054d8e0229kunm29073d571f33c1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGk5CVh0eTUNKGElMTExKHlYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG



在 2026/9/8 22:30, David Hildenbrand (Arm) 写道:
> On 9/7/26 10:26, Zhen Ni wrote:
>> This patch series adds process and memory cgroup filtering support to
>> page_owner. Following the previous series that introduced print_mode and
>> NUMA node filters:
>>    https://lore.kernel.org/linux-mm/20260707115411.1714314-1-zhen.ni@easystack.cn/
>>
>> This series adds filtering capabilities to page_owner, allowing users to
>> filter output by specific processes and memory cgroups. Users can now
>> filter page_owner output by PID, TGID, COMM (with wildcard support), and
>> memory cgroup path. This makes page_owner debugging more focused and
>> efficient for tracking memory allocations in specific contexts.
>>
>> Targeted filtering provides significant performance benefits on large memory
>> servers by reducing both execution time and output size. By filtering at the
>> kernel level before reading, only relevant page allocations are processed,
>> dramatically reducing the amount of data that needs to be handled in userspace.
> 
> page_owner is used for debugging. Why do we have to add kernel code to make it
> faster?
> 
> How much faster are we talking about?

On my VM with just 2GB of RAM, the raw page_owner output takes real
0m6.178s. Filter it down to PID 1, and it drops to real 0m0.286s. Handle
mode takes real 0m0.938s — roughly an 85% speedup. I've also tried this
on a 1TB server, and it's very slow. The numbers would look even more
extreme.

You're right that execution time isn't the main concern for a debug
tool. But that's kind of the point — I'm trying to optimize the current
execution flow of page_owner, reduce unnecessary overhead, and make the
tool more user-friendly (especially for servers with 1TB+ of memory).If
the user only cares about a specific slice of memory, why dump
everything from the kernel side and then filter it all over again in
userspace? Might as well filter at the source.

> 
> Or are there other limits to actually implementing it without kernel pre-filtering?
> 

