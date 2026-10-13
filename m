Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F56C3DCD8D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888191; cv=none; b=ciiBzqzmxbdRhj+3ux+Be1XK+KN8Weg307hLlXuyjys/7Pi5VgjDjTdIp5v4rPp60FEbgrUGkZuvvghDYEo7Q36sSWEHenfyvOA+Et95oPXeOoKtWSx4hbbOpqdwOdYlBFFMXKuB03lvi81U+Qdr788BEnsJA9GvdNAMYPcVVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888191; c=relaxed/simple;
	bh=np6bjerOYn1Zyw8+TrjpZHV++1EzsIEKSOeSr92z3XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfIIUSjkoV9Azf5U3W70qOTAKASnxFC47fLI8jme2JOdBkUyHlf7eKuHyy/1ZVKFk9cAAaowkJcCxiVBh0khe3fHEvfvKrTGmGqREdDy9ZuBzOL1KbBgyZDOkkqgq5EYEbuVIJu8pQ6sCuF0/8BPduij2//JngYu6EN/REWIUvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7On7kp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3Lgc+CP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7On7kp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3Lgc+CP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D901gw791192
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MXZwRO4BDFJqGb2cbS7wiYcy
	bGxVIUNkZePoqU20lgw=; b=O7On7kp2ZExeU1gfqcV1UOmjCub8po7o0HkFjvcD
	OPA2R1jbOvAdyzk3FbyeY7XGG1Ot8Ra/eKn+cwRwKb+cNd+ScwQhpoUQ/x57gbzP
	M8MVi8NG0Bc7NsEZcXP+VPnsTCbNjFGraKWOy0MsQQJ4Ad3ASPuLmnc/4dRru/eN
	nq1i38D8oNQ1i4l7BtYBbqeIqxv+i/8VeH88Jn/O+Xy0t5NpFIFjT2aioDVfg3Lb
	xqFTBgjuKVhd0JRemyD2MWi+PiD3mgwzw3YGRsPIPvxREw4LO3MT1xE88CATApMk
	mpiMr5lY+THIWYw19GEWosyOTgvsQDR969C8xY9GBMHbqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrera-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:43:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea9ea9d13so471465985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888189; x=1792492989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXZwRO4BDFJqGb2cbS7wiYcybGxVIUNkZePoqU20lgw=;
        b=U3Lgc+CP7SkpyVSseF53WG9DUysngw5p5IKFsYPLT+keQ77N7pQH4yq0MNle/yYpGJ
         o7/BX0Xpu2/m/QFnhiHmpCta7ko3Ze4JS6uoWhJAQzJDDAVDncFe0fNAZw5/w07GZTLZ
         vds3rFDBUemLfN8OeCDgLFefg4fdwp4uG7AC3SpyVvhRszkf1Ui/G25ll33nyd69bRfs
         qrtusuqdru96ovkHx1jmgyjgyEzp6A6aIT0dTJSjWgKzzS3DDcGpmr7epzpCZmGyh50i
         rWehlxXkEQVyIUv3EHDY9LM+Y/FvwqNrShV7mlUh4sY/Vf8Pr8bJlaq8BkwU+eDAc/6o
         bnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888189; x=1792492989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXZwRO4BDFJqGb2cbS7wiYcybGxVIUNkZePoqU20lgw=;
        b=SskIMS8ODyipvRKecnYIlNkaHI7L5KPi2DnjZ2mzb+4sfzXYSnL96TAm9DeBeZF/NN
         hwvCoaz9kNqnrgvbKJKdSrKJDDd6oYeU4se90UX7Vw63tlTlrGC6RCAlqGfg/PRgk7pd
         xKPXx+lEFAiU2sXzWGyCYl35MA1Nr5PQ/FocKJqPwuYa8MJZOog23nHNo0UeY6ixC9Bi
         b4gVio6LXdtVd9rAbTKuJLAguD0RwKN3OlQtrnFUFPFURpaUVl+jecppmvyYlAxCzuY3
         W/uGvA0gVAOrjxJ1KtHkdFzHcjVkRcw0ev3H/PLgLmlxre+lHBXo4Z09qPOzDzJ7ezW4
         vwjA==
X-Forwarded-Encrypted: i=1; AKwUvBy/zTtxIgbYQdEiCU4N5A+KrfkzrCko9dXCVqsfQmm7FsyksC8OD35ywSfRPuv3bkesTamb+kL+/lJ/PT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5DzKrFHdt1BtbaymcNfta5eW2kkh/AqDEwwdHzolDPpvKf0ic
	0jV22wpwfpHB1ebX7Oi/0vPmvtdQ6djngyxFum2Fy5pfBVehQbNq0y7QiuTRn1/Q9sP6IHtS4OJ
	BWD4tzeABMzxfmfDxVv2Cir1TdBbER2F/lbmDHoPwo1oNhQe86Jy9UR/5WN8nSSkCdYE=
X-Gm-Gg: AYBFou0E/4hd3sU4ojDKZ8CyWzHD02NFfhVyhZVYqoUCyP0KjDkoHgWh0hUm3UcNJUR
	Ps30LCCZ1nlZP/XSYyoML9kPevshhZhH1K0Y5OX5WsMMlLJDWLsptLOX7JIikIXVaBbscJvj6WD
	/ksanHU2LGxrFiHsT3h6HJJxaAtTulasPVI/gGg34JfnFMTh7c768EED2O9p8dfmB3M+ZKQG4Co
	Woy+fYsEJEYPG27S47iQgYH8GsRyTXma8H/ILTz0KAks+7NQdMjTfsIVrLnnNHADwtUJgLM9Uom
	JzuWHoO9s3e6UmAF8/x2HkHw4zcrujVVZl09OUPtTM9S5YWCc7uuWLL5olfE6XBf0nRhlcDjJJj
	ok1mW5ZRgQB6A9nzOJyr/0F6qNWcrgfYfJktNs5eybs+Hl6IkjvkuIeHEIsX1pvT92ZqAcsAI2r
	kltJxNNmHy/6gU
X-Received: by 2002:a05:620a:1b9a:b0:93c:7582:14e4 with SMTP id af79cd13be357-93ebd2085ccmr1853093185a.40.1791888188709;
        Tue, 13 Oct 2026 03:43:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:93c:7582:14e4 with SMTP id af79cd13be357-93ebd2085ccmr1853085785a.40.1791888187320;
        Tue, 13 Oct 2026 03:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befebcsm37453901fa.1.2026.10.13.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:43:06 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:43:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] clk: qcom: Add Nord display clock controller
 support
Message-ID: <ijqjle2jpl7ycdecndlx7qlj4qfm3s5zuxbsecnmhz5cnuomis@nnnxqbubt45z>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXwSiZS+yfx9AE
 Sq9Nj+YWFwHGC8xd8oP0xiwihmBF0xUy6nZgUFJA4SI//YHMf+/EGe/E+wFdiwv0OAL9z+Azber
 YSL/kI0YqJ6unYck6+zv/4DmhCCM0Hc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX0rjMDKRAfbPA
 LQnM1i15JYDbVTfWqZv9OlX0Z8AQBTvDkzCtznsawzJ2RBVVBJjR/RZwni2XmzuvWHzsdMODQUo
 a0mJbDKWFkLwE6YEOGPi6nL+Yt66bRx1UEfY/jZg1XOTg17X3NlGo+moSKllvyTVBWG6vYUjhg2
 JPAyiMZXNyliL+n+s0yC4U+sCoIeuqgomg97jSy574wVpMXXPS4DVEErqRh4wFUZ46u1rzCoHY+
 hpo9xT8Mpgztp/AgNX237kfKqmdZnG8HJPW+9ETBWKJFhYBz6vsvaL/H+FBHu+JdLIE6U8qrnf5
 M4BNePBejpLoAzSPAbaAhmuoDsVPoRVcudWW5ieuDMVv7QmGgBcy7Dv77zpbckeCrIMTcyx5jhr
 FpFNk+u/oynLtkSSU9IOD5IZ6PSyW4JnrQcmffy7s3XkCRNZ+vLFUFQdFiKJ2INgaWuuiYF7AgA
 /0642BY2Eia3ZSBaNMw==
X-Proofpoint-ORIG-GUID: B0jyLViPQtCZCi1KjbBHhXsQVNesVnSc
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace0b3d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mHeL4lCu1BsMOEic-KwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: B0jyLViPQtCZCi1KjbBHhXsQVNesVnSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On Fri, Jul 24, 2026 at 04:25:08PM +0530, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   11 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/dispcc0-nord.c | 2004 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/dispcc1-nord.c | 2004 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 4020 insertions(+)
> 
> +
> +static struct clk_rcg2 mdss_0_disp_cc_mdss_mdp_clk_src = {
> +	.cmd_rcgr = 0x810c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = disp_cc_0_parent_map_8,
> +	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_mdp_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "mdss_0_disp_cc_mdss_mdp_clk_src",
> +		.parent_data = disp_cc_0_parent_data_8,
> +		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_8),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,

clk_rcg2_shared_no_init_park_ops

> +	},
> +};
> +
> +static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk0_clk_src = {
> +	.cmd_rcgr = 0x80c4,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = disp_cc_0_parent_map_2,
> +	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "mdss_0_disp_cc_mdss_pclk0_clk_src",
> +		.parent_data = disp_cc_0_parent_data_2,
> +		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,

Here and in several similar places: No CLK_OPS_PARENT_ENABLE?

> +		.ops = &clk_pixel_ops,
> +	},
> +};
> +

-- 
With best wishes
Dmitry
