Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705602;
	b=eMJ8IkuclySk+8d5aCaZtxcJKbzE7gVJ91iwI6xSktUszI0C6B8zxU/YG0Z/MCcaqn3z
	 b2UR//C1S+5+zXBY77WcbrkcCgtTzz9zFbd/hNe6/EYH/OCwWRJRpLA6pZunlrU3vVhRj
	 S9DBbrEpziKtm0u67LtwhL9OI3E2Bad88/tIAHI4J+pI2pmR/qQhuC7O0LvdGFh7rUmpH
	 Z5sZ/TU80esoeOxk/uWsBO1wZ1MpgLMv3pUj+OTn1b81bG0g9wZTRxURArB9+fD0KcLL+
	 ehkmZtyfUTs0m/sru5wZsTNiEj9DkiWpdZz7bmgRyFnR5UQqrn2gCHYxDj0OoWOBsPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705602;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
	b=z1bIBmk0gXVi4Zj4EQEIJqd16qTk8k+tSxD9vOcljpQfsxqpif4QqrwSQOxwTwosfJj0
	 /H9+gGOS2gMWUsBokugr0AVcLmm9XVbmOaMKBsCLO5bOsnjRkCt+iCI4Uf9wry8dFFE0L
	 FYlSzhKO3wYo7mLdTOPR5jbG/AW4ZupuO/EX8Ukv6G7syA4Hr6M0b9Lh0YofpMoWhHrSy
	 qu77gOcFHB9PeQDDA96Vv+ZKPsJQLxQJt0P97AMlCXrUgaRAkXuAnYQHQlgQedMYJdE8C
	 5fCLApn99eJ9SmsyPPWtHdLqIaV5YWkMdR9VnRD9lggNrlhRrs/uMqOJ9vIfA+q44bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNq+hvA9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmAdHEdM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C4606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UNq+hvA9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmAdHEdM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHtMAk861122
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=; b=UNq+hvA9A8DEwJLN
	NSYfFSTtglUNNRNcKnXpBoF+eJxXXmuGdMTgqw7kmS6wZSsb8jP0zZbtAYPZSzvI
	sKxCKw85TSNNzD8r8KAvtkuj309mg2YOI9eQdAS7L1XUYlYegnK3AIzwdnpPabzR
	ts1NDX3Mhqs5NgWyklR+me2lpJcGfo2BgTM6lffe6lljiqxNlxwjjqWlaMcYRcZn
	7/v6+pT603Hh7qLgcO3a3t8hIvCiz5xj+hQQuoDccw+7GKskfaEsyKy2wsD1D5s8
	e5B3IBFArInFKq54Cfemsc0cdvi8cf0svwEMsRslmd1Xlg78ZZ+q/UsIiFXWZdty
	4wjHaQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0h8ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:46:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so427444eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792705600; x=1793310400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=OmAdHEdMj1H6hFPAzdEFyjjbIiCg6eVtO+0OGtNWuI2w327goJQpsLmSAzm7zaktSf
         kND7Iq+oiX9witWYENMJF8Dtg/oZf1YqtA4bi8gCt6tlv92v4lL4h00Engje7logm0vC
         DCNkgCRWoqVnnsFNFkIMv6Qu+AkEp72HJn8tNyIm3mKv+V1sEDzE2qjmoYD8Xa9XCUQw
         hJlGc4dIh5Icg7LdWCQVrraQN2N42N8v9/2rcHu1SfJvu1RoE5QjCeH09ZkgmA8a7Nwz
         0nSVjMXAJOgh/0t9svlE5OURkz0uiH3WcpjevPMOzJ7fNGbwdF5IZ4/cHQQ9yGPpdWKV
         7YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705600; x=1793310400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QE+P56C2nYaSieRX/rS/N9gClwTb0YY8JP9mDQoasU=;
        b=zkwBQTUQ8ES+YHkea8bLlyzpBOFMfPi98br9E3RDw55Zg3U8yAVnufXkz/kgPgkvei
         sqbe01UgkbsJ71OZuh5v6dl8rDhpxSSE7ZmW+DiZyBDP50UAMSsy9BGCZ2gYnV6NiM3y
         xf03+4rAdw8WsAm6HPOEfUgA2Ripe/jMsVC5IZ20JUWptiGXRy3zk+3HAIu/95b4jUAt
         pdvtJXLmBRgji5O9Z/eH/JZO+YR8U3Z5Yxso5TrpzeKC5IBJyXwBvkK5ATtD8vnEwpBv
         z8MQiI97Ux9MQEz5J4dvceuEVpua2JJeN41ATfpyc/XxsXh5LEuLgDq9YJVlZvk3Ev0W
         mpFg==
X-Forwarded-Encrypted: i=1; AKwUvBwnMeTuM1PUUNS9jeOELI9QrRJJ/2NNTkCrzSW50DlFTy4kLqESD5f5aqJdMdXPW0O7RMUeKtsJDuNOq2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgWUgMc8o9ik/0HD/WFWn6U76XI/wIE4Kysh3GeQa819DC5TaZ
	FzQ2mdUCpnZMfL9VI106UVnwmHc2gxpBiHDXfARVSTJ7hqRhoFGcj1iaIKwnIb4k2Z2U+stPnMg
	HsxQsBXVDlcOGveRlb7qedT/nny+VlhG2fLxYrHCM9Fn595h5FNW2kBOk7lpPN7bUs/Q=
X-Gm-Gg: AYBFou1izgK1+ixmr56Q5SD+jzQvg7Ebriss3sOV2Sw4KbiOWHT632pOkgqRYkbhV+Y
	mlAJU4Awzx3KE8XMjPPPvmorp6W6aJhroQiAq+BVuKZQ/Ryr0ySiHcPlEGB3cGJp7mWY1Z+zM2f
	72ahWDfyZ+km8QWUBbXGojqzqN4XiL7lrdxZeN9paH/tH1D/FdVTgIJ5WQ+tQ4ogy/awyg5sbbH
	QRt/d2qCabRUenUnGlrlNSPDO6CiKaEF/M2t20ZyLir6mvqbIVaE5FOSs/xM4j9lc+y6/A8mETy
	RZuZSHRtfLzYESjhbzCUu52cScICIKnAS6I6EGgTQe18AuezCVOOSYwkcVMtqSonMExgM7HBbrq
	+wNeVovL+LLKYH7rpV0fOM0iy
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494665c88.41.1792705599650;
        Thu, 22 Oct 2026 14:46:39 -0700 (PDT)
X-Received: by 2002:a05:7022:1e13:b0:18b:48c3:287c with SMTP id a92af1059eb24-195c693fa23mr494632c88.41.1792705599029;
        Thu, 22 Oct 2026 14:46:39 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e9e9c4c7sm954775c88.4.2026.10.22.14.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:46:37 -0700 (PDT)
Message-ID: <fcb86c33-1893-47bb-80eb-20acd65f3805@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 03:16:27 +0530
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
 <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
 <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1f6db59c-b7a9-41a1-8022-6713365fa09e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Muh_mPlSBFFDUjf2RB2WKy6w2-2hNNhO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfX4Yinzdk54Vsw
 ZMOij/p7hjyCUBE4MuQGUPeSOdnEFTFXgEsFFb9N31JUgJdIgSZF9VT4nA/86sJd33XZZJ2Gbss
 X3K/IDY18lCHyxxEJLCrlwy+afgrN5C+3aWDqlTmjoC0dpcjFiK9b+mWB2mTt/vmxWAQVYlo+HS
 7bAVyd5eTdtRCZUt3avUPP6j1J8mo+VnFLy9+8lWyCbFlgvo41993cIPpZWGUMlh6KsbRf6QsAK
 g284UKYBJD5PhXU3ITbT8zNulGL//VDmp5ofkt6MbvLpEvvYPRWF8m55Te0++C9lCLirnmQxJ+Z
 pcJnP6DP84x023S6TfxjaoF9wRT23PhrjzWQ/Uw49ZZfM1iaXdyUzLQE1jF6DrsrBea+6L63hjZ
 CUTpDmWmRD5RyF1OnmJ2DVaOREAVEOZKL/U9+uevxJBGy9TtHco3QHJWGbSfshmuaCwhtIDLb6s
 RFJQmNKjjWsdSf+6kLQ==
X-Proofpoint-GUID: Muh_mPlSBFFDUjf2RB2WKy6w2-2hNNhO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NiBTYWx0ZWRfX9+sr/eoLFyxN
 1w6dCu4E+4E3h6Z4FyzNLhhvyrPHYR4qU9TH6DpNfz7hHW8C6CCJldGzvlug1MxPSZAmhOZShzG
 df0CasSYJkGeKlc3lJxtE/y8iBCMXEA=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6ada8440 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=InArmlTPJEDsLdIP4zgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220086



On 10/22/2026 6:24 PM, Anna Maniscalco wrote:
> On 7/9/26 9:39 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
>>>> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>>>>>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>>>>>> In order to associate the SID used by LPAC to it's own domain and
>>>>>>>> context bank we need a separate node on the DTS.
>>>>>>> Can we use iommu-map instead of adding a new device using the same
>>>>>>> addresses? You provide zero explanations, but it seems like you are
>>>>>>> trying to separate a part of the GPU into a separate device, but it's
>>>>>>> unnecessary.
>>>>>> What I was trying to say is that we need to map sid0 and sid1 to different
>>>>>> context banks.
>>>>>>
>>>>>>  From what I recall, so long as we use the same dt node, the iommu drivert
>>>>>> provides no way of doing this.
>>>>>>
>>>>>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>>>>>> and secure.
>>>>>>
>>>>>> The address on the lpac device doesn't really matter. I have very limted
>>>>>> knowledge of DTSs but I think we could just leave it out altogether?
>>>>> I think, you were poined to the Glymur Iris patches. Another option is
>>>>> the QDA driver being submitted too. Both ot them use iommu-map to
>>>>> describe the same usecase - a set of SIDs which are used by the device
>>>>> but which should not be a part of the defaut set. With it in place you
>>>>> don't need to have separate qcom,lpac devices, no additional properties,
>>>>> etc.
>>>>>
>>>>> I'd recommend following the same approach.
>>>> iiuc, the conclusion in this recent thread is to use child nodes for a
>>>> similar case:
>>>> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
>>> Let me check internally.
>> After a brief discussion: it can be either, depending on what suites
>> better (and if you can persuade DMA / IOMMU maintainers to let one extra
>> bus or not).
>>
> One thing sashiko is pointing out is that new dt should work with hold kernel so, in general moving sid1 from there would break it since old kernels don't know how to handle them separately.
> 

+ Bjorn/Konrad

Not sure how strict is the requirement for compatibility with older kernel version. An
option in your case could be just do an override in the board dts file of the
Steam Frame.

-Akhil.

> Not sure how to address this.
> 
> Best regards,

