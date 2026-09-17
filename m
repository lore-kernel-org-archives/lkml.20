Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B843D5259
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632547; cv=none; b=KGLN4iqWkT/77h4eYhQkqgmRUprDZF2ZdpbV450Px9ZqtkimB0g9ltYtdQiaU77k/FpyddjJkoeWszknt+bNz1MpWqEY5+0VAVq93ZQaFwpgDQTb9R5MLRenfqze72DS1TZWZ5MHfSV2VC7JeNzbQQ/7r9hqZI1c9aPOq/K4ijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632547; c=relaxed/simple;
	bh=Mec2abVM/Lf/R9VYG6xI0d6pNY0/XHkdaMkNMG4yYxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVbQZTnICkpzmRZ23qGmJorJxrXaLrnH5FGFp2fIhmXB3SmC6UACk+8uVwfvodrZxzaHGPEbIJJMt0ejeH6umcpEetJVBvYiCbgX7Y1PJPpq1dHxM8Vrx7xj5OdcMDt18+P/uqMnUD2TOC19UUDuklvXvDqFxty3OOThVnM6Yxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpbjNAnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4vc1n/p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpbjNAnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4vc1n/p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60Nka3702435
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=; b=fpbjNAnFGmEG0x39
	Lo4gwWAkMd43KSAr+y8X9nwpeKv+kOH0iq64hZkmmxvt/ulbv8TJ5gowKXUe2jUQ
	DPePWFlgB4irnbqicRCPCQf8zTOR+vbc4ElqfV0VKAaiyFnA/arfh74mfn5iMLKD
	CPaoAkp3lwYPCZCgkg2NBi3XA9UTOQWNa0+E0rkJSMV27eneMcqZSw6NDZ1K7IHA
	QVsEi+09g5pOv24NvKd7mwxWet6gHPgZgbtdfbq5WhM8w4bm+ynUK2LQ7tf0f/VM
	0le2GWaG3z+XjjKD86rATtEZosilZuSq9YEcQ2Ct+0Jz7cjnwhE4tvumtk81LKje
	SpXgQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc949u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ced1ed870fso1152415ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632542; x=1790237342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=;
        b=j4vc1n/pQN/1Ayj08wMZoGjVURyhvNkTjaFbmk/rgb1ZatduXEyItE4nalkVjNcJ+K
         X9PxD3+cIEyCrxtnrTUVie24fG+TFgTigkaPxbgL3psvk1zEZfGU1CzmXbRkmR9m8Lox
         rdpvoSbk/6pzN1AVmMSJlxHCG8jiX30rXlnDQBrxfJ+732ZvWtZHaZmGBut5FRx1W/TR
         enxBmlbWqm5YgjbDf4yn66RvL3wd8exaWhvcYHXrU9dwLKP4Ugqv2Ne/8mpk6jmVFjcq
         bF9z4L70j9bVSZPl7/vcloRyMP0E36zieoj2aiAocoJ1n0/a9PxISs1X6fOdc1TxNgdQ
         kSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632542; x=1790237342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om9mu9sdK9jU4B4EsLXqzMghX6EVoab4IILvbHRdOwo=;
        b=2zHD/7zOlyDhPx3ncD3CJMULUQM5AfkRbT0u1o38LIIgomQDYQZ4gFUY0QlMwYYU3L
         ogspZ1szz2gHj6evtbJ0ABJu0i832D/TDTFggcIfnM5zLw+ZNyb83+Wm3Qle0mgZInFK
         NbvRgh6jAlT78g0jJmScwuEqDERWOyHoAG5u/kPj5VkoicnUOV+J9LlX8g8BobdP3Zf+
         tNMeRi1BnsUWm1XU0HoW0ueAcrrGrh31dtPqKJFrBC9gjjtgQE6GjhwN/b8sgFsvZn3z
         tetqpEY7VIDSPqNmevcRa/jsnHyNwERFm3w0oJpnQvr23l/vcacZo5OUbQscfVzv/CB4
         vhTA==
X-Forwarded-Encrypted: i=1; AKwUvBx4fyBwLqg1Ml0dw0PUDVHYbLsBNCF+3JonPe8KN43Zpt4Y7yLxtHr6MSRZAq9i+3tAYWmB3VtIe8eyi3w=@vger.kernel.org
X-Gm-Message-State: AFuF++nlb3u3oGl+QalfhqtZ5ZGLGOhtYzjm/DYI4i4IcU23T9WIFHNL
	n2tdFzyzHJUj7QpgU6wSXWk69UzPFd2dLfi8TFgIjyCsaP64dFZHz1elK8Hb8VSweDohOit0KVR
	n8WGr71LkioqRfcdncDI5w0OAHbSgDs/Rmrz1GLe0GjPhEsLdMnll0410pU7LEQcjoE5KLRMy7n
	4=
X-Gm-Gg: AYBFou3FBZBfbPLVBxPKYj+9th5z0rrvc0uKjLsHQRfR3SqwReIY2HjzeLgQHHjTNaW
	eA/YCGF+joxkBYbyYVf//BcWAYv0Q+TeHwWrr1sXgDo1dQ+MKHuZxt9btzMTkrIEGx7KoFlrT6j
	vVxDkRlKCPCgHegZy8iZI0+cVxFiqf56WvE04DJAxhAnjwft8VEnO5nYzFRmwdeCyiAshhwUeEF
	WkW6zkAS/9MUQ2OfWPvEsMgenRJ9OFMLyYT0f/a6cTMKtSbEqAiFA+Q0meCMdr6ok8qJ37zLOPT
	bCTc+ITPP43H3nVcd6+hg46u3UVVfNMZO6qB0zipBYN0c3Kuj12fOg6iHBVMP0fN9dvbT5VsZYt
	pgC1BcS9wnxmNicoNAsex2Q==
X-Received: by 2002:a17:903:2301:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2dd8dd0afd3mr85681205ad.1.1789632541952;
        Thu, 17 Sep 2026 01:09:01 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93bb7a47203mr864906885a.6.1789632163730;
        Thu, 17 Sep 2026 01:02:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de68fac9sm237902066b.57.2026.09.17.01.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:02:43 -0700 (PDT)
Message-ID: <155306d1-26f0-4dd0-bbf2-4e8b497b60af@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:02:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-msm8960-fix-pll15-config-v1-1-11fae0be111d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfX7U+0j/3RVm3D
 fCv2xAVNWeqhcGIZGSpisML2EnnhrmPHHT7yoznY+Bdgh4YLFv2QFVsUWFTozCwAUOHyXYbB8Y7
 dBE+svm3UIII8+sHzbuiFxi1k9nL+I7vckHLahabQVEk85FuzPq5oYRSUsQenvWYbvRGOXmNpyh
 j77iPztmQCWpU/dJKWa65AwQ71F//bf4vxZB01WonEn/SEhF3kc3/8d1Wmf8+oHVuw6AKlyc2Pd
 UfDglRNUI1N/Sjr7fUNJV4mNgKtaeDpvSYxU59Qb8Y6Z1SzFha4La7yAVMnfmN9XbV13FxrFg3G
 K8I7pPbIf5+8DDXiivOsgnf9rKAYUJJ1axxnE885vSA3MCvvFPr1/iQyEfTffR61dKYtsymdIvN
 5QCj3H591ImEs2LMKy203kRpKfM/HR2gzzwZm87tpNv0dk3R0IvRJZnEfNiEMrRTSAIa0EnVAWq
 ioQBOKqad0exeYQr7Yg==
X-Proofpoint-GUID: 2Vf6z3wTn0W4Mkog5QyAEufJyB3nRnIb
X-Proofpoint-ORIG-GUID: 2Vf6z3wTn0W4Mkog5QyAEufJyB3nRnIb
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aaba01e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qj5jWNXxokvdYmWtNJ0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfXyiZjLCEjdXU/
 5yU7UDtuyJoleaZQjPRdjicqzSmPO5C0O2sNJdsKtDyDq8axdbjPQ7p0KmVJ1oLP3+vLWpClM5M
 aHWwGHzIwIMlCMwPQQO4NXRzFKPrLFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170109

On 9/16/26 2:04 PM, Abel Vesa wrote:
> PLL15 is specific to APQ8064, but the shared probe function configures
> it unconditionally, including on MSM8960. Its configuration registers
> at offsets 0x33c through 0x348 exceed the MSM8960 regmap maximum of
> 0x334, so regmap rejects these accesses. The PLL configuration helper
> ignores the errors and probe continues.
> 
> Only configure PLL15 when the selected descriptor is for APQ8064,
> matching the existing variant check for the GFX3D clock adjustments.
> 
> Fixes: e216ce60a9e0 ("clk: qcom: Add support for APQ8064 multimedia clocks")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/mmcc-msm8960.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
> index a23440e13b71..a67df833592a 100644
> --- a/drivers/clk/qcom/mmcc-msm8960.c
> +++ b/drivers/clk/qcom/mmcc-msm8960.c
> @@ -3170,7 +3170,8 @@ static int mmcc_msm8960_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -	clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
> +	if (desc == &mmcc_apq8064_desc)
> +		clk_pll_configure_sr(&pll15, regmap, &pll15_config, false);
>  
>  	return qcom_cc_really_probe(&pdev->dev, desc, regmap);
>  }
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
