Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208662;
	b=Z57jtp3z1tlrsDOrZ2igu6Q331nLrKyTiegQWfMh1LngttIVA75FrDfKSddwba2dQhGa
	 SolcVTasaXTG8+Rao/9xG04j7BAMHBK7+KwucOfNC5cnJC/59GXu6JtFCuWEMGeYm/p1p
	 PG+6sBVN80ducRRt+jvxq8e9iHnhSsQdSCOw1H3hFLF5gebh0XgetguSTe9LUBqv+ps/w
	 +QV90yHFi42KPXUadnrlZaG92ooDYXpiiP9siAlPTLgaWhDn6nkEHthsjY5lo/MNvY25i
	 rkJlhEJsS5FZfbX2HLpFJ8KBl8Xjak7iXZ+dkhPHVktwNBzXwHvtCHjrS4Zpou7V7YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gkyD08qufefw7fu3/LZdMf+j5IM9zRBtd6mHq2oqAaA=;
	b=Nj6Qsk60mFlziSNgL6zdvZiGn6eAGlkEzcDQGmuPkQu08fSb7h8HJgkzJoBUGl6ENTsb
	 vkzbuxneHmCuQxnVISSxdU3L9xMjsRTZSs+Y92bxJYzRChRMZWgzvBHy1kZel5tozQB9l
	 5qK+BITAE9raNcOR2YCXX13mAiQZ9Ldr3Ci6yBOHHVQItfIkD/UpPimV1TyKzpv9lUt8F
	 zWFJQ08s3G6isltn32YE2FdzlD1QKeVWxz/kOkwc2CGWqqTAgCmXXla6LnXkjsdOseFPi
	 QpPb6eUfrzsSfLx0QIS2zVFJo9LM4JEz2z/8pB17I2ZIx/mDbjdsY/Esz7BvdSlgnGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n2nx95Av;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQZ9L6j3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DBC606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48DBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n2nx95Av;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQZ9L6j3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AFZ0401862
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 07:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkyD08qufefw7fu3/LZdMf+j5IM9zRBtd6mHq2oqAaA=; b=n2nx95AvPetNgfNw
	c+IyVlt9gf5zkuhg7zIBnTzizhUL80xHm6XsewdRkstQBUxLFnbGzn6OA4sVKkNv
	53Bxevvgu3HKdU+uMd0E9/6uRf/4ipxiAo3sPQj/bY9HBYaq87dR05svJMZcKp67
	6gN9LBQ719QuRY3Qf6CJTkHcVHWJwJAXRWrZ5P7rL8/29yly+8hUDWI6AZzFW5Ta
	1zG04Ubu5TPAzMg0GMw4RKmokQ9FYQvs4ByBAZmBIIdxpm6spfHwcFR1d1ELPk0f
	45vQ+XhsmMzdOU7wBmcsfCVHKUuYg9VOm5f9okhIlb2iadaqdUw7z3AkVkwS9ZoD
	ZHBRLg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5gy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:17:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fe0b57d91so704082eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794208661; x=1794813461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkyD08qufefw7fu3/LZdMf+j5IM9zRBtd6mHq2oqAaA=;
        b=aQZ9L6j3wCyxzDVZ7fZl9fPhsD+9bqztZ6ClltLlxIkPDU56nL7/dTThQtVLOPork0
         yIuXL5HCg0UmZVSj2ERWufEyyXSDCVKEj4AC66uqN7DsBOJOFfcePLfsCPQgfcBD+23V
         rIZ+cR9ceJJRA+IOzEbcL4bxBE7g+atv6DYL63YGFYVzHknHrtoyBU5dFAdE9hVRHlnR
         0fU+Mm6Al2IGBLT8BfR+NEkeF4/WigkHVBARGKJ6xz+wYzfz4CQLYNljU2/bytw9J0WF
         1vG+Po5n6pdWz/i3G2N6afnYpw8qQr/HsijzM9IyoIcpr4I/9rJqzodRZdoUJKuezOAY
         QnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208661; x=1794813461;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkyD08qufefw7fu3/LZdMf+j5IM9zRBtd6mHq2oqAaA=;
        b=HT/APUpHSX6aA7IGA1C2tRWRfr76q8woIjXlxH+gHtThFAeWFyP9yLK/gJ2lUhSgEa
         FvEDmh4jCDgTSVYQhJAe0QNlm8RMsw4eKk06qq3XG4ntPCEk2Szv5MBAmSOWIAfClQMH
         Gjx4gKY9SmbJSFhgTQhoWIQtltciGA9JF0xGYVzAYc12HoI5DIdHCQHRO0YwDPgclvxb
         qsp+SmrbRcjAZVD+0zwii0LSUrs5MW25YWhlFzRg4PtNcXNFJkIn0cZAlExwRUV1op+b
         LO/e5zLiVtyNeOnYt9ZEQXi9C2LIgLnl1MpklxqMoo7yc1jK1GbbzHDVUzo53LJrbOEm
         GXFg==
X-Forwarded-Encrypted: i=1; AL+hErEjGuAaNCym8kMICmgN3QQJe5w6jUkk1sY/XHYWeWnTixgJyonhe09SCdZY1HYYmZeKz3qzj/4w4vnB8Vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sR5yMZloX5R7s2KDTCSqr4AHHMynG+tVWKoexdSK0EMsJe6GS
	Q/94zL0DLW7/ntPJf2Wz7KPCuavLgiI6V6dOQc0uZpW51XGegCq5yziBJm0NQI2fb64sS1nI/WM
	RASI4OE8enPq7RijAWNRKTiwPTjndMAOpGPMsLh8WaD+3Z80ySmo0x+zKzAM2CQBItQE=
X-Gm-Gg: AYBFou03hD3Xoim+E59Pd6wmcmv6XyJKPoeagZD4rAHaDfvYZ1gj4pWF6FB5DxNOthZ
	nIRO9LSr+6nJXVDdox7xDb3Y/97vSR/B5Mrap3E7QnEx+ANOG/Kc18SNvxplFvM3/xANLj8Of8R
	cWzaVyc+gDlCZDPXf7wh/BvLjXI/il06l1C29l4gqeViQ0h4dKHxr8cvsUSEsLKy/XvY3TQOCpL
	5bf69m6gH3cKY0iwWJJ4AUuhc5Ogh5M8Nytoj6B9hRblIl6avisAnzgOrwXbb/RPXdyP10Bqs3V
	PkhVmnpDx13PFYsMpFdzo3UvgvVNUt9vt3+Saq8EGhIrwmx7c5FBtD2xeUe74EJM+Hs27FyTxgY
	mkuHGzVeYaJ3LlW6bNsOOSo+wwb+O84m+L+3tZoXABmKo4jTu68hionXJzkcc/dPzIBCyNuerkh
	s348M=
X-Received: by 2002:a05:7300:2215:b0:36d:48e:82de with SMTP id 5a478bee46e88-37256615312mr9264636eec.12.1794208660541;
        Sun, 08 Nov 2026 23:17:40 -0800 (PST)
X-Received: by 2002:a05:7300:2215:b0:36d:48e:82de with SMTP id 5a478bee46e88-37256615312mr9264578eec.12.1794208659818;
        Sun, 08 Nov 2026 23:17:39 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265d05514sm10504348eec.15.2026.11.08.23.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:17:39 -0800 (PST)
Message-ID: <e23fca3f-1e4b-f130-d034-8a7a02c41616@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:47:33 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] media: qcom: iris: improve probe error reporting
Content-Language: en-US
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-2-dipayaan.roy@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261106153126.120858-2-dipayaan.roy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX6t4EbEst3ujX
 Q4M8ZSzHlA2WlZgQCA9svODvmcx90GBc8YGN7j0uiB4GpisCClA4XUgQ8PEEUYX67+zt0i3gGa3
 jziURzqW23Cd3tQC0wwgag8/nepXECU=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af17395 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NqrKHNM9XWQKvme67EQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: elGO94UmJgHLB5yDlz73R1D_7UZucynC
X-Proofpoint-ORIG-GUID: elGO94UmJgHLB5yDlz73R1D_7UZucynC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX5J6mu2SYViWv
 icjfuW00fZBL9ieSy3oUU2mLf2D+BxS0EMW4ebis3JVg4qhizqxGBonfvwlh5v2sxkvDYAMJ5jn
 RTV13/CWJRO4n467mViBvMV2uDR0JxblPMWM3/wYQHA8aT9C8DKJDCPKudcuq1aEjy90h2P/5xF
 qI+UfrOi3D6oaeHK+ydATw9N/4Rt+3zoReeVD4HtJMhSTJEIMf5tKgY8xOlkXsiHfDCrWrGDdXb
 b2i419c0QJEVNZKVbC8pCjO8nzWAqft1uLwjlQCfx3hgQUmza0xOcOfCbmKEOft9xz6+nsyW6fa
 1SmHV/LpX2cADGlKNjCVKiL1PBZqFjM7PIIqtXcPBjQuxaXMbKBKFbGUhQOCREK4M+qrI9XdThp
 abZGAnmWIJaU8OOHNwFVzeuXrvsWYnlkx8vA95Re7ws7XUVHnVc+znW0PP8H4Bt81oyZ9W4VHJA
 GjpH7HnSzKtaD6d4fVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090028


On 11/6/2026 9:01 PM, Dipayaan Roy wrote:
> The Iris probe path returned errors from resource initialization and
> device registration without identifying the operation that failed. This
> made failures difficult to diagnose, especially when several resources
> were acquired during probe.
>
> Use dev_err_probe() at probe and resource initialization failure paths to
> report useful context while preserving deferred-probe handling. Also
> validate the platform match data before it is dereferenced.
>
> Successful probe behavior and existing cleanup paths remain unchanged.
>
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 98 ++++++++++++++++++++-------
>  1 file changed, 74 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 41dec90f3e2b..dd48fa750013 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -19,6 +19,7 @@
>  static int iris_init_icc(struct iris_core *core)
>  {
>  	const struct icc_info *icc_tbl;
> +	int ret;
>  	u32 i = 0;
>  
>  	icc_tbl = core->iris_platform_data->icc_tbl;
> @@ -36,7 +37,12 @@ static int iris_init_icc(struct iris_core *core)
>  		core->icc_tbl[i].peak_bw = 0;
>  	}
>  
> -	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
> +	ret = devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
> +	if (ret)
> +		return dev_err_probe(core->dev, ret,
> +				     "failed to acquire interconnects\n");
> +
> +	return 0;
>  }
>  
>  static int iris_init_power_domains(struct iris_core *core)
> @@ -62,7 +68,8 @@ static int iris_init_power_domains(struct iris_core *core)
>  
>  	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(core->dev, ret,
> +				     "failed to attach power domains\n");
>  
>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
>  	/* backwards compatibility for incomplete ABI SM8250 */
> @@ -73,13 +80,20 @@ static int iris_init_power_domains(struct iris_core *core)
>  						 &core->opp_pmdomain_tbl);
>  	}
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(core->dev, ret,
> +				     "failed to attach OPP power domains\n");
>  
>  	ret = devm_pm_opp_set_config(core->dev, &iris_opp_clk_data);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(core->dev, ret,
> +				     "failed to configure OPP clocks\n");
>  
> -	return devm_pm_opp_of_add_table(core->dev);
> +	ret = devm_pm_opp_of_add_table(core->dev);
> +	if (ret)
> +		return dev_err_probe(core->dev, ret,
> +				     "failed to add OPP table\n");
> +
> +	return 0;
>  }
>  
>  static int iris_init_clocks(struct iris_core *core)
> @@ -88,7 +102,8 @@ static int iris_init_clocks(struct iris_core *core)
>  
>  	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(core->dev, ret,
> +				     "failed to acquire clocks\n");
>  
>  	core->clk_count = ret;
>  
> @@ -97,8 +112,10 @@ static int iris_init_clocks(struct iris_core *core)
>  
>  static int iris_init_reset_table(struct iris_core *core,
>  				 struct reset_control_bulk_data **resets,
> -				 const char * const *rst_tbl, u32 rst_tbl_size)
> +				 const char * const *rst_tbl, u32 rst_tbl_size,
> +				 const char *name)
>  {
> +	int ret;
>  	u32 i = 0;
>  
>  	*resets = devm_kzalloc(core->dev,
> @@ -110,25 +127,34 @@ static int iris_init_reset_table(struct iris_core *core,
>  	for (i = 0; i < rst_tbl_size; i++)
>  		(*resets)[i].id = rst_tbl[i];
>  
> -	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
> +	ret = devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size,
> +						    *resets);
> +	if (ret)
> +		return dev_err_probe(core->dev, ret,
> +				     "failed to acquire %s resets\n", name);
> +
> +	return 0;
>  }
>  
>  static int iris_init_resets(struct iris_core *core)
>  {
> +	const struct iris_platform_data *data = core->iris_platform_data;
>  	int ret;
>  
>  	ret = iris_init_reset_table(core, &core->resets,
> -				    core->iris_platform_data->clk_rst_tbl,
> -				    core->iris_platform_data->clk_rst_tbl_size);
> +				    data->clk_rst_tbl,
> +				    data->clk_rst_tbl_size,
> +				    "clock");
>  	if (ret)
>  		return ret;
>  
> -	if (!core->iris_platform_data->controller_rst_tbl_size)
> +	if (!data->controller_rst_tbl_size)
>  		return 0;
>  
>  	return iris_init_reset_table(core, &core->controller_resets,
> -				     core->iris_platform_data->controller_rst_tbl,
> -				     core->iris_platform_data->controller_rst_tbl_size);
> +				     data->controller_rst_tbl,
> +				     data->controller_rst_tbl_size,
> +				     "controller");
>  }
>  
>  static int iris_init_resources(struct iris_core *core)
> @@ -195,6 +221,8 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
>  	return 0;
>  
>  err_free_iova:
> +	dev_err(dev, "failed to reserve IOVA range %#lx-%#lx\n",
> +		end - chunk, end - 1);
>  	iris_unreserve_iova_region(dev, state);
>  	dev->bus_dma_limit = dma_limit;
>  
> @@ -204,8 +232,17 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
>  static int iris_register_video_device(struct iris_core *core, enum domain_type type)
>  {
>  	struct video_device *vdev;
> +	const char *name;
>  	int ret;
>  
> +	if (type == DECODER)
> +		name = "decoder";
> +	else if (type == ENCODER)
> +		name = "encoder";
> +	else
> +		return dev_err_probe(core->dev, -EINVAL,
> +				     "invalid video device type %d\n", type);
> +
>  	vdev = video_device_alloc();
>  	if (!vdev)
>  		return -ENOMEM;
> @@ -220,18 +257,18 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
>  		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
>  		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_dec;
>  		core->vdev_dec = vdev;
> -	} else if (type == ENCODER) {
> +	} else {
>  		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
>  		vdev->ioctl_ops = core->iris_v4l2_ioctl_ops_enc;
>  		core->vdev_enc = vdev;
> -	} else {
> -		ret = -EINVAL;
> -		goto err_vdev_release;
>  	}
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(core->dev, ret,
> +			      "failed to register %s video device\n", name);
>  		goto err_vdev_release;
> +	}
>  
>  	video_set_drvdata(vdev, core);
>  
> @@ -306,17 +343,22 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> +	if (!core->iris_platform_data)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "missing platform match data\n");
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> -		return PTR_ERR(core->ubwc_cfg);
> +		return dev_err_probe(dev, PTR_ERR(core->ubwc_cfg),
> +				     "failed to get UBWC configuration\n");
>  
>  	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
>  					iris_hfi_isr_handler,
>  					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
>  					"iris", core);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "failed to request IRQ %d\n",
> +				     core->irq);
>  
>  	iris_init_ops(core);
>  
> @@ -327,11 +369,14 @@ static int iris_probe(struct platform_device *pdev)
>  	ret = iris_reserve_iova_region(dev, &core->iova_state, IRIS_NP_RESERVE_IOVA_START,
>  				       IRIS_NP_RESERVE_IOVA_SIZE);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret,
> +				     "failed to reserve IOVA region\n");
>  
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to register V4L2 device\n");
>  		goto err_unresv_iova_region;
> +	}
>  
>  	ret = iris_register_video_device(core, DECODER);
>  	if (ret)
> @@ -346,8 +391,11 @@ static int iris_probe(struct platform_device *pdev)
>  	dma_mask = core->iris_platform_data->dma_mask;
>  
>  	ret = dma_set_mask_and_coherent(dev, dma_mask);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to set DMA mask %#llx\n",
> +			      (unsigned long long)dma_mask);
>  		goto err_vdev_unreg_enc;
> +	}
>  
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> @@ -355,8 +403,10 @@ static int iris_probe(struct platform_device *pdev)
>  	pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
>  	pm_runtime_use_autosuspend(core->dev);
>  	ret = devm_pm_runtime_enable(core->dev);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to enable runtime PM\n");
>  		goto err_vdev_unreg_enc;
> +	}
>  
>  	return 0;
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

