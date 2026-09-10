Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03502ED141
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000678; cv=none; b=oFUrPnFzlnj/PsCECeH328za3b3HgFHGeLY4SdIPrnBTTkypfArCRmpiKgriMga0tw4UESl0XaOxgV9PPJeUaVV5GRs4a9ajRkDsuIuuEl3+ZLg7myf7ZMfgVGQ43CuhkxyGL0tuWbfPKxBQk60jV9lJClVLeQpaP1BeS5PKA+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000678; c=relaxed/simple;
	bh=g6+lDSV7c/I/rpsXtbTpMhV094bJUKl2aNgFcsm5eGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptdiLJsBcUShKtY+4zo0x23H7ymsh0C45NbDNwFJP3vcny6dXbt3t+gsTKMwgaGRZf7DwfYOFyAdDBRMvWHOx5wINsGWG6ItqtTD8FRRjFUEm98ROI1QDL0a0rvUapTAWvF9BaMXXHsuT0IjLo4FrwqgzbwgjCIWXGF+RFDbmYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+JMcqvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1Ak95Pn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+JMcqvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1Ak95Pn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9VUP3215722
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYeNAGKJAILkQCJR+LXDROeSFwDZiD2F1WFQZUQ2A3Y=; b=m+JMcqvdzVMtd7qT
	zANkRxcnMk+bcn9FhoMvgrMW+o6VNb9yWEind83+aKQHXYY6m09Ah3AE70gt56br
	I4wpWnbfnvW2wiA0y2kkmbab+zO89Le+HPuvoUCZQIyLU488QL/NafAWQmCzQsCX
	AD4y1Zy2yisScDMcSQNU2pgNjvx7MGPJMbps1f7cviLeVEGW8XHXi/1lwZSqzfvl
	Ghc1HJXUWW/blofU/RvGhYh7/1o5ECyaY0buD7G/QSNJugBUpw8mIW5dIFoOzOgm
	jJm7l/AH7PYbbproyP/fT8s6suD/LItJeVJThD7gWjwlf8MrqKClNx88KtjEV4ok
	5yu/NA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd17uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:37:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso9400483a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789000674; x=1789605474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYeNAGKJAILkQCJR+LXDROeSFwDZiD2F1WFQZUQ2A3Y=;
        b=B1Ak95PniSaITIijcear0N/BY33ra8eLfnWEB9U8PAK1E43voqeZJ/Cc0EhgjUEfwY
         g1lxqcevYYeQkF9pRFifd2Aep7YB7Cm2/f5Lhbped5Hkzob1UaLbGJT3ziPhkIAvqvKr
         dPCceGXBuCHjr4xf9RD6i7l4ZrJPzVUQuFUYsa8brkR9SX/+8roE5KDKPJevT5cJ6bO1
         dWXJhz/Y/vWhCTHA2syK+w792VwVYM4k5jtDcs9P9U9/j3RCbFcAYQEFYvb0dKD1A1b1
         +R9ms4cUnLzNl9xuj7IswjMxc8afCAZmshmmfx43TgeSoJ7/t6qqIQDBZafIF6B29o/7
         wxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789000674; x=1789605474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYeNAGKJAILkQCJR+LXDROeSFwDZiD2F1WFQZUQ2A3Y=;
        b=fBbo09FMn9I+iaA24WtNB434Ov7JcH1o0yfNmax/sRyfXMwME0jFQIpucIoO64FU95
         iNMNf9R+or7HPJyfFNI+wn7O57PuRn7AxVNPmRm0vzsl2oLVzVn639+YqabfeCiGNo6D
         xsaXo4k2/hoaoUe0DYU+kG+EFbwL9Rb0L+Ke7fru5rpN1YCCWiZp1YOM1P9bV6OHTbJv
         bLFqDX+g5InkG13sOIH3uFFiJCNjYyv5L8hl1IeogO5gCS2cV0ZHBITTyrIUSfF7hO1+
         88uTINEuStM0UUOLGKD1qlQWviSfd2KQG+HVhQdSqCLoZFL/OnE1Famen+WF9xr4ZU6e
         Y3Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzpnhmHPb+PxXD52HChSGimisjDjaWPQ7kX7Rqs09QAZ8xOI6ar4MHbVnXND0DjcF+x/0tYgZcE3tDTPDI=@vger.kernel.org
X-Gm-Message-State: AFuF++m7rlvvohdsciH21USEtDFO/oVuuf1anNEaOPC+6aFy6abv+/gQ
	UWAHdk0GOw9kh1cf1y5zCV42SOG7vE2Qjls6hUPD6W3sI4lyvRM82qGK6ChMXd2xQnDmWjleSPx
	tKULccYR33XbkEKpv5eMhYvbCjcITpAjCJ2Yk9Y/TV0RfOgA1ZIHj7E4zFJ+rJ3Yh18k=
X-Gm-Gg: AYBFou1T7tY2rw0do20/owkRbqtjdTAjeW/9NVu+GNDZg9Rj7kAvuKEKXXRrSm7qCXL
	7jMfVnWg3zmPsAbpFRGNVtivxpHV/FhM4Lm81UUdFcBH17/2owNOlgi99ICrCIfDGpXSFfPr808
	9f6MB3KQLf4zR2SjzLGH9azX2dN0QeuIxElsnGtUncywV06H6repeAVCLTHIuoUfWXA324SED3V
	IS8ojmyj/A0Sc4oItEh0061jtMpu5wg9xS34oXK6t1xlSKFkXEvIOvjAtD+rIkZ6Zq74lKdo/77
	zrQSlg+OT4+ffgyo1OBrHoVI5fPb83Qzu50KVqiL1dXS7Qk5NCqbnsGq3Er7oyAO8Dc2PJ0hON9
	grJ0RYMrwHQEXbSmwxNWvitDtfSxJ4pjh9IdnsHrRqNbb5ss=
X-Received: by 2002:a17:90b:1a88:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39b2619138bmr54635839a91.8.1789000674216;
        Wed, 09 Sep 2026 17:37:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1a88:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39b2619138bmr54635742a91.8.1789000673530;
        Wed, 09 Sep 2026 17:37:53 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm74760649eec.15.2026.09.09.17.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 17:37:52 -0700 (PDT)
Message-ID: <0b323a5d-6d49-4309-8b23-4ffb1e0c4f0b@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:37:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
 <20260903-16k_offload_v1_b4-v3-2-135928dc2408@oss.qualcomm.com>
 <3e8baa09-2ecf-413b-9ced-73479add6f8b@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <3e8baa09-2ecf-413b-9ced-73479add6f8b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: p0WTNVSoEdtrkFD2CaBGy97PJXmK2rNU
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa1fbe3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r2LSxhclMoEJzFSgZ9EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: p0WTNVSoEdtrkFD2CaBGy97PJXmK2rNU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwNSBTYWx0ZWRfX5nk4xUF2+03P
 xy09B6S19RtvQoOmekQTNV+idHRzqEIguQAtneMZ2WI7tMCoZJZZUNoA//xlxf3UswEoBnlb5qv
 dtXGywRKM9q8XflhyJ88fK+6CA5g0BE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwNSBTYWx0ZWRfX2mmxR5op2aY3
 18seCIonPPZ/1GTTGv/OORGG4Yhdg2C6sk7Amiq/PAjEm3SH+EgbKzcJrk4d9zNhYdsnotNV9uW
 dtgw4JRVNHwvQ3Zzx3UFqfJwDKNRYwgbB/19wyAamOmZl58DpT8qTlq+FQSQiU/kBPvM4ZRb2jY
 LRobanSXvXrMvj7mqNiWiCdxPGk7YfsOXz7O+XZHy17cEQcKnLKDpFE5cNVwRTHtGjXxVQ69Cj2
 yCuwmPX4p2sEJ7TsU/ILlfzo3G1uKlFbL4pk2sCvmN0Hc9S5l/s2CW4MSQJeg9SkqnFl58doQ9p
 BT7jJgtIEtwc34syqOUV2pr0GdKplv1CaRziYVxpCMLjNM/c7X+TbCUXKMzlb/bmCvAPIZ/HSGA
 Lso6xd/gHHKqLq0VIeRhgwYmAujDipTXeEEIZgqPIpXLdIhLpf5V6sWop50CRW4DOmFrRXH/CLq
 Kf0kCxLNDCAtP2gngSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100005



On 9/9/2026 3:08 AM, Mathias Nyman wrote:
> On 9/4/26 09:57, Wesley Cheng wrote:
>> Ring segments are normally allocated from a shared DMA pool sized and
>> aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
>> larger PAGE_SIZE (e.g. 16K or 64K page arches), a segment can end up
>> at a non-page-aligned offset within its enclosing CPU page, and
>> multiple segments can share the same physical page.
>>
>> A sideband client that maps a ring buffer directly via the IOMMU
>> (which operates at page granularity) needs to know exactly which
>> page(s) back the ring, and only pages that are actually intended to
>> be exposed to that client should ever be mapped this way.
>>
>> Allow each xhci_sideband endpoint to pass its own segment_pool, allocated
>> separately from the core xhci->segment_pool, so every segment backing
>> a sideband-tagged endpoint always comes from a page that is meant to
>> be visible by the entity handling the offloaded endpoints. Normal
>> (non-offloaded) endpoints are unaffected, as they keep allocating from
>> xhci->segment_pool.
>>
>> The offload client owns the pool's full lifetime, and since
>> that lifetime is no longer tied to the sideband instance itself,
>> xhci_sideband_unregister() must free any ring still backed by a
>> client-supplied pool before returning, rather than leaving it for xhci
>> to free later when the client and its pool may already be gone.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/usb/host/xhci-mem.c       | 63 ++++++++++++++++++++++++ 
>> +--------------
>>   drivers/usb/host/xhci-sideband.c  | 40 ++++++++++++++++++++++---
>>   drivers/usb/host/xhci.h           | 16 +++++-----
>>   include/linux/usb/xhci-sideband.h | 20 +++++++++++--
>>   sound/usb/qcom/qc_audio_offload.c | 21 +++++++++++--
>>   5 files changed, 121 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index 7a21ac81f9c8..a041a35fcd4f 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -28,6 +28,7 @@
>>    * "All components of all Command and Transfer TRBs shall be 
>> initialized to '0'"
>>    */
>>   static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
>> +                           struct dma_pool *pool,
>>                              unsigned int max_packet,
>>                              unsigned int num,
>>                              gfp_t flags)
>> @@ -40,7 +41,7 @@ static struct xhci_segment *xhci_segment_alloc(struct 
>> xhci_hcd *xhci,
>>       if (!seg)
>>           return NULL;
>> -    seg->trbs = dma_pool_zalloc(xhci->segment_pool, flags, &dma);
>> +    seg->trbs = dma_pool_zalloc(pool, flags, &dma);
>>       if (!seg->trbs) {
>>           kfree(seg);
>>           return NULL;
>> @@ -50,7 +51,7 @@ static struct xhci_segment *xhci_segment_alloc(struct 
>> xhci_hcd *xhci,
>>           seg->bounce_buf = kzalloc_node(max_packet, flags,
>>                       dev_to_node(dev));
>>           if (!seg->bounce_buf) {
>> -            dma_pool_free(xhci->segment_pool, seg->trbs, dma);
>> +            dma_pool_free(pool, seg->trbs, dma);
>>               kfree(seg);
>>               return NULL;
>>           }
>> @@ -62,10 +63,11 @@ static struct xhci_segment *xhci_segment_alloc(struct 
>> xhci_hcd *xhci,
>>       return seg;
>>   }
>> -static void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment 
>> *seg)
>> +static void xhci_segment_free(struct xhci_hcd *xhci, struct dma_pool *pool,
>> +                  struct xhci_segment *seg)
>>   {
>>       if (seg->trbs) {
>> -        dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
>> +        dma_pool_free(pool, seg->trbs, seg->dma);
>>           seg->trbs = NULL;
>>       }
>>       kfree(seg->bounce_buf);
>> @@ -81,7 +83,7 @@ static void xhci_ring_segments_free(struct xhci_hcd 
>> *xhci, struct xhci_ring *rin
>>       while (seg) {
>>           next = seg->next;
>> -        xhci_segment_free(xhci, seg);
>> +        xhci_segment_free(xhci, ring->segment_pool, seg);
>>           seg = next;
>>       }
>>   }
>> @@ -334,7 +336,7 @@ static int xhci_alloc_segments_for_ring(struct 
>> xhci_hcd *xhci, struct xhci_ring
>>       struct xhci_segment *prev;
>>       unsigned int num = 0;
>> -    prev = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
>> +    prev = xhci_segment_alloc(xhci, ring->segment_pool, ring- 
>> >bounce_buf_len, num, flags);
>>       if (!prev)
>>           return -ENOMEM;
>>       num++;
>> @@ -343,7 +345,8 @@ static int xhci_alloc_segments_for_ring(struct 
>> xhci_hcd *xhci, struct xhci_ring
>>       while (num < ring->num_segs) {
>>           struct xhci_segment    *next;
>> -        next = xhci_segment_alloc(xhci, ring->bounce_buf_len, num, flags);
>> +        next = xhci_segment_alloc(xhci, ring->segment_pool, ring- 
>> >bounce_buf_len,
>> +                      num, flags);
>>           if (!next)
>>               goto free_segments;
>> @@ -362,15 +365,10 @@ static int xhci_alloc_segments_for_ring(struct 
>> xhci_hcd *xhci, struct xhci_ring
>>       return -ENOMEM;
>>   }
>> -/*
>> - * Create a new ring with zero or more segments.
>> - *
>> - * Link each segment together into a ring.
>> - * Set the end flag and the cycle toggle bit on the last segment.
>> - * See section 4.9.1 and figures 15 and 16.
>> - */
>> -struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int 
>> num_segs,
>> -                  enum xhci_ring_type type, unsigned int max_packet, 
>> gfp_t flags)
>> +static struct xhci_ring *
>> +xhci_ring_alloc_from_pool(struct xhci_hcd *xhci, unsigned int num_segs,
>> +              enum xhci_ring_type type, unsigned int max_packet,
>> +              struct dma_pool *pool, gfp_t flags)
>>   {
>>       struct xhci_ring    *ring;
>>       int ret;
>> @@ -382,6 +380,7 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd 
>> *xhci, unsigned int num_segs,
>>       ring->num_segs = num_segs;
>>       ring->bounce_buf_len = max_packet;
>> +    ring->segment_pool = pool;
>>       INIT_LIST_HEAD(&ring->td_list);
>>       ring->type = type;
>>       if (num_segs == 0)
>> @@ -398,6 +397,20 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd 
>> *xhci, unsigned int num_segs,
>>       return NULL;
>>   }
>> +/*
>> + * Create a new ring with zero or more segments.
>> + *
>> + * Link each segment together into a ring.
>> + * Set the end flag and the cycle toggle bit on the last segment.
>> + * See section 4.9.1 and figures 15 and 16.
>> + */
>> +struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci, unsigned int 
>> num_segs,
>> +                  enum xhci_ring_type type, unsigned int max_packet, 
>> gfp_t flags)
>> +{
>> +    return xhci_ring_alloc_from_pool(xhci, num_segs, type, max_packet,
>> +                     xhci->segment_pool, flags);
>> +}
>> +
>>   void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
>>           struct xhci_virt_device *virt_dev,
>>           unsigned int ep_index)
>> @@ -422,6 +435,7 @@ int xhci_ring_expansion(struct xhci_hcd *xhci, struct 
>> xhci_ring *ring,
>>       new_ring.num_segs = num_new_segs;
>>       new_ring.bounce_buf_len = ring->bounce_buf_len;
>>       new_ring.type = ring->type;
>> +    new_ring.segment_pool = ring->segment_pool;
>>       ret = xhci_alloc_segments_for_ring(xhci, &new_ring, flags);
>>       if (ret)
>>           return -ENOMEM;
>> @@ -1424,6 +1438,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>>       unsigned int mult;
>>       unsigned int avg_trb_len;
>>       unsigned int err_count = 0;
>> +    struct dma_pool *pool;
>>       ep_index = xhci_get_endpoint_index(&ep->desc);
>>       ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
>> @@ -1487,8 +1502,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>>           avg_trb_len = 8;
>>       /* Set up the endpoint ring */
>> +    pool = virt_dev->eps[ep_index].priv_seg_pool ?
>> +           virt_dev->eps[ep_index].priv_seg_pool : xhci->segment_pool;
>>       virt_dev->eps[ep_index].new_ring =
>> -        xhci_ring_alloc(xhci, 2, ring_type, max_packet, mem_flags);
>> +        xhci_ring_alloc_from_pool(xhci, 2, ring_type, max_packet, pool, 
>> mem_flags);
>>       if (!virt_dev->eps[ep_index].new_ring)
>>           return -ENOMEM;
>> @@ -2291,7 +2308,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd 
>> *xhci, gfp_t flags)
>>   }
>>   static struct xhci_interrupter *
>> -xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t 
>> flags)
>> +xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs,
>> +               struct dma_pool *pool, gfp_t flags)
>>   {
>>       struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
>>       struct xhci_interrupter *ir;
>> @@ -2308,7 +2326,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, 
>> unsigned int segs, gfp_t flags)
>>       if (!ir)
>>           return NULL;
>> -    ir->event_ring = xhci_ring_alloc(xhci, segs, TYPE_EVENT, 0, flags);
>> +    ir->event_ring = xhci_ring_alloc_from_pool(xhci, segs, TYPE_EVENT, 
>> 0, pool, flags);
>>       if (!ir->event_ring) {
>>           xhci_warn(xhci, "Failed to allocate interrupter event ring\n");
>>           kfree(ir);
>> @@ -2356,7 +2374,8 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, 
>> unsigned int intr_num)
>>   struct xhci_interrupter *
>>   xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
>> -                  u32 imod_interval, unsigned int intr_num)
>> +                  struct dma_pool *pool, u32 imod_interval,
>> +                  unsigned int intr_num)
>>   {
>>       struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>>       struct xhci_interrupter *ir;
>> @@ -2367,7 +2386,7 @@ xhci_create_secondary_interrupter(struct usb_hcd 
>> *hcd, unsigned int segs,
>>           intr_num >= xhci->max_interrupters)
>>           return NULL;
>> -    ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
>> +    ir = xhci_alloc_interrupter(xhci, segs, pool, GFP_KERNEL);
> 
> 
> Passing a custom dma pool to xhci_create_secondary_interrupters() shuld be 
> optional.
> Callers shoudn't need to be aware of the xhci->segment_pool, and pass it in 
> the default case.
> 

Makes sense, will fix this.

> Instead use the default xhci->segment_pool if caller passes NULL for pool.
> 
> 
>>       if (!ir)
>>           return NULL;
>> @@ -2498,7 +2517,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>>       if (!xhci->interrupters)
>>           goto fail;
>> -    xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, flags);
>> +    xhci->interrupters[0] = xhci_alloc_interrupter(xhci, 0, xhci- 
>> >segment_pool, flags);
>>       if (!xhci->interrupters[0])
>>           goto fail;
> 
> I would split the patch here.
> 
> Do all xhci "core" code above in one patch, and the sideband changes in a 
> separate patch.
> Only sideband change needed in first patch would be passing NULL for pool when
> creating the secondary interrupter:
> 
>       sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
> -                           num_seg, imod_interval,
> -                           intr_num);
> +                           num_seg, NULL,
> +                           imod_interval, intr_num);
> 
Sounds good. Will split the patch accordingly.

Thanks
Wesley Cheng
