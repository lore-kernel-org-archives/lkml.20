Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893328;
	b=je7TDBmXs5UME3cTs9ymU+RwvQWneZRBeRk7rmZQBI9w9S6tChgtC6/HPnDqvllYce8h
	 NTVsmxfssqPvcO6VZofyvndPdTBw2S1K8aoWX340G8oRyuXx5kUPOmkYedF7z5ZpFM99O
	 FXYXoXJn2NAJkb3CMR3u89zDhCAEVXERHSdLE/J2sLrmTY034anhRNs81tl8ElMHZN0yS
	 NYoSx9WktZaZZVSNeCwuefeh5iVqyKyc+k2IiO3Qtsyp6jZNy534JQfy7dhQuNBt1zR2n
	 9wQ/M7cchfhufsDiAwixLGIl3USofgz5haLaHKLR4rXQkmaJ2q5clucRbpBOExkPFnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tiq/52RpumbLroLNo8L52jaj4Ii9SWDDyhDE5SXLdGY=;
	b=MoO7RIPR4AIb43DW61jGfDq2CKjoBi5tedbtYCXPJj5DWYQTgnNKa75ia6GS9FU0Pdh6
	 TquGjDSmU2nKj3sXEeXwG7mZBhs2+t13Vui9xn9DqiCbcT/wbqDKCH5rUXgsmmAjWQNJd
	 xCgbSm0LIY0N5OhLYmPXTxwmFCbF9lHu8fvkExymez2QsU3OV8B9IHRNZEJ9xmM+uLHHc
	 ZrSlmO0HnRvKS95NYPw5tNbnIiGZMe9cjgEsm8USpb6SL1P9KAD9cTci1c4pvcSToHYr1
	 XcYGnbgiKIUFwoQweTjDRnzmScMUrSD6xdsdrLCpbCG66whCnLXz3Sj989PWC95+4Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhJTRozP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MoSqGsS/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942D606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C942D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhJTRozP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoSqGsS/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aCYv3624157
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tiq/52RpumbLroLNo8L52jaj4Ii9SWDDyhDE5SXLdGY=; b=KhJTRozPBc4IBPM2
	xyFbzyZv+g6Ct5m0PsZrjvzdeh/5BbvBjaSzY96u5i7LRgboZjdKxlCJ0DhL2tHl
	Xa8Ju6FVHXkNoInFuySKgqk2xypJCAJHtfaQ/vrKRhpOVLRVYlTLGU5IRJEf9iLn
	3i+bfoM9u82eYCCXjdLwh09J57DGKQ1SYLPGTof3pKqpJ4LU8Kip/kX0uTfRcF84
	Ztra8h0BY3EuVv65FwTJWtMhMaccd1o6XxakEXgZC1qa3GRVCjZubotTP209MVsU
	rqto+KACEhN2DYPMayazdMMw5U5L4e5kL65Af3zzRR1UW8RMV/A3XEVBrkX5fkOj
	PGwTAQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rehy64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:28:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso2863678c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794893326; x=1795498126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tiq/52RpumbLroLNo8L52jaj4Ii9SWDDyhDE5SXLdGY=;
        b=MoSqGsS/aTWeKmhdeQtuc8o6sGC+f1y0Pr+1Z0Qz95YCLCr14oufcvlGahYL5RSuFa
         1lBHxTSNSbYyxVoTOi3j2jqXCu6FxBdUYkekRRjFfV61llhjZO89PB6vEENhb8Ethmx9
         vqmfz66uJszVUT1Ycb5Qxtr2gliGnuGeoWkVh6+N/j9vyHtjRbS4WApMYC1Kixu2PN6v
         zMhTjPy1KENRgTrNPinJi6QIE/EpBEyCmtV+60U3DTKfCH3idcP9aQb9ID6mrsyco+sK
         sYddv2A0U3aOXFNBcRjDkkRIRgDnYI7AY/i5g9UJ+mj+z4UhvGMMR0Qz2IdBddHbmJKh
         /tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893326; x=1795498126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tiq/52RpumbLroLNo8L52jaj4Ii9SWDDyhDE5SXLdGY=;
        b=GhExWy99gabBAU6mk+4szyzzSWd7r6Zq647nzlgUcoZhbpvRYYcd5209RzhkxNngf2
         sxyOrLLU9yZIFMrcMLHqqQuHcnmZ+C0Z8TjManFdxK/8UZkyIgP3deiHgaTaA0vj5o7O
         dojF14B8nG9GTTqQXERAzivcoBMH+6dgNkyFeja9DiO4Chk23v9owvJj0Z8V+E2tQgLl
         NmnWzlV+ZkArAK8vRiRy8z46kvXePPAqzbOZXIFvmKDGDUeAhn1bbUs2/nZZEJubqveg
         ikQhGjSMG4MtICn9Ggz8vdWW1arLUMXVPsgXYC/iS+gOGijQaEU/eLx62FDHLIrohXkz
         pSOA==
X-Forwarded-Encrypted: i=1; AL+hErHIPjUQxYS0T+x5vz0uXi+0vl+MDhUNXAKTXiOsqSgawb5vanz5XIXBVcXeOwDc9Og1jnOP8TH2zWLHV3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KLt5Q2NquVBpKaIQDAm+gWBD2wLokVSfuiNjX1QY9dVb5IduT
	LlV9mG6qoDpsgYSMpFUe/WSvH6AHRzlv4TIQ3hnEEfsnO7ZOgxR40auohJ2j5jf5zmv1Ht8Ns1o
	DnsY3xmGA27AsPZHpituzFs3D5SSN+fV/MmXCZIqnSQgFnAQgQrAsg+iUsUezHGjLzxs=
X-Gm-Gg: AYBFou31D+BfTIDECgSRhm7/gZnZ3vQ9N/BmSfO+vCLMGqm9QiA5HLxY4HaRPaFpYNq
	fijUWxvtW4Nj/Rn3BVknr7rHVzKjLqggMuwr1a4Ck8CYVmVqqEZDwzLm8Agy4Um8+594nv+4wR7
	Jsm+JoQWjvF0HDE6MCR0TR5NPHh1+bjqu397xYC9gyhHPgt0ftr+4fn49jMqwX+RXweqyXaGbL6
	WyS7w1M2gwnZNgErLI8NDux8eqsrotSEhGABrqt2zWWYh3ApdGnn2GAycmdT3/lvSZ+rz9LsNyJ
	/GcWkdZyrX5pRAkMSi9JK/33yB2OHCcui5VY2whXilskkxu/9cFC8BIkCQyPpX8+g81VhW9S+Al
	Vx3OzvkvrnIEg9x8FQLyt11zgan+enbgXzHNsuPOHLNndI4JH8vI++Q+RcSJPthRKw/7AFxIrw6
	0ZZ5AYGQ==
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr14054666c88.32.1794893325849;
        Mon, 16 Nov 2026 21:28:45 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b3:bdd9:cc6d with SMTP id a92af1059eb24-1b503121791mr14054635c88.32.1794893325242;
        Mon, 16 Nov 2026 21:28:45 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm37476107c88.6.2026.11.16.21.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:28:44 -0800 (PST)
Message-ID: <0a4efa52-f05a-cbf2-52da-6835343efc4d@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:58:34 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 5/5] iommu/of: Add support for "iommu-ranges" on a
 device node
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-5-5c0f72083e52@oss.qualcomm.com>
 <68bb5fe0-9005-4517-aec0-c39021a5b24f@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <68bb5fe0-9005-4517-aec0-c39021a5b24f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMSBTYWx0ZWRfXwGiFW9Bhzh9p
 aLdTzlECyAoW0tOBT9coF2cAw4NBdzQG61GnQ4bde1GcgYOP3kfbch44cpbzbMZWnRub5J9opTp
 aI/SWIILqeKetigupizjRaSIWfsb+lU=
X-Proofpoint-ORIG-GUID: bCf-f-oet1r3hVr8FsUOCeONn_uFmPbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMSBTYWx0ZWRfX9ZYwcaJc6bHG
 hA/uyMtsGUmKmxm0/mBK3ku9/uVMMKrlZ54o1GyABmMPfrvtSEMjZazoNuUtucEuRM/OFGbNnEV
 0it7sWiha93wPVEOklunwcWoEBejRCOX6H6nxxMIfGQytorxNOveOXrwkwnPuBSF98CSgsZoC+7
 ZLLzbd4/J/vTbSb55I8UpYvs1Ze5eTHIzCNbG2LD10Oq13Xe/Y9ZzLzUJ6lLNUkC6wKlKb56N0N
 DCqvUHnofSrH15NP4ISxREH8f5uSY/hMMOBkyLyVKRH3ZVJJFATitlciu/4+gOA8Fu0BGbEZpQx
 rsTwqGX98Vq4lUR9XuBmLALip4RyBLe5cbsGMSTFckXt/bvfjnIrdlRHBp9Mq3b/hH2/Kc9AXCp
 6QM5mEbJEhKTMGIxMOgKrotn1fziwwev+0EKUZrH1BIU8h8YvTvHI8t4C0dyoaVHYQeSFk6im6m
 D5TOrWsYNgFiLA8U9ZA==
X-Proofpoint-GUID: bCf-f-oet1r3hVr8FsUOCeONn_uFmPbE
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afbe60e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A3swKraddPjxjnE1leEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170021


On 11/13/2026 3:06 PM, Yijie Yang wrote:
>
>
> On 11/7/2026 1:14 AM, Vikash Garodia wrote:
>> Reserving an IOVA address using "iommu-addresses" requires it to be
>> placed in the reserved-memory node. But when "iommu-addresses" is the
>> only property being described and there is no backing "reg" (i.e. no
>> actual reserved system memory), it does not really belong under
>> /reserved-memory. A device IOVA range is specific to its own address
>> space, and does not describe the system physical memory to make it
>> qualify under reserved-memory. Given this, place "iommu-addresses"
>> inside reserved-memory only when it is paired with a "reg", otherwise,
>> define it within the device own node. It was discussed here:
>> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>
>> Existing "iommu-addresses" property expects a phandle, which does
>> not make sense when the property is defined within the device node.
>> "iommu-ranges" was introduced to specify the device specific IOVA ranges
>> when there is no backing "reg".
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/of_iommu.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 107 insertions(+)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index
>> 00b02c19f27e195fc36c4bc1d91253255147c9ab..e133d3b346feecac7e2bfaec44e4882060ee89ec
>> 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -183,6 +183,111 @@ iommu_resv_region_get_type(struct device *dev,
>>       return IOMMU_RESV_RESERVED;
>>   }
>>   +/**
>> + * of_iommu_derive_resv_regions - derive reserved regions which
>> + *                                are outside of iommu-ranges
>> + * @dev: device for which to get reserved regions
>> + * @list: reserved region list
>> + *
>> + * A device can describe its own usable IOVA ranges directly on its node
>> + * via "iommu-ranges". Everything not under those ranges is derived
>> + * as a reserved region so the IOMMU allocator won't use it. Entries may
>> + * appear in any order in the property.
>> + */
>> +static void of_iommu_derive_resv_regions(struct device *dev, struct
>> list_head *list)
>> +{
>> +    struct of_iommu_range {
>> +        struct list_head node;
>> +        phys_addr_t start;
>> +        phys_addr_t end;
>> +    } *pos, *new, *next_range;
>> +    int size, prot = IOMMU_READ | IOMMU_WRITE;
>> +    struct iommu_resv_region *region;
>> +    const __be32 *maps, *end;
>> +    struct list_head *prev;
>> +    phys_addr_t next = 0;
>> +    LIST_HEAD(ranges);
>> +
>> +    maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>> +    if (!maps)
>> +        return;
>> +
>> +    end = maps + size / sizeof(__be32);
>> +
>> +    while (maps < end) {
>> +        phys_addr_t iova, iova_end;
>> +        resource_size_t length;
>> +
>> +        maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
>> +        if (!maps) {
>> +            dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
>> +                dev->of_node);
>> +            goto exit;
>> +        }
>> +
>> +        if (!length)
>> +            continue;
>> +
>> +        iova_end = iova + length - 1;
>> +
>> +        if (iova_end < iova) {
>> +            dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
>> +                dev->of_node);
>> +            goto exit;
>> +        }
>> +
>> +        prev = &ranges;
>> +        list_for_each_entry(pos, &ranges, node) {
>> +            if (pos->start > iova)
>> +                break;
>> +            prev = &pos->node;
>> +        }
>> +
>> +        new = kmalloc_obj(*new);
>> +        if (!new)
>> +            goto exit;
>> +
>> +        new->start = iova;
>> +        new->end = iova_end;
>> +        list_add(&new->node, prev);
>> +    }
>> +
>> +    if (list_empty(&ranges))
>> +        return;
>> +
>> +    if (of_dma_is_coherent(dev->of_node))
>> +        prot |= IOMMU_CACHE;
>> +
>> +    list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +        if (pos->start > next) {
>> +            region = iommu_alloc_resv_region(next, pos->start - next, prot,
>> +                             IOMMU_RESV_RESERVED, GFP_KERNEL);
>> +            if (region)
>> +                list_add_tail(&region->list, list);
>
> Why keep looping here after allocation failure?

This matches the existing "iommu-addresses" handling. We continue after an
allocation failure since later allocations may still succeed, preserving as
many DT-specified restrictions as possible.

>
>> +        }
>> +
>> +        if (pos->end >= PHYS_ADDR_MAX - 1)
>> +            goto exit;
>> +
>> +        if (pos->end >= next)
>> +            next = pos->end + 1;
>> +
>> +        list_del(&pos->node);
>> +        kfree(pos);
>> +    }
>> +
>> +    region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next,
>> +                     prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
>> +    if (region)
>> +        list_add_tail(&region->list, list);
>> +
>> +exit:
>> +    list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +        list_del(&pos->node);
>> +        kfree(pos);
>> +    }
>> +}
>> +
>>   /**
>>    * of_iommu_get_resv_regions - reserved region driver helper for device tree
>>    * @dev: device for which to get reserved regions
>> @@ -262,5 +367,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct
>> list_head *list)
>>               }
>>           }
>>       }
>> +
>> +    of_iommu_derive_resv_regions(dev, list);
>>   }
>>   EXPORT_SYMBOL(of_iommu_get_resv_regions);
>>
>
