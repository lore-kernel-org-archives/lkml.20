Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691025476F1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932026; cv=none; b=b5Gljxoel7EdSE2xP7AWxfQ2/9IhztiwWu3Zgw875CnCwdvRFOiqBZVpdlznAUroHWOFpILp9G3LvKRViagfSsMAkQwrokI87F0CVP4vMG2gdpPqP4nrc3K8J/3gugv8Oha/fJVH72z1yvUcx4kR2thsCmg3dZlRJ5G6fGcRb4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932026; c=relaxed/simple;
	bh=Hma4RgGfGLBQ6xS6PrwLKiMepbWaHJcnLCXe3/fphVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWNe8nHyxIpVBaBhwdpi/1qhbza+FVZG1v4drw6kAgtOJt1ai5NoGJbQ47fG3M9sNpjwXw0KmYhftUEBgxdBewQUJ5b9m7Jg7uPZ5Sdto9OtRQgOl2MnBBnWgoTji17dQhWVTbZC2XOyZlVdgLvmNmG/Ps4i5URgPoKT1ur36Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hanxJlA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMGjBzm+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hanxJlA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMGjBzm+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHRF753017940
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mxil4QV5DyDElpqiZcf+YLh/SA5GndGsyqbFML9jByc=; b=hanxJlA7ybvXdLjW
	ory3JIVy1+bYco3lvVZAq424rBW/vsjBBcCXebpjoGdEZxjaRCUfWVenXN/XMG+B
	azFCGNbr4Is3zrvEyEWHOrqa0bcLG93BafwJ+/lgkkoxIaHUlnWoBilEgNt0/10h
	AJv7VO86K+0A8b6LghHfif29HMsyxCEq3pv5XqlUDO+3ia0zXEYwcWBY/KGDP+Y5
	cE2pLUm/vmb0qoVaBVUw1wr/LCMyq8dLSJ5DJGiP49CBje9KVl+M0dAsUFoHkDeb
	KiypA6l4089UvKUdVK4DU+YxYERD0Z7Yyf9rn2J7PigiD3pRrqVDKajW7MLdJO2m
	mlibgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b1anc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:53:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so547446eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791932022; x=1792536822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mxil4QV5DyDElpqiZcf+YLh/SA5GndGsyqbFML9jByc=;
        b=eMGjBzm+pX+NcJfWGI4u4Xz9Yh6MZDYNsfo1LoUNLsEhRG31GMLDTeqCAHczq/GmGj
         qdmvlWm4YYC2pKzzMA0tr2SpDNVsVU5uV3PSroKF8wW+SldLA3d/hTr6xmfov9U7C0P7
         6hoTFLPNGL85BGdMu9+dotHBsvF9SJGwKp1lRVT4JBFMRDRLH5P/T028l8ki0I+SL+yQ
         2WI71523nDDhs2Z+Mmj4CzvcJ4Yz45jm9HSiiEkKX/CficQ21cU0Grr8+4B4lf1QiB2q
         c2ZkxkrG15OLKJMMjE6Wj3kiikqv9ffotcpaUWm6jVE8kMMYa/KHCyRQDm/TADEm8C7O
         0tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932022; x=1792536822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxil4QV5DyDElpqiZcf+YLh/SA5GndGsyqbFML9jByc=;
        b=23FKzcv0dECKu0x/V/tj9Cu768KXQo2j/MhtO1BqzfCQ7W1uOHrACophmxDQt13f3F
         UFVc5rc5aUzt4uqyiXhqCzx1aTE6SJahcRR09yuisqZt5TgBWFSdYnUpC9Gd2iUbTsbM
         r7pElgpKzmJ41z5guaas8ucDhiEMZYs1Z3mo4l2xuoOQji9wU5e1G52HczC779CIHvkH
         XVf/iJhP1ccQMO9x4vgKlM+T2+bmwefzFGBQ/pUV6Bz2LtPOjOHliRfUNYbesgFmlg4s
         jQXt970E72sDFCohGhLwauCDUjTh/aUWSpoz9NgItgMPQmD5df/zfn/2pR64V3hx65Hg
         sXtw==
X-Forwarded-Encrypted: i=1; AKwUvBxTuBIIz328mUxLVSGG7gOFxcCf5+cyVU1oYS7fD+a8ISwHuDaKJt7Y0uf33Act10whmD2yqz7LEUTr/T0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbrS2YaVheAQLn7+eLbUWr5UBXjGfHy/ePqEhpRZkv7BXUtekt
	UD05KmyzDyCGrAuPag5RemRoRbzAiWKpsMjPMsE6+BMkK2eKbcOepFyNB0QLxQc15Nv4pkoqLks
	ziEn5diVsIW8O9/rjz22esA2qFoEDcOH4bVVhEQ8SF3NlHmyj3j9Sv+UUXoVFsBGg9YA=
X-Gm-Gg: AYBFou0FtG8QcGGHAcpR1EjAsFfKcG0HwHMa9XiDrDn0UIYPV6a/iyJ2iO3buUFrHIQ
	ckurx+kE1K2uGa6ga3moDyLPI0Lu2xdKnLs5fvSmUZAqYjXo3VRDrKVak5bmMsZvMGC01KgtQ3E
	+O1eNdNTWntbVpKbyfWVRRsDz26R66ozW/MlhHgys5fyDEZSmMUZPk9uk3HHrxOvYoZ8kAihqxT
	rPdhQ+jHAsFtCgXDfu0u0qIv39i0acwhF0lGkP3qK/A67TMfnwuMuTHl3NkGxq+Uq90jX2rbSSd
	VzJTQeQiwObLabCH+oKAHCSrxi2cjyWzEZBtx3ymLW7kUiKsVWRt3zc+3H3tNoBwoSexKi8OwiP
	+u6S++CqradEOR98E8nqTNLx2DYojuUQ4PNWSwLSfLtf7TA==
X-Received: by 2002:a05:7022:b054:10b0:17c:2de6:9795 with SMTP id a92af1059eb24-17c2de69af9mr2483442c88.9.1791932021458;
        Tue, 13 Oct 2026 15:53:41 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:10b0:17c:2de6:9795 with SMTP id a92af1059eb24-17c2de69af9mr2483410c88.9.1791932020833;
        Tue, 13 Oct 2026 15:53:40 -0700 (PDT)
Received: from [10.73.199.44] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm40439563c88.21.2026.10.13.15.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 15:53:40 -0700 (PDT)
Message-ID: <5cd85c1b-4bb7-4f30-930d-6c6451f09395@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:53:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
 <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
 <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
 <20261013111110.423dd0ff.michal.pecio@gmail.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20261013111110.423dd0ff.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6aceb676 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=csWOSXdzfb-gPp_ViFkA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 0znP4lXn8bYJhZ8wrbEDXlLq04dSErYL
X-Proofpoint-ORIG-GUID: 0znP4lXn8bYJhZ8wrbEDXlLq04dSErYL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA5MSBTYWx0ZWRfX0fBXRi4cRbil
 kVIsuIdQTFenOebvZtKZV3FtdRS/DA2665+YfXxgkbnWwwv3A4rKuY5Adl/drkq5emXzhLBbvPJ
 Uuc96PpOVQXqpvLm/h7AsvWqitE30jX2TSizuz361v7mkquOTv8xWOqhSIalp/SKcPUet+bN+rK
 3gNZizQ1mre0+zRPi4htpwBu0nJ11UWGVkyjtf9YIkoaFiEhr6HYK23q/CIjGLPEULKwMXw1WK3
 VIeT5qu2BHSdMf1fLbrDdNdH6+JgAmyUcjqOr7TTj2RxjSSuW86Mu8Txi9zcCr/MKbTbaTCRdV5
 5zSPYeZYkY0bMGCb/jZaqodIC8SAl/RTLACDA7uxBnQXOKzaEsy3ECvBtcNzRT5P1oX/vC9FYxO
 sL0EHu+z80FpCGhjTyePwkxj1RYD6Hrx/D1KYplYePm7+/bNjF3/et/pJttHXnW/McvBPpelVsB
 BjWRJIdpXNzCsn8Eclg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA5MSBTYWx0ZWRfXxOpTZHZrKYvu
 veRHQTpFUoL1V+JbN1EIJEon92/qWgXi0vv0121LBaRxnWB2KZoyfaiAEfKyXIsm6QCpPhnuo93
 WI4Gnqhc0C12fyzx7Mu1iflVD1u5CsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130091



On 10/13/2026 2:11 AM, Michal Pecio wrote:
> On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
>> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
>>> xhci is the one allocating the ring when adding an endpoint, and
>>> telling xHC hardware to write to that ring. It seems more
>>> approriate that xhci should be the one freeing the ring after it
>>> told xHC hardware to drop the endpoint, and there no longer is a
>>> risk on hardware accessing it.
>>
>> Hi Mathias,
>>
>> Sorry for the late response.  Was out last week.
>>
>> Specifically in the disconnect path (while audio offload is active),
>> when we utilize the usb_set_interface() path, it'll return early due
>> to the iface->unregistering check.  This would lead to the
>> drop_endpoint not to be called, and rely on the xhci_free_dev() to
>> handle the transfer ring cleanup.  This wouldn't work in the offload
>> situation, because qc_audio_offload is the only entity managing the
>> DMA pool, and that would be freed during the .disconnect callback,
>> which happens BEFORE xhci_free_dev().
>>
>> Would you be more inclined to prefer a solution where we can defer
>> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
>> adding another sideband notifier (sb->notify_client) enum to tell the
>> client driver that it can release the pool?
> 
> I'm not Mathias but my opinion is the same as always: none of these
> problems would exist if the sideband client allocated and freed all
> transfer/event ring memory, and xhci-sideband only owned a mapping.
> 
> The mapping would be freed by xhci_sideband_unregister() or similar
> calls, which should ensure that the xHC stops using the rings, and
> memory would only be freed by the client driver after unregistering
> the sideband and stopping the coprocessor. Nothing is ever UAF or
> leaked, and ensuring this is *easy*. And if xhci-hcd randomly wants
> to get rid of some endpoint, it simply stops using the mapping and
> lets the sideband client clean it up two milliseconds later.
> 

Hi Michal

Your feedback is always welcomed.

I guess my intention was to see if we could leverage the existing memory 
operations within xHCI as much as we could.  The only concern I would have 
with having the client own all the memory operations/allocations is that we 
would need to carefully maintain the transitional phases between offloaded 
and non-offloaded scenarios to be handled properly.  At least in the audio 
offload case, we're only offloading data to the DSP when audio is active, 
which can be for a short duration, and we have proper checks and locking 
already within the xHCI mem/core layers.

> One thing I'm not entirely sure about is how we could create this
> mapping. Using bare iommu_map() creates a hard dependency on IOMMU.
> Documentation/core-api/dma-attributes.rst mentions possibility of
> using generic dma_map_() helpers on multiple devices, so maybe this
> can work, but I haven't seen existing examples of such use.
> 
> And there seems to be one more potential problem case, which hasn't
> been mentioned in this thread AFAIK: if xHC resume failes, xhci-hcd
> frees its private data and tell USB core to reset-resume devices.
> Looks like another opportunity for UAF.
> 

Since I did take a look at the other issue that probably reminded you of 
this, without getting on to a tangent subject, it really broke down to two 
scenarios:
1.  reset_resume during bus resume
2.  usb_device_reset for recovery

In both situations there are requirements that when those happen/trigger, 
technically, the bus should be completely idle.  For #1, since we're coming 
from a bus suspend transition, there should be no pending URBs in flight, 
so if reset_resume happened, xfer rings aren't being utilized.  For #2, 
there were some changes that weren't properly handling the pre and post 
reset callbacks, leading to problems in that situation.  I think that 
series showed us that there are corner cases where referencing vdev could 
potentially be unreliable.  I'm going to assume this has no relationship to 
the client driver owning memory, please correct me if I'm wrong. :)

Thanks
Wesley Cheng


