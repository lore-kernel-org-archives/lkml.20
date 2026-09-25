Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519033A784E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339876; cv=none; b=I6TFu913pS/dB/Kju1e3KnovyVvh3CsJapZ1MNwQI3lBsDv9LLqshSybHxsrJk4bw9GWzQSblN8aRKVlhzOKOxhKLe6cW1ZsqP5jGq8/5omhcL+EDrfrxfzaD7IebNn1vhv/WcwVEhLNmtsBzweCYOjfg0lP+tJr8AX5DMILWYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339876; c=relaxed/simple;
	bh=ZAInGioxgaspHdUIIOX/eDMYqHB30em6vwgzlv/Xf4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ofd0XakvDGwR/mgHMoNGw9QD8xPloXIlhO/y6LIfV27J2HNJgDJofq71OXjxfOgCkql2dsJoThmNRX7ClCeJSbvLyZXrtLTo49xtNDIbq5EzeytQRyU3X1FVuWqcR26fqahFRv2GxAqgrQXCrZaRBBlwbcHZUChw/xJ1KpQkFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFnZB3q0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtJCRzDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFnZB3q0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtJCRzDs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J4Yr756781
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHy0VaMdwfLk8ytcPXsYGNtFKhQUOH0pOJ4gFXHwe2c=; b=GFnZB3q0wvUti/N+
	7kgE87Z5w+O13aDycgABTwz+J70S08q5JG9X4vIvYqEAZ3G/BgvIOU6l9wPui+hR
	YAPgnS3x7/VVog3/wUPx/aOKDhUmQU/iTP+R+Tx2jLfk8jTA3xU5vI262WhwbhmK
	PDNugmxkUGLlHE0FNHu3FDtvXMWkDYrNALgcoeEPqgbv2j4/GY+GOocu0pFMWb1C
	/I0mYAoJo8PQjmXm2gUGyZ6uoXnpJ0VO5eb9TsQemJjDB+DoNcX2+RQln4s7ja1+
	J3uBOVI9JZvPXY4EXcEz0uf6rOKV69v3ICn1J/1s6FDU5He37YbMsIs/CioX3HO7
	zFjlyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq09avm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:37:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso14211685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339874; x=1790944674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHy0VaMdwfLk8ytcPXsYGNtFKhQUOH0pOJ4gFXHwe2c=;
        b=VtJCRzDsZfdBifoUml4TFcYmHbmi1GnFc6b+fs8z+tTNnKnZSZmL+LpzQB9XBJZtNq
         srV55lcdT+hgBlNzZUWHbH13j+v9D/STu5j8FEy1W/Mte5adifKc8iYGI5asYaVQoMu3
         3OiZXjApY6CsjwNGQqHSVauo2J1YQfrSkhU0/TR5mvfUn6SSdB2TqnbNBsQW34pSsG0R
         MR47gPuRp3J1zxqg7NsdMhY5jO+fNaPKD9Fjff/7hdYVpLgoYQYt9cE5LXjlnWtqFGsX
         1YYgf8LVUPZ/bKDa+p0xM2NZAQokFHmkSSj6DS8NRxKFpm2T73yu59+TBM0CghXD5Exo
         FlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339874; x=1790944674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHy0VaMdwfLk8ytcPXsYGNtFKhQUOH0pOJ4gFXHwe2c=;
        b=xx3S69syEICdMo4+LvYrQUueRXwxMhl/RdqWMcxOEbTHCJW/hAe/v1tiLe+au5yZOA
         1ECY16qy03rFlOVGtfxzFHrIjKP9qXxcHN2aOjPNTrnaTR4DuLBGBZTvUiBYRi3scRh8
         yWs6ifgfQwHavKv2U7L7NY7yMq+eCGFiw2olItbf53f+MWEIyeTkkwJ5ydr4PJOkkaBj
         UTumV5Ms2EFRSpK+OaJIiwQGk0hJIh3mNIVibVwCUkCGIzYkzpVyrRFGc5A4iI6gVSvv
         fYtkowFhtFrej6wd6PPHgiXVXgOc13pF+P5PnNcRKoSQCoYOjz+sb+Wd8/y92atSUn2h
         wgVg==
X-Forwarded-Encrypted: i=1; AKwUvBwAD3w91CNN2vsWXwHpL91Lvjdwzj3rZjsPV3E2z4MN6JZVNSL487eoAf7NAyaE+imFPmXauaVHFGJdIJw=@vger.kernel.org
X-Gm-Message-State: AFuF++mG6T0ZADbrzkTFwl7df4mDOyOsb7BUDA6K2HbLrhBgo9YwklSs
	EJteJX9KbJefnx/ffNdNmY3cfrn3FSokaMR5wbIKWIR9NjHvPANyqpgcSGJxoKgSSwfBPvoWmui
	PO2H/dX5WnLPP6jJcMurm7BNuYuyGIo3DbXRhjCf5sWDLm0aCqYPUKou08k8QbsmuSpWEOxLgP2
	0=
X-Gm-Gg: AYBFou299lSCWHrAEucvglqPVEet/vDepLCv6SPtzWhUp39Ks1x6u7HikPB/Yb4rk67
	ddJBJu149ww+0aihmMmxXrnAGBynvEu5sYdP4lBxLkxtWTxPSDILfTvxqGDYyTxzrSx4Kd8IRfU
	mXtI8NpHzOt08pk6GLzwZZ41xVkh9U167daR1NjTOCLiZILHaemlcxRY4T866lU7IyIua1hWvWR
	/nS6/fJgKwKghblhJH5DvKo35rCepOKISzFaClLZ1Y+6U+uKMpcCHfI/EfQgPFPEjlETziApIwv
	uLvZ8O8srbDQPZCSvEixW+qc146Ih9aijvmUHwXwQJhkA/SxZ4XxbnINW9yCQWtc6+wvcbW6xVz
	5JXmh/CBgrC0kbpF94pulFA==
X-Received: by 2002:a05:620a:d93:b0:939:eb09:4458 with SMTP id af79cd13be357-93c43cf80f4mr386336185a.3.1790339873479;
        Fri, 25 Sep 2026 05:37:53 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:eb09:4458 with SMTP id af79cd13be357-93c43cf80f4mr386331385a.3.1790339873053;
        Fri, 25 Sep 2026 05:37:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae678c90csm114632066b.6.2026.09.25.05.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:37:52 -0700 (PDT)
Message-ID: <6e91b34f-367e-4835-a7ce-e899953a5bd1@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX0Agt/YN43bmd
 jsO4Li2Dpa87YdDdfdxjwCbgBpw3jO068Ps8PPMMDHz0EAGKNoSUnB4A6F6kQflKvManu7MVO1Y
 B6T0mGsLae6K4YRWl9nbh4hLqx2vTMY=
X-Proofpoint-GUID: 2H4lpvhRa9TfYYsDf5SAZYh22X2FD4rr
X-Proofpoint-ORIG-GUID: 2H4lpvhRa9TfYYsDf5SAZYh22X2FD4rr
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab66b22 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IF4djqKm59Tmvoe2PpgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX8WwcZ9bR2tHt
 KJO6MQYFtQ17bvCRmjiNvCaITVODQKtiY8EMg4XrVTPDXxx4657Xnf5jMLkBK/p4c4AHcGDXQ6l
 174jaEHe8ULsZGbM++Oq/4ek9navoMGRD7DHrXxmrQdj9dkVMHPvqO7/SAJU+VZlr9YE3qfYrEs
 VvfNAf9Ymi4qYLCMiQ0uiVJpQsml3mb7X9g6rJF0hgeMXj1yU5fWJgQvrmCuY08bPIkQNZpkiHo
 RpobKyrNSDRMECDDkLAZOc5SaeOBlzu6T3ZAPjTFSiw0pjNPhiya5jZNvZmTF5ft7GpLeJcPDKu
 8iK00DpCVTqOL+9cw7LEZGHJulADVcbi4sIgsLn2DzYv6sNxpoyWcPjY76INdAHelp8BoEEUHTu
 GtlXoaDM1IxzdBXZS7jfJKsDNrtXk/nSZNALgYiotiDKvQ3JYjBh/PL6k21koO65ztg2ga2cAzF
 QFH4rcSH+q+uk40zoYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250050

On 9/24/26 2:10 PM, Bartosz Golaszewski wrote:
> Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> @@ -1182,6 +1218,10 @@ uart0: serial@980000 {
>  				reg = <0x0 0x00980000 0x0 0x4000>;
>  				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
>  
> +				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
> +				dma-names = "tx", "rx";

GPT points out UART and SPI are not the same

Konrad
