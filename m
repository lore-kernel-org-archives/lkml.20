Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018723F1AB9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525776; cv=none; b=UkEKypnXpiWQKDZCetdH6n1NxskjQU6M6f1oFId3Ri189wl9LTCaTNmBci68RVVqFKmc5+ZTsXm8X+OmMHux1Kh+096nOvNa5pDWom6OmMdneBXe4GqghcnOL4UV5sMv5MhspWlb1sse5IvDjCKjLsqA+ZUCh//AcSEPTOl9/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525776; c=relaxed/simple;
	bh=efqX0GVifKhOJlqEZ0k0bv+5jab29GzGjSyFqiVIdt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6bAbJyllpbf/b4h537Qi5PJoVVvBcXXfo5lI3JeKuRjrzs4DP+WLmw+SS97NkAblJ9L85nz3MIsyr0fN0gt+JGRSKEo24nQbomsYGTvu2wkjaDSjQrsRnMAwRML+l7XhHqg7iLrSeupO2bCo9WJ7t3MG1ypFfKtgkTjylknFlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLekEbqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtu4T5rV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLekEbqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtu4T5rV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H8AU1597940
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60YgA86+GQN4v5pv9VjFhYCGaZUcpH9rkoEgoxf9GQ0=; b=DLekEbqkJHfJZ10D
	IaeOnTjDOI8/ia+dW1xRDP8KnNjo0oJeAKBnPMbfqY33/OUahRS8Ks8OnZMsSYyC
	Z1Be77kFvxKuenI+Ah2o6ST20sjPfS1e3qBrA5ejAcjG3zvrvyWCuV5E2DLFknX0
	IbEY4YqKf85vzB3UeESRfMO6fvhbjWBMMKEPWmRwoDSXcCmq7QgKxeFp7gqjB39t
	ZJr9hcdxBZ64P4XHEiaT4AEVlw1OofutSsmMvGEs7vGiGMTbKuSgaLGReCsR50Ok
	2G1TRoSSYKS0xyHqDLY9cisvi2Y2ao/J6e0gkIOEDNGJk/h7F2X4QpoREpGnQgef
	tf8X4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufrxkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:02:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so72816125ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791525773; x=1792130573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60YgA86+GQN4v5pv9VjFhYCGaZUcpH9rkoEgoxf9GQ0=;
        b=gtu4T5rVqTNvsCTIiHdMP9+hnlg/etuliGecu97X+1pnXvkUHy14npihPXcm72KI+p
         uNRYBjC/THeaW3oDnUgBcy0qy65D2Pe+RAjgW2/rCJuyYCSXMysgL8sHuNjV/YywoOTb
         7NTgG0AGo7u+4jgHUfV/jL/XI8UvlbCJ4ieoSU8AmxofGM1Wlx7icZ5b0KjK1uwCsTaK
         wIxv/7fMLyhReicMPMJTKEbhWftuj30mdUOfLkQV0IokklJgkwFOhXs079Fn/nyzwiwc
         FbnV7CWyx/EsDyz/2sFFzCd8LxONdkudZjNne38bN29H+GxMHtCuKWDRyXd2Gje6f/Cl
         20rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525773; x=1792130573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60YgA86+GQN4v5pv9VjFhYCGaZUcpH9rkoEgoxf9GQ0=;
        b=B2GNQwSyaPw901XMkwpIWVZygzNhjoABYS6z9/8uxLTVapppZwZZjVMm3UYX7Id2W2
         leUi8TZUlp3AkqWVhob1fIUJMeNkDDkMKzSI004A8RX1elGCHVJtNi8JS+9RwXfZMn34
         zYdF+5e2L1/nycWl9B68vLwMAH0eAp7vhd+t9L5ob/Q7sxFerE9pZrLyHd6m/41Yabtk
         YrNeVLrcFhTLXXHSIHLA4SKvfmODI8ihg3241mbPo2MFPksnW6iPOkIH9pFNg1R/uhk+
         hbRWjl+h8TsSwaw1qsHENlWQ2poAgX/p85j9l5i/pjXc1hQueltfeAqLAJrjCoXvH8me
         vPhA==
X-Forwarded-Encrypted: i=1; AKwUvBz0Ptbnq2+j+lWVnXBHWgBERZOJmhDydPU1EgZZ8/XhWrsC0wLL7+e/j08/JWHOKmPX81xJJPApNRCXVLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxet7qnCjwEpHPw0cBtrgZ0w40Wl1wJCCXdH/RuLcQAmTviGn1
	G4qRABOCVyOrbNR6p+w96OU3OTnV1uKmYDI8ofVA0WIFDMgQ32S48Z228A3rsoQ28SZNe9c+fbf
	vVjxB7+x3ZwNH5cRQlMMVMY/EX0x42SNkOECYKh4TSrrzKjy/kdONqRWYYaXpvHL06XI=
X-Gm-Gg: AYBFou0bjmwkSjFHrlpT50ccjR4kBplP5InqXCsdgqcGUGUwdMW3OGutj30wy+VifRv
	3iMCymPzxKSLofb75Iv94AySTudRK+qUZ9Jj0+dVMsmFNQgqKSJnE9U7IQUx+h62qpeBUjJQzYG
	an35Dvq/q3lm8ZxcpLXtdTYTyN1Z4aNSft83g13cCJOQMqn8hhUWzQuyEiqjtEKzGEoiz1nmanP
	B1dZcTaWXT6LUUWGCqen+21sUrZ+Yikw35OQrxTLNoF/bvWheEX2fWXTdEcePT7D0j30iuMWDlV
	l2Vu3vvdvfNarrBQe3Yf+ewsgcpNL3Cz44fgHkdk7P2o4rfRMNhPhEcU8w3XBHU53HoDH743SSS
	SEUc259Gke9oxYAJK5f5mmWDKVF/o
X-Received: by 2002:a17:90b:2ccb:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ab3ac63ba3mr904199a91.33.1791525773255;
        Thu, 08 Oct 2026 23:02:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ab3ac63ba3mr904180a91.33.1791525772712;
        Thu, 08 Oct 2026 23:02:52 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm2466686a91.10.2026.10.08.23.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:02:52 -0700 (PDT)
Message-ID: <f9e811df-f0d3-4dcb-adde-7c4e42fb9ceb@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:32:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] misc: fastrpc: iterate CB nodes manually instead
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
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-1-e953133a1827@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-1-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8838e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SHHY10jX5hRKE-y4DCcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyMyBTYWx0ZWRfX6ALQ+eM8JGup
 Xg5+ZlE3ugFFlbvAunxtbhyHmowARpleYXECy9NeTG3kCBoAEenp2pZZ8YK5kAZVxk8DVatDT+w
 HD9M4VLnckeP6/3R/EcOtFr0Hsq5rP0=
X-Proofpoint-GUID: 5DQW2NFg9V8ezv_9ODrsDHGdaJonLrke
X-Proofpoint-ORIG-GUID: 5DQW2NFg9V8ezv_9ODrsDHGdaJonLrke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyMyBTYWx0ZWRfX24D2vvX/3lCK
 JnGrBIuS5qQ6RZI2jbbDVPEnhxbl3hf4kSpegAI3VMamAMIFexnTJ/ESIasQtZhwCSAunZr5Vjd
 DCvmTd2gRcOvcoHD08vmnoqLJZ7bcgk+7bXPqoSPp+7NU8LhOOpyv1vvQnRTGzm59QMbp7anm+6
 zA8AYOjMWIh/opZoikOoKV/yBYTIwXJKM/MEWaKNEK+cToIlkcJg1ftNGukkfr2WC3cnvA14EyI
 xbzBWrcoK2FT47N6CgwQEUutokwFc3iUKiVg0m+rUMRrTUAlkU0gq9z6kdcGECCO39kdpiUUTeC
 EKP6s3fewg1+fbenGN6LQskDvm1FqNEOYsoSIdkqeEaPg+3Vp3uFW8+KvnG4dfoayYoERuLlX+A
 d5SFHqBlrH8BImmt9Yjju+NUE1rCkP3x6zYo83+K3ghY99wM2NcfY1jbNx5Y956jA8qQ4ZqBkgz
 abdSwYJqYZB6tCwV5QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090023

On 23-09-2026 14:09, Vinayak Katoch wrote:
> of_platform_populate() only guarantees that child devices are registered,
> not that their probes have completed before it returns. This creates a
> window where fastrpc_cb_init() may not have run for all context bank
> nodes, leaving the channel context partially initialised.
> 
> Introduce fastrpc_cb_devices_create() to iterate over child DT nodes
> directly and call fastrpc_cb_init() synchronously for each
> qcom,fastrpc-compute-cb node. This ensures all context banks are fully
> initialised before fastrpc_rpmsg_probe() returns.
> 
> Introduce fastrpc_cb_devices_destroy() as the symmetric counterpart.
> Before destroying the CB platform devices, invalidate all sessions under
> the channel lock so that any fastrpc_user still holding a reference to
> the channel context cannot acquire a new session backed by a destroyed
> device.
> 
> Since fastrpc_cb_driver is no longer needed as an independent platform
> driver, remove it along with its match table and remove callback. Use
> module_rpmsg_driver() now that only a single driver registration remains.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 104 ++++++++++++++++++++++++-------------------------
>  1 file changed, 52 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index af18ff1992ee..f20d3e5ecc81 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2333,7 +2333,7 @@ static const struct file_operations fastrpc_fops = {
>  	.compat_ioctl = fastrpc_device_ioctl,
>  };
>  
> -static int fastrpc_cb_probe(struct platform_device *pdev)
> +static int fastrpc_cb_init(struct platform_device *pdev)
>  {
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
> @@ -2355,7 +2355,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>  		spin_unlock_irqrestore(&cctx->lock, flags);
> -		dev_err(&pdev->dev, "too many sessions\n");
> +		dev_err(dev, "too many sessions\n");
>  		return -ENOSPC;
>  	}
>  	dma_bits = cctx->soc_data->dma_addr_bits_default;
> @@ -2389,37 +2389,63 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static void fastrpc_cb_remove(struct platform_device *pdev)
> +static void fastrpc_cb_devices_destroy(struct rpmsg_device *rpdev)
>  {
> -	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
> -	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
if this dev_get_drvdata() is not used, can you also remove
dev_set_drvdata()?> +	struct fastrpc_channel_ctx *cctx =
dev_get_drvdata(&rpdev->dev);
> +	struct device *rdev = &rpdev->dev;
> +	struct platform_device *pdev;
> +	struct device_node *np;
>  	unsigned long flags;
>  	int i;
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
> -		if (cctx->session[i].sid == sess->sid) {
> -			cctx->session[i].valid = false;
> -			cctx->sesscount--;
> +	for (i = 0; i < cctx->sesscount; i++)
> +		cctx->session[i].valid = false;
> +	spin_unlock_irqrestore(&cctx->lock, flags);
> +
> +	for_each_available_child_of_node(rdev->of_node, np) {
> +		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb")) {
can there be any such case?> +			of_node_put(np);
> +			continue;
>  		}
> +
> +		pdev = of_find_device_by_node(np);
> +		of_node_put(np);
> +		if (pdev)
> +			of_platform_device_destroy(&pdev->dev, NULL);
>  	}
can you check if this works here instead of above blob:
device_for_each_child_reverse(rdev, NULL, of_platform_device_destroy);>
-	spin_unlock_irqrestore(&cctx->lock, flags);
>  }
>  
> -static const struct of_device_id fastrpc_match_table[] = {
> -	{ .compatible = "qcom,fastrpc-compute-cb" },
> -	{ }
> -};
> +static int fastrpc_cb_devices_create(struct rpmsg_device *rpdev)
> +{
> +	struct device *rdev = &rpdev->dev;
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	int err;
>  
> -static struct platform_driver fastrpc_cb_driver = {
> -	.probe = fastrpc_cb_probe,
> -	.remove = fastrpc_cb_remove,
> -	.driver = {
> -		.name = "qcom,fastrpc-cb",
> -		.of_match_table = fastrpc_match_table,
> -		.suppress_bind_attrs = true,
> -	},
> -};
> +	for_each_available_child_of_node(rdev->of_node, np) {
> +		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb")) {
> +			of_node_put(np);
> +			continue;
> +		}
> +
> +		pdev = of_platform_device_create(np, NULL, rdev);
> +		if (!pdev) {
> +			of_node_put(np);
> +			fastrpc_cb_devices_destroy(rpdev);
> +			return -EINVAL;
-ENODEV?> +		}
> +
> +		err = fastrpc_cb_init(pdev);
> +		if (err) {
> +			of_node_put(np);
> +			fastrpc_cb_devices_destroy(rpdev);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
>  
>  static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
>  				   bool is_secured, const char *domain)
> @@ -2639,7 +2665,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	data->rpdev = rpdev;
>  	dev_set_drvdata(&rpdev->dev, data);
>  
> -	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> +	err = fastrpc_cb_devices_create(rpdev);
>  	if (err)
>  		goto err_deregister_fdev;
>  
> @@ -2711,7 +2737,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
>  	}
>  
> -	of_platform_depopulate(&rpdev->dev);
> +	fastrpc_cb_devices_destroy(rpdev);
>  
>  	fastrpc_channel_ctx_put(cctx);
>  }
> @@ -2798,33 +2824,7 @@ static struct rpmsg_driver fastrpc_driver = {
>  	},
>  };
>  
> -static int fastrpc_init(void)
> -{
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
> -}
> -module_init(fastrpc_init);
> -
> -static void fastrpc_exit(void)
> -{
> -	platform_driver_unregister(&fastrpc_cb_driver);
> -	unregister_rpmsg_driver(&fastrpc_driver);
> -}
> -module_exit(fastrpc_exit);
> +module_rpmsg_driver(fastrpc_driver);
>  
>  MODULE_DESCRIPTION("Qualcomm FastRPC");
>  MODULE_LICENSE("GPL v2");
> 

