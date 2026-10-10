Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D03803D6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621370; cv=none; b=R4MrlaV4dLkgDf3K+zzaQXIBz6YsumLo/qlkJm6OZGzHkt0mcyiaHeXnyEvs0E2sRjdDhTuFrYg8loNbQMZYI0x65ZYsCkhxbH/lTqU+G0pOHfWIvF/o7r2lA+hShWeHKpbuQlKGcju2oA9BtviLV6/Cj6UotRN6P6OlJ7s7Dck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621370; c=relaxed/simple;
	bh=/RC+izwEEYy8ZXvE6WOHCJ7ZNBYqaR8RFs6URHqTudY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIEHJwfOLtCmd/wLQbGYuBVYE9Yt4N/AsvbDn8ag5OCoVn7Yi2Z2ndCYgRUVaR7/Z9yaokvBgQ41WRWor2Xan/YfD+/AxA7Ew2A3h3YUPlgUB/zYD8Io4e2uCMzGVpnX9FrgjObVug+rZjhmAyj1SPFM98jE46hU+BZKl1Sv3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GedrZ0qo; arc=none smtp.client-ip=95.215.58.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GedrZ0qo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/RC+izwEEYy8ZXvE6WOHCJ7ZNBYqaR8RFs6URHqTudY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791621363; v=1; x=1792226163;
 b=GedrZ0qoPV7WD3EYE661u5OPJwvgyiOKYyTTetYQDCIYrEQJAmWjG86J2Ccyn27cx8B/qK+S
 5QZUPWr1POkSxmS5F5xSQWVrZPtWWml34ngb9g2w+Wk5Oc1FzgNpVe1dUho9lSuSYcwDcGQoRP1
 q0S2Wp/1ic5OBfC9uwfokt5w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 765dd94070c37712;
	Sat, 10 Oct 2026 08:36:03 +0000
X-Mizu-Trace-ID: 765dd94070c37712
X-Migadu-Flow: FLOW_OUT
Message-ID: <331b4e40-8d0c-4333-b2b6-b81e4c4b2e17@linux.dev>
Date: Sat, 10 Oct 2026 16:35:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned
 pages
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Yuanhe Shu <xiangzao@linux.alibaba.com>, akpm@linux-foundation.org
Cc: vbabka@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
 ziy@nvidia.com, ying.huang@linux.alibaba.com, wangkefeng.wang@huawei.com,
 tujinjiang@huawei.com, mgorman@techsingularity.net, chengkaitao@kylinos.cn,
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
 <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
 <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/28 20:12, David Hildenbrand (Arm) 写道:
> On 9/28/26 12:58, Yuanhe Shu wrote:
>> memory_failure() sets PG_hwpoison on the error page before it manages
>> to pin the folio via get_hwpoison_page().  Compaction running on
>> another CPU can isolate that same folio in the meantime, so
>> HWPoisonHandlable() then fails on !PageLRU(), the retry loop in
>> get_any_page() exhausts itself and memory_failure() gives up with
>> MF_IGNORED - while compaction still has the folio on its
>> migratepages list, flagged PG_hwpoison.
>>
>> Nothing stops compaction from migrating such a folio afterwards.
>> The corrupted data is copied into a fresh folio that carries no
>> poison marker, and no hwpoison PTE entry is installed on the way
>> back: the userspace mapping is silently redirected to the corrupted
>> copy and no SIGBUS is ever delivered.
>>
>> Note that a large folio with a PG_hwpoisoned subpage can also sit on
>> the LRU without any race at all, via the THP-split-failure path of
>> memory_failure() (kill_procs_now() + MF_MSG_UNSPLIT_THP).  Guarding
>> compaction is therefore needed regardless of how the race in
>> memory_failure() itself might be addressed.
>>
>> folio_mc_copy() does not close this hole: it only detects corruption
>> at copy time and only where ARCH_HAS_COPY_MC is implemented (x86_64
>> and PPC64; elsewhere copy_mc_highpage() degrades to a plain copy).
> 
> Then they should implement it.
> 
>> Software-injected poison - what MADV_HWPOISON and the hwpoison-inject
>> interface produce, and what tests and fuzzers exercise - never traps
>> during the copy on any architecture.  
> 
> And these are debug interfaces, why do we care?
> 
>> An isolation-time check avoids
>> the migration entirely, on all architectures and for both real and
>> simulated poison.
> 
> It's racy. See the link below.

Could we recheck PG_hwpoison on the source page after folio_mc_copy()
completes, but before the mapping is transferred, and abort migration
if the flag is set? This would prevent PG_hwpoison from being lost
after migration.

Completely closing the race window by modifying the arch-specific
copy_mc_to_kernel() implementation would presumably also require
corresponding hardware and architectural capabilities, which does
not seem very practical.

>> The check itself is two flag tests on the head page (PG_hwpoison
>> and the folio-level has_hwpoisoned marker), not a walk over
>> subpages.
>>
>> Neither page reclaim nor memory hotplug lets such a folio be
>> copied into a fresh one: reclaim unmaps the poisoned order-0 page,
>> and skips the hwpoisoned large folios it cannot safely unmap, in
>> shrink_folio_list()
>> commit 1b0449544c64 ("mm/vmscan: don't try to reclaim hwpoison folio")
>> commit 9f1e8cd0b7c4 ("mm/vmscan: fix hwpoisoned large folio handling in shrink_folio_list")
>> while memory hotplug refuses to migrate them in do_migrate_range()
>> commit 5f5ee52d4f58 ("mm/hwpoison: introduce folio_contain_hwpoisoned_page() helper").
>> Skip them in compaction as well, for the same reason reclaim settled
>> on skipping: the UCE is rare and a race with compaction is rarer
>> still, so skipping is enough, and a later memory_failure() will
>> handle the folio if the UCE is triggered again - while a migrated
>> folio would silently propagate the corruption instead.
>>
>> Deterministic validation on v7.3-rc4-75-g62f4c998b297: order-4
>> mTHP folios were brought into the stable "large, on LRU,
>> PG_hwpoisoned subpage" state by pinning a sibling subpage with
>> vmsplice and injecting MADV_HWPOISON on another subpage, which
>> makes memory_failure() take the THP-split-failure path; after
>> triggering compaction, /proc/kpageflags shows which poisoned
>> folios moved.  The unpatched kernel migrated 16/16 poisoned
>> folios and 16/16 clean controls in the same pageblocks; with
>> this patch, 0/16 poisoned folios were migrated while their
>> controls still migrated 16/16.
> 
> 
> Was any of this written by an LLM?
> 
>>
>> Soft offline is not affected: it only sets the poison marker after
>> its own migration has succeeded.
>>
>> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
>> ---
>>  mm/compaction.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index a049415512c6..491adcbc5313 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -1093,6 +1093,14 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>>  		if (unlikely(!folio))
>>  			goto isolate_fail;
>>  
>> +		/*
>> +		 * Migrating would copy the corrupted data into a fresh
>> +		 * folio with no poison marker; skip, as memory hotplug
>> +		 * refuses to migrate such folios for the same reason.
>> +		 */
>> +		if (folio_contain_hwpoisoned_page(folio))
>> +			goto isolate_fail_put;
>> +
>>  		/*
>>  		 * Migration will fail if an anonymous page is pinned in memory,
>>  		 * so avoid taking lru_lock and isolating it unnecessarily in an
> 
> See
> 
> https://lore.kernel.org/linux-mm/20260707090136.52904-1-kaitao.cheng@linux.dev/
> 

-- 
Thanks
Kaitao Cheng

