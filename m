Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152743;
	b=kzCyeYfps3IVxdsz2of7RfrKPYHhiL04whOUs/FmFwkcZVPSAEI3WivMNmJJUf0zCb84
	 y4gJMJ0WGJPLP9U3oQILxOcrqML7oLomFCYSWKGrVCOLxMKUj40LQuNtkqAhX6vyz7h0V
	 aMpfk/sn6nRSCoLkIHtsHWmswzLnPSjVBr5hAoofBeG83hYHMyVEarWy9Gq9kqYkkyi35
	 Qs4apVcVFcNzuUiIEWmE240LLBc2yvW0Yc79i0FxXndSmJo7EXi5YConQz0eGas+R5nHf
	 I3p5Zvb09g1gOIO6XmJaPk4zb5YbPS3XB/7gFedpguzHJB/8YaISZ0XUDmvvK3Tu7WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152743;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fPkrZf0KjFS18IRAqnQGMK3f21G0rlnALIPAz/Izm4Y=;
	b=ABo6vi4kZSgi1EwTaQ+0o9mNm5p9RLdoWYJ+Ihd2h6sjlwYBOYSmdoUPrfMxriPyNWMd
	 EMLXt33+PbTIIpNwUqeRxBR8s7pRYNsTe+aj/D8QfHYjhNUoQLzP4781rMIFMo/UVs67h
	 DvuOSpP42vY9jXqSqrKJebdXht0aCJvbW/f97A67cntt22HdzffQDveQIAiWoDs2Tl2AV
	 Gx3yw5qeoA0rv3/BCk0H5AouW2gtkyYiQg4jxssaQdtqIrSbpgBtVv04+fLhQXEP00PaE
	 kIA34Q7IoQA4Nx2Q5HB8NBp+BhY6ilePsrBPOOgROI8YaXHaysnnzMYfe59/MJSkjgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.195
Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com [115.124.28.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53059606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53059606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07489325|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0564901-0.00143709-0.942073;FP=8317582085970232410|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jr3mcuT_1793152720;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jr3mcuT_1793152720 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 09:58:44 +0800
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT BUDDY ASSIST
 feature
To: Chen Yu <yu.c.chen@intel.com>
Cc: peterz@infradead.org, bsegall@google.com, dietmar.eggemann@arm.com,
 juri.lelli@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 mgorman@suse.de, mingo@redhat.com, rostedt@goodmis.org,
 vincent.guittot@linaro.org, vschneid@redhat.com, tim.c.chen@intel.com,
 wujianyong@hygon.cn
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261022100821.981VXwAZyKKAsG00eaxoDO9kollDWxuTGq7ALzXMQDc@z>
 <atozo8vLDlOB6Vau@chenyu-dev>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <b74b3213-a3fc-c936-0500-cde983b40234@open-hieco.net>
Date: Wed, 28 Oct 2026 09:58:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <atozo8vLDlOB6Vau@chenyu-dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Chenyu,

On 2026/10/23 0:02, Chen Yu wrote:
> Hi Kunyu,
> 
> On Thu, Oct 22, 2026 at 06:08:21PM +0800, Li kunyu wrote:
>> From: Peter Zijlstra <peterz@infradead.org>
>>
>> On Thu, Oct 22, 2026 at 03:40:44PM +0800, Peter Zijlstra wrote:
>>> On Tue, Oct 20, 2026 at 04:37:40PM +0800, Li kunyu wrote:
>>>> [Problem]
>>>>
>>>> It was found that on servers equipped with the Hygon 7447v CPU (Model 7,
>>>> 384 logical cores), migrating tasks across LLC scheduling domains during
>>>> load balancing caused significant performance degradation:
>>>>
>>>> 1. A low L3 cache hitting rate (due to factors such as non-shared L3
>>>> caches).
>>>>
>>>> 2. The traversal overhead of higher-level scheduling domains (e.g.,
>>>> cross-NUMA scheduling domains).
>>>>
>>>> Similar issues were also observed on CPUs from other vendors during
>>>> testing, though the degree of memory bandwidth increase and other
>>>> latency effects varied. Consequently, a series of patches was developed
>>>> to address and improve these issues.
>>>>
>>>>
>>>> [Solution]
>>>>
>>>> This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
>>>> feature. The main work is as follows:
>>>>
>>>> 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.
>>>>
>>>> 2. Skip SMT-domain balancing after a successful push and avoid pulling
>>>> the pushed task back.
>>>>
>>>> 3. Restrict newidle balancing so it does not pull from higher-level
>>>> scheduling domains.
>>>>
>>>> 4. Compensate for the resulting load imbalance with a burst-task wakeup
>>>> path that sends tasks to idle CPUs.
>>> So you're combatting undue LLC migrations with brute force :-( Mostly
>>> this looks like something where cache aware scheduling should help, no?
>>> That ought to make cross-LLC migrations less attractive.
>>>
>>> Now, I realize that cache-aware scheduling as is won't help stream; when
>>> build using OpenMP the whole thing is one big process and cache-aware
>>> mostly gives up, when build using MPI its a ton of single threads and
>>> cache-aware will ignore them.
>>>
>>> Still, I think you really should look that way, perhaps investigate if
>>> something like:
>>>
>>>   https://patch.msgid.link/cover.1787955777.git.tim.c.chen%40linux.intel.com
>>>
>>> can help you.
>> Thank you for your suggestion. I looked at this patch series and think
>> the way it exposes the interface to users ("always" | "advise" |
>> "never") is quite good. We will add the related interfaces in a subsequent
>> version.
>>
>>
> If I understand correctly, the goal of your patch set is to inhibit cross-node
> task migration so as to keep memory locality.
> 
> Patch 4 is the main one, which forbids the newly-idle cross-node balancing. As
> a result of Patch 4, more tasks end up on a single node, so the kernel needs to
> spread them within that node more aggressively, this is why Patches 1, 2, 3 and
> 5 were introduced.
> 
> Before digging further into the design, I think one question needs to be clarified:
> In the scenario you are trying to optimize, do the workload's threads share data
> with each other?
> 
> 1. If the threads share data with each other, then leveraging cache-aware scheduling
>    with prctl to put them together in the same LLC/node might be a good choice.
>    Furthermore, there is a proposal [1] to enhance prctl to allow the user to specify
>    how aggressively the threads should be aggregated, which would work in the "stream"
>    case.

First, this series is intended to address both scenarios. It is designed to be
generic, requiring no manual configuration from users, and it delivers solid
improvements in both cases. Let me start with Scenario 1.

prctl gives users a clear view of which CPUs and which process/thread ranges
(for example, those typically running in cgroups) are restricted. It can also be
combined with this patch series to achieve better performance. For instance, in
patch 5, nohz.idle_cpus_mask can be used together with the prctl-restricted CPU
mask to select idle CPUs within the prctl-restricted range, which can further
improve local performance.

These patches and CAS are complementary: each improves its own specialization
for specific scenarios. I therefore believe this patch series is worthwhile.

> 2. If the threads do not share data with each other and have a high memory footprint,
>    then leaving them where their memory resides would be a good choice. This is what
>    NUMA balancing tries to achieve, and it is possible that threads of the same process
>    are spread on different nodes.

Regarding the second scenario, this patch series has a decisive advantage. Patch
4 delivers an overall average improvement of 3.28%, while Patch 5 delivers an
overall average improvement of more than 13%. In the patch tests I am currently
optimizing, these figures are still increasing - the overall average improvement
is now over 18%, which is hard to believe, so I will continue to verify it
several more times. Some cases that previously showed performance degradation
have now fallen to even lower values.

Patches 1, 2, and 3 have been revised to have more reasonable semantics, as
their goal is to distribute all CPU tasks more efficiently within a shorter
period of time. Of course, they can also be used together with restrictions such
as cgroups.

This patch series achieves an average improvement of over 50% across the four
test categories in stream-10 and stream-100, giving it a decisive advantage in
throughput.

> From the [Problem] section in the cover letter, it seems you are trying to address case 2?
> If this is the case, why doesn't NUMA balancing help to inhibit the cross-node task migration?
> Or is it because NUMA balancing is disabled on your platform?
> 
> Besides, there is a patch set to extend cache-aware scheduling to cover multiple
> preferred LLCs and nodes [2], so as to mitigate cross-LLC/cross-node latency as much as
> possible, not sure whether this work addresses the issue you mentioned.
> 
> [1] https://lore.kernel.org/lkml/tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com/
> [2] https://lore.kernel.org/lkml/20260827122816.756234-1-wujianyong@hygon.cn/

I have read both patch series. Series [1] is more in line with Scenario 1
mentioned above, whereas series 2 is an extension of a particular scenario in
the CAS part. Neither can fully solve the problems I described. However, these
two series and this patch series are complementary, and each provides
performance improvements in its respective area.

-- 
thanks,
kunyu
