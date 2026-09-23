Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631BA38B130
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132295; cv=none; b=kP6NxitkRwar7b90EwsN1FKyFJmpF0jDel3AqpKsy7fEPODJb0dGf5lyARc1/gTFI8tsx+w1C4gpDQWECvhCF1+tjfY/dTgzJI0xhPGjLFleTBfXfE5RHf9gwaqDVvccWPc0byy6TGcRp+iNFQZLeMT1BDJg92jQ0WL9Fx7K2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132295; c=relaxed/simple;
	bh=6Vsh4pgD9XmFglhMuT2WSLwM0FKMJEADGUqWTEd7oBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdP06Q4kHspHgAnR9MqEgSQTUZ0uM8abZhVJ25gBFzqONVNtFToD58bvB5R/h6vdFdhMy4AiorO6/+RBDfSuxIRVf4PuMLPvaGZ9d8wW/QFQ2TYgJ9t7yqgUuR/3KeckSEBytaCO5ZngIaXhyvUKHaYtbw0f4iNDYp9rZPV6QOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sU4ES9wk; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sU4ES9wk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790132289; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=MpMJiNla5q0wcx6Bz2QNntowy7sWY2tZqARzYeGdoq0=;
	b=sU4ES9wkWPbUG1LUMEW2qX50e5qz5ioc/Z6VMIS4tF1sFZXiEqwBg5w/gZxB/LYUvh3nooi1MDnPDNdCezf7hsD39BSQo/wXVbXttLUu40NQEpL+U4qGGlfvbz6w42mO9xgcHRDypdGq8j0Q4s8t7oPlU7ZXUl/64w/ZtOfRf5Q=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R601e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XBVYz1B_1790132287;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBVYz1B_1790132287 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 10:58:08 +0800
Message-ID: <167f0a33-315a-4782-bbfa-edab3fa22ace@linux.alibaba.com>
Date: Wed, 23 Sep 2026 10:58:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v2] mm: vmscan: put rotation-missed folios at the
 LRU tail
To: Ridong Chen <ridong.chen@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20260920132519.3369946-1-ridong.chen@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260920132519.3369946-1-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/20/26 9:25 PM, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> The page reclaim isolates a batch of folios from the tail of an LRU list
> and works on them one by one.  For a suitable swap-backed folio on an
> async swap device, it queues the folio for writeback and, after finishing
> the batch, puts the folio back to the head of the original LRU list.
> 
> Meanwhile the page writeback flushes the queued folios in its own,
> independent batches.  For each folio it writes back it calls
> folio_rotate_reclaimable(), which tries to rotate the folio to the LRU
> tail.  But folio_rotate_reclaimable() only takes effect once the folio has
> been put back by reclaim.  If the async swap device is fast enough, the
> writeback can complete a folio while reclaim is still working on the rest
> of the batch that contains it.  In that case the folio stays near the head
> and reclaim will not revisit it before wrapping around, causing a cold/hot
> inversion: a clean, written-back folio that should be a prime reclaim
> candidate is kept ahead of hotter folios.
> 
> commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back while
> isolated") addressed this for MGLRU only.  The traditional active/inactive
> LRU has the same problem, reported at [1].  A reproducer is available at
> [2].
> 
> Rather than re-reclaiming those folios (which would drop the swap cache
> that may still be useful for a future hit [4]), restore the rotation that
> was missed: when move_folios_to_lru() puts a folio back, add it to the LRU
> tail if it looks like it missed folio_rotate_reclaimable() (inactive, not
> mapped, not dirty and not under writeback).  A referenced folio is left at
> the head so it still gets a second chance, and a folio with an unexpected
> reference (e.g. a GUP or speculative pin) is left at the head because it
> cannot be reclaimed yet anyway.  A new do_rotate parameter gates this so
> it only applies on the reclaim put-back path (shrink_inactive_list()), not
> on shrink_active_list() where the list order is already deliberate.  This
> approach was suggested by Barry Song [3].
> 
> Only the traditional LRU is handled here.  MGLRU already retries such
> folios via its own clean-list retry pass in evict_folios(), so it is left
> unchanged.  The same do_rotate scheme could later replace that retry pass
> to unify both LRUs, which is left for a follow-up.
> 
> Test result with [2]:
> 
>    Without patch:
>      cat memory.usage_in_bytes
>      1073700864
>      cat memory.memsw.usage_in_bytes
>      1413124096
> 
>      free -h
>                    total        used        free
>      Mem:           1.6Gi       1.2Gi       299Mi
>      Swap:          1.0Gi       678Mi       346Mi
> 
>    With patch:
>      cat memory.usage_in_bytes
>      1071140864
>      cat memory.memsw.usage_in_bytes
>      1413423104
> 
>      free -h
>                    total        used        free
>      Mem:           1.6Gi       1.2Gi       322Mi
>      Swap:          1.0Gi       328Mi       695Mi
> 
> After applying the patch, the difference between
> memory.memsw.usage_in_bytes and memory.usage_in_bytes is close to the swap
> "used" value reported by 'free -h'.
> 
> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenridong@huaweicloud.com/
> [2] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@linux.dev/
> [3] https://lore.kernel.org/lkml/CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com/
> [4] https://lore.kernel.org/linux-mm/20260911121341.178028-1-alex@ghiti.fr/
> 
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---

Make sense to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
