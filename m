Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945284;
	b=2D0IaFjr7fHvVXBjTwo0DqkDwtj+31bsc8ME2JjFb0Y7/4u0yKmo1V11rAvrLnZ+sPOA
	 VUCBoHH0x66s9kniUv3xghRh6TgkoNggPhEtphcPmhuuigNFhRUL5IsgfCJBXl5pSXK1m
	 BvCk5eZboX/dKoBY6QTn+z1vMeTTTZtGiflLoQH4LyL7iOhZTAal8dKtdmM06kOGtHeXf
	 3zTnsLQ95fMquzHK/EKc/qBXQeIbchbK6et1IXw5Rcm38DP+Ch2LYTstS/7/ZuD2PDCVD
	 iyo/PU/wB7qxNit+ncvU1ktih7i67PFyi0tbZLQOPtbP4g9Xo3by5/5FjgcKiK1aSXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o//CM1EA4RoX+EjPvzr1O0MDXhsmTL5cJW+JbW5CHYI=;
	b=FKtb/vi2xwg70CqkvflKVrPzoVrnxvSEaBfcPsdXzzDXZCYLCw4TopSyCy3125h+a0dh
	 W63DrbagEeGHAiNH7KeJbP8PAfzAN6NvzURZV47J5KyfncqD6HYub9vQu1xZ+as+8Vmfh
	 tswXHsXTK8wEh4tW17AqBnmatyQbxO9XLUPHfIX3Q3nKwmH6d3iDqP8JaLU4zQjJsJ+nh
	 jAeEKKuUp8FTknmqOuPkkmPM2+SE9MjYO+niLi26ocarg62WQT9QitxBF+n6ZEK1GcDq1
	 1WVhxntWSBUSwVC77VTa14/ThsUpDwXPAs8oBxppjeEOoObYmoZtR9PTQq+kvfAnLJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TDGEt/lV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZozKrp5t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB3606D801
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAB3606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TDGEt/lV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZozKrp5t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640rmW3419097
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 06:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o//CM1EA4RoX+EjPvzr1O0
	MDXhsmTL5cJW+JbW5CHYI=; b=TDGEt/lV/TK1fCbFrvVsq7/2pd8YrzuRzJllk3
	rWX6N4wccKqgyObWn40mdbkEn800raN1FQ6TDQQAAQ6P86slarkCEjQwF1QB7KX4
	0asjLd9iB1SrusMy+pgJ0LVVrPM8Y48sxO7Dior8JB9T8iAdWwXgbrh2RAuP6QVa
	HMfuGCjANEAOZaQSnJ96gyntwN7KEjW74sazpu/2CE+2OCer41qDJWNeSuHmhS/L
	7NIFZ25pytXzO3fOqj6zttZ1lh8PzeCDlQcdDCcHf2wAz5jWhvmnFParTukobKai
	/GE606YbI8cVNj3JCKOXsk3DY9WWTdtVYco22ihE2wR3/Jrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb17yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:08:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so517940a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793945282; x=1794550082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o//CM1EA4RoX+EjPvzr1O0MDXhsmTL5cJW+JbW5CHYI=;
        b=ZozKrp5tNPfZbGA58AQVvEUybxCZw4S6qR8WHiLt7QjNGj1eFznXqneBUSxYrHQrtV
         KrEz9upOxGjoLBJ7AgpWW9NE4p3cDnQmX66de18Dyiiw/v1J03RhSgps77CGN9fFGPwr
         sxRmq8JOEUtLDTvnBZuzxoAmAKBvEX1U/ze4fP8lOe2MIYBRNg2YWAU8UM046nRdAd8b
         UI3yXQavn9Bfy4uHjUI06Ul6PMHUlgjG/Nx3nY/wO3TeFu0rRikNUh6VramYs0eBhuU/
         Kvrmwn2z0PoTiJCUK9xMJYImqOQvxT1mYsIDK0ckeqkfYLcPCBxH0j9RKkw6E0l6F8F5
         mx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945282; x=1794550082;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o//CM1EA4RoX+EjPvzr1O0MDXhsmTL5cJW+JbW5CHYI=;
        b=uTRWmPTzQTDNmYUZessYCZXLaShdhbMa9pRKFL3vAGOQA2w2in9PMN2oyoODBtPpsu
         wotLkTHYT8Ngo7loKyChcRu3/rZie5GBzmh2k1GdSF0s5D+yOBwwWwBRXpq8KQGhhhPf
         f9PM2lCYUpf7gAejyBFs6Xn842Qa4beJGG/xkXo/oJYfpdYi1tWlIVYVVLCCp8uAK3H1
         8BLv3KgdtB2kuyrwEvyODboYg2ZqkGLubBneLidbq+Cp2suQ0NRnOXwJUKyK0tT7nsEB
         Ipvvtniuob1VmklH4R/KB1d1m/oVjlCcB/hXGUMex3ZLQr6GrpgGtkUPCviRFC9ip8SC
         apaw==
X-Forwarded-Encrypted: i=1; AL+hErEknjV+2hLR8bKACqcbKqLpKss2YFtIx4JQDdFSC8bGpaTq6MlQQIAafo9SIUb1BQqnQNGbEe78AZ10X24=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VfZFCv+TfnzotWrBfExVakAnwavcdaDMAd708ZcN0VDJ/xHTb
	etvPT9EfF3Z+jxljqXPcEPsuhm4zKITFmjbPkboYakhFhchNkHeKASh0gxaEgLFge1D31cjwDmY
	y0FhcbKQAWoyb3/wr5zHIbKMSWBEq8hrh8fdG+d70HezcbnIPwadZ2MM2XsBQ8kNfZug=
X-Gm-Gg: AYBFou1KciVnjygMEHB1schl4T7U45Rxroles47f2vhrkMWoTfBpzcnkLcT8x7Z9HI8
	4D0n4F3ILv+s49ag1EezneKzG5eRwonjoEpSLwHhcWtR4IIAhjpByLUwv62Uth8UNct2MrwrSkF
	kOpHF9tsbnmg93mO1S4ykGaWYRm0PmrJQdKPue9U+JVxSSx//QjW/n3WMi+6abrjJCFOoZyhp+w
	IRbVwQmwtG0JaziMp/2ikCOFhveAb7Xr85B0VALcKJXHoHJj9rgukrjaE+i5ny/loGesnsbKct/
	TVRHCEa1jVRTfiU6GVDfEBudLHMk214Ag2FEie42LPRCDjlanY87+LnB2RMXtU8ZY0z0G/XKbL1
	YifQO8RNGNVYN7Nn9copupikyKQtDdubnSIqUsavw1HDjh8AQbMSozriqk9TQJPTKeOzGfMMYnN
	9tsLf1uRHUviVzZgeMJfMko4UfwAx5sy7jvrnwjlWaNhAwTE+2RHKYl74lQs6zHIk=
X-Received: by 2002:a17:90b:3890:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b0db6bbabdmr1594476a91.11.1793945281675;
        Thu, 05 Nov 2026 22:08:01 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b0db6bbabdmr1594437a91.11.1793945281137;
        Thu, 05 Nov 2026 22:08:01 -0800 (PST)
Received: from [10.50.53.195] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm6342907a91.5.2026.11.05.22.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 22:08:00 -0800 (PST)
Message-ID: <1cb6d902-73f3-4d65-96f4-4b3c5217253c@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 11:37:55 +0530
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
Content-Language: en-US
To: Lee Jones <lee@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [BUG] qcom-spmi-adc-tm5: lockdep reports invalid wait context in IRQ
 handler
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ezv2HTX_Cr93QQt9ThndfKlKrlyIajva
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfX68WOfIWt7iJw
 NOK1moRkRvhf8sDzPqsQzr1k9eMVLRpXrvmADJ3yU3j5DSiuQTP6xdJmd1Iz1q5D/QTNDlC6mOF
 gqfo3fV+5CWklT321BoTpoT055RLJKE=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed6ec2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=-h-ZKOrKgG6alCjGbVIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Ezv2HTX_Cr93QQt9ThndfKlKrlyIajva
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfX7tGYNpP7qDGl
 /skK9/dsrd/uxxqnxkEcINpyb29Du92OkP8FXhqdFkRnkRl5bv9kFGXaFSlDZDPZSZV0h48zIgX
 knLWRLxlc1aGI/SGVqonUcAksI/YFyvCDLoOco+XzdSljJWSWCjf1BZfQeBdl7pmSL/gMRJb142
 Lu6fpl+lncp1gge9hhrM9AInqnc3ytX66y/xWHA4MoNDxIbsbMCgG3iLz28KZPUbEUHNLtVO2jQ
 tCKzlSfRWt0bXkeIqnQpZiOq9cdBk1o8SGgum9YJRkl8NVZ91bVCnRp1KahD81CoT8diVB8wp8z
 xifLvdMNCmWfwtHuOIM40/t2JR0pfnp6rkHLvTsoIQOSdjJhwqSLgmlCPzb1teOdvVuGMB33H4G
 mKGdaIy+A0IjRWtYAyl/P04nIMwEqX0kSrQspS4dMMHCfYQ5KZMTYTKNaibEzg4S7zHCfYtwLTq
 qFAkfXKDXoGtowwcvgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060024

Hello,

I am seeing the following lockdep warning on Linux v7.4-rc1 when
CONFIG_PROVE_LOCKING is enabled. I can reproduce it on a Qualcomm Glymur
CRD and so far I have only observed from v7.4-rc1 and only when
CONFIG_PROVE_LOCKING is enabled.

The warning is triggered from the Qualcomm SPMI ADC TM5 Gen3 interrupt
path while adc5_gen3_read() performs a regmap read:

swapper/0/0 is trying to lock:
ffff000b67201018
(qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
regmap_lock_spinlock+0x20/0x40
other info that might help us debug this:
context-{2:2}
locks held by swapper/0/0: 0, last CPU#0
stack backtrace:

CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc1 #1 PREEMPT(full)

Call trace:
check_wait_context.isra.0+0x2d8/0x380
__lock_acquire+0x2ec/0x840
lock_acquire.part.0+0xe0/0x250
lock_acquire+0x8c/0x1e0
_raw_spin_lock_irqsave+0x6c/0xd8
regmap_lock_spinlock+0x20/0x40
regmap_raw_read+0x88/0x328
regmap_bulk_read+0x10c/0x340
adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]

There is also an ADC timeout around the same time:

qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000:
Reading ADC channel pm8550_gpio_02 timed out

Kernel/platform details:

Kernel: 7.4.0-rc1 #1, PREEMPT(full), not tainted
Platform: Qualcomm Glymur CRD
Firmware: 6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 (04/10/2026)
Config: CONFIG_PROVE_LOCKING=y

The full backtrace is:

[   12.924146] 7.4.0-rc1 #1 Not tainted
[   12.927848] -----------------------------
[   12.931982] swapper/0/0 is trying to lock:
[   12.936217] ffff000b67201018
(qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
regmap_lock_spinlock+0x20/0x40
[   12.947855] other info that might help us debug this:
[   12.953060] context-{2:2}
[   12.955773] locks held by swapper/0/0: 0, last CPU#0
[   12.960896] stack backtrace:
[   12.963889] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.4.0-rc1 #1 PREEMPT(full)
[   12.972208] Hardware name: Qualcomm CRD, BIOS
6.0.260410.BOOT.MXF.2.4-00601-HAMOA-1 04/10/2026
[   12.981070] Call trace:
[   12.983606] show_stack+0x20/0x38 (C)
[   12.987398] dump_stack_lvl+0x7c/0xb0
[   12.991180] dump_stack+0x18/0x24
[   12.994610] check_wait_context.isra.0+0x2d8/0x380
[   12.999552] __lock_acquire+0x2ec/0x840
[   13.003514] lock_acquire.part.0+0xe0/0x250
[   13.007837] lock_acquire+0x8c/0x1e0
[   13.011530] _raw_spin_lock_irqsave+0x6c/0xd8
[   13.013256] qcom-spmi-adc5-gen3 c42d000.spmi:pmic@0:adc@9000: Reading
ADC channel pm8550_gpio_02 timed out
[   13.025949] regmap_lock_spinlock+0x20/0x40
[   13.030264] regmap_raw_read+0x88/0x328
[   13.034227] regmap_bulk_read+0x10c/0x340
[   13.038368] adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
[   13.044118] adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
[   13.050313] __handle_irq_event_percpu+0xac/0x4c8
[   13.055170] handle_irq_event+0x54/0x120
[   13.059218] handle_edge_irq+0x104/0x1d0
[   13.063272] handle_irq_desc+0x3c/0x68
[   13.067152] generic_handle_irq+0x28/0x40
[   13.071289] periph_interrupt+0xe8/0x1c0
[   13.075353] pmic_arb_chained_irq+0x148/0x380
[   13.079860] handle_irq_desc+0x3c/0x68
[   13.083730] generic_handle_domain_irq+0x20/0x40
[   13.088503] __gic_handle_irq.isra.0+0x58/0x108
[   13.093179] gic_handle_irq+0x1c/0x40
[   13.096976] call_on_irq_stack+0x30/0x48
[   13.101024] do_interrupt_handler+0x88/0x98
[   13.105342] el1_interrupt+0x3c/0x60
[   13.109035] el1h_64_irq_handler+0x18/0x30
[   13.113268] el1h_64_irq+0x78/0x80
[   13.116791] cpuidle_enter_state+0x13c/0xa10 (P)
[   13.121552] cpuidle_enter+0x40/0x60
[   13.125251] cpuidle_idle_call+0x184/0x270
[   13.129483] do_idle+0xac/0x150
[   13.132729] cpu_startup_entry+0x40/0x58
[   13.136786] rest_init+0x214/0x220
[   13.140309] start_kernel+0x4c4/0x4d0
[   13.144097] __primary_switched+0x88/0x98

Please let me know if additional logs, the kernel config, or testing of
a proposed fix would be useful.

Thanks,
Pankaj
