Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B68552189A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168370; cv=none; b=YAHr5HEfGfpWNMiUK/dEwk6PbvkvNk/QBXoyvD0VOfhKzxHIGYGr1XuF3C8tV3+hm5qONs9Oy9UCIl0/tYSp3dvbueOSgabDfIqoIjSy1kSbNqymoALDPlytdwQjD4oCuwd7psyhkUv5iJ5nr+8ssFbJjlOvm/mNwQoMowtOQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168370; c=relaxed/simple;
	bh=P+xRwyu5nJnmn+m2DvzZjn2DVc6kNbhn1YQF3jx45Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTOnkFV86z9AGadS3kvD75RodUhHH62HC+GVMx1xQf4ifgCQc9X+MXtRFl8Xn7/0f9fMKb6p6MTJur4vKYQ9yGLdTKWVLEcb4Ub5W8ErY4ZWOzDeWvpMkMdhM8o0hx2/JDRdIrgZWRrW1TmLqqAezz4a+CYjA5BOfj7S7yckCT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2PhrOtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAXMg7SG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2PhrOtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAXMg7SG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbbj53414017
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=; b=W2PhrOtmf7gscniz
	FvHvFiv/ts/LcwuE8tQpvBI02Qh20xopZ/Xoy7ZcMHuAb8WKf3Hd3Mk7JuDtJu+w
	5gEvSYQORa3s+Zhy5XH7zFafnI6VM8dV93YO7PHCyZ+tZk3gnYGn6pepeJ8Tzyb7
	6rHN79IQnT/sE93iQTKEtjecoqQ5apOod15t7AHj3uBhqsDpQHyXMfk9boSZE8Id
	tEaLRWj499UsWjY3O1GrLKNNgl06H4b2CvIgnQuBOxrPvEFi1iVEa2EohL3RakO5
	h0+6lQWz5E4rTotUmuHIQYeu6oehP1ANeel+prE5my/bMdKgeimId0YuWk7IRWMx
	fc156A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n22g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:59:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9f12c82ceso49388e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168365; x=1790773165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=;
        b=PAXMg7SGU96RZx5s7a6c8VA5QP4IPGM/RZRlAJRksyRr/RV98GpBsTgnO3amz4q+wM
         uNmisDtvuz0IkzjCY+ymJ2aJDPvqhAxoJAuX71tW1rk9g5LsUxg2R6iAvwc/nFn7FEXi
         O8+RZNBTsSvEg2ho5eCmMDm175+aiwY2zscHvIO8kSACBySFg+6+HlonG4RyZTHUpVoP
         kvNK6Orv54/ATaXTLinBGOFhLCj48XVSWFbR2Z72qz9bVQKDBS8Lkgq7mmjNKw7TdvFH
         HOCuCsqAC5E5tUUk+kUvKon3+eqBOhtwOjcMorgbcstfqfjjaNpQvi1It6NaGBk/vaq1
         ILAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168365; x=1790773165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=;
        b=MV7+L8c9Dig8s1JXm7W6EzLHLXssNx+9pbD47BNuwyP8J2f6F8199cxF01wm2XM7qX
         U96ab0eVPHAMcD8LZZrnjrMGIRjDyuyVZagUWPSZjeMle/AuupOzobYk4GLS0xc2Kmx/
         zGJYUginIXsQpggySheeEQVX6qI40nWzZMGIvcJQWgMbzWYCb3xyhRSYeJE8bRdqIe7L
         W90wJlkSRCpmVrR1wPK1ojD77xixFp3kuEdnqiav2O/erfcoKtnGKThb86VWXAw1bKTN
         dCxzFCpRx6//+KHb/88rt/CuHXQFXROLAVRfvyucAib//O4SMiObuuMXtE5o+NEzyb3D
         S5SA==
X-Forwarded-Encrypted: i=1; AKwUvBwbmH4KcdwTgtFH8fYLOGjfGqtB/3YTvS+GphdsQFqiy/Pp2gkvKGe8yMYwQgiST8nnTO6DKjGT0+KBsoM=@vger.kernel.org
X-Gm-Message-State: AFuF++lppnVgXMvUckwRdhp3JMjhLIK3ivDkkGz9ALg5fLMj4Rs54Tbx
	0uzyovtM+Hj/y6MDrS9sSXQ5AFKehhtDP5ZzG3i84JSLtpculGIj1GbNYRwdrr4r4Q2qDrKjFa3
	zdiwD94Stp4AihCTrbm6tIuYmiNJkw4u3fnRS+mLABUS7ajhOJEvSV0DFA9Y1bkRxEzQ=
X-Gm-Gg: AYBFou3vG/lGlaUtkmDTqVQFsfFH2CwAJVAdUWYqBYXG34nanNK13eykZ63pq1+OCtm
	/2ZJ5t2PaAI1cimlM/qh816XdHryUMQO+6lAI5SBtYfMqy9OGBkWlJVdmPQI4KdZ/9RstyxaWQS
	LyYZNvAf3LpqnTv6JHYKu5s3v6gKaKfPZjcX7WdsT2FX7qltCuDmw62q3DEvCRjLWWn0E9Z1tIi
	Ab+R/o/fnNHc/Z1Dyye5cAubNKOKLOPWu+jFTOfnoaKYfsPpGxikOdPqZZoVZKBSQJH/a8z/FS2
	spvfHvaJYqEN5PFx33MvH47PbppaIN5PubQCaWmVoosORfZY5V0OaAF0jQPqeLmUDChhIlOPCWX
	WH/9uM1nBzPa+SWis13+MeHi/BXEHbpod
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr355603137.3.1790168365247;
        Wed, 23 Sep 2026 05:59:25 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr355588137.3.1790168364828;
        Wed, 23 Sep 2026 05:59:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3897a6fsm1627496a12.17.2026.09.23.05.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:59:23 -0700 (PDT)
Message-ID: <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX/e5MMXd+0RiG
 LOsmv5CZ9zLDlYmSQmNSdRrvq2IFTVWyfXZnehAga/CDQtJ9yIzGX//aykG1BLoTCDa3obwcfrK
 fSh/z4HPdX6VxjbBE6zk4GTZqM/iU8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX/FDBJkFO9UId
 iFrIhZENmKda/y6kVKpgq77OHvDwecQA5fMT7eKIOoupdcQFuQKXoLq5uTziZaj4WczPC8nDlNh
 JmJ7o4dP+uUNOtVOT5jk1Ve7FzTp+oHfDvVgWovdxywwIyHvLN3Muoxz88gfI1egJNzZz1XlF2X
 xYRNC1a9g50+yATdE4CsbXvTKkEIaKad+VDmk5Cn+J9yQO5RPkaLsEBLkuXzflGRHQoJ18iRp/2
 Vh208tOTv4v/pIk/E4p3rqHLOsAQ4e/37+Gpl24Je7N/62Wcw8LE1wi/NhvVIGO/92YtVHQ5PAw
 JD2XRm8Bo6MIky08IxR2CwK77bMfTe4oNBSvNpyu3MfpOKFumpN1JR33UfLtlbdsb2E2N6/FDSR
 leYNrUeUL13j7HGyDMY7VM1bUU+mwbDkmSXl0b9WrRTN8GVJRCH+gfrGz8XQ083DHhFZE3IvpcR
 KWw18gvFy2jW7lRv5HQ==
X-Proofpoint-ORIG-GUID: LWLF9Ln3_IxAc48F4ivzQZEgJX99mfIV
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3cd2d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HnpcLAXKzKr4wbjNK_wA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: LWLF9Ln3_IxAc48F4ivzQZEgJX99mfIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/15/26 2:03 PM, Abel Vesa wrote:
> It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
> differentiate between them with -emmc and -ufs suffixes for DTBs and
> compatible strings.
> 
> Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
> files will not affect any current users as these boards have not reached
> public use yet.
> 
> Also, move the sound card support from the eliza-cqs-evk to the generic
> eliza-evk, which will allow it to be reused not only by the UFS variant,
> but also by the Eliza CQM EVK later on.
> 
> Changes in v2:
> - Actually replace (and remove) the eliza-cqs-evk.dtsi when the
>   eliza-cqs-evk-emmc.dtsi is added.
> - Collect Krzysztof's R-b tag.
> - Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Abel Vesa (5):
>       dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
>       arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
>       arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
>       arm64: dts: qcom: eliza: Add CQS SoM UFS variant
>       arm64: dts: qcom: eliza: Add CQS EVK UFS variant

I was hoping there would be a bit less duplication here..

$ diff arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi

281,282c281,282
<                       regulator-min-microvolt = <1800000>;
<                       regulator-max-microvolt = <1800000>;
---
>                       regulator-min-microvolt = <1140000>;
>                       regulator-max-microvolt = <1260000>;
399,414d398
< &sdhc_1 {
<       vmmc-supply = <&vreg_l12b>;
<       vqmmc-supply = <&vreg_l1d>;
<       pinctrl-0 = <&sdc1_default>;
<       pinctrl-1 = <&sdc1_sleep>;
<       pinctrl-names = "default", "sleep";
<       mmc-hs400-1_8v;
<       mmc-hs200-1_8v;
<       non-removable;
<       supports-cqe;
<       no-sdio;
<       no-sd;
< 
<       status = "okay";
< };
< 
418a403,420
> };
> 
> &ufs_mem_hc {
>       reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
> 
>       vcc-supply = <&vreg_l12b>;
>       vcc-max-microamp = <1300000>;
>       vccq-supply = <&vreg_l1d>;
>       vccq-max-microamp = <1200000>;
> 
>       status = "okay";
> };
> 
> &ufs_mem_phy {
>       vdda-phy-supply = <&vreg_l6b>;
>       vdda-pll-supply = <&vreg_l4b>;
> 
>       status = "okay";

Konrad
