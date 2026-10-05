Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC43C0A13
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199094; cv=none; b=d5jlNPDyLAP/oMkv6sviFHb+5n8RUykRFNGJ2yzJABfFOkA+KbXnHsQJpnwxxeJrdDrgWACe7CWBn6IfQA3ll60/qX0IeWRXm/vq1Mfl+pTjMhtQDgR4TzNppq5v2QJCFNEwr87OtvUua45TIrVe4GafnTmguKNE+PtoZymGviI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199094; c=relaxed/simple;
	bh=x7290+K8LDLQJRqw1lTNeGAFCtidX+nxRjEF0hEh1GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/36tpkB7BXiQbDbm/8IaHAaJyeJKoaL1XIv4jjeezWKUyksRsOx+3Nqxo8ayXeEoIJOqjnhRiRIUqEvKp5dz+qQDS0ctcfOLiJZafg0q6WUm+BnfoFq1xs0NjE7yreMCjprZDQIjq+XubfGejMFP45QZ9aH4ge9uJeFJZdFuAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omXrQawA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hu29Vsv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omXrQawA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hu29Vsv9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoNMB1711311
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 11:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+nl4ZBj/sgZVttd2nadDU3SE
	QhAhmStSAizdtAchuBo=; b=omXrQawAJWxTwbu6A7T30G8bizluVgW3suoorbBH
	0K9y/Tyqusek9E6rJf6RDBmwraZY8UjSTVQVEFY8eOgem+XoLVmaHROGXPMYrDtb
	TK6sq4q9XsUNSrZJ3yeQpz5FYu847oGrasFRFUjXrdLbES4i8wzBz9cwupzwOPL/
	WUht0Dxm8lSNJV9rWu1sQ/oGhpeZXvDwtl/NgkAudgpUY4oM+uqQ39mIJokRvT/L
	BacO9lI8A6Ed4arp4GxBsHdUO4W+fZIS+S5T1F7y5zRM0tTjAXgQlbDmd1M9S3Mj
	zOv7+hFRqUl9jpIf6DMzSq4dVOap19KUjS3uSg+TIGXdBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudmcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:18:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so448106085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791199086; x=1791803886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nl4ZBj/sgZVttd2nadDU3SEQhAhmStSAizdtAchuBo=;
        b=hu29Vsv9kOH3nBh546Gy4Y9kdd2gRbviXmFSVKAFCtDdDgWetxoPcoNwCQuhNPdq/D
         T8PL6sOsxJgttFzwwb7mVH0Z66xrK5SHvRpx5DV9r97gO1tftckLg7HyFkk1s3sOZK2D
         0w8vv+5ukVyUhzPcWGhXPJnVAv1W+TBsl1Oj+hL6CrlvzCGNUI5USYxgzbYVz/fBVC0B
         s/gZPZU6z5r2agE0oYAuaDnS6rDLhl5/6/xaQtyrjKel7AE5mGXSf2pqqSgZqsDnH1em
         scpzwS4OUwHfJN+3Auj3K0sfacLKrgEb/BtRR7cnWKA2CfzRBfXe8663kOzcYwktlbhL
         0zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199086; x=1791803886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nl4ZBj/sgZVttd2nadDU3SEQhAhmStSAizdtAchuBo=;
        b=rBxCnNmo66DX/XQPWZ06njjHO2I8wwTprOmaia/Yr0EACYbvX64JHRsx2pHsfo4dsr
         DPGp7X7DKOQnbYff8a9pgT9WCQ2c1s6zi4C0Dj6fRvEU3mkrYPEA8zk8t9JLzS6G+UP8
         CbY1i+WvyUzA9DVtf3UFA/uIog2KKc8PhqdDmVd6AaEJxTV3CAtOTFqzx80FZDhFYttV
         EIDGg2+WV5JiVXCi3gs4CoNSnB1vaUkvohp/+U9e5HI/yVouuyRRpZk8iljzBDRPuC7C
         BzG+1I2UHHvIIoGY3An2jUkpGCrqbYINlcm1PeQNQEeQkF5xcSqE97LLOOsjmc5A8tdG
         Be8g==
X-Forwarded-Encrypted: i=1; AKwUvBxQ3TTg2JLETBkRnwBv3fdbUAVAtuN1G6130aFO/Aea9aiHTaU53rMl2H1hEeLEqCPolf9A63EmPX3n7Hw=@vger.kernel.org
X-Gm-Message-State: AFuF++lCUsdZnFtCKRNcqye0slKFWoNaxQl2vfuAMQUIKX4P2u0kccNa
	4VC9CMWP1wD0qeh+VpXp5c8eIrBGDtZVn35nQZGLEfQwVMse3ydICkECEHwKZZktbHNw1tvbv9P
	hmy9aWyN+X/f4ZEz3EHIMMyFnUftuLQT8ORTUo845aUbB2UUg2iy6SjlTn6Cu264A4Fg=
X-Gm-Gg: AYBFou00yQoxfHEpnRadlhbltpanSxfQTo5kJJcV2Bdn12Tdc7zv6641QlxSj0D3KIe
	PziN/fQ/HhSYoy3iGmxdQ/920ZfOjvGGbDhKUSDNI/iuLJ/UH9zCQKqr7JFK56WLXmepAY4AOqu
	UUHlsWlaOOSbEkTBSMffJhX2eCaGxi8tox3t4zGlJkoiMWRmzDf2vvcVOY0l3Keh+6Usj45/XAu
	mGVWwOH7bFPLGSgmpZ0BFdEFlWJ0S0A3e7FO9ks+E4qdmyar92Uv65tt7+7nZvYd9cXzaOM8dIs
	L350MX0XPjjWutoURL7gtuHKDzmLLbKqZqtfQNpwP4kmhxdhpkqX4FmafyJOWzwbEJIgV8yQ+24
	hRbpSdPJyFUc4OzyrYoOBA+QzwBMReWud122XwjFq5/CHMBxKcYi0EcAvhUJsdaOKzwqX/YoGc9
	492tf0PP7bmD03
X-Received: by 2002:a05:620a:3196:b0:93c:b420:c2b8 with SMTP id af79cd13be357-93cf1a50df0mr2022036485a.61.1791199086438;
        Mon, 05 Oct 2026 04:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:3196:b0:93c:b420:c2b8 with SMTP id af79cd13be357-93cf1a50df0mr2022031785a.61.1791199085999;
        Mon, 05 Oct 2026 04:18:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7b04fesm3065087e87.69.2026.10.05.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:18:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:18:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Message-ID: <gbod66s7mtmmx5uj4efkc5sxu2za42pvn3ojumpsdua2hng3es@2r4bf2becz76>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX39fAleMTSu11
 slTJPDzyRgw5G9ltjOIbZeGv4SaQOZs12uJ1sOk5mB72Ne/kZHN50hY+KMiEx3YyZ8ib2nG4Pk3
 EcNM4qJkJmRofh3o9MwSSNFGsD05ytk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX+Rur1peN2snz
 HIe3jtkCTfkF+NtQruQKCaJYLLI09d2E1+F+568p760Da6qpbdVb2ZLKYdbwLyyCuGcWAlSv/47
 5z6YcM6WZi2qQbX7iRVY96dmJRWskeHGuwZNNkMYrj91VX6v/o1jdp45mBo9KzbJ6/WBSoySHTm
 AGb1pJtNWIC8wVQiNXf6vSEhpaPNyeBII9bbRT7t8sOVHCeBrUBZv/2v0+YaD1Vlf/jwWJdoppK
 SamcUQX9pRNIxiEwjWM+5fy9CnYcEIRnM0b2MzKlpEl5ycjgBaKq3gyMTc9un63E217Nmmpi2iR
 OEQcNHfE2L4H50zqu33RnjpKIx+97GpItrhB2E7+tS8zIFIceLfn/VzWhacQqljXvOS71J29QJ6
 I6E2CvT4qonM3jXq3SIIsxbXSm77bIodxI1cK5mqqwgEs1ejV3VgtzC6/mBUDxjZqCUllZR/1sG
 BqyR1HDVglil0E8/n6Q==
X-Proofpoint-GUID: deeHN1bFb2gy11gpuhlalTwgLTtoiuoQ
X-Proofpoint-ORIG-GUID: deeHN1bFb2gy11gpuhlalTwgLTtoiuoQ
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac38773 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mkGK_8PVERwZuiyPypMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

On Mon, Oct 05, 2026 at 04:44:46PM +0530, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
> 
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
>  arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
