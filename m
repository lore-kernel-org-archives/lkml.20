Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088456;
	b=JOu8eM90f/3Rgs9QtMX7gGV86MdIhvBWFYTu8BvulipTVEIrPyVPxPAtJYxpk4KlUw8h
	 lXDl5iVKte33qQmo5k7zmszdiyVkrvecsiS15kgH6TnFMHHcUuZyEMfbC2BsSlhZRziyw
	 4bSsRle5pwQzR9dpjhQ2GqEv4YuOKFEtmIajsLtAWA5xjSxlHymjy+uZb7zPUlAqn3uoJ
	 llM0n8zog/DPM1dQab2rDZAINHO6AtuKuBzvafAqe863WnwDl/WZ2Amh7/Qxx8LmKVcJ0
	 yOh78iJJVHr0YHjUUoRPTcIKX/Y0GYs6n8Mx4wopY4pW+A80ITNjpQi8tz9vDyMlUlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=;
	b=3ydlHmebIqbr/yeL/LzBZQICGJpfPXhgO0hn8TsaxXX5BqmbLM8yOUMroABJnN4CySEg
	 xJnJl37EUst9U7SqtA+7pOReE9oP6r9Bn2l3AfuxlHGosh4oOMmEwJ/jxfp/U0H7nPy8L
	 BRUIgr6JEgYZ0/dFd+isssU/weqvde6xJkyVEUt2bsViHcaVJzHWiADcOceCd+LJrgI8w
	 RZakxQcVvKPUv6nIlfz+e9uhsRXPSPavGAC3u9RVmnwEQvhjgAu0B2Uwdfi93TjH4tiqu
	 lxOet20N565iQmbx+hvFLrUxVaP3gZn/ZGfcwV0iYYIba/Va+C/w6ZQiPqmkdHDgraQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATRvnsLV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ax4FRd79;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66874606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66874606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATRvnsLV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ax4FRd79
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R7moY82141650
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=; b=ATRvnsLVchYGE7qC
	kfzXVwjviKIQ0jax2poUAzUkZ0gFeo9Fe5mhF5XK8XUiHHsVF6Z+GGCea/InPQug
	Ntjma7L5TiRAB7MUCv4sKj+OjozXezIrBg39pAEAVBU47prrU95I1fjdcNe+WG9o
	hRuIhXKWl1gRxv22aQQWFX1BC2Aon9kl8Niyvb593AjssTTGIMYucagE7oF9U/JM
	pOOBCOJIDB32jAh0y7V2nENc/96IiQy1xAgHd0oSYwh+fQNoxUD/3RZheyLUUU84
	y727x0kJTeu5gnyVC7ZfMp8SkzmMTtexrMgs0RE4HdWF8OFWNEFKXh8Y6yRiO/E2
	ct1hJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw202a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:07:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso3464383a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793088454; x=1793693254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=;
        b=ax4FRd799xJh0/g0tWbtDkcaJ8dzkV+fqffIIXnL2HgYqOoaOxQTY0k1GUtUWr5SY4
         mdPoA39IdPM0KLnhOy0qoEHWkRI3T5wZutzcRint0LJ3b+ek+XMRcoQ6dQ27Q7d2KPO9
         s+LJmIN/VvWLa1V7ZeoKdIZQzGMR/WawrRUMPtv5i8XJ3c90LIDjwzc0yYSDRYmS7dVS
         9REDLWZLFoyvYVpSLssl0g/ImFT7dVjDqBlIJk1OP2TjIQS8IrGVdoIho3TVgiW07BBL
         o6W7JofLRXV2kIDc0qWsQFlOM1pmC2GdD797e/L0susWYELwhTqTVCNZhQf21bRS9ht1
         TO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088454; x=1793693254;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SV5EvR4Qw3kXSOIY+z0ynS9HZeULhn5oEkX4RVcLmU0=;
        b=icvOVg7A6fAcNsLzieiRqAmTCNmanoB72oB9jAyc6rDzAsNYohDY78GdgDqvTiUEwF
         Upyec7fxiQ3TH6hm0mHc0y29J31e0+8TvltVkSh1KdHSm/76XJ4idt+hft1U62c687f+
         7diWR9vKkOOHQu88D+27FmUXI0MPX5ujkTYRs+cQA+RnVnqsa+WNTK2XSqZIJH2CgTCg
         GHN19uRjGQotrlVKZbz6dRZPPXo6crDRYERhQJ0q23j6c4O+jnhFAg052WJ+aJ8wTrjx
         osTUJ4lmmTEVur0FPMh02hRolVfaLDISoqPiBvkU7IbZAuaifyPUHPDG6HzBvrrxHNPj
         mWFg==
X-Forwarded-Encrypted: i=1; AKwUvBw+ogRDmaFIqrOU965Z27rzfQTJQfKJza5o7d/7zaoTYBOxD69QhYqPFs98J16DZoYcWM/3uMhZN9JsmxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR699VlU9tpBW1Dip/+OmL67uGNRhZTG2Tot8/N7iXkv0cdDIA
	J9pjuZM6PFzlZGBGaRGM/yWUreZIwpCr37/sCpPLvsXmJIfCrOSAk7c60fcGQ+D5s2ZcaJYHHyJ
	84W2ffizlT32SNTIAU8rvEcUKIBcmbRyyRShYg5ezugktQ56djcL5shQ0om76T02+RRk=
X-Gm-Gg: AYBFou1qtJXr4SraOVshs0dJosMwkyWA8jeTfILqMli7qOlG7S7uqld5GMwcbY5NiEi
	lTqZ8rJW1RJedngKo70tmJT9CHxXcm85TQHAEzsjoPMj956WdjhbuYwijwWp4lavG9VL8Q1/6Sf
	rcG5DEygU7tKeW8wnnQMyTCcIDOrGUX++m6vFxqzT/qLCcktCL3IWmfIMnEdWm05nSxYY5g4g+r
	AWlBrhARrAg4XgrAKfwsjiI1JnIntgyJ9ND93IuNwGP3RcBpbxyqlzEB9eor+k+iObXy2sotdYB
	gzGtSr5B0T8jEauWvXrof3BpR0qII/1psJr+C52JJT7bERX+XFNoN1KBbJozaLaBsamm207jzOv
	S2KVdLaimPL2BJFdAAqQqysyRgB4V/T757itsohrv3HM80aTNlv6GaUNO4MQhisavO0M=
X-Received: by 2002:a17:90b:3d8e:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3adea8985fdmr7019860a91.14.1793088454083;
        Tue, 27 Oct 2026 01:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8e:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3adea8985fdmr7019832a91.14.1793088453468;
        Tue, 27 Oct 2026 01:07:33 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066aec8sm2585161a91.15.2026.10.27.01.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:07:33 -0700 (PDT)
Message-ID: <033c8432-4a03-4f38-b0a3-28f5d551b0ef@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:37:27 +0530
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
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
 <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMiBTYWx0ZWRfX3k9Qct+JBPbP
 CwHSBU2C5m8MXThERYn/REil8/69cib33c1Qzj02LRIjazawKeEXtcytOl4jR3E3RBsmyd5zesD
 tjdaKhQPcDj0FDTLUz+pV+mfMpWKite2IzRZIToYWmo3eos05DItDE7f/eo9IsEbk0lroi8iFWg
 N80NzeESyZ/yyX1v5zA1IgQTV0aM2V4H1t6bhIalgrm+AcFU9HhcUH6WIr97g2s/aVZeAD92qGP
 3M6GiyK/l07yNAe3hSXFZv+qVcorBtQy18R/6YciGY8Sq4lKJTlnxY/Mp69BIOHOFRSjsO9hEYQ
 E/Y2SvEl0P1w+MkHY/wCIKCH9E7ZyDtkgJ+H/z6vWakgDTG50FDuYVaLNy4TriBvF+LXZP08aDP
 uripqUwwQ0pft09pOOmyCHm3CpZdYvx3anMg5fN3vZTOcIzD9DUX+tvx9Yz4YtOTWdlynxuC5A0
 oEYQ0vzIakRZMAIQJBQ==
X-Proofpoint-GUID: 4sVxY_bU4Ts_FNBcU_ur5VPl60kX6o4K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMiBTYWx0ZWRfX3siBJESl6pPj
 SqukoBPa0SYrdwFcNwLtydW4hUBSAIaZKFarGrroPQ2hYfy69FYgTSVxEbgaiG+qRyWvRxkgQyd
 XqMQa6nWZ5aDIceIt2K3wnwkt9B/x3k=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae05bc7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=SNSdMoAXaN54LQpy3WIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 4sVxY_bU4Ts_FNBcU_ur5VPl60kX6o4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270032



On 10/9/2026 10:29 PM, Krishna Kurapati wrote:
> 
> 
> On 10/5/2026 2:14 PM, Vinod Koul wrote:
>> On 13-09-26, 20:10, Krishna Kurapati wrote:
>>> In cases like USB High-speed phys which can be either USB2 or EUSB2, 
>>> it is
>>> required to know the type of phy (rather than the operating mode) 
>>> because
>>> DP and DM interrupt lines need to be configured differently for each of
>>> them.
>>
>> Does the controller care? In preceding patch you defined the EUSB2 in dt
>> type, so this describes the hardware. So phy knows it is usb or eusb...
>>>
> 
> Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now 
> its type, but it needs to communicate the same to controller.
> 
>>> Add support to cache the PHY_TYPE and add the following helpers:
>>>
>>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>>
>>> - phy_get_type() for the consumers (like USB controllers) to query the
>>> type of phy connected to them.
>>
>> I am not convinced that this is the way to go... Driver already knows
>> the type and should use it...
>> we alreayd have mode, i am inclined to not say yes to adding type here
>>
> 
> "Mode" attribute describes the current operating scenario of the phy 
> (device mode, host mode, high speed, super speed etc.,). But it doesn't 
> describe the type of hardware and hence a new attribute.
> 

Vinod, can you please let know if you are fine with this approach. If 
yes, I will send v9 rebased on top of phy-next.

Regards,
Krishna,


> Regards,
> Krishna,
> 
>>>
>>> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>> Reviewed-by: Manivannan Sadhasivam 
>>> <manivannan.sadhasivam@oss.qualcomm.com>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>   include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>
>>> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
>>> index ea47975e288a..038c2b58bbe1 100644
>>> --- a/include/linux/phy/phy.h
>>> +++ b/include/linux/phy/phy.h
>>> @@ -21,6 +21,8 @@
>>>   #include <linux/phy/phy-lvds.h>
>>>   #include <linux/phy/phy-mipi-dphy.h>
>>> +#include <dt-bindings/phy/phy.h>
>>> +
>>>   struct phy;
>>>   enum phy_mode {
>>> @@ -152,11 +154,13 @@ struct phy_ops {
>>>    * @bus_width: Data path width implemented by PHY
>>>    * @max_link_rate: Maximum link rate supported by PHY (units to be 
>>> decided by producer and consumer)
>>>    * @mode: PHY mode
>>> + * @type: PHY type
>>>    */
>>>   struct phy_attrs {
>>>       u32            bus_width;
>>>       u32            max_link_rate;
>>>       enum phy_mode        mode;
>>> +    int            type;
>>>   };
>>>   /**
>>> @@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct 
>>> phy *phy)
>>>   {
>>>       return phy->attrs.mode;
>>>   }
>>> +
>>> +static inline int phy_get_type(struct phy *phy)
>>> +{
>>> +    if (phy)
>>> +        return phy->attrs.type;
>>> +
>>> +    return PHY_NONE;
>>> +}
>>> +
>>> +static inline void phy_set_type(struct phy *phy, int type)
>>> +{
>>> +    phy->attrs.type = type;
>>> +}
>>> +
>>>   int phy_reset(struct phy *phy);
>>>   int phy_calibrate(struct phy *phy);
>>>   int phy_notify_connect(struct phy *phy, int port);
>>> @@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct 
>>> phy *phy)
>>>       return PHY_MODE_INVALID;
>>>   }
>>> +static inline int phy_get_type(struct phy *phy)
>>> +{
>>> +    return PHY_NONE;
>>> +}
>>> +
>>> +static inline void phy_set_type(struct phy *phy, int type)
>>> +{
>>> +}
>>> +
>>>   static inline int phy_reset(struct phy *phy)
>>>   {
>>>       if (!phy)
>>>
>>> -- 
>>> 2.34.1
>>
> 

