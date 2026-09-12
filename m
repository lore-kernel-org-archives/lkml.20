Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAE147AF6A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216462; cv=none; b=dd4QrdfaUlh7pUykywUTjiYAOFccF1aoz3lKoBMpPESQ4X7IOmxwUAk4XXIznNFLLJOv2ZUzU3pH555U5EaHgvB2ymJ/iy2+5ynt2rPtdIs8XYm2NvunxxrNojg2HIcmESwYBBVA935x5mDhZ4OixGsFyugkePsTmnDhpirL1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216462; c=relaxed/simple;
	bh=tSvHMCx3+Uls2wlNRJyG10pVkL/zjfglm2Gbj+rlc1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TIWdO8j9eDFiYkK8Ai2nopuzgQ31gOm0n8qTfgm/OTqa5h8xYSdEartVDT80AOOwcyZ4j7XZl/SGahXWDw11AtjiZCWzo9Fb8l0vMOXDwRuPaCg7fjF62PojPfuOELC7xHx8P5sIxB32ppom30wG2YXjBQVaRa6HTayuuAKX6Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bMMT0NHC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bMMT0NHC"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CC1mKT509624;
	Sat, 12 Sep 2026 12:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5fAPVy
	EPSLKVtmbwcdg9VdhI6ZLUsSvnam/5M5R9uMs=; b=bMMT0NHC0WfD4QxsWIoJQk
	RqFbQA60u82pYONqdFYNKZmcSHs1ZOQH1p+XDPrea1Fk89Vdsn1BnknQVj6JHFIs
	lBnjTVyjhdcsrApnKiSIB01o+MeG9yyw5z3+r1wWkaTulTLP7TFY5au27Nq1WIqX
	v4p5KbV14bSiMhZrFX1pDoEiVeJEiSuk4s8S5Hge2m3W3ftL6e73zGfqt8V6jj46
	dlGK1gMdhn6xNrKX2ZF2eqbUeCQgXsiS1EYvFhN5Mk+eZ0+UicrhnjPX5jyG1SG8
	sMrvaCbeoDy/LotSXxcwo3OdUrqwjhjGKI++70mosuWc+ZoL8nVqYc6ooXRFFZAw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcuh9k2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 12:34:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBbO5i3239830;
	Sat, 12 Sep 2026 12:34:04 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gn3wp0esp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 12:34:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68CCY0Ea40960326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Sep 2026 12:34:00 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81E7820043;
	Sat, 12 Sep 2026 12:34:00 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ED7120040;
	Sat, 12 Sep 2026 12:33:58 +0000 (GMT)
Received: from [9.43.50.135] (unknown [9.43.50.135])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 12 Sep 2026 12:33:57 +0000 (GMT)
Message-ID: <b76f92f0-4728-4b55-81aa-b0851d225c1c@linux.ibm.com>
Date: Sat, 12 Sep 2026 18:03:57 +0530
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
Cc: adityag@linux.ibm.com, adri.vero.dev@gmail.com,
        anushree.mathur@linux.vnet.ibm.com, chleroy@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com
References: <20260828094942.2439404-1-shivangu@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260828094942.2439404-1-shivangu@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4MSBTYWx0ZWRfX6baLTxAhLhc2
 ufF37UVw7rUuJP9jE05VZLay2IEbG14Avs118AziHBkmJr/jceDRayWxg8kVJEIhVsxysr/Naja
 /d0qxZe3auhUvp+YXvYxw+fZ7d6UN80=
X-Proofpoint-ORIG-GUID: f3XK2WlTqZelRDYWnPD8Rjmqyb-NiOpK
X-Proofpoint-GUID: kcmijTNr6FX5FT5BELxjpdZST20vTwF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4MSBTYWx0ZWRfX/20kgRPs6gf3
 Ej5PuX9JPNMWDh5YBKtWBWt3Hm/sPuvLKqLugZAENQWCLXA2bpEljnyE80LTdSABWLERdLxVp+B
 /cbgkc4CkunHG1aYf0U/Iw9jWQkoXQaAHZB9lCowo0aQhj19KPfpFcHOJX6UpTnRY6ufdVPFrNi
 GzEM3uCk5393ttUpJlyreYNW9QhMiRavy0wCXRME3HELmR/gMDBhPcStHmF/4ehls039E05v45k
 MtZwxlE3HaTj0Z7MJONNPoqEReshyZ0msexWWbjcI1MeDjyIyPp9OOmTYOScQYSZCexhQVraHQc
 sSHURp27URdcR88vwGT+6W3bxDeMxO9f3RHJGJ4Jg3brIvl61zTHAKSYVjVCuYXymTs/T/Ao6eE
 8ODkNYYc3ggCUZSmqmSZXHyPu8+6JqKwJCdODO6ujzHv7wInqegl86BxAgfu5/HXL5FOMbErwrH
 AuI7WTv6vPb7Sq0tUow==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aa546bd cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=ZHU0lENvvK8ub83SEc8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120181



On 28/08/26 15:19, Shivang Upadhyay wrote:
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

Yes, as per PAPR, it is possible for the CPU data to be less than the 
source length
due to CPU hotplug. Therefore, it is OK to accept bytes_dumped being 
less than
source_len for the CPU region.

I have verified the changes and tested them on LPARs with different 
partition configurations.
The dump collection went fine.

Feel free to add:

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>


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


