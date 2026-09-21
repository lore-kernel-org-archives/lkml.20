Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CF44B5CA2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003879; cv=none; b=pmSTetREhXddd6PfSh9+NqX2YSBia2lirq9yj0sZqusa02Z4lLxIlLhN1IhhAdBV+5VmpXP3NEh86qA9duWxGDxme47B4w/4loDifgERWaelyiHPkLpLmXhH1pgaOuj9uYR10O4e7vsTEblXm2TsWJ5cToHvgEhnjejW/WmtF+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003879; c=relaxed/simple;
	bh=wL7ViQpOBQrR1TFI9V+XKos7/PiVSTRxCqAW2yNVG+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvr7Qbm5lehtmlw1AQjlaTP2Jnt65a8hFttw9AL55kmi8nRBRRbY7XDemV6BjBCjkl4iarZ+qVllJb565hPyIoycAeHtEX+k0kSqYsLxnKLde4W8NdmmmaFmooz9vjmwqYjZIifoTenDoaIItQd9+g65qIJyHmWYe7AZIuin0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEEDJvvn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4chrIRt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEEDJvvn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4chrIRt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA4672690666
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lC++W42u9nXMDgVyRufwTJ5gNRl3aQXIvbYCUyx9A0M=; b=jEEDJvvnSuuAqf4k
	BOCUoTtcZ3OXaYsV6vhNRuyrhmvayLSeHO6i3RMbBHL0C7eXq8L6Bg0LRqk1gPZF
	zIh3OpoalkeT0DtNt0Myo1ZORVe8PlgxqkYWfSkqHOg9qVaxAwNkznPhF93TDbnh
	/t+P4LiHBRSB/MMDhl1XkCNw+rMTg7b2OOySb3LRPRlR0gRaOuU/AA3JM3qYIe/B
	DYhJOhWDnZr28JyD/bQGwuOMtZraVo4Gk9RpvS66XN6u8p797aSFcYMQFLY7StBR
	FpxHsu0HwoIGf0lvYVgRvNLBf3k84RjjGw6KTRQR2i2sycRev47GDDAKpY/vP9Ox
	qe7jDQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wu2q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:17:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-791463ed29dso2836265137.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790003875; x=1790608675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC++W42u9nXMDgVyRufwTJ5gNRl3aQXIvbYCUyx9A0M=;
        b=R4chrIRt8mprrvBaTbFNZGWUwWGShiQmAJmOxvVaiNZxcD40HBsOYUJCAZ4ysNooBO
         PGjbnxyzPjFBJKo08YLyOBuHCa3fjUtuMONT66f8pNrxDP2CLhtSEuCsWaEsKxRMSby7
         jdzC9l/cHfqgfwgJpXgYjdhabhNMhtr8cv5qOvjLqGwlCBqDzvp4jdimYj1Up0b1srGz
         ij0jGcrL8bPfCvawTycWU3CEbsW4o7HBb33n+yY5o1Fv5sxLM85cGMZVvfdoiE324L/c
         +H3sMMezUsvX9KxuKFmfRTJ5cA1FMSEXSPZajR9fzSp3hpLlMNSzMTBT2ajCrJXGcoIW
         Wfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003875; x=1790608675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lC++W42u9nXMDgVyRufwTJ5gNRl3aQXIvbYCUyx9A0M=;
        b=p/ATPxXAqt+aUT31d0HtpNR7Ht0tODSSLoKCuezr4PAnE9B1LgZxhdvfrtlL6keFJl
         g3F61/kCDsWbPOdenpX4wgT8NYce234iGDOvHLRgaNJoQkhujJyHkz+EsYhboEBK7MI5
         6AkOPrmN7rK4jzhsW4iD+eHTakaffuGhd35SB1pII88qG5vAIoRqZaYF3jTk8F64VQpa
         bcO2XKpXRlCgaf7UZ5SVSxo72Fh9nwVqi6FV3JrfU708Fsb29BdaTM4riTQ0+3eM2KrZ
         LeFksvd7ma57jyVmGMxEW9RnU3Ga4KD7C1gEWH3r56XB4A1wxJOaJm1gC3vtZ9qZ05Vn
         PWLA==
X-Forwarded-Encrypted: i=1; AKwUvBy4eRb3c8CFZBVZe4ytSJ2+VPOzLY6+OU7xv2HyxLJInubvnkDbXclXldHOLNlbkSJLyiQWXEFjy4qNQto=@vger.kernel.org
X-Gm-Message-State: AFuF++kVE0oAZvI0rh3TOqGhcQCMIUOMEJ66H0Sx81O8RAfHod9KNaUJ
	RA9zM5jzbl+zhVlXZrQTrtZp0jN+fXd9V8/C3pLoHwkkvm5Mu2ZeoBGLzM+DeDY2+Gjp4DyiZ70
	kZZqTQObIZEfozB8sZ3m5pFIpZ35W1oEo0O3K9NHqgU+r4e1jbZbIkU6/7zZrGUIgz2Q=
X-Gm-Gg: AYBFou2mvOyKF02lZ1Nt7acyhAZZAZ5B/j+wh/2yupH3F75BZ1BuA52kPslAxQvgNAv
	H/51tzCRng8qEpr1USs5Lzrg0YpUmmn51/+3MqbVIfi/xdslpNeeMLZILxkBe8e50E4vTlarjru
	GQRUTvFn51HPME8MX9SoR9ebA/V1Fah8TwjPEjnqoCIEby6QU9ZjPY+pn4fDYCqWMYWzCoA3peg
	/geJBLBKtQFZNiF/maEfHpPUak9JR6Sax4dRORV/LTZzp0Qx3BbqVWO896rb56LXVQyxu6acevm
	VGcTNSQMSm/bCzQ6Fbs3z5nVUmd5XIUwgyIDKlv2Izh/qe5jYLJ4taQnM8sKUUbLws33gPI1u+q
	dkahEinAT/z2c8o1yE9z333uXAHon/Wnr/XrMsKgh
X-Received: by 2002:a05:6102:5123:b0:7a6:de9a:f4f1 with SMTP id ada2fe7eead31-7a6de9b098amr3369134137.27.1790003875410;
        Mon, 21 Sep 2026 08:17:55 -0700 (PDT)
X-Received: by 2002:a05:6102:5123:b0:7a6:de9a:f4f1 with SMTP id ada2fe7eead31-7a6de9b098amr3369092137.27.1790003875011;
        Mon, 21 Sep 2026 08:17:55 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm630198645e9.4.2026.09.21.08.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 08:17:53 -0700 (PDT)
Message-ID: <a51d8129-0167-4b9f-89d6-9623e4d41c49@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 18:17:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect
 provider driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
 <20260827-adept-traditional-earwig-e2c8c6@quoll>
 <4fc98d9e-5013-45b4-8fea-d0d6a8feea45@oss.qualcomm.com>
 <07aeb266-927c-46f6-8363-f26fac7e3aab@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <07aeb266-927c-46f6-8363-f26fac7e3aab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyMiBTYWx0ZWRfXzZGnrlUDDmtM
 J+PCficOVG0Ka/PxGocZc0sZhHpRVAAfKRcRnSgz/cIzyrbidEX3dGcPJGHcOyBc/gbO3ddnqHp
 wICiXfer7nghxXMFlAqkyw6Lgc/zuLdAj78oQYOs/lX8uGnV6a3bPv3j5+x8w5devBgQSq8VpQ/
 HzHqctB/gwCJzTlXLqYqzTAmsKQNR5oO4E5+7ayBAi/IQy5UwEhWGYtmG1iq64KEN+SgJndE4SL
 SdkTdj5fVpnnYCc+z64g5bV/n7c6vAClpkVEqcyL+HcoEDtj5ad1nztW/Hg9vAnwMLeL41Xar3e
 EYZbdZkEmT1m8RRJOTY4UCXP69og9o31qFNtEFbas1aIxSAE8VCsJzhRcRdOHOPvSpsCXGSVZsO
 Ew+JzUDAF5vOS4kWz/2/NMOIMsq+IP+tlw9uSH4O+Pc8FaKYtVxGxp4s0qb5MHkCaK78EaFX7U3
 xcobZKqMFk18yyroeJA==
X-Proofpoint-ORIG-GUID: 3nXIArPyLQk1yceyXBpwtFhlDTxtVQQV
X-Proofpoint-GUID: 3nXIArPyLQk1yceyXBpwtFhlDTxtVQQV
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab14aa4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pKspbupdq_hDdIdxj9MA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyMiBTYWx0ZWRfXzs+uPtrxiWUv
 h7zNHZQeU00Q2odXWqJoEdbtNt8M04ZZG/NVGLhI9CkqFVzdhQba8IwQL38gNHAQTohYfgBoNLB
 b6zNqC0MaHd5SBAgI0ftlguirSylhR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210222

Hi Konrad,

On 9/21/2026 5:17 PM, Konrad Dybcio wrote:
> On 9/9/26 2:58 PM, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Krzysztof,
>>
>> Thanks for the review.
>>
>> On 8/27/2026 12:25 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 19, 2026 at 12:32:10PM +0300, Atanas Filipov wrote:
>>>> Add an ICC provider for the Qualcomm Camera NOC (CAMNOC). Multiple
>>>> camera sub-devices share CAM_CC_CAMNOC_AXI_CLK; direct clk_set_rate()
>>>> calls from each consumer cause a last-writer-wins race.
>>>>
>>>> Each consumer obtains an ICC path to SLAVE_CAMNOC_AXI and votes via
>>>> icc_set_bw(). The ICC core aggregates votes (max peak_bw) and the
>>>> set() callback converts the result to clk_set_rate(). Consumers
>>>> encode the required frequency as peak_bw in kBps.
>>>>
>>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>> Maybe those series should be marked as RFC. The basic idea is to manage clocks as interconnect providers,
>> similar to this change: https://lore.kernel.org/all/20230512001334.2983048-3-dmitry.baryshkov@linaro.org/
>>
>> There is requirement to maintain higher clock rate on source clocks and some place to aggregate them.
>> One example is camnoc axi clock which is used by jpeg, camss, ope and maybe other drivers.
>> The interconnect has already functionality inplace to maintain higher
>> bw per request which can be used for maintaining higher clock frequency from requested drivers.
>>
>> One option is to use already available icc-clk provider, but we have to add many icc providers
>> instead one provider with many ports.
> 
> icc-clk provides N clocks, it has M clients voting on each one and
> avg/peak bandwidth aggregation happens at the icc core so this
> should just work - or are we thinking about different problems?

That is correct thanks for pointing that, i have double checked, please ignore this series new version will use icc-clk.

Regards,
~Gjorgji
