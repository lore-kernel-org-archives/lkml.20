Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FC401A25
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383826; cv=none; b=rhXm/vuuuvGfk1SvV2kwlPXzb4604Vj0L1jbBrdC8kNR8sXfLD6CY7JbXTiBJ9zy+cLdY6RstEpPLoGAOln42oI13U62pgeixDdjeNj1lSTGqQOH0ONheFDTxZHuu+arCIrGQD5MvzPJ8Dw4ErksDHYDINAYn9dKsWx//L+jhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383826; c=relaxed/simple;
	bh=LdnGg9Y/sCirK3UPq/cK4ot6g435Wl3OPOEBy11frNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=et5ou65gjgOfE6hMidHuTq59LxcXe0cHCUCYV8qg1qORpAgpor0teItIn8x33XB7ALadMuo/JLrbuwGkZ9T/QT9VyzlrKlHd8FWbegAiiA3TxxEPuZpUPx1pSbk5bqN+k7zUnHFfFlBRhxDXuKeF7bqUXEwyZX1EFj3x211YYtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8Kw/H4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hnk0r2Em; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8Kw/H4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hnk0r2Em"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8F4530984
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIgpsk9T6xtVsG3/dTAVDmPRmbqXdTlp8Kt0v9V6kas=; b=p8Kw/H4gaihVLdVP
	+z9NGQLlj+tKdWKQqxbZV+gVaLw5jTVrYwl6nw6XRgMQqu1WduFL5BomDQ2F0Sjl
	LAF5PeBq7v1cYT7o1yD2fYauibjlGjRhVqXulg8vrddLoQYI0sO0flt7GZDefDXb
	io8+HuJdlK6WEXT5uvISPUWFeAr3lNSLRatGU2lDuQ08bCCAMvUgxkAgCfUeUbrb
	rjLcr3PiZxwQB5WVZGWwo0gg0UNUT9OiS8R/nIwyXu360rW7r1One+nfNrslZppl
	dMJicxxx5mQdDJuPGeOETBKYALXOO3H+bFR3iMRNlG56APK+J+ay+GLrA228JYCo
	DBeX7A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst4cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:03:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so92363e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383820; x=1789988620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIgpsk9T6xtVsG3/dTAVDmPRmbqXdTlp8Kt0v9V6kas=;
        b=Hnk0r2EmpSE5nEdM+KqJq1EdYcBr3WWncJj4vkLAbv4qqnON1969lLbi12aEvaxFKQ
         Eo82xcLmXEVJqGtbH/ByvvGswuFdJN8qxeVITICnEdIZiuq9jov+YrzYSp3Lm5oA5kbA
         WtOW0H+mGkcM8gZ5CdB6MTi8GQAn0TR9Aqdp+MmgCC5UXV2biVX5Y1WfsdUG1zhziDYG
         GhuzS8at4et4n74pjHmErdFWdice4wL8L584Q6UNdJM3ethaKx0xMQ9Qtl4i9a9h2V6R
         Ekmo5xVreuvf1uMrVp6QW7dFhbC4EYTIqyLzuKN9p2zXyt2ueoDpa+pHu+2u+Bvpjy3V
         PTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383820; x=1789988620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIgpsk9T6xtVsG3/dTAVDmPRmbqXdTlp8Kt0v9V6kas=;
        b=bIuogLFGaXRNs5AHZ8JKi50+0ftd+K1cy2cjfqu5Y3DGrS6boiIxIV4A1SnMwT8LfJ
         9wJ5UBSLf+T3GXl4CLW2pZPfc+TDzP4i4MkK3F1mh27PTNCNOwRr2bqI9HpK1hQs8mCi
         u6TZEK7kuehWoQkx56YgsZ5z3mJm5F99OLO/vBrX0W7h/aAsLZKY4wEnC6P0430pFGnw
         XaLnzbPya9R9oANNv03+Ni+5mHyXU8RFjEhW6gfCs17ZRft2G/kevdYzABQVAh9fq3zn
         1QrrhuhPmXfDvW16jbBV2OqhmRcyuCgtm1zJLcyQQd9QQHgx0OczDK1bsGBLEpCKve0g
         cAtw==
X-Forwarded-Encrypted: i=1; AKwUvByeB8bomvl3eLQkXvwtg0Rz5rIRJodtQ/8BSKQmly3F9pnzF/WbGC+DNjoO2mBjqXx3xJxTOSaXUAeUsho=@vger.kernel.org
X-Gm-Message-State: AFuF++msW3RhELt+ZqWwwTh5QfSVeCIgM+Dyvuo2IS+ipe/yCsh/dHYt
	P3VCr0dQZMQW8vpR7sKIX3W6f+s6oBF5kHWBN/Rs5WdlbHuS56EyGnuyhKaWe00ifzF+FOAs3hi
	v2dYNZy4RpJVZFQcF4vrwtNVFrMabyC7hTQq40Iyf9nlJz822g5mxYRtx1GePI968bNo=
X-Gm-Gg: AYBFou0zd2GBslxInJXvTYoNyiKOlt54wtqii7Po6o0QlEYztGzLhSL+OEvhkjvUUUc
	km7D3gjhgPZ96JF009SeR2/CBAA7Ik2TPYkoSQ7sRGC+Zl6QTgQlI/tfyCc8xwRKj2Zti9Y7G6d
	qhM1Pz+EZLLmrgJ+glPeNR8r0qWsYvDpzstn7qLxclLgp2ibAEdQPnRXNKGF6hJeqTlRf08jt2E
	XdXL7z0AwF09bi1yALNGgEd930hsw+CcahCeqeobepEJLekZkJiogT8iRK+rEvLepzUBXVc+oDu
	svlpIgIkBCyLL93adRwUq1IdEkcZvM9JRIixux3MP295HP2iDn92iAqqt44ORUlnz4vhm1y/yCP
	TRcYLSkmD/XgRTAMfxl3+vw==
X-Received: by 2002:a05:6122:2cd:b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c981d72af1mr277959e0c.2.1789383820125;
        Mon, 14 Sep 2026 04:03:40 -0700 (PDT)
X-Received: by 2002:a05:6122:2cd:b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c981d72af1mr277943e0c.2.1789383819714;
        Mon, 14 Sep 2026 04:03:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8d27sm4024448a12.10.2026.09.14.04.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:03:38 -0700 (PDT)
Message-ID: <a0d2d7c2-6759-47c3-b430-26312d355810@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:03:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/34] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX/KgGX+yrM6H1
 G6zuCuOP4Ok2eiUZCp63fuW9LfljyfZp31XPlo7dijdceLXsrPfIYy3bchcbohwRFoFivC3xfS+
 D5RZDCLi35pH2tQ6PCeK+HDkSvdH0I+BAOifJ5msqMBTDStnHZIfTmywdzVNi1WkuCrO8Svywr9
 C1vQMbTRrCdicHrFlqeLh0WTgYBww2g/fk+8qlsg909+u/AaHqzI3UFs6JBNfcsajN0TIS04h4B
 fPMk8KMU3X+NeATyWmV4mZM+z8euHaf+wOV1hhlcEBkhxU7QDUMx1yXhAAM314FagFTxhZUjSYT
 0YeVQ4VxJ6/9863X0NJqck8CoSBR0yLMuLpTMI8mQQccsZK0yrNlETmDKe08oXeU9kx4f3jYfN3
 FBpKO/BCNSBmVxHD9NoGdIPrUbAdXJzqaM2uPhxlYXuAqObW7snAvI6m5OxgGOJxbPX1MSY/DNK
 IeEjTZL01/NuteBsS1A==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d48c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: GR0IwOVAEtN_QCzTPfQhPnZg7a4963qo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX2QB2M/bE0dWQ
 eZppVaJZ/6gs/+rca7KkciQNrZg+z+bJi4HQmZClu2j2ShhDQmiukqwTwZW6k5qFSmCfEAdipfa
 xVW0fPMW21tsS6sxpxPZ6r7ZHcTczzw=
X-Proofpoint-ORIG-GUID: GR0IwOVAEtN_QCzTPfQhPnZg7a4963qo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
>  3 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 3e636926231d..27a0b90d2b7a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -618,15 +618,17 @@ &mss_pil {
>  
>  &pcie0 {
>  	status = "okay";
> -	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
>  
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie0_default_state>;
>  };
>  
> +&pcie0_port0 {

p'h'y < p'o'rt, just noticed other patches have the same issue, please
touch it up

Konrad
