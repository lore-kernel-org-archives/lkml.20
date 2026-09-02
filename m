Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C7D33DEF7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330122; cv=none; b=IzdA7j7yOmTmdw4tORrsAhQF7nQMZRfWQwFC/6HIbOzRP1AeQCThnMzM8AIQ7a6YcB9duuzs/uDAU4c1Kna078SGol11tdg2mqV6KKWbSJzKrGVkNf/xp87Enfh5KYtfT9HsqH0r2S5Gixniu+gUdQLoTNrsswwiKvfNKEHnCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330122; c=relaxed/simple;
	bh=IKILhXjePhkmh1blLB11FN8j6ZpAYj9J0hMgBzhGT9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebZhiMhD4Xy3OmvRe3QoB5Kpky/OWwcm9Rz/Poq07Fe4XcScnlGvbUyqoNJGtLlMo62ZpRrZ53hE36gXLACPnMa+9aX+6ncCueS/8hYEhXWwuSTH5B12rSAdlNkh4kXBcHBM3slCgWgB51I5DBB8ruBPm/RibMIhPdc2+wUj9OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Q6N8wf/P; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Q6N8wf/P"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KWjeu2283590;
	Wed, 2 Sep 2026 06:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K8yc/T
	iaThXYPKmiIO7GmlLUo4dlNSWnzStf0CamE4g=; b=Q6N8wf/PsUW2U4+RecHWbW
	eZ1TSwC9/cPZVlyGzwDC1TAt1BkfHV1ZP4O2QEi76SxdekBvV8+POd7qmP4+9fGt
	iIMK8P4A/d93EMvOXajqJVMuR2QQX/SqkAEkXoToi1wo8JmHNh5PHtKXRZjwEodp
	JJ0+NVFSCuicv3Jt+pPxAfza9iU0JXyk25tAuL5B1euQxMUeAZwlYGh+9Nu8e5sx
	oCZI1w8z0O8FdqyLQRL527LNikX5yAatn241fi9yRAfKksdDlilLutby5tNKJ1pP
	iSKC4tjdH5jV1QWC9gk/34+KNxQTMZumpbCYjYZMzbn+lLeJJ8FF/KidaQUqt+xA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq2tc81w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 06:21:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6826BK9A005064;
	Wed, 2 Sep 2026 06:21:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcb8hg260-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 06:21:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6826LNS043254060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2026 06:21:23 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A6BE20043;
	Wed,  2 Sep 2026 06:21:23 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C4CF20040;
	Wed,  2 Sep 2026 06:21:19 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Sep 2026 06:21:19 +0000 (GMT)
Message-ID: <42267839-e344-474b-a91c-efd337808f98@linux.ibm.com>
Date: Wed, 2 Sep 2026 11:51:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] x86/crash: reserve elfcorehdr for CONFIG_NR_CPUS,
 not CONFIG_NR_CPUS_DEFAULT
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>, x86@kernel.org,
        kexec@lists.infradead.org
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
        baoquan.he@linux.dev, rppt@kernel.org, pasha.tatashin@soleen.com,
        pratyush@kernel.org, ruirui.yang@linux.dev, eric.devolder@oracle.com,
        hbathini@linux.ibm.com, ruanjinjie@huawei.com, brads@mainlining.org,
        linux-kernel@vger.kernel.org
References: <20260901071041.16311-1-ionut.nechita@windriver.com>
 <20260901071041.16311-2-ionut.nechita@windriver.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260901071041.16311-2-ionut.nechita@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=bc1bluPB c=1 sm=1 tr=0 ts=6a97c066 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=i0EeH86SAAAA:8 a=t7CeM3EgAAAA:8 a=OuZLqq7tAAAA:8 a=VnNF1IyMAAAA:8
 a=L4ZZY0jnB1IY1FPthvAA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MiBTYWx0ZWRfX3X4Yx0mx/ZQY
 svzdWJWj2+tYN+QPzzIIF/OLS3/SeP8hh2ROQ78D5C1GWV/zFos0IEJyERpw04JQE1Fa4HdcXP6
 Qy9ByIsErqmUWBDTms4SFlh3W9d3SVU=
X-Proofpoint-ORIG-GUID: sKHmp-1hy7wmST2jZ1nqH9q5Sb9NhB6v
X-Proofpoint-GUID: sKHmp-1hy7wmST2jZ1nqH9q5Sb9NhB6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MiBTYWx0ZWRfX5GIXSHld/bRT
 co7e8vjZfljKlPhxPmoNG5rvpBVFI+bmVyRUHAjKwJrUm5569/jHEUAd8nTkt88YpLvOsS7oGCZ
 NwtUFvCVTSodu/a13oM5N9Ihy5MZBaD0JForwkdntI54f0lzmckegk6+P//5RsLosqcuj2TF5tv
 2//9GzbgEl9EEqpjMk71wvujIXK0GY5tb3fG09Z3t+uCwUPj036VUYgh3QSLLfsdfAJFlGxGOh0
 GkCLfLxy8mkFQt2ZcPG45+aCpoOlKXxW6cL6BEvngChQF197X9AkqjS8AQu2LXZz2Wrl9lCHqTh
 FJExS/NdyewygazJg9sdX0houOXz3XXSFNL0B1HHsY0VLGaPV03Hpp6+Rmt79tAK7Se3/OrL+sv
 uUWZ6intZIx+SALyVgdYUihQ8y8CRXaLrDJ5cj+PbZBRIwnXRu3alRDPUWDcYm6z5x/GXl/bgxj
 m3YYMoi8971KfB+P5+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020052

Hello,

The below patch overrides the changes introduce here:
https://lore.kernel.org/all/20260826092541.3905933-13-ruanjinjie@huawei.com/

Can you please review the above patch instead?

- Sourabh Jain

On 01/09/26 12:40, Ionut Nechita (Wind River) wrote:
> From: Ionut Nechita <ionut.nechita@windriver.com>
>
> NR_CPUS_DEFAULT is purely a Kconfig thing.  Its entire purpose in life is
> to start NR_CPUS at a sane value.  There is precisely one (buggy)
> reference to it outside of Kconfig in the whole kernel: the x86 crash
> code.
>
> That code undersizes the elfcorehdr reservation whenever NR_CPUS exceeds
> NR_CPUS_DEFAULT, because the header carries one phdr per possible CPU and
> num_possible_cpus() is bounded by NR_CPUS.  kexec_file_load(2) then fails
> with -EINVAL from sanity_check_segment_list(), and kexec_load(2) silently
> truncates the elfcorehdr, which surfaces later as a bad or unusable dump.
>
> Size the elfcorehdr reservation with NR_CPUS instead.
>
> Fixes: ea53ad9cf73b ("x86/crash: add x86 crash hotplug support")
> Assisted-by: LLM
> Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> ---
>   arch/x86/kernel/crash.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index e681ec9cf1dc..e6f23933a6df 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -369,9 +369,9 @@ int crash_load_segments(struct kimage *image)
>   	 * maximum CPUs and maximum memory ranges.
>   	 */
>   	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
> -		pnum = 2 + CONFIG_NR_CPUS_DEFAULT + CONFIG_CRASH_MAX_MEMORY_RANGES;
> +		pnum = 2 + CONFIG_NR_CPUS + CONFIG_CRASH_MAX_MEMORY_RANGES;
>   	else
> -		pnum += 2 + CONFIG_NR_CPUS_DEFAULT;
> +		pnum += 2 + CONFIG_NR_CPUS;
>   
>   	if (pnum < (unsigned long)PN_XNUM) {
>   		kbuf.memsz = pnum * sizeof(Elf64_Phdr);
> @@ -430,7 +430,7 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>   	unsigned int sz;
>   
>   	/* kernel_map, VMCOREINFO and maximum CPUs */
> -	sz = 2 + CONFIG_NR_CPUS_DEFAULT;
> +	sz = 2 + CONFIG_NR_CPUS;
>   	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
>   		sz += CONFIG_CRASH_MAX_MEMORY_RANGES;
>   	sz *= sizeof(Elf64_Phdr);
>
> base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4

