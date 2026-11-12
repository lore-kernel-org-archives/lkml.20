Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452510;
	b=nZHJA7WiNv5IRXA7tHYu0Ln259iBWnJCwvU1Dk6KfCj17USjQcLYgbZU49iYeOOumKc+
	 oJYKUFGky+sVhEJWAyLx+UktVrNaHHcVjiZlUtDvDKSQ/S7xnjWHE/OLuTCxvlNO44UP8
	 lP90aX3smVkfIXyJ+0Jh+Be5gS1ZNrfcizANNwbQoA5tkFK3bm0AJFOOwOs1FtbwAwxV1
	 6I+r/udKEJIgM/HRgG39SPtf8qcbO3Bq77MMjzEkxSkrcTbDjykLDhY/st0n3brAo947b
	 vf+euKVFtVmdeNxck7yDvPXEERSLGHv64RGQsFU7aorDkV1mfpZa9Pm3+Dl96HJVc1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GFlYTaZ/DTPqn5NM9gQvna8OY4eihfNgKjvdWrnQAxY=;
	b=g9jcpuQYf6bBilwyB65Zf5AER6Z/MIFQs+wyeVzisLlfPdjfxlBL1uUVsOAiMuRFqEbY
	 3+EhhK8/9YIm3kKrZdeBZ5QNtVfH5vnkDOHbsjTmuaGAk5AEaGYjOt1opIs0CnpiJDuGs
	 TOipJwHJjcHdrr9a4WJERpQFWZhHe0uQq0Gb9nqIlSh4WOPmYqUveGF84aGgbdNy5ZPy2
	 TXUsZ6CgoiUgmk8jg552p3gkrBszJfdfsU3kjgVCa3658sSJz/z5hW9sOYOd10Slqbanp
	 Y3+a7mUGJcNYvTDgNykJ8Gz6qKTz2dFMYX2zSYzv7bWb/+lamgB6Ie+oSomRJi9WrdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IE8NhPF1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxLDpPDv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D60606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D60606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IE8NhPF1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxLDpPDv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZXk4022514
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFlYTaZ/DTPqn5NM9gQvna8OY4eihfNgKjvdWrnQAxY=; b=IE8NhPF1wvBH1YRx
	1pJlvxUr4JzEIlPPTB8C4I28YPgzngJ4p2wa1tWyJY3ei+yzY6lgeLuKHu/kY+Hy
	/0+w3EoW+sBxOIpFHQFWl5jDdOOTebm+2xHegXiBsbLtTTIOcIoJBeSqU3ekm6UU
	cSAtVDK/jKmD2OdxW6zpP3j68K7AggCMsOWNvoaH2D+h5VnIcuUW5EPYXkS2RLaY
	nk0xUrzS3ynz0q7OqBJa1u8Zp2v4AngESTB4U87pJRgHBZBv+/9l3VVs0vkvpSbJ
	uaFuCkQRmmXzcBzdEvTgRtZ8EECBcr1QkANBXK2D1I3K3pLm07RZtBf5i07URELA
	trhFxg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdn0tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536720195ebso76021741cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794452508; x=1795057308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFlYTaZ/DTPqn5NM9gQvna8OY4eihfNgKjvdWrnQAxY=;
        b=UxLDpPDv9sET3msrr37ETaSsEOgb8d+USeppPAB7UcBSO0cBwXv8H4LHe0qJKtLYDt
         YRgw2oSkjBt9hh9CjoKS+s78QER34YEfsDEFGy9bUKHrLGhv74MUf/Ek9Yp1tNSistl9
         +EDaK2JUKC2h8pyMYc83y2GOEVdYbIjUk9PKbo2QETVIigEcq2tCyNIFZ1iF5Hes6blY
         leiE3e9O+XdYgF6TnvELIezegdoAo3yjHlWft32OeFZfv/ZJV2uG9A8a9tIadSJVZ9jW
         WLZttaBIqUE/Q0CvFvDt/vsjonHg7RoKzoDfdo922jnRtz3iLEyJqFyrhtg4HGrhrZN2
         7RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452508; x=1795057308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFlYTaZ/DTPqn5NM9gQvna8OY4eihfNgKjvdWrnQAxY=;
        b=miJkyyylOZHItCh/21NnqGD8ZF32bv2iuMryJ++4Eii6skvRq98JLRSdhNJKeURE8R
         EVybQCHV8hUZjaWQmg9aZQQqRK/aZnHRYog15Q6JLTKWE3SA3Tptp0Z8rLZHGGvCYtfV
         d8lEA2P68VydJo1ZtkC9zilypMtwtnh/irk1Qu8pGzMxcdDJHVMM+bWi4D1NrG3SPGFP
         7nX7ipsRoH+D+4PrbbIBAyVu2lKLMww+bsQ9GIdf05Q38Un6oYkze+nJvwqBiZHJasli
         Em76CgUW3lGgfnsl2QBJo0Ywfzb2pm5DPv6L/nRUcC8cCo0vhenlyXGlRKPuBUuR3v/8
         USqA==
X-Forwarded-Encrypted: i=1; AL+hErHyGUqcwmwzJldynZd6stB0ngYUmxi3O0ztSb7OfY/ixQsZNu0jHG3wqqpXeVCZ5Rn/n0ljJ6MnbyPnaKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NfTWf6f28UfYyqDqn+tCzDFuHCv92UADTknuKzR5K5bmmkpb/
	5UFoQMgzrYZLoUXxioMb+50KXdCz88m7GHQrrzz35C0/RlLODTCxNxhGqdxXICnmuOTNlH6SFbW
	M2a6qPoCXZyEK88HGqKlcO0ujS4XP45sY2DDAqWenjZ4CTtZN9fqK7Cx8NUu+d7l5O6g=
X-Gm-Gg: AYBFou2iroNIK0c/sY105ReYQCxyohoNQHJPUX5Y0XSVOemXyDjIs5Euw5ccX9QX0Ay
	OGxZrfCGYzqM/xHBHb10iK3WXIkStp5B8toqLoSqOvwvjwCkwGEF15r0coVtvD0drtkPR6zduAa
	UOsq2ZlmT9yWY7FWw96rWGpVu8W+xlp8YCv7SJAzYxE5ssi4RufJCPIgGmlfx2u81EYirzjjp7j
	8SWiMsltxHl6THZewZ+gSi32cnWCl8rXWkXSgEK0e2FW0Ljq9AHMsJM4yGQhnRUZilTaAbCeJR4
	mozA6ik0E2u1Nm4565hVcKWJefw2iZ7e0KElyC6FIhrCTN3+qivydzbASDvLLUoYnzSWqwbCW4u
	bdSwEAQvhP1+HRx67LlRmvKo8iIzmLIGWu2fDMO2h3pIl0tkzkcoS4TyZlfb8UcpG0sehvXgccM
	yP8QL5dmfkgqgSB47OlV7pl2Viz+9IatzVW5+3MQ==
X-Received: by 2002:a05:622a:1f8e:b0:535:1fe4:64df with SMTP id d75a77b69052e-556bf740b76mr71292571cf.12.1794452508073;
        Wed, 11 Nov 2026 19:01:48 -0800 (PST)
X-Received: by 2002:a05:622a:1f8e:b0:535:1fe4:64df with SMTP id d75a77b69052e-556bf740b76mr71292031cf.12.1794452507574;
        Wed, 11 Nov 2026 19:01:47 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b451570sm65260281cf.13.2026.11.11.19.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 19:01:47 -0800 (PST)
Message-ID: <c7d46cf6-04d3-4c77-b628-046693004891@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:01:37 +0800
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
Subject: Re: [PATCH v5 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joonhoe Kim <26rote@gmail.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-1-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-mammoth-of-delightful-potency-b1ede2@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261109-mammoth-of-delightful-potency-b1ede2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af52c1d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pxrNA04Hk7ndIpWV2-sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rWi3YAmN7pfk04ru1Qvbfxu-BaKzdLJV
X-Proofpoint-GUID: rWi3YAmN7pfk04ru1Qvbfxu-BaKzdLJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfX8ZUVqC245xUJ
 PkmKnpkakym9jRyzpDCCOzdcccvuczPYS3MlEcrtdS65QBMuRKV/g6LDkadwNBLaiPUdPtLd1Nl
 zZcMwAPCmiAAoSCG4zhdaHFizWNuQXTvSrNitvyMThxHBY1yPjpmOcjMgakehTQ20jxi5+pkWCY
 i3FP9QJBi+eb6AdQ/j17Eb6L99F1aXdUxYS4zTgs84M9WPiyJPEcdYYi8fJohShqtXT7kF05W/g
 QsPY6T/iT1jL5IrFEOrfdpy++vmui5bP2epO73qGqnpE09kZhxMcSl1qxvlQVPoiVrq5dJUTEDY
 w1JxiYHtElA6FoKkfIe89ot/8kcuRVT/8uEwMKPrJxw2js9zC2LsMBUEDYlbeGHzcQCUyALH/QR
 NyNDYo8f5zFsO/7u6OAbAPOajwk2kuSzbbtZJi91oTEf4E2YKG2uvTukzvTDIbGqnfgvu3GtrI7
 wPDguWe0sZN+KfAd7lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfX3rjRvrcvaDTx
 TwfbPmUVm183ySFtaLrxd2f5SMddwnn894jeKhoZ024e9kjPe2wMdGbF+vh25NU6Ev/66KVmkNs
 hT3HgXpXKsUSOrgUkXAWxjPi9DzRmD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120011



On 11/9/2026 8:25 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 04:36:35PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
>> MDSS hardware and most of the DPU, while INT2 GDSC supplies the
>> VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
>> remain inaccessible.
>>
>> Describe CORE and INT2 as power domains of the DPU device, matching
>> the hardware partitioning. INT2 only supplies DPU-local source pipes,
>> while CORE also remains attached to the parent MDSS device because it
>> supplies shared MDSS hardware. DPU performance-state votes on CORE are
>> propagated through the genpd hierarchy to its parent MMCX domain.
>>
>> Keep the widest valid power-domain constraint in dpu-common.yaml and
>> narrow it in each platform-specific binding. Require two domains and
>> their names for Kaanapali, while retaining the existing single-domain
>> constraint for all other DPU platforms.
>>
>> Repeat power-domains in qcom,sm8650-dpu.yaml because dtschema requires
>> power-domain-names to have a power-domains sibling in the same file.
>>
>> Tested-by: Joonhoe Kim <26rote@gmail.com>
> 
> Drop
> 
> Anyway, where did it happen? Nothing in v4, nothing in v3.
> 
Sorry for this mistake, will drop it next version.
> 
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dpu-common.yaml           |  3 +-
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
>>   .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
>>   .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
>>   .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
>>   .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
>>   .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
>>   .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
>>   .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
>>   .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
>>   .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
>>   .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 34 ++++++++++++++++++++++
>>   13 files changed, 69 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> index 3f953aa5e6949..c67199011f263 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> @@ -26,7 +26,8 @@ properties:
>>       maxItems: 1
>>   
>>     power-domains:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>>   
>>     operating-points-v2: true
>>     opp-table:
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
>> index 9f935defd6b12..6d6391970d6b6 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
>> @@ -125,7 +125,9 @@ examples:
>>   
>>               operating-points-v2 = <&mdp_opp_table>;
>>   
>> -            power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +            power-domains = <&mdss_gdsc>,
>> +                            <&mdss_int2_gdsc>;
>> +            power-domain-names = "core", "int2";
>>   
>>               ports {
>>                   #address-cells = <1>;
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
>> index d5a64c8a921f1..bded43a34b87d 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
>> @@ -15,6 +15,9 @@ properties:
>>     compatible:
>>       const: qcom,msm8998-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
>> index 034d3df8d2470..6c1476a0faaf5 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
>> @@ -19,6 +19,9 @@ properties:
>>             - const: qcom,shikra-dpu
>>             - const: qcom,qcm2290-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> index 8137618237ce7..3fa0f02f44892 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> @@ -19,6 +19,9 @@ properties:
>>         - qcom,sm6350-dpu
>>         - qcom,sm6375-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
>> index df9ec15ad6c3c..7703d9b017cfc 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
>> @@ -24,6 +24,9 @@ properties:
>>         - qcom,sm8450-dpu
>>         - qcom,sm8550-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
>> index a411126708b80..8e10f9e0d1769 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
>> @@ -15,6 +15,9 @@ properties:
>>     compatible:
>>       const: qcom,sc8180x-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
>> index dc11fd421a27f..9dafe1d827e13 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
>> @@ -17,6 +17,9 @@ properties:
>>         - qcom,sdm670-dpu
>>         - qcom,sdm845-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
>> index 510eb6c193649..173c2f034241c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
>> @@ -15,6 +15,9 @@ properties:
>>     compatible:
>>       const: qcom,sm6115-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: MDP register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
>> index 8cbf99f9fcba5..b8344ff8895ac 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
>> @@ -16,6 +16,9 @@ properties:
>>     compatible:
>>       const: qcom,sm6150-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
>> index c79b2d4428003..8e50942f3e1f2 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
>> @@ -15,6 +15,9 @@ properties:
>>     compatible:
>>       const: qcom,sm7150-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
>> index a88d22f30a602..b407bc3994620 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
>> @@ -17,6 +17,9 @@ properties:
>>         - qcom,sm8150-dpu
>>         - qcom,sm8250-dpu
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     reg:
>>       items:
>>         - description: Address offset and size for mdp register set
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> index aa0cf0ec5b93f..c3bf4e7ca1ffe 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> @@ -54,6 +54,15 @@ properties:
>>         - const: core
>>         - const: vsync
>>   
>> +  power-domains:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: core
>> +      - const: int2
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -61,6 +70,31 @@ required:
>>     - clocks
>>     - clock-names
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
>> +      required:
>> +        - compatible
> 
> Droo required
> 
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +
>> +        power-domain-names:
>> +          minItems: 2
> 
> How did you resolve my previous comment?
> 
>> +
>> +      required:
>> +        - power-domain-names
> 
> Why adding this?
> 
> Best regards,
> Krzysztof
> 

