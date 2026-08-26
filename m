Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BE1455175
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766224; cv=none; b=iMeAxrjnXOXZzdSYXBOFShQdpxN1X1FsuR/9e6xcGVTz2sjWuZSauYqsvt4ggYbYp0CwSP2PSSSBEfOJhpi1JALs0BbAp/VQB5UR6IlFo5ko2+IG9CzlRCxus4Nx/J8T/kGnNEmygi1ROFjFWShBWgliqt3hD/fC3psJS4pzavM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766224; c=relaxed/simple;
	bh=IJjJiCRnhG9LWaiQ1b0uPd4CBAmpxMSnp4hk/d5wU3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IT6KDszu73pPQAjxcBr1K9M2R9NwJjDdPhNZoeVRZj96/BSF3oFnokAnvW0g4UzNj/E0gMHsTeRYiBaJ+G2Bc7NuGZftvVM7lCAaNkcWsxPlUIZhXsB1e2vLt0JefyzLHjNoaGCEn9EjuovFSyGzYx0j8XvLf8MPosW2SU80SAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5+v/VQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GN/f2Wk6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5+v/VQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GN/f2Wk6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QHOPex402630
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6V9WI5J1uTR3UjfvxVm6sCyRfn9y1gV4JDAQn1epUkk=; b=B5+v/VQaiHiUGVJ/
	D9meusciCNg/PXztul72dxRaxJjdanPJWyaEFkPs3HEDqjVXSyP/EF8i3JdQ9ky/
	o5Ir5fHG8V4LU3bWIg6BjkAuSxsmMfE7fdF3O+qeusAySK5qtCRmFwwbY5gLpjt9
	0pO2uZB6pebRArB0QWhDNUBKufR2qPCl1n41l7NBFKc9ZBpkkcvoRwW77fCme7gQ
	fFEtJK4cfRhc8Go3j6f46GaQxJb/xRbl6Oz20vQ9b8659/ijfdcsToBlVTrWqAq3
	SABRTl6f5pxQ8SrJHHiLrIzbNHSy8F9ik3HGMsGw1TpIDBMXAVQTImanKg0Z8ix5
	QmqJnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthtbuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:43:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2446730a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787766208; x=1788371008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6V9WI5J1uTR3UjfvxVm6sCyRfn9y1gV4JDAQn1epUkk=;
        b=GN/f2Wk6E5yJaaBZWCJgtGVa5jUlk9Rep/ONKXqh7uzZLcbelCpVMC1KSTiWf3mT1d
         GWpiBMC96UNgu4XoJuU4lMHWzFfg+jhGWIULAvzoT0qXEbzjiik1wYy5blP2BduU/XDu
         7Fr8nLxQRs5Jf94oVW7ty3qMI62MmVYPkutTCFAokYBp7B+ND/xuzDouhaxObcLUQLF0
         L70QnWkYvxXwAtqfiSjQgm5R43pG6lx0OQ32+xnpLvOTYWGJUrxMlGIEXegBgxdcINJQ
         aDWTp7Zl5cwILVH/ASMkzcElMiL2XWjAan2FYxdGBOQFsrf0/gWPnQp5rEzJSavQdlIG
         k1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766208; x=1788371008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6V9WI5J1uTR3UjfvxVm6sCyRfn9y1gV4JDAQn1epUkk=;
        b=hDc7L+9r0zQ2aXuWt6KXENZQfqNm/ekarR0vq9saGdGAkBotlT837dUIBhZC44VEXy
         Q/DSOb6k8q/MlDablrUhUr7HJ7x4s8DyraPBpMD7WWltsODkHffuoAkCymsj4/RhBgAZ
         4O5HRou6BS4RrevqatAN/MtzBO8YmyYSXZHiDIICYWdp5ok/5P1Sh6iHyw4lAE72H3So
         6aDY1bp8hgmxcRmZBVimYrZEP6xZOKCIO/3sSwR33klTuQo8B0ZazME6TDWUbgAj89Kr
         N1E6MlsFh6B/kEsmyvwZgJ9pNSndA9MRRTB6Mq6ARR+AT1bqaNMoqrvGGmL3ew3MLrCB
         tXQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZfsI6dBa3Ez/F8ZZO818Uhp51NarjfDl1eNlcYk5qsvNEdZMHDQ5wTM+JBtWwLav2W2IBjnUXR4iCD4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++meWzmCkGW30NongbHlcpEc1Q7Pw9Uw9s2eVx/GygCx0qTM99Gx
	X+iV1W7d92lPpGBl10xsfn8DqAOpNJW7II6Z4zc36CtBeqswlkUsDV3YhTa5aMsCn5sWD/VMbkg
	GVF2Mw+pdQ+um6AyH8ljhafRvFZRyCRbm2dJ6SwOMe49mk2yXLYJKtooZ8a0axKspcMo=
X-Gm-Gg: AR+sD11tudFDUFcHN2yOaelg/r2ZLM4EYPbl4tkcxYyH5xFlC7WBnpJmx4ZHOIYagGP
	vjlFcQPuWfRZeb0xzCV6GAuhn5P8X+eHP5dGYf0oflM8VFJi7iwtQ1DjHTqAafMqvWIx5dWIjP9
	eHh4Yb6L3T6ynIpyNZVX2ln1tJ2iSlVDbSt52xoD+0glCBr+Yl8XWbKYrM11eOd7ZoHx5qmgHi2
	if8szM6O/j6y47hO4gAn1Ja9tVjXyFfW3SKX/6E1MBKUDT8ijIHV9apM1O+blHIGDpiGAoZZ5if
	7GFwWjP9yflo3QihgiuNNDU+irPq+hrh+FDp3WoO3I3uJrd5fjdsxNOo+JyeemmbZwGclStYrBx
	JIZ8pkCYCHNKRvvwTK2zF+oA9tn9djSteAGqlWrjoTpGxJYwn/khYRqGghUNDQ5TkLGUFCrsTdh
	D24XIRs/vmBSfcZlmlZg==
X-Received: by 2002:a17:90b:5544:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3966d403489mr18578276a91.11.1787766208186;
        Wed, 26 Aug 2026 10:43:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5544:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3966d403489mr18578189a91.11.1787766207732;
        Wed, 26 Aug 2026 10:43:27 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm8950241a91.9.2026.08.26.10.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:43:26 -0700 (PDT)
Message-ID: <913fd0bb-6257-48f8-9f04-7df3d44c201e@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:13:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-13-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-13-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8f25c1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=3NjWhugmwSPu7QgOpREA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: uj0cu0vhV0bwdj2I-ZCi_kVFsD9YSrzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfX6ITtQsKnAQZm
 XjO1zlKr/xEHxUF9AYEWw1n/z8JcFSUiJtCSgerYq51yjTbLT/2G9+Ah5FHRuP2//q77v6tnDIH
 KR8d2wuwqHtTnZRWryJCBkQtHqSMhzQRNGpBrcCDGsHw1hSTYMHxzz97BEx1ywtdE1kKZ0RrV0s
 37yPx4B0L919i3lTJbboxTL3e8Jp2+xOqhvjRnzzDcT0HK8ib87/rIqJHbC6WtDaWvbU9knfNui
 CwNRjFY/xJcUkaEQy9HpT7d6AZmmiHK6BVb4XG+FVNxldCDXI7djGotPiMW/UQ5fmesyNxz/gPc
 C9Mu1qkp318EXgU56NhQZxMJc6WfJ9H5YvvdRcpFL27IWeZCu6GaCGuZ44UiOxth5mLGXykTIqe
 nq6CLev+Mwzh1+U69NbNxVxXczP/itoQgIUcVlUs0eNu655eofmpyBlbicjXSUXhtq56Be+7EMo
 t6AIRF5IMwuR4kSb2Yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfX7oRHyqstttl1
 YTGj+Sv/K6Euyr0kcUxP5D7AY6srMEiFIic5MvmaxOu1P6nSMkzkqU6q0DbRuKDWlAgwM+0gmAU
 jU3Iez1ETETZ9lPu2eb/zuK7cetZTAM=
X-Proofpoint-GUID: uj0cu0vhV0bwdj2I-ZCi_kVFsD9YSrzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260148



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> 
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com> # on Arm AGI CPU
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 112 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_fb.c       |  41 ++++++++++++
>   drivers/resctrl/mpam_internal.h |   2 +
>   3 files changed, 153 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 4b1382fce2be..4d3f13044b43 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

