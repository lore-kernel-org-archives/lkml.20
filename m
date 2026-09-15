Received: from mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB57496D41
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461892; cv=none; b=txVX2uP/XCul9YQ8qIL7tBnVCE1DzdLrj+8pr2Jh5oVG5r03OEPeYUvaNRvsywumeVhEPlgnyZtIzWlyzEzka+WYJXma+Q+9T8lu2nqU8O8KiH1+lOBTq+14bfQcZNyCl8d+p6qZb2N3PYKuIIP5ZH7G5d52bQ4aJfkwil61eAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461892; c=relaxed/simple;
	bh=OdmaTEvWPgfTFD+u4aw06O2FSYvZjnGVMGwImr7GHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPBCUV0ULDYcS3QTdYirIchV6EhwAaHSlUweMHlXBvWgO0D2cz13eqxcCUKDwoMdxXau+igukRRlkMsmHrOsHG/wWVqcZiBoY9hhhIjYLsrxkLidudO3sYiU60G1ch/qsrDpjMZitRG4c6b7BBwf09lloXeLZPKEY7uVrNKw9FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H5nWwBKv; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H5nWwBKv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OdmaTEvWPgfTFD+u4aw06O2FSYvZjnGVMGwImr7GHt4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789461887; v=1; x=1790066687;
 b=H5nWwBKvXlQCIvrgfqP7aqsb1BOfq7cA2Dftrighr1kpCMGwYShZVKBJiIfe1RSUDQatmhH7
 VINOJ0Z5LJJAG2Yj6t2fzpksqmvxdNmm0EsE1B8t8eSf6PijQsuffYbYmFLhU/N2JY2blpNjuIf
 JQ2Qrs61fgn+3nd9YJ/2Yz8s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 96d8f489691b383c;
	Tue, 15 Sep 2026 08:44:46 +0000
X-Mizu-Trace-ID: 96d8f489691b383c
X-Migadu-Flow: FLOW_OUT
Message-ID: <e018e3a0-349a-4f36-90e0-8fafb001da43@linux.dev>
Date: Tue, 15 Sep 2026 16:44:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/oom_kill: fix hung tasks queued on mmap_lock behind a
 long reap
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Jiayuan Chen <jiayuan.chen@shopee.com>, Zhou Yingfu
 <yingfu.zhou@shopee.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, David Rientjes
 <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-kernel@vger.kernel.org
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
 <aqg-oG2HDIUeK5Us@tiehlicka>
 <20260914203533.3544ae8dd0903c7603b385c6@linux-foundation.org>
 <aqjsPW92SgcHONKO@tiehlicka> <3c8d1d8e-0e67-4d1a-b73d-4eadd6266aa6@linux.dev>
 <aqkAbBpYheX2DEHg@tiehlicka>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <aqkAbBpYheX2DEHg@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/15/26 4:23 PM, Michal Hocko wrote:
> On Tue 15-09-26 16:13:11, Jiayuan Chen wrote:
>> On 9/15/26 2:57 PM, Michal Hocko wrote:
>>> On Mon 14-09-26 20:35:33, Andrew Morton wrote:
>>>> On Mon, 14 Sep 2026 20:36:16 +0200 Michal Hocko <mhocko@suse.com> wrote:
>>>>
>>>>>> Call Trace:
>>>>>>    <TASK>
>>>>>>    __schedule+0x487/0x1870
>>>>>>    schedule+0x28/0xb0
>>>>>>    schedule_preempt_disabled+0x16/0x30
>>>>>>    rwsem_down_write_slowpath+0x1d4/0x750
>>>>>>    down_write+0x60/0x70
>>>>>>    __ksm_exit+0xb4/0x230
>>>>>>    __mmput+0x12c/0x150
>>>>>>    mmput+0x1e/0x30
>>>>>>    do_exit+0x283/0xa30
>>>>>>    do_group_exit+0x34/0x90
>>>>>>    get_signal+0x952/0x960
>>>>>>    arch_do_signal_or_restart+0x41/0x250
>>>>>>    exit_to_user_mode_loop+0xd3/0x560
>>>>>>    do_syscall_64+0x385/0x470
>>>>>>    </TASK>
>>>>>>
>>>>>> KSM is just the one LTP happened to hit: __khugepaged_exit() has the
>>>>>> same write lock cycle ahead of exit_mmap().
>>>>> Why is this a practical problem we need to care about? It is kind of
>>>>> natural that the oom victim exit path might race with the oom reaper. They
>>>>> share the same lock that is mutualy exclusive. The whole point of the
>>>>> reaper is to ensure there is a forward progress achieved. So before we
>>>>> start modifying this let's talk about any practical/real life problems.
>> Hi Michal, Andrew
>>
>> Agreed, the hung task warning itself is harmless, especially for a dying
>> task. The real problems are what sits behind it.
>>
>> With a 500G swapped-out victim the reap takes ~600s, and for all of it:
>>
>> 1. The victim cannot exit. __ksm_exit() needs mmap_lock for write and
>>   queues behind the reaper, so the process stays alive in D state for
>>   10 minutes and whoever waits for it (parent, container runtime)
>>   waits too.
>>
>> 2. ksmd and khugepaged stall. Once that writer is queued, their
>>   mmap_read_lock() on this mm queues as well, so both daemons stop
>>   for the whole system for the same ~600s.
> Right. But why is that a problem we need to fix? OOM reaper is taking a
> prortion of the exit time by doing the leg work of tearing down the
> address space. Exiting task would need to do the same so it is unlikely
> to terminate much faster.

Hi Michal

Sorry, the subject is misleading.

The total work is the same. But with the patch the reaper and exit_mmap()
free the memory at the same time, so it takes about half as long: 264s
instead of ~600s here.

The hung task warning is not the point either. If that were all, masking
it as Andrew suggested would be enough.

The warning showed that ksmd and khugepaged stop for the whole reap, and
that only happens with the reaper. A plain exit takes the write lock in
__ksm_exit() / __khugepaged_exit() first, which also removes the mm from
their lists, and only then holds the read lock in unmap_vmas(), so nobody
waits on it. With the reaper holding the read lock, the exit's write lock
waits behind it, and every mmap_read_lock() on this mm waits too, ksmd's
included.

So the patch is really about the reaper not holding mmap_lock for the 
whole reap.


