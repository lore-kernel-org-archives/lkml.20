Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15432E121
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540709; cv=none; b=B15UgpVoas7YJUrRf22SCFK1JC2avZaq5SuP1v7PGjhNAe7VJeMLA/8vQ984RsnWWKQQHZiImj+ro7tW3B1dFja2xaW8T6QLdN/Cv+a3M9viqCUH7xFs7EVwtI2qs27Rs3XzV0vnysWMV6fVj6vOLN4L3g2S6u5JmBIVOg9EAvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540709; c=relaxed/simple;
	bh=SuxvJ9KKa0qKqDHA7jyhhFzC/rHvdZtT/EAN01OTRX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgSjKv27nmqtSEbUdjFQebWKncvwp+OdBtVVcCNbG58G1TecNWFvIpGHXuxP+nn9QKQl6uZMnRfZAxnzEvXtyr2hKz9K2/WAfMPesTGjlbwKOY3QwLcD8s8XSKC8Q8EESmKVMWh9sBdVjrm+XyOd7L+8GdoeHWfOyMdc+wYKEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9+rwgWr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WM3aYTlw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9+rwgWr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WM3aYTlw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIbG1746833
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 10:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZ27aZoApByEcF3gsdb/5xfvlMFvFMJampnu5+gTCXw=; b=R9+rwgWreAdU68Qn
	vaVwDST+qdnzlUQJYEPPyO0Mx5/ZcTKaz2XqImzJx0v6IYeYsTaIeKj4g5sfZbS5
	IyxM4mvLzK6gf7a8FQg72ZxA+FODbRBEhp+s9WtfnJF7fHKAmEPjlLAuffG7cmMI
	GJ03DbXd2Bh97NFMzp4eWMvNM8C2CNn3tiL9VjBwoLhhc5zy8VlzHWfRbvGGX9Lh
	Mq+UFVBcamM3XZ5tGMkbg81Rohd1rFN73KTOwg45dTNvGpBeAVEmj6mjOUN7TKGc
	F9w4Im1+87ZFFQy/HJJKL/hjLBxKHKT6QDQt1Hs8zHOrVnN+I1joWKJcIAWtPdgL
	XYqtPA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvbcdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:11:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so21986157c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540705; x=1792145505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZ27aZoApByEcF3gsdb/5xfvlMFvFMJampnu5+gTCXw=;
        b=WM3aYTlw0VXYJlc+BAMd8jTSMrijeUddB7/dlXisBCoEkDn2Y1FW4cnx5JrCzk8Ody
         Jcitk9ClibX1MgN/64PrLHfKd4iC9MevUn897+HR1gL9AUifu9GpIOZCU/ScHd/hxizJ
         rcvcZ3bgGsto9Fwe9DibL5NF9WaCotxtjhLiSyl0cOenJGSmEUq/zxmVd4p48HUNW8oL
         LdoKKU9vR2MGTZT7USNedIov/BvBY718bX/S9xHfgKOvP6RXVJzG41SHyEfTfcywENaV
         JwQegLNUrws5T+nRtqwnDlRTsKyypGq2VwD/G/eYUOkpYMdJiBvA9MhhdS2/Rvg9l6ue
         QsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540705; x=1792145505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZ27aZoApByEcF3gsdb/5xfvlMFvFMJampnu5+gTCXw=;
        b=rMpZ9p+WIfpDjscaVROGCFQr6t4zcBQuChqDbR//5HSTOVwM/G9X9X4RtHb7bpnCal
         eRUrnOI24g9r1iyci48wE6c9i5Jk6PYcOxN73hBfvTBle4NDuUbAQYFPxMbV81wUGlZW
         mOQ1O8wtt6ohwIOdSXWRgox6iWuQnc2RIkjCnAt9TvZ1RoSe+LDw/UNWU1ldlIIWggYq
         +p91Wot5dCOiMO6Hs/WwzJw7nwKlZgw8x8XxwBtAbPmV5hVil9CvfbW/YrztnfHnOxMa
         yXqO2q9RECmClj356GviKbZ2UMl5g3NdPq5lbLx3MBxJxEYRiMGBDD16z8nGdU2YH5xO
         TNZw==
X-Forwarded-Encrypted: i=1; AKwUvBzGhmYE5xYJbHLSZ3g82Pjp/sbYTLec544GFrLF8gDFECWe4V4uutNqh0jNaxmQaEUD6AnG+/OmGpyw6ak=@vger.kernel.org
X-Gm-Message-State: AFuF++m4AnhRvupkslnFhZ+EiImYS0KJoPR4ZxzFmyBlxVb3OKh47Gf1
	zZvu0qfUOV4xsH4O7L2WIQJ71l8arpQvFiebVgnAIxEFrPDrFvwJS1plPwEyzQqDCoC+GVeImcv
	SIjzQ2bE1Vyp2t10sLzTtO5Ggh5Tl3a1BzBplJHoVX6ftb/sPV2h4LXYbRtcHvB9Pqi0=
X-Gm-Gg: AYBFou07+Wt8vb1N46p3GSSUTVwTmfS2yvvDnoYD5iG59aIEkfAwnX6DXQG0itpaWNR
	PKVC3911Rbbb9BhobmTn1TOwm8goj5mISZW+OWh+9gDNcPr/wIvdBsx3Tv4H/eR28C+OFHZFhXe
	A05ioeU8LUCezvuC2cryUuxlPQWDIL97zxfSRuuY9F3Tnb4RZxJ60fJPnu4MS0uxqZ1+a9vpUfd
	Lx7+XXdU+jArwXyoI45CqpNEpDXx+vz/pJNzHQgM7QiNlrDnnTllzh+6t6wqjD+0PYLMSWQ9Wxg
	g4D1urv8GcxU1+OaqhkOaohnw4nu6SrowkXTj5FvlEx7k7WAZXXye86wB0AKtt2GjiMdn7JHAo2
	eNd8dO249IQUJ5o7vUwoAKAOPeffGQ2XQ
X-Received: by 2002:a05:7022:b0cd:b0:15a:9834:73c9 with SMTP id a92af1059eb24-16a6506a0d5mr1660543c88.40.1791540704965;
        Fri, 09 Oct 2026 03:11:44 -0700 (PDT)
X-Received: by 2002:a05:7022:b0cd:b0:15a:9834:73c9 with SMTP id a92af1059eb24-16a6506a0d5mr1660495c88.40.1791540704269;
        Fri, 09 Oct 2026 03:11:44 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm7508375c88.9.2026.10.09.03.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:11:43 -0700 (PDT)
Message-ID: <f82fb6f8-eb84-4653-bef3-15696001d047@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:41:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7r9sa5Ph8CiP-sYgbG-fi6LbIrY0qZkT
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8bde2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=28pBRv3GLheR_TvLyvoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfXyYA5I0LCHF8m
 DjK04+XiNFeyy/dZ2zvuXklgBIHesM8SWkJTNtNHUeV0H41knzvYnQn8XF6+GJ+s38reaM63MD+
 fCCqUFncx+GOfcIU2blEsG0J9X2YJ0sKovrfM91PamR9IFhdAHrpVybFIihSB7/K2sMg4BG4671
 ZgNoeUkpNqNIRFIZMx+3j9G4RQw0y+rLDTp1EOMJ/XHz4l6oepe+xKgWa2xBX7n2a/Lty9FfrNL
 ywE8eZZmeoSW+3p9LSVRe4ljAdYFRfcu+7xbdGtoLDw2IhvFHlMTpM/bOnKicxCoQRrcb6FFBXD
 3OaMH8UYgyxq7Y12LIYf9QCfMM5NMuAootP8imClYXQFqSjsoEDIjpmCWXKooBWyVDI+gKzsOsX
 Pc08Sy5HzwIZX1id/DF6TDGOKkypvTiRtnIU4/4b7cr7XlTc5IQxbFNzjGUlTqh6S7UyyyBvTlV
 oaGxI6hMeKKgJAZYeYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX7+IlrghGEO0f
 a54YhjcbhSN8ZIm7SZgEDUIg8monjnRkyu6UB5k1BqKAIWxGfU0nVhal2BmQIETkjusxepNclh1
 jYToqk3TKDNqqmC6yAqR8+YLpPShDR0=
X-Proofpoint-GUID: 7r9sa5Ph8CiP-sYgbG-fi6LbIrY0qZkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090040



On 9/25/2026 2:06 AM, Daniel Mentz wrote:
> On Mon, Sep 21, 2026 at 4:44 AM Vijayanand Jitta
> <vijayanand.jitta@oss.qualcomm.com> wrote:
>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>> index 476c0e25631af..01d98959c514f 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -86,6 +86,21 @@
>>  /* Software bit for solving coherency races */
>>  #define ARM_LPAE_PTE_SW_SYNC           (((arm_lpae_iopte)1) << 55)
>>
>> +/* PTE Contiguous Bit */
>> +#define ARM_LPAE_PTE_CONT              (((arm_lpae_iopte)1) << 52)
>> +
>> +/*
>> + * Contiguous hint group sizes per granule:
>> + *
>> + *------------------------------------------------------------------
>> + *| Page Size | CONT PTE |  Block  | CONT Block | L1 Block | CONT L1 |
>> + *------------------------------------------------------------------
>> + *|     4K    |   64K    |   2M    |    32M     |    1G    |   16G   |
>> + *|    16K    |    2M    |  32M    |     1G     |          |         |
>> + *|    64K    |    2M    | 512M    |    16G     |          |         |
>> + *------------------------------------------------------------------
>> + */
> 
> I find this comment redundant. People can find this information in the
> Arm architecture specification.
> 

Ack, will remove this.

>> +static int arm_lpae_num_cont(size_t size)
>> +{
>> +       switch (size) {
>> +       case SZ_4K:
>> +       case SZ_2M:
>> +       case SZ_1G:
>> +               return 16;
> 
> I'm thinking that if you use something like
> 
> return BITS_PER_TYPE(size_t) >= 64 ? 16 : 1
> 
> i.e. return 16 only on 64 bit platforms, then you can avoid those
> overflow checks in various places. Same for the SZ_512M cases.
> 

Ack. will update this as suggested.

>> +       case SZ_64K:
>> +       case SZ_32M:
>> +       case SZ_512M:
>> +               return 32;
>> +       case SZ_16K:
>> +               return 128;
>> +       default:
>> +               return 1;
>> +       }
>> +}
>> +
>>  static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>                           phys_addr_t paddr, size_t size, size_t pgcount,
>>                           arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
>> @@ -462,20 +495,41 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>>         size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>>         size_t tblsz = ARM_LPAE_GRANULE(data);
>>         struct io_pgtable_cfg *cfg = &data->iop.cfg;
>> -       int ret = 0, num_entries, max_entries, map_idx_start;
>> +       int num_cont = arm_lpae_num_cont(block_size);
>> +       size_t cont_size = 0, entries_per_map;
>> +       int num_entries, max_entries, map_idx_start;
>> +       bool cont = false;
>> +
>> +       if (num_cont > 1 && block_size <= SIZE_MAX / num_cont)
>> +               cont_size = num_cont * block_size;
>>
>>         /* Find our entry at the current level */
>>         map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>>         ptep += map_idx_start;
>>
>>         /* If we can install a leaf entry at this level, then do so */
>> -       if (size == block_size) {
>> +       if (size == block_size ||
>> +           (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &&
> 
> I'm thinking that the check for IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT is
> redundant. If this quirk is active, none of the contiguous sizes were
> advertised, so no one should call this function with any of the
> contiguous sizes.
> 

Ack.

>> +            size == cont_size)) {
>> +               int ret;
>> +
>> +               cont = size == cont_size;
>> +               if (cont && (!IS_ALIGNED(iova, size) || !IS_ALIGNED(paddr, size)))
> 
> These alignment checks are also redundant. We can rely on the caller
> to pass properly aligned values. It's also inconsistent, because it
> verifies alignment only for contiguous sizes.
> 

Ack.

>> +                       return -EINVAL;
>> +
>> +               entries_per_map = size / block_size;
> 
> Can't you just do
> 
> pgcount *= num_cont;
> 
> Wouldn't that be easier?
> 

There could be potential overflow with pgcount * num_cont. So, I went with division first.


>>                 max_entries = arm_lpae_max_entries(map_idx_start, data);
>> -               num_entries = min_t(int, pgcount, max_entries);
>> -               ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, ptep);
>> +               num_entries = min_t(size_t, pgcount,
>> +                                   max_entries / entries_per_map) * entries_per_map;
>> +               if (!num_entries)
>> +                       return -EINVAL;
> 
> I believe this check is also redundant. Can we remove it?
> 

Ack.

>> +               if (cont)
>> +                       prot |= ARM_LPAE_PTE_CONT;
>> +
>> +               ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl,
>> +                                       num_entries, ptep);
>>                 if (!ret)
>> -                       *mapped += num_entries * size;
>> -
>> +                       *mapped += num_entries * block_size;
>>                 return ret;
>>         }
>>
>> @@ -660,12 +714,18 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>  {
>>         arm_lpae_iopte pte;
>>         struct io_pgtable *iop = &data->iop;
>> +       size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
>> +       int num_cont = arm_lpae_num_cont(block_size);
>> +       size_t cont_size = 0, entries_per_map;
>>         int i = 0, num_entries, max_entries, unmap_idx_start;
>>
>>         /* Something went horribly wrong and we ran out of page table */
>>         if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
>>                 return 0;
>>
>> +       if (num_cont > 1 && block_size <= SIZE_MAX / num_cont)
>> +               cont_size = num_cont * block_size;
>> +
>>         unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>>         ptep += unmap_idx_start;
>>         pte = READ_ONCE(*ptep);
>> @@ -675,9 +735,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>         }
>>
>>         /* If the size matches this level, we're in the right place */
>> -       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>> +       if (size == block_size ||
>> +           (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &&
> 
> Checking for IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT is redundant. Can we remove it?
> 

Ack.
>> +            size == cont_size)) {
>> +               entries_per_map = size / block_size;
>>                 max_entries = arm_lpae_max_entries(unmap_idx_start, data);
>> -               num_entries = min_t(int, pgcount, max_entries);
>> +               num_entries = min_t(size_t, pgcount,
>> +                                   max_entries / entries_per_map) * entries_per_map;
>> +               if (!num_entries)
>> +                       return 0;
>> +
>> +               /*
>> +                * A CONT group must be invalidated as a unit. Reject a request that
>> +                * starts or ends inside a tagged group before changing any PTEs.
>> +                */
>> +               if ((READ_ONCE(*ptep) & ARM_LPAE_PTE_CONT &&
>> +                    !IS_ALIGNED(iova, cont_size)) ||
>> +                   (READ_ONCE(ptep[num_entries - 1]) & ARM_LPAE_PTE_CONT &&
>> +                    !IS_ALIGNED(iova + num_entries * block_size, cont_size))) {
>> +                       WARN_ONCE(true, "Unmap of a partial CONT IOPTE group is not allowed");
>> +                       return 0;
>> +               }
>>
>>                 /* Find and handle non-leaf entries */
>>                 for (i = 0; i < num_entries; i++) {
>> @@ -691,7 +769,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                                 __arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
>>
>>                                 /* Also flush any partial walks */
>> -                               io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>> +                               io_pgtable_tlb_flush_walk(iop,
>> +                                                         iova + i * block_size, block_size,
>>                                                           ARM_LPAE_GRANULE(data));
>>                                 __arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
>>                         }
>> @@ -702,9 +781,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>
>>                 if (gather && !iommu_iotlb_gather_queued(gather))
>>                         for (int j = 0; j < i; j++)
>> -                               io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
>> +                               io_pgtable_tlb_add_page(iop, gather,
>> +                                                       iova + j * block_size, block_size);
>>
>> -               return i * size;
>> +               return i * block_size;
>>         } else if (iopte_leaf(pte, lvl, iop->fmt)) {
>>                 WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
>>                 return 0;
>> @@ -943,8 +1023,23 @@ static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> 
> I want to re-iterate what I wrote earlier: I think we should change
> this function's name. This is what our AI model has to say:
> 
> Originally, arm_lpae_restrict_pgsizes() performed a purely monotonic reduction:
> 
>   1. Identified the translation granule (e.g. matching CPU PAGE_SIZE).
>   2. Performed a bitwise-AND (cfg->pgsize_bitmap &= page_sizes) to
> discard non-granule sizes.
>   3. Clamped ias and oas.
> 
> With this commit, it now:
> 
>   1. Restricts to the base granule sizes (&= page_sizes).
>   2. Expands the bitmap with synthesized contiguous sizes (|= num_cont * size).
>   3. Restricts again against ias and oas (&= GENMASK_ULL(...)).
> 
> Calling a function ..._restrict_... when it actively synthesizes and
> injects new page sizes violates the principle of least astonishment.
> 

Ack, Will rename it to arm_lpae_adjust_pgsizes, looks fine ?

Thanks,
Vijay

>>         }
>>
>>         cfg->pgsize_bitmap &= page_sizes;
>> +       if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT)) {
>> +               unsigned long sizes = cfg->pgsize_bitmap;
>> +
>> +               while (sizes) {
>> +                       unsigned long size = BIT(__ffs(sizes));
>> +                       int num_cont = arm_lpae_num_cont(size);
>> +
>> +                       if (size <= ULONG_MAX / num_cont)IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
>> +                               cfg->pgsize_bitmap |= num_cont * size;
>> +                       sizes &= ~size;
>> +               }
>> +       }
>> +
>>         cfg->ias = min(cfg->ias, max_addr_bits);
>>         cfg->oas = min(cfg->oas, max_addr_bits);
>> +       cfg->pgsize_bitmap &= GENMASK_ULL(cfg->ias, 0);
>> +       cfg->pgsize_bitmap &= GENMASK_ULL(cfg->oas, 0);
>>  }IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
> 
> Gemini added the following. I have to admit, though, that I'm not
> familiar enough with dirty bit tracking to determine if this is a real
> concern.
> 
> Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)
> 
> When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 tables:
>  * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
> queried and cleared on a page-by-page granularity
> (iopte_set_writeable_clean(ptep)).
>  * If a single 4KB page within a 64KB CONT group is marked clean while
> neighboring pages remain marked dirty/writeable, the descriptors in
> that group will differ in access permissions (AP[2]).
>  * According to Arm ARM D8.3.1, all descriptors in a contiguous block
> must share identical permissions and attributes. If dirty tracking is
> active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
> should be set or whether CONT sizes should be suppressed when
> IO_PGTABLE_QUIRK_ARM_HD is active.
