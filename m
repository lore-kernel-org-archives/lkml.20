Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7543C1D5E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696315; cv=none; b=IVksvQUX3sYoVxdxDI2e7C2n97vQ1n+MqOCZQyrwfkd0AyhUjVuOg2p4uxoDEBRJI7NW7AP/Dxx6joKj8gUGHV14Uz4UtiU9imaIeg8e/Jbc9QX33GwaVzHzw1urJavmHXqDKu26KumNfN/6zJ/s/5RrdSBKX8HDDczJUZanTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696315; c=relaxed/simple;
	bh=3c+nv848NmVJd7OUKmVMGg3kEWCy3PSpBAgBNRWZ14Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fohfkJqBY39ujqzdrwBSSzlSfgCdB3yxUlBJKXxZz8CIZkY5RYJLmTAW/UjtjnGlwzH5L07h2b0N/8wmQ1JOvjNrlenLEm0o6fkJa61uDBMJudYRcInjt3R0zDYwAYVMLnpKOLjkFCL5cONbvphgCVYNXIBvx1e7JK1Gvr5Nxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3oZ37LW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0Q41X42; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3oZ37LW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0Q41X42"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLFhHb2137080
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rHvTaHGzNKtmeUXQ4P4l1GCA
	zOO5LpjiZrRVPNQZEoQ=; b=h3oZ37LWsyB/K/wcoHV4OYOSe8pGt2rcKJHTmvro
	GSzmxrqNfkNjWLgnEr1y3/2fHkj8TVs5skSys1Wrzray/NnOjKONUHglnMoaUYfU
	vpMVKbHDKbckWm71wUbfqNB+DvUK7lsxTKzem5eMtOGC80G3j5P7lbMvK8V1z0kL
	P5s1XLaXSzJUyGg+AKe5vcj+AaWFfvoKZ/PJF91UwblF6ps45k9O+Gsip/sSyg4q
	kudcMYbyxynNrsy1uL+DtxF9gMchCP14eeewcG592v5FYixF0qLier/XC9amiY+S
	wDUPJqElHEBYrXHYlb0bXF67BVuNd2PpkrFR7b0cMqoMNA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5hunu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:51:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso268589a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789696305; x=1790301105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHvTaHGzNKtmeUXQ4P4l1GCAzOO5LpjiZrRVPNQZEoQ=;
        b=O0Q41X42jhN/5T41zqBUvRhO1y2Cyp453KAIxAxhb5/4CK7KtPprSyNMC6d3PooK2k
         yceWiyk2DOxF1WupnY7EcFywFXXTPHFUZraLiuu5EXZnr2FniByfVKN06TACT1bIMywN
         so0x3G5ZGlQFUyHorrWYZubyi+g6633wGxifKRIQEDVza73EEBkijIQECb+cw3aJdQRT
         oe1oTppVaLUmgrHyUzBYURD4wyF4c0jLH4w+InLRFsA0TMhAM1TOi0cCri7FXJ6j6VpL
         y9kWrMgTIIP0nHh3Xb8lnShKHU9qzDY3Aj9aNbf6lcsl//QcMNEMVeISe8Xh3ZHYCJDE
         dHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696305; x=1790301105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHvTaHGzNKtmeUXQ4P4l1GCAzOO5LpjiZrRVPNQZEoQ=;
        b=v2SSSxte7U5dGKXudXXa29HtCJFY/aB3eZMxzGAScPAWG7W6AUitdvJymevRm7hbwW
         EBdqMvEaOypwAOgsNIjnUi/jaHSn9UuLPlbU3A/rSj7Y9GYlnYwf2l3IUO+bEqDGmZdw
         VeJtzGVqrXQoUwAFuevIeZSOWqrOHfEca9pQfPMyWPPndpf/4G/xst2AFgd7Gypd2p5a
         lwo75cLKdFAbOMiZHqV6JURRxUZF1JRcv0u5Y0iOmUibY2QOQFkd6Mki1RmTdBtzD4xc
         HKKuQ/Vdxx+4K0LMnesDjEdBiXOHbWeifEQDAircUEqI2IRHABQxgSLH3mVN0joa/bbB
         6Tzw==
X-Forwarded-Encrypted: i=1; AKwUvByFvvdJnCtyYThUMXIVTf0hvHAQKfcXU8D0/rWHGvhH4MXp2eluMP8shCuIzgvf6X37v+BmCk2GHGtfsLs=@vger.kernel.org
X-Gm-Message-State: AFuF++meyuvkEgYLSsVqVf9eouUxi5TF5ODW+xelAOtcKBCGn1vulpzi
	VRwxjYcvLi0r04QKobxHBp5jd+6ek2/SrTnYs17lRwmsNujyd8ddxGSoJDH8ECpfM2XUPgfKKSs
	agZ1Y9TvEgBLKZWoTUIpR1vDCCmCzkkuvs3iXCwJwSLA/27Y8RpU4qDg3bTofsqkZftw=
X-Gm-Gg: AYBFou3kvmatoP/cRCHKMZ6MXEdKNZh3nRkWS5BLmenFo9ihBVdkEow+ww/ujmKNoI0
	hcnGwb11M8rSNfPRiBts6vkpkQ4dSi480EJf0x6lBeYdQwce77iUNod+nt17ljSqFUjbH2hSmfC
	L2Hf7KMzf56sNwpcCLzSOFRWPgqP7Jkt4UpkX2QwyZm03uwo3aWOhjUN9IvMVWfOYEwItK//Hdp
	Eu1lf2V82VBvp/A8mNQ/WRnKxyXYTrmu0JnHag+IGrPXDs3gJ9TTQ2Yg+4QGm0gYssZRAysqi63
	SANXZzaSdXD+hD54b+Hbmxsd6bVJ2hEaxf5J8AiRXL6KiT4001yJWOREi0WJQaePAn+jyRdJvYx
	xy6bl3mVQU/SA925XCfOygQvAtb53LAw6/ypnx1sFUBA=
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr2019486a91.23.1789696305135;
        Thu, 17 Sep 2026 18:51:45 -0700 (PDT)
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr2019448a91.23.1789696304701;
        Thu, 17 Sep 2026 18:51:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfc3df2sm1145837c88.5.2026.09.17.18.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:51:44 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:51:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ufs: host: qcom: Enable MCQ support for sa8255p
Message-ID: <aqyZKy1gMnHud4Vy@QCOM-aGQu4IUr3Y>
References: <20260728051104.675088-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728051104.675088-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAyMSBTYWx0ZWRfX4XaVGPny6Mzi
 8TrTX7fdkq44zC9lEmAVu7u74P0cTU1n1oP9EubseQ0XLa41SY3yYADN08+r4MlMrOd/og8xMZ1
 wur9XpWxwH0hcF66hGRLaAYrDBSx8Vka9UWgYEOyGkKGNWGzF5nqllrBKAq8WZhID4KeX4Vhg0S
 0tYvmMGc0Z6YoEAFfj/RIoZ/XnJvAM74c7y+kcNXxGfS/hwSIEAITSjAVXPCI8LTZbf7fuukXif
 EZHldJXZbL8Oyn+b0BqwoXx4PCVoknp5a3BGejoX38ybrqXTCNaZORXk7vn12Q9a9s0LAQyf4EY
 lzTKvVV+B3Y0OGKmYjo/N0i6u9zOxoP3bPJfSlWrGzyef2Qi9w5FFYAUFa6CBxuaz4K9oR8rwre
 wHnZm1PQYptJFHuhvaHT3nIvdzuU4FbTxmXlezMKKivQomD06mRqcdbYn2foqiT0i/dkTonj+pb
 GfWGe+R6ECPokNT5STA==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aac9931 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3YqMR8Xo1YLpbCGl9ZwA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jTRWKJD32EVVCv22yzV3XMgWTX0Buc1r
X-Proofpoint-GUID: jTRWKJD32EVVCv22yzV3XMgWTX0Buc1r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAyMSBTYWx0ZWRfX6bdG96r5cTaK
 4B1hnvvjTIfRlh018NeySUn5kSLCTmHG8heGeZ826T+7fkBCbRLMjYUUIYVSlISNOJ0cxeZmn8F
 MhtNN1qm/jB0hW81Pz6Xf6AZ72b6604=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180021

On Tue, Jul 28, 2026 at 01:11:04PM +0800, Shawn Guo wrote:
> The sa8255p vops (fw-managed variant) was missing the MCQ hooks, causing
> the driver to silently fall back to SDB mode even when MCQ resource is
> available. Wire up the same MCQ ops used by the standard qcom vops,
> so that MCQ mode works on sa8255p.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Hi Martin,

Did you get a chance to look at this change? It still applies to both
mainline and linux-next.

Shawn

> ---
>  drivers/ufs/host/ufs-qcom.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 0500320545c4..d2acbbe647cb 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2950,6 +2950,11 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
>  	.resume                 = ufs_qcom_fw_managed_resume,
>  	.dbg_register_dump      = ufs_qcom_dump_dbg_regs,
>  	.device_reset           = ufs_qcom_fw_managed_device_reset,
> +	.mcq_config_resource	= ufs_qcom_mcq_config_resource,
> +	.get_hba_mac		= ufs_qcom_get_hba_mac,
> +	.op_runtime_config	= ufs_qcom_op_runtime_config,
> +	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
> +	.config_esi		= ufs_qcom_config_esi,
>  };
>  
>  /**
> -- 
> 2.43.0
> 
> 
