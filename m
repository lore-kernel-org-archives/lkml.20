Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6019046E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162188; cv=none; b=fKyzJZ1c7x5I+vNEi2BP+aBAZJs2KCf3jvjGHtzaaecX2RPnM+OcOslfGFD7xMHv0TGUYOxRUmBUnLs3AYHLCNgJu4sxQWsy2dCXIUxSFt39zsJueUqrotISN9U+K8N9hvFSFwSctjZ0eEe+zsu1z5xT4IjxU7p/7sghpuJXzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162188; c=relaxed/simple;
	bh=UGsddXDvUokZZrW0oS93xrsee+klcMXeMzKLJKFSwxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgTsiBdgRt1ugR9WgJYQ4YlW9U4RaqUcBjUza/VBZqbmT5NyjpyYy6snvta8yXNYJEjOYIl7usfet/vhbERpzWPHPGHnX48PniGy83+VHKwtxHk6Bw1L3pCqOh3+y9zXV30UjzisUo2BWRuXJqXZ/Jy6tMBBWKD3JGIh3jpSZ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oki2Tj26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERsq65Qx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oki2Tj26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERsq65Qx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510Ix7930982
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 01:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIN/FPCHWQX2ilgcPPtHpxp8
	Rklr/RFaTYrm5ESNHt8=; b=oki2Tj26wJN1J38t/A+k064edb6R/VljheOsbHek
	TVywuGJ2xhCNWb7l8Nmme7UP4PKbHqjiDBwvAM3KwGYFb2f4JN6tAkUj5FDVG51l
	9b7PHLo77fnDmayjaK7ohR93sSdmvpIkbOpfPm9xMmRqWqdVqn9lM3XZdx3ML+8I
	hn+xP3E3/ylvPIR2EZL81oTRFCpL6PpKsT916uN6DVCggoS+tCBFaxwBBAJsaZca
	6YcoiRt77G3HehrH3VNJwBi27s6d6x3rxSDn5LK5fFHby3/NqyGylHk55iMHsXvj
	gmAAfHGVcsyBULfvEdTSWgL7QfUhhOB63KgH7te4Tmu9ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sq8v312-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:03:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc5f70c8dso124133085a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791162184; x=1791766984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIN/FPCHWQX2ilgcPPtHpxp8Rklr/RFaTYrm5ESNHt8=;
        b=ERsq65Qx+KKPd4OCSGdepGgQKwzbs0XQ1o22/Y+yfHdPp8nTLtIlSbZWKaaXR0TMtP
         o7cXeSrd5NAlqC3UXxJwzK5EXnn3CrkrzRVotOEdw0OZ5EwZMYqov4sXxR5mVZZxHsMD
         NNa/UkR3fgL/mSRqaeOtidJ7U7VnVddGFNmsHT7wHkbQBTvGcmOPgnyfCsW5pKXuFcmg
         a7ADzY8w6K9YHdsDwNfnf9GugAzhncgMLY8y5LAGf8hXEHaLUCC1nTsy2Ff66ol5zfFs
         gB4TiWYqSy3B6dHpEY6vi3MtIRghF7vwyOm9ha8nqnxjrbrcvfCloKi5Im7wUxpPU8Wj
         Meyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791162184; x=1791766984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIN/FPCHWQX2ilgcPPtHpxp8Rklr/RFaTYrm5ESNHt8=;
        b=J7sYO26HuYUsaLMuXGsOZS25KfIE8BQ5chiHEypzEZDw0Cexz4K/VZHCuzfAJyCG5/
         g7GOsqOU+pi6vIrSDS1TEr8vLeYI07kHnspkYf/Gh6tBoILVtNd0rA/SIPG8NI4ujBgR
         SEi89BV35b6plHEiQdPp0Gs78aMkV5O6P9FC+JFyMyY2Kmn90gUDi1dmLrjw+PWhccwV
         lr/gL7EUhFUKsl+ZVPjy0K7ohrrne2+UnMEht3GgGvMCP1ZJLUfWa/5WsegDoWFU4Thy
         uNqzq4D4NRJSez0R20PJlV6EM787xu0xotWeuGEJFKEZy534R/J75pee8dghrWq5AIUL
         dDuw==
X-Forwarded-Encrypted: i=1; AKwUvBz54iU+LYy3/f6O3Xp46OPUFnfj1GDelga+0gZzqEfC6OJJ+i657qApc5SBaBy5pmB8tYwpfBDJC0V2n0k=@vger.kernel.org
X-Gm-Message-State: AFuF++ncZzEWhkaendCv1y/xdOHtaqFeTAbprQxdpTKgqu05wQTSFC23
	BCgMA8+PLau2aowp4DjUa9nIhDSCqagzOl+uYouMy4K3UYD+xKzfA4bZOL6I4JPkDBVcUCa7aW0
	Ot4s2NzvDTjd+NQB22uqFLrnxtxtHysQ6FCAqetRSuXU/gG+RALK2dsAb5wTeHUneVME=
X-Gm-Gg: AYBFou10/YymYJn56UDFtQE5m1CvoNwCjx9JbF30ORIZ5CcgD3NzqG8DgUMrLr1Kb99
	goXe7PrKCSTEoFs684UVHZlvYUOEgJmKDAbYhzDR/xG/8NeLXfiCd3R8MlhMpleETNI0dWtfr8g
	amqfJTetP4IPp8gKfqSx4YwtLKyvaGYWf2hGXhxB9zKYgVx9rcA6IgoGBTpId/p6BfABgh+6X90
	Xm9CjafwqauPhScV9DCU6qz68gfuIV16e5jvyr3CHpzABCbryVbtenQoVcz3TUtfbosT2HPbxTI
	uJ1CLQM1YaunovegIFkS0xJS21a3vI2fBiyS9CPn8nLgRsd1HcKlFX0u/H19YttRspDvgGklfsI
	XN4hvDJHNROYCqx4Cb89E1vnsRfSKBHa1AOU28XkmSK6wNx7/o3/lNrNdd97mr1r8APExzzQmTb
	rZP16xxWlGkvZv
X-Received: by 2002:a05:620a:4086:b0:93d:f7ac:4706 with SMTP id af79cd13be357-93e50e4a9dcmr954046885a.9.1791162184331;
        Sun, 04 Oct 2026 18:03:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:93d:f7ac:4706 with SMTP id af79cd13be357-93e50e4a9dcmr954041685a.9.1791162183793;
        Sun, 04 Oct 2026 18:03:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79632fsm2749164e87.40.2026.10.04.18.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 18:03:02 -0700 (PDT)
Date: Mon, 5 Oct 2026 04:02:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Message-ID: <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
X-Proofpoint-GUID: BTHg3MJQn_jB22Slt34fEjcKIxTYHvFK
X-Proofpoint-ORIG-GUID: BTHg3MJQn_jB22Slt34fEjcKIxTYHvFK
X-Authority-Analysis: v=2.4 cv=TKzQ2Fla c=1 sm=1 tr=0 ts=6ac2f749 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6FRr1iax-wq3EJIYYUIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwMyBTYWx0ZWRfX8YOyUf3+c/2u
 zWXAyou6c1j2STn0WK9Z1thMdVxw0SsZU0FqseVl9KaPMpQYpKX8LBeeYwuhbZqAEpZRtjpMD+a
 tWaO8me4DUEhIxqL19DSfGILIg+jkwY6OQzdyLaNdhB6lE98SzB1YbPSMHLZlh4ooA+0hUuRQhN
 fq+40xG3OuZgbEjZnhue4YmLBU0wat3fgJ6svvKMDjKz2KVPfuvO2dibQrjylrDvAkPC3iKwwWy
 Jzu8rLJ7T9J869UUu33+nQquRdK2yta1YhH1rBdb/a580kIX6IQI3rTdrCrhoismxAdyLD0O2s6
 NsD1H3v6JMU2P9E8ZXSz8e33HnaxCoWo9/RC6gWVMRyx0G1mtTM7n7K2qP3Yy+I8pqIs6en8K/q
 X7hgwuFxM40glKq/8zAPfNArIyUczOXs9VhnPVr75J5jIhuIbtcM0L7ljTna3E9lpuNYjMjcGlZ
 EHe4AsGsvCP5Yb48BTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwMyBTYWx0ZWRfX/GtgNLTe6MDl
 ELDu8pJaBZamMTts+KQRYJjrPV9dKSg+T0wZEnROk2RmHN7xHL1C30P/JA4KbvOvLV+0ibjTzjh
 DD/AMHWYmbI2+MHzftheEAUrVokSDno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050003

On Tue, Sep 15, 2026 at 05:27:48PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
> of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
> that powers the rest of the MDSS hardware.
> 
> Describe INT2 GDSC as an additional power domain of the DPU device
> rather than of the whole MDSS, since it only supplies DPU-local
> source pipes. Restrict the schema change to the Kaanapali DPU
> compatible via an if/then, so other platforms sharing
> qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
> existing single power-domain constraint.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> index 3f953aa5e694..19b791a857b5 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -25,8 +25,7 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  power-domains:
> -    maxItems: 1
> +  power-domains: true
>  
>    operating-points-v2: true
>    opp-table:
> @@ -53,4 +52,20 @@ required:
>    - operating-points-v2
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,kaanapali-dpu
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2
> +          maxItems: 2
> +    else:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +
>  additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> index aa0cf0ec5b93..88aa71d2b912 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> @@ -61,6 +61,29 @@ required:
>    - clocks
>    - clock-names
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,kaanapali-dpu
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: MMCX power domain
> +            - description: INT2 GDSC power domain
> +
> +        power-domain-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - const: mmcx
> +            - const: int2

Nit: I'd suggest more generic names here. If the next platform switches
from "mmcx" to some other domain, while keeping the split architecture,
the name becomes unapplicable (in the past we have seen platforms using
CX instead of MMCX). What about using names like "core", "int2"?

> +
> +      required:
> +        - power-domain-names
> +
>  unevaluatedProperties: false
>  
>  examples:
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
