Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB8386C1E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460008; cv=none; b=sRT4Sa/lSuDL4qCsbD8oSfMTGkg/CDOGxYYAjDm7uPGYQH+FDLTAknE1b2smV649cjDNh8ztNRYEXXMkIlJ4RxDU2w3fzYY2hsUcIQcY3SXoxlRAJTr6rEkOxOzCnom6qm6/VeRek04JMg6Db48ISnpw409vWqTYnlT6TzJed1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460008; c=relaxed/simple;
	bh=vuspLam82Go25b7VUX5tqc0m7B7hmyslMJV//0MlqZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KopIiRuTijyTR/V3NoTmDAD48VbuRypyQ6GVFFMGAb2g/m66lXHvn4HBdXkVKqkamARDxWyZiC+fPXVb8MVxCCRBY0iBaU+b/PeYg01LkF+dLODHSIzapAzDemIS2q+C6t7kdLxlh+i1p07+7oVP+F/eGCZgUGGpiJHCbDNHUXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YyF2w0Bv; arc=none smtp.client-ip=91.218.175.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YyF2w0Bv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vuspLam82Go25b7VUX5tqc0m7B7hmyslMJV//0MlqZ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789460003; v=1; x=1790064803;
 b=YyF2w0BvxypSG4hIpPrEoeSkPMZv2eoPaOihQA94UTK1ua6QkdWa20x7GcwtQ63y9MDqRKvc
 QmHt1fLNVmoU8Bw2pGhHPnPgNbWUOY1onyC2omMDcRX/YgrD7DqeCGaGEWhZzwCGQ04HF3aRIAj
 OqilWz8A6nOzspAh8EXy6ck0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9987edb77f9512db;
	Tue, 15 Sep 2026 08:13:23 +0000
X-Mizu-Trace-ID: 9987edb77f9512db
X-Migadu-Flow: FLOW_OUT
Message-ID: <3c8d1d8e-0e67-4d1a-b73d-4eadd6266aa6@linux.dev>
Date: Tue, 15 Sep 2026 16:13:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/oom_kill: fix hung tasks queued on mmap_lock behind a
 long reap
To: Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Zhou Yingfu <yingfu.zhou@shopee.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, David Rientjes
 <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-kernel@vger.kernel.org
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
 <aqg-oG2HDIUeK5Us@tiehlicka>
 <20260914203533.3544ae8dd0903c7603b385c6@linux-foundation.org>
 <aqjsPW92SgcHONKO@tiehlicka>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <aqjsPW92SgcHONKO@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/15/26 2:57 PM, Michal Hocko wrote:
> On Mon 14-09-26 20:35:33, Andrew Morton wrote:
>> On Mon, 14 Sep 2026 20:36:16 +0200 Michal Hocko <mhocko@suse.com> wrote:
>>
>>>> Call Trace:
>>>>   <TASK>
>>>>   __schedule+0x487/0x1870
>>>>   schedule+0x28/0xb0
>>>>   schedule_preempt_disabled+0x16/0x30
>>>>   rwsem_down_write_slowpath+0x1d4/0x750
>>>>   down_write+0x60/0x70
>>>>   __ksm_exit+0xb4/0x230
>>>>   __mmput+0x12c/0x150
>>>>   mmput+0x1e/0x30
>>>>   do_exit+0x283/0xa30
>>>>   do_group_exit+0x34/0x90
>>>>   get_signal+0x952/0x960
>>>>   arch_do_signal_or_restart+0x41/0x250
>>>>   exit_to_user_mode_loop+0xd3/0x560
>>>>   do_syscall_64+0x385/0x470
>>>>   </TASK>
>>>>
>>>> KSM is just the one LTP happened to hit: __khugepaged_exit() has the
>>>> same write lock cycle ahead of exit_mmap().
>>> Why is this a practical problem we need to care about? It is kind of
>>> natural that the oom victim exit path might race with the oom reaper. They
>>> share the same lock that is mutualy exclusive. The whole point of the
>>> reaper is to ensure there is a forward progress achieved. So before we
>>> start modifying this let's talk about any practical/real life problems.

Hi Michal, Andrew

Agreed, the hung task warning itself is harmless, especially for a dying
task. The real problems are what sits behind it.

With a 500G swapped-out victim the reap takes ~600s, and for all of it:

1. The victim cannot exit. __ksm_exit() needs mmap_lock for write and
  queues behind the reaper, so the process stays alive in D state for
  10 minutes and whoever waits for it (parent, container runtime)
  waits too.

2. ksmd and khugepaged stall. Once that writer is queued, their
  mmap_read_lock() on this mm queues as well, so both daemons stop
  for the whole system for the same ~600s.

With the patch they wait for one 1G chunk at most, and since exit_mmap()
now frees alongside the reaper, the victim's memory is gone in 264s
instead of ~600s. The reaper still never blocks on mmap_lock and still
makes progress on every pass, so forward progress is not changed.



>> If this situation is expected, unavoidable etc then perhaps the best
>> change is to periodically poke the hung-task detector?
> Right. Reaping 10s of GBs worth of VMAs might take some time indeed and
> that could trigger the hung task detector.
>
