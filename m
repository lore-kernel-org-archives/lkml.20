Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA473BE178
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322910; cv=none; b=R+kASGvjIoyNk8Wp1ZV2v3Ia7ZGCb+SlAt7mPsnT6zGcrdR8mPhnrQ5cfJ87sMByFxOs6zDb6ldjbODYctgMEgbevYbQ4d3HzHNkoFsvInihgpgUGCfx74ykkbVi/SuyLrxpFxkVFwrERF49arVEfQPNkezUP9qJjequLuqRsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322910; c=relaxed/simple;
	bh=DHHzktsDLAM4f7rIUIIn9lXfD1w/CqMfKuEuew5qCes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJgUefNnqoPE7i6PeaHEFwWRAoH9ljtbQ4AcdvxowZ/gL4iTO+zIIIlEE95+V6RZB5ebtPA1yDF7aCZW/24O+DBKaKHyQsPfHqxAaUNxUyUGeteoU2E4/QI4SSEusSKV9NG4MECCcpIPhBKVyfxI3qTYoCR/rlnLMcDD0+RzLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkuJ28OM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAd+CxmQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkuJ28OM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAd+CxmQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YTVt2911652
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=; b=QkuJ28OMMeOdpYrD
	JM2gcZ8DGgCBQdnLREK7uzV/jrc5h2uVQQZsijPPCgflB+AZ3+DFTVvK6cL041uD
	/ga4ysFrrcqp+fiblFYVK8S0s4BwULcfufxcwAFIh3kQE0ofEQ9N6A28amUyoxnE
	2NWrQWBOi2QfQgb5eYZiRuvkjSWaz/aC00YtMWea4/lYEehwFLwbyPkiO/WKwF5J
	KT3oT10fHFZyP6uRci33d0np8/OaafwW8L/A/lntgXpkWhaNfBmN6c7vsSeiR2F2
	wGrDtSgMVce4OLemb4Wz2i9+YEhb1Dgg7YfXcNtc0eNgQ/6Oah74reXVE4A35mxl
	Uz8P+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm50nbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:55:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so14252401cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322907; x=1790927707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=;
        b=ZAd+CxmQ0FD7jX891xqOeniz5VBqUh3Vumrni9MMQTqxcKmwuoUsGCwIRZ7mqjc1aR
         V2135nxE2T/Jif6waBxppuOwDRqyTaz5T4JRBUlKdfLjELeAWfO6E8w94NUmL2E2/TNi
         TxKlcp1vZ9jNfjy5d0DLui6IOsJQo6R42bqCMOYvhabERHeZ9h42dYsc5e2V0Vb7O3hT
         DNBlrfTXW44r5qDYRoTdZgK2+gPQHMoCmEhWv4JtZ7Vvk2PQ2IRDtQi3zEIVt9UhubSA
         lKREvdDa7pK1ZIWacFe65lV9fEDa+eVptYRwhSnPdZwVYGNuvmi5zyyLJc/gTJyrmH3n
         /z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322907; x=1790927707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=;
        b=FdudnCoazRhqPBW+pyPP7maQVdU0cZGadeEwFdcXE9y3Z1bmfuIjNsTqNiPPwR19n6
         xSQK5Q2YkW3tFohEKgfN0UUQm7KL2aKa/fLNW3lOD2efqD2tmWdxM6TDSrXJ4Sx3jk9y
         8WeRK6hPDdr4/hhoeFLzTE1IT+LE6nXzs7cI9EZuE82/WHW7wXn7O45EVxzjziw1Ok//
         acQ5L180orBMbMuzZiz2IN+Bzck9UqeEnrcm0x5LKnfZXnpDasnX4oJYD6CaZDGLfBc8
         BFgrJw8hI8rW1464ytN4plbqwztVc+GyTgRarmmMn7nqRvItFVfByT2iAYU5RTrMpvok
         w4fg==
X-Forwarded-Encrypted: i=1; AKwUvBwsuDFpG0e2HZMm94shm8g6IIZvDMwxZ5cZwpyRS0CpfYHKHreo0Pdv3NmxSR/AJjhej+bmZTmF8Eql2pk=@vger.kernel.org
X-Gm-Message-State: AFuF++kKD885RMVXu+iqJ9/tpPBRlYaCQXL/BVm3+uiizJLGUeRSuh2T
	R5E6t88dZiYERt0/dY9rYumJiKRSJ6x5rWDo2DbVgZI+tQfs+IGm1f+6abpHMgGtKNodzZJaoTx
	YkN64HqV2HQ2vB/Ra/1mq4oDlRFiltLEFeY9VplN9i2IkyYiAjSSZZBG1EBGY41nCS4w=
X-Gm-Gg: AYBFou3cGLoExk13EDb3A0JRtv8w0AhGEl22I2RQ9zu7YxGqJPahYD7b/fyGfOguie6
	RhNzSm3d+Dq2h+SKwPMndWMVHXYLisiqtLUxUG7eT/8g9Rtl7LFgfwrh+XS6QAru5cVgFEmf1Jo
	DVDZDI4n+VkvpQ+YbBVQcAUfORfyKSKcKNy9oK9kA3iWAviEPef9k3fGaJEjHpNxIwAjtSe3DE0
	nqgKttyT0RMiMnylQ6klJ4x/9gsVvV3saHFqRzfQ5WW9tJksiFEv/jH6jPiidChwvpM4sHbGgBP
	LNNIXnvXVIvb+HfR2mdFL4YXL06KoAcCINLIX6tHZN/5Anr3mozo6M+p3OMFfLGsyD9S4TwoqBG
	icqdtpC25GyRy1nv0xDjK2jlMHQ==
X-Received: by 2002:a05:622a:1a8c:b0:530:b2e4:d59f with SMTP id d75a77b69052e-5330b6ebb60mr28415661cf.58.1790322907455;
        Fri, 25 Sep 2026 00:55:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:530:b2e4:d59f with SMTP id d75a77b69052e-5330b6ebb60mr28415281cf.58.1790322906928;
        Fri, 25 Sep 2026 00:55:06 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm196689075e9.14.2026.09.25.00.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:55:06 -0700 (PDT)
Message-ID: <32b16fac-2c4d-442f-9174-da16e82944f9@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:55:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nLSgkiwxDmd5zgMQLhnKyLm_7CTWVpBk
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab628dc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=8N9GC05w9tLPy7rIr4cA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX/FW8BHlPyqp1
 VbA4f9D/RL0h353Ziu8s9Sgf/XuYMkZt1otGVBo6oW15AUx8NwMDWHvUSNpK71xvT0/EERzn8vh
 xACVVxNmiAE3QF1nZ1cPP6O8gzqjyIL69/W9jDZZGHMSnECq5gJ01QDVv9nMB0mprX3o8VKaOC0
 r9Cqrnw3xbHO6SKL2xApP7ObYmqq1mpHOArquZH1sdBq/L5aAIvfUZ7zy5kcCyuIKj8hGskD8wD
 /f+BVd7QFnEDyJ+9z9R65w1fT+n8/CTfeEl6o8QAwSpFBEc+7hcA+KGVajR33s+yeB6GAXqExoH
 hF8qSGsh3Xxhm1tFcOmPOvvWJVVsNJgi0gqyrGbHmsIoEgcvM5g0Z39U2ZPJqeFJxzXKJvN/KWs
 zTfNS+MbK1N5ddi37RfS8uPa0F780joJTGB8p0FUttXS3ykzVCLKSztvIefFQ+7TzaKX39ooRn3
 pQb2Ql0FhYVX5kbIr6w==
X-Proofpoint-ORIG-GUID: nLSgkiwxDmd5zgMQLhnKyLm_7CTWVpBk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX39Utb2BSJOms
 f9irPs0c5eIGxcgisTkZQUTuJgfwxd7VXdNSHGP+mjHQaJyXs/4GFJobpygUH3wJ12l+S7HxCzG
 SQ9rpqxchpJ75sTKelVaQF7bu/oPPwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250031



On 9/25/26 8:51 AM, Loic Poulain wrote:
> Enable drivers for the EMC2305 fan controller and PCA963x LED
> controller present on the Arduino Ventuno Q board.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> To: Rob Herring <robh@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Srinivas Kandagatla <srini@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..012bd0cb1bf6cb130c92012748a90ebe76534854 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -769,6 +769,7 @@ CONFIG_SENSORS_PWM_FAN=m
>  CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>  CONFIG_SENSORS_SL28CPLD=m
>  CONFIG_SENSORS_SHT4x=m
> +CONFIG_SENSORS_EMC2305=m
>  CONFIG_SENSORS_AMC6821=m
>  CONFIG_SENSORS_INA2XX=m
>  CONFIG_SENSORS_INA3221=m
> @@ -1323,6 +1324,7 @@ CONFIG_LEDS_CLASS_MULTICOLOR=m
>  CONFIG_LEDS_LM3692X=m
>  CONFIG_LEDS_PCA9532=m
>  CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PCA963X=m
>  CONFIG_LEDS_PWM=y
>  CONFIG_LEDS_SYSCON=y
>  CONFIG_LEDS_QCOM_FLASH=m
> 
> ---
> base-commit: b9bb4134a9583a388704433eef22c82c49963585
> change-id: 20260924-config-ventuno-398c8e9ca9c8
> 
> Best regards,

