Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324573;
	b=fNsHlnpfZOooMdusLN1pje9iVI4UDRLeoCsJqFnnHZS8FjN+Te9hQ/Qg8Hs5ygHndyQ3
	 Nuu5/kq1JnzIqPn02ajlZYy0qQhUAs/Kniw39+0yjpr/QSflChYsCX00zGSWbtd1ARhmN
	 MD6/w47hQkvzcaITlprdVAdg2063CTkYkzT4JELMasl1gnH2mo0yfD47GqPwd85IBQTxj
	 mpNC9d3FbNZ+iJAgJ7nuNb75Tkn8ttgH/J6Cnthg4ecVv6VSzvFCuf+3Dyc1l/1ln8S5N
	 2zUN5GvPrwV38rwkWeMAVixKY6CxCS6Yd/1LR1Ie9aSmKouHt7fXvWxBbV0JZHcahOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324573;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TBxZXYh+rnyuptLvE+V7HHrJXUSfiI1BqVTzYuv0qLg=;
	b=J310zy5O/0edbCTrmegW/jf5rOcPqfOwovCxVWwkeEWrrrrcuE5PsrRovb6m4wVsvAMX
	 qkzcvsh1bsPr7/NunnX01wjJwVarPXjCCUy7jB6PJkG0BYpOycP4/dbaO5dCpdGV7Htug
	 bCAb06RGo6l4ktmgM1lAS5w+3aPlpn6loEXp72Nbr9HaQP4OyHIf1E9qnz+IH+UWnpHQu
	 he5zmj/TkqY8KIK4kzoGj+TmKewgrdtXTnc7frVzXZxUlb8uhvTEw7ahSqFR3wHS2EOl7
	 Y2mN6lO17et0g+Wgidk+hGBPNnDt29YyaROVPvTGP4ZsBnysSMBs3Gpj+ZM0h7NVhOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lukwMlAI;
	arc=none smtp.remote-ip=95.215.58.157
Received: from mta1.migadu.com (out-157.mta1.migadu.com [95.215.58.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5116E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lukwMlAI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XomdjP+6ikw1iX4kxUba8UKw1CJW8x9SToeoXhnrG8A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793324570; v=1; x=1793929370;
 b=lukwMlAITGr9IA/sK8T0syVHmcChoj5Q/uek9rr6NPuA2s/7JdlUejj3nZSXe3FU/XQsCCZd
 ZJyT6kRSoGfSvGlJqzHWpru2mjJgnjgkSR/ZJbTbcTXibKs2UK/Lspguz0WXIKi3lhf2OsIxTaI
 +1bl73qDjF6btvPR7E9iO5hA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 304e299b05c364b4;
	Fri, 30 Oct 2026 01:42:50 +0000
X-Mizu-Trace-ID: 304e299b05c364b4
X-Migadu-Flow: FLOW_OUT
Message-ID: <eed3526e-9cda-45da-98f6-6473238ce4ef@linux.dev>
Date: Fri, 30 Oct 2026 09:42:45 +0800
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
Subject: Re: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on
 cross-node migration
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Boris Burkov <boris@bur.io>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Shivank Garg <shivankg@amd.com>, Ridong Chen <chenridong@xiaomi.com>
References: <20261027043214.2248986-1-ridong.chen@linux.dev>
 <20261029180326.84ae7b2c1f63f016c66bd28e@linux-foundation.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261029180326.84ae7b2c1f63f016c66bd28e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/30/2026 9:03 AM, Andrew Morton wrote:
> On Tue, 27 Oct 2026 12:32:14 +0800 Ridong Chen <ridong.chen@linux.dev> wrote:
> 
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> NR_KERNEL_FILE_PAGES counts page cache folios of mappings flagged
>> AS_KERNEL_FILE (currently the btrfs btree inode).  It is a per-node
>> counter: filemap_add_folio() adds to folio_pgdat() of the new folio and
>> filemap_unaccount_folio() subtracts from folio_pgdat() of the folio
>> being removed.
>>
>> __folio_migrate_mapping() does not move it when such a folio is
>> migrated to another node, so the source node keeps the count forever
>> and the destination node underflows once the folio is freed.  btree
>> folios are migratable through btree_migrate_folio(), so demotion,
>> DAMON-based migration (DAMOS_MIGRATE_{HOT,COLD}) or memory offlining
>> all hit this.
>>
>> Reproducer, on a QEMU guest with two memory tiers (node0 is DRAM with
>> all CPUs, node1 is a CPU-less slower node described via HMAT) and
>> /sys/kernel/mm/numa/demotion_enabled set:
>>
>>    1. mount a btrfs and create 20000 empty files, so that btree folios
>>       are cached on node0;
>>    2. echo 2G > /sys/devices/system/node/node0/reclaim, which demotes
>>       them to node1;
>>    3. umount and drop caches.
>>
>> nr_kernel_file_pages in /sys/devices/system/node/nodeN/vmstat after
>> each step:
>>
>>                    without this patch     with this patch
>>                     node0     node1       node0     node1
>>    1. cached         1868         0        1868         0
>>    2. demoted        1868         0          36      1832
>>    3. dropped        1832         0 (*)       0         0
>>
>>    (*) the counter has underflowed to -1832; negative values read as 0.
>>
>> The global value in /proc/vmstat is 0 after step 3 in both cases.
>>
>> Move it together with the other node-keyed page cache counters.  It is
>> a node-only counter, so use the node accessor, matching how it is
>> accounted elsewhere.  Interrupts are disabled here, as for the zone
>> counters below.
>>
>> This was pointed out by Shivank while reviewing the NR_FILE_THPS fix
>> for the same function.
>>
> 
> Thanks.
> 
> This and your "mm/migrate: move NR_FILE_THPS on cross-node migration"
> "only" address accounting errors, but a bug is a bug and these bugs
> might mess up people's memory-monitoring and NUMA-management tools.  So
> I think cc:stable.
> 
> What do people think?

Agreed, thanks.

-- 
Best regards
Ridong

