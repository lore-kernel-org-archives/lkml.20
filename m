Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AB73CF976
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747042; cv=none; b=FAzprEUF1im6/1769gJuAeDquhB8uQyQN8Wa9JaIIyCylvJ3var99GPaqJAfiAt5R5Foa27UUV8w5HaSeVmRrj5wESLwRxza3LNkHgoc0F0XbB63cinQxuRfBeCHVVg8wJWt1wtwECq4xg68GcwS6uiiBxCEb/65ugLGUceuZds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747042; c=relaxed/simple;
	bh=wEnBgqajFXXRvu6hDveGCvMCgI6kKQeUz4dTbvlLUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiFzJhTteFMqgsVxtXRvgwBrE7QfsXrZGbseJQT2tCRTmDDxs6oXJplVygY1fOzyilJPwC+aeWZUZvIiZv67H37j7PNuXBUwutCP0dqvGt6IoOARzDfQaNASreSlDp9BddsuSsI8IeYudLFGln+Cnc5WV/K3d+Ps9GfkQWs8hNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwV1cAiY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJF9XH5e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwV1cAiY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJF9XH5e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6870BUMD1937316
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 02:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bTyP/MvIhEcB00GtGlwFZRJ3
	HfiGKPUUykKM88tlr4o=; b=EwV1cAiYNtR37fAGV5NJsbSxWObPEArI73hyhrc6
	bW4Dgmyo7vG1Jm15BtcriqK/gUeIL2eUFhBeWtGhF826/zzqkLzTj0IBiXdmMKJN
	gvIVf9Bpi4PhxiJQ3tLJxXq+u8jfBzqb/e3LSgekdvgSCSpst0lsip/9pvrfXsnC
	QvBjHmz+tb0xFuDhrv9+3bOM4x1vddD07gt8IZAgDK3vGxawJOxUa38LZ5+KtG05
	9Fjp7f7c35D0XWdV1JvWmW6rXWdzm9+otvCLBL3xpo8WpVrK+cs91EhdckpnIQX1
	GOoMARvSKn1+qEtSO5tzmllgFAkZ1RIFRbvRhEuUK+uZGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuemnq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:10:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so6912578a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788747040; x=1789351840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTyP/MvIhEcB00GtGlwFZRJ3HfiGKPUUykKM88tlr4o=;
        b=IJF9XH5eOeE+gwyIXsABTKBchMFkkKrekvl7LCGBfyNa30dXU7oqBaZ460YTsqI7gA
         E+vxaVqLaZ5iRuWZUg1qtCNKO9Pv/LBe/YDQpuycttVcJIU5emL8UFNyiD+P1Fk8YPcG
         HAfrBY6Nx+Xt8yihDuuHSIIoZKry2xCKgFUbBGsJ3DCWDsGk5MyTKBaXTA+/riUUmxwN
         1LbnPs8+3GKU0fI4D0/2Tlvt6S/svEL7gdmirWa1ngLSo7c156HfWI3vBTsPf1KVO3HD
         S7qCt/EachUIPkLrepDvKgosFLUkQDAMUtA+j6Q/qp2Yy2E6FumPHTM2JvN8w0SpaL65
         d1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788747040; x=1789351840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTyP/MvIhEcB00GtGlwFZRJ3HfiGKPUUykKM88tlr4o=;
        b=m5hqrScp/8Mib0fjlugA62sKGxLrciAqniNBu+V+hyl6iSpoKm5prjWQAJVNTVoNQy
         z7GMpBLYWsSpTLaZ6rEXUAs8Gzo0Ur3pGzkY9eCybpOUbAblL6OAMcrq79dg6fwdn+Mr
         GAlBL1S4RN01n5DJS0MrReYMbirl8r3aIqtinpPk9u3NC+Zq5Nq4TAOoEhifktwXSgxH
         8pCMh3SkK7OSyhiJAXIBVA6DfaFfeCgXPh7CNc/kzswLIhbbobMOOyoSzKLhj0CBz0j1
         d1FP0LbruqwAz/iHYAzdoy50iHHqbH2M5Gt+8u/xgL033f2dAZlU9rrwgAdW7S8bg1FB
         xp5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzISWujkzkeJMXWWF/IZCoxL0aXJuSXn0lUl2+l4qNat/n079MHKDivAO3UlVYB3YB0cYzOqL8XI71DiEc=@vger.kernel.org
X-Gm-Message-State: AFuF++n0k4I3/OxpfX1s6PkQ25NeDLD+BODmhk3SzQzCbo79DbVEyFzv
	/FEpcKUpW9HJ9LJX9DdSForwQsJ9kvDebjlJlFLkBrdYB9G2ikOyZ5PGaYNk0Wbp794XUJaryLh
	RFqC9aSy8fzGHbL6LhQ0eoRTisXwepZVEmdyg7rXPJbN8096gpZmGAGkcU9xoczO5nQM=
X-Gm-Gg: AYBFou3mE2V56AKmYZzCgswvG/m6Tq4qElTof4K6rfMqrZhbpeUpRTMB9c6hxhspE7U
	KptmpzCnWYU4Gjp0hw2dzAZJniVlJeQQuwAJzYesBQcyeAGnsamXS4XQoxEifKLZrr4+I094eYE
	EbEctfqr/Z0lrKvxu1WUdxdzCHNB/pkEWt3vUNStTC4Lb9vmr0E11QYVx6P8cXLAsl7Gii5RmsI
	hcFg7AbBTulSVXb1yyBp4gnLKQn1SneUd9bxUGo4sMWt8joZqSxsHAeVPI2EnxyQg45Gcjkzxp4
	mHTgzHiR/eUoNJQox4D8YZdULODYzhZfPXMPJ3+MXOdEXED+XLr1O6q4D3fAT2UnI4ft4eQG8CV
	BLRbZDvX/YYJpJqt120/X3F7zNmbCJTTUHwEgOoRr+3qDRhC19MJPxRd1
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr29653955a91.18.1788747039772;
        Sun, 06 Sep 2026 19:10:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr29653876a91.18.1788747039277;
        Sun, 06 Sep 2026 19:10:39 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm19652821c88.6.2026.09.06.19.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 19:10:38 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:10:30 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Initial support for Advantech SOM-DB5830 board
Message-ID: <ap4dFma4K_ONEwrC@YUANJIEY2.ap.qualcomm.com>
References: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAxOCBTYWx0ZWRfX6I9/QNSkOXnK
 M19hfbKiBgnQ9z/JGmkfqw0ZjGvXVtDeXQVsEJnzlwaAFwhI/vBkwaLb+SOSveNptcc149QLl6L
 5Ur064dqJqTILur4RrITg8T8tc/XMX905TtUBiXmqC4/nGSWHJtiFe83uqPfGSt3OPDfg2WGwQA
 K5npHgiQX6nM/OMEOftKXWLpuUB1Cl0VkVkJ33Xj2bZ3eaVl9yNvY2Mgu2ImA9bRwMhwktaJ106
 czjC8nENItJkBgu1WlRcOqZNpcZ5V5ydilTa/r2snXt6wmV86jrc0h8SjDsOBUdyYO4hvfCeqCE
 qQS1dnUqaIGHZVvkkU8fqJ442EtRdXn0/Eo+9xwEoV7z8iSaOuptTbu81hplqVSPx6RsltJNQpB
 nE7xsbKUn6si8Xr/es/R94clkR3u6AOsEFQKQgm/Mb4ovceI0A18BRNITeMSdUDHOOiAji0CE0n
 9J4Ysr6PofADyG9JtXg==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e1d20 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nkr-iKa30n4xwhtGuzAA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: TLxG5Fmrvu6Kn-ANahqSlvvLRh6bKKUh
X-Proofpoint-ORIG-GUID: TLxG5Fmrvu6Kn-ANahqSlvvLRh6bKKUh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAxOCBTYWx0ZWRfX9r/wBPyock40
 M4A+Dq3/e3bp202mE12mYl2OS42fOoFMOjqPYamiVJCqLZuusUnC7yq0olaVBEMMAH6UFqRgE09
 7o9OzGabPePWSEQokWXcg2I/Ez/GDOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070018

On Thu, Aug 06, 2026 at 05:44:45PM +0800, Yuanjie Yang wrote:
> Board layout:
> +--------------------------------------------------+
> |               SoM (Advantech SOM-6820)           |
> |                                                  |
> |   +------------------------------------------+   |
> |   |     SiP (IQ X7181 EVK SiP)               |   |
> |   |                                          |   |
> |   |   +----------------------------------+   |   |
> |   |   |   SoC (X1E80100)                 |   |   |
> |   |   +----------------------------------+   |   |
> |   |                                          |   |
> |   +------------------------------------------+   |
> |                                                  |
> +------------------------+-------------------------+
>                          |
>                          |  Plugs into
>                          v
> +--------------------------------------------------+
> |         Carrier Board (Advantech SOM-DB5830)     |
> +--------------------------------------------------+
> 
> Introduce the device tree, DT bindings for Advantech SOM-DB5830 board.
> And fix HAMOA/PURWA IOT EVK compatibles.

Gentle reminder.

Thanks,
Yuanjie

> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
> Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
> Changes in v4
> - drop fix HAMOA/PURWA IOT EVK SOM compatibles patch
> - rebase on next-20260805
> - Link to v3: https://lore.kernel.org/all/20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com/
> 
> Changes in v3
> - add patch to fix HAMOA/PURWA IOT EVK SOM compatibles
> - update Advantech SOM-DB5830 binding and dts
> - rebase on next-20260804
> - Link to v2: https://lore.kernel.org/all/20260727070758.528-1-yuanjie.yang@oss.qualcomm.com/
> 
> Changes in v2:
> - update commit msg
> - fix binding error
> - update pcie and usb DT
> - Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/
> 
> ---
> Yuanjie Yang (2):
>       dt-bindings: arm: qcom: Add Advantech SOM-DB5830
>       arm64: dts: qcom: Add Advantech SOM-DB5830
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   7 ++
>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>  arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi    |  54 +++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts   | 119 ++++++++++++++++++++++++
>  4 files changed, 181 insertions(+)
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-hamoa-come-v4-f7033c4204e7
> 
> Best regards,
> --  
> Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
