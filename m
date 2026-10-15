Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1F64FD26A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055899; cv=none; b=m0U3oBS7qUUIx8QS/kXaHSBxuDY7n1EJ735/dD3w2ngFlnH/+TqUDBMtYmVTnro89jKtloV6KfUCifHRKzYTJJxNNFWIstxbgsn6NxLGcK/HjkzXkp6soz+x6SAcilG6ZdvOcDSuqL/zmhJUsG/2Eo2Aj+PMTqlzVt4yXKacevE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055899; c=relaxed/simple;
	bh=Sd+z1p1eIGcL66guWgmMJjfXMJAZHEQ/jZYzkERfiZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DskeIp2gNdkyG8bToSpPKy+JJXWMZFjbIQRlpoRmX1NBohho6uPGxQVUQumCk/DH5M5eW6DnQB12KDX0wso4OXTmZ5nxVkDK/NeV7iFzUH43mpNlzfHpXZSwQGMR761E8BlqBUiEWs73VfMYNzghwb20JOs7u+7Tw2IC9HUFurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAAXBKHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JrYhib+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAAXBKHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JrYhib+T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F60AGB644564
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=; b=eAAXBKHGbHsEaIZ0
	ZYI32s/6R8DbStEZubiumXpOoNN6VzmLcS7DaL/64Z3Btg78CeprorwEnpK7WxZM
	IQrib2HXAKR0LJDEZXBL6crrIDXBBOHP3tC1qAXuCWZmvDjcd6+zjNj+ZFiD90iw
	wG3onEF+4YJ/cFgqmwHfp8j/ShxRSy7qWMkvySwwn6dEnlE2qI+GGNQsoP58Sxp5
	mVlZFG1y2/G/GWYP+olvAfREGrChMORKBMbxzjZsyYyiylovNfQG7tNBsafTqEuN
	pcaKekGfR/E5gM4KH/3nIx2kigRTMTuRwkqLZ9tYW8H6mKywj7kjDbXlKTxy/ACB
	mRfIqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya7v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso13323445ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055897; x=1792660697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=;
        b=JrYhib+TBSx/0wLXF/o50AnQIxvmrtdzgmPfCY6qH4VJKPqHGSsHX4QMDUXqqOJpIn
         jVQW/fNfiA7PDJFxlBpTmxHKbaYhOfGA0k+tyA95mB5w/ltFSNn1yXMeKHAMOqyWbTtk
         UsHf7IWFGeaUrCLngDWcemQ8FZo4fwzc4yq5Vfz2TzDIVy2hV+TcGM+bSKolCpV5w1s9
         ngDm3VMh+Z29e8c6WaCttg3lUyBEiq3R7ewoL+JzcdhJFLJr9L3KAXq9QVCUQ19tBgcW
         +eoDHKs2EVqLw5tmWRyz1mwzQHSlcmtUYUKKDSN8EsATvlw14VEBx+ot7IOcDQLTfpr9
         K0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055897; x=1792660697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=;
        b=jhCNToCTmtTDJ0xCc3odS3IYVcN5SxDTP4dWEQMjpw8v555/bQ6O0yKmDC9tbPmGyV
         tUmDlWTEugbMX9a+3cCnk7PIFrjyyQdQpxCXCWepePsHXulRZI4lHgeao51xbgqk9zXh
         OwKCjnIhLdLJ+szwsfs8SExZkg4NOtfM/zhYOZ+RI1EClGc4YmTGy1TJ7KQ0ZRpDt/em
         0iHJ9f49JQLbQ+eSutZpBW9Na27ymp5Ccq6KKmq2D7UOq4EyD6VZBU0mQH/aXGrgW09j
         e31J65/nn1EFTV+AeBFK3xUl6RM112yKMb9rwfJPB5sTonRZeP+4bY4Zf0Ggyqm44tik
         MNCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdp5f/oeT7JeRbTs+DLYcBjjjw/39C7BCwBA6vk8pPeT5tudG1PUXabhdDGP1C5yhp/aI5sFfOTFgC55M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGqthA+qSPYLsRn10W2DzEyYevFpPMz17akWsEHE1RqPLSCOjd
	KwcsPNegXjyuc23Gw3r0enUdiWpX4l25KeQQO9vfr7EiaMMAy9Uc/ERow3sneCXzsgo4HUL/6ix
	ykj0IjxJ78jyFKW4mYCvidWmxE2XhgN/kbJwTpyacmi08c8lFd1KbLCxg469G2tVER78=
X-Gm-Gg: AYBFou0tum7zRMIGjFiSSkVsnfmVg3iO8RC6wfuLScgpisx20WF3T/B2X4XR//bfk3g
	BuCID1RBttUHxBXgZcWz/CE0TTYsreIlUv5ZvRrNt1lxqQ2hX182AUT7rRYOMwVD8mdq1SsHBu2
	+GsgYSm5OgQd3GOngerLCTqRlkcbjRjCNDpHJlQM5DR9WiswNMvr2LWKyusDhAHT0gAgel9CJPu
	iM4ZvAKZy6H95Vk79dAs+jdhIIb0dYf9MhapCSyoMBJDRrKVA3Is6iLL0uWWHtvZzda9SpHyWzp
	hJRVxmHEk1tHfrOCQ16mypRda2BFEBxyMC+y6TDwtF07NGj7dNdPWA1NGhkEoqD+SA12lDaLe5R
	NV4Ya5V7V/q22zaDIsNsXm6Aab/fH/A==
X-Received: by 2002:a17:903:2302:b0:2e9:5507:b52e with SMTP id d9443c01a7336-2e95507b93bmr24796135ad.50.1792055896658;
        Thu, 15 Oct 2026 02:18:16 -0700 (PDT)
X-Received: by 2002:a17:903:2302:b0:2e9:5507:b52e with SMTP id d9443c01a7336-2e95507b93bmr24795605ad.50.1792055895911;
        Thu, 15 Oct 2026 02:18:15 -0700 (PDT)
Received: from [10.206.102.180] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1807sm79142365ad.43.2026.10.15.02.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:18:15 -0700 (PDT)
Message-ID: <2744aff8-9b33-4244-86ac-6fa70c052dd2@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:48:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
 <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
 <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KLYoDtdNo1NGt3GZZrHwPh55qhtX30f5
X-Proofpoint-ORIG-GUID: KLYoDtdNo1NGt3GZZrHwPh55qhtX30f5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX3pHGsvwPpbKl
 5Hxc0IP3W+okYU+XyrN6JxNU+dH39knOd/XBXBo0PJGnMyZwa5/yosEraPJmkcuDMqMjgaagiC5
 XfUpfYLjzaNcbqDEnzmMYZI2gT16kdY=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad09a59 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=N5pWYOkdc-_Srk-SZrQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX2au8HZ1KjVQZ
 jAksz86s1+Th58D6Qi3//cvxexh2OlQsDGSYMG/mlao6COG9wVAt5qHdqvj0Y6SOL0gnwNjUrFi
 pwRd7vZt0ZzCWkB4vOEXSkksF9yr5WPvvRSYcoJdZ1Y+XgLfi4Q13APzmQFLp+dfvdkMWFLVZlR
 /XYxanVy2phmNKCYLoO0W8kQtuNEhJHvqo/Dfz/C1MXdOR11p+3K/wqgFDnvL6aPJq9UnTr9xaG
 4HDhjOHfTpXLLFh0xRciM6SRJbOVsrPkf0pQnTipbgisvrUDC8bRorB2CvDlbEZpXIMmdTBe1hu
 dxZJsXHoNl27eYSYbnWS5xVtjeuLen8vvcpN+I5UMYvMv41q6dhRRKCzy/+x0SzLSv5IB1GBG5V
 U7NluC92vfCz0XhavIjydv3WMBQRHTa6wwg79OeQ77NFrsX22fJWdi9cgmR4Qq6Xf7l+p7zFosY
 9IvBbkRL8uhVCc0d3+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036



On 9/24/2026 12:39 PM, Shawn Guo wrote:
> On Thu, Sep 24, 2026 at 11:52:52AM +0530, Vishnu Reddy wrote:
>>
>> On 9/23/2026 7:17 PM, Shawn Guo wrote:
>>> On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
>>>> The nord platform integrates the Qualcomm iris video codec hardware,
>>>> which is compatible with the glymur based iris implementation.
>>>>
>>>> This series reuses the glymur DT schema to accommodate nord iris
>>>> support and adds the required iris device tree node to the relevant
>>>> nord device tree.
>>> [...]
>>>
>>>> Vishnu Reddy (4):
>>>>       dt-bindings: media: qcom,nord-iris: Add nord video codec
>>> The binding should go through media subsystem. That said, this series
>>> should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
>>> patches.
>>
>> Are you recommending splitting this into two separate series, one containing
>> the codec binding patch and another containing the three DTS patches?
>>
>> I can certainly do that, but could you elaborate on the reason for preferring
>> that approach? I'm trying to understand whether this is due to the expected
>> routing through different trees/maintainers or if there is another consideration.
> 
> The routing is one reason. The other one is that the split will make it
> easier for us to build Qualcomm Linux topic branches by pulling patch
> series from list using b4.
> 
This series adds complete Iris support for Nord and contains only the
binding change and the three related DTS patches.

Previous QCOM VPU enablement series have kept these changes together,
and I don’t see technical benefit to splitting this one.If separate
maintainer-tree routing is preferred, we can split the series accordingly.

Gourav Kumar

> Shawn

