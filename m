Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0707944236F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909717; cv=none; b=U7YU99aA5GVcqdJLhRioK6/8POIojHqxuexkcFnO/vc7noy4x/VRHAuE4YegEqQdHgQKqyDxt7yeFmR/sAR/iqoo00SNNDFaD18JZx1h9NG1IZtEwBK3blT1LbGSXjz/XGqnkPphZ+p4uqcxL2aED1d7cmbOriaNveg6mR+uTlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909717; c=relaxed/simple;
	bh=ZIXgHM7PiqRYHQkQOzZqHLX9M4bZPIUL90nLso2dV24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8HN1QdbEYuWQ3jAsZW+ey7BlOGg0nVwBKUxrVvzuq/BWFzvoLDhnAygf6IfzcCD8w9XUeKwD/qa88Dy8VjlJhzIELcontBQSgr1W9z7p0CU2YTXIwsRmjtJqtmFitUJ3cDAG8ngPJ5aY4MQNJkyWmJd2fqHmSj0H2sKkVRTY0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQowgj2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHq8fa8P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQowgj2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHq8fa8P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoJ6G3445647
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fWQ93GWSWlpqI9jaUvjBtkH
	zf6rpJ3Yfwxd9B7T2oU=; b=IQowgj2SLqfFWsacIlxcY0XUvAq/uKUiH/jFfU8d
	BUZb+3AVcMyKBHGvPBKcdlT5uF08XadbMbwHpoo/RJIDMq7G195IJjhSDemAY/m+
	xrJXJlDefKRjTbp6JOuonrSK5C6oyCcusOGPoS6hs+uz0Km7WkDGtzTLWvWkmuGr
	6jVKlUgwC/SJ0aGi/slNmoLdBHp9SYp03Fm6gWSKdnAsWr68VsOtX3Vwj4t43NZW
	HFPEb6yRzbp5r7YYOCLyylki4/Dykx/j+gA0/0mgRuW3z+9S1JckLeG7npnr/Ssk
	qfhc8s7Di+WM0VLH4TL8PKeYCbcHdtUu9y6G+nC+iShj3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsg3f3bwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:08:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so4083744a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789909712; x=1790514512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fWQ93GWSWlpqI9jaUvjBtkHzf6rpJ3Yfwxd9B7T2oU=;
        b=UHq8fa8Pz0XL4Ykv2Pk142BeTpYyrSvZIolyH7W+bcIb7JW5+b9e6HwPhROzIsnUTg
         7H9Colaw1qxpHIlr1F5fcOilo3Vhap5tjYUoV4Ujwwt5hhkPZ154qVecHHcja9ptDVA5
         FUcDGLXBYu9yRhSj1vpPB/qSDbCZCto7Dd2yLPq1j77vXsIU4iaJiTkDNSjxU+FZvfdu
         JMkQQ0g0xFipGD1IFt7AarcafxZ9HCSkQYjgfL2HbKiOBeilO21KP4/R4Unwda1lAXu8
         3P4REj2IZfrVvYj/ZgzRAg7ivjhrDB3Ym99mU7FUr7jLInuhxnp/kXZvV5bQg1GIxCrz
         VHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789909712; x=1790514512;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fWQ93GWSWlpqI9jaUvjBtkHzf6rpJ3Yfwxd9B7T2oU=;
        b=wKmlmPInQsvqjsF5nZfCBGB7asyvnYPBEyXKnV9gqmmaaS8R7WzxiVGzC4OZURMO0/
         nN9YY2nPUbLQeVXTMwWpEd8xeaZIaMSTyIxX2VRqDOgqye1O/43/xpjAT1d+ZGwmrOdl
         XK2JslJwFqOwje4z9IdYwXDVP7Y7agJt0bAcE4sXwxy0dZJkkavbO4VKxEEeLeMzoBcp
         hYDoSEtkCOQCar06dxK/PbEoX9SeJUoB+MDrXp6jM4bHufQif95uhZ/9ApmbaiHDi09b
         FYBwfB6tqkx72+JdnGl6KZ30Z7tyggNylpUcMlxtn/oAPMK2pBJPBvTuWCeEf01RdtUH
         asyg==
X-Forwarded-Encrypted: i=1; AKwUvByKFb1JenLRFRKHvf/PskoQhgqWOCPCqhchdI7n9HPKUIAERZI/WkjudPTejCfk7NwQmm6zTF6Xxscpvjo=@vger.kernel.org
X-Gm-Message-State: AFuF++nOqC79S+0sX3EIoCC2CW8eRVhg8yjuO2orBqyDS7FBoQsM60Wx
	SHoPMYm6sZ/C0f9VJ8vPQNm5ir46Jot3AoTQJVAbY/b76ryf4+dGEQGZsNBtGNSMg5OTbsnXRmC
	DEVjzJ6EgJMKcW9yXQ4mV5U9gCH4TPyX18Q3CZh3svWhu5Lh0oBElZ2IBcRuYqCi2AUo=
X-Gm-Gg: AYBFou0rvMyMhImChmMDj8W09J0DFgdDnj0SOhnOSY9JNS0lGxQYcu7Amlm5/pLp77s
	YsABw1R013xtedKkoVU983A+T28yiGSIGiDqDS7ZFbNk35heoBkmzH15Z8bRS5votTiFM0SEeei
	ldZ3ydb55PISkn23FUBJb7EaH7iKfn74TKCozrA0HTlQLsgaBryeQKZscUO3Sk5M7FiR9lP55VI
	XflMPwZrUo4Z4JZbm55DRyYi7wtRuhDzGxkPEx6WwW7Qzhg70RBSwVpH+Jpg1sye+BRiy45oLW2
	rkwsz9jf0M4y8YJrfn909UoMzB1m7A+lL2pva7hYIgPsUl+I+RCm9GZseR0dJyU2w2oxfXrw8Ao
	IF7YEvMrQUJZuV3c2Ns5BMBHSY3b2qvj+LdgaGpJ5bIo=
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:c77c with SMTP id 98e67ed59e1d1-39e6c68cad0mr6358942a91.50.1789909711614;
        Sun, 20 Sep 2026 06:08:31 -0700 (PDT)
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:c77c with SMTP id 98e67ed59e1d1-39e6c68cad0mr6358903a91.50.1789909711121;
        Sun, 20 Sep 2026 06:08:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e16a7f71sm2602239c88.8.2026.09.20.06.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:08:30 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:08:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
Message-ID: <aq_ayLVdWc1Mt0Wu@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-1-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-1-94428761ec06@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE5MCBTYWx0ZWRfX0sJZsH6Pxsjb
 aPjcn4OncTyzwIfFvrPaKm9OS0Uu/MhrCu8q5qBzz9VQzX1SwSJKn0rLMNjc3EGKOQRK6t4nWva
 zOArNNoT0gp+fjT5jw5nwLjtXq5D3lE=
X-Proofpoint-ORIG-GUID: 5kJszNCyWVTUpi_KzNobR6RjLwwO0vvN
X-Proofpoint-GUID: 5kJszNCyWVTUpi_KzNobR6RjLwwO0vvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE5MCBTYWx0ZWRfX1g7Pdp95lmcY
 6idk7bScEw30hziTdKDdKew2jGhn5PChj0SSIJy3YfVmvJ/9RD1czk5G+GzKnLnuw/nyo22ywkb
 9VJgaH00UQ1D3Yv7Qk0Bz78k/1S1+Gy+g4BiOalPl9aPD1K3rE01acQV0luknCu1gu1Z0QZs4Kw
 2TCOwR9vnpD81MkzLThAkXy3S98sMtfDlmgsq6M5f4ScvGjBkrB23AvjVJwOAsCLlmOmudoFOT7
 l71nqoIIqZfI3p5VPu+a3tZuJRqrttvZDU0xYZ0lnvSLB5Sdn30W0uWM30YjLbKegNxGA9agrks
 oIWoLTgIgnBILNP/Aej3VxZtvHvtC90c7HQ5NTLyajaMP/WQvlLKoHXqBDFeJ4PNbQqTY+w5lWS
 ZJjH4oe9Xxsz/qh+tsGdmyLFT8xQOzf9saaJuJ/Lp/KCbO2ZWgrOzxVYWub3TfJGsCN2qwQnzGH
 FKfWIiCPCAJ+guXayZw==
X-Authority-Analysis: v=2.4 cv=N6S8hG9B c=1 sm=1 tr=0 ts=6aafdad0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bt1g-dDAHYZoXwUorAEA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200190

On Sat, Sep 19, 2026 at 10:14:55AM +0530, Vishnu Reddy wrote:
> The nord platform uses the same dual-core iris video codec hardware as
> glymur, with matching clocks and power domains. Add a qcom,nord-iris
> compatible string that falls back to qcom,glymur-iris, allowing nord to
> reuse the existing glymur iris devicetree schema.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> index de4792f3b658..558b85ef9ea0 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> @@ -15,7 +15,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,glymur-iris
> +    oneOf:
> +      - items:
> +          - const: qcom,nord-iris
> +          - const: qcom,glymur-iris
> +      - const: qcom,glymur-iris

It might be a problem of prerequisite change instead of this patch
itself. But I'm seeing a CHECK_DTBS issue here.

Documentation/devicetree/bindings/media/qcom,venus-common.yaml: iommu-ranges: missing type definition
  DTC [C] arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb
out/arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: video-codec@aa00000 (qcom,nord-iris): non-pixel:iommu-ranges: [629145600, 3663724544] is too long
        from schema $id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml
out/arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: video-codec@aa00000 (qcom,nord-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'firmware-name', 'interrupts', 'memory-region', 'pixel', 'reg' were unexpected)
        from schema $id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml

Shawn

>  
>    clocks:
>      maxItems: 9
> 
> -- 
> 2.34.1
> 
> 
