Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7C31B130
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810133; cv=none; b=iLNnZrPMSnuowDxB0U7YcKM8Zb7pq8k7ntebVi4bUbTYZVMbyf0bpLzz6l9MyDa/AQIcVBovBsDA+49DkHWNpzMtW7wC6G0hEHrCj+s/deMEadNbLHv31DnxzF4/9TX4XtXCaJa/1YcZvD8wIxQd7h5aWaxcBnIjEdssxxhxoHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810133; c=relaxed/simple;
	bh=hPMuyywoVecl8ax2KcK5SPpsS7pAlk7mB4FHSFpJk6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAlBga/k2D2p6wqpEqGQ8uP28gUSkcQsd4+C7QTieQPYa4D2Gr3yR9b5Ys+BZC/WskCRRrlv0DrvyTwM19ySqOAEieyqjM32dgWyAIukPQnvSIUi/wa9TWeaw1W2Nipenzcq+0+UrT0eL8oPwwqOJkBT4fTe09LWk4WI7DtI/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cv1Q9mLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kejDy50V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cv1Q9mLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kejDy50V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3J5YO2632687
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9KwtqjdHygA+JfB7KLbWaNqlpDVgF/I0UutfMHntlA=; b=Cv1Q9mLxWzu4kkmi
	pojw3wJuTKcBQU5/brnmhfMjXRBQQ2UzSk0XLb5fzssGnUQzae/brdDrsb2S2Bix
	hBqOwlwd36CMbh5aV5SUjinaDLe8AxjXmDccvSUk1+sXvproKpqaxOSN7K4didVZ
	TrW5KNcsHenQWr2suhF5nLgMXI3PpOYhSjNpnwVfKC33S2TE0U3K9OCINcd2Ma0O
	JmtW5Vz+fSdBKVhWleTO4Ns7iwfXSGviWgF6PMaaspspdLaVSp+IW45k6QXeYcTi
	Y691rCLDaAviGRACwt6LslSFusMC90FMd/D7w5P1D2OX4HeLqOf8DYHBKrhuSNGV
	sDKkXQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03abec1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:55:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so3415820a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787810129; x=1788414929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9KwtqjdHygA+JfB7KLbWaNqlpDVgF/I0UutfMHntlA=;
        b=kejDy50V7d7ZxipPtxk51ExLxy2msywQE97bBcDXc7C9iufkTFSzSDYaI6tq7+NewB
         bc0t/ibjhxasdMvVbcwVuiw5vDiFV+UkLcAVsKGxGpVAY5aSdLNMGLwbU22Yk9lzl+PP
         xv8+a76nKepTNGHvuLSPVfIqrOZ+YZHk8+iCeB+dCBJKILAQaYjafPkFhICH8tfsfXhG
         S8LVn5w/1AGs1uFq0C3YAHQxwmvu/BAccyNNt9DInOhx0PNMs017bRSWpK5gHXris7Wl
         9sjtLcYvtRCXJtsMbYNiG16o+qqeKIzRq6/qyk3HXidWGJgDbjy8EnpIhgVkunrfz4tE
         bicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787810129; x=1788414929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9KwtqjdHygA+JfB7KLbWaNqlpDVgF/I0UutfMHntlA=;
        b=d+f/VHOJiODryGwsxRk+8mPp0v5fK44D07yRbRy3kmSk7yJ4+nZjwu6XuOZlaZZMiS
         Gyk2BcTf9HxaMrpzG0V0sV5yuYfdiGw+HAkPxVXbGMiFErs7m/x3AYKvTSlPkC3F82ue
         MOS5htddq8Ax+w0E1w37qdHP0O+7QMvW0muHN4Ci7M4ZY8xWqG36T+G+4wCxjJQLvYxl
         v+mYzpjEwlgrbqKJcLE0RbupTF4+Q8nDWruMCLkXlx9aiICp2vIIvtrwBzfOZN7OzEKc
         pNBIUjhTUbOIgvTv+0aOth5OQpw9dKAatZN5G4P4kUzUYL07ulBtX7C3vSAQ4JGpICIA
         4sVg==
X-Forwarded-Encrypted: i=1; AHgh+RoVDEZWQKr4jkCETZ1FQWizMkFwMRpJjpB5Wjwsa47v0TvyILqaqSMYOyuDwU1owJKWfLyVL/heACQKlFI=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ8K+xaIl/uHI3iCH+Nwn6HoQ4NkyaZOMMkzEHES4PDR4rYUpD
	MU4++emXRil5UgTOFn96KOVKeIlL+2HIIjaNoAuq+PtUY0h2ZHxCV7Uznl34F/OmdwG+WPk2YGz
	W+zv+arOiuxiZuG43oes0c9aTh9x+G6V444r8M36fg71b0rSnyCWMEV0Ld2TkkM2XPvU=
X-Gm-Gg: AR+sD11W44/1F+EdSWm9Cf/1OMi+Ji05dQoWLrMKo0iRZhQVmF8O0C5ruZGSFAsnPno
	wtMshNBisD0ztJKHxM2A3drFPnFjle/yo0hLMOKgt0xcYT6xn0opDacIsL/l7VNYMfI6EOq2r/S
	xUmPled991EU2wqIY/PBxKyn0+wJLt069iOD+rkB8Rnm+89M9jJ6kKi+ew3aUkiruybSwvyDakC
	KZV42sPiX5RL/LdLmG+4ZWkzb06X1hr/Qh9WprsM5DPqHHVR39MTA4sTi6XTKdpPwZNCXcdpmdM
	aQNy50X3y1KMIxkgK0XCvSoquWnJzTKjuDzbVcRRUemW4IgHOW7L/lnoi55rA1njEaAkTYZiKRC
	05IGFSPVXN8KcleFmiryMZfSHLWooMg1TLA==
X-Received: by 2002:a17:90b:586d:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-3966d491c45mr26906384a91.16.1787810129209;
        Wed, 26 Aug 2026 22:55:29 -0700 (PDT)
X-Received: by 2002:a17:90b:586d:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-3966d491c45mr26905985a91.16.1787810128348;
        Wed, 26 Aug 2026 22:55:28 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm22588440c88.5.2026.08.26.22.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 22:55:27 -0700 (PDT)
Message-ID: <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 11:24:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Daniel Mentz <danielmentz@google.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
 <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1M06oU1gDPsof8tWhEtFu4jKaaD3KTO5
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8fd152 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CZE9kkL2blzp5uFjx4sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1M06oU1gDPsof8tWhEtFu4jKaaD3KTO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA0NyBTYWx0ZWRfX4ohw9VDvDJ3u
 vaV2dlyMTT0xdvYPXAB1nIYLhWLrodbyp9Cykk7D8UrtjYoS4rZfKSBtCP8FUi5FP735zMv80C0
 LsOKGnHTvYYHPuFTcAii5jnOJjCI4F8B9kynZhEiXsd8jT57RrumOpC4aDcTo/glfUPmVfWbj+r
 29AslMolz9SWt1sauwKxiS6xTYfhE59ptFJf57C+TbaPWFKAO0h6tTVNlJ9AV0gM0IXVw36ZmQg
 uzqcr7+TasBJw0hEO/AWgr2NABrHMtyRN5HTGIOR46I4vZik/O12jv/PS7jdTAWxR/EhxHBOstN
 KEMxJzHdp5+Cn4JBEFiqPc396WFdcDQzDKeg7j52u3lEpmXpOHu/i6FHQSR3QQn3p6lawJMHlWb
 oj4UyL5o8To8dqYvEdQCHA49Gomk9hHVsXBOHPnPucE3hdz5nPInb0xkhVf5q65c97ptIPCOjMz
 g5yR0veVz6BUhqb9GfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA0NyBTYWx0ZWRfX0krxkcKGCcIv
 6gdSBQMBiKp89SKXEwiHP8jBQEtAWnmFMp01PD0V2b/OcdZppeRiVUlqXbnd5g1bV4JG3QJKAG/
 MeoIDWuAZRdlC/HoUJUNM4ujriTyyG8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270047



On 8/15/2026 2:15 AM, Daniel Mentz wrote:
> On Thu, Aug 13, 2026 at 11:13 PM Vijayanand Jitta
> <vijayanand.jitta@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 8/11/2026 10:34 AM, Daniel Mentz wrote:
>>> On Mon, Aug 3, 2026 at 11:19 PM Vijayanand Jitta
>>> <vijayanand.jitta@oss.qualcomm.com> wrote:
>>>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>>>> index 476c0e25631af..23a238de53ed5 100644
>>>> --- a/drivers/iommu/io-pgtable-arm.c
>>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>>> [...]
>>>> +static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
> 
> I'm wondering if we need this function at all. I'm trying to
> understand that would happen if we advertise page sizes that cannot
> possibly be used given the constraints imposed by cfg->ias and
> cfg->oas.
> arm_lpae_read_and_clear_dirty() appears to check if the end of the
> iova range is out-of-bounds (WARN_ON((iova + size - 1) &
> ~(BIT(cfg->ias) - 1))), but function arm_lpae_map_pages() appears to
> not have such a check.
> 
> If we need to restrict the "cont sizes", we could consider Will's
> suggestion: Add all the sizes to cfg->pgsize_bitmap in
> arm_lpae_restrict_pgsizes, and then subsequently clamp it like so
> 
> cfg->pgsize_bitmap &= (BIT(cfg->ias) - 1))
> cfg->pgsize_bitmap &= (BIT(cfg->oas) - 1))
> 
> That would be shorter than the 39-line arm_lpae_get_cont_sizes function.
> 

Agree , I think both arm_lpae_get_cont_sizes and arm_lpae_cont_size_fits can
be removed.

Instead I'll add something like below to arm_lpae_restrict_pgsizes as suggested.

+ if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT)) {
+        unsigned long sizes = cfg->pgsize_bitmap;
+
+        while (sizes) {
+                unsigned long size = BIT(__ffs(sizes));
+
+                cfg->pgsize_bitmap |= arm_lpae_num_cont(size) * size;
+                sizes &= ~size;
+        }
+  }

  cfg->ias = min(cfg->ias, max_addr_bits);
  cfg->oas = min(cfg->oas, max_addr_bits);

+ cfg->pgsize_bitmap &= (BIT(cfg->ias) - 1);
+ cfg->pgsize_bitmap &= (BIT(cfg->oas) - 1);

>>>> +/*
>>>> + * Install num_entries leaf entries starting at ptep (index map_idx_start
>>>> + * within the current table), tagging arm_lpae_num_cont()-sized groups with
>>>> + * the contiguous hint where both idx and paddr are aligned to the group
>>>> + * size. Entries in a misaligned group are installed without the hint.
>>>> + *
>>>> + * idx and paddr both advance by block_size per entry, so their alignment
>>>> + * relative to the group size is invariant across a run of entries within
>>>> + * this call: once a group qualifies (or fails to), every later whole group
>>>> + * does too, up to num_entries. This merges each such run into a single
>>>> + * arm_lpae_init_pte() call instead of one call per group.
>>>> + */
>>>
>>> Can you provide an example for when this function installs descriptors
>>> where the contiguous bit is only set on a subset of them. I would
>>> assume that the contiguous bit is either set for all descriptors or
>>> none of them.
>>>
>>
>> That assumption doesn't hold in general -- it's only true when the
>> map request happens to start and end on a cont_size boundary. For an
>> arbitrary map_pages() call it usually doesn't.
> 
> I believe you won't see arbitrary map_pages() calls. I understand that
> these calls are exclusively coming from __iommu_map_domain_pgtbl()
> which uses iommu_pgsize() to determine optimal page sizes.
> 
>> Example, 4K granule (num_cont = 16, cont_size = 64K),
>> iova = paddr = 0x1000, pgcount = 34:
>>
>>    - idx 1..15  (off != 0, misaligned prefix):        installed plain
>>    - idx 16..31 (off == 0, paddr now 64K-aligned):     installed w/ CONT
>>    - idx 32..34 (off == 0, remaining < num_cont):      installed plain
> 
> In the example you provided, I expect that you'll receive three
> separate calls from __iommu_map_domain_pgtbl:
>  * idx 1..15 with pgsize 4KB
>  * one call with pgsize 64KB
>  * idx 32..34 with pgsize 4KB
> 
> If I took your argument further, I could argue that we'd also have to
> check if we can put down a block mapping if iova = paddr = 0x0 and
> pgcount = 512, but we're not doing that either.
> 
> Could you provide the input parameters to the iommu_map() call that
> resulted in the parameters you provided i.e. iova = paddr = 0x1000,
> pgcount = 34:
> 

You're right -- for the iommu_map()/__iommu_map_domain_pgtbl() path, iommu_pgsize()
already splits the request at the boundaries you describe before install_leaf() ever
sees it, so install_leaf() doesn't need to handle a mixed prefix/CONT-group/suffix
chunk for that caller.

That said, install_leaf() is shared by other callers that reach it through
ops->map_pages() directly, without going through iommu_pgsize(). panthor_vm_map_pages()
(drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgtable_ops via
alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consumer, but does its
own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ_2M, with no
notion of the 64K/32M CONT boundaries. That can hand install_leaf() exactly the mixed
iova=paddr=0x1000, pgcount=34 shape in a single call (panfrost's map loop uses the same
get_pgsize() and hits the same case). So the prefix/aligned-group/suffix handling in
install_leaf() is still needed for that path.


>>
>> One arm_lpae_install_leaf() call, three chunks, CONT set on only the
>> middle one.
>>
>>>> +static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
>>>> +                                unsigned long iova, phys_addr_t paddr,
>>>> +                                arm_lpae_iopte prot, int lvl,
>>>> +                                int map_idx_start, int num_entries, int num_cont,
>>>> +                                arm_lpae_iopte *ptep, size_t *mapped)
>>>> +{
>>>> +       size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>>>> +       size_t cont_size = num_cont * block_size;
>>>> +       int done = 0;
>>>> +
>>>> +       while (done < num_entries) {
>>>> +               int idx = map_idx_start + done;
>>>> +               int remaining = num_entries - done;
>>>> +               int off = idx % num_cont;
>>>> +               arm_lpae_iopte pte = prot;
>>>> +               int chunk, ret;
>>>> +
>>>> +               if (off) {
>>>> +                       /* Misaligned prefix: advance to the next boundary */
>>>> +                       chunk = min_t(int, num_cont - off, remaining);
>>>> +               } else if (remaining >= num_cont && IS_ALIGNED(paddr, cont_size)) {
>>>> +                       /* Aligned: merge every full group in this run */
>>>> +                       chunk = remaining - remaining % num_cont;
>>>> +                       pte |= ARM_LPAE_PTE_CONT;
>>>> +               } else {
>>>> +                       /*
>>>> +                        * Aligned idx but paddr doesn't line up with cont_size,
>>>> +                        * or too short for a full group. That holds for the
>>>> +                        * rest of this call too, so install the remainder
>>>> +                        * plain in one go.
>>>> +                        */
>>>> +                       chunk = remaining;
>>>> +               }
>>>> +
>>>> +               ret = arm_lpae_init_pte(data, iova, paddr, pte, lvl, chunk, ptep);
>>>> +               if (ret)
>>>> +                       return ret;
>>>> +
>>>> +               *mapped += chunk * block_size;
>>>> +               ptep += chunk;
>>>> +               iova += chunk * block_size;
>>>> +               paddr += chunk * block_size;
>>>> +               done += chunk;
>>>> +       }
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>>>                           phys_addr_t paddr, size_t size, size_t pgcount,
>>>>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
>>>> @@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>>>         size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>>>>         size_t tblsz = ARM_LPAE_GRANULE(data);
>>>>         struct io_pgtable_cfg *cfg = &data->iop.cfg;
>>>> -       int ret = 0, num_entries, max_entries, map_idx_start;
>>>> +       bool cont_hint_enabled = !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT);
>>>> +       int num_entries, max_entries, map_idx_start;
>>>> +       int num_cont = cont_hint_enabled ? arm_lpae_num_cont(block_size) : 1;
>>>> +       bool use_cont = cont_hint_enabled && num_cont > 1;
>>>>
>>>>         /* Find our entry at the current level */
>>>>         map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>>>>         ptep += map_idx_start;
>>>>
>>>> +       /*
>>>> +        * Normalize an exact whole-CONT-group request down to the
>>>> +        * equivalent block_size/pgcount so it funnels through the same
>>>> +        * leaf path below. arm_lpae_install_leaf() independently decides,
>>>> +        * per sub-chunk, whether the CONT hint actually applies.
>>>> +        */
>>>> +       if (use_cont && size == block_size * num_cont) {
>>>> +               pgcount *= num_cont;
>>>> +               size = block_size;
>>>
>>> This appears to me as if you're throwing away information about
>>> whether this mapping request is suitable for the contiguous bit, and
>>> then in arm_lpae_install_leaf(), you're trying to recover that
>>> information. Can't you just do "prot |=ARM_LPAE_PTE_CONT" here and
>>> then completely avoid the logic in arm_lpae_install_leaf?
>>>
>>
>> That optimization only applies to the exact-whole-group case already
>> handled above (size == block_size * num_cont). A single map_pages()
>> call can also cover the general case shown above, where a misaligned
>> prefix/suffix surrounds one or more aligned groups within the same
>> call. Setting prot |= ARM_LPAE_PTE_CONT unconditionally here would
>> incorrectly tag those misaligned entries with the hint.
> 
> Due to how __iommu_map_domain_pgtbl and iommu_pgsize operate, I don't
> expect to see the prefixes and suffixes that you are describing.
> Instead, I expect we'll see separate calls to __arm_lpae_map(): One
> for the prefix, one for the set of aligned groups and another one for
> the suffix.
> 

Agreed, Replied in above comment.

Thanks,
Vijay>>
>> arm_lpae_install_leaf()'s off/remaining logic is what detects those
>> group boundaries per chunk, so I don't think we can drop it in favor
>> of always setting prot |= CONT at this call site. The size ==
>> block_size * num_cont check here is just a fast path for the common
>> whole-group case, avoiding a walk through install_leaf() for something
>> the caller has already told us.
>>

