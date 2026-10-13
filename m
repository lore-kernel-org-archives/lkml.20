Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5327650EC14
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902786; cv=none; b=SpfVTajTcukncr2fLuxHzYFLACbQc5/6mVIMBAG3WHntB/Jpe4SeMwUvB1eWJgnSbB3H+r8HaAnIS00LgNnUwHUq7dr/LMNO/9p5IQR95lNfwcR7UPoM4IHRS8FZ/SLkgneaY7QxC6qrcHG+UJbE6ytslVqCllRKci40ClxXoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902786; c=relaxed/simple;
	bh=q9N+O+88tyPzx0HRrTCSp2h4PeX7IevwHQzru/qQoM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDPoj/mBBZDjwtYydkqk57brYlcmiKPJMUoMjkYnz9bDKLQPfQGwmAGc8JcTdUgo2+lkA5y3H6RqhYdnxJvNsiCuLXWDa+mN+qeDvIs4RCSPyYziXAJZxWEZdDdbNSSIfT6Lun8eDbtazQ+FWEdsC238NObaF1INruv4J71uMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Js7bFU+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx/9hhr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Js7bFU+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx/9hhr5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4SJX2571273
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gam8DdZd1RiWHLT2O/v266WPT7Cc3JzSG7b+KwXeLYE=; b=Js7bFU+RZegDoAVJ
	T6c2hrTrNegfE/C/jteLF+c/5e1weSsho/PCH7vR6qagTud5bxIqdsI6ZstQR3Vt
	2XVYVajmTatzFdIc+SiNqMcv9GW8jMWcTZ5YIqmDFRhz8CtbObEYs8AzaCr6itD9
	m8dCBdUYMPZZE2l0OUYWQl5TdyTZ2IObgwXxqYFwoNEvR/E/BP50TlSV6QO2mCNj
	cwWWXIoWEDD5NrohbWir8iedjuIG2jR8cgSQi2MEm5c02vI3QQ2WEUutPkAA8tp+
	iKycCv4i7tomXa7A5PBqE9hpjVReZD9GsGj5I8xFOIeNJnivU1H+ZD6u7yjdx+d0
	yBX18Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcbggx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e95e7cc02fso27401e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902784; x=1792507584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gam8DdZd1RiWHLT2O/v266WPT7Cc3JzSG7b+KwXeLYE=;
        b=Yx/9hhr5LbCCKL9jyrK4uxG3r8VnOtLnvMwqQFGfIzFLT+aabBERC29Byfsqf70bE2
         WzJ0u9ymVNM2NnfCIwOBQKd7oFdNUaQWzHrBsOwOEcIcOwMfMzrfd/JCNN+v5PB34MMj
         Bk+5juG9G1bfMbu+rJsDTFxz6Uvtbbrz4uh2R/oMY3Vo2nHBWdvlv9ZFSwdaj+ZS5N2e
         Qxl+Vc2aT+OnfTC9qNrUTR4m5cEUIN4EnanRPQa6qroLJFcpPoXrHvNs0oXRu0I9L6bJ
         3hWN+1iJYvTYhfkz/CPYEvjuHGcm2l9/j4Z9ZJVkC4KKlEj71mepL5zO7dq6R5izA0iH
         2+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902784; x=1792507584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gam8DdZd1RiWHLT2O/v266WPT7Cc3JzSG7b+KwXeLYE=;
        b=y74pTWSBMGFYphyc/ZaJIz4WjQPEZm+s7TEJrRACGe0HWEI9Ah3B2pzV7FPMIxSnAw
         48c3KP8Q0AIVCizuovsdAVXQDRMwv1AzNurNaYD/cPs4ku12FNo7UH7viDZoXdo72TzN
         pwXWdmpWQI5A1swcvifPQzUys9OutsVR8O6vTV2CHzWE1O1lgv8vAAqPKoxS2vSBpezO
         I/ge9Ce9SDwg0N28drvjxmBs/jEdTfzZSAauotG5I0BN4WI+Uf7BusCbWvoy18qz9+ku
         A67fuMm7Pj3o21EAhVkhJ+Lgp4THK5+BtpcxpvHyXVSH7JcBvBI3WTKzLIJtVRHpPckV
         q1BA==
X-Forwarded-Encrypted: i=1; AKwUvBwbsMgECQiz0ppMqPHJbTyyRuo6cu9jcmIK1nkIZwmyxPYaDZX/p/qayTy8Xv9a67jYezdN2TJxOrl4ncM=@vger.kernel.org
X-Gm-Message-State: AFq9FYImYEOLXNa10bF/hELnN8KN11sOlqIf9+KSJ96cazFyNXfDDOgx
	RzVDmE7+b2ID+GD6u+VzD9itJVBQUMZvcXgiZdQug7IVO+Yt20VE+8yWMR5vwAcXRVkdFZZ/pdE
	RKoCsWC4kMqB1PtR35fpt4M0Rys8SQPDiPRGtRVVvM2voM/7NcEsLSef7BNWodL7gtfEv8OhA4V
	Y=
X-Gm-Gg: AYBFou0IxhJi0PrOAZb8gZb54gPKtxL6fu7IJo8RgBTCozBPHC7JCN1y4FVONuWLQMq
	QNXxXSnhroBqAkkq0asc56RtF+vhqjLmsjR2clTseApkreQZawWVK1nm/R9eWmFLPF6xBa87wi8
	VnwsgVJf6ZSkE41irZsH5Ab579ehQF9I973KuNtT1ShSm4s4CD+cja1oK8ADio+ZtNju/Jc56g8
	4qF0F9+UkU3nzMFYlRZi9yK7WEdlK1LKj1GP+MLHucD4WdGgYIKj+cr3nJyG+sHhcapZUrzLZ6p
	Fqyr3fK51WRyxbxr6/ZtGn+qwddo/11ceiPkTAiS+H5y9Ss0xGf/YwCrtKU6YExk+lrS4oVL0zK
	iAbgoIQ3dfc/MLjUg7UroXQ==
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr2411573e0c.3.1791902783713;
        Tue, 13 Oct 2026 07:46:23 -0700 (PDT)
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr2411542e0c.3.1791902783249;
        Tue, 13 Oct 2026 07:46:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf0751sm243681166b.35.2026.10.13.07.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:46:22 -0700 (PDT)
Message-ID: <9757467a-f0de-4cc4-98e8-17a98710de24@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:46:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-8-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-8-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX0Q3/Rn3B89i4
 rCelpnLU6NirllloYL1+Mkj5Bjqan/lqyymgMsAz+/p4bxg9mYqtGjh5W9KFnnPNfsTm6q56Kvi
 L4GeafeB91hjVVG9iJtydXFfcnsW7b6PrqCQjm2ps3kBGZpb4G0vLh8sGGrrHJzXcrvSYPgU9Z7
 vNzzIUs1qaU//4xSo7VwA1VXmihBkhakB1e7BgsLDjRolkR8okQmUV/KCTGXmJcbBB3qf0Dehzl
 wWJylVmSob//KpFCPRC0GldsSsVnQN/pOv7PWu5bVjNJg3LWwt/8o5mxJCebqC8npGJuTgokVjR
 mWxES4dRsBTml8wAvxd9wbxNy4cVWWH+sAXmKXnrS5JaHCpWxQrejKxQZta0mRUIanuzhwsLIwW
 qpxoc5GwMgtYoZqsCkY0Ehhz3UtLRYnTbHNXL2XUp71MT2unskxq99uY/ljEXX+VAQelI0qHAD9
 I6xeN94x7WkkSocRKxA==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace4440 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B0GkLguZ5Z_bKavFfNcA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: B3Vde7Nz_VURdl6b3__Qg-zKr5hgaHnN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfXwTHNmy8TJLsA
 MTOH4dyV5Bm5bxOSw15RgGcuZqrajE4wcKqmzH2a54taEFoW5BAXoPpKWBAMkv5bgJhee9XGLTd
 M7htECxBmgeOFGuKc82+4QgYKjG+934=
X-Proofpoint-GUID: B3Vde7Nz_VURdl6b3__Qg-zKr5hgaHnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Describe and enable the PWM block on IPQ5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index 910196a23ca7..22ab99ca0903 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -398,6 +398,16 @@ tcsr: syscon@1937000 {
>  			reg = <0x0 0x01937000 0x0 0x2b000>;
>  		};
>  
> +		pwm: pwm@1941010 {
> +			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
> +			reg = <0x0 0x01941010 0x0 0x20>;
> +			clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clock-rates = <100000000>;
> +			#pwm-cells = <3>;
> +			status = "disabled";

Can we just keep it enabled?

Konrad
