Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F0B3B776D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838339; cv=none; b=kefDmJvAIxVedWpoYcZj1ZB+9ounINHJe3pmFjm+zrishAEEsEJvj8z0d3WbJvnAEjdKwHCbe4hy8ajdSAvAKEfwRN/cBtdKeCnawByfHldnxCHCkuKfkMHhkPHZy3G5NzmnOG7b2QfHa/d6SdtC+nD3slkY/oWe6C6KyAJ5QMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838339; c=relaxed/simple;
	bh=/U8Jo9HeGvTNPSAsLqBGE0dge7D0zg7JSrefm+4gXVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X45UHTMEJYPZXyR74Z/Ssap5PL2XdWUs3T2xG3OEnduPPtWDNVc2FTwYx5BOawczqCDP5nsKGTbGzuTxhg1U4+XpyWT5XdmAxp3jHhYg7Jcnq137MTxA/+IUuhIwGkvF98LaIahjnJWTGqVDyH/LRZn7bxup0SOIbq6zNsExtZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTQP2Q/m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEAf+NAQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTQP2Q/m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEAf+NAQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPG71932751
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 07:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZwYRIH6p0b04153B6+2OIEbT6hcR8hRVk5T8NyzhD8=; b=nTQP2Q/mrxLN4KnL
	1H5keAxbdf/h/wCD0q29AGBFUNu/YXgT73QhkFlh1Vq3v+5ifOuRz8O/Tm1y0brT
	nK/ZfYCeqNhwgP1qMNAsqTAEdiR7tGzfNy8lIM+L9Zft6m2fMriY//FDuKuH/kfC
	r9Yu2Is1f6IPVWOOpjytWKN6gbr5we409WAm6QZh/j7xSWpEr2fVl4QTB0e+uU+w
	fTpL7G+6UuyP65bFGOQ6nDnDYftKbIcxm0L1Smrp4bl1/ISdfxKFpWDQGhUCppq0
	jx6piNoNeuEboqLzPt7sKIRWDc4xTlF19q0c+My4Qol5f83jWT6VmPR22vXd6/ox
	0pp9og==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh59hcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:05:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-880babf652aso529483b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790838336; x=1791443136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZwYRIH6p0b04153B6+2OIEbT6hcR8hRVk5T8NyzhD8=;
        b=fEAf+NAQQz3hsT2uqoJ90gq3tVKUp1F0g2wqrM1pmIQrE/Tyisnwj4WHE+GfOK3cM1
         WyU6ruHB/mgxwpJXmnxne3Ce62xTfL8QYicg6mSQ7fGhm2FmD0/TVqjX/xzUPQQNH0G2
         dGa1GYZ0mk422Egmpz6mTSwYyStLIyQ4Wo0JIcVRm1Ps6457CBY3XTzl/b4qc6z+dBGs
         i/tmcyOMHh86SZGh7tuV3IDQsRDbLJ9IqQnYWRliISTMRYNcCKvONA+pJpVt8fhVKHXI
         1QZI96Uk3i4gWGjDqzA/U9pb+0fFiNOYVYlctGw1Ng30iASwRYw2nmKT5RcaIxmU9mJB
         Ub3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838336; x=1791443136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZwYRIH6p0b04153B6+2OIEbT6hcR8hRVk5T8NyzhD8=;
        b=rNzEYilSZbiXf0Zn8DA+rvgIxN+/oekiKWf25cVmTJuMdvLAbI6eV8yhabAEx4mLOU
         bhJpYvGR6TJFCgLU6T9nnQsfogyWq47WXtrXzEyuBrcxIAKDs7/dNNsXU9c42ahw9Ai7
         jyIjuqelCQV85yoL+vz7DasrOAmldW8TobdpAwrPxsNg95ydOYWimm+mxWCToJxzQ8ZY
         s0hBSVIkf75J+oW5ZzUTaWbChrTMZ8ttCltFDC0XPH24R71aDZ8rEPgo86Zn+oCRHF1P
         SZjzdshgSwqlOoFv+LlUzRld9cj1upsi4eLsHIb6HgLvSAqwRfkO6EhkjjMv3SXFXsrP
         YwGA==
X-Forwarded-Encrypted: i=1; AKwUvBy9iTOPhS9l5q+TtDrDNfRe9nB4Xid8pabT2b7xtHv5J5SHESWaPtFWyEE9u8alCmi8dVk9eEgM7NatfOE=@vger.kernel.org
X-Gm-Message-State: AFuF++mi2HN6b7XjMCewcYMrwb54ZICQ9xF3n2jbQUDZPTqV58wQK9wG
	7d+KQEm8MESTlFaNfR2FyB9uA6S+nPQZKTvSh/b2sRD/kfbTbrEz6EvwIGlG5e/CT05LpxLy/jj
	uoaPNcs/v3Van8UXp5qXq+KwLOb2HecOiLXZ7yxSHqfRGsjevyBI8G+t77io3peaAnNA=
X-Gm-Gg: AYBFou2Eo0PY5eU3g+1LggM03QRrKzqF96p/X9BbakTgKqU4jKq1vcNRdY546oCDnQB
	F1hKSHprEyQXXPYItW4QZmVajHNCf+/IqmnZV8cr3pufQ/giNGtXDXDrBMEfVQttTbOwyAq+rkc
	4tympdorTX5Yq6sUK+7FX+o2fa+xeiav8r6Y4CYJm8OV45yo9TdE6OHV4BVtuaZV3DwR52clKrm
	1Y4qfelpwl2syeNlpSGzTlq/uCaEhXmxOgx6gkUMA1YT9DVzI0zlpMkdFt2XDnt0GAKJ9FC25ZW
	XCwpUu7BmuoBshERMit+MluA4ENZrvtCQtDiDj0gjE39I9U+DJOMLfF4i1qE0FsjwpAvuPmkJCX
	IZdq+PUGI/9ZvsiwWffQHojuPIg==
X-Received: by 2002:a05:6a00:330c:b0:878:3704:e0ee with SMTP id d2e1a72fcca58-887fdd12e6emr1159899b3a.20.1790838335905;
        Thu, 01 Oct 2026 00:05:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:330c:b0:878:3704:e0ee with SMTP id d2e1a72fcca58-887fdd12e6emr1159876b3a.20.1790838335309;
        Thu, 01 Oct 2026 00:05:35 -0700 (PDT)
Received: from [10.217.217.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819bbc9eesm598366b3a.54.2026.10.01.00.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:05:34 -0700 (PDT)
Message-ID: <23d23191-344f-402d-b23e-f7f4a61f9cee@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 12:35:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KWVHsfsgqNuyb-CpyVxEkBfzRLcfa_ls
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyOCBTYWx0ZWRfX7DmTIEgBQ7TN
 Ww/tuFXkJ+MdJzosr0I+OKvi5eOyOzzSxTPvRwozkSloJygbpNB4RWpoffc/lySLV/HTi/6QOwP
 PRaEq8PU95dTW/fAP9inVnySN/4gCkM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyOCBTYWx0ZWRfX+cnDPLnAmfsC
 C9xoKAaXUKaxTN4HmbxTsOtHl7sGOUrQUG5HohY67GLNMmPHgCIA6XJ/ddY8kQ/Y20OsZ7PUYKP
 U9xKlGg0VKUJsy/hZAcdEbgwkc3jYYIbbbFioQdXjqeZKKY8XDdPuCKOsRmdiZIoHcl3LMbc6tP
 ZTopSLNghoPuRd4Fn85lj5wZly7NXFscFkfAgyYOM5wUuDiaQDrp4YtOJA/e4+dPU6ZG+R6bWyp
 wJPFhx1UiXubl+31WN1DA1qsbES87qNELZA23x43QIA2C3bGG18LfIai7kCaitYHFy1J4ZgnxxM
 61KfTOVq2zI9fDxxYbHzXtdqLU9yTeH5+1rlw86sGgjIByv3RoRpFVyD1u+olUi6agWE59rgynT
 2eDIhdw0MG7Cdd21pH0j5lnXbZMVTava28bRNSv7ni3romCgwNVBR4tGlzqiK6yjHfyxYMbTFDf
 nWsqviiOw/vzi4lj5yQ==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe0640 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=SkmXSRjHfXLCQINAG2AA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: KWVHsfsgqNuyb-CpyVxEkBfzRLcfa_ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010028



On 9/30/2026 7:23 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Associate GPLL10, GPLL11, GPLL8 and GPLL9 with their existing configuration
> data and list them in alpha_plls. The common PLL helper selects the Lucid
> and Zonda configuration routines from their register layouts. This uses
> the common initialization order, configuring the PLLs before enabling
> the always-on branches, instead of the previous CBCR-before-PLL order.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebase on next-20260929.
> - Configure GPLL10, GPLL11, GPLL8 and GPLL9 through alpha_plls.
> - Drop the clk_regs_configure callback.
> - Document the common PLL-before-CBCR initialization order.
> - Link to v1: https://patch.msgid.link/20260926-clk-qcom-gcc-sm6375-rework-always-on-
> clocks-v1-1-28f581ab0289@oss.qualcomm.com
> ---
>  drivers/clk/qcom/gcc-sm6375.c | 50 ++++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
> index 9c2acf8dc4b7..2c7a6a4e2a2d 100644
> --- a/drivers/clk/qcom/gcc-sm6375.c
> +++ b/drivers/clk/qcom/gcc-sm6375.c
> @@ -149,6 +149,7 @@ static const struct alpha_pll_config gpll10_config = {

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

