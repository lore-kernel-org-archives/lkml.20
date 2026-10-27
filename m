Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095549;
	b=CGfBAkhgliSDhpE66C2CD+FPuAPnTc1pMuVUepWNM72BLPetxvLR1l+dXWB20FHVzOgV
	 KVKUWLr/dUBVdM5VCEOvQAlHUVg9N8o50TrkO/LZGexj7zfIFqTdSnXHX9am7PuDi2CZd
	 1MGCvzQicFHfYONSAdqKYoZZmV7sj3WrFbP66+VvjYevexRXrqX4sPjMkCZejH2CxGNOO
	 mLvUf+s1aHn2k5CAshYNhuh9jecEm9KZPE027PiY2HY+91P7I7//HM0CfPHVl/X7b991N
	 A7nVxhctOiDMHJn914ysh3198Rzt1pIQ+YWgDvmeUjW14QtlTxGeULPLvGD+L1vAvrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095549;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XdQ3Q06SZGEU0r4ZOezudytVMNCnb9TnOa3AWTj5D5U=;
	b=tQ+aegXWusyS0NiUpk//cN9K+udy2SHzU5BaFrGv/uDIolIIt5Ep4xx807RFbvmyRwgh
	 Smr1RHqpwD55QBnu6fwoKuLljHNBScOgdpXmFUvwkLojOAqaDhPbHnZulzduOPZ9MMHTD
	 NgDAd3ZqcBQDPrsp2vEdmNi/0P9GQbtf/VbObqMmEIZPUtFu22P+pWcRgENDA3CQX+hi/
	 XrpCMHJlK1OAPkzErGVa+DJW9X4uxTexCLjKxDWB3cCvZI9FzgAPxYm0ggPkRLohJEezY
	 KFyEilonQrbsVn5OoOOmVgHc5nFAm9yGamNaByrKLS1l6/lw4QgzrEC21rg//tbJJTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.51
Received: from out28-51.mail.aliyun.com (out28-51.mail.aliyun.com [115.124.28.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E013606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E013606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1002638|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.267259-0.0148288-0.717912;FP=3145651007775098074|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jqkBwYG_1793095535;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jqkBwYG_1793095535 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 18:05:36 +0800
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST
 feature
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <atiy9PAq4lvXxWj1@scheduler.schedules>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <1a0c008e-1b9e-984d-5cbe-4406e5508350@open-hieco.net>
Date: Tue, 27 Oct 2026 18:05:35 +0800
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
In-Reply-To: <atiy9PAq4lvXxWj1@scheduler.schedules>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Kayra,

On 2026/10/21 20:44, Kayra Cizmeci wrote:
> On Tue, Oct 20, 2026 at 04:37:40PM +0800, Li kunyu wrote:
> 
>> Several benchmarks show performance regressions:
>>
>> 1. tbench 32      8325.17    6772.693     -18.65%(degeneration):
>> Each tbench sample was run three times. Initially, some measurement
>> error was observed. Moreover, this patch series essentially utilized all
>> idle CPUs, whereas without the feature enabled, 5% to 10% of idle CPUs may
>> remain idle. This led to more CPUs experiencing cache interference and
>> other effects. The results are benign and within an acceptable range.
> According to what the results are 'acceptable'? If there were some error
> why even talk about them?

The main point here is to describe the temporary performance degradation
observed in tbench 32 test case.

When multiple CPUs each have bursty tasks (by default, at least four tasks per
CPU), moving pending or newly created tasks to an idle CPU incurs temporary
extra overhead, such as TLB refresh and page copying/migration. Once the tasks
settle, migration succeeds and they start running performance returns to a
higher level. For example:

1. If the CPU originally selected for the task has good LLC (L3) memory
bandwidth, choosing an idle CPU in a different LLC scheduling domain briefly
incurs this overhead; however, after recovery, memory access latency returns to
normal and throughput returns to its normal value.

2. If the originally selected CPU's LLC (L3) memory bandwidth is already a
bottleneck, choosing an idle CPU in a different LLC scheduling domain can reduce
memory access latency (the migration overhead is even lower) while also
improving throughput for NVMe and other storage devices.

In this test case, we quickly utilized the idle CPUs. Once those idle CPUs have
tasks, they enter the normal load-balancing process, which helps achieve an even
CPU load distribution quickly. Therefore, the temporary performance degradation
is acceptable.

In addition, in the patch I am currently optimizing for my own tests, changing
rq->nr_running to rq->cfs.h_nr_runnable (so that sleeping tasks are excluded
from the count) reduced the degradation from -18.65% to -8.55% and produced
significant improvements in stream-10 and stream-100.


-- 
thanks,
kunyu
