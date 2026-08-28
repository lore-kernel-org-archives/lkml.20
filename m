Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1695A36195A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885334; cv=none; b=Y0o4zgM3wWIUsfugHlcuYu2NwceMqCT366gBMHPRMDK5Zh9Tq3gVv1nSzGqPFWsrdPGakTRuNcyFghdRGFAif2V7lB9TAJH1EavCo6gEElNOMZWJ804lMgnQ7Jg1AB95rBNPErb2FRGk80yMKjQ7Zi0wIz3zlkHTLCEy63D/lPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885334; c=relaxed/simple;
	bh=p2ffFFqlot4uRmrajtMu/cdM/mLnbrmiDMtUqVJBXEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6+CkovL4iIh1t6KrGpPWpUCIvPw76jgOT0+s94ked4xtypWm+lw4wFOQvJenxbpMhVbiMH1i5pTPiYub6t0qGRLRD3Y9ccvhquBHFDCHMJy0wwQcSggGUyZdx8+jBMANpRMgh2qQndXaoZsBpZHKkZhGjHnLv31EBKkf9ZM0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k7scsRan; arc=none smtp.client-ip=95.215.58.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k7scsRan"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=p2ffFFqlot4uRmrajtMu/cdM/mLnbrmiDMtUqVJBXEw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787885328; v=1; x=1788490128;
 b=k7scsRan4j02tUFUrEaHP1uBpz2lfZQTZlzIe+5xLq+qCadFF44KtZfTbOenAzoDlc1Dc9xz
 GtPJUkxIpbxVpG9nCWDBd3LgY7QU5n8MFPTc1FO4qm4XSlWaYZa3UuTJhj/p+JCCAb1YLAnyzui
 2Q/0oiFoo2oQ1/EsftLAaadE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 646f3d9741400a38;
	Fri, 28 Aug 2026 02:48:48 +0000
X-Mizu-Trace-ID: 646f3d9741400a38
X-Migadu-Flow: FLOW_OUT
Message-ID: <51f48626-c38b-4cd6-a826-92d107ae35bb@linux.dev>
Date: Fri, 28 Aug 2026 10:48:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] make unused huge shrinker memcg aware
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, usama.arif@linux.dev,
 brauner@kernel.org, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
 <20260827155020.530e28b0afa3b43fede9aa9c@linux-foundation.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260827155020.530e28b0afa3b43fede9aa9c@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 8/28/26 6:50 AM, Andrew Morton wrote:
> On Mon, 17 Aug 2026 17:03:24 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:
> 
>> Changes in v4:
>> Changes in v3:
>> Changes in v2:
> 
> Thanks for the diligent versioning info.  fyi, it is conventional to
> maintain this below the --- separator.  It's not really the most
> important part of the [0/N]!

Got it.

> 
>>
>> The shmem unused huge shrinker maintains a per-superblock list of inodes
>> whose tail huge folio extends beyond i_size.  Because this list is not
>> memcg aware, reclaim triggered by memcg A can scan inodes across the
>> entire superblock and split huge folios charged to unrelated memcg B,
>> causing unexpected impact on it.
>>
>> In the worst case, memcg A has no reclaimable shmem at all, making the
>> reclaim entirely useless and incurring unnecessary latency.  We observed
>> this in production, where page lock contention during split caused
>> multi-hundred-millisecond stalls:
> 
> Ugh.  That's the most important part!
> 
>>    tid 11340 comm scanner locked a page for 182264 us! kstack:
>>            unlock_page+1
>>            split_huge_page_to_list+3135
>>            shmem_unused_huge_shrink+767
>>            super_cache_scan+329
>>            do_shrink_slab+291
>>            shrink_slab+533
>>            shrink_node+400
>>            do_try_to_free_pages+206
>>            try_to_free_mem_cgroup_pages+262
>>            try_charge_memcg+591
>>            mem_cgroup_charge+136
>>            __handle_mm_fault+2431
>>            handle_mm_fault+194
>>            do_user_addr_fault+462
>>            __do_page_fault+176
>>            do_page_fault+48
>>            page_fault+62
>>
>> Usama's recent patch [1] prevents the shmem unused shrinker from being
>> invoked during memcg-level reclaim altogether, but this is overly
>> conservative: we can do better by reclaiming only the shmem charged to
>> the reclaiming memcg.
>>
>> This series converts the shrinker list to a memcg-aware list_lru, so
>> that non-root memcg reclaim walks only candidates charged to the
>> reclaiming memcg.  Global reclaim, root memcg reclaim and shmem quota
>> reclaim retain their existing global semantics.
>>
>> To avoid pinning a dying memcg through a long-lived CSS reference, each
>> inode stores an obj_cgroup reference instead of a mem_cgroup reference.
>> The list_lru add/delete paths resolve the current memcg from the objcg
>> under RCU, staying consistent with list_lru's own memcg migration on
>> offline.
> 
> Sashiko said a few things and they look disturbing-if-true:
> 
> 	https://sashiko.dev/#/patchset/cover.1786955972.git.zhengqi.arch@bytedance.com
> 
> (Apologies if this has already been considered - we don't have ways of
> tracking all this (yet, I hope) apart from personal memory and personal
> memorys are quite fried at present)

As both Usama and I have pointed out [1][2], [PATCH v4 1/4] is the part
that got dropped during the merge. The complete patch [3] was actually
reviewed a while ago.

[1].https://lore.kernel.org/all/20260810101954.822260-1-usama.arif@linux.dev/
[2]. 
https://lore.kernel.org/all/9c7efd5f-f8d3-4926-acb4-34c326ffb1c3@linux.dev/
[3]. 
https://lore.kernel.org/all/20260715103516.2410175-1-usama.arif@linux.dev/

Thanks,
Qi

> 

