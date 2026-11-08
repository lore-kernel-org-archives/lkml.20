Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142182;
	b=fPjlJ9qb1R/mlhU3S69b98uIyvbDyELl8xfm+1n44vwp3ktE+hxg6xJfD/qmeASVGSCj
	 YRKXSoDmspWpXfRhh+2eRc+qAS58fB1iTLCuLY57fa1sqVHc9OPvOp7zao9Zj3z++oC1R
	 E5RjoOUUwJ3FsqBJDc+3WA1KB6dCbbDgy9RQBA6oV72q9ayJsCIBpPZYmeQCstV5PXiNU
	 U+OQtqy+cZk3N5QHN2cQvnZHwt4dnR1I9/rdfiH64IpzBUd0epq8TPuGPJaTPGio2EFP6
	 VOjbxhclf63juX+ZVbt81nzDX7oHqDu7IaySf9UpG66kg4nPW/cxMyMunsP8hmNHTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142182;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2lK9pHrkcqJPTuUbe/F2Tx6U2WAl5/AGTU3cpzcdSo4=;
	b=wvk3y4PUKvyrsqG4i/iBSF/7AJ7Ws3agl/C/TyKn4pC5+KHEA/fAhe9gM1M6oBj/tc/e
	 z8LLLI36FFX1fnKq5GQd+Jtgl8WjnUjTMico4KJJz87SNslubvtrU/glpQlrvbYRNh4f8
	 XarkVvv5gZQWdbJ24c8rQ6NE/u9R8iWh7dxK2sGWoPvRly9KVm6YtqGGeGCMmIGV06EgD
	 25L+JxXXIxzFsR7sxTK/p60EiQnSSDNVskliwVtVyO0GJQJwc6YcvFXgycJZe+A/4b8UI
	 kWh4sVqkHls+aLXFir9d0thiycdz2NWsagxPbgpBtTctm7SWUq4MgtV7BCteHjPp1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YR63dAao;
	arc=none smtp.remote-ip=91.218.175.8
Received: from mta0.migadu.com (out-8.mta0.migadu.com [91.218.175.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D513606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D513606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YR63dAao
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PNfl9BuOnFonm6NGFSqEPPijub+CPM8DqK2sRwQhsVM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794142177; v=1; x=1794746977;
 b=YR63dAao0TX7lAVI8UCmQdazdxE0paNduCorTiHudV98fFq6+xeTi4Z+InjsKESA4NJF0JpQ
 nfW/BJDrJcdUGy5DEmzGwzGuSKBV1XKJyxxMpLt7lfn9YaTOcMdnVV8AbdEl0ajKkza7Z9GpnoM
 5DZnvSPwbRxkocJ1NLG4/2vg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55ae0acc5f595fe2;
	Sun, 08 Nov 2026 12:49:37 +0000
X-Mizu-Trace-ID: 55ae0acc5f595fe2
X-Migadu-Flow: FLOW_OUT
Message-ID: <bcd19107-b398-4811-ae73-e1e87a551bcb@linux.dev>
Date: Sun, 8 Nov 2026 20:49:23 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] mm/mglru: move lrugen atomic stats off the
 read-mostly lines
To: Barry Song <baohua@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Joanne Koong <joannelkoong@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261105132220.2233677-1-ridong.chen@linux.dev>
 <20261105132220.2233677-4-ridong.chen@linux.dev>
 <CAGsJ_4zLN1gXtDhhe1cvmerjOS=SAm1v2nnQm8u9ha9JADN+1A@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4zLN1gXtDhhe1cvmerjOS=SAm1v2nnQm8u9ha9JADN+1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/8/2026 5:14 PM, Barry Song wrote:
> On Thu, Nov 5, 2026 at 9:23 PM Ridong Chen <ridong.chen@linux.dev> wrote:
>>
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> lru_gen_eviction() and lru_gen_refault() update lrugen->evicted[] and
>> lrugen->refaulted[] locklessly with atomic_long_add(). The arrays sit at
>> the tail of struct lru_gen_folio, right before enabled/gen/seg/list:
>> with LRU_GEN_STATS=n the file type counters share a cacheline with them.
> 

Hi Barry,

Thanks for the review. Note that the sizes in the changelog were
measured with lockdep enabled.

Offsets below are from pahole on x86_64, LRU_GEN_STATS=n, counted
from the start of struct mem_cgroup_per_node (cacheline aligned), so
line N = bytes N*64 .. N*64+63.

The nesting is:
     mem_cgroup_per_node
       lruvec                at 128
         lrugen              at 128 + 176 = 304  (before the patch)
                             at 128 + 192 = 320  (after the patch)

> So basically, this is causing false sharing, right?
> 

Yes. Before the patch:

field                    offset       line
refaulted[0][file][*]    1608-1639    25    atomic, no lru_lock
enabled/gen/seg          1640-1642    25    read on every LRU add
list                     1648-1663    25    read by shrink_many()

line 25 (1600-1663)
+------------------------+-----------------+------+------------+
| refaulted[0][file][*]  | enabled,gen,seg | pad  | list       |
| 1608-1639              | 1640-1642       |      | 1648-1663  |
+------------------------+-----------------+------+------------+

CPU A (file refault)		CPU B (LRU add)
atomic_long_add(&refaulted[..])
				read lrugen->enabled -> miss
atomic_long_add(&refaulted[..])
				read lrugen->enabled -> miss

CPU B doesn't need refaulted[], but it keeps missing on line 25.

After the patch:

field                    offset       line
max_seq/min_seq/ts       320-375      5
enabled/gen/seg          376-378      5     read-mostly
list                     384-399      6
nr_pages[]               1040-1359    16-21 under lru_lock
evicted[]                1600-1663    25    own line
refaulted[]              1664-1727    26    own line

> I'd prefer a text diagram showing how the false sharing
> occurs, specifically how freq read and freq write end up
> in the same cacheline.
> 
> This will help clarify why rearranging the struct is the
> right approach and how to rearrange it properly.
> 
>>
>> Those fields are read far more often than they are written:
>> lru_gen_add_folio() reads ->enabled on every LRU add, and shrink_many()
>> walks ->list and reads ->gen/->seg under RCU. With frequent file refaults
>> from several CPUs, every refault invalidates that line on the CPUs doing
>> LRU adds.
>>
>> Move enabled/gen/seg/list next to max_seq/min_seq/timestamps, which are
>> also mostly read, and put evicted[]/refaulted[] in their own cacheline
>> group at the end of the struct. This grows struct lru_gen_folio from
>> 1360 to 1408 bytes and struct mem_cgroup_per_node from 2176 to 2240
> 
> Why is the difference exactly 2240 - 2176 = 64 bytes,
> which is one cacheline? I was expecting a value smaller
> than one cacheline :-)
> 

The aligned group makes lru_gen_folio cacheline aligned, and the
padding adds up on the way out:

lru_gen_folio         1360 -> 1408  (+48, hole before evicted[])
lruvec                1624 -> 1728  (+104, lrugen moves from offset
				     176 to 192, plus tail padding to 64)
mem_cgroup_per_node   2048 -> 2112  (+64)

mem_cgroup_per_node is cacheline aligned, so its size only changes
in whole lines. It had 40 bytes of padding after lruvec, which
absorbs part of the 104 bytes, and the rest takes one more line.


> What I'm not convinced about is that nr_pages should be
> updated even more frequently than evicted and refaulted.
> Why aren't they causing a false sharing?
> 

nr_pages[] (lines 16-21) is read and written only under lru_lock.
Its lines move between CPUs only when the lock does, and the new
lock holder needs the updated values anyway, so that is true
sharing. refaulted[] is written by CPUs that don't hold the lock,
so it can steal the line from the lock holder at any time, and the
lock holder doesn't even need it.

> long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> 
> It would be better to have a text diagram showing the
> potential false sharing, so we can consider the issue
> more comprehensively.
> 
>> bytes on x86_64 (one more cacheline per memcg per node).
>>
>> Tested on an i7-13700HX (24 threads) with turbo disabled and the
>> performance governor. 24 files of 128MiB on ext4 on brd, read with
>> fio (psync, randread, bs=4k, fadvise_hint=random, buffered), all jobs
>> in one memcg with memory.max=1G, so nearly every read refaults.
>> IOPS, median of 5 runs:
>>
>>    jobs      base   patched
>>       1    270537    274303   +1.4%  (sd 3.7%)
>>       8   1461025   1466293   +0.4%
>>      16   2455629   2508001   +2.1%
>>      24   2707720   2823776   +4.3%
>>
>> A custom random pread() test of the same setup, with this patch alone
>> against base over two boots of each kernel, shows +2.4% at 16 threads
>> and +5.9% at 24 threads, and no change at 8 threads or fewer. With
>> anonymous memory on zram, the refaults mostly hit the tier 0 counters
>> on a different line, and there is no measurable change.
>>
>> The gain grows with the number of CPUs refaulting into the same lruvec
>> and needs a fast backing store; with real IO it is likely to be lost in
>> the noise. The patch is mostly meant to keep the lockless counters away
>> from the read-mostly fields regardless of where they end up.
>>
>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>> ---
>>   include/linux/mmzone.h | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
> 
> Thanks,
> Barry

-- 
Best regards
Ridong

