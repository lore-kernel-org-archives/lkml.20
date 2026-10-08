Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4C485925
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452062; cv=none; b=qrmZyKaSZZp058H6g7IzHdHfBr0vWWKxXhYGBNDXPOvfmNua9y6Gs8dGCY1/ZOTZayYBJVjj7Riqhmq2jCTK1w4K8CcRj+to0igIaMUHwFKSCkZKC2C4kf1YnAX5/CD2FSdFl3STU+c0yq+ZZE6fp96T+OyddNoHRJWtEezHRu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452062; c=relaxed/simple;
	bh=wtEHxStfIshAPX4gIqNIaRHRcB7Y6f1N/JTj0bHLKgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSOnAwc6fFRuUBT9uiCnnMndgGIEkMDHDnNlWJ1VtKRETGLeGWC+EW7I9YABIksGwJXRE2k24qKL4/z9GDnASAEC4Slm8RWx9ZQkVZsPSwl7Qrfjzsopqe2f8S0rl98HwQJBfouV1+aF2Ge4xMl1qzNk8eIv4ihT3mxKI4F6lVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPY0VS7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N68Pn6T0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPY0VS7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N68Pn6T0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KaYN1846622
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4JK4jopm1sGil/0A6A5ktzLmRObQ9TZ0+aXAuCmuLw=; b=XPY0VS7SWUNfKwrU
	0rBrjm51Ey288/p8a9zfSWppp1UepVCfQgXyVKDFsD5CDH5sqnfgMwmBac666rlF
	5Ky5hl8LQJEaQi+reis1l4QzPbixoq9uVS8wuWEq3b51Ciu0r34zpLC1MCY666L7
	98IAVnZNi4VsgyIpr7hEHJ8l+yVc69XaNIETwqWsuhP1KPbDX0IDKVyFLXSp6m0v
	HWlGeNrfajUFh5KHeaG28I3yrnxKFhioYU5xN2NDCFq4xCo4Eh04akWZW8dE9CXI
	sZeX9Mdm2DTsqaK/wlq1NJ0OHafJhasU6fPro/p6om+zhVPu6iHambODlRWr3VYH
	wkI1YQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ja21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:34:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef0362d95so9775799eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791452056; x=1792056856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4JK4jopm1sGil/0A6A5ktzLmRObQ9TZ0+aXAuCmuLw=;
        b=N68Pn6T0rkChb+8SSTW0/RrzTuSlNNlpGfC1kUHgr/jPg6XYUR06HWCcr2TOyYywIX
         u1de2poOG3TcvXGbY3g9kMZy/x47liAQho9Cq7xP1+79bOvgQVmmAm5RFH89Kmrk9CEt
         GifGNbyuZdn+KIajsmGN4gl8Kh9qt9TKoq4+ll6FAxQ9SvHch06AOYf1PhjGXjb3UaXL
         4DTrq0yriobVlGCtdQTjj7famk5lp8mo7XRriNm/yYwigecodX3c1uwVaw4Od3IZcr/P
         hzIhCo72z5MMwCMLHzDrnWFlDVcv/3umIdb4TJm8m9DWO6cBTXeVg0O3QzHcsLaIlbG5
         Wuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452056; x=1792056856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4JK4jopm1sGil/0A6A5ktzLmRObQ9TZ0+aXAuCmuLw=;
        b=vfBGS+X6WI3TuQGSFdwPGGjamizFewMsIKjPfmhpHELnDbE3IhPhvj+IPW4v9DtdFE
         UyDZXNKTh7fziu3eZZEP6YORkUqsi6rTQSs6HyOcweMlegGPuikwdvjDUGNJZ9GF27hD
         t0iy7Af6FXGMB5egyIErm+vD3NGywPL0Vu1W0QWodEUcTdSE8MZ1Ay1JhdlFgHWhzaop
         dDxwKlbBwCtX+tGOhB9D63ntB9Fp0B5W3OWo8ZLS2Uig0QuZQyII8C5NNwsR7BaYSERH
         0UQ5hDyXFnps2KV8TjKhK9qTR8revBx9+26epLA8y8wikvMNo9Ywn5N1sx7FQRQpfnkx
         RiDg==
X-Forwarded-Encrypted: i=1; AKwUvBzB/4QpPf/iyJ/dCYOJHmpVn3JCsOpw0AvbIAmnfXaYOxaY4R3YjauPf568ovZL3a5FnCLszhi2FOZtDFc=@vger.kernel.org
X-Gm-Message-State: AFuF++lmmScRXZuVOGS+SE3N2cDQ1uO66yKHaCp6793ZGKGLseHlS6Vr
	mn2t4a0/c044g0uxoCKnDqklM+/TbW9pSbq0azGh3T60yI/i4GEbxEUd2xfZz8yH214LXQOsKei
	jSlgO3G/AxFScnlsOch9SwzGecU4H/FplMAQDuKvkrr8fD3dzz4D/UvnQmoQnHu0Ye08=
X-Gm-Gg: AYBFou2y6NNKGoarN161+FDwlbvDlRAyAs6ELLEKwQIdL5U3KI5cNVs+N1IzEex+W5C
	Dbf1RdAUJ6NWRk9up9JQMc51wmCP/KAs5agv+Cq1XuSN7N2GiNll3TlcVQVyFgG8Kdh0DpcPLGn
	ioRpucWWnI1T/ot8yQwLoj1itC/IdPVmnfXRTE0P177AMAosXiGHXd3UxM4IXGVATAAWy7ZLaHM
	/l4WRaUjGoRHzcB5J/qBbNHI1T7hR8usCHxrqzDlugLAWQvQGujzr8wH1tsPBaZAFonGfSRUUqA
	M6CHj1LlhgqaUQY3Gyp83qBEDt0TsuO8OCBK8N5OYWpFZopS7/WEcG0Gi8xGlzJHQWXnDDDEFnV
	PEZ45B3UuTkb3ucPE9dHwV/iXQmXMmvSF4w==
X-Received: by 2002:a05:701b:4294:10b0:143:2973:3240 with SMTP id a92af1059eb24-16205db7a2cmr6040069c88.29.1791452055773;
        Thu, 08 Oct 2026 02:34:15 -0700 (PDT)
X-Received: by 2002:a05:701b:4294:10b0:143:2973:3240 with SMTP id a92af1059eb24-16205db7a2cmr6040010c88.29.1791452054971;
        Thu, 08 Oct 2026 02:34:14 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616b01c2b4sm12194515c88.20.2026.10.08.02.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:34:14 -0700 (PDT)
Message-ID: <f07e4b33-47fc-45a0-8fff-105766efb5e4@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 15:04:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
 <CAFkd8hujKYhXveemgPCbsUk5DFB=fQSxqK_-69fP5aPzoWSzbQ@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAFkd8hujKYhXveemgPCbsUk5DFB=fQSxqK_-69fP5aPzoWSzbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX8S/bXattxler
 IkvUckyfl6a8OnR6hetphhuU+Sl2jbj4d/Q/zXD7demnCKavQExSrafSbfsowOTQtN5aY+E9+a5
 ANLqbasZUEI9Iamr9lu/F5cGlsIjH4A=
X-Proofpoint-ORIG-GUID: ew8K33VTGNbLYMKAWhMCuGmCXNZY5_6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfX3alSshl0yd+a
 wrgs2vHb9ynAlA2qsOyEdaHpLS8fOb9yL6IUIHrmsDiM/kEq6KFF1r+zljVvAqSliQNoKjBCbe9
 07hGblb2oVdBJ1dB2uiCa+St70JC0ercekDBPN8WKHP8UHwpPzXin/p0INHNz/2VFHEajDH7C3A
 l3St1ErNwgdANB0/U6W554NhF+eG8DzSd7YX6MsW5x72BGut5/gOecpaxy5mHd5F/2fOwIofKLv
 a4sWEiWpukKHyNcqO3VySA+X2zQaLMLnIGmG3Lo7vZuNzauEWpetQHCqsuXDdQn6SjdCvtCiecI
 qKW28+5zs5+xVGcN5OOOXPINtNPQ4g7Uw48BPtgWpMVj37aDF2G6o41DGqBDjOd7Txas08x3le4
 NywEVL7NTvNZdlPplnUpGX2JFMnaZDyWiwLNrZzTZ6RZHR3ECSR+aumJXJ7lX0B67z9Q+H3Pa8A
 qhtfxVsEHuuEn2V96Bg==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76399 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xMmXIViELGE0eokI73UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ew8K33VTGNbLYMKAWhMCuGmCXNZY5_6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037


On 10/8/2026 12:16 PM, Zhangfei Gao wrote:
> On Sat, Sep 26, 2026 at 2:38 PM Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>>
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> cannot address the low 600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>> A single "iommus" property on the video-codec node puts every stream in
>> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
>> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
>> that boundary the hardware faults, which shows up as unhandled SMMU page
>> faults and spontaneous reboots:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Given that the address range restriction is for specific VPU stream, it
>> should be ideally be moved to that stream. To achieve the same, a subset
>> of streams is now represented as subnodes, so that each can be
>> associated with its respective addressable range. The design was
>> discussed and agreed by mainatiners here
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
>>
>> In the past, this limitation was addressed with an iommu-map approach,
>> with the iris driver dynamically creating the devices. That approach was
>> later concluded to be a hack to avoid having subnodes, and was NAKed by
>> the iommu maintainers. It was discussed in detail here:
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>>
>> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
>> stream is allowed to use, so the IOVA is allocated from the specified
>> range only. Define all the possible subnodes so as to describe all the
>> VPU hardware iommu interfaces, both secure as well as non secure.
>>
>> address-cells, size-cells and dma-ranges declares the 1:1 DMA
>> translation into the parent.
>>
>> The parent "iommus" is kept as an alternative via "oneOf", so platforms
>> that have not been converted to subnodes still validate. New platforms
>> should use the subnode form.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
>>   .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
>>   2 files changed, 97 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
>> @@ -91,21 +91,6 @@ properties:
>>       deprecated: true
>>       additionalProperties: false
>>
>> -  video-firmware:
>> -    type: object
>> -    additionalProperties: false
>> -
>> -    description: |
>> -      Firmware subnode is needed when the platform does not
>> -      have TrustZone.
>> -
>> -    properties:
>> -      iommus:
>> -        maxItems: 1
>> -
>> -    required:
>> -      - iommus
>> -
>>   required:
>>     - compatible
>>     - power-domain-names
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72cd5ae6815ba5c82 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> @@ -47,6 +47,93 @@ properties:
>>       minItems: 1
>>       maxItems: 4
>>
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 1
>> +
>> +  dma-ranges:
>> +    maxItems: 1
>> +
>> +  non-pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +      iommu-ranges:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +      - iommu-ranges
>> +
>> +  pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU pixel buffers containing uncompressed video data.
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +
>> +  video-firmware:
>> +    type: object
>> +    description:
>> +      Context bank for the VPU firmware processing domain.
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +
>> +  secure-non-pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU secure non-pixel buffers.
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +      iommu-ranges:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +      - iommu-ranges
>> +
>> +  secure-pixel:
>> +    type: object
>> +    description:
>> +      Context bank for VPU secure pixel buffers containing uncompressed video data.
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +
>> +  secure-bitstream:
>> +    type: object
>> +    description:
>> +      Context bank for VPU secure bitstream buffers containing compressed video data.
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +
>>   required:
>>     - reg
>>     - clocks
>> @@ -55,4 +142,14 @@ required:
>>     - memory-region
>>     - power-domains
>>
>> +oneOf:
>> +  - required:
>> +      - iommus
>> +  - required:
>> +      - '#address-cells'
>> +      - '#size-cells'
>> +      - dma-ranges
>> +      - non-pixel
>> +      - pixel
>> +
>>   additionalProperties: true
>>
> Got this warning:
> arch/arm64/boot/dts/qcom/nord-rrd.dtb: non-pixel: iommu-ranges:
> b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object', 'integer',
> 'array', 'boolean', 'null'
> arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: non-pixel:
> iommu-ranges: b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object',
> 'integer', 'array', 'boolean', 'null'
> 

You have not picked the latest dt schema. Please go through the cover 
letter where a PR is mentioned, please pull that or validate against 
latest schema.

Regards,
Vikash

