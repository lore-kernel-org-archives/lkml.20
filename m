Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60144A7C9C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055204; cv=none; b=R92qc2zKRb5eVCdAQWilvgp+nxRgzZJ8fQHHOLgvCDXvBP00m32RVbpyy4YNClCTO6Qncfeq8f7T4m055oppHZRVoFkMbIt9dKPISLdb+DRiHlZ6WIWbIoyKuP+SqRoxRyBlcaOBoFDWyZr+oSODcJluFOr7vAwpR2OiP/Ig6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055204; c=relaxed/simple;
	bh=hRvmS7HUGoD8xJPe1ZdyMzwjqKR/gvUwFIWJ5Wlb7gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICteJ5G+XFz3fVOg/K6tcm8KtMEtjqPxllMEwz8c5N2jNhk5TU9YohZZNCdGk2cmQUNnWCHHkBOQtd8zIHVzuuP2zIb34c9G3z/jDzXnO8/kaeQ7FzCDRMEEovsjKq9LGBGFsTh51cSpCjxD/K/U+qCvR+LNLPHzL7qTOLkZ7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWuzVa9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb9coyoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWuzVa9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tb9coyoy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6img21672287
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Io4/K9Sj1XWPi0z9IBC3bsZlbFqJq593ZpSHYazw4OM=; b=mWuzVa9vP/kfK4Ze
	sDTpL6cPo1nrikdg/NS39MX7mhV2JRjKl/LpcQ2fTmFzKTxx5Y0IhWwnkUTu7KCD
	BNpaHIgHzdOddPeH36KsI1kJ6AQLl8JSyZLoyJS3d4RmSXoaJrFl9g0EoxkvAe9b
	BZU5DxCPMc9/kNHTYohR2sJNJPFtOKjwYFv0aRFQ/urP1ep015g0w3AGDGLQF5hP
	LVjBmDOl5NuTXR0e3GcZ4Lq7CVsg0nGP2PNPpFi0clsUGgq5A9+xwgL69DwsQsS+
	WPvsAQPlysP+qGG3ybjS7JPAKdeCxmxwrGEo//z9f5btISh0q8bofYD7gs+HflDk
	BGvCjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbjs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:06:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so2646421cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055202; x=1792660002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io4/K9Sj1XWPi0z9IBC3bsZlbFqJq593ZpSHYazw4OM=;
        b=Tb9coyoyDKNux7BeumhjIAnMfBlY+i190ULR1pasHFElBL5ISYt6L7L2zwel1hsXaF
         /0OafpZb217yFq/kR1AJJnQ2AZVnJqxQmBusV6X5n2jFhJCwUJGIUdI4QtFZe1vmsbQW
         vc8Od1a5SuaXp1VyKFCtlxnbsjyIgJhBZ2Jr0rE+nel3xinWRXjDu1ExTaq6+A9m+E+G
         yM7V8w5bwFLkeP3zIs6tE00HlOZeJVrQEKYTml03hmd4kbErEesFTzshZk1nYAwqw/Ol
         qABRWn7d5FwfsPFsXV2dx7+WEUr6K6Ng55PHj+9Ih/SNbgE3VqPCvQKHoYRwZcfAI5uf
         4F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055202; x=1792660002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io4/K9Sj1XWPi0z9IBC3bsZlbFqJq593ZpSHYazw4OM=;
        b=Zk2eWb1CbeUggEkp21cZCvqgvgKd/zS9ssecb6x/oL95eYl3lC/QVraq+ZaaVrpgTZ
         46GuZfpx/RQtSRKIUIXlDfs2VMO1tgVjXFnYE8UGVKaFWPA9ReEGwYXFOmYoMuzvv/uk
         XILJJG1zxAh3dprmzbpMFcCbk12Y7FFBKVYeW+gpm7l/6DQIuT6v9jEulkLFrXEjSPw6
         daIL5iCIoSYDP3iZ2JLjHNDdGKMU9UUo/3lksshYdaCRAEE9XNaZnFLzZLoOtSVAno3h
         TPD745lgYPy5zQoActNCaCWCZsUC+xN476mr6HVC/83bIXkTH8GtwtzlfbkIoAU3/yTp
         O6RQ==
X-Forwarded-Encrypted: i=1; AKwUvByYdK9TQBSU3EFQifePhSE4by/2jDafcfwqWcmn00jZDYLbPgQmtPIXYOWONaGLNAH8cnDmVtro14Y4jeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh0CdxihG+wvsf52bqLHLF/nE45ER5PXcFZ0TzC/l71x3bsU4G
	l2+MmCRzWyBKbmLe95w2n0X4QvSi0AYaPD++P0zbq9V7KNdWOfGoBxp1aqWou55HON332i6quMV
	qyHuXz7c3ZmnW+cdwHyBf1XAgUvDQNw3B6V1Q/jruEvcfiLFwEnhUstOuz9xwxgTswZ8=
X-Gm-Gg: AYBFou2xkKWGTO6TphQs9D3k5E03LtUqG7P6cs3pT04TLMet5xERSIth21lRA2jYS7+
	6vlUOCPAzksn5w6i2lOZIKbXW7U0CJ8mrdcdsesSEKQlm6LcFzHUzwcXqid4EB5eSTv3Z83+3RN
	eQirNXx1mhqlxMeCY4UVAHS1UIJhmxTnHsZa/U0d4FHdf3G7Kv1O8hT87v3/OgclM9N+J/mUOYC
	UqoEbkaj+0PQuakGn599xZLcEq81z0q0I49b1fm0S4rxX6HnjNgcg8cQiIKKcj5MRoNRAa4mMuq
	pAa1bvkqM8zaaG/xa1QRIQtk11CgScHSWLLGvdQzI8zGimocBRUnrTwxXGb+K1I0sCgk50sxZsv
	gHDEPdZNY/7pUF1rYFaRLBQ==
X-Received: by 2002:a05:622a:1487:b0:535:2447:3cff with SMTP id d75a77b69052e-5359fa5726emr359124221cf.3.1792055201841;
        Thu, 15 Oct 2026 02:06:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:535:2447:3cff with SMTP id d75a77b69052e-5359fa5726emr359123701cf.3.1792055201159;
        Thu, 15 Oct 2026 02:06:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6bea622sm100933166b.5.2026.10.15.02.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:06:39 -0700 (PDT)
Message-ID: <1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:06:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
 <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
 <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: q-RiOqJWAXfDurTvy1cEFCiiRwlKaos_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXwCA2jVx0Jvvc
 7xvlAq1frbv/rJoSm1Hr1c6MxkKmvV2IOgAKn8kx/69qFlK6HZETS5hyEg5WGGqydjUooczXUa5
 4MddRypI/AoG5tVYDfzXXe45zPTUoZ0=
X-Proofpoint-GUID: q-RiOqJWAXfDurTvy1cEFCiiRwlKaos_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX4mmDkgEFQLFB
 DzNX1lC3jquV4tOIExjMSAxfgZeu2FGhyya4PTxN0B5C9UvkfJXJFc4Pj+UtZV4+xX6c4rqvNoB
 C+KoCsgulZtqERJPFVVw0BTvnHQJNR0+ZLh4Uua+6V4cplhXuB+W/QO5AgsOFjrZIe6ljgY58VD
 CQ4kflmCOyavUiv10Nx9Emj5d3eS5jcN6OwN2wf6grKoHdusb62kID6mSktH1wDOGMh2+Tj7iZa
 mZ0mUqnlkI791voYeAesv/XvHXb163v2iGyQ8LUksUnuGgojvgsRt/eQXbiR6umHrosM6OcQ3fU
 7oRsXR/jNo/m5IYGzsErnADYyDs9Z1Op3fiGsAHK+kzBr3jqjxiXYpFmJtkK8H4/8fqCfCY3CVk
 U3+P+D0/yb3tXRuLW+TGZl0okTc07bt901F1gKAkQW7BJHp1d9pFQQW6YuKK6qMzS4t6N66A8yW
 CkY1fs5cXehebNepjcg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad097a2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Fxoanj2GYMTtFSnlM7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 4:26 AM, Jie Gan wrote:
> 
> 
> On 10/14/2026 9:23 AM, Jie Gan wrote:
>>
>>
>> On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
>>> On 9/22/26 12:35 PM, Jie Gan wrote:
>>>> The APSS debug block is built with CoreSight devices like ETE,
>>>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>>>> ETM trace.

[...]

>>>> +        tmc@1d029000 {
>>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>>> +            reg = <0x0 0x1d029000 0x0 0x1000>;
>>>> +
>>>> +            clocks = <&aoss_qmp>;
>>>> +            clock-names = "apb_pclk";
>>>> +            power-domains = <&cluster_pd>;
>>>
>>> Is there only being a single cluster_pd a mistake on kaanapali?
>>>
>>
>>  From psci map, KNP only has one cluster_pd shared among all CPUs.
>>
>> Hi Jingyi,
>>
>> Can you please help to comment this part?
> 
> Hi Konrad,
> 
> We have cross checked the cluster info.
> 
> The PD configuration for these two clusters is identical byte-for-byte and is based on cluster_cl5. I believe this is why they share the same cluster PD.
> 
>                 domain-idle-states {
>                         cluster_cl5: cluster-sleep-0 {
>                                 compatible = "domain-idle-state";
>                                 arm,psci-suspend-param = <0x01000054>;
>                                 entry-latency-us = <2150>;
>                                 exit-latency-us = <1983>;
>                                 min-residency-us = <9144>;
>                         };

Right, the configuration is the same, but ganging them up in a single
power-domain prevents one of the clusters from going offline
independently from Linux's PoV

Konrad
