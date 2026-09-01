Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C037315D58
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268679; cv=none; b=c8RTf0nHAb4VFy1xZBFRw0iu1Fzm/j4ySAHXNMQAtgIRmn0T0xlSrk2lZ1mj98b+JJDw42rowAttS6kLrhUrhU6j8UZuApJUyuhYlqSdU8A4u6xAGl9pEeAqewop4VmLsVqU8m/WQPz0UXIRg1PaDcGfsXGrkMjrjzs3dkS/AdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268679; c=relaxed/simple;
	bh=vaanBrWBtt/K9qjvJi2FisIQaJGmMcAWPsrvdyQ2gEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWM/AwB5ebFksCMEIGrZOXbu2ttABlKBShQIhzmDIr/19pA6LcCdlz0xOHAAQ6qQcCGC9KWA3D3T7TLpeNZM7HCG5muNLY+TOfPeXh63taSF0s2yjvQb9//JMi8sckAIFg52HIpn9FqKDMc1tFt/w3WI3wu86aGwmiIDh1Q5XMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc1AAPkC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfcBaIQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc1AAPkC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfcBaIQD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681D6Q163357774
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=; b=Uc1AAPkCq8yaPHNb
	K1v5peehXwLRGrA91Ar2dWf73/ZrMNfIqgFj04Cvkzo+qj7RAbUoGXUiYuQb+CD4
	Fm2OxH9BmijnVtpvFkMq2FH0i8v3K7c+Dy93rnZGxUQ9+3u5pcKSq6+ykSWt1kMZ
	3JGcj8C8tmt4+r1lRDeqOm0DHNfraXlQeSqPXmAdzZA5Y8xpIT0nZx5dWtsVjbVy
	dsLzsHJhdJ7br9l6Q3a8q1loCUuaYlRFwk04pSiUCQYmFS8SbH6RT1NmFs9E+LiN
	HYnH3v09g4IJiwaLgwOkVMPZTWTB47AhXEgFxgw5LIXZ3J7iQgCKKRlBz2fxkj21
	RsqITw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ng1d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:17:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-784f9401a7dso127056137.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268676; x=1788873476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=PfcBaIQDRMz4463xfzKr+VmNR0WNvf/U+y0O/t05NmmWL1OIrShtMBqtcZr171K4Ho
         Vs83QWcCVbJX4n6R1QTPGf2eOXeO3gx1RzlJTiKe6fJBUesuonfPKsk3sRnCrI2Q9TJU
         tJG/1qpGzRsrm2lsXDik0mNgzY5n0Msp+iy7ybhZybVq24CURHsdt339ABgwXcxgx7WA
         ojAsvgQh2eqKX9G1AZmKtrYwGJxBSv34cKHgc26OvzjqKgC9VlKETzadrl3qdfYzJ0rm
         SLRhzdS35SuRAGnXePo6vNh1KZ6vTrTHmpCeGaq0rFKchiOP2n+6ox1sWporJqeV4ELp
         6NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268676; x=1788873476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=eNMl9VWwQapqIkIjtLt1RUazPdb4F3aJTlsbJ2ahe3fTMg2lPFpIwIRsojuMK4ZMfp
         7S1mHz/sTUs2eSgaeH0PNf18fMM1cp8bpePJ7ZnWQ6YOYyYH4xkGKuabKelN5lF77ii/
         QiNsv/VdvpFnftr8LVRJGZaSaDTt2QjJ3MqriOm3XP7hwwq1EOr9N6LoHiLQ7rLKj32j
         o45qeALR0/kABbLpMxjDDR0THYzjNRasf6GNcdYzUhOaepxzh3mkRG+7B2xY0dU8LiKe
         dXofdEGuEQY8zCX4erQ5RigqSQpEkxQJ4vJUeRsDKpl+ergYOwLNnBRBY9p7eXVX0GtD
         Oz+g==
X-Forwarded-Encrypted: i=1; AHgh+RojuVihz+lB9RUZBmNI5k1CyVUfIwTddcvO6cAEjUQEA5aiMYqN3hGKEeWZaihTiR+4YdfcTvXY6Ba0b/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kWObwOu6gU7/2rk0b9FE4Otau2yXmGlDKoUPi6QAQES31zwYDg
	sPIzfEy72xFV0xaXs/Ll9il6UUbXb5gtahV9to7Jsi9xb8P0n10JD8QXEN1XP7JUjILq4e9PJE9
	9pOyMwbRcBFUlx1Lkl3w8dzc4R0XSuNWQKVcq9hgTYp0hyL5g+Ai+Lj0XxkF3TKHqrBk=
X-Gm-Gg: AR+sD111dYR2l8q2XVOUnpPpKydm7eBVCipFLgzGVcPcDtIctd5iz9K6UX+8KQquPNF
	aX2kcIuS86XQYyFikVKRQb6m3LUlVnzvcgyHKjjdnIZZjv/9VvhBBPVsSn04Z7ZzkLdaAEu+7/e
	4ir1MSbVs15QvhLR2kZHaFbXW2RppIqhF6K5QH04s6LwRwO1ZoCgU8m2qxvWdKnfjdcBGB1P8+j
	tuoS9tLFDv/gPszc9dUuhCYLp/EfqIGEQQS1T//dlpmlC9AeW05Xm4tqMe8xD6SiIvATfZdpHHB
	zC4KvUquEYbroXVtBFMQkvlcX520eB7yyWzAExTnIltTZr2MM2OFg//j+BACX1e8EuUH/6SmtVu
	WJw8lr9F3JcsjTgwtDggt+A==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422324137.0.1788268676368;
        Tue, 01 Sep 2026 06:17:56 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422313137.0.1788268675877;
        Tue, 01 Sep 2026 06:17:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89d3e06sm2866547e87.26.2026.09.01.06.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:17:54 -0700 (PDT)
Message-ID: <5e7cc36d-73d6-4040-b62f-88fe2819ab1d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:17:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Improve error handling in power_on
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXxARMzRIDRkPH
 uBUpLn+IsmQe09aTBWQN9k9xL5t5G60Hb30rNJNNrDIaf4PPd8ysOVqGAFlN3chGUJJMfh0+TdA
 /RAbIHYem9XmJTBMT/Mp25LPy64+EzA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXwi34t/N+6V5i
 VOaB4CnbRcqurrYJ2oPOom5hDptUnS3BAaGncFgXUjwaEytysbThCfZQ0VhsZ0fQRwURxutEeXQ
 Nro7xvohjwCieH4+KenyAXMF0XHT2/R7apPIlMoZlhNMW+v/5Lqz4WM0wE5voeg4sb14LGOtEO5
 A1YzJPY5yDDiycD4svcm4DVN1MFvS/KU4dglK7qXEMMMTwdOYXiDHU8C33Aw5wYgWqIbtySxPhI
 MjfOln2eopR/E5KqdGGMw1QT9YzFBuTNnyCEwAzycnnC0NUrmyqF4ScGgYAfysNHmS0ecOg9fsS
 XT3cFlaOQtSlDryDhXbNBj4w7sh0kOJ+TFOe3mGxlwdwn2+tb5KGFOPh4r0cTV/0BPsvR104+bd
 plKJXihl5f6i/eG2bpd+oCqZKS3usKoPWoSasLsUK4ru1AtuyZ6cDjdV3/AdIPp8EVwFAnsRg10
 l0dYSpR//oEWqrkp0jA==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96d085 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=xCqKcKfuVhzOl_WxAlwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Q9F5jd0Jwsqw0awiYZLSms7OauRyJk4o
X-Proofpoint-GUID: Q9F5jd0Jwsqw0awiYZLSms7OauRyJk4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> When the PHY fails the enable clocks, it leaves the PHY out of reset.
> Fix this by asserting the reset before returning the error.
> 
> In addition, language correct the error messages.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

>  	ret = clk_bulk_prepare_enable(phy->num_clks, phy->clks);
>  	if (ret) {
> -		dev_err(phy->dev, "clk prepare and enable failed %d\n", ret);
> -		return ret;
> +		dev_err(phy->dev, "failed to enable clocks: %d\n", ret);
> +		goto err_assert_resets;

This is a single-use goto for a single line, just inline it here

Konrad
