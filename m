Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4BA2F7F0F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221815; cv=none; b=QPtug2K+tGxWiMTUXP9TFFzAWMqngeyisnuoSq5a+jJUTPdT9A7kYNQsZvFSXnlrVzIFmM5lZx4HG4a88rAIKGmXSoXiCkTHA8QAWL3uzIhGCRlfytRw3MTtEH99mTQEkg49ufjpEgG0HOvRYaG/B9GtZrhMSbsOt3Brxc9yjT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221815; c=relaxed/simple;
	bh=IclmeQ+f6hVncC1gnnUPeH7x7ixP12JNCKW7s2vqjZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2GZm+dcE+r64S8r70KqulsJhvh7oZNHIeTJl/0R1pVNTe7z4pQYvk/sJPBdt7Anwo2eeQiUUBB9OFblJiKGKLFNQiChj2smbs8WDJveJ07hE/s/KH2cPGhf1VmfUPzCAauNTWzz8FS4KNjfpAWq8vFg7SZnSr8px5cpXYIivAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bep1AWtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jyo02Dl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bep1AWtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jyo02Dl8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIXmKA172359
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 00:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdcjjIeT2oCUvAqtxFqM1NFtN4OHETkY5T0wT3PbocY=; b=bep1AWtIDp+tCmJj
	ulnJDQWcVw4KZCHCdIR0+WeTW42R387mWPyaCOPLKVYi9zSW3k3aVFNDF3WVWgtY
	//U/K/yDUESUcHJ6Ms31H1Zto+pB6Bdlzuce7QgVRLJvHzqUvgFrGoTAzZJMCGoX
	T6QaXMgyBJKZ+2Z0oLeNh1+A+VzZn9d6hTulxM1n6z/IqyZGDd9362BiJLmj58B5
	m1P72Xth8+hGAA0+pYWDBQLMP+76cAtiy9zUqRGygGkC5aZnUYofrZDZogA/Ffwl
	+fR1Fdzj2gJZHVyFipbtV2ydxeXQDJK81L082Q8AcT62KAvn3xxqz+KicpivShdG
	UGa3KA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dt2fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:16:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2539480a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788221811; x=1788826611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdcjjIeT2oCUvAqtxFqM1NFtN4OHETkY5T0wT3PbocY=;
        b=Jyo02Dl8SssozAKUPy7YdF9reufcFcSNQJb8EFOIHUw5YmDXZCzXf3yS9MqDDoV+Dh
         mbLFobhvyrySXIFq+X68+ETx2cWet17Ay+SASkUJWrcVLeItcpar1eqnsEgvEnxYuwsR
         +xZAt9Z0qalXbWucmGdX/Ay80LHerkTLebiTkroaWMkv6CaWSlG+lFRCUoIGBkfuHqQe
         MeoNeQvnZNXvJok+MDBLaGQsGgGEML1diY8UDzR801auEtmyYiqtbq66vem0tvjTrHK8
         nErye9pjIjNeW4Q47mtcfuAqFNKK4KQADjJvKgqGN4JIpLD0+XIwySyLvyU8xjq+at1x
         lfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788221811; x=1788826611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdcjjIeT2oCUvAqtxFqM1NFtN4OHETkY5T0wT3PbocY=;
        b=Zc93RhddDxhgR5bdG72/CiUfqtY3GKDlKtq1VACLegiHKmfBFmK7sJ4iSEkvdRkxA1
         IJI3ngF6ZlPrOs5AvGT00sL7YwsNUZJ92V78gwazf3Pa8r5mNAd0b+HvgnxtZR34kIv+
         aKTrfnpxw/lsFTlMsr6ZCS39BYTwH3Y/albSd4uDjY5Ip36ibRUQFNlI3ycqiNc+kFZj
         Y7i+QkHb6pldRVHjIN3j+mdg/4l+DyyCbbzO+XuJ4GfXJ9gOFXV4RG2Rr+bddnSmGqSz
         /vo8uB7Ye+/jJr7lh8zKVOizYdYfRVRDjihOT2redD4cN9bI2Oo4d4fe0CqxfOF/+Gz4
         KS1w==
X-Forwarded-Encrypted: i=1; AKwUvBxkoNoKmKwbfUQwABb+71KZ4q1+xMzNU53KwTKPJrpOEe1Wax16qkS7vecsBz9Lu/OqlsmQqqDeaDSvSqM=@vger.kernel.org
X-Gm-Message-State: AFuF++mFrfO4acsczk9sFXdwskvpNBXSQ79us7xtg/X2VWG8MkSZjwC0
	/LOpQNf2JQ0U4GtTYEiouJIbj1k5TNjbMC+BDpcczPRAJ0fVNDQ5wqZIOqndp7PdyQzNnyRa8f8
	RxxZfFvfYGglbf9NPyipr1LxNlCb1+f3IviXiNWUWEqtEJmpWou8xkogDrjUSSVp9M08=
X-Gm-Gg: AYBFou3oGdBD/PsKrIuIjLrd/ABuoIUDSnNvU4+Pzcnj/Gspjq1xqlkRzFPhFlQZKy7
	MUbgXTiABsBE4HKipXCy4fbc0lhtpAvgY6eth02J9rrhc84cLyALP8MizKyzlXGbqezj3KKFEHi
	arx1dNe7kKPzHl86oZJruj2wT3vFIEqq/7iUl8ju+S9ylIN8WiIdoWRWqq2zJ4wBPfck+AIoV7s
	nLcXnNi9xpfpqIFbSMpea0K/rP1KPrYEQjDIEKmERuge1NVRKK4RDt3sY0n+8Jn3bU1lbQLuBNW
	dusQlh/E+j8Ai4JKlPhKYV9gBfeAm8gyGMtkBx2obqOBk8M6r0Xh7N/6vHiCkJrfB6Wgu2qjyqq
	Z8TNJNdLUtt7nEqW4f0Hua5IFtwCtB4Celij7izFKo3ZMnbw=
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr31940047a91.19.1788221811226;
        Mon, 31 Aug 2026 17:16:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4b:b0:398:9beb:5c18 with SMTP id 98e67ed59e1d1-3989beb635dmr31939979a91.19.1788221810681;
        Mon, 31 Aug 2026 17:16:50 -0700 (PDT)
Received: from [10.73.194.28] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d4b336sm32407209c88.8.2026.08.31.17.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 17:16:49 -0700 (PDT)
Message-ID: <0deb246b-0387-4921-b875-9477d73cdeed@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 17:16:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
 <c3f69010-4263-4d71-bdfd-62f21989b639@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <c3f69010-4263-4d71-bdfd-62f21989b639@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a961974 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=-oZYn3fwYyhup3hfDacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAwMSBTYWx0ZWRfX2Q4b+ogRpWAu
 QIIe4cl3ri9EniyLfP5xys9azxhdWr04oQU6mptCwzM3rP/SF9Q/EwAC/USTcEMqdzHfaa6P/s2
 /Guklq7Z6vC1PCH9jqdGxyZ9J/UeUW/tkGRTvO6cjtNIPp1DoQmdCYPMWHsbgrLg3dzC9x8M1Ro
 3ElWcx+kAlYq5ZgkXLxVCPXFhlbUNe7ukh/2gpJoUAX9hENkXP9PCZq9HEZSYlAwg8z3C+nURN9
 2wm5apFOpRaBssOyYUhEgaBkyvdOxD5NZ+SffydQQ7Ucy2wlqeJZNKatsP7yORjB/LlKbD2Pit7
 ow1SbcZoHqVFmF/Y5rX/CvURhQEHQ6UOhZDhEzbG+xMmYSrqLhsVZ8x6ehIZjF2yxGlwrM+Px7a
 8mLxJyQ41zC1J+0RyEQCuy5Yc9tI90OGTxuVmP6OUhpfxio+0uesY38E7APL2foUb4+qkuRPNe4
 Cr4jZSEOhP25nCmzJ1w==
X-Proofpoint-GUID: GXlc2U5bODA1xqXZPUrquDPF75SWrLt5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAwMSBTYWx0ZWRfX2weKzNwR+UCT
 o30vTpURx0M/EEMW89+RDRc5lyzex0JYH+OlblAfLnI5d5M4GOLBmQVgGMfLnebiHi95xz5+yy1
 PMGTFnk6mAE6pqWiF+LchnK2Ob+5dI0=
X-Proofpoint-ORIG-GUID: GXlc2U5bODA1xqXZPUrquDPF75SWrLt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010001



On 8/31/2026 6:04 AM, Mathias Nyman wrote:
> On 8/29/26 00:37, Wesley Cheng wrote:
>> On some environments, 16kB pages can be enabled from the Linux subsystem,
>> which manages the IOMMU mappings for the audio DSP within the system.  In
>> the current design, the following assumptions break when 16k pages are
>> utilized:
>>    1. xHCI ring size is equal to PAGE_SIZE
>>    2. Ring addresses start at the beginning of a page
>>
>> When the USB offload driver maps the rings (w/ the audio DSP SID), it is
>> set with a 16k granular, which is a problem, as several xHCI rings could
>> exist on the same page.  This is because the rings are currently allocated
>> from the segment_pool.  Hence, potentially mapping non USB audio related
>> rings into the region accessible by the audio DSP.
>>
>> To mitigate this, this series introduces a separate segment_pool
>> associated to each sideband instance.  Before the USB audio offload path
>> is enabled, the USB audio data streams/endpoint are not active.  Only when
>> the class driver issues a usb_set_interface() call (done from
>> snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
>> resources.  Which pool is selected is all based on if the sideband path
>> is being enabled, and if so, memory can be allocated from that pool,
>> which expects to be owned in conjunction with the audio DSP.  This
>> concept allows to keep the same model existing in xHCI, where multiple
>> 4k segments can reside on the same page, which reduces potentially over
>> allocating based on the page size.
>>
>> Likewise this mechanism also allows for the offload client driver to
>> determine which SID is associated to the segment_pool if it decides to
>> map outside of the Linux subsystem.  The new ring allocation flow for
>> sideband/offload clients will be as follows:
>>
>> qc_usb_audio_offload_probe()
>>    ├─ segment_pool = dma_pool_create(...)
>>    ▼
>> xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool, 
>> notify_client)
>>    │  sb->segment_pool = segment_pool
>>    ▼
>> uadev[card_num].sb = sb
>>
>> handle_uaudio_stream_req()
>>    ▼
>> enable_audio_stream(subs, ..., pcm_card_num)
>>    ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
>>    ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; sb- 
>> >eps[ep_index] = ep
>>    ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
>>    ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ 
>> xhci_check_bandwidth()
>>    │                                                 ▼
>>    │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
>>    │            pool = sideband ? sideband->segment_pool : xhci- 
>> >segment_pool
>>    │            new_ring = xhci_ring_alloc_from_pool(..., pool, ...)
>>    │            ▼
>>    │            xhci_ring_alloc_from_pool(..., pool, flags)
>>    │            ring->segment_pool = pool
>>    │            ▼
>>    │            xhci_alloc_segments_for_ring(xhci, ring, flags)
>>    │            xhci_segment_alloc(xhci, ring->segment_pool, max_packet, 
>> num, flags)
>>    │            ▼
>>    │            xhci_segment_alloc(xhci, pool, max_packet, num, flags)
>>    │            seg->trbs = dma_pool_zalloc(pool, flags, &dma)
>>    ▼
>> xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()
>>
>> qc_usb_audio_offload_disconnect() / unreg_xhci:
>>    ├─ segment_pool = sb->segment_pool
>>    ├─ xhci_sideband_unregister(sb)
>>    ▼
>>    dma_pool_destroy(segment_pool)
>>
>> Similar logic is added for the secondary interrupter path as well.  The USB
>> offload class driver calls xhci_sideband_create_interrupter(), which will
>> be responsible for allocating the secondary event ring.
> 
> The custom dma pool looks like a good solution.
> 
> I think we should tune this a bit and pass the custom pool pointer to
> xhci_sideband_add_endpoint() and xhci_sideband_create_interrupter() instead
> of xhci_sideband_register()
> 
> xhci.h:
> struct xhci_virt_ep {
>      ...
>      struct dma_pool    *priv_seg_pool;
> }
> 
> xhci-mem.c:
> xhci_endpoint_init()
> {
>      struct dma_pool *pool;
>      struct xhci_virt_ep *ep;
>      ...
> 
>      ep = &virt_dev->eps[ep_index]
> 
>      /* use ep->priv_seg_pool if set by sideband or .add_endpoint wrapper */
>      if (ep->priv_seg_pool)
>          pool = ep->priv_seg_pool;
>      else
>          pool = xhci->segment_pool;
> 
>      xhci_ring_alloc_from_pool(..., pool);}
> 
> xhci-sideband.c:
> 
> xhci_sideband_add_endpoint(..., struct dma_pool *pool)
> {
>      ...
>      if (pool)
>          ep->priv_seg_pool = pool;
> }
> 
> This allows finer granularity in selecting dma pools for endpoints.
> 
> It also keeps the xhci "core" sideband agnostic, avoids including xhci- 
> sideband.h
> in xhci-mem.c
> 
> It also helps possible vtio support so it can set its own ep->priv_seg_pool 
> in a
> possible .add_endpint wrapper.
> 

Hi Mathias,

Makes sense.  I made the switch to adding it into the add_endpoint path and 
its cleaner.  I'll wait for a little bit for more reviews before submitting 
the next revision.

Thanks
Wesley Cheng

