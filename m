Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF83C1D76
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441986; cv=pass; b=O9S/bheBTnH6KkHonr0xUIVbvPW4cJyU74FTCV2a3Dt3y8BwnRBGvkoHzBRzypdQoXwfl9K6gj5R1Dmy5h15FOZuozLLL4EDvIK20vQKrk/kUpPQfM5riLAtUTiqJgsGf4jS3nyfG6Wa6K7hXY7xjrWQVk3jq2BjkCPouzNzU0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441986; c=relaxed/simple;
	bh=5QtGSacmsoONB87IdoPl0Fn+Eom9ihnvfpDZQqc0fEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQFGE68FMTWL2fCorFLabf3/6jX7HDRBHguGPbhlmM0cTByX0AMCK9tpUCsmh0H8XKHqG8+S7nHFbC5V+WwnYwULtTfW6NWcoamcj4132yqrYxfytmG4YZncYt+PYClqZPlHKtP1N1fRPPlLlKStDlha3zISe4GaabbVfNnfMBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nro0vkm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3DjBryL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nro0vkm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3DjBryL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984C3SD2146855
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=; b=Nro0vkm5wMnB3qtP
	+4w2I/Fyky8W2z1/nU7SV8mP+TXgGrsM2pSj55S4cKFo/ftJqddEZcRYWfkVOSaD
	VZV9Cuu4v1XAvIls3hC2ZfCVrvR8YKSp/DEJhsPnZOcoY9UWEefVy572jTGOK4a6
	UkSnVOtkVVpwqnx2+boFXZHyok+t3FSC4VPALXjC6SumxoiH8JZ+ktoIIlONkhXr
	o0+BNnDECXDJDTFGTT72UNdje9kVss2wlkfu4Iu6xw0FvFFyWhnrEJ1V1xEBhIyu
	qsGdfU0aVS87GIzlWu+jv0r0WynzNWsKzNYs2y14p2kH/QGIiGlPf5VXcxWoa6dj
	PkKk2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81fu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:46:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so2925970a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791441982; cv=none;
        d=google.com; s=arc-20260327;
        b=YGKVK34ICqn5GqKC6IuHf8koYQy6pLqyygeVTu69cOJghSIsPeS8PntLFGn/3rpHSS
         Yf1VZuM0+titNAfKj8FxhxunRY0OXJCUfkQxhfNX6O80kM5UWEHbRfmHk9zuMF1nPPBU
         dduIYUYXcWHkUoMGmSGYLc9Q64VnJqM6318R+ci65dBoDxR5fcF3EbWqvojm1/BlwUGk
         A3ldfnxA2D2IkC3xVuTFkIZ/m8IwZL9j83nDKlpeZDcGJ/XWh15xzC4y493OSDMNj5Ah
         fmioXe4pymASbo9aVMIDW0EZeGQCpCN4gvlsFaWljejr6UZezZ+yCTK50/WQkyW0DGF5
         j1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=;
        fh=8NFMHzAoGe6I0Dr3RpZkozBwZ9EF+k2Z6jZ+wuUA5jw=;
        b=c/rXqwAkOSOuM3b+ZpwJsJkz+lsDR5MzRCpMRN73FwovAidaY8VhciP9QFLHkJN+5r
         pLTfYg7LyoiskPxSQC7KdaJuTpnZXv7tXeUY0Q8vhruMYSeTnJba/QPtxv2d9EvC2tr6
         tL8fmLmHZrNSmTIR6Vnyy0egNB9A2M43jwjoIvb2PVmrVMTKLn804FRs5CQdrgdNkter
         ln346sNe5Isz7POvP+3ZSJG/kfYXPFSYqplBBLDMv7jhOSi1+yoKuj1ekHPmeKET7HwQ
         ADj2o02N9sbtBCnv9Iy/CCHCE7iPhypckd2c9ODWcfd9gQdqIAYqMtXDVdLOm8Md5qrQ
         mMuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791441982; x=1792046782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=;
        b=j3DjBryL3X4Q6cmGbX6lUXpEBF5Ysft5EaqQhrHqKJX0OwN/CJ/TuJ00OWKjQ/a62R
         evfL51dv3SOvsvi+ydVwA2FmW3sjGACzu/snmtF0VJCKQ9y+HFrPkPoPluo92CyEfNmG
         xvMCc3oNTCvdTy+1q3sObL/wskHmSMD/CPY4UJUTZrpoLIJG04+SpBwfj7a88873Xfnu
         3g6zsN7gi9CqJEVD7eobuaEYgZJG2bCv6fOclexL/TtTiyEPpBPpvjZKj5vJ/Zo5WvoS
         6IC8+7nHtogRY/PS1YhWn5Xx+T3AL+oTVwxmhfukwkj8ujlsZaL//eUnFIQaPa0uQpEN
         IpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441982; x=1792046782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynir5UKDYCHKsIV/SiEktgpoNpmpfZkJi8BxEZtVkn0=;
        b=DZv7JmVeWFuUnwU7t+56nc14OHyc+hPbxb97fhkhLpMp47ibFPG5XuNBRGGXb5syXp
         I+iEz/GRPXyVE3aFqjWrITwznEJETnXm60/cSR7HOWw+oJBozI3Hr3qHl0PIaF7uDgLN
         zcv5THL9bfqBF772h5y1I8SIaW/4W6+OPVTMAPovR9QXSmY3e+y6cYpwvsiJND7NKOTt
         ESgxB5ktc6V2SvnS4uMmdX4bygBRHmKG4E+lqVUC+92EWeu38Huee5F8z/3JacoD+X9r
         ahurJ/SJjBE2nglz7Zmsf5Jhpoxu40aqrbEXvM/UJQb48VxHUSfdU7O05hD448O2BcRe
         sB0w==
X-Forwarded-Encrypted: i=1; AKwUvBwoy8z9xvUDmZ5J16l4mwGhr7nY6l3iFgG3efe2JEwcs8UQlebOXtRSYJItG5ndlyAWV27Iu8gc7hOFkM4=@vger.kernel.org
X-Gm-Message-State: AFuF++kUh9s31HrfwmDKMNS0TcMQoc/CqsRHEBXstGsMUP40Tl+3uyX9
	CYYIwnEFxh7AAAt/naCuoNv/wy+gVJ77lCBmmDCr8A7syzLboa/xguwVSXsANVzxBwKvdh0q5OJ
	kqv74DFWXflyOLU/U7Sqv+alQI8rPvnLa310mhYVc0zOOsDwHIb4+vdvu7r+5ihY6YV/ZalDOZR
	mrJ4qnebETv67n9/euN8axYlxSqWSSqY/zzrV5UjRgTA==
X-Gm-Gg: AYBFou3p7zmeXPIiN1/L5siG40mmh9J2UGY0yExOoM2yCKlD9r4tcWK8nyXGBsTgELw
	bFuDFG3JC7aJCebM/t+IYdemWM1VT55hWMJZESCt++cTVcM4qq2Oi6zyZSnGDfh1d0LaVcZy9Ld
	MfUqnTJ7/BkAtUeKDmiKtqyULiBCGS1HUN2GE+EHpnrXbE+RLGzJFtwW1qlQ==
X-Received: by 2002:a05:6a21:62c2:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3e13403e252mr3919066637.22.1791441982462;
        Wed, 07 Oct 2026 23:46:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c2:b0:3d3:adbf:7781 with SMTP id
 adf61e73a8af0-3e13403e252mr3919033637.22.1791441981779; Wed, 07 Oct 2026
 23:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:46:10 +0800
X-Gm-Features: AclHuK9cxR2Z8imM67b3vN_Ew1tvSO6gdzHAd9wpAvyBxUcgGM14SQWbw8GocXc
Message-ID: <CAFkd8hujKYhXveemgPCbsUk5DFB=fQSxqK_-69fP5aPzoWSzbQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX1Hoy5odULnCz
 s+TQwieTEWkdTWtGKNDjuelXtBvFYMQS36/sG2XC5z3SlfLEMbAhGllmyrp1NspcUQlxcFg+AlR
 pKklSQbAzx6sZox7hajP9pbj2DrwxjAodzk1bk6omGK8Gr2pMCmE7t/4rIQtG+zZFhEAnP4ToUE
 spl8VieX9JA2mg3S8PtDLklrf2KBAURzsE2Dx2x/E1zgE/HmgKOLcxhbLFZ+69O2tv6MEhmeUDU
 MA5Lm1P9CLRo/VvbuPYTv6xDq9L6iFXrU+DtSVGAG/xiLegkcgkpQlNJlltxxxDoKv6D1pYL0Am
 FlBVx26dKplFs2U5e/XZIr+yEpHn4KcMuV+fLnNc141Cqs3/A/et5yQEBLmMLIUaRvntEIR3WRR
 XRG62ba46/ELKH0zNbydk87E776qeogAHQ0/KL/LrDWbtKo1cavFgWUVtt8cRBqEoNBWDHP6AF+
 HtKDOs9/Qlj1JP5MVfg==
X-Proofpoint-GUID: s4qqqDqrRuX7nRxJYtEVYpo4NeqQgjfA
X-Proofpoint-ORIG-GUID: s4qqqDqrRuX7nRxJYtEVYpo4NeqQgjfA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXw+vbZez7OjEk
 ykczFgVlHOG2AzokLg1WcW2evu+iq87qcyYe10/YkzsHi+utGQkXtqL6VN1SGgsUC4FbwjhvZaE
 5IZmcjHrFPux2VZepz3jd4m29ocxJg8=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac73c3f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=INH18kujmAq1onTB90cA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

On Sat, Sep 26, 2026 at 2:38=E2=80=AFPM Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was
> discussed and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.o=
rg
>
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach was
> later concluded to be a hack to avoid having subnodes, and was NAKed by
> the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.o=
rg/
>
> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
> stream is allowed to use, so the IOVA is allocated from the specified
> range only. Define all the possible subnodes so as to describe all the
> VPU hardware iommu interfaces, both secure as well as non secure.
>
> address-cells, size-cells and dma-ranges declares the 1:1 DMA
> translation into the parent.
>
> The parent "iommus" is kept as an alternative via "oneOf", so platforms
> that have not been converted to subnodes still validate. New platforms
> should use the subnode form.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
>  .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++=
++++++
>  2 files changed, 97 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce8463=
9cb0aff59d8c2cc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -91,21 +91,6 @@ properties:
>      deprecated: true
>      additionalProperties: false
>
> -  video-firmware:
> -    type: object
> -    additionalProperties: false
> -
> -    description: |
> -      Firmware subnode is needed when the platform does not
> -      have TrustZone.
> -
> -    properties:
> -      iommus:
> -        maxItems: 1
> -
> -    required:
> -      - iommus
> -
>  required:
>    - compatible
>    - power-domain-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.ya=
ml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72=
cd5ae6815ba5c82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -47,6 +47,93 @@ properties:
>      minItems: 1
>      maxItems: 4
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  dma-ranges:
> +    maxItems: 1
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU non-pixel buffers, including compressed and i=
nternal buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  pixel:
> +    type: object
> +    description:
> +      Context bank for VPU pixel buffers containing uncompressed video d=
ata.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  video-firmware:
> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure non-pixel buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  secure-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure pixel buffers containing uncompressed =
video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-bitstream:
> +    type: object
> +    description:
> +      Context bank for VPU secure bitstream buffers containing compresse=
d video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
>  required:
>    - reg
>    - clocks
> @@ -55,4 +142,14 @@ required:
>    - memory-region
>    - power-domains
>
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - '#address-cells'
> +      - '#size-cells'
> +      - dma-ranges
> +      - non-pixel
> +      - pixel
> +
>  additionalProperties: true
>
Got this warning:
arch/arm64/boot/dts/qcom/nord-rrd.dtb: non-pixel: iommu-ranges:
b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object', 'integer',
'array', 'boolean', 'null'
arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: non-pixel:
iommu-ranges: b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object',
'integer', 'array', 'boolean', 'null'

Need
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -67,7 +67,9 @@ properties:
         minItems: 1
         maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges
@@ -106,7 +108,9 @@ properties:
       iommus:
         maxItems: 1
       iommu-ranges:
-        maxItems: 1
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

Thanks
