Received: from mail-m15579.qiye.163.com (mail-m15579.qiye.163.com [101.71.155.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A2132C8B;
	Tue,  1 Sep 2026 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245402; cv=none; b=MwwNij/PcUbPOXMmZLMb9lNPbSbfwcznqI+6iEkySzwqpcCgUeo7jhl8bjWNZVFtOcaHOsuVubX2kFzar7yzkzOePGdjfjJQQqg2rTYrczacbaOhQLLVGtB+XmxjI5Dzar42LMMwY5wcPyCsv4jFwuoTmDVtjcRsnAgmoGND2WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245402; c=relaxed/simple;
	bh=NHNxEZJXYgAHKb+TI8KOG1lDALWcsz0dQQPADFKjH2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6RsRqXEycg+77UDSVY9AWxL4838ZDztqCLxP9B6G+xxaVGinrHtu8v8J06+srWfOAzgZ6uqYQW/pgFyyzdzqRukJJim/8gJ+abWQ0QX9HbvsFfONONVwHxQuFfTokritWCE11uDd+VcSWGvFteHKQ/0K/wl1P5XOBhswlQPZ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=101.71.155.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1e8c82612;
	Tue, 1 Sep 2026 14:34:34 +0800 (GMT+08:00)
Message-ID: <9fce3210-3548-4df3-ae00-730b666f5d57@easystack.cn>
Date: Tue, 1 Sep 2026 14:34:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup filtering
To: Andrew Morton <akpm@linux-foundation.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828031339.1270699-1-zhen.ni@easystack.cn>
 <apEx0wT_hWs1Q5Wp@gremlin>
 <20260828113654.d01abd8baed3f73e87506eb3@linux-foundation.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <20260828113654.d01abd8baed3f73e87506eb3@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05bad3a510229kunm61780f1f274d70
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhpMVkhLTEIYGkNKGE1OSlYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	hKSkJMVUpLS1VKQktLWQY+



在 2026/8/29 02:36, Andrew Morton 写道:
> On Fri, 28 Aug 2026 08:03:38 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> 
>> On Fri, Aug 28, 2026 at 11:13:31AM +0800, Zhen Ni wrote:
>>> This patch series adds process and memory cgroup filtering support to
>>> page_owner. Following the previous series that introduced print_mode and
>>> NUMA node filters:
>>>    https://lore.kernel.org/linux-mm/20260707115411.1714314-1-zhen.ni@easystack.cn/
>>>
>>> This series adds filtering capabilities to page_owner, allowing users to
>>> filter output by specific processes and memory cgroups. Users can now
>>> filter page_owner output by PID, TGID, COMM (with wildcard support), and
>>> memory cgroup path. This makes page_owner debugging more focused and
>>> efficient for tracking memory allocations in specific contexts.
>>
>> The majority of this cover letter feels like it should have been
>> documentation put somewhere :)
> 
> yes please.
> 
> The only thing longer than the cover letter is the Sashiko report ;)
> 
> 	https://sashiko.dev/#/patchset/20260828031339.1270699-1-zhen.ni@easystack.cn
> 
> 

Hi Andrew, Lorenzo,

Thanks for the review.

I have analyzed all the Sashiko report findings. Some will be fixed in
the next version, and for the rest I propose not to fix them, with
reasons below. If there are no objections I will send v2 accordingly.

Will be fixed in the next version:

- mm/page_owner.c: drop the kstrdup() copy in parse_pid_t_list(); the
   token will be parsed in place. This also fixes a leak on the success
   path and a kfree() of an advanced (interior) pointer on the error
   path. cmp_int() will replace plain subtraction in cmp_pid_t(), and
   pid values exceeding PID_MAX_LIMIT will be rejected.
- mm/page_owner.c: PAGE_OWNER will select GLOB so glob_match() is
   always linked in; parse_comm_list() will drop its kstrdup() copy the
   same way.
- mm/page_owner.c: the cgroup path buffer will be allocated once per
   read() outside the page_ext RCU read-side critical section instead of
   per page inside get_page_memcg_info() (GFP_KERNEL allocations must
   not sleep there). The memcg= parsing branch will be guarded by
   CONFIG_MEMCG so kernels built without memcg reject the command
   instead of silently enabling a filter that never matches.
- tools/mm/page_owner_filter.c: user-visible input errors (empty
   -p/-t/-c/-g arguments) will print error messages instead of exiting
   silently.
- Documentation: the wildcard pattern in the -c example will be quoted
   to prevent shell glob expansion.

Proposed not to fix, by design:

1. Shared-fd concurrent read/write races (READ_ONCE around the pid
    passed to bsearch, torn reads of pid/tgid lists, glob_match() racing
    comm rewrites, concurrent write() leading to state->memcg_path
    double-allocation): multi-threaded sharing of one page_owner fd is
    not a designed use of this interface. The filters are per-fd state
    meant to be configured once and then read, which is what the
    page_owner_filter tool does. Adding locking to the read path would
    put overhead into the per-page scan loop for no designed benefit.
    This matches the semantics of the original filter introduction.

2. No "clear filter" support (empty pid=/tgid= lists partially clearing
    proc filters, empty memcg=/nid= being rejected): write commands are
    incremental -- "keep the unmentioned filters" -- and there is no
    clear operation by design. To start over, close the fd and open a
    fresh one; the page_owner_filter tool already works this way. This
    also matches the semantics of the original filter introduction.

3. kcalloc() vs kmalloc_array() for new_comm_list: no consumer of the
    list reads past strscpy()'s NUL terminator, so uninitialized bytes
    are unreachable.

4. char cgroup_path[512] in validate_cgroup_path(): acknowledged that
    the kernel side accepts paths up to PATH_MAX (4096). The userspace
    check truncates an over-long path with snprintf() and then fails
    access(), so it is rejected, never silently accepted. Bumping the
    buffer to PATH_MAX would only serve pathological paths; realistic
    cgroup paths are well under 100 bytes, so 512 wastes nothing in
    practice.

If this plan looks reasonable I will send v2.

Thanks,
Zhen Ni
