Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40086492E34
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926772; cv=none; b=n6gp+vyEIcQYbPbd0ohFh6k2TdhwNF8POxGID3hcWGi07N9isyryfr5kNkK9Nd57Ml5HpkXcH71Xqsycl4HvQ1QochVB73HsI9ANFb5SpLp3bcFGbGzqnD4Uc7NRhtQenbHFaemKnKqfUy6XNKRodjPB1RLknMMpfC6RF1Cv+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926772; c=relaxed/simple;
	bh=ZRoxIR8iUpuvzhaGrv1RGMVbu3048LD7OcEqrqpEc1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUAnG1VYK+s1Rg5Av9T+cOD20FDwlsfqS0cbIGQP9PYR2TlJldhku6GpYOeQd4hNCAxTLoI5qiVSkNf+9AkVfjOsgCljCJcfAAlqhMNV+r2AITFBnvqc3PC/S0RTgnDjbAw1TFuIQM+wEXSH5Ss03MjGQRzu4FPbjtD/pWa4VEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMmpulum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UjTMp0T1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMmpulum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjTMp0T1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgRgo482453
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 04:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1+atJR6FDQQspxnJlEifDjkb7d3prg4wHIrPk7shYw=; b=KMmpulumqUHxy974
	LfPhlTuVkXLjKQydr+Jk37/5pYuE/aYqT4tC0rtx0xep6Z5Zc5hGXyE6V9uyi5mI
	L/V60lpVH2wyw0p2Mlpo4yQ1GB03B1HDEsfLxPszNNFMi7DZk1e9HUT7emg9Z9+U
	eF4pf8YDJaolfMdnwLk2Ob1sp2FIqKSbWnKarkKJyWBWmndlFso0JGU1WEB8FdBd
	XQVtgWOwao48Xfz+/PMa8Wz8mhMsX0OMm7QVNVEgUiSagatS+4lNxS8npn2CZD6j
	2tPNYbq0BQEv+Gkv8oI6hdQcVuQmAs33AnuBsN8FisVBXZ1s3GOeUYeNVpULDJZQ
	QvTgpA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1j0hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:06:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so6623122a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788926763; x=1789531563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1+atJR6FDQQspxnJlEifDjkb7d3prg4wHIrPk7shYw=;
        b=UjTMp0T1j3VVNySwD6yEiRExrCP17XQ2n/pDWHis8LLlP31LfX8yqyL4Z3R4vlyvBQ
         uUF1496Kc/yWTkIcoTMG3xyQO3rOS+D3neY9p4CGTS39ghr96nI6G2h1p63QgAP82+xn
         4bcwb5lzGaa3MHfDuxV6QVUBteUIcUfEVRF8K9z33hgOpSsebxqIE7drSY/j4843M1lX
         oJJL2f+RosiIN38t6oMoaNZ9vCjMUPnoz1kfdXO41Hx8p/vwNXyI+6eq7/ez7rwpHacd
         0b+fPZP9rQViJmWyevtTKSzKfsoWys3hFdkVKEduEX/fzXfXm2TCjHswXTfruXUv4z+3
         jp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788926763; x=1789531563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1+atJR6FDQQspxnJlEifDjkb7d3prg4wHIrPk7shYw=;
        b=h50Gwmx7OU3rg7TD1yCB8hcfbdaOyV3ml8afr8AL/KcGKskrLXHllcO9nrpMFC2dwe
         S8UOIHPMwoV+utLc4/q9YO1YWJzcfYB3hdIPwKarrxtZmohpxutDD4gEFFnoV/q+XUCr
         UfRHko5EaLa++3T1IdRa/Cutz4wGKYjerx6p7yu0DYSSzqnLV4XOvjldgLfS59f3bOu2
         4XoOYz9NUcQQxlVp6RoZbhIsqMqZ5uSRi0wOwipXKSE0cmWAy1uR2r2lPDZGyZmM3qmG
         UEU//lsWcO+4xtPw1wAE7LFhrLikP+UyRHpHlN4OVSCKu9UWU8D1o0JVmEcLQlY0uBy6
         E9rA==
X-Forwarded-Encrypted: i=1; AKwUvBxTLT2xoFbZUciiD9DsP7fdjXHDOpQuF8gremAP6Bb2uufUyxeE2p3ZiVJd9jeCI5uKBsXVn2LE95dGQcE=@vger.kernel.org
X-Gm-Message-State: AFuF++m1zd25geEKmeD5tYjcAvfLwezsIrqfvC7VtCXEnKLH2Hw+mvoc
	+snJ16iTAv/AZn9JwFUcErJfuIWfixvZQK0fOBxN7sgW8hMG2HO55P3Dq420jq1IdAI9sEwWrx/
	udw+iroIr+S26COXc8nQKvcWp9oQ7DdOMD8V7AfCMb3p2B49kXjNwd+z0WGE5lSZhtSs=
X-Gm-Gg: AYBFou0BizKBHlOhVg3VNVDPanngtVfHonf41sqCvndp8N75EYw7C7pP04AhdOTA91G
	arCupob8hLIhQGYidsGx6yLLdH9BbDwdJaf8H1Hc9mb+LrKwMQ4FaJgvs3peyp19BjjOzCr/iYl
	x923iQJQz9Vh7dtryruzsgKIt+pfbpsQ4kiUs1ME0h+nXyZPByTuvbtwXX5+ylpEH6QzSprE3qr
	8y9XoDftPif08h/QswEkUrjNOTYS7hVi/fZ4a73z2R5rUN2z68S+bHwWhz1Ao54aSwuExVsClAa
	WlvQBKxQDCTo+5P55AkhtuNlGeX6ODfJvKomuftf2AYNhIzuAXruTidHxZG2/QWlbe51Ki4Csp1
	CqCFh15no9WackxpjRAVcxen7IVuw+XLW3w==
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr50410119a91.24.1788926763187;
        Tue, 08 Sep 2026 21:06:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr50410062a91.24.1788926762690;
        Tue, 08 Sep 2026 21:06:02 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm46654957eec.7.2026.09.08.21.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:06:02 -0700 (PDT)
Message-ID: <dfcecd58-d6ec-4694-81b6-fe6d45d4a7d4@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 09:35:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
 <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
 <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
 <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
 <20260908164746.GC2543240@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260908164746.GC2543240@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA0MyBTYWx0ZWRfX5Kt8cnCtn4Tq
 jTZaJcHkbtAdE0WENoW5GT9UkendxtLD3kfqfq4T0RaOFUcL6ldWjh6Qi5mAHfYe7zxv70u68Ch
 TZG3yI/NeijIID9Ncc485rFN0NQHaH3aQKmNO1Pp4IVzkTAzGMN2DBYnKH/AWJdeIhPx0/AbkP0
 dGfhIt8Y85GGHNKMDIOztFwoeYhfHPUH7SmIGpZ8ZqEiNELo+/vSWf3iaEa7AB4OOMcYKCk6iv1
 EgdlK9mmxWonkindNbU+yikRQOz2FVnUQGSnLcQ7mvLvekYTbrFBBSw9U77Bm/Z5oAfAGqsxebS
 D/QxIGKwhkE92gf08g5SCjkpNZZ4GQlzI1Z1KWT9fsFT0p1hkC0mm3K+5UDcR1H4DtNa7ODx/I9
 zcxvi+NcmCbGwIMMURSy3KPuIAKg/gTDheO6DoApzbeLY8kD89gfImt8Wo4VkQaOs+bv0RXWjWW
 ZcdjMcZyDAbxskMGR9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA0MyBTYWx0ZWRfX45Bm9BFe+laB
 gLhx8zdAIb1EO1iAcOwxKpDnqZ21vIsXNIs/RKjZ8Ng9AjhFBMiJkb3iegCsH5PK2ASLuxmXPDc
 a+pEHH2ePV1VK6ORaC/ZRWm1/M4p6F4=
X-Proofpoint-GUID: yDnSqv2-gqon0TKQTqkYrlwogp9ZpVDN
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa0db2c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=zcW-mOqCcEHC3mfLxN4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: yDnSqv2-gqon0TKQTqkYrlwogp9ZpVDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090043



On 9/8/2026 10:17 PM, Jason Gunthorpe wrote:
> On Tue, Sep 08, 2026 at 09:36:35AM -0700, Daniel Mentz wrote:
>>>> That said, install_leaf() is shared by other callers that reach it through
>>>> ops->map_pages() directly, without going through iommu_pgsize(). panthor_vm_map_pages()
>>>> (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgtable_ops via
>>>> alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consumer, but does its
>>>> own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ_2M, with no
>>>> notion of the 64K/32M CONT boundaries. That can hand install_leaf() exactly the mixed
>>>> iova=paddr=0x1000, pgcount=34 shape in a single call (panfrost's map loop uses the same
>>>> get_pgsize() and hits the same case). So the prefix/aligned-group/suffix handling in
>>>> install_leaf() is still needed for that path.
>>>
>>> Maybe other people can chime in here, but I feel, from an API
>>> perspective, we should have only one way to make of use iopgtable. I
>>> think we should just mandate that users honor the updated value for
>>> pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
>>> alloc_io_pgtable_ops() call and then choose page sizes appropriately.
>>> Otherwise, we end up with two pieces of code in the kernel solving the
>>> same problem. panthor_mmu won't be able to take advantage of the
>>> contiguous bit until it gets updated accordingly, and that's ok.
>>
>> On this note, I want to point out that I tried something similar in
>> 2025 (see https://lore.kernel.org/linux-iommu/20250430231924.1481493-1-danielmentz@google.com/).
>> The feedback I received from Jason at the time was:
>>
>> "Wouldn't it be better to use the pgsize_bitmap and rely on the core
>> code to indicate that a contiguous page size is being used, so it can
>> trivially set the PTE bit without doing all this extra work?"
> 
> Still think this is right, Panthor is not using it well if it doesn't
> jump through all the hoops. Probably there should be an general entry
> point for map/unmap that does the right stuff for the DRM drivers to
> call.
> 
> Jason

Thanks Daniel and Jason for the detailed feedback.

I agree that CONT-sized mappings should be selected by the caller using the
effective pgtbl_cfg.pgsize_bitmap, rather than having io-pgtable-arm perform a
second round of prefix/group/suffix splitting.

Based on this, I will remove that logic from arm_lpae_install_leaf(). The only
effect is that direct io_pgtable_ops users such as Panthor and Panfrost will not
benefit from the contiguous hint.

Updating Panthor/Panfrost and adding a common map/unmap entry point for direct
io_pgtable_ops users are separate API changes, I think this can be taken up
as a separate follow-up series.

Thanks,
Vijay
