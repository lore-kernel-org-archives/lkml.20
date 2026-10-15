Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039D4EBAEE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055719; cv=none; b=ZiVp+2s9PaI1+RVa/85TGLp0htKr+6uI6C6ABCbCKL18De3BOReC6minChIEJYNVW332ayeMOMDNOYI0QaIrxSNiDW9wlLAz9Ba2EI9/xfF+MaWNyGd7uJ9uHPPMGIOEMBhgYx5p+DfYZNXDefA6TNns+7vRvZKI5jN8VEmeazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055719; c=relaxed/simple;
	bh=z+BWBGlvD7j43OYcW9UusO7ekWqnSZaJz9t8vXKA1yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9o+UxmkjPqtAROPnynUNv82X+iYT/aXjWOdOaH7GN7UViwirQLzs4+Kx3Ki0wI6i+7GOZjn6luEIVhP36MI9i2afLPL+I7NurjJiXRnXsdE3MOqo70PLfVDHYRGy2UWwhBB/x/7+4fLQYf5vYlm6S9javzANj2h3ayc/tnBhGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azbW2sya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/zDq3Qg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azbW2sya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/zDq3Qg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7GVI01682879
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=; b=azbW2syaIxiAklhX
	1zIMGP1og2e4iIi9ZHhc/SANhUraFuOr+/DGkSZWHbqw4LDmzlIxtiCbn/myzXNE
	Mom5KNaGtL2X2o/go7Lrvgp0g5WCf1wRU7ZyWkSwHwdU7BRv/B5NvgaAZJpjygav
	XaOdj+OUU1WD873tYIT/RfH13BFNfdwHuiGF9xmzJlx3GFqfrd6r1xBrIJOgFAQ6
	pD9CtFp7+OYdltJp/tR6hsxrOTnzvCiC3jBVd3yr0PHyz76iURhXVed63SB+9C68
	LuAm+6Zt6ZZ/qn76rPwrvVQm+Q3lMLonpHqTjcLaiqi7yAZR4FZHtxUIuxmpYMX8
	4gV/EQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03rm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53389750985so10418691cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055713; x=1792660513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=P/zDq3QgtbushQu+9gMWt18bLnV5p42cAetdcCr5/m0UXgXhqZtvnKTxeEKCDVAmXh
         CmSPwCidmnApA6fQxwF+70a4Y8Tou86ytsMDP/CiQ1cFtD+kWCywqNikmSV3BWHJwarz
         fPtKesJ4CPgRMI9IxxkOP/6KsS5WEZrYZV601Nj/P6pMQRpufqIBfoDw58tVcfZ5YJJe
         5dhLpzOPYMzKK6Ab2gLcSFw3MIn7n5azVQABloHSrj0q0XJ6bnl/2JOYk/dhKVOpbjQ4
         KJOQRLBvdFqZ0rDfaABCvIc6nSr93K8MYhNS/BW5+r6aqGfbHJqtOSQl221CySE9E0Ie
         4uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055713; x=1792660513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbz1I+0D7v4YlTuSxVHwUi2rWWEi2PQQC6WAIH4knOY=;
        b=JY+aCO1wtP0Dy12ua7rrerBA2cJXYcPXnde1rmnaR/Ra0Mb1nAYXlKhe6MDbAeyFPE
         Lv+abcncJGiNHwkaTq7x2SaEMHGr5Mh0Rw2EXmMD6tqApvSypkU/NcDLzXVmox8P3mfS
         7PJenLvxAeyWFjg330PT4bd0mllP6yCuRGwVAV+TnP19uRQcehZPLkOxs9o6pjLUuNZC
         ESZY7CdPg73VS1LFYNn7KkHb6+v8HDWQDGkRZn28Zao592WVA+6q3Ofo8cvYUSaCMj3P
         vTbOaotdSFWGTPITcwgLLL5pA5+ZW2mDQ0ulDg8hC1ocSd3NAliQ3U7gvpkQlSJtnd4i
         WdGg==
X-Forwarded-Encrypted: i=1; AKwUvBxBJ1jc9xSi8aRTDlhQhRYKz33/mSg4iDNnqaMKdZcRTBh5Si5aYBhHKVTBEjA7L3bb/EBiiA8buSAmwOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm+bh/W19KArw858XtBRxRWfvSj1/G3LE2LnBjcJ7dMDK103OW
	DrcRkir6+4FQmMiaVTL30ihjnHHdT4nHfGcEMhRugQXmhNZ8ic8ttZPz71zV8PjmQ3cOHchPbGd
	utJN6Dyep+vqRhqjj0q7PhQnu0Edu3LxXURhFKiTTyxdlVOfps85PCEocrBIUyBHLcpk=
X-Gm-Gg: AYBFou3LIOXuJopjbwczu1O2CxZVw0uKde9l0Xn8n/7q7kxcVJOOEROvKwjP0cJy7dk
	hg0k3hNce4FAxVnUVxn+pRwxP1KWBfoiRQDr6QnVwBao3DZJZh6nhkPMob+qDeTcyC9A3XMGdyY
	WIyNc61hOPZ1XgM0otMaf3j0wJGKGaQlqQ7kZ/gWErgGaSBLWq+46onHMzCjOPeIj1ALAEaMc4R
	2R+kv2JHgqlq2szih83uRkzZJCw66sEdag+P9g4adgHVmsMmRDqmq5t7eQkt4M6WbULRC2cygnv
	RXb7Ywj+VXG1IzbnC2tWSJ4Nfw+h3v0pXeTbPBwuXDron5zTzHeiBMW3cU27IupSIHeoOQMoKg6
	EEUidWMJk8SMiHyXhP9Z8mg==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410264985a.6.1792055713550;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3410260685a.6.1792055713032;
        Thu, 15 Oct 2026 02:15:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6f15sm101465966b.10.2026.10.15.02.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:15:11 -0700 (PDT)
Message-ID: <0e456ae9-7286-4c4f-b56b-9bbaf4076732@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:15:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad099a2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Jhhi1Yo89JosEC0CkA0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX/fPVOCJX2N3F
 iayYJTyFlCRKLgHc9kp1BovQFuYysbo3F5l+iTbSMx/8qKH3RqlQghE0y/TK8xusMR8JYDvE6ZO
 wx+XtW71/IisXGqWLuZm81x14cazFXY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXwxCF8DDBVhxi
 joHx5cDcobXfDqlCb0bmdBng5ULzcA+5P/lqmN8WnMg+PRWJPrqsYbA47PIjrIWxPdMoC/oOK1R
 FqoU/o6IuLwWeEHHczI3Iw6Em1IRSA0dPsKMWpQIpgSyTQk35/XRkDf9HPh7EU5oBRXWNsfAR07
 kvn7iZiogDLntDUonVNJr81beEXUwunZb8XbKBpvkadLv9aElpCTMQAUXXw9UdL1QUJ/7IljRm3
 PH00hE4GcjTT0bhYJJ682f86wuRb7RVcyOlo8Xw6+GGRmwTBHCVh/WpG7ZwYSuQmCVI6erYxp8g
 3yXuqk0TFDIxWwW/ut89gYEDROfZkAWeHWzMvVjKeh/nxce+4EUuz8Cf2UZKXbkU24eAkNSrQih
 Cqu4/2EELZdgFAR0Kx9aYUUVlHFjEM9ZqITqoB5mNJ0Ef+p3W2Ihd/XTfJkS9nsHRyQPs2vTYCi
 GlGL8ssK2XzwYvrKR9g==
X-Proofpoint-ORIG-GUID: QZ5nrPNo0WNyRGgGEq2DuE8pE-14srOg
X-Proofpoint-GUID: QZ5nrPNo0WNyRGgGEq2DuE8pE-14srOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 293fcbacff34..a2d6e6947c4c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
>  
>  			iommus = <&apps_smmu 0x800 0x420>;
>  
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;

please put it under clocks like in other DTs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
