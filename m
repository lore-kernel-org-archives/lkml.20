Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9249A3A4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715343; cv=none; b=NX9K3SVFfQJn3pLs2gHqNywDpvBZxEeGxtNPX5lKHGpfCwlgh0kL7jSmOnjCTal1mMJDeezAa//ZWSYW5gLp6/fv51V6MOkw3vnytU0BHE/soeP6m3QHxde4qr4qFXtwP933B5DEjbkUsj5Vh4WiQyoUGMFgda6mXFqScFWOeOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715343; c=relaxed/simple;
	bh=p4bb+zBHJnPJfKQ3DuhQrsQU/ybQ7EqVzyn5dFbuHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcrw1DPGdUxtTZYKNoQ7ZUQsizmpaAxfg35USIdhRXpbvsVHEbz6mum0KLu/gt696tq73DsFD5oMN4wYYQhIoNVL4OgR8bMhETTtvY3ryuFcQbyBsTn43jc5TGvlfmUOzzy0xO5UmMOGYZVKPWbrlRVquZOEsUkQOVSVw00pa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo4xVFpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QS2dlw8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo4xVFpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QS2dlw8r"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I608Ys3945082
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=; b=Fo4xVFpkxpoSCjRK
	KgUO6IPDONUzkS2JrL1n8IlX1/L6UEQQTP/FVnL9xCFhINyFGjBSoYp7TG8VgTxG
	XudK7qVrlKADe8oKH9Uq/aJQ/4e3U9LASuJvTJV8LmA98thSsyqfkdmldfxSiCBv
	wwzIT5qVwAT8GdxkniFxDeZ56AL3OVVsdTvZEQS805Qao7P8QqaxLYnh9bO4jscP
	JA7KaJlAbLzfnlKQdxTIvbNLe0K6Fg2Ijgi/mB0gxp/2Kuk4lPMhxzgWlGqgcLbr
	raD+2h2RL+WYQEcaHi23pisKfNOfb9k04T/J6/3RuTExEs8oUbVt1aqseBAGwkZf
	PVnd9w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt3p58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:09:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ce8ad8002so9783006d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789715340; x=1790320140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=;
        b=QS2dlw8rsHaH8Fdx4v8/5B6Uiif/ejETRypx7hzpEjAEh9yRHumS3+LBhUC9kNJeTd
         IgaZWLlgJBnEPIq5ig9BYME4kxFCnmL+BQkaXQTmQY8z2JKRwY785w0nyXng3E6oQ+++
         w9JaIK5PWsxVPrLHVuSD0+7/PvsQYtMwjdMLhQ7pQZl2e6r0Y8ygnl4tPzzzJzQikRVn
         eP5DT+lrl0jdrkAI9kq5/sbAq2ev19IaE9HQIi2cpIsAd5laeolifk3yIlZSjmekDkBz
         OSCtl7v7293zkahVCarpY1UyxDOPtaijELV8tLAMp8Upar7K7u7i0EJJ7Pxz3UxzjyXW
         kICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715340; x=1790320140;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=;
        b=Doin13RNNcfBo21eAbtMMjIh38ZFPrSqp4jR++xhEB4XzZ4pI+cMml+KVkr1xy97vn
         IJ+HpuucgVc4DktfcnaaIFbD+fXuJyIlDyiXcj36gqIPjSEw+QZ767PAXlfiw6bPnZWD
         Y33+pljQSwvrC52avHfNkyFQYYF5tUxtDrfTd2KURcOgp7+ADCWVSoZJlnK7dDOiwihv
         zZCN+U7gviN1MvslBVADnI9NezoSnqspTudoxfdjQFaCFVeK6HJhqpDh+096ozVTTFKx
         V+lD/1T870+inSsZjL3s2bRXpSOgNP1Yt0gM2IWTLO1GFERW43NIZ+z+bm4YeVQGWvlf
         cRFQ==
X-Forwarded-Encrypted: i=1; AKwUvBza9UZobbyGqJkIWIwtLlWAtmkZN+UqNkntNakpOQKclm/JuKPCIDJRYAvPvhSl3VpIjZCf2zpozBATqPs=@vger.kernel.org
X-Gm-Message-State: AFuF++k4/4avhFEBJZLMe2a3WQKZgJW7VrwiODiEO8Ut3j2CHh5sBXPM
	oBoG14J8v3v/7ggRPvLdrNhdwJHqG8wAC3mrj81mPjvRwclYvnKd7/TuNd1Bry8m8iC2H4dezls
	q/n0Gqj2+jsKYT+MOIukFf7mhWbGsO5Y4w5H+mEzjAKYbiMTZ3CnfeMjT8LeVwYGQ/ec=
X-Gm-Gg: AYBFou3dvHgJ43bqUtkNbyGVlQZ6m6PQJKlquHZE4PUjkj0bMlQsPcySByzPJvPymeq
	MyjeCoO7TZxsZKISh23cxGhTux0AOp20+Q22W9tQwhGZgH0mXCr54G42QOss4/pm/uH/cWUXvX7
	mvYMVtGenmKf1EMaD/JhIF+GNF1yCW4q/9bjigPGx2gqUgnVykEKn4gZchQWnOiaOh4ZJcVfukB
	ISUSKvZbPkgRNNuZQx9cVJVoRI60Sdpc/Yww8PuEPOSTn6C8YiTaIXuqshB940PU6xBVUXvgihE
	XrRaGq9j8r0MVAVlI/vAlcM3howutaX+cA0vQw7Ld9IOAJyUVNTcDLxRsR/1pYjGT0rvxO+2QxN
	Ra92dQYVIqpkRx+T10wDGYEHhJjEp7ZDSVutzJn3m4uvrdS97WiU7BN0xpfNYkLYC
X-Received: by 2002:a05:620a:2713:b0:936:623e:2603 with SMTP id af79cd13be357-93bdc6988f8mr194507985a.17.1789715339630;
        Fri, 18 Sep 2026 00:08:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:936:623e:2603 with SMTP id af79cd13be357-93bdc6988f8mr194505585a.17.1789715339162;
        Fri, 18 Sep 2026 00:08:59 -0700 (PDT)
Received: from [10.111.172.118] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91258056195sm6164066d6.29.2026.09.18.00.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:08:58 -0700 (PDT)
Message-ID: <ebe9f27b-4eb2-4c87-a02f-78961dbc1827@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:08:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for qcom,nord-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
 <20260917-active-strong-emu-bf8fbd@quoll>
 <d89a7376-ffab-405a-a3b6-d3633cddd063@oss.qualcomm.com>
 <f6cb2a51-b385-4203-bd33-4b789cac5616@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <f6cb2a51-b385-4203-bd33-4b789cac5616@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfX5+/6ab8vS5CZ
 C8/erzRyCb5uDgZJJUcNyMFGMqagi6F+gOjlNmIGqUounKpauw2xgstq09quygP3lL9hNjtUuex
 3f+hSDxALwIqC/P0pPD/5HXBByvsdz/WX0uwCUqRGOngIJTNhhDL7IHNqXzE3SHrMtwKMsRQXZQ
 FkRbZ6zt6sBRs4JEHJH4709mqChGbm+UtHr6LJOoDqRR8C2H48vRCJSiCKhSBjJb3P5WGq3Jiph
 ZHdlzC7Rq1Phe7gzucnOdx7MTmWUKSSZGZ3x12t17KxmuKUYCT0Qj6fo6jAH0FxnRHKAeDokcO7
 ORiDJbe735dDy/kYKlYin6oVwA7X2VWfmiKywob9mDVvXa815Y+okosClTQg8Jcxo72wqZI7+9E
 DPfdoV9FHaBLqQUJtmczFP0Ks54XdTqK3PUdywAImUoCJNx55KWtkXdJoijhzthXr8fy3TQ6PXw
 7M0TPrkwYHFjUsGePew==
X-Proofpoint-GUID: knKKmAlCfr7kguVor08OzmAQvFk4HgbM
X-Proofpoint-ORIG-GUID: knKKmAlCfr7kguVor08OzmAQvFk4HgbM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfX0+ocamwLyJOX
 z0wc8uWkbNmERRS2GuSMIMPipV3hb7UtIMq4EH7wY4fxgzBEQJ6BxUDHxo1m/xWjH11ao9kuski
 4YC9V7cPFqRuO5OVeaoa+djjFCIu6dQ=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aace38c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=qU0-ABsse5SAqXbbjgwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180095



On 9/18/2026 2:47 PM, Krzysztof Kozlowski wrote:
> On 17/09/2026 14:37, Wenmeng Liu wrote:
>> Hi Krzysztof,
>>
>> On 9/17/2026 6:13 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 15, 2026 at 05:34:11PM +0800, Wenmeng Liu wrote:
>>>> Add bindings for the camera subsystem (CAMSS) on the Qualcomm Nord
>>>> platform.
>>>>
>>>> The Nord platform provides:
>>>> - 3 x TPG (Test Pattern Generator)
>>>> - 3 x CSID (CSI Decoder)
>>>> - 10 x CSID Lite
>>>> - 3 x VFE (Video Front End)
>>>> - 10 x VFE Lite
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 +++++++++++++++++++++
>>>>    1 file changed, 393 insertions(+)
>>>
>>> A nit, subject: drop second/last, redundant "bindings for". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>>> See also:
>>> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>>>
>> ACK
>>
>>> ...
>>>
>>>> +        description:
>>>> +          Input port for receiving CSI data.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - data-lanes
>>>> +
>>>
>>> Missing supplies, altough maybe this is related to some other ongoing
>>> work, so would be useful to see explanation in commit msg.
>>
>> At the moment, the Nord platform only supports TPG. Perhaps I should
>> remove this part of the change for now and reintroduce it later when
>> CSIPHY support is available, once the EVK board is ready.
> 
> Hm? So you added hardware for TPG? I do not see how such hardware is
> useful at all, thus I don't think we want the bindings for it. Bring
> real hardware, since the bindings should be complete.
> 
> Best regards,
> Krzysztof

CSIPHY support will be added later on top of Bryan's CSIPHY rework, and 
the current bindings are already complete with new csiphy rework.
At the moment, no suitable hardware is available, so only the TPG -> 
CSID -> VFE path is supported.

Thanks,
Wenmeng



