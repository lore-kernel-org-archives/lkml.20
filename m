Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7DE3D45E5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838244; cv=none; b=ppJiFHqHR9fsSKdaLmKaABOigUdR5eOvffrRHF12rgivZiTuqhAJJl+cg4Va2m/GkvEZXM3Y1/afFHUJvSkHDi8DkUMv956cBi4xMmqoJDuFyTZEdWB+6c4NuJOqWqNc9nUz+wxihD6rQH9OJLEFI3eYxarElhK3Lg/BgbcWn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838244; c=relaxed/simple;
	bh=4Dhcuw5tUuTiZQSI15Ese56b5x3LeFF3S0x0Fy/QLEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F89cXB2imyXXDwVYuc9KbnY8nd6qSnUhPr6GNYbN2i72wJ1qKEju7tEGsNcHl8FtT91EaeiFKX/KBBknQM3y7SdBSsmqxuaJe2OaCr19EvPkSya7bSeqvoL3Yob3NAiIKObpGt4yqaBUQpY+ECxiRsZ5LUE4TMw4NXWJ3bkbr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvVGtHo3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6NimU/y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvVGtHo3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6NimU/y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xTiK1289182
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 07:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96a7P/fzTBbDLB6LmK2sa0Ytq4psqM6uEcSlt2wX7f8=; b=VvVGtHo3GT6jOBK5
	OTk4ez7ZiK85rfgHwyVndsoBRvtv7V0N1tKSEccwwJ/33H1KZ0qwFPuhoZnjV9gD
	ECZUVZHA5DESK7PsUw/OcqEzdUeTCZxzzl/YKEjELgJKYJywRGP1GJLOdVu3mOkV
	Ym/QFXVgdngluYH47+GU0GLl2Jy3VHXjGAjjASUW0wC+6k0/vuSWCPPSwlcypain
	etz3SkBiM2F4nWfX1j0Pbg4JU31ZVmfqr3jF+dr7D0AOGRYIqrQzE/kn7JPk2M/E
	EeN6PotCHtHODpGQWB8Z9C72yXgyuuD3IJybHmxTcoTJ5BCTCPMkCZB0eBTLg6Wj
	h5Twug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjagn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:04:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4293344a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790838241; x=1791443041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96a7P/fzTBbDLB6LmK2sa0Ytq4psqM6uEcSlt2wX7f8=;
        b=d6NimU/y0cv9RdKqIdjddUtm1Ri2PTcVnFNLd/OuotsJ2yHLix2+D+tRcKt9n449dW
         VZ7ObvVyUHRoqCyE/dWjXPuW1beQaxyXFvN3Jq8wJrfU9q6x6KB/c7zespo6pEuBcxSw
         lA/C/3lZl/OjZEa1pZnXeucNlhBV806SMTzA1kTrVTFkngrn/fnYZlVSNpjjAX6P4P+r
         i9972FqGcAStblWCMTrg+XIr/JsXygg/PTqvBCxKB7xGtNCz0C/qrykSCRMwXUGNeBMP
         AFxNvx3ZfmyA5vk54aXwBs4F2zszz9RsG7fqCpCf/OVWVeAJNgo1yGZ3g23uzIiS/u7D
         LmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838241; x=1791443041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96a7P/fzTBbDLB6LmK2sa0Ytq4psqM6uEcSlt2wX7f8=;
        b=yxcauzqXIne3dCtfaGPXZY3evJDxLU8wv1qqftnIRu+rZpdRXKLag2dVo+F8LQvQ47
         l1mz19pxetYknRvmJRKtKcfYNzm/UIclN5sROPZYANJx00f8Iv3qhIiEruhNf9KSE27/
         IulQ85AGvF0Qkjg/zu/tWwm1sHUTOJoXNsmghJe364iYIiuSxjwIFgRqrpZiIpqT/ghy
         zJeq40Z2khOu154IgYPSS9E6yPWQxCmKfPoHIlX0sJ/G8xaExzkq0RgK/jOKiI/I2Ho7
         JefWrq9sZO/lpms9MxiCenW7QEPss0Ull8oxM1IxJ4Pg1upyexZBipNh0WIYl+bMnmOD
         N4fw==
X-Forwarded-Encrypted: i=1; AKwUvBzAK63FM5dgbnD96zWXA6GqD2AM+J+kM6jV7cPcYx7uZ062WMGsZ9ww9w05Zv3d9E7lpVI4h48CxeIMh1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoJAl6VuSur/i5P+LpK1nr3XQjw2urOzhxpObzUB0/drjnF/qZ
	Spd4FrTVyYrF9QiYNUraUN4E2BkvbZdl2XXTjurcubg7kZXcWGkmrav1i9JxaNU6hYnFYMNRpEJ
	cyxChbO4reDVIAvUYMa1tEF9rqBD1/HbwiPBXkKYzdTNxfVMzfu4hHqV8OZ9EWWAb+4M=
X-Gm-Gg: AYBFou0U/nzHmqz9N0TU6xCvzZezNupj1+tQ2l1rc+27m5p7eRHLQiwHtgRVtbUC37P
	M1bLgqq6YYrA+wzrn94BTjYSGpR9Uze1Y5l8YfqK98Ag1/0FLuPfwSSv8cYSawokuvL3eEZauJF
	J9M8lkCw7nDE/b5eZUgTETEjnmYgjoLOhd3ctd11hshnXWvfVFhDrRqgKzzFbI3Yvy8Bc1jiTxF
	+ij+ZRdK1WpvcR31t4pxn+J5R1Y1ooRXIAkwg3tMMWlXHmFH09ognCFAmEcxMDFPfwhQe7uIVHA
	ecdWsLOCnxDSYvlk0SB13BFrV1+WrQi9vWEhlUNt9FIs9sLiVAN4dle+ALPs1wmIccANkmZiOyu
	LxV8aagg4oXTzaxBlZDDiZW5l4MsddARb
X-Received: by 2002:a17:90a:38e2:b0:3a2:b246:be70 with SMTP id 98e67ed59e1d1-3a4e92e5a4emr1279830a91.22.1790838241181;
        Thu, 01 Oct 2026 00:04:01 -0700 (PDT)
X-Received: by 2002:a17:90a:38e2:b0:3a2:b246:be70 with SMTP id 98e67ed59e1d1-3a4e92e5a4emr1279794a91.22.1790838240255;
        Thu, 01 Oct 2026 00:04:00 -0700 (PDT)
Received: from [192.168.31.121] ([157.50.176.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e548992asm918159a12.17.2026.10.01.00.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:03:59 -0700 (PDT)
Message-ID: <91c1ce61-a8f5-4da8-9373-46fbde6947e5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 12:33:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ during
 suspend
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe05e2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=1jaPZz34DRay/F7TwEaVUg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nLr9611-85JZXDtJkU0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Vbo4kLpJjtAPfIG0uDZJW3QhAAwoYArw
X-Proofpoint-ORIG-GUID: Vbo4kLpJjtAPfIG0uDZJW3QhAAwoYArw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNyBTYWx0ZWRfXxYhcsU1zujkC
 MJnSJPMDfjqSnB5j5scHHXOFWk5d1TdNxq4ItIdHxspqd+YsbpFz9sJphsqywzHd3D7o8b1zBl8
 bSC69WO5LXx5fWE+Kpb5LDI1e2KCTIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNyBTYWx0ZWRfXwOHa3+My3+aa
 CFKWjy4DGfW81ouq3RKquYG1Xlx6H8El8F7jjhjMGlRdNBnwZtq9vr28k0PFpWGcrxTmqnv0cAR
 1OLBfXjPacrm5seXCYa7WSPSTyGkeXLjH0ugnAARMS5ErR/kMPYfdeEjdZNU3JbYX4Qvb2U7KDU
 9UoZ28222pP1L1MhN+Fj9Ng/gjgdr6TjY3Q5imZ3PAfVRQ+81JiGaJkXxh8hIyrlIvIT8c1pbjn
 mNzSwPxzwV+16Q+1WUec6HDrsIb8hC8tGpFYGkIWt8yT/H6xc3y2c8xjSHOOICc0stWpUiH7lAr
 q7ov9Wj+Dx24CmueakGucaCWZdxCqnv5PxoL2eoqbzuzfLy5j1N2Oi+FTVJSOj4EwrqwquKgkMZ
 3CGVvAm2x5ciXq51SU36FnNvplenzP3kVnlz++PLvljF5wQ4rTGHqLgQuu5j/qKLKAYBgeMxTDo
 qVRbbkMtbetj8RkJZSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010027



On 9/30/2026 7:48 PM, Abel Vesa wrote:
> EC SCI events require I2C transfers to retrieve the event information.
> During system resume, an SCI interrupt can be delivered before the I2C
> controller is ready to handle transfers, resulting in failed event reads:
> 
>   geni_i2c a84000.i2c: error turning SE resources:-13
>   qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Keep SCI interrupt handling disabled across system sleep so that EC
> events are processed only while the I2C controller is available. This
> prevents event reads from racing with the controller's suspend and
> resume transitions.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 4d2ad042a7f8..d34afd901324 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -331,17 +331,28 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>  static int qcom_ec_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
>  
> -	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> -					 EC_MODERN_STANDBY_EXIT);
> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +				      EC_MODERN_STANDBY_EXIT);
> +	enable_irq(client->irq);
> +
> +	return ret;
>  }
>  
>  static int qcom_ec_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
>  
> -	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> -					 EC_MODERN_STANDBY_ENTER);
> +	/* Keep SCI reads from racing the I2C controller's system sleep. */
> +	disable_irq(client->irq);
> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +				      EC_MODERN_STANDBY_ENTER);
> +	if (ret)
> +		enable_irq(client->irq);
> +
> +	return ret;
>  }
>  
>  static int qcom_ec_probe(struct i2c_client *client)
> 
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

-- 
Best Regards,
Anvesh

