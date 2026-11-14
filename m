Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638773;
	b=g3rdMDXvDD+h0Eld+aB3IJy/T14fuNY2dIY/Uz0K0z+X1yTmJnvQsss8CYu7oB1nZZuh
	 9AXmaDxXqNzR5c+vRlWLR/kalAeQ+PP3HM5+CP2MsP9t2pFqIF/roPy/9f9RcKHpyla7N
	 gA9v3RLf10FR6XkzXHVykYf3cGtErnlK9E7kpkSv+mhe8aXgPmTG7h9cLPWkAyXoKrRAC
	 F4PN5iO9nxXUCA+3DPxZ8IE7+xNpW5sALjfvIzep960JlNCMRtOkhZ9OG6pyMDB1TfJ8L
	 Q3eEHPycJ6SMTt5Qcckd5QumrJl21qymPqUQS9jxNCspkVAa2uhKTxLQKNdfuklLgig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638773;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=H2sLgLOKrNeynVkasVZiOvcon7Y5kt9OU0MF0lujG9c=;
	b=bk2+/kSq/GeDDJpgYFO8TUqkC2LQJPWlmz1+bXRWn9pJXQp/5Qhf5pp7jBBKVHXY+7ol
	 DJQTRCPowhEWIOWwhctRkBV8w7Fa509Ez4t/LlxetqVu7XSt6tLutfqsrJQIPWyrn7mTN
	 kMUE3m3qvpZ7XkQoec2zcbQFWSvZu76hCkctkhMYm715rTFpdQ+zBmTg0klLze8qDz4wL
	 xK3Au4aBlrVoxGtvZFn/DYpuv4zEaCU69r1DrWBwaBPncfjhuqGZeeRP2qOCx9cfWSU8C
	 3+yWUNQZVHW1vG3bjMBq/DG0GG4LquPO3/itucOhmrdUjFuV0OLH0Rp2IlynoRKcoIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RphnadHq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0353606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0353606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RphnadHq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83B91516;
	Fri, 13 Nov 2026 22:46:08 -0800 (PST)
Received: from [10.163.154.162] (unknown [10.163.154.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D712C3F632;
	Fri, 13 Nov 2026 22:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794638771; bh=2p+aENh47akfGlWR6ZTS9pUD8OTqWk1g+6Ivv38eA3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RphnadHqNUso6hl5YrI4sir0E4KMlPFHhwYLkDbzg1C7hBuo/Y00JyeydDKOVwaeg
	 +cgLWiUAkBPnOEz57Pg399P2TnUHxCvpDmjWLtlV9VXwxsxpSCkL5cefwBFrFx4tB/
	 1WZu/r7k9IKPEDUoM8qx6OZiBwKBDiQBLPPoV9Tk=
Message-ID: <0b018af5-0a97-4e3c-9d28-5efca28f163a@arm.com>
Date: Sat, 14 Nov 2026 12:15:58 +0530
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
Subject: Re: [PATCH v2 0/7] mm: batch rmap walks during large folio migration
To: "Garg, Shivank" <shivankg@amd.com>,
 "joannelkoong@gmail.com" <joannelkoong@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kmanaouil.dev@gmail.com" <kmanaouil.dev@gmail.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "weixugc@google.com"
 <weixugc@google.com>, "byungchul@sk.com" <byungchul@sk.com>,
 "rakie.kim@sk.com" <rakie.kim@sk.com>, "vbabka@kernel.org"
 <vbabka@kernel.org>, "harry@kernel.org" <harry@kernel.org>,
 "ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>,
 "riel@surriel.com" <riel@surriel.com>, "david@kernel.org"
 <david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "surenb@google.com" <surenb@google.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "kinseyho@google.com" <kinseyho@google.com>,
 "Rao, Bharata Bhasker" <bharata@amd.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "gourry@gourry.net" <gourry@gourry.net>, "ziy@nvidia.com" <ziy@nvidia.com>,
 "usama.arif@linux.dev" <usama.arif@linux.dev>,
 "jannh@google.com" <jannh@google.com>,
 "liam@infradead.org" <liam@infradead.org>, "mhocko@suse.com"
 <mhocko@suse.com>, "ljs@kernel.org" <ljs@kernel.org>,
 "lance.yang@linux.dev" <lance.yang@linux.dev>,
 "joshua.hahnjy@gmail.com" <joshua.hahnjy@gmail.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>, "fvdl@google.com"
 <fvdl@google.com>
References: <20260813-migrate-rmap-batch-v2-0-3c5424c555c7@amd.com>
 <CAJnrk1ZkhvyGLUyZrf_gA3XBv1XTfHArGOMgqr=5XbSCBJHz4Q@mail.gmail.com>
 <2ed65a57aaa676a59651abd671f18dc9b55f9195.camel@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <2ed65a57aaa676a59651abd671f18dc9b55f9195.camel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/11/26 1:07 am, Garg, Shivank wrote:
> On Tue, 2026-11-10 at 16:08 -0800, Joanne Koong wrote:
>> On Wed, Aug 12, 2026 at 9:24 PM Shivank Garg <shivankg@amd.com> wrote:
>>>
>>> Migrating a PTE-mapped large folio currently walks the folio's rmap
>>> one page at a time. It does so twice per migration:
>>> 1. try_to_migrate_one(): Replace present PTEs with migration entries
>>> 2. remove_migration_pte(): Restore migration entries to working PTEs.
>>>
>>> For a folio with N contiguous PTEs, each walk repeats page_vma_mapped_walk()
>>> and the associated operation per subpage of the folio. (256 iterations
>>> for 1M folio).
>>>
>>> This series enables both walks to process a batch of consecutive PTEs
>>> that map the same large folio and do some refactoring and clean up on
>>> the way.
>>>
>>> Performance:
>>>
>>> AMD EPYC ZEN 3, 2-socket system (1 node per socket).
>>> move_pages() migrating 1 GB from node 0 -> node 1, throughput
>>> in GB/s:
>>>                        batch-         batch-restore
>>> folio     vanilla       restore-only   + unmap         restore%   restore+unmap%
>>> 4K        2.96±0.15     3.02±0.14      2.99±0.17         +2.2%    +1.0%
>>> 64K       5.99±0.10     6.12±0.08      7.65±0.16         +2.2%   +27.7%
>>> 256K      6.48±0.09     6.67±0.08      9.23±0.14         +2.9%   +42.4%
>>> 1M        6.76±0.10     6.98±0.10      9.74±0.19         +3.1%   +44.0%
>>> 2M       10.50±0.20    10.44±0.16     10.67±0.21         -0.5%    +1.6%
>>>
>>> In plain migration, the folio copy itself dominates the cost, so these rmap walk
>>> savings are only partly visible end-to-end.
>>>
>>> When the folio copy is batched-copy and offloaded to DMA engine [1], the copy is
>>> no longer the bottleneck and rmap-walk batching translates into much larger gains:
>>>
>>> This series + [1], DMA Offload on PTDMA (DCBM), 16 channels:
>>>
>>>                     batch-copy                      dcbm+restore
>>> folio    vanilla    -offload(dcbm)  dcbm+restore    +unmap          (rmap batch impact)
>>> 4K       3.05±0.13   2.76±0.11       2.77±0.12        2.74±0.09
>>> 64K      5.85±0.11  10.66±0.27      11.56±1.45       17.55±0.56
>>> 256K     6.26±0.08  13.64±2.73      13.68±0.16       34.76±0.57       (2.54x)
>>> 1M       6.58±0.08  14.25±0.07      15.27±0.77       44.28±0.27       (3.11x)
>>> 2M      10.61±0.24  65.26±0.96      65.25±1.65       65.66±0.87
>>>
>>
>> Hi Shivank,
>>
>> Are you planning to send a v3 of this series? My reason for asking is
>> because batching the unmap also fixes an existing issue where when
>> try_to_migrate_one() unmaps a PTE-mapped anon mTHP one PTE at a time,
>> the folio looks partially mapped partway through and gets flagged for
>> deferred split. My mTHP underused shrinker series [1] makes this more
>> common since every underused mTHP split will now go through this path,
>> which makes this bug a blocker for the series. More context can be
>> found in [2], which was my attempt to fix this bug, but then David
>> suggested we fix it in a better way by batching, and Zi pointed me to
>> this series.
>>
>> Thanks,
>> Joanne
>>
>> [1] https://lore.kernel.org/linux-mm/20261103212004.1356327-1-joannelkoong@gmail.com/
>> [2] https://lore.kernel.org/linux-mm/20261109220958.2071687-1-joannelkoong@gmail.com/
> 
> 
> Glad to hear this series helps your use case.
> 
> Yes, I'm working on v3. I slowed down on it because it depends on
> Optimize anonymous large folio unmapping series [1], which hasn't been
> merged yet.

Hi, I was on vacation, I am going to send the next version of this soon.


> 
> If it helps, I can send v3 sooner, addressing the v2 comments, rebase
> on the current tree, and split into unmap-side and restore-side series
> for easier review.
> 
> [1] https://lore.kernel.org/linux-mm/20260924131106.1730494-1-dev.jain@arm.com/
> 
> Thanks,
> Shivank

