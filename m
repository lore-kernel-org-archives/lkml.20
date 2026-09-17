Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C9A4D599E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644454; cv=none; b=qqdE55DPz/I7CV/ZQ+X9Cuer9+vILJ8j7Qd8b+L+Xx+LjjWb9C/W78UOpyRFiRmC77snOZd3jAEbja8ar00c3aswAbRUQcA4P9u4evFHXTI+rJ094Vb0sFOKQ+64HA4kF54WWIJBcQOAXJvU77bcCcth05kgQdKztBm7I/44pUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644454; c=relaxed/simple;
	bh=tvBGyJ4dxXxCO26z3NZavLcwUPG5Qz2od8odzMP9V7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ahg9BWlRncEbxsY3js7BvYUDUleg3p4DqkOosllHsVJZRGZPqMbU9zS7Gv1bqfCErZB9R6M89rUPvo5Clj8YGvuObeTajkOkYaWTF9ktuwnWNDUbMPpfs+WZbDnRY1bjVlZ2HnT/LcZTeGIn6JDcbOnBnvXDzZA7m9vQYyeO1g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+l3vPKM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXXMbnWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+l3vPKM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXXMbnWf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZoC11698624
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgcTSEHaAwYct2xsNsod6FocmTJhW8Zm9+CguoUYFIc=; b=S+l3vPKMtdLsbXdE
	5gYrNuZK9xoaXKeb+M97XMw3nWWKgt5Q0UikL8dNidESMfFWuCzPyJpo5p/CDoef
	z0frx4nvX3C4ukVntu68gW8zSp61ulPyYZF3+vHMImReXAS/OZWq8NhMKvs5+KUa
	i6uXUd6GUtcJzMb81zsN+0bPfYsMCa0uoGbA+rbVRMH/dNyQu9cbgK2A2jVN3WWh
	unZ31ZcLAn6kxlR7QA3BZicx/mVnEYAXYMAHXXFQ6zjeYN4/FL0PBeYViJ9v2nf3
	HojgE5BQujbS35HB8pnFiz6YHVBlCTLdM+xitpM3eBUFX8vv4j32ZAQmCfP1jhwO
	X3zuFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayc9h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:27:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so21181585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789644451; x=1790249251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgcTSEHaAwYct2xsNsod6FocmTJhW8Zm9+CguoUYFIc=;
        b=CXXMbnWfZZQa6oTZwUkLAsSeaasmRYYFBrxxtLj2CUg+rEl5wThCUqZ346CQDVXs24
         wmxguZpMVoLeGsu2z9PwCji9v1+aUfjrhiDasJ+93GWERGRgfFtOHgRwE+A66BY4wfFL
         ClirWX8+21VL52wxMVjZemoJ++cjzzbS1ur73BrLetETUhCvfZFCfsuQG2XU+oMIXP9N
         Db+BnDlLLkTVZu3RV935J2NGcEfa7WWvJn9pknJHbsp7Q0YIMD5EMMjJj+7YBpLPXcrq
         HVddxquroCWVb2uEWF3CV+XoBPG8Wzm+FfBr/Lt5iE2h7HPD4yt85DVZ+gXZF+KLo2Wa
         8QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644451; x=1790249251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgcTSEHaAwYct2xsNsod6FocmTJhW8Zm9+CguoUYFIc=;
        b=PJv0Cxvw9OUwf8yiWOdyEWViCsRMhYGzfOU+BVu8quAnrwpoZ4p3soIHVHiWWU9Swg
         Xvuk9dJQ6JiOIDewCIBAZdNQHghFNCDyZMcGFzRfu02Td8+4mKmw+YH1k+50vYlJxYj6
         2HNZ+nfw3qLfZEyI4TTdlrLrdk2DZvJss9PdbPhFg56A05nJqtaw3jyIN5IRadVClE3P
         7ycmlWcyOlW0OtlqR3oRAe/8lfJoDWhG1hmrTox1xviqqMItRzucC9c7p4ir/ZroXhOJ
         v4CmjhQMQKpHkUj0x9iVGGqWmrFkpjlZRzr+a7oidxpS5xEA09NXvQ6aKwKTWuojiVcN
         zOxw==
X-Gm-Message-State: AFuF++kuNuCiRcvZGJJ8EfOTxws/1VuXXE7NS4gasrjI0y1TJ2Fvj7Kn
	hfMF+tcMBp6IqnUOxJOzQP2Hu9lAiPq9/cNx/wHuY9H/G0I+GB1Az/ZGzKidURuZMu2d3lqm8pa
	hzsJ06ke5j1wEzl9KkKvnpiikRiOedV5NzGrMcv4bheAtFZr/rFTLabc9lXcumcQjBDU=
X-Gm-Gg: AYBFou1Vke69jOztEimLzev+GSf0szg1HBklnaKJewDB/B4SaQthUoXD7RsBfEtSbLJ
	45YkzgmciOVj3+xFBBjJhJyhMJYN8t63dt1F5PvZnvtfkGK0i4MpWjencWr4d/0Ozl/wW59ssmv
	hKjFi1zkoujDqio98WrD7X0GFoX/GpY+H84FSywkVqtOHj/Zqlc1X2olSK9nHqYK5Udh2UuNrl5
	YAeRoMMaeyibr5JloKsmzbUUyo1SV7wHr64fVmhwvlWUyB+pHiIERBMakmCGExuiFHu/KRQpf/S
	N7riWA2+NNKTs+zI2ERAxZ52WLMnhY4pGhq8k+ubY2BEVKyCGZV98ypjoWOa49fs9XZ9iOCCYO9
	8oaX570c4MSvSXWwJPf7zNQ==
X-Received: by 2002:a05:620a:2b91:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bd3e63ae5mr76971285a.5.1789644451258;
        Thu, 17 Sep 2026 04:27:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bd3e63ae5mr76965685a.5.1789644450669;
        Thu, 17 Sep 2026 04:27:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4879f1sm283709066b.32.2026.09.17.04.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:27:29 -0700 (PDT)
Message-ID: <4d654b9d-4940-4f0b-9428-6332a5223d60@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v5 0/5] USB4 mode programming for QMMPHY on X1E
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
 <178929702551.215437.16496561815731000218.b4-ty@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <178929702551.215437.16496561815731000218.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1OSBTYWx0ZWRfXztD2une89o/W
 B8mx2qcsEA5b0sRloGC3nUSKuE1ubAUe3mpLBNRn37+vEc7zmcrv99FCK50zkW5tOufaOGJTEI3
 BpWhk5Om+c4o1DV9Z/I2duEumU5PMY+Ef3bT+kcCScJNps7NTHpy/XQf14e1Wa3V5KQbx/z91E4
 vStRfc3br4EGEYPhAkaSSBrvVtLXCqS1NqIWn3loO5hdcRZbPErK0iPpNfYngs17nCHZw7TRRFC
 5ZHt1dqCBJjCShVoo970Xvr2eFUEoCwQxXVzKqBdN4+IurhefT4NlsT7xRaJFNby8uj69pddT6z
 +xxUZCZwmqnL0kz3VphUva6yTchAjtznNZwTSiUuVC7xToqUDkOkmjPuwolB10eogElDv6bF3rf
 SBcCiO2TEKMBr7Dd5dyHJAUpkT7+kXhogMNjmtY10g9rUuv236+xvikniCN6Jg3NyEjoSEnSM37
 eJCv+DmXyjN8wnQrEJQ==
X-Proofpoint-GUID: WJmnVqJzxYkQZQhCe6dLForyj_gTeJOa
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aabcea3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=j4MFFCbetrfM6ntwnR0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WJmnVqJzxYkQZQhCe6dLForyj_gTeJOa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1OSBTYWx0ZWRfX4UuvWZFpe2jX
 fHBlxshLSbLdw5Sx3jE221YqSQN5Tm+xyb3Do6/wAzTXy7sF4YaNtUFmtxojrBFlzppfUKFf8c/
 BV1L2LrPN2eqsoiVSzoM/z8w3CYn6PY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170159

On 9/13/26 12:57 PM, Vinod Koul wrote:
> 
> On Tue, 08 Sep 2026 09:54:04 +0200, Konrad Dybcio wrote:
>> The USB43DP QMP PHY, as the name suggests, supports USB4 in addition to
>> DP/USB. This series provides the necessary plumbing to switch to that
>> mode of operation on hamoa/purwa.
>>
>> This is achieved by exposing a third `struct phy *` for the USB4 sub-
>> PHY, which will be toggled by the USB4 router driver, living within the
>> Thunderbolt framework, which will be posted separately.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4
>       commit: 1b8595f4cc9f4029d11ea1957a4c9b4bce3f6872
> [2/5] phy: core: Define TBT phy_mode
>       commit: bc70554e6294d71fde45895223881a4ac3769630
> [3/5] phy: qualcomm: qmp-combo: Add preliminary USB4 support
>       commit: bb8955305318217526e6f9e93ee150888d91d4ea
> [4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration data for Hamoa
>       commit: 0e1288af882068dbaf6e64808ba23c95a80dc916

Patch 4 is missing from your branch and consequently from next, other
patches are there

Konrad
