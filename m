Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929998;
	b=1ypvAJ8Q9te6jYt8KVPNr8CZhYFVv8GIJlLO/obwsm2NN5x/BYSorP2BCIKU/csM4poM
	 a17Uhm320zXUUrS7ycp8GJF12/vjQgUcZrHACTYINvsZo+K+lMjuM8JMGwlKZgcKJ1eRp
	 c5daiZ0PAIcJ6Rqdg01qPiP0+hiP/W1NVbsiqzq2qLI2JUzbEVUw0LpjWz0f3FFaRjZR5
	 Vigu6YimijDWuT5RRt6ePrEgPitIaGEx/N0CEUBF/wwtylXH52KG66bIX4QgsPGJ3cuqq
	 eRImbfBkHYwuGsC8ts+aAZ1wB9FszHoExu4Lbbioby8kYmbNtcWhgPEwWYe9zMxGoJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pqaMMNWM/Q7lcArrwhm35JxHeiilvtfQVWCH8k7KGCU=;
	b=DyIXPN0Q8HLZ97iosjC76h7xPt6Yc0A+XolzkDXgkwsJk4TBtbEC3/eUotH95cHI7/SM
	 6JkepJxfX8EhRtASuK+2+qPxwWX9/hpTgTTwB1ukwoVYBTe0M+vCobdQP4rhwrHbxCUE5
	 uLm3Smh87OXIuCjKhydYuW2RK4NCkhzhbhCkJCtmFSBuyXMuAfiNtOwjwnaK/iMUv/kQY
	 qw1mMED5Q4/22nt1M3k5tyv9r3m/RY4/zxzZOTPphIbjQf/AasXtYGO5Io6TC0xEaG2/m
	 AX07AsBckYWDyjOQ/nHu+yaMqcxNXTmhPjX8eOe3FrJGbesESeRe0dSII+3z77uckmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJJNtNQf;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE44606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJJNtNQf
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQcjl2892664;
	Tue, 17 Nov 2026 15:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pqaMMN
	WM/Q7lcArrwhm35JxHeiilvtfQVWCH8k7KGCU=; b=kJJNtNQf0WcnhQqYF8+K7m
	4qrsAy1gLq1EAs3kiVAYa5G7HpSkcWUO2HeW21IZAp535Ved4U+dzLJBasa0V8j9
	ao23ze7rTq/F5/+iyA9cQ05rBRgf2v3JIURH02vWljYjArdBwaS6O74zU/pKkSnM
	mbpMqkQw3XdmHIwjfGGFZt+XxD2to+YT9VsETAwobWkcl9D7dwvOsUlPDLdpVueT
	vh5ScsVz6hyApIgg83p1hIIJFxr4Kv9HjYs2/PdvAhftXloCKjFPe81RczMNbaQ1
	QVZof2y9y88+X6qtvL9YxZkEHfSSCVDy0ekjuF84GbNeFTPhm7F86MKEetAb7j2Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hxf56c3kr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 15:39:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFYwdU1758420;
	Tue, 17 Nov 2026 15:39:39 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j02jucm5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 15:39:39 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AHFdbYK27984492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2026 15:39:38 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3F5C58054;
	Tue, 17 Nov 2026 15:39:37 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6090D5803F;
	Tue, 17 Nov 2026 15:39:33 +0000 (GMT)
Received: from [9.39.20.228] (unknown [9.39.20.228])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Nov 2026 15:39:33 +0000 (GMT)
Message-ID: <2a142695-8623-4904-93f7-ecee8303e86d@linux.ibm.com>
Date: Tue, 17 Nov 2026 21:09:31 +0530
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
Subject: Re: [PATCH 5/8] powerpc/perf: mpc7450: Add the PMC6 L3 events to the
 alternatives table
To: Matt Turner <mattst88@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
 <20261109-ppc32-perf-v1-5-a6e8a55b3b48@gmail.com>
Content-Language: en-US
From: Tanushree Shah <tshah@linux.ibm.com>
In-Reply-To: <20261109-ppc32-perf-v1-5-a6e8a55b3b48@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX4+3pzylmdJpY
 ZHWMf72sF1n3Xb9LiOZhlDvNmv7bM/WorKa7Xb9nssL577hQ9kGV12tqMNx/WAw3RT2Vfs/T+M7
 Wb/6D3eeLDeVH0AsyLejVKXd5Va16nc=
X-Proofpoint-GUID: PIau_JvXvrW0yfbM5nG7gadDxs11NamO
X-Authority-Analysis: v=2.4 cv=ROImjIi+ c=1 sm=1 tr=0 ts=6afc753c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=N1JELc4CeVoOcBN2EHAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tJuVAV-lLvwxtgY2maYRyCH3ZEZN89Qa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfXxdti2hsq1RE0
 mgg2UiyZrtwCjdU+B9faiPrzScSZGiRUw6nm13yNcuPAUvPi4R4hEuHEBfrWSuCNRDJ2qgohoP0
 epVNAKXf9LISp3KMwFv8Q25fyLXTraQbiBVmGtRPkb9Kv3t8Qa0a8lRSERN0onEeezIXCRH5tN4
 /k93waYsXj/fG3m+/qEjx7FpFnrj60KlyHo//UDd0lBLl+WIPVSMzTotjckCqDlEZX1Fj2yJGBT
 K+2HRabpuIV57g7J1BaAgTmo8sIhqfDZgGMQxi0GqxrRYI4cedFiBED9ehoiekibrBt5Sb7kI6k
 J/fd5PerysC9yP8KNco+YYdunxa6vFa19F5ozIpr8SGOwSCri7ftqhQyL6BlVVgOPmd+jG0xgm7
 1KqK4fsZ7RLRJeBhfGtlXhPWTp1DbzIwZwb/2XWJnCXhIljOnZaniC5vtZ+kxvFozLShpo1cUuI
 qtBIl75Y4Tw+Yu5PjZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061


On 11/10/26 7:17 AM, Matt Turner wrote:
> PMC6 repeats five L3 events at a second select value that the
> alternatives table doesn't list:
>
>    0x61f  L3 hits, also 0x503 and 0x603
>    0x620  L3 misses, also 0x514 and 0x61e
>    0x621  L3 instruction misses, also 0x505 and 0x605
>    0x622  L3 data misses, also 0x507 and 0x607
>    0x625  L3 touch hits, also 0x50e and 0x60e
>
> Each is the same event as the PMC5 code, so add them to its row.  The
> scheduler can then move them to PMC5 when PMC6 is taken.
>
> Not tested on hardware with an L3; the 7448 has none.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
Hi Matt,

I checked the five new PMC6 codes against MPC7450UM Rev. 5:

   0x61f  select 31, L3 cache hits          (same as 0x503 / 0x603)
   0x620  select 32, L3 cache misses        (same as 0x514 / 0x61e)
   0x621  select 33, L3 instruction misses  (same as 0x505 / 0x605)
   0x622  select 34, L3 data misses         (same as 0x507 / 0x607)
   0x625  select 37, L3 touch hits          (same as 0x50e / 0x60e)

The descriptions match the PMC5 and PMC6 entries they are grouped with.

The rows are now at most 3 entries, so they still fit MAX_ALT.

Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>


Thanks
Tanushree Shah

> ---
>   arch/powerpc/perf/mpc7450-pmu.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
> index 27337a03ebde..b2fe977cea16 100644
> --- a/arch/powerpc/perf/mpc7450-pmu.c
> +++ b/arch/powerpc/perf/mpc7450-pmu.c
> @@ -185,18 +185,18 @@ static int mpc7450_get_constraint(u64 event, unsigned long *maskp,
>   static const unsigned int event_alternatives[][MAX_ALT] = {
>   	{ 0x217, 0x317 },		/* PM_L1_DCACHE_MISS */
>   	{ 0x502, 0x602 },		/* PM_L2_HIT */
> -	{ 0x503, 0x603 },		/* PM_L3_HIT */
> +	{ 0x503, 0x603, 0x61f },	/* PM_L3_HIT */
>   	{ 0x504, 0x604 },		/* PM_L2_ICACHE_MISS */
> -	{ 0x505, 0x605 },		/* PM_L3_ICACHE_MISS */
> +	{ 0x505, 0x605, 0x621 },	/* PM_L3_ICACHE_MISS */
>   	{ 0x506, 0x606 },		/* PM_L2_DCACHE_MISS */
> -	{ 0x507, 0x607 },		/* PM_L3_DCACHE_MISS */
> +	{ 0x507, 0x607, 0x622 },	/* PM_L3_DCACHE_MISS */
>   	{ 0x50a, 0x623 },		/* PM_LD_HIT_L3 */
>   	{ 0x50b, 0x624 },		/* PM_ST_HIT_L3 */
>   	{ 0x50d, 0x60d },		/* PM_L2_TOUCH_HIT */
> -	{ 0x50e, 0x60e },		/* PM_L3_TOUCH_HIT */
> +	{ 0x50e, 0x60e, 0x625 },	/* PM_L3_TOUCH_HIT */
>   	{ 0x512, 0x612 },		/* PM_INT_LOCAL */
>   	{ 0x513, 0x61d },		/* PM_L2_MISS */
> -	{ 0x514, 0x61e },		/* PM_L3_MISS */
> +	{ 0x514, 0x61e, 0x620 },	/* PM_L3_MISS */
>   };
>   
>   /*
>
