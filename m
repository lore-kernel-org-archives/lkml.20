Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38603E44F9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170751; cv=none; b=V/rpKbN/SaD1yGPikMfj3l7a0r84KzO6GfGJYj2uR+1cSJoMTm8y/qKmVVC8SkiGmi3RDino+Mb9OGdXXWZ17RekTAe3hqmXsgCsqcCOBr27Mq61ZO/+CkVkecIOhc+gHdYv05MZtEUPNR24pC7vMJs4ousKY+2h75WSY3axR2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170751; c=relaxed/simple;
	bh=9WUTQgRakephEhhifi2ai7YVHSAGw7Ewg8/ZVPhpY6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fqw9K1lFWroIAWl5edSmLTxpyHzzo5E7HYHLpHQEQBB0FK/B4yjRWtx+duAfl6uTMktfFFU3K0U8LxztJ3SpwOCMcnsTYZW5T33y9iyHdZmpv7yIGOmoni0nFSH2qtXhmrsOXSssju6TCC8Fp6vO9etdo/OMouXNLgL4WBVXb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lA+BHz7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDlrDTtX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA+BHz7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDlrDTtX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8t8Lt3215098
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=; b=lA+BHz7xafasOZM+
	OeRtipnaY/XyUvBm3wO+CoqzMcFzXqrxNw7TYMLNqQ0/Mo7xTjSWWRdVNfDukGb7
	GSyLEB4X4DRFyn1TzCoWI6Kp9AiPou5DQAsjwoYVT42eCOktgd3nMoVxRVcr+Bag
	+G2JOdl5kFCFR/tINGFyHtXqW1KncdIQYcN+3V7u80VUQ0EPkV2eJGH9tJqVTDWn
	ivjK16vqK8erYRAHWd+F6HMpqopwrvKwDDiQrOA5q9mQuJGybXiIpY+t6JPmVQ3i
	sPBWHGRiviLKu2SAbDf1bYfMB5gTu79MJFP5DuYvxBdqQ7dEe+gi6LBNW2MQ4A0d
	AiI1CQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h909e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4323829a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170748; x=1788775548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=;
        b=TDlrDTtXM7bzNpXBYpAzARmHlCKCWrNY/ebGX+rfEMxwyISOu34LJhL/UxVVk452UP
         bc9FC+IxbmqoLQMYQg42MNUaIgO7ijKeYBsV+PXDAt9SEt4BurBWLmMwN5bIl16SMKfh
         etFYMsrz6swMtBNRl9JirCvWvOyob4sWzTZDfrD/Cnbl6YZx3j60Dq0vMwUoLj31owB+
         0i/6toQEoEBU7uqwVeuXd8KE/oyLJidyBOB6eSzpvozcd/EvzOuqPlJ/KWmPYPOrH0P0
         QrBKoBVH93m+fnCqrhhCtjtbI/KSX++BJAsGF1k0AiT7PsBZb7zI9eaOng0KNrj1lMSf
         qb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170748; x=1788775548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+ZCPBk8xNaTdT/fPNIiH2AYV8M935CIdskx7gdi4fM=;
        b=kCfX70T8vaYvCcPyYf4ulWK4HMnqQiKT8ErFnJ33n/QG+tFI52W9pj1kZz9g3Udsab
         tGhFPrGKB7YECnx3Vl2vLVZZqbNMjVkc24SeHL07i6+Wc2FFeRtB7KU+2BiddHD7JNVB
         s0sfpJFLus8/X9LSwEILwgTOvqKl28GvJV3uUaP63HNc3+6ZI7+CfHI8XZhEMkmsMhlW
         /Ze1qMFgjZGnt0rFSGkQ4Z31pJMuumxWNDrFk/4zfdP6k2o5DzY3o0bekqN9cp7yQuKI
         TTreXFf9bGmGLjitsLF2p1gNIz+Tgfa4QNqqXIMtihQPv+nSYx5Q3AOT5i3s6SLWdg0w
         /Yvg==
X-Forwarded-Encrypted: i=1; AKwUvByDEtmsMDIrA64SUA6lWfne/aSk7XhITkBBfVN7Edbtiz70wYarebxIydd9TWxHqGtKk7oRIZBsvfIclv8=@vger.kernel.org
X-Gm-Message-State: AFuF++mT9FCuzbr0kpE1t8ULGrVsaRr3VzzDLw0TItOHpxvZQcuLVEyk
	QjfMq/c/C3VZwZmHzC8N4pSs2bNTgJ1GsC5NcuTN+TFGOXRInXFDjykgmUxapOhSBWYPxsc/Cb7
	YTmsXze0g8e2uqOw61wdFC8FhcChcHtfy/F9+3UA3FV2ZjKT4xrDWgEURzBariO8Ywo0=
X-Gm-Gg: AYBFou0UWvFXgQp9BSdoHTPrrHduxKaNkzHR4GeFr53PauMAGUZE3Bg4/PURXGkBmvG
	6nvuXHnzAPii4r9HHmdC1DosQungNXh8GI4RsF0Ww0Fz2U/C9a7o7c8Ae1GL4TV+mWKxP5wqjri
	dAQmMcY5RYZx7q/4hcFBQVz7MqvGRlRy+JVjVgAqCh9FMtbt1WN75ICYQQLZTDkSRNI4VmPhbTw
	NrF1MbmfkhKUsV7k2S/BkIJiYox4swZ5IWQdhnMGFdmWOHmBCkauZgppe8xiAITZuWCgHqxvsu2
	L8+CQgZCCWSNt3RotC72aOPUdxMN/T0YgCbCJLpyLHezbFfCAsYtt89AfOKH8i/rdg+S+Ik01DD
	02ae/HBQaSaUiv+UBbvpWK6QKTF2spXlO9rIfWVlQPyRca7juh4qPJ+Fon1i3asaMlfKZj2w=
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr25646074a91.17.1788170747875;
        Mon, 31 Aug 2026 03:05:47 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-3989bd135c0mr25645956a91.17.1788170747310;
        Mon, 31 Aug 2026 03:05:47 -0700 (PDT)
Received: from [10.133.33.190] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc0c703sm16294336a91.9.2026.08.31.03.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:05:46 -0700 (PDT)
Message-ID: <89805886-ba34-47d7-845f-904db15c7b17@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:05:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Maili PCIe PHY compatibles
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a9551fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6mMdS-TofruHI7CEqrkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: j22CPzUEYg68IHpgcsY2g99H4l1aRfF-
X-Proofpoint-GUID: j22CPzUEYg68IHpgcsY2g99H4l1aRfF-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX865gjyV0SLhE
 0CM/X0sg79VQ7f862RcGfbbHFoVSbIy1VBRaYRhydSnd75Pk7dH1FueLUS0yVCLeCUaCz0idTvo
 W0Y1pVvTLAeU0KBBoBoxYBOjt50yR04=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX/eyeKjcfzf2t
 xLGqUB/Q1vM1OKM5HRtWiH773BLP0hsg7/YAFt9PWsSE/MMw5FB0WLHNp/B+2JgzDcNRnCAyTGr
 05b/kwO+e3RFpDvP5NjFjW1vofsz0x3wgZ3A0/xFOjvwT1y2bcvIcToVJ6lAWleIXiYAu8Cr/jo
 lNFx/MQ+oBzTzdl9RH6vymw8fSt1djUeIVFL17z0UupG9/qqUAUGcS1p/xrqM3M9Erp6ec5zo5F
 dO3N/v29lSIR8cR2g0rSvJCkk/ubHS7Vy/YC0L0tEZIPAKT/n0T9o2laL19eZQhbcElwutACb4N
 4LHSJzWGlVrD8dWw8aeADlOvUa1P0yRujoAmUwsV0mORd1RjJvx3JAJjbIV3xfuOwCPlPqk60WQ
 yDgPDu80Z4UqwuSW+L5UuFyFY9BKzZR4naYF1i7+VgneFbXH8o+cWwf/kCzhD53V4zryj+M4v16
 5SJlaGC3DO8CpviTXFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086



On 8/31/2026 2:25 PM, Vivek Pernamitta wrote:
> Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
> compatible strings for the Maili SoC PCIe QMP PHY.
> 
> The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
> architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
> Changes in V2:
> - Rebases to the latest code.
> - PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
>    change is already merged, so dropping change
> V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
> ---
> 
> ---
>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

This patch did not show the falling back relationship between Maili
and Hawi, please check and update.

Thanks,
Jingyi

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index b353b7bfb839ce9cc43ecd9ef96d174a7750b35b..701f0fc178220da5e3d2748330179c2193ff7418 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -23,6 +23,8 @@ properties:
>         - qcom,hawi-qmp-gen3x2-pcie-phy
>         - qcom,hawi-qmp-gen4x1-pcie-phy
>         - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen3x2-pcie-phy
> +      - qcom,maili-qmp-gen4x1-pcie-phy
>         - qcom,qcs615-qmp-gen3x1-pcie-phy
>         - qcom,qcs8300-qmp-gen4x2-pcie-phy
>         - qcom,sa8775p-qmp-gen4x2-pcie-phy
> @@ -202,6 +204,8 @@ allOf:
>                 - qcom,glymur-qmp-gen5x4-pcie-phy
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,qcs8300-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x2-pcie-phy
>                 - qcom,sa8775p-qmp-gen4x4-pcie-phy
> @@ -232,6 +236,8 @@ allOf:
>                 - qcom,hawi-qmp-gen3x2-pcie-phy
>                 - qcom,hawi-qmp-gen4x1-pcie-phy
>                 - qcom,kaanapali-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen3x2-pcie-phy
> +              - qcom,maili-qmp-gen4x1-pcie-phy
>                 - qcom,sm8550-qmp-gen4x2-pcie-phy
>                 - qcom,sm8650-qmp-gen4x2-pcie-phy
>                 - qcom,x1e80100-qmp-gen3x2-pcie-phy
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260831-vdev_phy_next-20260828-afecafb5ecb4
> 
> Best regards,

