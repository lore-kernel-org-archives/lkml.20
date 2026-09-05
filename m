Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664534A23
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 04:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788580991; cv=none; b=vAKyOWFau2ZBOu4vAypY4gCApNI910CNnQyy8a8aKH4934ochhFXQ4iAQdTmBeweVmmVa3I3toB21BxiG9TLcumnI7h6idojG0+m0KxbsFMArU6BKtU0UbyDOpeOwY3xXqzXXpeTxFZwQjVu3lymDqLpzQ6obVZfahD7OReig1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788580991; c=relaxed/simple;
	bh=HOm76wCRr9lGlb51rtsDl6pdm6VtnH5a0FwlzQOTo+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tB8ns7LeUt3u7Y7sZlDwrC5REnN9iDzwy4tAiv8uF3gJ3ak9H89ycNW029Fr4YOKrIHg7GWkxjrIYezs8P0mWISmin16RBqdaYuss4wCdVXHdaPDQYg0vvSvrTlpkhXIdb6vXD9mtIMtqiNnSNAK7rLwx7BJ7VewRHtIg3IW7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcKR629StzKHMPj
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:02:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id A15064057D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:03:06 +0800 (CST)
Received: from [10.166.163.161] (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgB3NbN5lJtqvW00Aw--.4273S2;
	Sat, 05 Sep 2026 12:03:06 +0800 (CST)
Message-ID: <ac358441-95be-4254-ae2e-f9b2f6eb544e@huaweicloud.com>
Date: Sat, 5 Sep 2026 12:03:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm, swap: Fix potential NULL dereference when
 trying a sleep table allocation
To: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <ryncsn@gmail.com>
Cc: chrisl@kernel.org, kasong@tencent.com, nphamcs@gmail.com,
 baoquan.he@linux.dev, youngjun.park@lge.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260820115505.20027-1-shikemeng@huaweicloud.com>
 <20260820115505.20027-2-shikemeng@huaweicloud.com>
 <ao_ybL9yRO_pHphW@KASONG-MC4>
 <20260828180338.0e62379137b832bd66d48b7d@linux-foundation.org>
From: Kemeng Shi <shikemeng@huaweicloud.com>
In-Reply-To: <20260828180338.0e62379137b832bd66d48b7d@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgB3NbN5lJtqvW00Aw--.4273S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1rGr45Gr4DXFy3Aw1DWrg_yoW8Zw48pF
	sYga98KF45tr9rXr4vya4vva4ruw4F934DW3WxKw1293Z8Xr1xWrWkCrZYvFyDC3Z7Xryq
	gr1UKw17uws0vrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUymb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UG-eOUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

在 2026/8/29 9:03:38, Andrew Morton 写道:
> On Thu, 27 Aug 2026 17:10:54 +0800 Kairui Song <ryncsn@gmail.com> wrote:
> 
>>> --- a/mm/swapfile.c
>>> +++ b/mm/swapfile.c
>>> @@ -466,8 +466,6 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
>>>  	if (!table)
>>>  		return -ENOMEM;
>>>  
>>> -	rcu_assign_pointer(ci->table, table);
>>> -
>>>  #ifdef CONFIG_MEMCG
>>>  	if (!mem_cgroup_disabled()) {
>>>  		VM_WARN_ON_ONCE(ci->memcg_table);
>>> @@ -487,6 +485,12 @@ static int swap_cluster_alloc_table(struct swap_cluster_info *ci, gfp_t gfp)
>>>  		return -ENOMEM;
>>>  	}
>>>  #endif
>>> +
>>> +	/*
>>> +	 * Make tables visible to cluster_is_usable() after everything is
>>> +	 * ready.
>>> +	 */
>>> +	rcu_assign_pointer(ci->table, table);
>>
>> Hmm, but for the error paths above, they will leak the new allocated table?
> 
> Sashiko thinks so ;)
> 
> It also might have found a pre-existing data-race which seems
> sufficiently on-topic for this patchset?
> 
> 	https://sashiko.dev/#/patchset/20260820115505.20027-1-shikemeng@huaweicloud.com
Thanks for thre review, I will address the leak in the next version.

As for data-race concern, I analyzed it in [1] and concluded that the cluster lock
already serializes all accesses in question:

/* ci->table: protected by cluster lock */
swap_cluster_lock()
cluster_is_usable()
 cluster_table_is_alloced()
swap_cluster_unlock()

/* memcg_table: protected by cluster lock */
mem_cgroup_try_charge_swap
 swap_cluster_get_and_lock()
 __swap_cgroup_set()
 swap_cluster_unlock()

/* zero_bitmap: protected by cluster lock */
swap_writeout
 swap_zeromap_folio_set
  swap_cluster_get_and_lock
  __swap_table_set_zero
  swap_cluster_unlock

Since all three accessors acquire the same cluster lock, no data race
or memory-ordering issue exists on these shared variables.

Please let me know if I miss any case.

[1] https://lore.kernel.org/all/76738b02-1f12-4deb-84f7-542d9830b0b5@huaweicloud.com/

Thanks,
Kemeng

