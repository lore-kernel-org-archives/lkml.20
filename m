Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537990;
	b=dunGMFwWeBuk0GJx3gMSl1c0Rd+NYRov/k0qnHUuFu6qNazedFG+ux0+ovSAWWMRPBFs
	 XWddiAEkL26QsFc0dv5XsC84WFB1TnM13I8Xi23KCTqohyPbXhK3uxtYsHAVonDfjypaG
	 u7Jr6/dMKaCCvAhWPK5mFVG79lxa3U96bIZkrcKJMpRa6FBUUclgFhEPwb+ll/sj3gpih
	 g2+2PXY96yRmrFTH1BbM2t/UFONjETlyJWRJePiW2b5RybL8TbIKJDHVeUdVpZBA3ZBxY
	 fQSY9GTRtVY7yjLjjEGUGXXv4NqCitm+XKiCR5kEM040L1wF+KPakilObOfmElaB3wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=;
	b=NJFLZx/1u62X5YZU5c8sRVneRi0LqSrDfb2eQ++Pb2FQpGzSMDUGh/h80CcsUapARJ4R
	 cFG3piJmUcOdlJZEvc5yZ34UTuQgrOLopBJCt6bJqY7pI1twBVgqUuBT/hCH9b/22KbCZ
	 7mSkq1YY6b+arZz10+FrgsSZ33agaP6uFSNqo55EE3ilVJCH2Z5wFaWpCbOfcI5gUw9NX
	 2QyV5AWvHBrvD5hpwzLkc4zlENUBN7tsvztlKu1ITXNvJbKckWpJRYnILqiDVgRQuT6D/
	 fh5QG52xxM7hy9YYBjD61nFvR7jRooK6xNnXg+eftGFqkCkjfR62YqznSkYABac8umw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KXY4JHYU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPh7nLMw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61CF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A61CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KXY4JHYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPh7nLMw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KMUwPl2948869
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=; b=KXY4JHYUWO3bE3is
	gRpMrAuolNDZbZzva/DkJoYJ1+F2DIVilRKOaKd+1caJA1zwCjv7CJHKyWJbFrea
	/ULCqtNqrArcVpAUYQZh8JoxVIADVZMFi4NbDny5kdRjwgnZuCoe/E7EKzh8u+uL
	1/SANw1L1uCqY0I8DxY1mc+Jad0DFuVjJ2jx269QWTwoyLaOFwZvSQkw2nnSfNvH
	MKVTjyMTj4JB/fHvKSwZ4mVsC8uKALdxmYC8A9Jdr0iYX3Qi+Yh4z9P5lgHOoct0
	YxsY667TGpesMrnsNYBok7OvnyO4YVk1BAK5Y2P1ubwIgONENP4knd+vyee0zmk6
	xaOVGg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r03qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:13:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso163727eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792537982; x=1793142782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=;
        b=MPh7nLMwvn6EuIojV940LYBY4GaAsuAcmhWFHj4lMlRwt8tSyzrUSOfclMjRNm5UqR
         5g40F2iadoQf7ZRRXX6SK083cq001RfikPhQRiCrjO5tqnjrjaN2pEAcGJlgchEx0ymy
         sLm9WmRz76O3A34yEUdH6aZ7/rc1EXIe5zShTGccgEBjnCZ3eUD6qGMCkHCXXXbJYZHI
         QjJU7YnrUEyf1eazDQ3+QDJMRSDpanO8kPnFF/LAP51L+VUDIMzygYwFbVt0Be0dIASX
         jgI05k2CrS1DJlROzEnG9U936t5nBZowCUKwwN95SK3gpgBpAoDgroYIFODTLJ6oYHkk
         JxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537982; x=1793142782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UkutnNIb4vC+UWeSgk5mmFPSihgmugp8sYaBh1b/sw=;
        b=bUHTCdkVJkU+4kLQmFxi+R7UUE2ZkDFQQZfCFrhdCxA9w/d6vE1SBoV3Wjt4oqnD+L
         CKA5R/exvFeKs2Arswnmi1PGNTlrY39k2Z93XrvMLPt7k7hrqIO68BWyddiM44D928BG
         cIo7nZHi9DEQrlrvtzqlmv7Hz+XmO9qFVC4Zw8DKW7enffA+MuAa8XfRi2kDB1H8tIAi
         LDa7ifn2WoLH3wg2HP7+O0wCJoRBdW7+z3arTsDOKnWkD2W9dDxHB1Zq3d9wgimnZQND
         yXCNubkp8f9EZQNeKHoiYH86vPAElb51yPIKnkB54Tq9L3zotl48otHMPRll4JxpU00M
         vllg==
X-Forwarded-Encrypted: i=1; AKwUvBzyWoZTAXU4a2Y9sz7xj3hOfgabrjoo3KYYRYYcN+jGyZDb7pFchVE5HzNTDnBlUsRiNM61ByRTARHtZME=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdwM9wfwAGsGR1N+GCsFwwBnROl4F10qR26mDbWDEo3ELyPu5O
	1EU3vzW/WeZY6J9A9nz+NOLoSxIoz/VUHN+NAsKvUx/y5xpEjw5IMt8QnBSZAbvF/DkZesDTWm6
	e/QQD5TVx732p5Ns7yOlCpaM1hLFA7Zef7P7vjgSJ3PDMBkzE0UYJwfgkIT/Ag0OTrrY=
X-Gm-Gg: AYBFou0Uq7ZqCE6WjgFgq5c36nwpB2NUStRIQy4xDbgH9iEBAedSshawo6NEkHprufc
	FXd6o7ABbeiV54O098J3J/bjF1JIDP7iL28a+jd9+Pi/xd3D9/yIH86jEVxjQ6PeGsgWHtj2+Nt
	Tl9M4xjyETDJVpbMErbp06d2PW15MPyfALMBDQq5B+tlaQ1/KYtSp0oFNgaH2qU40sOPfWgtlzl
	hRM9IqGoL4ciH8HHb+o5yfDJaK57+S7DiMf+eACNzhbzvQ8bz75HSwS5PKFf8BKipJTEZJzNdlr
	+tqx+4nqpDJj3RzgwONNBO+FFKfQfPEf+nupVps+ClngwLjinaeGVnH9bVxyrhZqQ4YV0Ktn2zS
	7SKxrKPPJIXxtkiC+gdxpEi074DpoxR4IJskIJhq4ztEXeQ==
X-Received: by 2002:a05:7300:fe46:b0:350:869:d106 with SMTP id 5a478bee46e88-3674ea39d18mr774592eec.34.1792537982216;
        Tue, 20 Oct 2026 16:13:02 -0700 (PDT)
X-Received: by 2002:a05:7300:fe46:b0:350:869:d106 with SMTP id 5a478bee46e88-3674ea39d18mr774572eec.34.1792537981562;
        Tue, 20 Oct 2026 16:13:01 -0700 (PDT)
Received: from [10.73.199.44] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm1830710eec.15.2026.10.20.16.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 16:13:01 -0700 (PDT)
Message-ID: <090277e2-e36c-437a-8c2c-f6f3b63abc89@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:13:00 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
 <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
 <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
 <20261013111110.423dd0ff.michal.pecio@gmail.com>
 <73096f91-146a-4754-a685-f3b22f1ac3d5@linux.intel.com>
 <5a60513e-9d39-4cbe-9f2b-dde8ca71a8a3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5a60513e-9d39-4cbe-9f2b-dde8ca71a8a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad7f57f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x1azOlOpTcDmYp9XJnwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: cnIIz_rffUnIwMmEHkcig9WRyudgW0VQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfX0R/OCifpbL4k
 iWOkZpT6uaALQVoO3X/VhcsSFda5BN6DbvY6MT8UYl2k7xgHdw49+MNV6r+jP4UunmL9aseDzeo
 +i8ifbYX+n/BXTxIi4gEWAcU+Ps29CgQ8n/47ve0K+W8NsEE4Kdugus2Z5mqWrVafdj1uCDpyN4
 4Kh0Eq9s4FID4vyEYVRfWa7RC9kcdUA3rmRNQhciiSjj+sTihfmp+qDwO8IH3tUZMSK6WaV2z83
 zm5P/gdk3sAByD1+t5xjSArXoXN/Iar1E0dHpH45UF7U7WQM04VTzIjWc926q+yQBHcgfB9dbfl
 PngkAHeoDwbKMprn72rdf7YhAbKE5zGs7OG4jaOI+xmQY7SHIj/psHDq7XxDvwzCxsplp4Mn5HT
 25CSeDjlrr6T6kQyy7RLdw2jTMfmyIlavq6ma9SxL6zpwTdYeYl5VRqCFHFjFEhG3+Ntz4oTL4S
 Ggjw6oHLzIJlTZ3qQ3w==
X-Proofpoint-GUID: cnIIz_rffUnIwMmEHkcig9WRyudgW0VQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA5MiBTYWx0ZWRfX6npoQgs/wudy
 L+HYZ6iJbM8BvCdApAzRazQNkHp4BmYnISNDRtXj2jvJ14TygK+LGNvYDhuHJDY813D6kzQxzkD
 CiPeIxRMOrfdiF3K8SBiwlBMByAnKhI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200092



On 10/14/2026 5:44 PM, Wesley Cheng wrote:
> 
> 
> On 10/14/2026 7:26 AM, Mathias Nyman wrote:
>> On 10/13/26 12:11, Michal Pecio wrote:
>>> On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
>>>> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
>>>>> xhci is the one allocating the ring when adding an endpoint, and
>>>>> telling xHC hardware to write to that ring. It seems more
>>>>> approriate that xhci should be the one freeing the ring after it
>>>>> told xHC hardware to drop the endpoint, and there no longer is a
>>>>> risk on hardware accessing it.
>>>>
>>>> Hi Mathias,
>>>>
>>>> Sorry for the late response.  Was out last week.
>>>>
>>>> Specifically in the disconnect path (while audio offload is active),
>>>> when we utilize the usb_set_interface() path, it'll return early due
>>>> to the iface->unregistering check.  This would lead to the
>>>> drop_endpoint not to be called, and rely on the xhci_free_dev() to
>>>> handle the transfer ring cleanup.  This wouldn't work in the offload
>>>> situation, because qc_audio_offload is the only entity managing the
>>>> DMA pool, and that would be freed during the .disconnect callback,
>>>> which happens BEFORE xhci_free_dev().
>>
>> You are right, audio class driver .disconnect is called, driver unbound
>> and interface device gone before xhci_free_dev() is called.
>>
>> If sideband is unregistered as part of .disconnect callback it also means
>> ring/pool would be destroyed before xHC has dropped the endpoint/disabled
>> the slot. Would be better to free the ring after we know xHC controller
>> won't access it.
>>
>>>>
>>>> Would you be more inclined to prefer a solution where we can defer
>>>> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
>>>> adding another sideband notifier (sb->notify_client) enum to tell the
>>>> client driver that it can release the pool?
>>
>> sb->notify_client callback has the risk that this sideband entity is
>> unregistered and gone by the time we want to call it
>>
>> Deferring freeing the DMA poolby some kind of reference counting again adds
>> complexity, and maybe not a suitable solution for this issue.
>> (taking a reference at sideband register and every dma_pool_zalloc(), 
>> putting
>> when freeing or sideband unregister, finally freeing pool when reaching 
>> zero.)
>>
>> I'm trying to figure out a simpler solution.
>>
>> How about skipping dma pools completely for endpoints in these cases?
>> (page size over 4k with offloaded endpoints)
>>
>> Instead of sideband client creating a custom dma pool it could just set a
>> 'no dma pool' flag for the endpoint. xhci driver would allocate the
>> ring segments using dma_alloc_coherent() instead of dma_pool_zalloc() for
>> these, possibly even allocate a full page for each segment?
>> Freeing would be done similarly.
>>
>> Would this be a viable simple solution?
>>

Hi Mathias,

There is one difficulty I ran into, and that's w/ dma_free_coherent() not 
being able to be done in the current xhci_ring_free() context, as it is 
under atomic context.  I could move the dma memory ownership from xhci core 
to xhci sideband, which could probably get around this.

xHCI sideband will allocate the DMA backed memory then populate the 
new_ring reference.  Then when xhci_add_endpoint() --> xhci_endpoint_init() 
is run it'll check if new_ring is present, if not, follow the non offload 
path and allocate from xHCI segment pool.  Then on the sideband unregister 
path, we can handle the freeing of this DMA memory as well.  This kind of 
moves the memory operations from xHCI to xHCI sideband.  We would need to 
have a set of sideband specific ring alloc/free though.

Thanks
Wesley Cheng

> 
> I think so, this was something similar I proposed on v0:
> https://lore.kernel.org/all/20260824-16k_offload_v1_b4- 
> v1-0-49a6be60ca30@oss.qualcomm.com/
> 
> In that case, the client offload driver wasn't responsible for freeing 
> anything and that was all taken care of by xHCI core.  The sideband just 
> set the alignment_req.  Might need to make some adjustments after the 
> further discussions we've had.
> 
> Thanks
> Wesley Cheng
> 
>>>
>>> I'm not Mathias but my opinion is the same as always: none of these
>>> problems would exist if the sideband client allocated and freed all
>>> transfer/event ring memory, and xhci-sideband only owned a mapping.
>>>
>>> The mapping would be freed by xhci_sideband_unregister() or similar
>>> calls, which should ensure that the xHC stops using the rings, and
>>> memory would only be freed by the client driver after unregistering
>>> the sideband and stopping the coprocessor. Nothing is ever UAF or
>>> leaked, and ensuring this is *easy*. And if xhci-hcd randomly wants
>>> to get rid of some endpoint, it simply stops using the mapping and
>>> lets the sideband client clean it up two milliseconds later.
>>>
>>> One thing I'm not entirely sure about is how we could create this
>>> mapping. Using bare iommu_map() creates a hard dependency on IOMMU.
>>> Documentation/core-api/dma-attributes.rst mentions possibility of
>>> using generic dma_map_() helpers on multiple devices, so maybe this
>>> can work, but I haven't seen existing examples of such use.
>>>
>> Could be an option, but maybe not for this specific issue.
>> It's a larger, complex change without any real need (yet).
>>
>> I'm hoping vendors would move away from this sideband implementation
>> instead of evolving it, adapting the 'xHCI Audio Sideband Capability'
>> defined in xHCI  specification section 7.9 instead.
>>
>> Thanks
>> Mathias
> 

