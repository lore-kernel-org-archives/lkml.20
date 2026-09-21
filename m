Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CA45A2BC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982228; cv=none; b=o6ombrwtQD8/QLGOZ2WQFGRP0ytH/mt3xPDA6nuqweAUXDCCE2BgXeCZRZzG9Tq4Kuq9afJp/x94JM5yIz8FCTy6VLe9p6TuaXQXPplzs2X6MHm4BhVsATdDuy3Mtk3JphrYk56J6n0ThRPjtF9bSaQ5sZY8oMOF1jyqNuVv8Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982228; c=relaxed/simple;
	bh=N0bIQxqL1pceSmmTqY9/CndD0J1iHD2RfX4MzvKlfmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1BHk3bjiA2ubTjtbAGPxl5q2KlxULekaZVitpaaHrk41sdE9fnyOgBS6b3btvwaPYEQlJtflRqwoNoTuq8O8CGITdyO26j39tV7pEimskLxTH6V2+/kXxltqT3Ny9ztxwCY4+XVgGTPhQfqiULOsLruESg9W4V7dunKPlw5GUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEW8KNSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWo5LuA0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEW8KNSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWo5LuA0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79sSo1624331
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+zrOo21ugBRzxhcPfBDsYADhDuFT+BowRPcmTeqWkI=; b=gEW8KNSFNdph8A2U
	QfOZVNgsMzjgLn8evgXNCg4P6gfdTb5QdHay6ueY26RTV1Zu2Z+BxMM2A81srUGZ
	hJzS62UXXeC44IRGa/fKo3qOV1POjsm0jb0BFe34ljUw6ybu8TimcduBGmEfA3Ku
	+7w/hGPsEhhCjwXHjgMcbaVraoAlyT+11nnbSPaicfl9BdQl56xoHPYEjemyZLVJ
	1UDR8iMOFveSSJgyGJQd8uIvza3TsKNrqWkKJec+bHnqlz/OMPBXxxzduMiLZbnx
	dSKMOvKgjmCN4DJvxsjqFdpz6zE47vG36auq4RBbuNQYxAt2wM3PMzfL62kiA76F
	H7gomA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsknp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:17:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7122785a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982225; x=1790587025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+zrOo21ugBRzxhcPfBDsYADhDuFT+BowRPcmTeqWkI=;
        b=CWo5LuA0VMQnA3I66FRBAhhFeFU9lRNED8o7YMsfXpFHLRfYyB52/PumD6AP8ccDaE
         TYXrbwzuuY+UgjVlIOnGr8caFAu3kHbY7Kpml/6g7otDDADlMtP179ioi7KKUUXykfLJ
         qAV1JU4N4MNenTLpn/jXRoiADNok0pibwhEbmG9s3RF5ymRcER3Y5c45gW7sIca2Xohe
         bCGzKba4ioE6iuDYP3+6evqbJ2hY/EAamzg/wpuAf68f4H+DJaI+g+yPHQAHxlklJQlG
         pYMZNYYNBi1hnYXx2dL8Nyql1QEFk0bQLeUd1mjwZQEGo5FJkKq6jPvtw5KZlLcCq70V
         PzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982225; x=1790587025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+zrOo21ugBRzxhcPfBDsYADhDuFT+BowRPcmTeqWkI=;
        b=B48fu0jX3I3rlVC0RjcH+OQZbpWkr578hbC50Sm9Eq5lvmqd3TdYM4n9JiYvPyvOY1
         838IxK1BMeygrDntjmffUGmv+gKEfC3AtjyC5A5nRrd7wwynjRWWeOnWSHTSgYJf5DDQ
         Xs1xDkGRxXxm8V+A+sjknNTeWA3TYIrolr9FYntdaDGqsfrmBLPJz2TmjswlCY601di7
         x4edbGL29J21Pn+aClrQ7zex5khZhy/bqXnsmjPt5bk1XEHyskSzEuqVjWZ2DApi8hVx
         ayqSaBVE7Pcwnm9J2r4NYo6mC54OHyyYaLDMW5Qn3SxMjdhjfLH2iiK08icZzQEoHC8m
         eqAw==
X-Forwarded-Encrypted: i=1; AKwUvByqyllRLKeK82cZH7Mv4Y854n3ZaO39aKA7MA1+WilgijF4z+hf1xlW9bWx1F+kY2xGjXcpWXGb93QDSmI=@vger.kernel.org
X-Gm-Message-State: AFuF++mBwIINRRqHu5U5x0ZNbcJ+nUQRidcVuADIaHMINAq/aZtRRWTu
	8UDRryo8SGJGOFOGcPfCEUCggHmOZWiyZf/efkYXPTCortuzjSWGIYaWtJAhsfcciueM8stEh6o
	KbA25pBYU+PpV7eiaPRSOjv8zYa6PBhJykr3dmJJ9NJCzB/C5Av3kaxlNcs/S6Y9XGPI=
X-Gm-Gg: AYBFou0tyXSRaQghnTBdX1X6OOkJlsjz8FVkgARrC6LhTwUy1awa3UzdKFYrmcZ79Az
	kK6DaD871Px8jwxgA46564uSmrFJpTCIVqObvac+MKQTVO248xTjojxVIJp/bFVeYb+yJnZcQDu
	nbQwhstRg7z0Vo6q4s/wf42u46SEKVOd7pm7FNYXXQiGMdqsDatvJ0yMU9JWWItx+celHmd3TnA
	BkkX3xPpXRXPOX5k5AKfgDztdtWdSxNMHBHw5g+csP+qCafdvXJJuRQD41gag8vYt0BuVH1h6jR
	u2k8CTdBVLw2P5s1IOgdZtDMxHBRHpqT/MiC93W+l3WJMSkVFkCrqS7j7Laugrasx5zOcsTYkuU
	kP+Ekr4aB3OBaxo9MwRecxbovOjI=
X-Received: by 2002:a17:90b:4c52:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-39e6a80b896mr10632576a91.41.1789982224938;
        Mon, 21 Sep 2026 02:17:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c52:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-39e6a80b896mr10632549a91.41.1789982224459;
        Mon, 21 Sep 2026 02:17:04 -0700 (PDT)
Received: from [10.219.57.63] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm17414763eec.24.2026.09.21.02.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:17:03 -0700 (PDT)
Message-ID: <22594579-a48f-4343-84e1-5bdd99478b9c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:46:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] misc: fastrpc: iterate CB nodes manually instead
 of of_platform_populate
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
 <20260826-dup-sessions-v4-1-35555d2bfed4@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-1-35555d2bfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX9UirUAAl8dFw
 ds2dp7MFw9w/Q4xD4BeEgWwb4Qx64atx+/kVTsCBHv1LWvRaeyNlBTFBy1WSIqOp5vT8PIrOHpY
 MMCdF4V+S6N9ZbvLnBej+Jvt8Qnrzckun38vnN1s3aEHBIYNGMW9xQi8ZPMvgFZ7KvBHOrASQx+
 5DNCAz23pkroN8Oy/sSIz896HCacq2aB3TJtxU1Nh6QYmBZmVXWAGMxOSfI/FaQUM/gHFGG9trT
 kDUiGl/ABRCffn/VisIeUGWyb/eWZPL3a3gp2cq7IL2zc+6dYt7q8XPgJCdF3UeHM3Y15KZAYfc
 q8v/WfXi0F9Nz4dtzKR55XIq1GqP1dKmantVay0AaP4prRh9peOzINkFC364cghBFklSUwYN/+i
 JkmSPz/Zq6ut2mY8Ta9wB80I3etGaYqdSbrLc1k01A6Ql+pzXFMxTz4bmq9X5PG2acRJKaXMrs9
 AIvHDRjRslu05sNaMyA==
X-Proofpoint-ORIG-GUID: 2Ke7RU2NRVLObOpd2726hKsAb4Wjtb56
X-Proofpoint-GUID: 2Ke7RU2NRVLObOpd2726hKsAb4Wjtb56
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0f611 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0HjoTqE-giHM8b9XGacA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX3kS3WL/ZPxsE
 5B2dvtVWPzr1nSNeC+WdWYqZPdAZeaOEAYxSpQWEiHPuYvAIBjtm9cg4+fOxwXvrZaIuD8Ah61B
 CLUX6jGc6qnFzcVILXMBXf4b3Uh58IA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131

On 26-08-2026 18:55, Vinayak Katoch wrote:
> of_platform_populate() only guarantees that child devices are registered,
> not that their probes have completed before it returns. This creates a
> window where fastrpc_cb_init() may not have run for all context bank
> nodes, leaving the channel context partially initialised.
> 
> Iterate over the child device tree nodes directly, initialising each
> qcom,fastrpc-compute-cb device synchronously. This ensures all context
> banks are fully initialised before fastrpc_rpmsg_probe() returns. Since
> fastrpc_cb_driver is no longer needed as an independent platform driver,
> remove it along with its match table and remove callback. Set
> OF_POPULATED_BUS on the rpmsg node so that of_platform_depopulate()
> correctly removes the manually created CB devices on teardown.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 83 ++++++++++++++++++--------------------------------
>  1 file changed, 29 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d4fac2caca86..a153107d0085 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2363,7 +2363,7 @@ static const struct file_operations fastrpc_fops = {
>  	.compat_ioctl = fastrpc_device_ioctl,
>  };
>  
> -static int fastrpc_cb_probe(struct platform_device *pdev)
> +static int fastrpc_cb_init(struct platform_device *pdev)
>  {
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
> @@ -2385,7 +2385,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>  		spin_unlock_irqrestore(&cctx->lock, flags);
> -		dev_err(&pdev->dev, "too many sessions\n");
> +		dev_err(dev, "too many sessions\n");
>  		return -ENOSPC;
>  	}
>  	dma_bits = cctx->soc_data->dma_addr_bits_default;
> @@ -2419,38 +2419,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static void fastrpc_cb_remove(struct platform_device *pdev)
> -{
> -	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
> -	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
> -	unsigned long flags;
> -	int i;
> -
> -	spin_lock_irqsave(&cctx->lock, flags);
> -	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
> -		if (cctx->session[i].sid == sess->sid) {
> -			cctx->session[i].valid = false;
> -			cctx->sesscount--;
> -		}
> -	}
> -	spin_unlock_irqrestore(&cctx->lock, flags);
> -}
> -
> -static const struct of_device_id fastrpc_match_table[] = {
> -	{ .compatible = "qcom,fastrpc-compute-cb" },
> -	{ }
> -};
> -
> -static struct platform_driver fastrpc_cb_driver = {
> -	.probe = fastrpc_cb_probe,
> -	.remove = fastrpc_cb_remove,
> -	.driver = {
> -		.name = "qcom,fastrpc-cb",
> -		.of_match_table = fastrpc_match_table,
> -		.suppress_bind_attrs = true,
> -	},
> -};
> -
>  static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
>  				   bool is_secured, const char *domain)
>  {
> @@ -2642,12 +2610,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	data->rpdev = rpdev;
>  	dev_set_drvdata(&rpdev->dev, data);
>  
> -	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> -	if (err)
> -		goto err_deregister_fdev;
> +	of_node_set_flag(rdev->of_node, OF_POPULATED_BUS);
> +
> +	for_each_available_child_of_node_scoped(rdev->of_node, np) {
> +		struct platform_device *pdev;
> +
> +		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb"))
> +			continue;
> +
> +		pdev = of_platform_device_create(np, NULL, rdev);
> +		if (!pdev) {
> +			err = -EINVAL;
> +			goto err_depopulate;
> +		}
> +
> +		err = fastrpc_cb_init(pdev);
> +		if (err)
> +			goto err_depopulate;
> +	}
>  
>  	return 0;
>  
> +err_depopulate:
> +	of_platform_depopulate(rdev);
>  err_deregister_fdev:
>  	if (data->fdevice)
>  		misc_deregister(&data->fdevice->miscdev);
> @@ -2677,6 +2662,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	int i;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2697,6 +2683,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	if (cctx->remote_heap)
>  		fastrpc_buf_free(cctx->remote_heap);
>  
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++)
> +		cctx->session[i].valid = false;
> +	spin_unlock_irqrestore(&cctx->lock, flags);
> +
>  	of_platform_depopulate(&rpdev->dev);
should this also be removed?>
>  	fastrpc_channel_ctx_put(cctx);
> @@ -2786,28 +2777,12 @@ static struct rpmsg_driver fastrpc_driver = {
>  
>  static int fastrpc_init(void)
>  {
> -	int ret;
> -
> -	ret = platform_driver_register(&fastrpc_cb_driver);
> -	if (ret < 0) {
> -		pr_err("fastrpc: failed to register cb driver\n");
> -		return ret;
> -	}
> -
> -	ret = register_rpmsg_driver(&fastrpc_driver);
> -	if (ret < 0) {
> -		pr_err("fastrpc: failed to register rpmsg driver\n");
> -		platform_driver_unregister(&fastrpc_cb_driver);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return register_rpmsg_driver(&fastrpc_driver);
>  }
>  module_init(fastrpc_init);
can you use module_rpmsg_driver() instead?>
>  static void fastrpc_exit(void)
>  {
> -	platform_driver_unregister(&fastrpc_cb_driver);
>  	unregister_rpmsg_driver(&fastrpc_driver);
>  }
>  module_exit(fastrpc_exit);
> 

