Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D029E3BED35
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100741; cv=none; b=X9TOt+zc5mMrJzEJF68iYzwSJdNDoexeWV21FpgOxuxSanb8n0MchX/ebhP7oMXNOOylAT8TMYQ8hb0lkJlcOaUnPOZdh/xFWyl58X/Bh+ggypiEe62rbq+n0bju5/V28kCPyel2qdxNsV/RA9RPlDxLeKTPldYqgpYTMXtkP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100741; c=relaxed/simple;
	bh=Tt+268agdLGbBViTz+33MlSnJstp1KhOV18oFoixlbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm+UzGBACSx3POyVHM+1PBNjeaEPoTs7Kjb5NT5vQt+gVDERjWc/Ru8JbvjYcOsd6u7+9CWFPyfg7Xw2w24Vo123WmKfZA2c/UxD4comKKdMalHCUr6Na5Sxqb5EosszD5s+RaqS8HrwH9ekAoRft+Cy9ITtvb4yjO5DlhDq5hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMzBswL4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEYb3jNb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMzBswL4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEYb3jNb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4MgXU3011100
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=; b=EMzBswL4pT0gHZ3G
	yLsKCVrdyS5CuEACiZbnBgeqlpUWbYbL5Pq6UsWlpzYGF1yQRyeHwJ4n7Ts2+KUX
	H13ngIXcHJZ5ZahcNXKg/U5tbnkdtwZNb5u7Ve0+vd0zDpkSCsDzaECX81OWs0D9
	ILtUmUcNPtnMvXPmo1VGWEQMJ6lb3KlBw0/eyKBv5SvouOhpc+UqWMcMUuIu4wYB
	ERkMyTPDxxF+U/K/S3rSuE61NybMSDP8Nag9JjgsYj3dxjJL+myTeSUpp73Em52I
	DQkJD9Aye9YE2KkBvwUuRQaaDXwpSMSizc200V0xcZUmgwCBNhJEYlTeqVirjZOS
	Glnvrg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkwbdqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:25:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86bb318386dso57416b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789100738; x=1789705538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=;
        b=iEYb3jNbg3sYl/p6n8thpMMviX5qeNa5FpNfal0d29c1qs265CMEghz2Rk0e4Rqs/D
         PX8wQELEIFy3e768DD4UgpliupuFFN2AjuMXMUEsvLjJSrRiVJPcznEynt11IHj/wcgO
         WoU0GS5pGGuNSSARsMgWOGQnuA6N8Lu2vf2fXZBn6IALcYyPGzMfaN8pi4J1NIJ/WvHe
         J1A/rPlFvJjJEkr5NxbWDAX6/8Ef3XzRJ8NeRv/MrIKLLNoCR/1jthgiBkqTEEQVBs9o
         c/ieOc2eyQyCDoRA/wUohD59VnoYueswnio3vORJYVfdT2DHkwyAEiso6AneNAAnSymR
         4lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100738; x=1789705538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=;
        b=olK4B8RxP1W0qg1qqWo2AYFMuU9X6iVNbPP4V0u16Y8VIp0+LdyZj4WfiDUAzYCGar
         +JotntTDkS5t7lIr3oF23o0ir3TBbyRq9Nx+MiI1i+UhNHPicn0Gy3B4bjzDWLbcN/Mt
         4X2klGi6XWGUO310Eg9NeLAkL2yeSEIJqtX7CYsljDLMc0/SgG4+ZI2gGaPV3TS4v5D/
         mHaNT2jg6RMACrmPsf8+dWb16K4BcoMDYIRDVm3BoIa/zL33SG9ht2uD0En2G6YSVOfQ
         7A8G348WQ01wT59qMFP7HSWnYMsMN8sFRzQCsLGLKSysb+uIDH79SKCmEX4Rqe4aKvuv
         qPlw==
X-Forwarded-Encrypted: i=1; AKwUvBwrfwCNKM9wdmXkHL6JCBAVgCcMbacPUyRO/XttAjd2LWzVnwrNU/N5bv7yzTtl56d7mylXaDGJHwdn8es=@vger.kernel.org
X-Gm-Message-State: AFuF++lLdH83d6FFqIsr0q/bF0UECJ2IBum5QgydwMGYwDbxcOrBFOia
	LS3QlN78jT44UqY0siyl0Jn1j1EDsIcjVNucV6BQVjUIuCbVkqVdNquxJAYXI7OJ/UQb1i+P56D
	Bo5jiZ8osCPHrpz6ara+42avPHfRsjh31ZI7WnHrQMjBwYvcwsutlMfwGSVywCR42jPc=
X-Gm-Gg: AYBFou3OuJIaI8vMU7vtZuUiu/SLSa/UR1IVra6yWeFA3bLDPKO5dxv8MNRPXj9l+3b
	lP3c2WDS9H6ck85pttqGHAW6WLCagsrPfmeQxNc+0PZ/gT/ricJJTVlSstEnrjqkXdVac6EpiLS
	NolNAW7Jfgl6sB2pqhincs4UmgM3+OsQrnUhiAs3HCrtfb3EhQCTuKfZdUlnLo9yslmoPDRcm6v
	LwpVKazDaNDpGIRuouBpNocKi65dRGF1Kt0Oefs+qPnMnShi5u8p6X+B0UIhAiXE32lx+CCjMfX
	OewpbjIXg5KUFo5nS8FsyF2+ED5M3EoTU/XaAgPb3IyyBbOYX9xxlOYhUSoaSCweat+17tpkpKH
	Q0Qnzs5yodTrxwwIlgzsTp3adsEg=
X-Received: by 2002:a05:6a21:684:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3daed28db48mr4941935637.7.1789100737680;
        Thu, 10 Sep 2026 21:25:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:684:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3daed28db48mr4941858637.7.1789100737020;
        Thu, 10 Sep 2026 21:25:37 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm2689172eec.1.2026.09.10.21.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:25:36 -0700 (PDT)
Message-ID: <3d8a5b6a-7393-4d9c-bff3-559e5c870011@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:55:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa382c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=B4ecjq2AI764zdm5JScA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX90ow8AKdOkPM
 wuEVY9Il5pQHzJjYhn0i25u0kO9mexIS7Cdrc+V9yxyeYEfVA9OfOGu+LY/L7IA1C7PV7QRSxXj
 H11UpFWTCNzlbNCWPp7nzSdiclK+taE=
X-Proofpoint-ORIG-GUID: WNHoCEHjIWix4zBU_22dTTJrigHYVPEc
X-Proofpoint-GUID: WNHoCEHjIWix4zBU_22dTTJrigHYVPEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX92izZFYi2Wsu
 1evAQkxn5IQ8XALW6jrE1Lhol/wzDq2safVy0RtMXbwhms7VuR8XNcgu0UA6gUJlVVs/NUxdvb7
 QDSVyhzvaUEWiskANR7A8LLfrlFjPJ6yeGLwqu0JK0+9LL3O38WkDsosyY+thFybblzjSFqKej8
 BDrxozblkMzQHMQ7rmpxMc9UGYR4lvxqsuQmKRPHE3ElP4yn5Cfxo78wJ7huvnA2e3pyD7ZK8/G
 JPXZiJ3ygkHcINY2oyTXdLCt7UHCWyoFuX7tUcdfgmlP6nsjW0I4R9+FzSjWCuny6dQkHS2MY3z
 HH/aWBM98S7GOwmrDnDHLr0EMGcY+DecEPBA5OI5oEyAnb7SRGbk99S0gL9f0E6VJrDHo+ezhNZ
 kA8nUgLyWuCACOtXWR4oFAX53XHPA7baDH9oTYEppErO2TSLnIXWw5dwwQQl03l8UWV1kMSIISI
 yqY5bMBK7XaVUCdouxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110057



On 9/9/2026 11:31 AM, Vivek Aknurwar wrote:
> +static struct gdsc cam_cc_titan_top_cx_gdsc = {
> +	.gdscr = 0x21388,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_cx_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +

I think we need to add, similar to downstream requirements.
Please check 'drivers/clk/qcom/camcc-milos.c' for example.

        .needs_icc = true,
        .icc_path_index = DT_ICC_TOP_GDSC,

> +static struct gdsc cam_cc_titan_top_gdsc = {
> +	.gdscr = 0x21330,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.parent = &cam_cc_titan_top_cx_gdsc.pd,
> +};

Here too.

-- 
Thanks,
Taniya Das

