Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40D2DEA89
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507841; cv=none; b=nGbPfAQ6W/2EtdWbeXj20ZF1ZH/j6gzq6Bu+StBaj11spsn2A/bMQ6Eh2s3HUHi/KAAg0GF97k6FPBMqM3XlA5wAN3jJ9uMCCM6vJQT3fZfmD40waj20PFtUj85dhcP6O3+Kgj/xjsSK8HnATrjSG1OWpx1jBwZtieL6itcrzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507841; c=relaxed/simple;
	bh=xBJ/7w9id6syIhW5wipRMkeRBktiTifargS+O9WpD7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ci17UZM30JZOMZhMrymcROb++13E/RYpOkOF6npzq841nYov52qEC54FCC1QN4bNpQACwXiFt9oP25nUEAFLsQaUALGWoLG8nKLaI9w5nniRQv0cAFKtNGcUd35ZsGau6EDJm+qwDr6FcDFDRAyRque/8HU3hjaqMK+3BUyB/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6nluYy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxLWEuYZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6nluYy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxLWEuYZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990QTD04080924
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 01:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKvG9/Cxnz4Au03lnvbc02tVpQ/J5aw1CU2DV7LDkYo=; b=T6nluYy8S6u4dppI
	BWT/eMSgy4OJOUwVtlize9siEe5n1ujkqznvjyWQf7JzYKVh+EMAPc5XGcbnVF9Q
	bqhtiHTDQHO16z6uJSeM3HFllNgqOuPYyQphnB6iLmpunDgi2MaTQgRKSc/ekYV8
	ac8rDPnBjiWoWuO1gz9cz9wWuplB+RaEKw3DLcL1r3cESBLbsICnj9xhLpWu3P3d
	IxwzJ2aa2xotTWaIpGIJLCZV7i8GXlw4g6+FCcdiIPPcaQvbG3f/r1dsVifmH2+0
	LGpuVoEd2CJyOT1fUrcHmU0hipuHof3YRy9mUTe//XNyIvTKYkNHSTBBtJnzE5/u
	67TYPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqsc1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:03:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so5321086a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791507838; x=1792112638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKvG9/Cxnz4Au03lnvbc02tVpQ/J5aw1CU2DV7LDkYo=;
        b=GxLWEuYZTJhq22zPMzkFj4YKwmLZudozmuSxk18u3q1+HqjQKRLPzhyfNJ4bhxfpka
         YuOIsMc5Ufpys7N1I35svO6YH7r3s8LuTdn2EYFNAWHb1nhyT94ZOmjsX1IwyNXmslgL
         Vl2/I4fCYY42JpmTMViEqp7CVZx3ITTsn3lqy1wMHNutT06RTuNNIHekdnb0SR2Q+VyY
         0jcuRZMq5MYCB0NN5/sZBdyJ973ZYOdc5sr7iT8YgB2MKRbnxNsEal+lRFOcsfEyZen7
         tg9Qtr70ZrSIn3esxw10pLEubHwfcsXbQ55bgmxCw145+NGFv67v2FGG87543axSrLMV
         ap9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507838; x=1792112638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKvG9/Cxnz4Au03lnvbc02tVpQ/J5aw1CU2DV7LDkYo=;
        b=2dJitdo/GQA2luYskQGdCxA1CO7zSn5kMBjS2gTFT2vxg8EivdnENTAIDWUQE/Wcta
         6+3Y9KRgwAO7Dq7eLtJ+7nFjj7anxKe8G8ZqMgGxYymrSYwK1KgJlTnP4B1Ot5UEO7Xk
         YKMw23SfNf9vBnRHiH6w6dJsv1cnuRZsTt34iijNPoC2B83rOA5xm6DOKxNYOmkUqC6P
         H80fVLlFYlbVJzyel1dKFo1ZmFWGzBeQOLsF7DstNyYmVMOuRXBk7ND+tpsOKN6hz9iK
         U39Q1G06QEa7fgFx7drOO6rcOMHUqmgjDmmumQ/oJt2fS4PgKdI0m9uzD5cfTaCihq/3
         4WUg==
X-Forwarded-Encrypted: i=1; AKwUvBxl2piNuZizRzW599iA81t/qOOnrD4U5g/XtivlASYi17XP7It1YtgKeW63hJI9G5Fd2e56t+b9ux+FUeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIELqdLvfQWVcRkZWoYpXQUjPTqQ6sNst1l3EVN0teuJHuyX4bh
	UhomnyYl5maeNJmfAn0MNW8groQKeKAKf4i7T07fXcG77Fq64HANKMWTWVG8L9ppFnfw9G68rU2
	D2FkIcF+xXS1+ZxZfU+plNfU1u5G7cGRELZBfvPC1BQXxfuhPp3vbtyHKoTzgb0H6Pw==
X-Gm-Gg: AYBFou3B0Yedk0jbsmuKCg3jf1qMIgHTboMbQTRCkEpl9e2ee7JFvhrR139WpVnX25C
	NRpwzC8C5banYIAxIppAfyBiMnFr+dRXhmiGIY8niHwVJkWO8TZQZ5Jxpj2Y91TzOiaOheLm74W
	wbsKu5QLgSjlkOVFlrekMTdwWDKvaALE1A992b7nJKy1kysEmDhZ5FcfEvBGgy7H2ltE9IMJmiS
	7m6EUIu7DCSzOY6RJdD9aH7FdROQjw6x7283RaYZ413sDlyNSYfD0WsM9YBry877GO6pHficufd
	6k8tyOB7LtRQhyUIJICtrHs2AP4bhgzysMlbuXZ2ROgChz7fpWgwZNHc9Rg6Toi7XmTqat8PanC
	wk/FrXF3T+Bb+HX61HZC4OPayK2xzanUZ
X-Received: by 2002:a17:90b:1dd1:b0:3a8:f70f:1cb8 with SMTP id 98e67ed59e1d1-3ab3aceb97dmr409602a91.44.1791507837652;
        Thu, 08 Oct 2026 18:03:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd1:b0:3a8:f70f:1cb8 with SMTP id 98e67ed59e1d1-3ab3aceb97dmr409567a91.44.1791507836931;
        Thu, 08 Oct 2026 18:03:56 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm1348494a91.6.2026.10.08.18.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 18:03:56 -0700 (PDT)
Message-ID: <c67afee3-269d-4acc-9e70-72d932d3e1e9@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:03:49 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] tee: Add kernel client object invoke helper
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-2-bf1c8e2a64ab@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-2-bf1c8e2a64ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfX8B7AJk3lVSoq
 X1gKewjd5Df0NW0VRXUU7ZFUeOFgs1Qx+00CWMO4WZQyVqdUf4pBIHkAesC7J7qVUwEinyGGhMo
 xjNiB9SHD1JSIHduiBsWIE1VclQZozw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwMyBTYWx0ZWRfX3p/aM/PzwvS0
 qk8ZlX2BZ5ZniNhIg5gol3sX9EqOSBRrYZ9oAzZNTmL6mh5QJ/vl8nlNGYPJdhF+M4wTaqP5qn5
 Oa7pK/YFw5KsiIl8i9ReuSCvx7l3+5Y3dchhRdjiZ8IJIrLGT1TXUEx433Phe/m27rsUlM79OTP
 7jNoAKWYedfFMhsYTk9RYc+9LwHBONK9hQtQKV5nIA+k7PT+3eM1pwB8WPDYPlmJesRtLtzNpVb
 obyoQcgjkmuXWnCGGsLcMrRDdO8T4FfzW8CbPOmlDSxbcUU9af8/Ir5jcb+Npg8kbvUrfj73p5Z
 iLuQpQB1cl2APCFfELCbKT7yAoK1xCaIhhMITxnfRbC/pOBHkiDUebTsfSCRSSDmefzqLP3r21n
 rIYzmjniFhnL7yTwgHO9Hzg9oP0GPvy9jQtTAuMbvi54fQnsTgkaHjUnP+/hZmmU6ZA2k1CRPdL
 emPBAUdLlNyZD1ep/pQ==
X-Proofpoint-GUID: VKZOGh4HhGQ2SD-jyce0TiINMdQeNehb
X-Proofpoint-ORIG-GUID: VKZOGh4HhGQ2SD-jyce0TiINMdQeNehb
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac83d7e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HcZ5Pp6Carw7JWlrJ38A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090003

Looks fine to me.

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

- Amir

On 10/6/2026 10:33 PM, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Kernel clients can open a TEE context and invoke regular TA commands
> through tee_client_invoke_func(). However, there is currently no
> equivalent helper for invoking TEE objects.
> 
> Add tee_client_object_invoke_func() as a kernel client API for issuing
> object invocation requests. The helper checks that the backend provides
> object_invoke_func() before forwarding the request by setting the origin
> as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
> privileged object-based calls from the kernel-space.
> 
> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c  | 12 ++++++++++++
>  include/linux/tee_drv.h | 13 +++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 30901390149c..a03a3d645dd1 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
>  }
>  EXPORT_SYMBOL_GPL(tee_client_invoke_func);
>  
> +int tee_client_object_invoke_func(struct tee_context *ctx,
> +				  struct tee_ioctl_object_invoke_arg *arg,
> +				  struct tee_param *param)
> +{
> +	if (!ctx->teedev->desc->ops->object_invoke_func)
> +		return -EINVAL;
> +
> +	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
> +							  TEE_OBJECT_INVOKE_KERNEL);
> +}
> +EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
> +
>  int tee_client_cancel_req(struct tee_context *ctx,
>  			  struct tee_ioctl_cancel_arg *arg)
>  {
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index f3c5e106d853..369c87ad0205 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
>  			   struct tee_ioctl_invoke_arg *arg,
>  			   struct tee_param *param);
>  
> +/**
> + * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
> + * @ctx:    TEE Context
> + * @arg:    Invoke arguments, see description of
> + *          struct tee_ioctl_object_invoke_arg
> + * @param:  Parameters for the object invocation
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int tee_client_object_invoke_func(struct tee_context *ctx,
> +				  struct tee_ioctl_object_invoke_arg *arg,
> +				  struct tee_param *param);
> +
>  /**
>   * tee_client_cancel_req() - Request cancellation of the previous open-session
>   * or invoke-command operations in a Trusted Application
> 

