Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF733C1D48
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162889; cv=none; b=AwYKT7Bns54rCjOKCHg0cz5zOh2k00x70okuC+4UH8UD+FNCxPUaAm7Y+V8hyXfCBWqw5NcgTLnG/Vg3fE5EazsX45sRN1UF1Lxpd1wM4WL7l+hZMLUviLfDZPmONzhW3+JpY9evReOxRP0OrUjWp3GzzzjAMOlH+9tMSDNldUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162889; c=relaxed/simple;
	bh=ZXNUMeyA9Kooe1teg7duNPKgU8sYXLIOjB2Mmy38Hk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaQKluY0JsR2VylPAqwDzu9V2TH9UPBP5U8XZ2Qsd8RMV7wpL3h+KV+Dfyf4v7NwbrMYJ08NcN6rY2hAzpM7k49YR3U3x6qRq/tw1xj6DxijVLxxz3KDQyJdvqokGtouECp6gXA2bRoYPZILCct18UjL0Q+WtVSQR3s/IS73PKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o461NXyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHBsH8ex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o461NXyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHBsH8ex"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7L0nj2374156
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SePPvMBxpaGoDJhHrmxh33/I8LF7sPSpOeAAcC2frqc=; b=o461NXyCXoygd1RA
	VCJENKDrt7zYXZp5QGLvjzWYSuesVy4N47reVzWhT6SWKMAn2G/lft7T4a+c+eJZ
	ZwZcIP1OtqnuiIlMzpr/eGOpzrZRX57VMXFVxobK86iDkgurQju3wonsKCRXGk1U
	fQkFaFyDzCQO0hX/3Ro4OTAWS+wu617bwsN1axJ85dQ+Y6id9IGVTmR5X0uxm5Hk
	9fNC/zo+3wNzW4wPlCL2/rFX+vBydf1MhYIST6m8dS35BdCS/o02Lcuq/L0sXQ/0
	3BkOEoFmSb43DSujMVatjP3npG5yVcnbV/vkR+c0FLd2+5b/hAi49b0rsMpicPMZ
	rjLFTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r447-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:54:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53002215979so4319211cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788162886; x=1788767686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SePPvMBxpaGoDJhHrmxh33/I8LF7sPSpOeAAcC2frqc=;
        b=RHBsH8exlms/pMbGlWi7zl+MCQQbK9wpNSV8U3js3jpPvQsF44iDv1smY0nTaPW8MZ
         uV79sKwXOdprUGTnlDT+pYYR52gDU8snq59CPbSG1hWqUJ/VbWrVN3ZFMXHgjL3kX5Oy
         QkEDZbIvvY0Es5HAlN1IwgbXdI5JS9unCN8anZUGhOFi+4M6IcFqSuonxCez3MKDtrOM
         /Lw9YIMZcGJ3NDmP+xKLULLaCY48VICGvI6zza38Q5Qt2NjIQ3wS6Xjezec8pnm5M4Wr
         qsVJ+TX13T5lFFdtg53OBLIfzFW4BxBmf1Ly0NvNIwUroaaONJXanSpPdbD9Jw7Zm6fW
         B3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162886; x=1788767686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SePPvMBxpaGoDJhHrmxh33/I8LF7sPSpOeAAcC2frqc=;
        b=eGiuRiEyQ5ZoVrRVcEX2vV3iZmbUW44VBYlmeEDko3HQDX5KLKqXFcrURM7DvU812L
         SHsdq4gI7mu7iX1ZdVk39eUEd4Rm/B+g8xClLT/MoCWmPMwG2zU5Z0BnMNyYrlEVeGc1
         Gu+o8LmW20dPaiZYUxrEXTE9fSAPQEBm6YufOPOHRQL62yGENy7doV8RDedlWhJ+apZm
         hkZHT8MSxMhEsqXz7AdO7tjFhqeV+uYsobH9rNC60nnds4EVnTboXleSHBYZBqNh3Vlh
         v+BChXq5kef3JkmD6vCgEmq2MP6SrHOUcwVPa5qEre9BSQX2YMQqWarUFEUeMcOY4vf5
         Me3w==
X-Forwarded-Encrypted: i=1; AHgh+RpQPbRt79W5hL1cFUP5o4O7r12vTtf/YuISbyaIwmB4iA7x2g73yjifmhnZrmzyeNW+VyDSSxNvimpuQAo=@vger.kernel.org
X-Gm-Message-State: AFuF++mRnApZe5i4vsEoh/YSOg5W6fVdIvFNq5OyNo/Uec95X+t3TH29
	o1J1vJs+N6XHptBgYDYFBKlJ5myRO8pciKmafpUstvnxL51wivYrVIBaFA8JYrfJHah529+Y/0X
	UG8X0HWgwGI18O8zlzFrlgLtQl+RaKJVrwX2GAoIkfl0w2pu90/jh4tNzsRqRmBzqA+0=
X-Gm-Gg: AR+sD10vgBY9LW6HCTJJqis35RO/IL7T4pa4WXO7KNwDYeV7yzkL17x9ahpm1U6BLzA
	tIS7++gvhmh+GyXj5J3SPIiOlzasKxK9/jwJDj3a0vh9KO9bO7wVdilMOipjGGImwHO7uwECoiv
	SK28atx+PI4Kon+dsFoigyPjlNVacNNW8Wf7LNLtbWTnpKDrAyptaIzQzV646TLTILqMPjRA/sC
	tA8TAx6076eGelfhFGq+Pu2LQDkDdTglVZX8IB+umkUcDv1YKyD1JM050uqli7B8H9Y9+L5hmh6
	2jovSf35Z6cjB3war8WtakrWCxgxZMpVozTyla76P++pz6J3Q2aOWRJ0YeFspwVet2HRU7Izih4
	Tww7AOgxwEtS9ZtNUqrU/AQ==
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr193281901cf.3.1788162885895;
        Mon, 31 Aug 2026 00:54:45 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr193281791cf.3.1788162885465;
        Mon, 31 Aug 2026 00:54:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c3f7sm3232618a12.6.2026.08.31.00.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:54:43 -0700 (PDT)
Message-ID: <aabdae7c-5294-4789-b123-4fcff8a733e0@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:54:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
 <20260828-nord-v2-1-18bf59d19d6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-1-18bf59d19d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NiBTYWx0ZWRfX1qZ3nvPzZQUY
 ILvZJy0MlsRSTILE+WfdGIYLA8YSCNcD7ngWHxLOXogNQkQ8XpXsky0ugY4LCg316Vf/sJOLeD9
 9ngupcAsK30ljVH265N+bvTj36iNhi0=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a953346 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=96DL8lvnHqRkPdvoplQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: -mt-wskc5MFl6H42l2CapeYUyJYL5m-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NiBTYWx0ZWRfX6YwhARWtp3tX
 bm9zv0LmiEa27sJF/UfxafOatz5QnrxKThOKQ/WyugO+0dq8Hb4dRMAgufmnXzOeoUG+w34L2M8
 ufCAdm0XQ4eREskb/+zwrQoVsrVzirmDkgflj3/CkBOIjqyHCdtvCo6dxr/2a0I0OfiP+g6Vvqk
 gKkHWpK/+ieEV+H3xSCS8fQm1xoY5bEiO3KVfSRbOu5bBWwuCWb+rwun46j8jCeT0NwD+5O/aNt
 aNnFJkVnkbnou7Shb8BGRkkd6QgeNfCIb0eEb6nSV1JRB5M0kg2u232aXXs2Pr71isksYkDIHdj
 JehuVl2Qk511MKY3nD+Q5YUJSdTDXUdn8M77r+XIZ3gC3AkPa0y+pPtGsL+RR1aZyAKM1JZ9q2Q
 /f7A0zz/bUFEFz7YoSshX1/NmLREvyBCgbXgV8+v5Yecppva2T1XCyurWA99S+XTGja3zY5oGIk
 0LFkBIu5ge82SySXvvw==
X-Proofpoint-GUID: -mt-wskc5MFl6H42l2CapeYUyJYL5m-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310066

On 8/28/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> Document the PCIe PHY found on the Qualcomm Nord platform.
> 
> Nord has a Gen5-capable QMP PCIe PHY that can operate in multiple
> lane configurations using four PHY segments (A/B/C/D). The active
> topology is selected by firmware through a TCSR configuration
> register and may be configured as x16, x8+x8, x8+x4+x4, or
> x8+x4+x2+x2.
> 
> The binding describes the register regions, clocks, resets, power
> domains, regulators, PHY provider interface, clock provider interface,
> and the qcom,link-mode property used by the driver to discover the
> active lane configuration programmed by firmware.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 276 +++++++++++++++++++++
>  1 file changed, 276 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> new file mode 100644
> index 000000000000..37198f82c611
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> @@ -0,0 +1,276 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord QMP Bifurcated PCIe PHY

Quadfurcated, perhaps? Is there a word in the spec that doesn't get too
detailed about the number of effective slots that the PHY is divided into?

[...]

> +  vdda-phy-a-supply: true
> +
> +  vdda-phy-b-supply: true
> +
> +  vdda-phy-c-supply: true
> +
> +  vdda-phy-d-supply: true
> +
> +  vdda-pll-a-supply: true
> +
> +  vdda-pll-b-supply: true
> +
> +  vdda-pll-c-supply: true
> +
> +  vdda-pll-d-supply: true

I'm really surprised they aren't all connected to the same pair but oh well

Konrad
