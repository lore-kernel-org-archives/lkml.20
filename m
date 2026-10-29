Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261849;
	b=HH6Hq6K6VK7+SS6wTyIwB7quVpKvCgg6zA3SEv8ccDC3q5Q2gNCAdTdcDviP6zgOG9hI
	 taObKpRDpceDPp9dqoapNwEwCwQMvZxFT8cjnsatEesK8lhqqRJBvI7SOoqkeXNCAO7kZ
	 ddXd55Boq+aQOeBnFaofPM4JQx5r2RJi5IAS25yTjdw+jR9ECifjQ9ye1fQzkqrdX1wzM
	 G1Y5F8dU2Z4yKZW2pnJC7vIX6KRgU4sQoPcXEjQiAmFPijOLQsgkKbDfTpK4yq0f9DCIT
	 IUzx4ftaO7rLbHwjGk/JjsKQQ1SJvoNgBcOuH56067nl001iy4V+CRnTKwDZK1hD4kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261849;
	h=DMARC-Filter:DKIM-Signature:Message-Id:References:To:Subject:
	 In-Reply-To:Cc:X-Lms-Return-Path:Date:Mime-Version:Content-Type:
	 X-Original-From:User-Agent:Content-Transfer-Encoding:From;
	bh=+a0pwiupnElVC4iJq7ApJkfigClnpAXCdq3Fy64eUq4=;
	b=w2IwuNDzEeKNhO1pcGrtncNblrWEOIw43qFMjBrGh8ScyqFNdErRpUEv4IQmy7Ad1lRw
	 KZDdD1IuF3NilIcoS16nmHIySNLzAyqQtDJX04DYhMVpDazxC3a5InYtH4JTMzVymXj6L
	 nhCdlmw/EMHR8er4m0FPrANvpo+d0WOrV0hlFSs8ALlDjKDgHF/VzdiqPb5AfRCl7jp7Y
	 Spepln1049xCVM/gvrqWjR8tE/cx5MVydXmlG3zGz+5Z9DUGt6ivMJ5D3HQdqnRPNg9iL
	 6HU6TPQgx9KAnt8W/fqpQkNPzHfD9RCi3tK2AhUF4uX2Gesf1LuLS0TtcLseZfetwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XeN680I7;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B24606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XeN680I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793261842; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+a0pwiupnElVC4iJq7ApJkfigClnpAXCdq3Fy64eUq4=;
 b=XeN680I7IJlNMjMU87dIzNsxFTBBTj3N5w3g0gCwl1fJHn5Rw1SF4eOneUkqJxa/YwNwJz
 4+f8RvjasCmqzwtsuwTZZRC9OMWc7dIhcHPsbSp8/TIAJB5foGuei9CreWol+vyR+wy8Ue
 l3ESXeSgyAmWo8VZ+mK1DwmD8Xse74pPKf4vh2xt1rVEAwadtbH0A2/1hlKNqn7aYEpCGV
 jWJpN3qN6JQmUIg/eLFTNGzUe5N2RiO9xhfm8P8S+u/gyaIJIBfU+mFR0qhrhe5oq03tlr
 C+Z8B7anBTTCgC2MKqUO/dEseibVvg61SVujbN11KZ9n4hnkTnUC/bJSHksJdg==
Message-Id: <b17f7fcf-0c7e-49b8-a7be-779f3c5e97d2@bytedance.com>
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-4-lizhe.67@bytedance.com> <de52b5f1-97eb-4404-b7f1-53f0aab17fae@amd.com>
To: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>, <riel@surriel.com>
Subject: Re: [PATCH v2 3/3] sched/numa: fix scan-period adjustment for tiering-only mode
In-Reply-To: <de52b5f1-97eb-4404-b7f1-53f0aab17fae@amd.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
X-Lms-Return-Path: <lba+26ae30110+12b493+vger.kernel.org+lizhe.67@bytedance.com>
Date: Thu, 29 Oct 2026 16:16:55 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: quoted-printable
From: "Li Zhe" <lizhe.67@bytedance.com>

On 10/29/26 2:21 PM, Bharata B Rao wrote:
> On 28-Oct-26 9:42 AM, Li Zhe wrote:
>> When automatic NUMA balancing runs in memory-tiering-only mode, NUMA hin=
t
>> faults identify slow-memory pages that are worth promoting. They are not
>> normal task-placement feedback.
>>
>> Without separate tiering feedback, successful tiering promotions are fed
>> to update_task_scan_period() as private remote faults. That leaves
>> local =3D=3D 0 and shared =3D=3D 0, so the function hits its early slow-=
down path
>> and doubles p->numa_scan_period. Repeated promotion feedback can therefo=
re
>> drive the scan period towards the maximum.
>>
>> Track memory-tiering feedback separately from normal task-placement stat=
s.
>> Successful free-space bypass promotions are not counted as tiering scan
>> feedback because they did not pass the hotness and rate-limit checks. Co=
ld,
>> hot, and throttled feedback is generated only by the hotness/rate-limit
>> path, while migration failures slow scanning like the normal placement
>> heuristic does.
>>
>> Use the same 70% threshold style as the normal scan-period heuristic. A
>> hot-dominated window speeds scanning up, a cold-dominated window slows i=
t
>> down, and a throttled ratio of at least 30% also slows it down. If a
>> window has no tiering feedback, for example because promotions used the
>> free-space bypass, double the scan period, following the same
>> no-useful-signal slow-down direction as normal scan-period adjustment.
>>
>> Evaluate the tiering window when a scan sequence completes as well as wh=
en
>> tiering faults are reported. This lets an empty window back off the scan
>> period after qualifying tiering feedback stops.
>>
>> On a CXL system with node0 as DRAM and node3 as slow-tier memory, a
>> STREAM Triad-derived OpenMP workload was used to model a
>> bandwidth-sensitive working-set shift. It first accessed one 100G range,
>> then switched to another 100G range. The workload was first-touch placed
>> on node3 and then run from node0 with memory-tiering-only mode enabled.
>>
>> With the free-space bypass disabled, so that promotions have to pass the
>> hotness and rate-limit checks, a kernel with only the bypass control was
>> used as the no-feedback baseline. Tiering scan-period feedback improved
>> the transition window after the active range switch:
>>
>>                                no feedback       tiering feedback
>>    first 80s after switch       122.4 GB/s             129.3 GB/s  (+5.7=
%)
>>    200-240s after switch        139.9 GB/s             140.6 GB/s  (+0.5=
%)
>>
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>>   include/linux/sched.h                |  17 ++++
>>   include/linux/sched/numa_balancing.h |   9 +++
>>   kernel/sched/fair.c                  | 113 ++++++++++++++++++++++++++-
>>   3 files changed, 137 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index 1c93da75226e..c4959747374b 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -833,6 +833,16 @@ struct task_ipi_mask {
>>   struct task_ipi_mask { };
>>   #endif
>>  =20
>> +#ifdef CONFIG_NUMA_BALANCING
>> +enum numa_tiering_fault_stats {
>> +	NUMA_TIERING_FAULT_COLD,
>> +	NUMA_TIERING_FAULT_HOT,
>> +	NUMA_TIERING_FAULT_THROTTLED,
>> +	NUMA_TIERING_FAULT_MIGRATE_FAIL,
>> +	NR_NUMA_TIERING_FAULT_STATS
>> +};
>> +#endif
>> +
>>   struct task_struct {
>>   #ifdef CONFIG_THREAD_INFO_IN_TASK
>>   	/*
>> @@ -1433,6 +1443,13 @@ struct task_struct {
>>   	 */
>>   	unsigned long			numa_faults_locality[3];
>>  =20
>> +	/*
>> +	 * Memory tiering faults are tracked separately from normal NUMA
>> +	 * placement statistics. In tiering-only mode, slow-memory hint faults
>> +	 * are used to decide promotion, not task placement.
>> +	 */
>> +	unsigned long			numa_tiering_faults[NR_NUMA_TIERING_FAULT_STATS];
>> +
>>   	unsigned long			numa_pages_migrated;
>>   #endif /* CONFIG_NUMA_BALANCING */
>>  =20
>> diff --git a/include/linux/sched/numa_balancing.h b/include/linux/sched/=
numa_balancing.h
>> index 200f50075d5c..12f31ed56d66 100644
>> --- a/include/linux/sched/numa_balancing.h
>> +++ b/include/linux/sched/numa_balancing.h
>> @@ -8,6 +8,7 @@
>>    */
>>  =20
>>   #include <linux/sched.h>
>> +#include <linux/sched/sysctl.h>
>>  =20
>>   #define TNF_MIGRATED	0x01
>>   #define TNF_NO_GROUP	0x02
>> @@ -16,6 +17,14 @@
>>   #define TNF_MIGRATE_FAIL 0x10
>>   #define TNF_ACCESS_TIME	0x20
>>  =20
>> +static inline bool numa_balancing_tiering_only(void)
>> +{
>> +	int mode =3D sysctl_numa_balancing_mode;
>> +
>> +	return (mode & NUMA_BALANCING_MEMORY_TIERING) &&
>> +	       !(mode & NUMA_BALANCING_NORMAL);
>> +}
>> +
>>   enum numa_vmaskip_reason {
>>   	NUMAB_SKIP_UNSUITABLE,
>>   	NUMAB_SKIP_SHARED_RO,
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 136207b62d87..1d9efc2b7427 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -2760,6 +2760,32 @@ static inline bool cpupid_valid(int cpupid)
>>   	return cpupid_to_cpu(cpupid) < nr_cpu_ids;
>>   }
>>  =20
>> +static void task_numa_tiering_placement(struct task_struct *p);
>> +
>> +static bool task_numa_tiering_update(struct task_struct *p)
>> +{
>> +	if (!numa_balancing_tiering_only() || !p->mm)
>> +		return false;
>> +
>> +	task_numa_tiering_placement(p);
>> +	return true;
>> +}
>> +
>> +static void task_numa_tiering_no_feedback(struct task_struct *p)
>> +{
>> +	task_numa_tiering_update(p);
>> +}
>> +
>> +static void task_numa_tiering_fault(struct task_struct *p,
>> +				    enum numa_tiering_fault_stats stat,
>> +				    unsigned long pages)
>> +{
>> +	if (!task_numa_tiering_update(p))
>> +		return;
>> +
>> +	p->numa_tiering_faults[stat] +=3D pages;
>> +}
>> +
>>   /*
>>    * For memory tiering mode, if the target fast memory node has enough =
free
>>    * pages, recently accessed slow memory pages can bypass the normal ho=
tness
>> @@ -2887,6 +2913,7 @@ bool should_numa_migrate_memory(struct task_struct=
 *p, struct folio *folio,
>>   		pgdat =3D NODE_DATA(dst_nid);
>>   		if (numa_balancing_promote_free_space_bypass &&
>>   		    pgdat_free_space_enough(pgdat)) {
>> +			task_numa_tiering_no_feedback(p);
>>   			/* workload changed, reset hot threshold */
>>   			pgdat->nbp_threshold =3D 0;
>>   			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE_NRL, nr);
>> @@ -2899,10 +2926,18 @@ bool should_numa_migrate_memory(struct task_stru=
ct *p, struct folio *folio,
>>  =20
>>   		th =3D pgdat->nbp_threshold ? : def_th;
>>   		latency =3D numa_hint_fault_latency(folio);
>> -		if (latency >=3D th)
>> +		if (latency >=3D th) {
>> +			task_numa_tiering_fault(p, NUMA_TIERING_FAULT_COLD, nr);
>> +			return false;
>> +		}
>> +
>> +		if (numa_promotion_rate_limit(pgdat, rate_limit, nr)) {
>> +			task_numa_tiering_fault(p, NUMA_TIERING_FAULT_THROTTLED, nr);
>>   			return false;
>> +		}
>>  =20
>> -		return !numa_promotion_rate_limit(pgdat, rate_limit, nr);
>> +		task_numa_tiering_fault(p, NUMA_TIERING_FAULT_HOT, nr);
>> +		return true;
>>   	}
> I like the separation of scan-period updation of tiering mode from the re=
gular
> mode as the existing update scheme was dependent on private/shared faults=
 which
> made little sense in tiering mode.
>
> However I am not sure if you should drive the scan period updates from
> should_numa_migrate_memory(). The scan period belongs to the hint fault
> scanner. I am pulling the promotion heuristic out of
> should_numa_migrate_memory() in the pghot series. The hint fault path
> only reports an access and shared engine does the classification and
> migration for every source. The other sources may not have numa_scan_peri=
od,
> so this feedback has to stay with the hint fault path.
>
> pghot supporting multiple sources may not see the light of the day in
> near future but it is still good to keep the source specific
> aspects and promotion engine separate.


Agreed, that layering makes sense.

I am wondering whether that separation is better handled together with
the larger promotion-engine rework, though.=C2=A0 Without the shared engine=
 in
place, moving the outcome reporting out of should_numa_migrate_memory()
would add interface changes mainly for a future direction.

For this series, my goal was narrower: keep tiering-only scan-period
feedback separate from normal task-placement stats while staying close
to the current numabalance implementation.

Thanks,
Zhe

>
> Regards,
> Bharata.
