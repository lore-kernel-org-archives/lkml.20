Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39E31CD2C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487830; cv=none; b=nqpPznDUliLpIhZRDEit99cRXzu1xBpfc8ryo1whEyaFUrlOCynrdtR7/kmfOxVfVgibH4txczv54Zalm85OaK4gMk2vJ404oh4qoC2PfAXh5oZ9a1wh4lF0tWIYbh0fHe5nKlbTvXf17WIj/tz7NFgG928gPCE4/Ghw3rOzxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487830; c=relaxed/simple;
	bh=TvrAl2cYMtM+/ORC2WefEChu8OnPh6WDj583uPi1jAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdTGjc9lv0Ru2WebDLVr8ixfbbeCd30KICfV1pc4SV12XED5jECU4ZpCcJagoZT9UnK3/AxK0KgjzkCMobD2Fm/jhc3AFmxzZeYKl5bJKdYmQv7oX8Muake85PdCumL6gogzAiI8HR4T+3QknqyPzN/ENpu4gcI+wMjGecjS47A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=w/8PNvjb; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="w/8PNvjb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788487824; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=J+SHGWUY7CbETPDlAl8WdiZ5m/7wagn5ECpymwWOZn0=;
	b=w/8PNvjblp7RmBFdKubmxBQBCYmaCVsTgeD3sgfxrlLpAzMSUBXdOwHrwFriourbvjt7HRvdbIqJAJVdz0ondCmGuxzWUYCxAoxA5YSz9e3FLUwEkN5+ORKv9Dgbx0aeV//IHVJ7B9kO9QWlZPIgk8c7za0xpQCvbp7rDqYoagA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XAHIyJ-_1788487822;
Received: from 30.178.82.219(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XAHIyJ-_1788487822 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 10:10:23 +0800
Message-ID: <697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com>
Date: Fri, 4 Sep 2026 10:10:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lance Yang
 <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Dave Chinner <david@fromorbit.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>, Xunlei Pang
 <xlpang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
 <aphXPCn8isUVV87k@localhost.localdomain>
 <0c5aba0f-137a-4aaf-bddc-060118322602@linux.alibaba.com>
 <apktMn_hwvZwsRUG@localhost.localdomain>
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
In-Reply-To: <apktMn_hwvZwsRUG@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Michal

On 9/3/26 5:20 PM, Michal Koutný wrote:
> On Thu, Sep 03, 2026 at 12:06:53PM +0800, Qinyun Tan <qinyuntan@linux.alibaba.com> wrote:
>> You're right, that sentence is imprecise - SHRINKER_NONSLAB shrinkers
>> do register per-memcg under nokmem.  What I meant is that on a system
>> where no NONSLAB shrinker happens to register, shrinker_nr_max stays 0.
> 
> And ideally, with cgroup.memory=nokmem no slab-based code should call
> set_shrinker_bit() with whatever shrinker_id.
> 

Agreed, and with this patch that holds: slab-based lrus fall back to
shrinker_id == -1 and set_shrinker_bit() is never reached.

>> That said, I see the flag restoration and this patch as complementary
>> rather than either-or: 
> 
> Yes, it fixes your immediate issue and it is a prudent approach in
> list_lru_init(). OTOH, with this fixup, we won't be able to learn about
> shrinkers that are missing SHRINKER_NONSLAB.
>

True. Though the old behavior wasn't a reliable canary either: the
warning only fired while shrinker_nr_max was still 0. Once any
SHRINKER_NONSLAB shrinker had expanded the maps, a missing flag showed
up as a silently mis-set bit 0 rather than a warning. With your audit
below covering the current tree, I think losing that accidental signal
is an acceptable trade-off.
 
> 
>> other MEMCG_AWARE-but-not-NONSLAB shrinkers
>> (superblock, workingset shadow nodes) still take the fallback path
>> under nokmem by design, and __list_lru_init() copying an unassigned
>> id there is a landmine independent of the deferred split case.  So I
>> think this patch is still wanted as the generic fix, with the flag
>> restoration on top for THP.
>>
>> (zswap might deserve the same NONSLAB treatment as THP, btw - its
>> entries resolve the memcg from the folio's objcg, which is available
>> regardless of nokmem.)
> 
> _That_ is an important point.
> So that would need a fix too, and likely Fixes: b5ba474f3f518 ("zswap:
> shrink zswap pool based on memory pressure").
> 

Will do.

> (I'd have preferred if there weren't Fixes: 03375203e1da8 which honors
> the SHRINKER_NONSLAB semantics and it only uncovered pre-existing
> missing flags. Or keep that Fixes: but explain the relation to the other
> commits. (To make it clear to backporters.))
> 

Fair point.  I'd propose retargeting the tag to

  Fixes: fafaeceb89a5e ("mm: switch deferred split shrinker to list_lru")

as that is the commit that made the problem user-visible: it put a
list_lru holding charged user folios behind a fallback shrinker, and
the boot-time warning is reproducible from v7.2 on.  Does that work
for you?

Andrew, thanks for the sentence fixup yesterday.  If Michal agrees,
could you please also retarget the Fixes: tag:

  -Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with cgroup.memory=nokmem")
  +Fixes: fafaeceb89a5e ("mm: switch deferred split shrinker to list_lru")

>> Would you like me to send a separate patch restoring SHRINKER_NONSLAB
>> in thp_shrinker_init() (Fixes: fafaeceb89a5e)?  Happy to do so if
>> that works for you.
> 
> SHRINKER_MEMCG_AWARE are due to be checked for correct marking with
> SHRINKER_NONSLAB. I can see that it is missing in: thp-deferred_split,
> zswap-shrinker in the v7.3-rc1. (The shrinkers in nfs42xattr.c seem to
> be slab-based so they're correct.)
> 

Thanks for auditing the whole tree.  I'll send a two-patch series
restoring/adding SHRINKER_NONSLAB for thp-deferred_split
(Fixes: fafaeceb89a5e) and zswap-shrinker (Fixes: b5ba474f3f518).

> The shrinkers mentioned in your original commit message:  workingset
> shadow nodes, superblock lrus are both slab-based, so systemd with only
> those shouldn't be affected by this bug.
> 

Right - they were listed only as lrus that end up carrying the bogus
id 0, not as triggers; as the changelog notes, their objects resolve
to a NULL memcg under nokmem so set_shrinker_bit() is never called for
them.  The only actual trigger is thp-deferred_split.

> Thanks,
> Michal


Thanks,

Qinyun Tan
