Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B331E84B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853318; cv=none; b=jBvvP2Ew50FpUorLZ3GRJueyGXQJkEJPb6tJdvX8TlvD1aL2bABu6RQiYBwaLUZtdH08fmZg5xoOPGSFaSdsyn6PbdQwipRR4JylF09PTIFPRdW0/+LTbS2z+YV8SPsZTcbpk8vme20izWKELLFz0n+g38Drgpc3ba4ChhpqQ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853318; c=relaxed/simple;
	bh=T51sSrC2+aGZv/FaYgOpNY8DM7nPbwtQV39AujpeD9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFC+/FCuTvKwOzIrPkfVZRaABFQ8HqTPRzwE8KmM0qgg/dKYzk/4t4ChCVk5dbkDzkrt5JLwOhHsBhr1X1IDcd8Vt0OdIywDd67oWnFj1HGOB7EAAs6OS1xT5UkCNvS3ErjXpDZMngBor+u22yiAnfdp7tu0pOcp1w0IXT4DbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Si/42grw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vc7as3zx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si/42grw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vc7as3zx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJN4m42211188
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cp5Ef+e7rBEWldVoW3/HRSQLcHaVcAAYD7ktVgwrJGY=; b=Si/42grwnamlFC1i
	nda/yZmfxe9zmpQY50ftWRjBVRyO9jzP3pQm/s+bu90dFis5JtRcL+GtoL7xVwOJ
	JFIA1hS+Q8KWqYqYEAj8JXN37ffKZqGM0oKsvg5pbW95Ldxd40w9knOLSlmepiPl
	lLoRGwCPE7w3PI8iv99EmozHqfR8MP7l6w31Jdrm8Hs2PCmTHW10sAzionIG/t34
	6g2ql9y8ANuAmGzr0uHrr6z46eQWkXpOAOACubxECeB6jrdsbpbh0kcbSupXQnaq
	9voVHf8ED7r/7Wl5jMaI1DydH2e6E8S2OQ8w8clKzOYLNP3UtAWVwpNambcg9bmr
	a82IIQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aespgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:01:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4927123eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791853314; x=1792458114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cp5Ef+e7rBEWldVoW3/HRSQLcHaVcAAYD7ktVgwrJGY=;
        b=Vc7as3zxQcW3nUpHPlIgblolGueFKlsuIY1ArdNEUnSKdkmCOmG6ZieXP9ZpD9IWfV
         jO+9F8tE9i6Xnaf0baWa3+EgyA//cXja0umUX9V1Yim/DRZhDCQxNqdjj2XehUnd7Ag1
         hy+KnuRPu9c1IM9y0dqNZa2PNGhjySQd8KvKrC+FCgKRlfOjslgmrb1dg9L2FYXFHsnW
         z9VveQFSxSn1LekUQEXrNHo7mN7P2Wg7I9wGN/e2GfCEfAx0zzVeDXQ5PdjfKjdtwKqx
         4aUJfVdUUwGU+OHNh4lRTaqBVWcLfMtYvoreVrcfsPltVw+cSjKtQHeRdMNmEUxF0+oE
         vwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853314; x=1792458114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp5Ef+e7rBEWldVoW3/HRSQLcHaVcAAYD7ktVgwrJGY=;
        b=Vkp7u16IwIBR2SVoM8XH+pUyrgemAHBc62BB8no+2twPCgL4Kv4kusQp6t+0qyTws5
         pc6Bnm0klzJ973LqSFqFD0COwG3xC4OXKejZm5hexpbgYI973LISw1ymUQFbTVDcOJ7h
         qnR/MgzQfBnwQIJI1RNv5gxG9O/jyicBCh4K46ojtNp4tib0H7vZz2MoZtjSYlvaJ3sZ
         CG1rEbO4EeLxgZBBx1ncfFpoOIollTgStgmeUDWTUQB9MA3muJP7cQ719w5/lajY57M/
         Rso4PcOU7D5Wllk6uOrKrW2YvzSNxna8HedmgqOswAXSKrKFQXxL1/h/QwrpllknIoyH
         oyNw==
X-Forwarded-Encrypted: i=1; AKwUvBxSWdz223yOCQQsMDW23XJxI1YR5MbQZAePqwNXr3dV/3xUghLLZUf+lOhLHN3Ix2j+UMedlYs6d85++DE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDXnFBrbqtygFsz13/ghaZ1DEkzDQurlqqZULc3H99XM8RDWwr
	VQqbzatIk8cYlR08MGWxWQDTxQgK0e3sWcfuUFnhjBbqvwjHnKWamYGoxtwnnQDKFzEst5jKdK3
	C45MP5p//x++NYLaolCr+RFfBWfFxhJVcYSOSB6AjNOWikFKC5bcgyx0LVnhtvu2LI/Y=
X-Gm-Gg: AYBFou06s5iQnUuzL9TmVRUBeE+5btrWNhpQKXGnUS5etEfgV0ksn3zbIzffMP6ddiK
	hwSP9A7hWcnr4kVZcpcYne7lnin5t3OL6T6yuEshUyKej2l1xyf5dabytagbucciKbxVKiexz8O
	MlScHuxMO7UnrabGqFT6QMUymPwwle62DgACqe/vVzgM6M6BHM+IiSieOR/rClP3RJkhNF/xENH
	DVQmIUUra33kNcpDs4ta4siSYtBZruRxvPyhDCacNWzXjQBeoK4oCI8aG60A0UwVSlol5O6M/Qp
	FmnRoz2LgEc4I+XRkiAFkVU02rDSfvyjKsluKziddZ52rHj3nlTPDSVbHFUuFiGmtOSyWsQx3oz
	yVTk01Qc2zGX43XhmYZmRfC+Z/i4T1JxYPkaiBnidwlFVTg==
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2189329eec.11.1791853313222;
        Mon, 12 Oct 2026 18:01:53 -0700 (PDT)
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2189273eec.11.1791853312252;
        Mon, 12 Oct 2026 18:01:52 -0700 (PDT)
Received: from [10.73.199.44] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm18138781eec.19.2026.10.12.18.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 18:01:51 -0700 (PDT)
Message-ID: <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:01:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
 <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: suGrlTZFpaGhCfc6SHBL3wSElaLObSJb
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acd8302 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oTj6FXtJ5MmInLk1MKwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwMyBTYWx0ZWRfXzDzcHZVBKDbJ
 Ur2xf1O3ectN6qOQT9DaynmvK65HNgv3+dE8Y8P+Gfim5P1YOrxeS6dsMVzMsfg1oL/JowqZewZ
 QKj1bSnwi64saLn1Rcc9+EWmsEyvtcg=
X-Proofpoint-ORIG-GUID: suGrlTZFpaGhCfc6SHBL3wSElaLObSJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwMyBTYWx0ZWRfX5QCAGrczNOpP
 gqrD22y0NiX9eLH1l9o/gEFsKyeKydeSVN6cxkadIncFe92KN6UqqI9jcSV94Lcqv3GjyusbN1n
 4uX+v6aS/1HZN/py6lYnAoaa68g5Td4gJAmhktN/eLzmyQykZGThHCXPn+nyQMkRA0h4ea6Mblx
 zgCCnePvtG4rRqYBhgWZ32xnCKEnnoENCckszvH4FiHNlz85Iy1bZliut1TeNtDAvOzoCgfUeCs
 zU4R1N3mR3bZYRpEfQJLcBNcD2RnjQ32CN9IDlQeJJ3h9nW10r82jYYf2bRiNXgY4DTBqUZHHnQ
 0qasHA5CY0RtGDigA5+O02TglR1R1Rh7BFeHmf4QbhbC5AGIySmxZAl0WVSv8eCuTZ1HrnGIMjc
 ikMih7mzbnPzbgM+vN8S1JvjXB+jQwPAT14BTDFfqPRUezPw4y8ubv/9A924bhSpl+vgxS/EZbA
 7GRPbKRNSXFFfDl6Tjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130003



On 10/5/2026 4:03 AM, Mathias Nyman wrote:
> On 9/10/26 04:50, Wesley Cheng wrote:
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
> 
> xhci is the one allocating the ring when adding an endpoint, and telling
> xHC hardware to write to that ring. It seems more approriate that xhci should
> be the one freeing the ring after it told xHC hardware to drop the endpoint,
> and there no longer is a risk on hardware accessing it.
> 

Hi Mathias,

Sorry for the late response.  Was out last week.

Specifically in the disconnect path (while audio offload is active), when 
we utilize the usb_set_interface() path, it'll return early due to the 
iface->unregistering check.  This would lead to the drop_endpoint not to be 
called, and rely on the xhci_free_dev() to handle the transfer ring 
cleanup.  This wouldn't work in the offload situation, because 
qc_audio_offload is the only entity managing the DMA pool, and that would 
be freed during the .disconnect callback, which happens BEFORE xhci_free_dev().

Would you be more inclined to prefer a solution where we can defer the DMA 
pool free'ing to the xHCI core during xhci_free_dev, or maybe adding 
another sideband notifier (sb->notify_client) enum to tell the client 
driver that it can release the pool?

> usb audio (class) driver controls both when and endpoint is added or dropped
> by setting configurations and interfaces, and also the one registering and
> unregistering sideband, and adding and removing endpoint to/from sideband use.
> 
> I think usb audio driver should ensure endpoints are dropped before 
> unregistering
> sideband.
> 
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/usb/host/xhci-sideband.c  | 38 ++++++++++++++++++++++++++++++++ 
>> +++---
>>   drivers/usb/host/xhci.h           | 10 +++-------
>>   include/linux/usb/xhci-sideband.h | 20 +++++++++++++++++---
>>   sound/usb/qcom/qc_audio_offload.c | 32 ++++++++++++++++++++++++++++----
>>   4 files changed, 83 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci- 
>> sideband.c
>> index 274da38f333d..1bb6e5034b58 100644
>> --- a/drivers/usb/host/xhci-sideband.c
>> +++ b/drivers/usb/host/xhci-sideband.c
>> @@ -9,6 +9,7 @@
>>    */
>>   #include <linux/usb/xhci-sideband.h>
>> +#include <linux/dmapool.h>
>>   #include "xhci.h"
>> @@ -67,6 +68,7 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband 
>> *sb, struct xhci_virt_ep *e
>>       xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
>>       ep->sideband = NULL;
>> +    ep->priv_seg_pool = NULL;
>>       sb->eps[ep->ep_index] = NULL;
>>   }
>> @@ -113,6 +115,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
>>    * xhci_sideband_add_endpoint - add endpoint to sideband access list
>>    * @sb: sideband instance for this usb device
>>    * @host_ep: usb host endpoint
>> + * @pool: dma pool to allocate this endpoint's ring segments from, or NULL
>> + *        to leave the endpoint's current pool selection untouched
> 
> Add some comment about if pool is set then xhci_sideband_add_endpoint() needs
> to be called before setting configuration or interface that enables as
> allocated the endpoint.
> 
> Also add note that this is not suitable for ep0 as ring is allocated 
> immedialely
> when device is created.
> 

Will do.

> 
>>    *
>>    * Adds an endpoint to the list of sideband accessed endpoints for this 
>> usb
>>    * device.
>> @@ -123,7 +127,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
>>    */
>>   int
>>   xhci_sideband_add_endpoint(struct xhci_sideband *sb,
>> -               struct usb_host_endpoint *host_ep)
>> +               struct usb_host_endpoint *host_ep,
>> +               struct dma_pool *pool)
>>   {
>>       struct xhci_virt_ep *ep;
>>       unsigned int ep_index;
>> @@ -153,6 +158,9 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
>>       ep->sideband = sb;
>>       sb->eps[ep_index] = ep;
>> +    if (pool)
>> +        ep->priv_seg_pool = pool;
>> +
> 
> Fail here ring is already allocated from another pool:
> 
> if (pool) {
>      if (ep->ring && ep->ring->segment_pool != pool)
>          return -SOME_SUITABLE_ERROR;
>      ep->priv_seg_pool = pool
> }
> 

Got it.

> 
> 
> 
>>       return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
>> @@ -288,6 +296,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
>>    * xhci_sideband_create_interrupter - creates a new interrupter for 
>> this sideband
>>    * @sb: sideband instance for this usb device
>>    * @num_seg: number of event ring segments to allocate
>> + * @pool: dma pool to allocate the interrupter's event ring segments from
>>    * @ip_autoclear: IP autoclearing support such as MSI implemented
>>    *
>>    * Sets up a xhci interrupter that can be used for this sideband 
>> accessed usb
>> @@ -301,7 +310,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
>>    */
>>   int
>>   xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>> -                 bool ip_autoclear, u32 imod_interval, int intr_num)
>> +                 struct dma_pool *pool, bool ip_autoclear,
>> +                 u32 imod_interval, int intr_num)
>>   {
>>       if (!sb || !sb->xhci)
>>           return -ENODEV;
>> @@ -315,7 +325,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband 
>> *sb, int num_seg,
>>           return -EBUSY;
>>       sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
>> -                           num_seg, NULL,
>> +                           num_seg, pool,
>>                              imod_interval, intr_num);
>>       if (!sb->ir)
>>           return -ENOMEM;
>> @@ -370,6 +380,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
>>   /**
>>    * xhci_sideband_register - register a sideband for a usb device
>>    * @intf: usb interface associated with the sideband device
>> + * @type: xHCI sideband type
>> + * @notify_client: callback for xHCI sideband sequences
>>    *
>>    * Allows for clients to utilize XHCI interrupters and fetch transfer 
>> and event
>>    * ring parameters for executing data transfers.
>> @@ -436,6 +448,15 @@ EXPORT_SYMBOL_GPL(xhci_sideband_register);
>>    * After this the endpoint and interrupter event buffers should no longer
>>    * be accessed via sideband. The xhci driver can now take over handling
>>    * the buffers.
>> + * Any transfer ring allocated from a client supplied dma pool is freed 
>> here
>> + * as well, as the client is not expected to keep that pool alive any 
>> longer
>> + * than this call. This includes rings of endpoints already removed with
>> + * xhci_sideband_remove_endpoint(), which xhci would otherwise only free 
>> once
>> + * the device is reconfigured or torn down, i.e. after the client is gone.
>> + *
>> + * The caller must ensure the usb device is no longer streaming through the
>> + * normal, non-sideband path when calling this, as the freed rings are 
>> still
>> + * referenced by the endpoint contexts until xhci reconfigures the device.
>>    */
>>   void
>>   xhci_sideband_unregister(struct xhci_sideband *sb)
>> @@ -458,6 +479,17 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>>               if (sb->eps[i])
>>                   __xhci_sideband_remove_endpoint(sb, sb->eps[i]);
>> +        spin_lock_irq(&xhci->lock);
>> +        for (i = 0; i < EP_CTX_PER_DEV; i++) {
>> +            struct xhci_ring *ring = vdev->eps[i].ring;
>> +
>> +            if (ring && ring->segment_pool != xhci->segment_pool) {
>> +                xhci_ring_free(xhci, ring);
>> +                vdev->eps[i].ring = NULL;
> 
> 
> Sideband should not make decisions for all endpoints of a device based on the
> pool memory is _not_ allocated from.
> 
> Endpoint may not even belong to audio interface, for example can be part if 
> HID.
> 
> Can't assume that just because ring isn't allocatd from xhci->segment_pool 
> that
> it means it belongs to sideband. It's true today, but dedicated pools may 
> be used
> for VTIO/virtualization in future.
>

Make sense.  If we end up keeping this change (based on the first comment), 
I'll rework it to only apply this to rings owned by the sideband entity 
being unregistered.

> Maybe add some warning to xhci_unregister_sideband() if an endpoint assined
> to sideband  still has a ring allocated before calling
> __xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> 

Sure.

>> +            }
>> +        }
>> +        spin_unlock_irq(&xhci->lock);
>> +
>>           __xhci_sideband_remove_interrupter(sb);
>>           sb->vdev = NULL;
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index 15ce0bb7aa3f..1353d6fa2776 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -19,6 +19,7 @@
>>   #include <linux/usb/hcd.h>
>>   #include <linux/io-64-nonatomic-lo-hi.h>
>>   #include <linux/io-64-nonatomic-hi-lo.h>
>> +#include <linux/usb/xhci-sideband.h>
>>   /* Code sharing between pci-quirks and xhci hcd */
>>   #include    "xhci-ext-caps.h"
>> @@ -740,8 +741,6 @@ struct xhci_interval_bw_table {
>>       unsigned int        ss_bw_out;
>>   };
>> -#define EP_CTX_PER_DEV        31
>> -
>>   struct xhci_virt_device {
>>       int                slot_id;
>>       struct usb_device        *udev;
>> @@ -1255,14 +1254,11 @@ static inline const char *xhci_trb_type_string(u8 
>> type)
>>   #define NEC_FW_MAJOR(p)        (((p) >> 8) & 0xff)
>>   /*
>> - * TRBS_PER_SEGMENT must be a multiple of 4,
>> - * since the command ring is 64-byte aligned.
>> - * It must also be greater than 16.
>> + * TRBS_PER_SEGMENT and TRB_SEGMENT_SIZE are defined in
>> + * <linux/usb/xhci-sideband.h>, shared with sideband client drivers.
> 
> This seems backwards.
> 
> Maybe we should just add ring_seg_size and xHC device pointer to struct 
> xhci__sideband
> 
> Or optionally helper(s) that provides those

Yeah...I think you mentioned you wanted to explicitly wanted to keep 
sideband out of the core.  Will look at a better way to address it.

> 
>>    */
>> -#define TRBS_PER_SEGMENT    256
>>   /* Allow two commands + a link TRB, along with any reserved command 
>> TRBs */
>>   #define MAX_RSVD_CMD_TRBS    (TRBS_PER_SEGMENT - 3)
>> -#define TRB_SEGMENT_SIZE    (TRBS_PER_SEGMENT*16)
>>   #define TRB_SEGMENT_SHIFT    (ilog2(TRB_SEGMENT_SIZE))
>>   /* TRB buffer pointers can't cross 64KB boundaries */
>>   #define TRB_MAX_BUFF_SHIFT        16
>> diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci- 
>> sideband.h
>> index 005257085dcb..6d318e6a3bf6 100644
>> --- a/include/linux/usb/xhci-sideband.h
>> +++ b/include/linux/usb/xhci-sideband.h
>> @@ -13,7 +13,19 @@
>>   #include <linux/usb.h>
>>   #include <linux/usb/hcd.h>
>> -#define    EP_CTX_PER_DEV        31    /* FIXME defined twice, from 
>> xhci.h */
>> +/*
>> + * Constants shared with the xHCI host driver (drivers/usb/host/xhci.h),
>> + * which includes this header for its canonical definitions.
>> + */
>> +#define EP_CTX_PER_DEV      31
>> +
>> +/*
>> + * TRBS_PER_SEGMENT must be a multiple of 4,
>> + * since the command ring is 64-byte aligned.
>> + * It must also be greater than 16.
>> + */
>> +#define TRBS_PER_SEGMENT    256
>> +#define TRB_SEGMENT_SIZE    (TRBS_PER_SEGMENT * 16)
>>   struct xhci_sideband;
>> @@ -72,7 +84,8 @@ void
>>   xhci_sideband_unregister(struct xhci_sideband *sb);
>>   int
>>   xhci_sideband_add_endpoint(struct xhci_sideband *sb,
>> -               struct usb_host_endpoint *host_ep);
>> +               struct usb_host_endpoint *host_ep,
>> +               struct dma_pool *pool);
>>   int
>>   xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
>>                     struct usb_host_endpoint *host_ep);
>> @@ -94,7 +107,8 @@ static inline bool xhci_sideband_check(struct usb_hcd 
>> *hcd)
>>   int
>>   xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>> -                 bool ip_autoclear, u32 imod_interval, int intr_num);
>> +                 struct dma_pool *pool, bool ip_autoclear,
>> +                 u32 imod_interval, int intr_num);
>>   void
>>   xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
>>   int
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/ 
>> qc_audio_offload.c
>> index e4bfd43a2488..c94b15423a9a 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/ctype.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/dma-map-ops.h>
>> +#include <linux/dmapool.h>
>>   #include <linux/init.h>
>>   #include <linux/iommu.h>
>>   #include <linux/module.h>
>> @@ -131,6 +132,7 @@ struct uaudio_dev {
>>       /* xhci sideband */
>>       struct xhci_sideband *sb;
>> +    struct dma_pool *segment_pool;
>>       /* SoC USB device */
>>       struct snd_soc_usb_device *sdev;
>> @@ -1140,7 +1142,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
>>       memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
>> -    ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
>> +    ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep,
>> +                     uadev[card_num].segment_pool);
>>       if (ret < 0) {
>>           dev_err(&subs->dev->dev,
>>               "failed to add data ep to sec intr: %d\n", ret);
>> @@ -1211,8 +1214,9 @@ static int uaudio_event_ring_setup(struct 
>> snd_usb_substream *subs,
>>           goto exit;
>>       /* event ring */
>> -    ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
>> -                           0, uaudio_qdev->data->intr_num);
>> +    ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1,
>> +                           uadev[card_num].segment_pool,
>> +                           false, 0, uaudio_qdev->data->intr_num);
>>       if (ret < 0) {
>>           dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
>>           goto put_offload;
>> @@ -1786,6 +1790,7 @@ static void qc_usb_audio_offload_probe(struct 
>> snd_usb_audio *chip)
>>       struct usb_interface_descriptor *altsd;
>>       struct usb_host_interface *alts;
>>       struct snd_soc_usb_device *sdev;
>> +    struct dma_pool *segment_pool;
>>       struct xhci_sideband *sb;
>>       /*
>> @@ -1804,10 +1809,21 @@ static void qc_usb_audio_offload_probe(struct 
>> snd_usb_audio *chip)
>>           if (!sdev)
>>               return;
>> +        segment_pool = dma_pool_create("xHCI sideband ring segments",
>> +                           interface_to_usbdev(intf)->bus->sysdev,
>> +                           TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
>> +                           TRB_SEGMENT_SIZE);
>> +        if (!segment_pool)
>> +            goto free_sdev;
>> +
>>           sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
>>                           uaudio_sideband_notifier);
>> -        if (!sb)
>> +        if (!sb) {
>> +            dma_pool_destroy(segment_pool);
>>               goto free_sdev;
>> +        }
>> +
>> +        uadev[chip->card->number].segment_pool = segment_pool;
> 
> If struct xhci_sideband had dev pointer and segment size then we would just 
> swap the order:
> 
> 
> sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
>                  uaudio_sideband_notifier);
> 
> 
> segment_pool = dma_pool_create("xHCI sideband ring segments",
>                  sb->hcdev,
>                  sb->ring_seg_size, sb->ring_seg_size,
>                  sb->ring_seg_size);
> 
> segment_pool isn't needed yet when resistering the sideband.
>
This could be a good way.  Let me take a look and get back to you.

Thanks
Wesley Cheng
