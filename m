Received: from mail-m49230.qiye.163.com (mail-m49230.qiye.163.com [45.254.49.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E031B353A6B;
	Mon,  7 Sep 2026 04:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755014; cv=none; b=qOFZC6UJ1SZU/YmbSErMGhwgCzKxq5dMq/4kznNotDiROy5EDmr+CZ6Ct/7GfEde5olsnDF77Agqg2SR6dvAz8LkUqWpHCTLZZQqa6K/SCY2cdrhcjhWgIbwCMkTyCzvqIPWbhlaxTiZwdfeZwqXGmS4KmmuWiTSIqHzhseVXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755014; c=relaxed/simple;
	bh=iiavMx1jA7uGbiRBDXqnuPkU5UlXczMk1dYymr+c1ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U41nHLg4BgaQy3DLA09s34qujOTjPapMkJzjQaAef/9rSHwYteNd1/e90fELAPiQu0EcnjKR5hqv/JygO6t58QGkC43AkO2qCsvzd86HFXKtOBxN2AOyz+qFPpdDqUnaPw5KJwRE4eEgKN+C1GJdPGO/YQepsALhF+obYO3KG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.254.49.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ec3c789f;
	Mon, 7 Sep 2026 12:08:02 +0800 (GMT+08:00)
Message-ID: <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
Date: Mon, 7 Sep 2026 12:08:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa07a0d39ea0229kunm364620a714e1c3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGR5MVh5DSE5DQ0IaSEweHVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG



在 2026/9/4 16:25, Vlastimil Babka (SUSE) 写道:
> On 9/3/26 06:18, Zhen Ni wrote:
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
> 
> I wonder about the usefulness of all the new filters. In my experience
> page_owner is useful to find a kernel memory leak code, and for that the
> stacktraces are most useful. Dealing with things like pid/tgid/comm/cgroups
> sounds more like your aim is to profile and optimize particular userspace to
> use less kernel memory? In that case, isn't it rather the area of memory
> allocation profiling (or maybe tracing with bpf), not page_owner?
> 
> Moreover, tracing or bpf can already do such kind of filtering and AFAIK
> ftrace filters for tracepoints are nice and generic, while this is adding a
> bunch of custom parsing and filtering. So that makes me somewhat sceptical.
> 

Thanks for the review, and the scepticism is fair - let me first
clarify where I agree with you, then explain the niche I think these
filters fill.

In memory usage source analysis and memory leak analysis, I believe
page_owner has its own unique niche:

1. Nearly all historical allocation records are queryable. Dynamic
    tracing tools (bpf, ftrace) cannot do this.

2. The full allocation stack is recorded via stackdepot. Memory
    allocation profiling as a code-tagging technique cannot do this.

3. Zero extra usage cost (works as long as page_owner is enabled) and
    a low barrier to entry (one echo line versus writing a bpf
    program).

On the pain points that motivated the series. On production machines
with large memory configurations (e.g., 250GB+):

1. Collecting page_owner information takes minutes to tens of minutes.
2. The output is several gigabytes to over 10GB.

That makes the raw output nearly unreadable and forces post-processing
with tools/mm/page_owner_sort.c, adding further workload. The root
causes are:

1. The PFN scan itself - unavoidable, it is the price of page_owner's
    core function of covering every page.
2. Printing every stack for every page - this dominates the cost and
    is avoidable. stackdepot already deduplicates stacks and keeps a
    refcount per unique stack; page_owner then re-prints the same stack
    once per page, and page_owner_sort deduplicates it all over again
    in userspace.

The filters target exactly this waste: they keep page_owner focused on
the user's area of interest instead of paying the full print cost.

On the overlap with dynamic tracing and allocation profiling: the
features do look similar, but the usage scenarios differ. page_owner
is not enabled by default on production systems, so most developers
rightly reach for the lighter-weight tools first - dynamic tracing or
allocation profiling. But when page_owner is already enabled, or the
lighter-weight tools cannot solve (or cannot conveniently solve) the
problem and enabling page_owner is an option, the advantages above
kick in: the historical snapshot is filterable in place, and the
filtered output is small enough to read directly.

So I see the filters as completing page_owner for the scenarios where
it is the right tool, rather than competing with the profiling and
tracing tooling.

>> Targeted filtering provides significant performance benefits on large memory
>> servers by reducing both execution time and output size. By filtering at the
>> kernel level before reading, only relevant page allocations are processed,
>> dramatically reducing the amount of data that needs to be handled in userspace.
>>

Thanks,
Zhen Ni
