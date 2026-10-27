Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097888;
	b=JaWXdDicR1oyLufSYsRSBYrCc53IU7aqSHY5dQ1vgWIAJDj9UUzZd5BHpmEErKS04K6B
	 mNcX9jvEV8J1znrUzaL35nypcGfQmNIA1q/bq/aR8qoLTsBKFPfOeAGtflxVJPodQZtJo
	 T3TQtSl/2eQvdrg/NyxknUXv3Le/DBOuzFCnuDGZLxktdEFsU3o19Bm+WDov3OrmLV8tP
	 zoBq/l3UN14vqUED2maxOi88p5YjkFg2SvZ5Z/dvqdYnG4yyUWBgA2XJNoLxFdn/+Qovk
	 QKX7RW3Log2ZNerUzxT/yuDN+kKTcH3EAIrbLErum9m7E2gNnbTvwluZgDILI4sWSzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097888;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2CZ1JjGU/SKLJGSUCq+NKtvVdni/QjyQDA1urWOPVdE=;
	b=sB0j0n2KahujpejOVi4HBLz3l9iiJEYU0smyApsUEZZYlPPfDFDdqhoDtv6Yf2Bgfr1u
	 Ter8cmALlC8fGPt4my13a5R/Gt2PPqyVzEEMLaPsVT0XJCcmJPIEsboFZ4tF4YvsokBqv
	 dRpUdgQf5+KN08+PEeDrrSMJznims2iBXeVaOcWgr8UKtFsOuG3lPjK0MQFL8vU2OfqW2
	 XYuSdaNxmDLg80b38LlQ9vGaM9RI2PGgn3dNhHO9xcfnDEAlFR53BuMKiKECwVZDMc/9A
	 aSJdAJEIiHBn7a8XAVPBTTKPYlExQ5hoY9qaGja0rrDGKJLkW9csU70W+Onp5jAZqoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B360A2602
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903B360A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1086833|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.798569-0.000182417-0.201248;FP=2552899484944270682|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037033194;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jqcm1tb_1793097880;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jqcm1tb_1793097880 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 18:44:41 +0800
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST
 feature
To: Tim Chen <tim.c.chen@linux.intel.com>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <6d8ff4593cc93c0033c6537eeac281085726c220.camel@linux.intel.com>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <709db04c-eec7-db96-acca-81cb2ed7265f@open-hieco.net>
Date: Tue, 27 Oct 2026 18:44:40 +0800
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
In-Reply-To: <6d8ff4593cc93c0033c6537eeac281085726c220.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Tim,

On 2026/10/23 4:25, Tim Chen wrote:
> On Tue, 2026-10-20 at 16:37 +0800, Li kunyu wrote:
>> [Background]
>>
>> In high-performance computing (HPC) and cloud computing scenarios,
>> maximizing overall compute throughput and sustaining peak CPU capacity
>> remain critical optimization goals. Within the scheduling domain, the
>> primary optimization focuses include:
>>
>> 1. Timely responsiveness for task wakeup and execution startup.
>>
>> 2. Fast and balanced distribution of CPU utilization across cores.
>>
>> 3. Preferring task migration within shared-cache domains (e.g., L3)
>> before burst workloads arrive, so as to reduce cross-die or
>> cross-node overhead.
>>
>> During development, the following issues were encountered. The above
>> approach ultimately yielded measurable performance improvements.
>>
>>
>> [Problem]
>>
>> It was found that on servers equipped with the Hygon 7447v CPU (Model 7,
>> 384 logical cores), migrating tasks across LLC scheduling domains during
>> load balancing caused significant performance degradation:
>>
>> 1. A low L3 cache hitting rate (due to factors such as non-shared L3
>> caches).
>>
>> 2. The traversal overhead of higher-level scheduling domains (e.g.,
>> cross-NUMA scheduling domains).
>>
>> Similar issues were also observed on CPUs from other vendors during
>> testing, though the degree of memory bandwidth increase and other
>> latency effects varied. Consequently, a series of patches was developed
>> to address and improve these issues.
>>
>>
>> [Solution]
>>
>> This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
>> feature. The main work is as follows:
>>
>> 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.
>>
>> 2. Skip SMT-domain balancing after a successful push and avoid pulling
>> the pushed task back.
>>
>> 3. Restrict newidle balancing so it does not pull from higher-level
>> scheduling domains.
> Kunyu,
> 
> Have you tried to set relax_domain_level= in boot parameter to
> prevent new idle balance across NUMA nodes?
> 
> grep . /sys/kernel/debug/sched/domains/cpu0/domain*/{name,level,flags}
> 
> to find the right level for NUMA and also if the SD_BALANCE_NEWIDLE
> is turned off for NUMA after you set relax_domain_level.
> 
> Wonder how much this will improve things for you.


I conducted a comparative test between patch4 and relax_domain_level=4
(scheduling domain levels 3, SMT, LLC, and node). Their effective scheduling
levels were the same, and their overall averages were quite close (+3.28%). The
trends for each item were consistent.

At present, relax_domain_level has not solved the problems encountered. It
merely serves as a reference for patch4. Subsequent versions of patch4 will be
optimized following the style of relax_domain_level.

I would like to seek your opinion on the modification of patch4. Please review
the following:

1. If relax_domain_level is set, patch4 is disabled.

2. If relax_domain_level is not set and the feature is enabled, patch4 takes effect.

The overall average values and the data for each test are shown below. Here,
smt_buddy denotes the patch4 code, and relax denotes the relax_domain_level = 4
code:


type           smt_buddy_pct  relax_pct
hackbench	-14.94%	       -17.65%
tbench	        +12.54%	       +8.70%
schbench	-4.27%	       +0.48%
STREAM	        +21.80%	       +23.29%
unixBench	+1.19%	       +1.58%
overall average	+3.27%	       +3.28%


hackbench:
group   base  smt_buddy relax   smt_buddy_pct  relax_pct
g1	0.262	0.215	0.202	+17.79%	        +22.82%
g2	0.288	0.322	0.334	-11.81%	        -16.12%
g4	0.407	0.421	0.494	-3.29%	        -21.26%
g8	0.567	0.613	0.756	-7.97%	        -33.17%
g16	0.836	1.100	1.103	-31.61%	        -31.99%
g32	1.411	1.907	1.646	-35.15%	        -16.63%
g64	2.473	3.077	3.204	-24.44%	        -29.58%
g128	4.502	5.538	5.190	-23.01%	        -15.28%


tbench:
clients   base        smt_buddy         relax      smt_buddy_pct  relax_pct
1	475.97	       493.30	        489.21	        +3.64%	  +2.78%
2	714.48	       680.53	        853.52	        -4.75%	  +19.46%
4	1349.73	       1569.21	        1493.59	        +16.26%	  +10.66%
8	2059.00	       2240.22	        2285.86	        +8.80%	  +11.02%
16	4364.25	       4326.11	        3381.46	        -0.87%	  -22.52%
32	8325.17	       7740.42	        7052.11	        -7.02%	  -15.29%
64	12614.20       12955.47	        14898.40	+2.71%	  +18.11%
128	15845.07       22412.27	        19323.67	+41.45%	  +21.95%
256	20837.93       30456.97	        29053.70	+46.16%	  +39.43%
512	29820.67       32227.33	        28809.13	+8.07%	  -3.39%
1024	25969.93       32078.90	        29487.20	+23.52%	  +13.54%


schbench:
threads   base        smt_buddy         relax      smt_buddy_pct  relax_pct
t1	10.75	      9.20	        9.20	       +14.42%	  +14.42%
t2	11.20	      13.00	        10.80	       -16.07%	  +3.57%
t4	12.80	      14.80	        13.00	       -15.63%	  -1.56%
t8	13.80	      14.20	        15.60	       -2.90%	  -13.04%
t16	14.80	      16.20	        14.80	       -9.46%	  0.00%
t32	17.00	      17.00	        16.60	       0.00%	  +2.35%
t64	27.20	      1713.20	        1139.00	       abnormal   abnormal
t128	2844.00	      2855.20	        2856.80	       -0.39%	  -0.45%
t256	5656.00	      5668.80	        5672.00	       -0.23%	  -0.28%
t512	9680.00	      10467.20	        9744.00	       -8.13%	  -0.66%


STREAM-10:
operation base        smt_buddy         relax      smt_buddy_pct  relax_pct
Copy	  103034.5	114194.9	120734.5	+10.83%	   +17.18%
Scale	  100012.0	113639.7	119969.1	+13.63%	   +19.96%
Add	  128469.0	134292.8	140613.4	+4.53%	   +9.45%
Triad	  114401.2	138207.1	138510.9	+20.81%	   +21.07%


STREAM-100:
operation base        smt_buddy         relax      smt_buddy_pct  relax_pct
Copy	  122156.6	176227.5	167672.5	+44.26%	   +37.26%
Scale	  127074.8	167997.0	158140.2	+32.20%	   +24.45%
Add	  140021.5	165604.5	175501.2	+18.27%	   +25.34%
Triad	  136455.4	177236.9	179608.7	+29.89%	   +31.63%


unixbench:
cpu     base        smt_buddy   relax      smt_buddy_pct  relax_pct
1	1808.3	    1835.5	1854.8	    +1.50%	   +2.57%
384     113834.2    114835.7	114505.4    +0.88%	   +0.59%


-- 
thanks,
kunyu
