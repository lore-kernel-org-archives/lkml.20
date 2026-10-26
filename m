Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984165;
	b=PwLHAWno1ItP87wnXYOwUuqBOtgunONyIA3STbOrthiXb+nK0gzlrmamCae5MI0xO140
	 isrioaXABVeJkcMNEOp+/Ke1BhRpRHF2LCDLQkPFmDqDW63ZkQVWTLcpxtDomhNpuS6Wo
	 kTZLazXW3Mlbkw+VgiW4rb+5hqRQKXEOuuHYHHBmj6bcC7G1edDZQZ6l7j145sPYnaFr8
	 Uy7fFlDgU08bxi0xxSCw8H2ja4d2OHN816CAn+8vjV/Io+odkewp1Dv4mztFHYg9Qxhhx
	 T9v1JhNkGS+/TEVP/ym2/fWS3sEUgEOB+iwspjSelZdLJXMiAu8CnVxcBMcH9GGKazA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=;
	b=TONfbe9h4po2HoqiQskjemVD70uRXvTvSbAxDEDlWL+D705mLMgVfRy6zxmHgKRjVkZf
	 F3pyYHnd0cuuV9xHoRBWjpFVD924lY9xrNuNgzLX/ojUt2GlcHKw6TMZNvhH7FB0NRhoE
	 Up7Z1oJt+7l475nGXHqoPi/f5UubXzTd8+K6Mju2TcZikF27U+Kvm7tjaWZMqLthrZE2H
	 07z7ySdjbSosQZ+PgV6pxqFQpj7Vd95v1ENwdHfT6inOIxNGL9rDr9z8qEz1Gt7PpCk6z
	 w4dsX9ocgW6s7tw/XS1JU2t5ukFKKsNbTOXDsRE4Rx+gmRgGQQn1d52Gn368oeim6YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUd1zGgg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrlYzFaN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6655606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6655606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUd1zGgg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrlYzFaN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q2KkhG1620311
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=; b=dUd1zGgg+y2P+cVB
	gG1F4r1mjwo9Z6GZlYm3hJMhlMpWmTJt+LGqYoG2vNkupDFwNnA7E2ZgWgAz5tHR
	EGeapD4PAacE2uwyvEKVQESQ46Y9IunUoMyNAE6T/bEAygCOOEjEDhMIOPgs+9n5
	u+ONQW26qA1Hn/GlWr6shMAqij/i4Xncsvqy7nY7o6WSschcfviHLbiVTNovp5qJ
	0uehcsSU27OD5qdpG0mmkmreHJVtlZSFlltTKRyoGrgrcH2beBwGAWel6zt1wgPd
	+pDJEvmJEZ4US1JA6NweMBUJzr8o0J+QXYdWwfTcDpPvJ9EA++u+VQrs7UKB+K32
	rCSFkw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmmbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so1787540b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792984163; x=1793588963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=;
        b=DrlYzFaNhuQwmhU+dCZn3P6vi/0xJN9HL6Uf1rBxe3HzQ6zEue63fw+7dZx2Km7GI0
         875tuGI+cu2u2ZKBThYcboHIY+apj5oDdfGUrJXZgdLtEkjII9KvF/P7wsjrf2HU2lh3
         ZR2pAZFwh/jFeZETfNF4NHO11QbpvbAcciliANcEJiWTButfz7PxgE5vC8+yGNVyFA8U
         l9qUDxTuQYoYkQhg6Kg0V8cu3EMycdxjQ4dvkVzhH/6i+4A/V5XW5eV67AdmJaaFXXHa
         ZE6C57LfmYVHykW67myhawvxCrkQUW2aFgn3Ko3nYS8oSQ1Is/fVVXDRA7zOVZQVElMt
         ZgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984163; x=1793588963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=;
        b=ATHbd/idF1dhDsNKbOa91iI7cfT3ygSGeC8TrkpJp2h8Nzq7y8RGOqQh+OhS2o3miv
         y924tsK3H2xjqKOWdAg8oWVZfBThIaJoRvS3Y0oQ6d1+4x8N3TgxEp98EENQwHH6WUh6
         +Mmg/cGEebo5j/xmXUkEI5cAD4Gx6IoDkrBYEf/HvIrQ28zPYH0j2slwEvQfdZqRQTWU
         Sw3iCSnhkqib/GKuS6ZEiZVmDbY6BMA88NwRpixTTN4s3iSUfZRN+jfrhix8HcPyFW17
         VZyCrhk2vOC4pJEy1gMnWOECtJ0mUBkd7D9fMfBgCC+Zi0HoBYm722Rn6+j0HktYHIY5
         eQhg==
X-Forwarded-Encrypted: i=1; AKwUvBz/KgkoD0LLJbyn0dPt9itVqxhvRNPfJMLKHu08fdwQURjt7gzk0G9V8sY+pIM42KeqFyBzifNNY2dQBOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwYqYXUJb/iP0M2g0rUazqS62OGsMa/21oB2etrbp27lf7X4V7
	fumIVA6HuTxEZwyDrvxR7Fi1/7AyMg7Qktum+LpRUAiC+h0szxGR57cjWHF8X5xG/fUvqjjPRAC
	eo3IDuzoK4Y1xT+yOGYxf29gOCSoI545HhTa/3DBR6y1s0O1up/kNcoqesoir6QVqEw==
X-Gm-Gg: AYBFou1ApUGSaOvfVc38GvRH76LLfzw13hCTbuD5oPYS7nP19+KqF/h9qz93zvBgiTH
	9yFnPGp4hkQFumS7eBRxrXehfu/bL84oWOfIizdjMKZMdZN1lUh7z9UW4xxrQDGu6JfGYj5qjs9
	38tLtrqRdpmtSnjOCuimqNqT6cxc/fppl0XcTP6wHHa1fn/5PeG0n4pP0cnALOEkuqV48MsDf6N
	hT1FO4Sc5tvHeBcJWzwQq5IKJ2joUWNetUdF7iu491vbNeTSbiM0T+ergJkFgpVt0oN1uqc0tsZ
	2hp+WWjtSkd0uBO1FNN7dHG3ngA4sPeRiFYSWjHNwCcMNKj0vtoBK7Da9PRqICrGRfkMp8xS5ns
	r855uQKH4eM0rLJ74Bk1eBArkPuqfWwJC
X-Received: by 2002:a05:6a00:a387:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a369072ee8mr4274269b3a.41.1792984162598;
        Sun, 25 Oct 2026 20:09:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:a387:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a369072ee8mr4274250b3a.41.1792984162140;
        Sun, 25 Oct 2026 20:09:22 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867adsm810745b3a.5.2026.10.25.20.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 20:09:21 -0700 (PDT)
Message-ID: <5d260732-c586-42b6-b7a1-e8eca9c41229@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:09:16 +1100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] tee: Add kernel client object invoke helper
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
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3KjCXGxcczzyXQSE3aj_YuTYA6i5LH-b
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adec463 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=pnHLkUe0LhHGSDu6DPowAg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Vsz39dQLEg-ztEiNogYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 3KjCXGxcczzyXQSE3aj_YuTYA6i5LH-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxMiBTYWx0ZWRfX2VjY0cOU3iBB
 CmJLRfrTdcVSgtFAFv6SyBKlQGhbtk6lq4K94xPQn8WfrqL4HERS3KHbr8DQLU1oAM/P8IrPxP8
 nMrC8t/ghmZUQkaotyTns9MDQXml9Hi4uQ3kkSBqz1Jnob5HgdRQPEHG7pntCsJ82e0LYKeKVHn
 J3DC2GU3WLcTMLMDZN4r0xLe1lux/EqgY7KWtE7ZUFmKAaH/RRRv5asgxmyQyruEKl5e4IsjTuo
 ne+oCbIc1NkKKDOE3rd1JXSIRiJWShEU+6mvEAPx2JgUtMHN3R9E9PuF69e+pFeNdqJpTNb/wCC
 VFZh55ImZuAmPxYGY+Ql+GBa3AeCEtp37ewyjaKxgYQ9p82yLGbfwTIlAe73BHFKoxEe0bB36Ve
 pqzhZE6uaH/cPOUvYmES79ZrEp0EUjnBMQHlDozk+cTcZE0V5HKWrlV48QnCQp3dfaWpgZkdDJK
 yxto30/YAwglp5svAtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxMiBTYWx0ZWRfX6Ln6EfJ2a1WL
 Be1bZCuLzLBfKRrKC+0RCcqRo6nS7678UiDpqCwPUJDpglsGzvxfj4pZfeubQP5EzjFu+o7KVoE
 HPb25rsh79vKLAE8GcxSMtymjn0tLBY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260012

Hi Harshal,

On 10/15/2026 10:39 PM, Harshal Dev wrote:
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
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I did not notice this patch has my signed-off tag already.
You can drop my Reviewed-by tag.

- Amir

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

