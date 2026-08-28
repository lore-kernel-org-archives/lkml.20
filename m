Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34134305665
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924403; cv=none; b=O4Ippt34MS67zJdOB10N6lnKl0oDrvjY/qN8MLPl6ci6igRDXBuob5KcrBMky+v1alwwtI4RPgt9d2/dvOQx0XL4nYy/l9yu1G4tH4RPLPGdMkkFXmgdnANB6EkqF0HLUVm8/iPKP95yaRZRVlJwQAnSu88d/3d6wIZFRRCac4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924403; c=relaxed/simple;
	bh=08Oa4M1xKQtyo/O9OAWYLC/jmCNEIv8J+Nmto83jh8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGB69A+OSaXrPWgLdpzO5cuqEduG2l/uvEK3veRG49Ag7S9Fv6QPbkhAThCjkMJa22+UDA3BfQdyE9CSOTZXdqwLpXnnvAki/p7clfngZHsWpidcBBK06s3hwHqhPNBk7T2VDYmIKuw9KmSeOaGc92TfpCV+6fETGd4qUYD8DFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bf3YBmUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+3w8d37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bf3YBmUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+3w8d37"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDSXTp2928700
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJ9GTcTcIj+y9QHMjpA2GVuS6p0AVizNlg6ZRA4wA3c=; b=Bf3YBmUtBUCgK9I3
	r+BjFZPCbC3RxS8EPsWOPQQ2nL1Qo5T95LMgVHJJFudg+QiZvFzcDfyewKsOT1Dy
	V9WXZZjreHz1DoHmkciC6S589mX2OutBw51CMhyXAVf9uaPpZLLrAtulZESnezI0
	yUlZTvu/NOpIZNGYFSpf2z55GPnv1v0DHofEot+8D6slUk9xXJhZhtJnF3ANQXLj
	0G1zD/Bc7dvEnANwrxCcjiuLVbaINwZG2i9O3YUKlmNDt9uZfF96DRH6cZqDOOoj
	WbiQPfIQ4Fj7npwruP+4HTVz1WHb5+S87W436BPh0l5FFAEF4IgrSrQQrR0h+Oul
	kUQxzQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs21a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:39:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73966c839bfso23478137.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924399; x=1788529199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJ9GTcTcIj+y9QHMjpA2GVuS6p0AVizNlg6ZRA4wA3c=;
        b=g+3w8d37Ju6lDLhM2DEUxh6x/Z1ZEPCqqS4pqzEX6TmS/9TZgtNFeJcwBPmT9dDPev
         VWYOkzNRipX/+6zTadRAjRAmmc1WRThMh1WCm1GYNZux/nNFpgZJMdkH4dk0BgbmKASb
         6TfmAE25ml7J7hrojOzgLv+zQu7CJ8N8IjghBnpeeh9EhU2hL2xwfCpOdMS5T08Yrz5O
         2GpZ/gVYyrtaPEiuZkFMghiHX6YeBtahQqLSoC6+1q1p865x0Wby0TX9YOj2njcS07+2
         aOHP3gYR0oOYPEvP8BgnVFNR1zp64p5pZKmZ27IsgGt452MNIrm3tozflIEmZTAcQ3OM
         cc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924399; x=1788529199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJ9GTcTcIj+y9QHMjpA2GVuS6p0AVizNlg6ZRA4wA3c=;
        b=TVTsCmNM2ea46S2RDyM02QPI6hm5orbR8zST/XPD4ZbEhbvJPeyjCRKRj6VEdKorZa
         tgrnWSn/PxA2a0dJ6Ezu8wo5wGMNHthhy0b/vbZuv/XrJpMamh0BrMfym7UqHZ2ABltr
         NcruFYXHA86pOdESmbuMV3aTo/7VrI26eRGnLDxokrnKo8AHk9zCo6osMAYELFnD5U7J
         iOQeEQ6M8gBB7HJ2WtJ12Vt0f4TBVBmDDjFc9YBzRDrKfb1RfaeO9oQll9eNulsQbnC/
         lNxWnUbOMPhTG6RvYDcBv3UIySqPMi0j24Sar1EF5k0wP5qbJ4TYEUnFgRQusMNCWrGl
         lGFg==
X-Forwarded-Encrypted: i=1; AHgh+Rrw771BnP1dT6W2TX5xlOAk7Xy2XW4ULx2ruwTAZBmmvRnDqSCbFBhdFUMliIywEL/DRdiW5mg+/MWn4Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++lGFdUvK9ZnLgn1/XHsrze1icEo19eqJXeM2M0wFEWm6DYUUM/i
	cfCuNROrLWPl+XHj1dwWUWeC40z00liUhHrHBvHjqhlZAIzVh12iK4wUssyyk/a8/PdF30pZUIR
	ASbTyiBhIytaPbaD2MYXWCDRL2KTuXl0BN7hZfT8Q5x/qTxktlgxhtxFX0UklPJM9PwQ=
X-Gm-Gg: AR+sD10ivFBbZ28knsYc0m0Z4wMeuOYZ60djfsczvgP0sB5ADOWh/MlRRWkU7KUjlg1
	QEmBaWtJkWE1O6DUlQ/kVzA5dmap+nGVnuEQWvC/18VFwbZmfU3fTH3kPC1E3Evij4bpBLNwGmu
	2WXymTFp+AKXbEtuZjj1/Bg11rNDXBcpOts3tCKKsFqTJ4uDgpPRfYi40lAjet7OPZ8xquZ1v3U
	IcRl9+Ideh/FJjjZoXGuvAwNnFUWkE8/1XSwjQrGf6lWuxLNziI1Dae1y6sQyQ+9i6V1+RWHJ+I
	L8So4/dZQD+krprzWr24LDdXzsYDPV4F2pGaXWUXwa/QNA5ICsrj9TY928sBSQ7i53S46J/RFkk
	4i1nxHonOHfVEp4WwFOKOtZ4=
X-Received: by 2002:a05:6102:5806:b0:780:60ec:cf6d with SMTP id ada2fe7eead31-7859495c035mr768703137.0.1787924399355;
        Fri, 28 Aug 2026 06:39:59 -0700 (PDT)
X-Received: by 2002:a05:6102:5806:b0:780:60ec:cf6d with SMTP id ada2fe7eead31-7859495c035mr768676137.0.1787924398920;
        Fri, 28 Aug 2026 06:39:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm85804666b.37.2026.08.28.06.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:39:58 -0700 (PDT)
Message-ID: <dc897069-26ae-47f1-82cc-7a69ad58b654@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
 <b471a134-397a-4f0a-9d79-1777ed067c54@oss.qualcomm.com>
 <c9964dab-d396-497d-bb67-5e509fc8a085@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c9964dab-d396-497d-bb67-5e509fc8a085@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a918fb0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=REKBwvwMQCNLxyp5HFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfXz4bCYhlQFoJ/
 fF1Duu0HS/boXeydoe1KYsMXf1WxM7FmsLKFRItWdr0+Rcw/qumDZmEUtAzUHNRivtkYroenOix
 8dC5xBGAg3X9gYQ2+wqg+EmngVGePyQI/XNymXAHlP1d6W+Y+JRPNVcaqK49QYfjcf4vvdf95/4
 8oV0oj+tVI7QgQ0fHFdpGK3vIYqu84Cggfd125Y4EJI7TtGU2QP+Bzo5KCsAeLNZCYtXA9XtGCz
 R0+49m7biHLSBmFut2V2PP9XFmAyiFJAHR1CIC5NFLPDo6F+SGrUR74zmAkd6XU3DGZvjj3tWYe
 tYPFDVoJ/iycrabDqB4PcmoZbn3VKV+uQKVCPLZtEu+aAsjLP/S70nFNGFxcRizKWz+I7R7G1R8
 s8jGLid0kkQ/q0+yPIrBgAPueuHRmf3cZE/jkVokEIeKw72fxpzo3Fbk8NQeoOAMwxcN+fETbUq
 VyMOFoA8pdLi+58Obhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX943xcVEYXn5/
 wfta9VI5IMaocKoRM/imhi8ki+r4itkAWoUTvPHbFS3WXSxesQ+dF1SfVvXFNAYufZUOgqduVXz
 qloLZiwHfF77oKfe35UkHNrfpJ2Bw6k=
X-Proofpoint-GUID: 0Hytb7HtUbuSi_kj6Devq4A0Mlxy6HLp
X-Proofpoint-ORIG-GUID: 0Hytb7HtUbuSi_kj6Devq4A0Mlxy6HLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280118

On 8/25/26 2:12 PM, Gaurav Kohli wrote:
> 
> 
> On 8/24/2026 7:47 PM, Konrad Dybcio wrote:
>> On 8/9/26 2:29 PM, Gaurav Kohli wrote:
>>> Unlike the CPU, the CDSP does not throttle its speed automatically
>>> when it reaches high temperatures in talos.
>>
>> [...]
>>
>>> +            cooling-maps {
>>> +                map0 {
>>> +                    trip = <&q6_hvx_alert0>;
>>> +                    cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>>> +                             THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>> +                };
>>> +            };
>>>           };
>>>             mdm-core-thermal {
>>
>> Should this sensor also be bound to the rproc?
> 
> Thanks for the review, Konrad.
> 
> Talos does not have a modem remoteproc device defined in the DTS, looks
> like modem support is not present/disable for this target.

My oversight, thanks

Konrad
