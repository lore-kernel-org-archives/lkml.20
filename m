Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D3A56261A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093104; cv=none; b=YOg4bNmcOP0qfVF79+t8+dCnIDKcBGrfIcfLgP271LaZCDJ0KOssaJLfG5Z84bSJyJIUqZYkjCMRvfCHdysBWLTBZ/u4AWdkTuiNZ+saAQSjYGGy8+bfTIOrQ0t3SPiYC8CUeCjK24eJgRgJsbkdyv5RFJ+w+WAgVc1g20Cxzsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093104; c=relaxed/simple;
	bh=skb9nM9bihQYVFuXS1j/3C7mu4OdrLVg0b5dMXw5JsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj4SrHH9RMOF+WT0+GFhw3Kag9xBsM6QJNUxJLUydbUq0zZiMyizqGz+Z3RemIt4ASCOEhoN0RCUEfkApcbjS02Qguavu6EOnDcde1yoxBDGjKl+Sh1jkmykRoFzpIca9WCrBgLgodzD5PbXf72xjy20VJRK4PMOoJDHChb8vRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL5OOD5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzqUphZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL5OOD5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzqUphZK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjIb6449489
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W6vBg0blR0+AkISTBRJY4Rut
	F5Ms724ptSlqmC18R00=; b=WL5OOD5GSpcjKicPIVXvJVUyfIocWZqrL6k/m9fY
	x0/Cc75zEUaexkJGIQNsv3OUrcdPNI5xfIknOyi6ONXNA1ZQcAlXKvRwmuG1qtju
	ggs8UoIA+K81ruzs7nGRHF4aPYdTlQYA92k6t15GswBl4n9rsLeCIz9Nah0rwUKE
	MM1w8OxWAgBlapmPcFdpOr3xiPho3iNlqLbCO9fREPaH2FxpgK6q3KWzQuLomAjf
	rTjfEbPuup6qS3xfvv/LWipuiR2uhFG5qH50kgHrXu7/ESUVIjKkZB2cWjSEbASA
	Y+hFhavUTmcOwLfLUpUonD1obqp+irR6KJVxfBT6yepUCA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyt8nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:05:01 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-672c78a6be1so1187862d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093101; x=1790697901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W6vBg0blR0+AkISTBRJY4RutF5Ms724ptSlqmC18R00=;
        b=NzqUphZKvp/fN5L7hNnes7ePf+bbkJNtXKmAygyukW8eSvs41wlzr+8sH4iJ2SFDn6
         fFXwFjQRWXLvoAj5u5A/nef+ikKVjKxmcQSFjagUZYCA4OmHwC8tZ7s6bne6hmLe9Uq7
         bQ4kTyQcNU7w8vaYvdZRnkmiY2ghWKu6Q+Oj/Pd2gjyhGX4bjlUrhRGQKfhxKbNhd7RP
         1sRFOjZFFTnuD48bNfXoR5H7jCxVXLHeziixTS9ZuscQnmD1M1LuMWeW/pb2mr5jdzPW
         v5hKzPCLCE8ZF8htrOaWEQifH8RghcxC45AcBHxpxl2ROiYr6h/A3PoVbKG1PvSbkMNs
         p/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093101; x=1790697901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6vBg0blR0+AkISTBRJY4RutF5Ms724ptSlqmC18R00=;
        b=RjarhqWYp2aZzONRZHRQwFQ/ekpOXPRY68OU+T6ToKs1Foyxp00J++1UPgLKTj4TMI
         p1ne0ojPYZFkCKTBBAHo+H9jJEjsxSGxTtHF2jfcrfPeF50Zm/7K+MZkpujs38t+1hSC
         H9+CA8pSdBDIPcC+buns7PjQbtlyeYQcPvfkaPcIreqhmk11cBeBphQ20W+bTdaP06mA
         SXMYtpU/IkUlpkh6azJWifUiMI11r+GucU0J4C7YM8gl7IzfLQLU48SYFXwO0NYYD6El
         yTdStDE43r1Td05VBelOi4rCVbg4e0ROpEpVvGAOQu9mL4UeF4s5whQ/6eLmazb/AqQM
         w2xw==
X-Forwarded-Encrypted: i=1; AKwUvBxRPexiL34J/gKiJBvadiLLCGD0k4mNHrDsKdCWLnsmtpt/N+ixOz5IRI5LFzplcIT4DpFHjDptPrrPSV0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRWcFTlAw1TmPldwHZAtgCPJo+kTLA6EVlsQ6JVLFiE+AzNX5W
	3ln9n5PFzke05HG76NH2eaSQHoV+gHfB2c3uU+rr4/TpRu9LHdVH72FDRnIBWCph9VxxOFr0XnL
	U34M5ZdB6g3mHPm4KfIDlZFJzDYwbYpxX+CAa/e2sB1fVzdrbOq+QdfCX5uLGt79nJSwnVHwCc4
	s=
X-Gm-Gg: AYBFou0MwNqtb7svqcn+a3q0et/lrPqKkrTck47MAHtzYtIguCpJhVpIoRakEm91fhF
	SAz0YAnyPs/rSXQ0pNdYD0+ubywLFRW1x4S+STu4ZsN6xMrN7SzPpik9Upl7wH3LgeggyzVgXyI
	SqUzMdSVq/zjfO9piExO8aPBkoqSIBXffxAz6fts0L1ZUTF2FnmIbrNCbSzEFq3ykAx6ZLCVSxw
	HKuXYwVUsEV27d8+KA1Itb9v/CR7rM2CXBcPJkVj4WGGWVqETFlIbf9quC6R+rcDkYODkoAYdbx
	e3imF8mI8iZulLUBNXM8UdkRclJQs6R+8c2ara8G11d2TgYZ583HoJdy1Yn0R4zeIHUdEsT0g1h
	J71sjeYKNXQaV8pXmSmOrT1nwERFOVj98aNlyAshFqW/VkFFQ3QpPCNNx80t2HiujW25ZB4lC1g
	bJ/NvZ4LBpFZTm
X-Received: by 2002:a05:690e:80f:20b0:671:393c:a91c with SMTP id 956f58d0204a3-6717fcb7414mr3015174d50.28.1790093100849;
        Tue, 22 Sep 2026 09:05:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4f99:b0:5c9:a60d:3277 with SMTP id 71dfb90a1353d-5c9b599e181mr9764222e0c.11.1790093089758;
        Tue, 22 Sep 2026 09:04:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859682bsm2260e87.84.2026.09.22.09.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:04:48 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Message-ID: <qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-GUID: E4nf7sAo1R0EbBylDSvgCYpnEPUklRWS
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2a72d cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX4nOQnRHop4yg
 j4O1DugGnLkIWBA1MnwzakO8G/uQx7L6AOHdr83HxamUO8rv4wROX+BkT46vLoCq3okc4OmKjDH
 lfs0W1/A72189z8DitTJHix5ZdXzJivVK2tDkmYkBx9vA0BH9O35HysJjoc+ZYwZPrU4uR2NYk3
 hpTAiC2oW+fz4WKd6mN/XyzX/gvfXyD8OnBq17BpcFYqvgztUI65M5GnbqCeKFhjglDfLfrTwpi
 C8wNlZe8kxJxwkk4Q3I2BKbygGtYFajQ4m5Y9aWVlwhNciTAcyN7GR1tuXh2udNjYV8utP1Mcpy
 gfoazLdW/0CurcOkxZU3jkRy8qzh6rTZ8Yj/uSZzdcsvNEejK5/k7aioWPoA+jHc2qJl62SlWYK
 X6aPawv6tQk6Jr3NdTzOBTKdrB3EbGt3vZ/RID9sACZngeEI+LeUuR1ky8kNUc2EObo3InVt4e1
 gJNVgVB6y4d3RT+H3TA==
X-Proofpoint-ORIG-GUID: E4nf7sAo1R0EbBylDSvgCYpnEPUklRWS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX+M8lhJr2aOJQ
 NBRjusDlV+d4kGX/SwvhCmMMu1h1sn6qq9loyxmFoxj9k+NQJydIQW9WZ6GpVGEExG2174j8JkD
 tD3Nz5jE0vXLg6Xa17h+YgGV5KOb93w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220235

On Wed, Sep 16, 2026 at 02:41:19PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
> board and add the DLC0697 MIPI DSI display panel node.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm4125_l5>;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply = <&pm4125_l15>;
> +		avdd-supply = <&vreg_disp_p>;
> +		avee-supply = <&vreg_disp_n>;
> +
> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
> +		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;

Same question, panel_bl_en should be a regulator.

> +		pinctrl-names = "default", "sleep";
> +
> 

-- 
With best wishes
Dmitry
