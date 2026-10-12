Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BDF43CE73
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794476; cv=none; b=XcUEIx+KI99v/yf/bvV2mZl48Ev9vKrupjUHlzwZcpLU48OO7LA6KFNlOUVAzpbEVkSnpssetIcynEOcbC8nDa56w1qFqMS7vaO7VAdY1QkSePBOeCAAff7dkcVWXDhkwx2Nz74no2hFWo4KgAnpNA8xp+lzgQT9YulEEpyX64U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794476; c=relaxed/simple;
	bh=Hfq20dRp+wFT03a4/sFntrP0p/AxTie81mZS6a/kB1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRkOYb+JyRZuFPfdMuoXTluyNzQN0zfmpr1rELmtrGlZMI1FpMyq6PqhmUQfude/9NvN+oOIZDHLCm/RVPcPdN+f4RMYSrL3JgeJ967cphYPCrK/g3lBBX5GkpsdPkPP4anjDp9vX7gA6FXhIa4i4Xs8vVA2MglzrF1gyuGIZ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ai5FHyzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIi/iiHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ai5FHyzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIi/iiHD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Ku7r312841
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8GO7ExOgblqj7+GdipBZ3YhlJBmXYlbc4wk298drcU=; b=ai5FHyznuqWJvwh7
	nFw9jGAjXyjV9H5Z+mcIUA2ESi5ifOMKW32t0UcjzUd7n5QRWA9bEhEtG9DRk2BO
	4fK2ZuYuau57oxsHDZHWS5j2SEBkIpQkMpd8EjH2nMc1paqdjEwoYo9wIr8kzxn1
	ATahCT2LL6Tzrr3NxfV70XnwgeMQ/88UlPMT6oY21dMeY/8R/6vFxjLSwlqODBb8
	M2+KfnNTbp5E0IXuYCEVOko3N3JxTtGKlQt3rhmgEOLDAM+R/Rq8r8iyBB5c8Kls
	Hh/3TSCEGeCBt7iiqCJJpJuvdNhdZxYlIjKHfsMJVQHd/SFtOOoxmzF1Z/2wMJ/z
	Hj+MUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjnp37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:41:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e605efae40so21250825ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791794473; x=1792399273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8GO7ExOgblqj7+GdipBZ3YhlJBmXYlbc4wk298drcU=;
        b=dIi/iiHDcnEFx7FaeLPUHYFrsV46OdDdX9qJDmj1/VCxiAcLvERkQbR5wEbPH9Zzx3
         iBtr6/+BJNsqFnOhvCkElByIdZPGNFR5zpY0uzxi4E+gDYInPc/pYgMFoLj/uHWaSpnA
         vRGdDVT7FGYW4gJZeC/Qs6ZvMRmknsw8AzNoa6iecIfHqFUObDmIYVTC4chqt1K5s61x
         4e6wuxcakjG6wpoESj7DvpYs5EmA+Yw8PIcpZqTkuQLIW05ErnUD51IpiJD3+bxTGjmD
         JWUFL5koRC7b9UDSFXNap4e+3EuXJFm7dU9+KJFBW+6Y0j8UMYybzQ3y+RWz7GL/h5oD
         4Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794473; x=1792399273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8GO7ExOgblqj7+GdipBZ3YhlJBmXYlbc4wk298drcU=;
        b=Re2+atiDfy3Ad/gnicGK6QIYHvNDj8pGrRAdLPX85QNsU1HVebGS1oDnicboABmdHw
         7rqJ3Ljde19lClyXgbD+cAqm2BymNQDYYJDIXL8KOjoJkJYH2kD5kANW2rZCB5ORm16l
         xjNA0dQKQMFNym1hTfzygeHjxJGaj3flTVh6PPxuTi3pjdcC25Mikl9CfJpWda/ez9H4
         TPoSm7jY7qBxFgGOGOgRaF4Wtx38iDyqqIIqZuXPETFOWvhAXWi3zSXM1qqqbHTHpuY8
         8xSyFZNVXCSwpVVWQwod4vDlUhyGyL6U/5xuNkeCHcxqvdOvY/SUxMV4bQ65NOwkw5a6
         xLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx13bentF+wRfWkljSgrJe7PIMsqC6Dgsi7gi2ELwBAicz/R4eFoiQPXe/VU3a4/d2oTsTIi02RbL7XRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc4zUaNl8T0wz1aGc0ytlDsiddby54UaXZef2Am6kP0OwEBjKu
	jCLC9B2v8jOkAWj/bqrZ8ZX51MSnAPCcgOdvkukUJRjoDXxcPZ+Sc3HqXEPm8GZUaJ764luI7rj
	C8MJejp77PCIJYxS8zsP/RyWo594ucu9eT/E8Kpniu5ZaBsc+ygPVCkZhPeyyTeOQ63Y=
X-Gm-Gg: AYBFou1Xo32t+oCwJxWnWSq/H7q5wW7e7x/74A2rZVp7vi1qtPaDOuckPZO8rz+AqqM
	o3ViWk6E5EOL7A47Fypu1nsyASHTbTaLC6qI63SNJs0OQyVtCveOOXXFkWKGNhuR2vwqP2VRnYo
	aPC/tGJivRx9Pb4CJFTc/7uleg0jRcOHcKjgmJGzgojmW1bOa5gjhfJxdA9AUdMl914rWkoH/Id
	K0PPxwi0cUtnkXn6NytinQA1l9dOvlYBySvDkNz9xjUPP7BU3gwkKv3DxieCbZYhIxpfQmRaYdJ
	jq6vsMO7+PDh6Zv+MsLrgdYnA8g/CjVxvefSJ9N4RyQz7Hq9go9Cz7ilCP1okEnuVl5WXN6ddmh
	4QDdtLG0rg1p74s6aDIA1yYKzAAQpwo8PIxsW67Vo1ntHg38rG1an4rXU4WzBIPBkdBqW+zg=
X-Received: by 2002:a17:903:15c8:b0:2e8:f7a:c69d with SMTP id d9443c01a7336-2e8429a8013mr71142885ad.15.1791794473009;
        Mon, 12 Oct 2026 01:41:13 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2e8:f7a:c69d with SMTP id d9443c01a7336-2e8429a8013mr71142745ad.15.1791794472496;
        Mon, 12 Oct 2026 01:41:12 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm40626185ad.69.2026.10.12.01.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:41:12 -0700 (PDT)
Message-ID: <a09f71a4-31e7-439d-b053-66b279ea27c7@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:41:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
 <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX4oeN4psSXzT8
 wrNTkNAyObJvO48hjRNFZKlsn7dsSZXHWlH094l3euxO22VbdghbL1b8780uOFQ9tfl0eVXTh3H
 iPfUyZjjXoEh/PovGguSi+woXImAXfX5h8BAHML0ZJDk43K/XSNqPZyrpZ4mI75SaVSwjDlXe0K
 YtJbi/7i90oLof7k81hlx6d3310cJif2JwN16tkcrux1siEvKEHjCRb8nhTpLwiLB8hGziLD96O
 dEdqrWRqTqmvBpommOFqLH+XOBkx4okcF0zjOC+PImOjtEbeqZX2x1AqT80orVeQmx+5AN1FLO2
 SEI8v3NUDxLAhzEigK87rU4oXdfFb3I9C73/Pcq3E9Qq3rRO10sn+QO+QRU6l521qbrURZvT9Ff
 xzqMm4xEdDDXTGnyZLCCe4omDXNOR9/bO2xUE5WFXORgwMBALr9+MPLHxveonO1a64VUyVg7/96
 mh51XPSQ90ICGsCXJGw==
X-Proofpoint-ORIG-GUID: MzHP1Ptq558pkCzYEAl3yETwfJHcS1dY
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc9d29 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rG2K5GnlOK9i5R8LVMAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: MzHP1Ptq558pkCzYEAl3yETwfJHcS1dY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX8dwCsL/RCxuz
 NmtYRxhnfMIhkz0sZElOhm7IsxxTtlCTNZFrvQwm9MHSH+bdk/smCIIT0848BQqZ7TYVkB7LmZo
 dZpdTl2FxAAqVDBDutscQaHj82YLXBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120034



On 10/5/2026 9:02 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 15, 2026 at 05:27:48PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
>> of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
>> that powers the rest of the MDSS hardware.
>>
>> Describe INT2 GDSC as an additional power domain of the DPU device
>> rather than of the whole MDSS, since it only supplies DPU-local
>> source pipes. Restrict the schema change to the Kaanapali DPU
>> compatible via an if/then, so other platforms sharing
>> qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
>> existing single power-domain constraint.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
>>   2 files changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> index 3f953aa5e694..19b791a857b5 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> @@ -25,8 +25,7 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> -  power-domains:
>> -    maxItems: 1
>> +  power-domains: true
>>   
>>     operating-points-v2: true
>>     opp-table:
>> @@ -53,4 +52,20 @@ required:
>>     - operating-points-v2
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +          maxItems: 2
>> +    else:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +
>>   additionalProperties: true
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> index aa0cf0ec5b93..88aa71d2b912 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> @@ -61,6 +61,29 @@ required:
>>     - clocks
>>     - clock-names
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: MMCX power domain
>> +            - description: INT2 GDSC power domain
>> +
>> +        power-domain-names:
>> +          minItems: 2
>> +          maxItems: 2
>> +          items:
>> +            - const: mmcx
>> +            - const: int2
> 
> Nit: I'd suggest more generic names here. If the next platform switches
> from "mmcx" to some other domain, while keeping the split architecture,
> the name becomes unapplicable (in the past we have seen platforms using
> CX instead of MMCX). What about using names like "core", "int2"?
> 
Agreed, using "mmcx" would be too provider-specific, as the DPU 
performance domain can be CX on other platforms.

However, "core" might be confusing here because DISP_CC_MDSS_CORE_GDSC 
is already attached to the parent MDSS device. The first domain on the 
DPU is used for OPP performance-state voting, so would "perf" and "int2" 
be clearer generic names?
>> +
>> +      required:
>> +        - power-domain-names
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.43.0
>>
> 

