Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E4403E9D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764160; cv=none; b=dERJPrxkNLvGDSLTX+K8qj4EL19aIsgp0b4IGuyNTbzBq0T0PWszFbMdcDgz9hsT31RPL8CyGocvLJPNACvlTezjr1pnDfE9UTAVo12uxIcX93SJ0+zb4GAYGsA/iug4W7vqjksXDLv0EKZJ3G9QBNlDPXAR5dz4mitTqRvNatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764160; c=relaxed/simple;
	bh=IUdf14I4+jWE+TfxtC/gC9l4ctJDVAQisE6B1hm+Uzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHaY8BAKUli0J1bXSghobw5XNmHgePgD8SUVuR2uU9EInf8aIyqctLGZP6icI5BnPsPLmZvDWRbkn67d7AVnx6SOQDNwJ2Xcgsj6Nt8yJR66TZx7vzJG50gfwulPQH/KT+XG+zeuzgyntmmkUXm1R+4JoMEXHP3wnkO0LGjqMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFWQW/OD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGURjKRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFWQW/OD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGURjKRD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l2fD1699684
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 06:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrnuhHe7eYsauWd62qNHEpZHKwgT1SJIFquJMZsSrug=; b=NFWQW/ODQjFFJ/1T
	evIckK4mIyUHyRRabJbjJjWGs5miQtVkmMpGiVpB3H1mJCfDZH78rg1fbUI4Hr7m
	5e0w2r+9MbWOnvKI3kxdDCpzDJFtFKGEZP8r61eaaRfNUaW/b9AXW0+sBLhOCSff
	8NeYRXj+T4PopOFJ0yapmMlszoR3S+cr7HYf5ou4EE9YzEHpq03APnqe4ASO1GuO
	Zr3ZpyxkASTZLvHSGPJIFQs4Er0g+k4D/XG2oWpqtfpfF+8SThKY+2o6uwXg+KUH
	OkS0B9SpI2QcUa9pTEULiqI/EaSguswIlgmZOsdFiHbSxNwayop3oSylc9vj7CxH
	AJIF2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdcum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:55:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3989692a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788764155; x=1789368955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrnuhHe7eYsauWd62qNHEpZHKwgT1SJIFquJMZsSrug=;
        b=UGURjKRDFBgKioeHBZ2SCBmYK0CrQ2vWW+Iao8fLw6+zbQakVJ/pPFuVlH8q0kgUM/
         BSlT1BdlvNqaNxx+LHWQA4FWsL0SI7qFC6S2DZrGj0Coxmf1ZN0fvcVCdqSSOwenmh/u
         FL3xS1MoANBSq6ylXzgd50joqL2DMdRAy+LAPM/3Jo/71+CxtIi+1zQBeeUEDsOyo5wW
         3KtWgtwJ8JVuuYAf5o50ZspFjcYkUJggyoaHDAeTyzB+MoWxVDiDHRYqMa+KPd0+WzWI
         AehW9o+VRQSMZEenFsjF+O7AMTzZVfN6mSDpDCyMr/okbvM9ORGHbT4znZu0QmQRx1eL
         GEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764155; x=1789368955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DrnuhHe7eYsauWd62qNHEpZHKwgT1SJIFquJMZsSrug=;
        b=YdQ8xXWnjiovD/iPHbcdTjn5CDDc2OknDwGei8DfGhEcxsEpPHw58YcYmg7WJEhRkD
         hiRHkM9L/I/GqDcfUknPpiKEDERcDeblLOlX2HayrwcfITaMHA/mqpAVesmbugl98QXd
         F9G8uHPl3CYMFb/Mno+HZoo/7dgb59y3Y3JH8Ekf5URT9XNJEZ/x2BU2qmXc+mxiM8mY
         6Q1WCesOPNyjGl6hhIiUkS8MWB7OwGSWuPFnWb0fXNUts+2kY4k5ONKspDyC0G4env5p
         6Rp5JCHr8AZqAJ2iif1tzGZkFThkIBW8htKa8crZ3sweOAwP5TLOws3vR9xP29sLBr5o
         QWCA==
X-Forwarded-Encrypted: i=1; AKwUvBwavZq+N0UwbCF4n3OohEC0Q1frnbe0s7mgBKgta4HvXF0R8GBqb9lfArTR0oYewJZTJNH5wNcEksbD1JA=@vger.kernel.org
X-Gm-Message-State: AFuF++n3yoZumbrN5mpAoCENYwzT/axswH09hRZ9iiU5JiPUiYT5dlbS
	SFtaolh0VQ6W5f5hktfO+NOnuCtD0aatcER67cK40q0dt3g/Ya52bKjpt3j5xNqv14ped1VrzBe
	36Svo3c+63VgJESuJ1wTdlHeYxgZvRg/V/WVcTAkN2Z6VX9LsEZUbbVHCcV5fyzKV6Jw=
X-Gm-Gg: AYBFou2mqkzru7meAnAGGAk0n6Ky11eDaTvFdrdZss/dEfOEzc+PGdlt6dK52iMESfg
	FBqoghmT34hWON0CeqB9jMhSrAeGC4kUUQcqjX3jaArNhRGJU7spQeRFRFdVyhuMyF2+FkoHyEw
	5PF3NtdxqxxAvPJw2NIm4wllyFF1iz2MNpiKHS627bOa3Q87C1P0/us/KNsBdH2ncC4uO6AhqYC
	k3TY8N+ptV1gZOGuyefgAPMOXXN0Am+qak/3o/fbmJvD0WY6h71Y/VA/jYld+mqklGkJHyV4zP9
	JCLSr3yN+1/FN2SdvS+ltBCFRAmdQ7aYV9F7orAkUi+/8Rut/rPYo6wWqzRYQVi+Wqs/iZq4BMk
	iEWE4wj4BlK7kOT6cqwNMimiMByudxQ==
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr32298923a91.0.1788764154649;
        Sun, 06 Sep 2026 23:55:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr32298879a91.0.1788764154092;
        Sun, 06 Sep 2026 23:55:54 -0700 (PDT)
Received: from [10.92.167.32] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm2656767eec.3.2026.09.06.23.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:55:53 -0700 (PDT)
Message-ID: <581a1f3b-1883-462c-96bb-06b2e7b727f0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bIgm9hRCjKEevsRkAxFZ18wDv_QBTMXG
X-Proofpoint-ORIG-GUID: bIgm9hRCjKEevsRkAxFZ18wDv_QBTMXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfX1viGbayq17AM
 1MZTL6LnHeiy4AEL2t5dAt7sW4MS43Hfm+i0KP3XVaxVuclWS+zB4ESQKesQVKuZBkbSagfLn2s
 D9h6lZp5V+3a2Wm+L3A3dHCHBRihJvxYUcL2xo6xugCoT7GNPYWsLZ6F20L/8LnfDLw10Hxpgz6
 vpU46CTHe/dJZilo+rytu2AkroNOoxd2hSFdhxw/WM3zljYNCpFEN4DbWK4OQzWGgND9cK0Znhl
 u0vzdHV9s5WCRPxZyrgF0lGBTIAt+iImVLcekmPvIvsJQ1jPKQjlFVHCc4fndb9EiW7YnYByPgi
 w2psnJk1+ghGifHUK/8KkkGffn0Ez8VyT0r3TYpx8cxwjXV7YajHkE0qDyAGfyg8CHIAVyYOjT5
 JMRoZ4SVQD3j4DtMlbuNvl2SxfaPSrJSsK69jFdaI4AR/rGt1RLhXjqrqaKfElWekNOeFYP60Pj
 KG4exVgi+1Bnk9dX/Tg==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e5ffe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eVVSAIOIRSDSNroG8R0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfX1y2/nlGWLuBT
 y2zW59g2YxqWq5NAxrQ4130fBbskXrSWWLNrljn8JWSEQJ8BuonYQhzLbUPAYnPcOVgX2OLIaxN
 9YpGgmVavoMXYAiZ4gS3Jr4naJ5iqFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070072

On 20-08-2026 16:23, Kuldeep Singh wrote:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
> 
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
> 
> Also connect the SDHC controller to ICE via "qcom,ice" property to
> support inline encryption.
> 
> On Shikra, different BAM pipe pairs (for example 0x84/0x94 and
> 0x86/0x96) may still resolve to the same resulting SID due SMMU-side
> optimization. They are still distinct pipe pairs and therefore require
> separate DT IOMMU entries.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>-- 

Hi Bjorn/Herbert,

Shikra is actually derivative of agatti which is following a different
crypto(qce) configuration different from other targets.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/crypto/qcom-qce.yaml#n40

The current qce _is_ still working by not voting for the clocks as
clk-smd-rpm driver was doing proxy voting.
In recent discussion with clocks team, it's identified that clk-smd-rpm
driver will drop proxy voting and recommendation for qce is to vote for
clocks explicitly.

I'll be sending v6 with the change ASAP follwing agatti's convention.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/agatti.dtsi#n889

Sorry for inconvenience!! as I see patches are applied in the tree.

Regards
Kuldeep

