Received: from mta1.migadu.com (out-42.mta1.migadu.com [95.215.58.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F3C39FCDB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349480; cv=none; b=GsrdKdh3O6NTrFxOkYp7XjeTnKV0PX80HlzXP3Ywn0qQmHY+7n6azAtD+HW3f8nQAx4I6dwVI7Lm/YhsyrWb6ySfe1zSbipDiMPZfohNThJfgCiRFVtQuSeL4XW/KJb841lXtPLNhM5E/lz4i5ytmqHaVYf8xu7kEql6vrB2pUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349480; c=relaxed/simple;
	bh=FQ3fwj4HF3bn+KhRvieo4GqR7LJ+Nrb7IZb14BFcNNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqWC6IzZSTR23F4ieYahnCjqBD/Als14VRrb9/JMHnApyObJULdNI2+rSdttnLGCfdjMPmd2rIdmTZPtBNW8YmEoIR+2QXyX7/SV7DXdpTtqdXXaPf2vnPvGfIGfZMJLqW/b1TqUPuqGgcAhp5SMeksIbj09htv13UcoP66tZ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IULNUPg0; arc=none smtp.client-ip=95.215.58.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IULNUPg0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FQ3fwj4HF3bn+KhRvieo4GqR7LJ+Nrb7IZb14BFcNNo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788349475; v=1; x=1788954275;
 b=IULNUPg0nHXswditelk/BOCU+pa3bBLxp5InD7yhF3hLPkFdYMUF89ZLtaeOa4AQ1ITHmLRI
 2+Ly92fai4lHHg84v1RdKrxXiGxVUtCuY3toqYfXa/rjScbnzE5/34Lj0sQFEJwH83P57+v1IqO
 qNR21SzIiED2K3s+MwztcUS4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7b46bf04467625a6;
	Wed, 02 Sep 2026 11:44:35 +0000
X-Mizu-Trace-ID: 7b46bf04467625a6
X-Migadu-Flow: FLOW_OUT
Message-ID: <2def1a1a-cb47-4435-bc8a-e787672022ae@linux.dev>
Date: Wed, 2 Sep 2026 19:44:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/shrinker: fix bogus set_shrinker_bit() with
 cgroup.memory=nokmem
To: Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org
References: <20260902073800.305481-1-jiayuan.chen@linux.dev>
 <5753d853-df04-4918-9852-c23842c66428@linux.dev>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <5753d853-df04-4918-9852-c23842c66428@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


on 9/2/26 7:34 PM, Usama Arif wrote:
>
> On 02/09/2026 08:37, Jiayuan Chen wrote:
>> With cgroup.memory=nokmem, shrinker_memcg_alloc() bails out early and
>> never allocates an id, so shrinker->id keeps the 0 it got from the
>> kzalloc() in shrinker_alloc(). __list_lru_init() then copies that 0
>> into lru->shrinker_id, where it looks like a valid bit index.
>>
>> Nothing calls expand_shrinker_info() on nokmem either, so
>> shrinker_nr_max stays 0 and every memcg ends up with an empty map
>> (map_nr_max == 0).
>>
>> deferred_split_folio() hands a real memcg to __list_lru_add()
>> regardless of whether the lru is memcg aware, so the first THP queued
>> in a cgroup does set_shrinker_bit(memcg, nid, 0) and trips the bounds
>> check:
>>
>> WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x7d/0x90, CPU#126
>> Call Trace:
>>   <TASK>
>>   deferred_split_folio+0x18c/0x220
>>   map_anon_folio_pmd_nopf+0xdd/0x130
>>   map_anon_folio_pmd_pf+0x14/0xb0
>>   do_huge_pmd_anonymous_page+0x1a1/0x620
>>   __handle_mm_fault+0xea9/0x10d0
>>   handle_mm_fault+0xe5/0x320
>>   do_user_addr_fault+0x1cc/0x870
>>   exc_page_fault+0x81/0x1b0
>>   asm_exc_page_fault+0x27/0x30
>>   </TASK>
>>
>> Harmless, the WARN_ON_ONCE() is what keeps the out of bounds unit[]
>> read from happening, but the id should not look valid in the first
>> place. Clear it before returning.
>>
>> Two other spots could paper over this: drop the id in
>> __list_lru_init() when nokmem turns memcg_aware off, or make
>> deferred_split_folio() pass NULL like list_lru_add_obj() does. Both
>> leave shrinker->id lying around for the next caller, so fix it where
>> the id is handed out.
>>
>> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>> ---
>>   mm/shrinker.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index a70aab124a0e..7ec2a9704f6f 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -227,6 +227,8 @@ static int shrinker_memcg_alloc(struct shrinker *shrinker)
>>   {
>>   	int id;
>>   
>> +	shrinker->id = -1;
>> +
>>   	if (mem_cgroup_disabled())
>>   		return -ENOSYS;
>>   	if (mem_cgroup_kmem_disabled() && !(shrinker->flags & SHRINKER_NONSLAB))
>
> Thanks for the fix!
>
> I think the initialization would look better in shrinker_alloc()?


Well, we have to add macro if we move it to shrinker_alloc()


     shrinker->flags = flags | SHRINKER_ALLOCATED;
     shrinker->seeks = DEFAULT_SEEKS;

+#ifdef CONFIG_MEMCG
+        shrinker->id = -1;
+#endif


No strong preference for me :)

