Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075693;
	b=WAjhNuGofzJf47sxbJQgdNEXrtgOb4HTFTG0aKOBUuBPzE8hS9WBM8Az/LhAXwKKvN6s
	 bRES/9Jd4AlEMizTqnUxPf3E9qupa4AsLzJCOeX+I1tnHi+d29kz7ZYD7ONalyM8OfqdM
	 k880mt+cmk+gV8ZOx1Ih08PhjpOZkAf4yyojgma14pM+YX7NMAxEa+OWP85o9VCL2m76M
	 C6kLSbzjqsmWJP6b5UCegpEAo7pF665vaapVjjxZ9vBJUBvkGJB7spJ5Sbgihue0Yguia
	 PcEvoCsW8xAv/oTmXxXiMUkXvzP3qJHtjZpBymrs9pFoyM1IcHMDWzbWpr3CgIATuBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075693;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8bPDXwOSDS16plg0sE4B84SdEhQiLrfepkoN/xaCOWc=;
	b=UrJz9DOg3s6rUsfhJn4LIjExVvd+ug3tVoQwJbPYKHvkRgEXJtbZQ+f73+E/PbjbxuNB
	 wfEj/viVNI9R9VMdZLfcCbyaVApwJzgPRRp1OPuW43lV1Yp46DutkgQKWR1ibwSlyDNcF
	 UbDIJK/VQdJ5GcQ6y8fI/ESzV9efLzzYLvzZaSi9qtUNBRBBABbDMAJpOGcUZpN7PM754
	 tp4Lns76COlbeHX21kRwvTsDLv3mxJgzGmVm4EqWmt71/ABhWt8x5BhqRLVznrscIHU3+
	 xtTtvBxf9h8v5wqn1zI3xOpXbAxwd1lUQzPwhrRnPo9am17NRxWJGLf28n1EgjqPLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZXH+MRud;
	arc=none smtp.remote-ip=95.215.58.189
Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C63D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C63D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZXH+MRud
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nzg0KAy4r17iWdtc1/Guk/G16m3PL2GLFdlHcOEPTm8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793075690; v=1; x=1793680490;
 b=ZXH+MRud0A9N6N3RBKQRDno4784HvX4suabk/vTqyGni5R0GEvknRJ3hwC8RY6qdYzpS8w8z
 ub8AU3OOyuVar2e0Mq0CWSPKhgysvo7ByyynhxlXatGUGxMQZ/FqnUgFmwNjvZ2w2SHmORsjzUp
 PiG4OK58ecf0OGzLDj+76xL4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7c7d843a2b7f921b;
	Tue, 27 Oct 2026 04:34:50 +0000
X-Mizu-Trace-ID: 7c7d843a2b7f921b
X-Migadu-Flow: FLOW_OUT
Message-ID: <1267a0a3-d3fa-49ee-a791-294e62c29bb6@linux.dev>
Date: Tue, 27 Oct 2026 12:34:37 +0800
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
Subject: Re: [PATCH] mm/migrate: move NR_FILE_THPS on cross-node migration
To: "Garg, Shivank" <shivankg@amd.com>, "david@kernel.org"
 <david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "chenridong@xiaomi.com" <chenridong@xiaomi.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>, "ziy@nvidia.com"
 <ziy@nvidia.com>, "gourry@gourry.net" <gourry@gourry.net>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "joshua.hahnjy@gmail.com" <joshua.hahnjy@gmail.com>,
 "ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "byungchul@sk.com" <byungchul@sk.com>,
 "willy@infradead.org" <willy@infradead.org>
References: <20261025110209.4105994-1-ridong.chen@linux.dev>
 <c021e641-f415-48bc-badd-d340d70dd850@kernel.org>
 <6372d92c7b0ec9c3fef4e803e39e54a36f3aa918.camel@amd.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <6372d92c7b0ec9c3fef4e803e39e54a36f3aa918.camel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/2026 8:51 PM, Garg, Shivank wrote:
> On Mon, 2026-10-26 at 11:59 +0100, David Hildenbrand (Arm) wrote:
>> On 10/25/26 12:02, Ridong Chen wrote:
>>> From: Ridong Chen <chenridong@xiaomi.com>
>>>
>>> When a page cache folio is migrated to another node,
>>> __folio_migrate_mapping() moves the per-node and per-memcg counters
>>> that are keyed off the folio's node: NR_FILE_PAGES, NR_SHMEM,
>>> NR_SHMEM_THPS, NR_SWAPCACHE and NR_FILE_DIRTY.  NR_FILE_THPS is not
>>> moved, although __filemap_add_folio() charges it to the source node and
>>> filemap_unaccount_folio() takes it off whatever node the folio lives on
>>> when it is removed.
>>>
>>> Commit 0b52c420350e ("mm: fix shmem THP counters on migration") added
>>> the NR_SHMEM_THPS case but not its file-backed counterpart.  Now that
>>> ext4, xfs, btrfs and erofs can all have PMD-sized page cache folios,
>>> migrating them via NUMA balancing, mbind(), migratepages, demotion or
>>> memory offlining leaks FileHugePages on the source node and underflows
>>> it on the destination, in both /sys/devices/system/node/nodeN/meminfo
>>> and memory.numa_stat.  The global value is unaffected, which is why this
>>> went unnoticed.
>>>
>>> Reproducer, on a 2-node QEMU guest with THP set to "always":
>>>
>>>    1. read a 256M ext4 file through a MADV_HUGEPAGE mapping while bound
>>>       to node 0, so its page cache is 128 PMD-sized folios on node 0;
>>>    2. move the mapping to node 1 with mbind(MPOL_MF_MOVE);
>>>    3. unmap the file and drop its page cache.
>>>
>>> nr_file_hugepages in /sys/devices/system/node/nodeN/vmstat after each
>>> step (in units of PMD-sized folios):
>>>
>>>                      without this patch     with this patch
>>>                       node0     node1       node0     node1
>>>    1. cached           128         0         128         0
>>>    2. migrated         128         0           0       128
>>>    3. dropped          128         0 (*)       0         0
>>>
>>>    (*) the counter has underflowed to -128; negative values read as 0.
>>>
>>> Without the patch the 128 folios stay accounted to node 0 forever, and
>>> every further round adds another 128.  The same happens to the per-memcg
>>> per-node counter: after step 3, memory.stat of the cgroup shows
>>> "file_thp 0", while memory.numa_stat still shows
>>> "file_thp N0=268435456 N1=0".  With the patch both are 0.
>>>
>>> Move NR_FILE_THPS together with NR_FILE_PAGES, using the same condition
>>> filemap_unaccount_folio() uses to take it off, so that THPs in the swap
>>> cache are left alone.
>>>
>>> Fixes: d68eccad3706 ("mm/filemap: Allow large folios to be added to the page cache")
>>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>>> ---
>>> Note: prepared with help from an LLM-based assistant (Kiro, claude-opus-5.5).
>>>
>>>   mm/migrate.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>> index 7bdcdb57652f..d55f576a2579 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -700,6 +700,10 @@ static int __folio_migrate_mapping(struct address_space *mapping,
>>>   				mod_lruvec_state(old_lruvec, NR_SHMEM_THPS, -nr);
>>>   				mod_lruvec_state(new_lruvec, NR_SHMEM_THPS, nr);
>>>   			}
>>> +		} else if (!folio_test_swapbacked(folio) &&
>>> +			   folio_test_pmd_mappable(folio)) {
>>> +			mod_lruvec_state(old_lruvec, NR_FILE_THPS, -nr);
>>> +			mod_lruvec_state(new_lruvec, NR_FILE_THPS, nr);
>>>   		}
>>
>> Looking at filemap_unaccount_folio(), I was (once again) surprise about the
>> different handling.
>>
>> Key is that we might be migration aonymous folios in the swapcache.
>>
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>>
> 
> filemap_unaccount_folio() also checks for AS_KERNEL_FILE, but
> __folio_migrate_mapping() does not.
> 
> Should add this as well?
> 
Good catch, thanks. NR_KERNEL_FILE_PAGES has the same problem, and I
could reproduce it by demoting btrfs btree folios to a CPU-less memory
tier. Since it was introduced separately by e3a9ac4e866e ("mm: add
vmstat for kernel_file pages") and is a node-only counter, I sent it
as a separate patch on top of this one:

https://lore.kernel.org/20261027043214.2248986-1-ridong.chen@linux.dev

-- 
Best regards
Ridong

