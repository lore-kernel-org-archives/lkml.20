Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6453FD20
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180491; cv=none; b=AwpIREtszZdqnxfTY97/IhZV8rhoiSPGtwlSKGHX4N5Y8aUoBh5xKEw2Gco/aJmIyqPPci1hs3tf5ZfEbgieJgv9oAGZhElu6Ik1tDOJkP/Y1Ji15espdF7cHGdP3gxAlssvKPs+Zp0CIv9ujyE9tc7JLfhYeuw8+7lVIaFuFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180491; c=relaxed/simple;
	bh=C0aQ83vLq2xkcLbeSieRlc0YdpDyHjBs5i89TapTo50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qr6Z6bPn3d3oQ7+r6RZFoJIeFbpVVdBVjBMe8C7UrJL4eTb/IoyQ/qPlJBhVVKaQDpIkdkCxI+t+f3WDnXewJWoBQfccNTG4huop0WOjUQUwdTsmb9UPR60H801Q0u9xohe51C+lhLhCWukyCl5Rr4qZfvJfnqEys+hY5ZKK0ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ibm.com; spf=pass smtp.mailfrom=ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FamIbBis; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FamIbBis"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGA7873708720;
	Wed, 23 Sep 2026 16:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZcoRdx
	XPrmS1d20YMAKxezeFtqcplaGpZnLH1kTYytA=; b=FamIbBis1gZIaiY2B3esux
	xdxYUEIPPjGYkg6wgF4Axa4byh1LeYFSyuouTz7ENbApxpXy8C+cePnjD8sgmA8T
	cJLY3F8gMuQ9Kdcv93t0h88LIB+WOYE3frcPXxCyDdm7jeA5oyMVkfqAzt/iIlQv
	pmnuLAddV9laXAcQk9OTVlAv639+jfvJwUOeibKGydzg4zqHbW08FNZufnNnHuWk
	U5MoPO2Az4X16TyGfE1uUJ4tHSsZJUfERMOi1nfXGjbwfScZwZlWemJ1cAQ8a7fJ
	qMP80CGl5iuaJTQHJn8BhALycA+lSR6fdTAJWQaPdypIEJfE2scOgUJvC14Kkwhw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1kyb8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 16:21:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGHX3k608643;
	Wed, 23 Sep 2026 16:21:14 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gvbt2spde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 16:21:14 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68NGLCTq66584896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 16:21:13 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE31558058;
	Wed, 23 Sep 2026 16:21:12 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D08D15805D;
	Wed, 23 Sep 2026 16:21:08 +0000 (GMT)
Received: from [9.39.19.48] (unknown [9.39.19.48])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 23 Sep 2026 16:21:08 +0000 (GMT)
Message-ID: <bc0b1c90-aad9-4696-ac85-0bb4e44cc7ba@ibm.com>
Date: Wed, 23 Sep 2026 21:51:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ppc/fadump: collect dump when CPU_STATE_DATA is less
 than reserved
To: Shivang Upadhyay <shivangu@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: sourabhjain@linux.ibm.com, adityag@linux.ibm.com, adri.vero.dev@gmail.com,
        anushree.mathur@linux.vnet.ibm.com, chleroy@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
References: <20260828094942.2439404-1-shivangu@linux.ibm.com>
Content-Language: en-US
From: Anushree Mathur <anushree.mathur2@ibm.com>
In-Reply-To: <20260828094942.2439404-1-shivangu@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: FTFi1BLt_yGbD9jw84GRHNcvlgUwcsdn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfX/qHp2hq+1XoE
 KagiOZt5DklB0oeD1rUIeWifj96Pp9w2yyi1VZgIW84h/Zgim7L++EK7Pip8ZsJsnhmPE6sJ+87
 D3xsjO2QXJOTmcUQ+LE9HXpV5MC6exQdPCrImy8LbUDo3LVz214kMQsfJGsOtMf7oP+MlfeJhW6
 WUpmKf1IwUcgzq/wEvWYZ9kdFRDV3scVpfg3mGQwpV0t9+Cy4mfYL2xeMIV1tEDE0twwi320/dn
 YmajvUpX8PJ/5Q2C3ewSM7SyoV3VdGeHlZBxxulozCNDm2vRhdhRj+7bshUTvc10dMRx11tJybs
 qo66zxGn4ivPl3G104qz/c1jgnFaCUvULRDe7jjZP/FuFu8wnrucHBMk/+lSdKQ7Q4EtRHJ2gxN
 3Me8v1buL9XwzKrmr2ZMMhuxlw5qr9T/3d+/J3fmZB9e0kgGSxncXBjKns7wcy+i5/zxAYczYgW
 NHuuguA9nZxIgufJNnQ==
X-Authority-Analysis: v=2.4 cv=O/KsLx9W c=1 sm=1 tr=0 ts=6ab3fc7b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=Tux-YmWtoYNaYMML6QAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NCBTYWx0ZWRfXzgPirTs8C6Ww
 A/M/I+bFhTvDiSBIizEzao5jC4uc6qjDYVN3jD6jzBd2icgu6Yvx/ZYwtnlfoI2CJbljcaeUyFg
 9Fm1gw4bNCzc+gsupF4SofVf5bHJM3o=
X-Proofpoint-GUID: uVCPgsBQZymEcDmlOGD6EmuRraLPU1NJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230064


On 28/08/26 3:19 PM, Shivang Upadhyay wrote:
> During Fadump in Qemu VM, when maxcpus value is set to more than current
> cpus, following failure is observed.
>
>      [    0.045806] [      T1] rtas fadump: Dump taken by platform is
>          incomplete (0)
>
> This is because the CPU_STATE_DATA is allocated for maxcpus, while the
> data is only filled for current cpus. As per current implementation
> of Fadump, dumped_bytes and source_len for a region have to match,
> Which is failing for qemu's case, Even tough the dumped bytes are
> reported correctly for only the current cpus. After this /proc/vmcore
> generatition also fails.
>
> Allowing dumped_bytes to be lesser than or equal to allocated length, for
> CPU_STATE_DATA Fadump region.
>
> Reported-by: Anushree Mathur <anushree.mathur@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/all/5e66daf4-3f55-4044-94a5-4f50bb040849@linux.ibm.com/T/#u
> Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
> ---
>
> Changelog:
> v4:
>      removed extra blank line.
>
> v3: https://lore.kernel.org/all/20260827075803.2240934-1-shivangu@linux.ibm.com/
>      removed extra variable.
>
> v2: https://lore.kernel.org/all/20260826125626.2108771-1-shivangu@linux.ibm.com/
>      Only allowing lesser size for CPU_STATE_DATE Fadump region.
>
> v1: https://lore.kernel.org/qemu-devel/20260429065127.366813-1-shivangu@linux.ibm.com/
>
> ---
>   arch/powerpc/platforms/pseries/rtas-fadump.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
> index 3bb4ac2ab6cc..838e97c24308 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
> @@ -459,6 +459,8 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>   	/* Check if the dump data is valid. */
>   	for (int i = 0; i < be16_to_cpu(fdm_active->header.dump_num_sections); i++) {
>   		int type = be16_to_cpu(fdm_active->rgn[i].source_data_type);
> +		uint64_t bytes_dumped = be64_to_cpu(fdm_active->rgn[i].bytes_dumped);
> +		uint64_t source_len = be64_to_cpu(fdm_active->rgn[i].source_len);
>   		int rc = 0;
>   
>   		switch (type) {
> @@ -469,10 +471,20 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>   				pr_err("Dump taken by platform is not valid (%d)\n", i);
>   				rc = -EINVAL;
>   			}
> -			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len) {
> +
> +			/*
> +			 * Make sure that dump is collected for entire region.
> +			 * CPU_STATE_DATA region is allowed to dump less than allocated space.
> +			 */
> +			if (!(bytes_dumped == source_len ||
> +			(type == RTAS_FADUMP_CPU_STATE_DATA && bytes_dumped <= source_len))) {
> +
>   				pr_err("Dump taken by platform is incomplete (%d)\n", i);
> +				pr_debug("type -> %d, bytes_dumped -> %llx, source_len -> %llx\n",
> +					 type, bytes_dumped, source_len);
>   				rc = -EINVAL;
>   			}
> +
>   			if (rc) {
>   				pr_warn("Region type: %u src addr: 0x%llx dest addr: 0x%llx\n",
>   					be16_to_cpu(fdm_active->rgn[i].source_data_type),
> @@ -482,7 +494,7 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
>   			}
>   			break;
>   		case RTAS_FADUMP_PARAM_AREA:
> -			if (fdm_active->rgn[i].bytes_dumped != fdm_active->rgn[i].source_len ||
> +			if (bytes_dumped != source_len ||
>   			    fdm_active->rgn[i].error_flags != 0) {
>   				pr_warn("Failed to process additional parameters! Proceeding anyway..\n");
>   				fadump_conf->param_area = 0;

Hi Shivang,
Thanks for working on this fix, I have tested it with patched kernel on 
both PowerVM (ppc64le) lpar and guest, and it worked totally fine.

As reported earlier 
https://lore.kernel.org/lkml/5e66daf4-3f55-4044-94a5-4f50bb040849@linux.ibm.com/ 
without patch I was seeing multiple kernel OOPS and

     [    0.045806] [      T1] rtas fadump: Dump taken by platform is
         incomplete (0)

After applying the patch I am not seeing OOPS and not even this error :
"[    0.045806] [      T1] rtas fadump: Dump taken by platform is incomplete (0)"

Fadump got completed and I came back to guest console successfully.

Please feel free to add:

Tested-by: Anushree Mathur<anushree.mathur@linux.ibm.com>
Thank you,
Anushree Mathur

