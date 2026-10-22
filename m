Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656375;
	b=Q8d/FFOKYxv+KA8xxv7r6c4dEmjPv1h1NqQzv4iiJvRuOUxhcuQFQrz1A16ii9zYnE0y
	 k4DVJB7cTgLszoB7CV55oM2WDOPZKvz8tCMPX1kLpnRxiX6yyTIrtFnQZO6w1AzmppQx8
	 bDeWmwjqDOxYEj0z78izDYySrWtRbOt6AasJyKPd+fZ4yXgfEErYzKPppdl54qD+93wg3
	 OBtUSjAqRNYgOtz25NwytqWVhmrN0hwH4AhJ4bvOHV+pRQtHdKKnxaLx/WUSNnXNwCmxg
	 /NVXcEL67njHUwRdBzn9jbN5IwSS2bFR4jL+ab65TqyGmPufSlYSdjEjRoI+YTDvKOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
	b=kdA6t4L11Q4VQx0gN3Sl7kMriD8T5zNLX08bxYz7xY5KejQ1KgMp2aweMQuXG0PMOCTR
	 gHaavEyJh7W/c1WNtpGr0YxG5ibEUSgc4F1LxoRt6Nf3wTslSmBjNHMKx9E3hl3WtolhK
	 gV10peGd2uz+YEzsmtiQcBg+bKSzm1M12aoYUgk/hUQhs3q9Sgy5VvUX9iTUBzev7e9Pv
	 oXUovgr87xIKduB8A8kOYy/pMrZU25DKfpzDjPWlx+HlIAxD9B6JBdKE7/o4qB+OfnNap
	 bcztUZN1Ch2uQFzsf17GTMzSW3eMahyWSFwTAuduoqbhURnU/Mx2r1/9ZbHHKEe5CJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLUPZfA8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dir1VyPC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLUPZfA8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dir1VyPC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708JU3517483
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=; b=WLUPZfA8tRU+Ta4N
	Kjoa0tMB6NuojI2IfQxeCs2fnrqRH0GFmVxi44ALBlByDbHjIU8RRjVq7MQNUxMc
	3YNsIo/Uyza/fELUlZ0THDwT3146BSatc+pT7ivTuJLFwzH02PQ/s2uLGo3JOo10
	4kuR+LmjAIrF1MS3YGE92Ogygw+NAyVntECCqnJ1sY8cZWMCR2XEn66V54x/epGq
	AG9y/0ncZ+W/a12mEq5R1P8nWPEKyLjI56KMUVrxcG9YH8xKpC7Y2GjMXXMdWB5c
	GbHecWt5Nju/8DgADrWHeAFZm4bN8imXOJko8KXyA1MMSWaaKaisbPiWMvxFpvhk
	FuG/TQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhbcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:06:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5362ce9df1eso2426941cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656373; x=1793261173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=Dir1VyPCNQUfMOL4NlrRNQvKK4GyuHzD0HDHscMhmyvKJ1jhu/R5aozvbvlM1/8GOi
         YFUalT2xOrYmBrI6Y2+ko17q6LM5xk6dLNFyCIrGYO8siN/RI7wgnonXlcqpAPukIkRD
         XFTomLZF7zVAFHl5bMjx1/zbVPJEfImZEYY2qQOqe4ku3/qbfgLwFmst2+CDcwd5ivat
         mC5TS1FtDNkXfoSac5pL+wGA3uf/i1JwvobWLaIvf2DwaGYXyokrLCoJbRDq3pIug+tL
         i5dQseVYhz4L0S+pKyVrpjGiPf82loH1gjzpUnXnJU6H+s2uV/drGxiZ68dQtTECCfk6
         wr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656373; x=1793261173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=JAdsVoIcII0TMW2P6VaN1kSI5MwYtw3pm5alfvGggwrE8jzqCUBux4fAgtR3+rH+rd
         BPgzvjE7pXoDtChYQHpBqznnuwmeVBmy4BrAdscW9F0qDexbkY3SuiwedeYhW1mc/KtV
         xc/Kb53T6p676qbnkqX/xH83LK/0bILZqXAlCZJSlNH15FKRh1StGwu0XuSns3Q/VZJ+
         Y7YLwRAGQxG3JHR2HpRMFCDSjEbVdcK1QRBhxqdLmn5++ONKKmlg79LKEYTYXAvi8EFy
         +d056xjPRSxjpGzjBQa2EzjhkttDCIueDHghXLnmIuVWEuV9aiVIVpv/bDvoRET8hr2W
         D3Uw==
X-Forwarded-Encrypted: i=1; AKwUvBxSjCBxx4p5ZOjiktfxfoGwxGRVNXXl1sH8Wzr62YDp1nDblecJ0018L8cO3dAt4NsmzqyMNUEGMnOCuGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHne0ify1F545XxT21No2//ClfA8G9nOyVNXCV2xj4nHwIUQ7z
	cTIt2QHZ9atWFXiE+WO5ZPQCvj/p6ThD/Jq9TcbBuofoyV9X1aoARBxtXSo22f29RG0Ec1JZkRq
	cU9upbWOQHeMsvi96E47hKXGhN4IFwg2d/wbVH3thUxr2q0kN+srxr47RArZF/CjnV4JrORoZnj
	s=
X-Gm-Gg: AYBFou07FWXVEoThlrlqF7OWDf9vwXR6J5WpFqMjRxZe9vdkg3TOXuDlxrJiziyMd+d
	cLoEZM+dec/iWtsiG2GDA2GZ2XtfNV6E1itL5lxBIMTaN1P04uLH5uVNkdNHYouDdl944Vxnt6Q
	gM+fRLqCKwHeYIHQxAvwhjSGxMwIN38aNgLBbvXViDkZaQCcGwvjGjg2ShTvbNWhxZyfWtTZOS5
	oRM1Kur1ljqxQgEvmZ7DJtHtUPBb/Wb5tbjzHroZ2r/HeKSaav7Jrm3r1wyDMaWFnxfkStK/EsY
	pV/ersXKgN5JLl2GHabXad/signzh4SqputGmCjjLC0SR1rzIRAy862uyZWMOTSPathF0QYRWdM
	IQRm2o/jTEj+Q+rmn1ctCoQ==
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85542861cf.3.1792656373343;
        Thu, 22 Oct 2026 01:06:13 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85542531cf.3.1792656372807;
        Thu, 22 Oct 2026 01:06:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59a14csm78770466b.49.2026.10.22.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:11 -0700 (PDT)
Message-ID: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:09 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX7tr2QUPagCyB
 PTBL0D2OmrrvKLTCzzriJYxcAdkfKDgzfAI1bsxD7KvhP2TmFg9B+Lrbu7Q+L5VSa0pKipMDsaB
 qIQaeYd4/Qi3iLnj8xm9xPQenpYPwRcSJjHrMNvsszqOVFvyW6nOsJTf47l/Z4Mx1SUqfFhwgJ/
 yM9txTth4Q1zNkO0nhfWTiIYIhb1Rax++8wcbWAh5f2LmlKVNh7k7u+3xo2I51BVGdc1tKU72nu
 +ek4DoisA5GiAdSB+F1tieVnLl/VVIah8WOmoecxpZkOjcTeVnDu0Si2lf3UyDM+jDvpr/5GbiY
 QF7z4sSnl3lWuWXUlAqBQRRQhNUVdRziMQnuKItfrPaQOcxCEXcAQYYuJiujaQcmmKeMZgTp9gZ
 9EcWUmggerOukGJfUuxacGVShH5ZGMT3wYyPAV/Kqoya9vxKjhOzB7AySTzFwabpd3IuoKiqNaN
 5FOxqIaoUectc2xr7Zw==
X-Proofpoint-GUID: sd_rDmVb-VRTup_Rl5qU191qbCArdYhD
X-Proofpoint-ORIG-GUID: sd_rDmVb-VRTup_Rl5qU191qbCArdYhD
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9c3f5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX07d4fainjpK+
 i07JHDQzHeiKC8wUiNCdWDl9EPqVZ63pvPZR08glSXay/j2hBbmwSnhqFNxzBxtlO74FdUzNVrz
 d4Zb0F9g1FExUcI4yxghQ6iovqNQwCM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> DLC daughter card connected to DSI0_B2B on carrier card.

[...]

> +&{/} {
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +		default-on;

This is a little strange, doesn't it come on as the panel unblanks?

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
