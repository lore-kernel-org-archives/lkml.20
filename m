Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F548AE10
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808224; cv=none; b=snFW9x5i03uE8IvNSARiUy4RD80rCu1BtrbRAJSBGPr1oYEVurnKCHna5X4J5ArYFyA6d+NcqKudSwz/R2SzS4cT7WG4tpB6QF4MaPFC9GQb3wJc+jjSEVPQ5xYHL73ZdkcPItoHDkOcGB/4VtZDqbtPlEVQMGZqx+MBVZY5YlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808224; c=relaxed/simple;
	bh=QBgS5vvmhHg6BOQCaYPvAzgfAee6J67gwubuPcqgVFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKgcopXhEjXWW9AEgVC34uGqcv1zkZnBIL6wahsdE2uAmkos/BGktHdDRSSej7WtXfF0N+tidJh5n5Oi6y57u0eW9KDIsKOsFND2zQqO5ihQ47zHSsMbhDyr8gROBF8Y5FlLbkvJeFizPxsX0mfe2Zv0+G+ZzJMc/WeDF3MqB24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSCvE/gn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGj0fAdb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSCvE/gn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGj0fAdb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxsiB1404471
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ls8AOqBpZ2ngBQoNAA7Jpu1E
	3UX0n2AiAP1xAS2NcXg=; b=XSCvE/gnw2FUgpCu5FLGovGPGy6CyKoI27ZHt8s6
	DakM8ar9srcToncPCK2bQW+tZf+qZNX2wzzuHM/UBMl1KWSm3zqsxQZZOPVRbJUm
	HIfqMJmdYY7nuOKYvogJc5DW5+lRIlAGZu8ZclzPt+nFYxGgACDNPv/aNfcdaVCU
	K4k1hM5FJmVBjtK3FpuhJFd6W/PU/eA70y6ZaM5KacnJrW6O//niDX4mowlyywPI
	I9qb77r13hcqAiaT/6WsWMQDHsUBK/csAwHOqliTIenpKFHVD690UylLGgpT6yJO
	jftjx8tIIsxOydyNKbD5RAZ9vUSDekzxQgwF+5Ixh1RyJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ks28b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:30:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e834ff4d0so547886385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808204; x=1792413004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ls8AOqBpZ2ngBQoNAA7Jpu1E3UX0n2AiAP1xAS2NcXg=;
        b=VGj0fAdbhd2sVkWvLg93oDmK9HOr73Folr9cIBVzRjT4Z3QpuQuvYvM60j3HHT1yHf
         C+xDUtsHXrKAZKXKyeCsZ7Sf+xTYNG5zGxSxNQ0pFnSDtPtPMl+5VWJqHUAEA/8sQBWI
         WLDYUpDgF6Iwu9SKn3Pi0Yy5RoBV1tWCi1cjUDvKiNQ7MK9pG479hkJBBcZsVn6bU9bS
         t2CahUTCe+zUy1h9CGp4Br9KvU2s2hmKFXiEMTPhkRNASw3LOVB0FlCUh4m4OW9S+cUo
         UX9fvAuA7fb7gHwNcRcxLljGV863xPmDcmVmrUPOj85zOkGRMDtTaab/fu6A/Lrdjg0j
         5v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808204; x=1792413004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ls8AOqBpZ2ngBQoNAA7Jpu1E3UX0n2AiAP1xAS2NcXg=;
        b=YSAjgXIWz9oi7X4r7+zLn+wMjsiqZIYQm2yYMVc1df6Ga9+zU2sDop1f2bYaRV34NA
         Ob+qJU4css7hWDPMeBfsE4Uxye2AuohhCxRLcjIyLE4LUcyKg4Q/wdwUkLf7YJZiBcpi
         z6QcpNjeVqmO91jEOxbeqpV460yY9xCGGU6bhp/yufvYS5YcqfQSGrxOLuVMysA8VO72
         eZ62iL1D87+IPTuIi6MZgHUhRag23QcIukhHs0tMaNJEZqG8I2LEQFLsCowu8pPSbJeL
         7VASzdjemR+QK6eyI1H1P4J6Wzz/tGaB00U2rZfjcyHLF6/fwSztyeFDMOJP9xdDxfBA
         2/SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcUlP2ja9XtyalNLYNpkHnkIMvDTXjK8At7umS0jzZxqHXb2XA8VPYMPHyYsBbj/xaVtS69CDbC0OvACY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN7A/n8eIUl70JbC4qQzcZrKGhg2VlzCxrHlzhJgpQmWZyxgne
	wmPsGMQaflG8Eq4rukpt1fu4q2lOH9TLZA857cV9A8RnHJBaVFAE9v/iUOs1ML/SEKgu5Gkuft+
	zk477RmNYmQ4Q9/MrXWuWITyXA6JOkP2/bUmxg5nSH2UwJDM04IbBvvIf0rCbmNEl0xQ=
X-Gm-Gg: AYBFou0PXfTJzj1LUrxMzJuvmWqXP0ZPHF7kwthluDrqA2wMEnz77w1z8uWdTiQ1tbA
	JMg92mJupEjTs34hpFWYKx2dRw247Aw9gE7SEUUk6f1HHKWqxfvDJpw2W72W46mKz6AzQSIMb+f
	nv9cvNKsfwN+bCNwvqKqs1YOieOAbaF8xXcwrg5KCGniEJTUptc6WLqcMTwbqbajphM1i0rGFKW
	98jf/hv7yYLL6QnMsVYg7tN/BQftTo63PbQouwXvMttppiQLH1QmrZQ6pvjEDLEoggeIcvtoJd2
	+ElI3KQ61TTCtz7mfdbOypY8BevohhTHTSDQ/qVWoFxt3JyQ6pZcRnX9N1utV4NNFHiTtVves30
	NqGxCPgyHISEieUl+8o/nb+Es43k85n4PO1k3PIAz7OgJ69wQPUHZOQ7GpiTrDUyjm0nFWyjtfX
	w9fb7wTq5p3jYk
X-Received: by 2002:a05:620a:2259:10b0:93e:f1a7:a20 with SMTP id af79cd13be357-93ef1a754a5mr35780485a.56.1791808204214;
        Mon, 12 Oct 2026 05:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2259:10b0:93e:f1a7:a20 with SMTP id af79cd13be357-93ef1a754a5mr35776485a.56.1791808203701;
        Mon, 12 Oct 2026 05:30:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cca23csm29408461fa.27.2026.10.12.05.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:30:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:30:00 +0300
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
Message-ID: <aecrclsbhu447xdfddwbhosyvhyvf6dzfv2nfznupao4oh6a3j@mqc623n6fnkt>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
 <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
 <a09f71a4-31e7-439d-b053-66b279ea27c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09f71a4-31e7-439d-b053-66b279ea27c7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX2GQ+hvaE9QLQ
 lgGK9QNgb0m7YI7kOEbAmjMYPyzBbSMbfx2IPG0TeEX0EOoHERW9MAmwXEW1cn0/hvy7A/NFzmB
 HJUvQk6LNN6cPUE/fYVzFGQiDzbjNkTHP3nxJcKP492IFGl1ncE5/xHUPstDupMCxPVjS5GeaDN
 rRjO43CZJ1NyUvXreHsTvBE4BNAM3iPRBoTmF7Y9GZXxhPhOoosRJ6eY0Le5iwWAwUauUY582XT
 fxs8xc0Ai+Q2N05+2azpHy38vfqeuUQM6nHOirmyX/yQqNE7Hi9HqKgmXXHqY+NhjEuUeuUiR7X
 FfPb2c0OfrtZRbp/MNUbxGaKCUicmP0S8J7hYvZK36ZDYNNVre5XBlgmTkH3ZfPL4Ps714j3o9Y
 6S8exAwhNVlC/sLChX6gdxIShqtc6aO61vRR2tboIG7IFc1wZAeijaCFAdakw0MJ7InAaHMAGuV
 HhgN/K5KgzFKf85Feow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX6cOd4iUijj95
 9GXi7w5ATqq029tbPku17o8P6WeJrnmfg/M2QNvKr8ord3+h+nGG8eexvx7FHt4ZhPa39JD1LpI
 CTsvASSCvEURDNQz7EGd7Xe+2DUeViY=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accd2cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fyugVKZb8pU3dQemVCEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jfvCDToIH4MN_LeAXp8wF3PSE_37VXvy
X-Proofpoint-ORIG-GUID: jfvCDToIH4MN_LeAXp8wF3PSE_37VXvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On Mon, Oct 12, 2026 at 04:41:04PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/5/2026 9:02 AM, Dmitry Baryshkov wrote:
> > On Tue, Sep 15, 2026 at 05:27:48PM +0800, Yongxing Mou wrote:
> > > Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
> > > of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
> > > that powers the rest of the MDSS hardware.
> > > 
> > > Describe INT2 GDSC as an additional power domain of the DPU device
> > > rather than of the whole MDSS, since it only supplies DPU-local
> > > source pipes. Restrict the schema change to the Kaanapali DPU
> > > compatible via an if/then, so other platforms sharing
> > > qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
> > > existing single power-domain constraint.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
> > >   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
> > >   2 files changed, 40 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > index 3f953aa5e694..19b791a857b5 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> > > @@ -25,8 +25,7 @@ properties:
> > >     interrupts:
> > >       maxItems: 1
> > > -  power-domains:
> > > -    maxItems: 1
> > > +  power-domains: true
> > >     operating-points-v2: true
> > >     opp-table:
> > > @@ -53,4 +52,20 @@ required:
> > >     - operating-points-v2
> > >     - ports
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: qcom,kaanapali-dpu
> > > +    then:
> > > +      properties:
> > > +        power-domains:
> > > +          minItems: 2
> > > +          maxItems: 2
> > > +    else:
> > > +      properties:
> > > +        power-domains:
> > > +          maxItems: 1
> > > +
> > >   additionalProperties: true
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> > > index aa0cf0ec5b93..88aa71d2b912 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> > > @@ -61,6 +61,29 @@ required:
> > >     - clocks
> > >     - clock-names
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: qcom,kaanapali-dpu
> > > +    then:
> > > +      properties:
> > > +        power-domains:
> > > +          items:
> > > +            - description: MMCX power domain
> > > +            - description: INT2 GDSC power domain
> > > +
> > > +        power-domain-names:
> > > +          minItems: 2
> > > +          maxItems: 2
> > > +          items:
> > > +            - const: mmcx
> > > +            - const: int2
> > 
> > Nit: I'd suggest more generic names here. If the next platform switches
> > from "mmcx" to some other domain, while keeping the split architecture,
> > the name becomes unapplicable (in the past we have seen platforms using
> > CX instead of MMCX). What about using names like "core", "int2"?
> > 
> Agreed, using "mmcx" would be too provider-specific, as the DPU performance
> domain can be CX on other platforms.
> 
> However, "core" might be confusing here because DISP_CC_MDSS_CORE_GDSC is
> already attached to the parent MDSS device. The first domain on the DPU is
> used for OPP performance-state voting, so would "perf" and "int2" be clearer
> generic names?

Responded on the other patch. I think that here we should be listing two
dispcc domains and then "core" and "int2" would be proper names for
them.

> > > +
> > > +      required:
> > > +        - power-domain-names
> > > +
> > >   unevaluatedProperties: false
> > >   examples:
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry
