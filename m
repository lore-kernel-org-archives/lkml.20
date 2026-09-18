Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1A3955DE;
	Fri, 18 Sep 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740934; cv=none; b=t2u8ar1YJTVUBbOoWxMrsBa9RnF+FaoAOFi0kU9Q4MIGCRQwwuM0leENxxyRs9YPLpLNGzKxwgJphg6OJgTxI6YVngNsSx99bI8S1wlEElqeJ2V37QB8DjbzvjRSwj8Iv+aQDpuUD4d0p88g9N1cG1A7KPic1oDFf6kEJLmWxAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740934; c=relaxed/simple;
	bh=p6Q0brgo5XgfRd0hUdVFUXt+DAwPGTszHgOEQdzlqzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtOHKRWAApdV0XjPIYUowoJ1zM8x6y85+5gRm44DVBVYNET0Rme2HZgmNf6dwD4KjHOgbXBmADkNGEy3f2T8zvnoUxZXl0xau6+7JEY/VcM6V2w16//mO+x1fcVBPqAKyhAs4raXo1ANSnpLsiMB4tXSVv5Q0kZfWVb9WC157Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lVqPDQt3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lVqPDQt3"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDVYfq1235812;
	Fri, 18 Sep 2026 14:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MnVITS
	zMSIrsefjKByHtkQ9xssBxZmYKl11yZcJFRJ0=; b=lVqPDQt33x0y2wM8SnDJ2b
	M3QpsNxajlLKhw59o5vHYxva6RGRUqaQRSpmullaaXF6/w8l2KqB7QRn5KYNzjq/
	6XVBbXgJkN3e7RaytagYZbYUBNdHMia6c+4U8VwyIUuTwcnHpw7j/uANh+HsAGim
	Lr2Yz8Q0C2ja3nQojGzARGhvLAPv2CKMdK1svO95z3NlEbcjkd8X7AMnUq2yGmCO
	apf7FEbAZdeGZ5CsqSY3tcoZc0hFzYpJYE63YJ0GsSQq6gC5RNhTXzABddFo6u9z
	SoFgNg6jDnok7y891k2iKGAo/2EoUWZe4wswSBEc2vYTlRbDjA6Ic7kMKT49hlRA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmv5j88qb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 14:14:35 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDNqUn739423;
	Fri, 18 Sep 2026 14:14:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gs56q8ekb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 14:14:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IEEWNX43975164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 14:14:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29D4A20043;
	Fri, 18 Sep 2026 14:14:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50E3820040;
	Fri, 18 Sep 2026 14:14:26 +0000 (GMT)
Received: from [9.39.18.35] (unknown [9.39.18.35])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 14:14:25 +0000 (GMT)
Message-ID: <97c99014-d488-4468-896a-decf55636fa5@linux.ibm.com>
Date: Fri, 18 Sep 2026 19:44:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/topology: Add asymmetric SMT packing override
To: Andrea Righi <arighi@nvidia.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Christian Loehle <christian.loehle@arm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
        Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, Lee Trager <ltrager@nvidia.com>,
        Vikram Sethi <vsethi@nvidia.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Will Deacon <will@kernel.org>
References: <20260917140707.3807229-1-arighi@nvidia.com>
 <20260917140707.3807229-3-arighi@nvidia.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260917140707.3807229-3-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5OSBTYWx0ZWRfX1VTrtQbQYEmt
 Kr2ufCUGsvdo7p+LTwz1ZWKWKwU4IkLFGjK75ZBshxAN/AsSlsKaRTVIr/O4/CV+vzB/MUCpQmm
 VB8oiejJm2Vk13AqWc9ppXD8urqAB6ukfctFLIR68J9NYD0jotqQMnvQyQQrFn1iacqPQt67R9o
 G0o/oj5uNj6ZG8b2EsvHGna3G78LaPIUVU0vAhq/coQXjhP9UND1HO3m8RZ1N2mRwPIhwPJHHud
 gWhPi7NQ+KHeK/jn6OAzuwKdZssMXh+4BF/v5VeF1XhgLZ1s212ilXX6rSLE67mhl4Xrcrg+snX
 wNfr6ue8vXfBvuB23p3UiEwnoDve8il3dUcqDQXJbY3Rfao7RgpfVnLRrVN97e5KJocakgeOqyd
 ERRIyHGAbj7iUTtWW+bHne0xscwmWwug9F2WnNd5JJLRFBRyE+HKlklAIbtwiEOEaAiwi6cPYgS
 JZ1Cjv0x0AMd9dddfTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5OSBTYWx0ZWRfXw58SAaq3k263
 WP7Y8NEfgsTCUnnNgK6XYvQOjfzo57JH9Fr2DtrBfhHWD/fauudAnobWn3WXBIsQkNMFxf7BlpS
 f4FblzRoh632vlEqT7Qtdy1hwTFhwrI=
X-Authority-Analysis: v=2.4 cv=Zsx4uN7G c=1 sm=1 tr=0 ts=6aad474b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=Ikd4Dj_1AAAA:8
 a=PHdktifF7tJ2rMLP5ZoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: WGnGdvEXTppGB6iXeFdEBKPtnTG_5QC5
X-Proofpoint-GUID: xkeFtc93hz3LliRUmNukCaUWPhLnFuKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180199

Hi Andrea,

On 9/17/26 7:35 PM, Andrea Righi wrote:
> Architectures can use SD_ASYM_PACKING to describe preferred CPU ordering
> at the SMT scheduling domain. Some systems benefit from the same policy,
> but their firmware cannot currently describe the preference. Inferring
> it from the CPU model would embed a platform-specific policy in the
> kernel.
> 
> Add the sched_smt_asym_packing boot option to override SD_ASYM_PACKING
> at the SMT level. Accept auto, on and off. Auto preserves the
> architecture-provided topology and is also the default when the option
> is absent. On and off force the flag without changing asymmetric packing
> at higher topology levels.
> 
> Apply the override centrally to domains with SD_SHARE_CPUCAPACITY so it
> also covers architectures with custom SMT topology callbacks, including
> powerpc. When forced on, priority remains defined by
> arch_asym_cpu_priority(). The weak default prefers lower-numbered
> logical CPUs, while architecture overrides remain authoritative.
> Siblings with equal priorities remain unordered.
> 

Wasn't this a temporary solution you wanted until the firmware changes are
sorted out? or something changed in between?

If yes, could you please capture that in changelog or in comment.

> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>   .../admin-guide/kernel-parameters.txt         | 11 +++++
>   kernel/sched/topology.c                       | 49 +++++++++++++++++++
>   2 files changed, 60 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 33cd30996e47e..36c3b2e563441 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6799,6 +6799,17 @@ Kernel parameters
>   			solution to mutex-based priority inversion.
>   			Format: <bool>
>   
> +	sched_smt_asym_packing= [KNL,SMP]
> +			Override asymmetric packing at the SMT scheduling domain.
> +			Format: { auto | on | off }
> +			auto: Preserve the architecture default. This is the
> +			default when the option is omitted.
> +			on: Force asymmetric packing at the SMT scheduling domain.
> +			Idle CPU selection prefers siblings with a higher
> +			architecture-defined priority. Siblings with equal
> +			priorities remain unordered.
> +			off: Ignore SMT sibling priorities.
> +

Wasn't this option/parameter to come from arch specific file?

Isn't it going to be confusing for archs which don't benefit from asym packing at SMT,
but now there is kernel parameter to say on.

>   	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
>   
>   	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 0248227d983a7..cdfcecf673fd7 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -32,6 +32,46 @@ static int __init sched_debug_setup(char *str)
>   }
>   early_param("sched_verbose", sched_debug_setup);
>   
> +#ifdef CONFIG_SCHED_SMT
> +enum sched_smt_asym_packing_mode {
> +	SCHED_SMT_ASYM_PACKING_AUTO,
> +	SCHED_SMT_ASYM_PACKING_ON,
> +	SCHED_SMT_ASYM_PACKING_OFF,
> +	SCHED_SMT_ASYM_PACKING_NR,
> +};
> +
> +static enum sched_smt_asym_packing_mode sched_smt_asym_packing __read_mostly =
> +	SCHED_SMT_ASYM_PACKING_AUTO;
> +
> +static const char * const sched_smt_asym_packing_modes[SCHED_SMT_ASYM_PACKING_NR] = {
> +	[SCHED_SMT_ASYM_PACKING_AUTO]	= "auto",
> +	[SCHED_SMT_ASYM_PACKING_ON]	= "on",
> +	[SCHED_SMT_ASYM_PACKING_OFF]	= "off",
> +};
> +
> +static int __init sched_smt_asym_packing_parse(const char *str)
> +{
> +	for (int mode = 0; mode < SCHED_SMT_ASYM_PACKING_NR; mode++) {
> +		if (!strcmp(str, sched_smt_asym_packing_modes[mode]))
> +			return mode;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int __init setup_sched_smt_asym_packing(char *str)
> +{
> +	int mode = sched_smt_asym_packing_parse(str);
> +
> +	if (mode < 0)
> +		return 0;
> +
> +	sched_smt_asym_packing = mode;
> +	return 1;
> +}
> +__setup("sched_smt_asym_packing=", setup_sched_smt_asym_packing);
> +#endif
> +
>   static inline bool sched_debug(void)
>   {
>   	return sched_debug_verbose;
> @@ -1950,6 +1990,15 @@ sd_init(struct sched_domain_topology_level *tl,
>   	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
>   		      "wrong sd_flags in topology description\n"))
>   		sd_flags &= TOPOLOGY_SD_FLAGS;
> +#ifdef CONFIG_SCHED_SMT
> +	if (sd_flags & SD_SHARE_CPUCAPACITY) {
> +		if (sched_smt_asym_packing == SCHED_SMT_ASYM_PACKING_ON)
> +			sd_flags |= SD_ASYM_PACKING;
> +		else if (sched_smt_asym_packing ==
> +			 SCHED_SMT_ASYM_PACKING_OFF)
> +			sd_flags &= ~SD_ASYM_PACKING;
> +	}
> +#endif
>   	sd_flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
>   
>   	*sd = (struct sched_domain){

