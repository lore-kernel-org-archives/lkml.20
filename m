Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7FE3F076F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517274; cv=none; b=WEGqKV+CgGpb6KJSvfd4s1iz+kHmXQIFQowvlIC74NRq+NNLC7OV8Xl57oSSJmTfE/KBi6UYpYRVKA9Ib41aIDkDuXUVbNu2Nv7Tf+LAP4D3OF2tzoavLiBEQ+m0sIS+lGyD1RnRl+YQ8TsJui7Q6oPImowyyvGQlH0sQrDbKQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517274; c=relaxed/simple;
	bh=t6Kx8ZzDKvbf9IjPHXQZzbC69wBFQI6yCYoXIfiT3WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxKxOLqZhfqAlhEOkAEfIONlLl286ILCrTvaUNbepRtdzddaXKSAiSJ9F0P9BZzo0jKOK22ghHkHSCakl+jSwsIWiEaQ0cQIjMgQe1BCZcqpblN4M500vDVs0auKyEYPT/3ShUbhY6d1jV7cZsT+MpBSaNysWxTmHcVDzdEuiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ryge/iV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4sUylk3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ryge/iV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4sUylk3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R1mfQu1937555
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsQD/KnjrsgzCX35hm6YWUaXBoN7K3xyctZ2lbnLToU=; b=Ryge/iV4dQd81gUJ
	Ax+mZ+mkmy2WIdZBE0CzyBx0sinSTKkh/lA1HjumqtOSNOM68b3lz4/K4n9A/hVd
	yp8EVfueK56ZJsW+GAiMWn2RkppmqYQQ96OMJ+gLs9Js6gXnXv2tOU1zw3c2+bve
	P4EIX6TJsPiQcMaq1sbs4N5zntgrnT+vltVpKuwyQ/QA42WUWgkWTpIBKh5NIzat
	BIEGgtLSw5amoMxgDUd9LB0UClHAhKSP4BG5/NNzQwr+AbfeztYmuoU1SrrHJEP5
	AFzAhJFKY3QgXeZz5dtpB/5hLgzOdOfSUO7gvN+tJUdQc1i1KC6y0L+cLS0b7L9b
	8k4/2A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mwb2qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:54:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so1770965eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790517271; x=1791122071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsQD/KnjrsgzCX35hm6YWUaXBoN7K3xyctZ2lbnLToU=;
        b=X4sUylk3OWD5/3KNlR07+8ZDpGYN7MnCrMiHIreYshg7ebmzH7onbQ6dDwwRCbDS9W
         EcWVVwVkb7D1CyuXTi9u2dszxDvRkJgqUMYaPRgbb1NgxSIfjmYiPT0mbcpqc88cvHT4
         nrkize+B11JduvMAwasHU4gkFSUb4joPQpgiqPnLHJSpTBPlVC4//hcujb6OhpUsuw4x
         tVeHL78u+Jmlc6a9GyY5yzo5SByWVMjR0WLJGLB6hUbGZcxk1nR0wGjpZ7fgKYrCngWe
         S1QJBjMJ9gpbqT094jNZBZCB/9Cd6ieMtm8ZedaEvI5dVPUZJlo+BQsXh2gAcvol0oV9
         fk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517271; x=1791122071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsQD/KnjrsgzCX35hm6YWUaXBoN7K3xyctZ2lbnLToU=;
        b=e6mUbjIkniSmrPRJjlYwWX8BLIvLwP/r12UEOpDdXRnTjouY9arzj2jntECC2Zth2g
         /9jV3iC/VN5dkYFreoiCpbskdZA4fzd2lsm41jRNBRs3RAQUlrBOgytIbJ0D8xAh/Z7g
         Xjfka//rgpK0RhUXUAE+yS0DPWYWtPRb63eioIclNomu3nx0+wxxXugcJLngqOcVeCRo
         6DFYG9UVy0xmC6Y7tWxAwZhINH4JyZDOdRPD6pf7Yw6ZcXTqkpUsJCZW6ww49UVcG38j
         O6gqfbEzxbpMp2/8B0w+cLDx7eCBXOV0AY8NEvBtQy84g8Sye9eVXnVOtlI694iIGkeQ
         /KBA==
X-Forwarded-Encrypted: i=1; AKwUvByal0VUYK8l4TOqUX2LebBwS7wp+Fggkaplcvf5OaZEyW6gtXi3Jcw5QDBSAuedBtrr94v2IAQ+uBO5Pto=@vger.kernel.org
X-Gm-Message-State: AFuF++l4RAjoLeuHl4Amo3j2J2LG5UTA/GcGftlkJgGqgyizesI6/ExV
	/OaYChY1HjcI+IG8rVwCsailqwc1eZBglzkuQeS6anCe19zUFDk/cBxc4F1nqZQm+q68ro+eQS7
	Iho0xkR/OR7uUcnWInYuIhIGt+HMmj/vpqLp8Wp/UEK9ibpBxFWLpGVsQct+ku7Ko8pA=
X-Gm-Gg: AYBFou3ps95tHbD6S+LxD93arDiVu82R3y1rtImV5SbaHUhW6c7clAvs3uWhkKJNVor
	tQo5LkTVNMDRG6A6WPJU7wi+/m/RSMN5kJgY6fITU1EaOAVYCqOgUXWAcD/eTGPZlQcAHtvnhf6
	tfW5Qt2r25kyP4olIRmZCwR1RudCVhz+4Y8y+mR1JW13uvttMyKg3wMciy3HoMLmq5vt62DqUbL
	jN2Z2LUsKzoWwHr5ulcKjSl5vc5p+6Mxhb+2kKBpPHC7v2KJu1nVKR/qSuw9mFZ8KCcMA1gT/ba
	AHVC3MDbuGKnsIG4GXInS3uHLcpbFiHuHK00/lnYDPXAT0qkjxsxxs9GI6sZPJlIcgwYoU5psiv
	HwA0cezeGWBiBP5MuKYD+EFzXsSliVgA3tcdSzq0mCkc=
X-Received: by 2002:a05:7301:dd8f:b0:340:9d9f:a5c with SMTP id 5a478bee46e88-34273550304mr5496870eec.36.1790517271191;
        Sun, 27 Sep 2026 06:54:31 -0700 (PDT)
X-Received: by 2002:a05:7301:dd8f:b0:340:9d9f:a5c with SMTP id 5a478bee46e88-34273550304mr5496842eec.36.1790517270590;
        Sun, 27 Sep 2026 06:54:30 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm20103595eec.26.2026.09.27.06.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 06:54:30 -0700 (PDT)
Message-ID: <e21cfbe5-4a4c-4373-af69-33d9b74ac944@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 19:24:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add label to PCIe1 port node
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260927-ipq5018-pcie1-label-v1-1-41f7d42f9a7b@outlook.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260927-ipq5018-pcie1-label-v1-1-41f7d42f9a7b@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hU8xSr7MVmOMMkY2aICuJmtyd0ElqmJS
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab92018 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=M4XmOyF+KGVEWXraXaCqgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=O2R4rtJ4rcfsn_qeZX4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: hU8xSr7MVmOMMkY2aICuJmtyd0ElqmJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfXzHJWv89QmLHQ
 RMjyzERDdacybQ6oP8AAkT87huLfKVo+KgyZdmhhriIwKsXlXv+TRbaLU1SY9MdW57nuPDgD17H
 1QFlIjncr0/nmVoTVKo2JoCa12fFJOBN3MMpqz4hazeka8KorBLOWQBGuGsFvDlOtvaoQiDedM+
 ufIN3h9obaKOTaHcT/Y0wNlg7B55Q78LCZKxnD9Jc9y/7JQNT9c6E1T528GIxfO0gFgQ7Z31BMm
 VIp7QPlUQPmWaDw4nDCcnBa0kCtE78ylpm0m1EvSknT7C2r6JH/kdo4kKSIQDiC7WV3ckgOlMVw
 80wiNJoxtx0ZTVKeG7KMBHyafjkyW1DWfMTK89vqOTZ6p8wHTioa6bp4DOb7Tw4P01+8oi04TOa
 n9QvFZdj/c2mcrQz58FExm6XjpFY1c4yogn+gzmMcpDrM6juj1WHrN7hTFnnroQMSgOsmetAFeb
 SUgWYGcB3hVXIl7NEbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfX57Br4hOSy0SL
 47ySAZSGB8/PD8c5CzESjkR4JqHcC2R5EEFj7TTSj9qdbH8rOgHyN8ulrPmXdLJCsGLMT/2HfwP
 AsACabK3W07IGdMw4457ZvHppyOVzgQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270055


On 9/27/2026 10:12 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Commit a95758e9718a ("arm64: dts: qcom: ipq5018: move PCIe phys and
> PERST# to port node") added a label to the PCIe0 port node but not to
> that of PCIe1. Boards that have a device connected over PCIe1 need to
> reference the port node in the board dts files, so add a label for it.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index fe1ed240de59..2f3bcfa888a9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -838,7 +838,7 @@ pcie1: pcie@80000000 {
>   
>   			status = "disabled";
>   
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {

Although the PCIe1 node currently has a label, unused labels are 
generally discouraged. I couldn't find any upstream references to the 
PCIe1 label. Could you please add the label together with its 
corresponding users?

>   				device_type = "pci";
>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>   				bus-range = <0x01 0xff>;
>
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20260927-ipq5018-pcie1-label-d7d405caf28f
>
> Best regards,
