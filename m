Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB593314D06
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558618; cv=none; b=TNVCg0P4FqFBysBTNJmkyb+nMX3vPPYC4AbxlBJrKbPr20Gz/m01wjLyLYpGm3z2j6XSfkvZt3OCEit9dFH6SBvP4iIo3RJ4tl1JDFEETmFM8cYfrj3jmgoCIIwom3wfC9Y00Vb6d8o7tO/HCsSC7TMd0S5KM9j7pFms2CoUEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558618; c=relaxed/simple;
	bh=rlU8MJoKFwEj7TyI1+k4wCrAAdEifzHXOnp3hjdwys8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRESEdWS4VMqqFJW3BRo5N5NHoSEAzv9on1uRWqyxqpBCLuz5txhioXUdb5JLtD2OgQ68xtokxZPJJvlLZ3Ro9ij4xeRCQeZ47gktjl0HAZSdkCeUQi7Sk4RBvgW39k6zrC6WwxYGgaVFj5QCeiBW6flsqH6aGlJ1JK3RIvFAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/xqR/rS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToOie8jk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/xqR/rS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToOie8jk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RNl1Yr2654121
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f9YQvTKqFZSuamKQeg6Fv5je
	yjb7KS6ZvU+IaaOa62U=; b=g/xqR/rSZxs/Xgx+quFtEB1CyhYChdAmycoz3OvL
	da6JauSe73ThYbM6ML9jyGbHN9tBv0lbrHH0DQyH+TSmk3ji/MF8qb2A1l8Vhk2j
	6DQeLfAh7MV9xZh7w7X0UCvltI6EV93dk+p3zkSxe8KWXIdFD5iYA2A9LPCF3F4t
	lV6ydV2vgnzTr5wLmjCNY86wAIjTuI4cOT0B0BCh4x9uRLTI63TTOIv3mcF1yAAA
	oOPDk0PytByMCzQj5UT4qbjjsjMWr32/2Y/0FbSBENdcEDbEUjZT0hguwfq5y9Jm
	S0Up0wU82Vk4UFmQINihpGtlqCUtkGrxDf+b8k+WQwX9qw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77juwmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:23:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so3769757eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790558616; x=1791163416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9YQvTKqFZSuamKQeg6Fv5jeyjb7KS6ZvU+IaaOa62U=;
        b=ToOie8jkgV8tbb9iAspAGa0Szcl5XizW5C3xNg5gHesqe2NAJJKwIMe6Qolq93kfgk
         t6mN49xo44OLAbpXWK5lnjA1LewPc2qY3c69OU3Jc6V3g7hsne3th9smXaFdNeRM11dV
         xBlhKhWFlU8gaFjfql8AXliDaoNp6WHP8YyKDhAMozuGGguFGPKtJfAw/bieUbs9G0Iz
         iieiznhplk+2IjoQHQk2FU/REi17c5zJsqLiWimfTSMQD700qjtVElgKXABqKuryHtYQ
         GZYJ8ywcpbp0fgiRRJlj8otvtRAnLNdXaskQEYzGqbLbadYE6m7+sWkjalCtpjfeM8g9
         02AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558616; x=1791163416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9YQvTKqFZSuamKQeg6Fv5jeyjb7KS6ZvU+IaaOa62U=;
        b=vwMZ1cO8zPN8vIIjI5WlV2TcHrsnkOqobgTqOD3SWMefSRifvR9JnbZsePIAEzm1AI
         qarIOyAqJceNKwR46dUPQU4Xup5YZJDo2MOMyN3iHL3xS6HfTxNr87QHmoX8II/tXjdh
         TLXvUkGF8MBQwJDpWjx6Hln1J/6YEIoLl0D4ONEOHNGxd2tTwbyNTSUijaCsvXfjg+DB
         yxk73M6Pl6lj1fycSUZkqCXPJ8OdGA8oRTrmARb8NdZfOhW5eGdkwTtp7WtYwzmSaZn2
         jE2ZNWT+jVNay9Zt295XWPatTA0wSBCllov324hp5awNxU6VPK4gXmQULUtInx+YUsa7
         AkOg==
X-Forwarded-Encrypted: i=1; AKwUvBzL0sHheA1bbrYJrOZsF9gARWFBmzG8EUJaxzpd3bYP7Cnmqi6+AkeY3y2xyONv0JAEOqAvDn/GxFA68Pk=@vger.kernel.org
X-Gm-Message-State: AFuF++n9uqzHa7enptx3UJzRi/yAC3LniwoKqzD+VKVkQc48ULAZ1ngD
	WRGDvBT5M7wWh2I2/pN6rWJ8c15j1zEwXfKx+Xdq0oJ9Xv3HD+8xHOFVpWsylzjFlLwH/AKw0Gf
	IZ9f09IPeS/ofuDTnLBh3o7UZKcZelbVgQtzbQFOJgg83D9DcddRncqaj1QFx+V8gduJSO0k3uO
	CK1Q==
X-Gm-Gg: AYBFou0qfK//hX7zlkP3K5XSPj447Uyvrk68zrZxMyQgSiIfEu1Ic1ILCpK7+dHxn0r
	kJF4Ab6IFy6zWJ3+Iv3vy4UhEa7olIYHtZ0SdR+wgG9xODAojXIEUFTz84Jqvc/ZtqZBdT9+WLk
	WUIQwNZC8Blw4ljFbK4leZp0q8doPbqmJ2TLBu84xrt6SDlC69PcMEY2RhJBx50MB3Y4jPta5C4
	RPFMNc6d8fBEvljP/kUC04hBnSkaojtVkH2UxZSfD8kf/OxskHq9QPlQieVTUBcIk38IoPieRJf
	Rxtv8IvII9WlGfBPSleKL82mxt/SZNVwQu/UZ3cFVexMPOiasyyCwwDFW3/LmO6WJTXQWH3ld0O
	K3sLS18o9gl+XH1IUCgriybOe6r2QLXU6bWfb9PiL7g==
X-Received: by 2002:a05:7301:52c1:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34271a8da39mr7821608eec.20.1790558615526;
        Sun, 27 Sep 2026 18:23:35 -0700 (PDT)
X-Received: by 2002:a05:7301:52c1:b0:314:267f:46e2 with SMTP id 5a478bee46e88-34271a8da39mr7821550eec.20.1790558613844;
        Sun, 27 Sep 2026 18:23:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm25487284eec.1.2026.09.27.18.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:23:33 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:23:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Message-ID: <arnBj2WlZrg25LeT@QCOM-aGQu4IUr3Y>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAwNSBTYWx0ZWRfX2aB/sXP/QWNC
 LzO1LvwTaTDYZ/vvnFam7nmll0IPB/FKP/qIdzu+9b0LRBWsEJiDE+EBEeTPWFmtuHeFFR21jh1
 wgoId/VtUYmy6WVeHV02A17TRDXuaYc=
X-Proofpoint-GUID: rpOVC0EsaG0CLSj7updl08bv9S5r26xm
X-Proofpoint-ORIG-GUID: rpOVC0EsaG0CLSj7updl08bv9S5r26xm
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab9c199 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MvHJX41Kz9pwvTpm7VEA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAwNSBTYWx0ZWRfXyre92cVmacsY
 /8mZDH3xwBPwvt7hOgWuemLcKT3ejwcZaIhV94pUdC1F8BcvmUPHsUsMj82tOtBZtwXd7MaZ50W
 D64DJYsnp96VMmy7Jg4u1MPgtJ/5N5vb/+iFL/NIgNnCIkLTu0/+7WrE4r50nWEvrFmyb3QNV/z
 +A8rpXtiegOfezxAGmLcEXZDcKxXIWs5wC1bFHcIFeYO2neWtxSb6XJXdN/SyZUKEZ7s8WiHykr
 Z86T7FqrauB0hAjsTSLM4GnFAyfOUvGIxxJxelA8kXMvhHf2/N7TkWT5w1TlyLbt2HfGRb25BVm
 JwNZlH9GEkWmTUsUGRKi3raxB2fe0QOb54Y99YUCSzZs2obdYmQBK0OPsnxQgIomDWQyXV/wpnR
 4yy1l9TCLouowjfGatxqh+1OB4BVETxBl+/MRWga86EZoMS3B2v/OC1gvTcvx2evnCYw+P+D0ng
 FU4VNsX5ZY4UrZ5F+IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280005

On Sun, Sep 20, 2026 at 04:49:16PM +0800, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 3673003c8b21..e4c3aee441c2 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -393,6 +393,41 @@ &qupv3_2 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/nord/adsp.mbn",
> +			"qcom/nord/adsp_dtbs.elf";

I will need to update firmware-name to align with what we have in
linux-firmware repository.

Shawn

> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp0 {
> +	firmware-name = "qcom/nord/cdsp.mbn",
> +			"qcom/nord/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp1 {
> +	firmware-name = "qcom/nord/cdsp1.mbn",
> +			"qcom/nord/cdsp1_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp2 {
> +	firmware-name = "qcom/nord/cdsp2.mbn",
> +			"qcom/nord/cdsp2_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp3 {
> +	firmware-name = "qcom/nord/cdsp3.mbn",
> +			"qcom/nord/cdsp3_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
>  &spi16 {
>  	status = "okay";
>  };
> -- 
> 2.43.0
> 
