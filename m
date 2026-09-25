Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032848BD2E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330231; cv=none; b=AspqcuE1D/mLI+CL/z4XM+6eVkF33pAMPBnVMKAw2aYvPAT7o3CckEt7drL8wi/OZMzOpciDaMM4sPonCXteeTIX8nuYYIk65oAL5aXFd5QPmxTfwaPLpecdOuJJlc0xdTj/zBz5kziKY4OlVydyHGbqnSDBnP20Yuj9qcEMNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330231; c=relaxed/simple;
	bh=2GSHbF3YXVluZAKbyVS6Nt6058MWLjB86rDBXAHt+ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WS6XLPDuIgXUGCwUkJTsE/3nf31eZ2ejEzKLcepUV9VIdXwyKKdX1VHs9CR/y9MQh2gW2+DlfkUnFbktYXhYTRT0XN3Ug/GnWbXOPhJGXSjmQ0zL+sCi032TtBbN77XDbqOWdB5JMZXO97wLfUr1270vnIQkRPFhBfU4yAj4bMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTXR5kR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFDG1V9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTXR5kR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFDG1V9m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YjlX1193914
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=; b=gTXR5kR0Unq8X40S
	SK3/+9fH6PfVZKnE0FJlMV155Wu6TO4ZZuSwvXLTv+M1jfhqhDJp3mIy+FwCpTHL
	1tOHkn8r8eo4WGzTk0G31+3r+vxerLiy9DYM/y4nrLR9NJw8P9dj1lYUGeMKAcLo
	GARCugl6mbkfU2W30wBfobo5Jl5Q29Fa42N/KuSPBAMYQPzShV4PaWNSYmXPAdAb
	bpfVv+VtWVXCjZ73lg7ZaeY+lpkba2FB8K0VvgBBm7uPW+bL8DHyAYMX2NCOcLDs
	RZXEM2+ZHu9wADkkMnpNQ5Enl/NlKEctETmG77REYVTB/ivt1tdB+TpIErJ1Ele7
	pBIzNA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jxra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-144f706e063so1587037c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330224; x=1790935024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=BFDG1V9mqWydypQe0gNr5o2ETM2XxrarfOoBjCZDerEuarwmZPH9fJCc5E7bdMWCXe
         wvd58io8tHC91u3olcCDIYrvNxqM4QVI/u1QYrTAyCXPhK7DkOqzwvb04qFpHIL/TXz7
         fmAK4NxBNPltGbMzhRCOSGgJSB8LKFUbLplxepHnjgN3WiBOr+7uy84F8ZJR9NP5p26/
         RjGkoibgFLRlwkMEksQWqEnHpIR8NSFV9rcbRdhgsOMKsbGhO58hsF1SoVTwOp2IfP3V
         A/tf4uJAZ+SnLl82REVcY15KzPWw+qk4QmoA4G+cRSV0igh9NchMu2TgyiCwq90jiheB
         Buvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330224; x=1790935024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0cCmJXxBmFkO5YqmHaIc5Yvungzj9uhNYa0aLl1SBw=;
        b=Pie+xa3vcmDtLGRfGONeuxbIvV1urJIUnuZ2oMc+r+Uum41knFu2FnKTOt5xDBf2Up
         k5PG1sTjaW/Pr5AdqbB7Ym3ICefL3yV4AU2WhIKOoKaVP1uB0EqwFenTNXCJJOkcgY3l
         5UKuOGOtZbcHRrLOa9k+Y/fiPiZO3EKIbnti99ECHoUPEXlMSbYIDF34w7gzq4her6p+
         yPaQp3+ZivcQLzbKbqYS0QnjVP32OW0x4e9leUDlsC6wadqz7oIl6PXxG/GrU8nG2Uy8
         HJKfd2QiOSWceDpWrwuu1HxVayx+2S4KjzA2+/1wldsJyYRZGKgmqtDM4MrztjCpgSW/
         MC0w==
X-Forwarded-Encrypted: i=1; AKwUvBzKsvJLjmPsW0tBmXeERsL9gSmErEMex1G3ztEQBlJV96hODtgN0Ldml1RvHoU/1KpTIwz9JZ6ZVYCHGyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mhjGmGdaPgH9hkX9Ov22nJJiz5QXal42lYVom/q2vkxqATMJAB
	I8HDXHYmKVScR8v/6x568DXCZH74tdPoYZPuKmVFkwPzNb6ywpmvxGy6HSN+yQz27EX9zhgs7+H
	avAXHpfBK/0dKaf5D6W9Wd7VofYBFgQvK2WXn3Sisl9wvmVDRzy++EpHs7Pk3roP0paE=
X-Gm-Gg: AYBFou3BXXv08H1FGY12LWLH+M0aD1VqyJ0DYOYWTZ2tJxwnzr0gvsjB+XGJ0nmuG5P
	07L65CrtcXvkKSCOJioS7lBMT1rWrDXLRprREYz4RCmroFmUiG28px40TLtrPvfZh3YvSiKGT0w
	15VJ7LwU4u7hMSliIKSKH5xpdfwg2lql5JullKL85F9dJY/w+SabgxoEtpVK5UZmAOobq2qpeAW
	zHThG6en9URy7uSl/czf+WTSUxO7sp3FwvL8fHtADd9NwjapLMuWowDNc44bD3LlOmkfNJeRTaK
	Igva22KCenec/bOfgY02hYbgZEgX8QxEzfbapgpJAVlidmvP85gWJ3DUM6qRCOBNJ8Aki9k9XJC
	cL0OmcgfOV0fncuo=
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802307c88.2.1790330223754;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
X-Received: by 2002:a05:701b:4588:20b0:143:37b8:5007 with SMTP id a92af1059eb24-14504031b64mr3802280c88.2.1790330223054;
        Fri, 25 Sep 2026 02:57:03 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm4731779c88.7.2026.09.25.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:02 -0700 (PDT)
Message-ID: <5eb29865-5d14-4fb6-9d79-5e2af6a08c8d@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:26:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5bLvs14cxPiv1_G0jCQpGouxrf7YRX3M
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab64570 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX56fGJP3bvfau
 j9qvTEQ1x9+WO33hvE85Im6KsYaqLtkpaZT/mZk/I/y7sUyhdxDfgoBr8lVlPym/3IozePIYxr6
 KfDZjYoKTgGl/AlelZWtS09nOvfY6sg5X4HcypusUwpuI7KQtGFUdgL+hEsorDS1ttgx1Lfg4Fm
 NynDIKKC/jEzo0p5zHPIm1u933RNIQZe7s2CWCkkIulXT5GMv/JCxhVvWDtMAK0PctllIxRfyUg
 F4Iq80u+jdVqpFdjmo1Aeh1zcjfSd6x5Vk0vCtW0xMIBKnGQxJT7IJUi94WqFSbdyhE4VO16Yjb
 0TqttZn2vHRk3SqDQ89A/jxtwdhJIznbJJNV3CTlPDrCkNV3tfs0yzl4Wi86Ps/dU/0f/P/A0OF
 V3Wthh/FgpFdhY39p406H3/GkVBv4LFzl+BaQusI1XjRDGCWSvJXlU+97QTN8kcpCAUEmHQDPex
 tIt7qJNig2Nquvq/+hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX1DnbHCdTWxDC
 v0LiDoefBfUqDh1iVtjQCem/5NTnNlgOfOrpc3a0WAa/LdrsGWQSWd/WMZIsSWgsJp7voXe3TyK
 WHK2RGsoZRhMOmHzejPYzXMiICf3t/4=
X-Proofpoint-GUID: 5bLvs14cxPiv1_G0jCQpGouxrf7YRX3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 2ad26902ffe6..98dcf57652fe 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -442,6 +442,12 @@ &dp3_phy {
>  	status = "okay";
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
