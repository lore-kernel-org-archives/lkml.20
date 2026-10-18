Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4859649B1E2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327768; cv=none; b=Kbn384BvEB54LY1VBpPkkZ4g3i4syH6nxRklp8d4NczqLyK3Wh7tRrWo3vltk5O/n6IWBQ70df+yqD2AMxwTn/rjCouDrC+NdzBclQ3+AAAWBVhiXvzn+odJoj1yuMh5ystsFDRRL8LCzhbLepGZJsfXrG2pnGNVXxCm0W3f4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327768; c=relaxed/simple;
	bh=3H5WDrbLsyNmUMdQMd7cl7iVv73It2xWoc2XO457wBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPAAT2XTUmVxzwcfQhk8IWXeEvMHR/q7wfHSzdPvNu40HrhIA1AzUILRlIgFnLVqe6j5lxzN5jAYSHYTn5KavaEbk8ngPdKavGZAB9BgwY5r70ZJJLLCayYd0TKbWHa3SDAS7aedBiLA4uIJdwTFfGXTmPnzh2X2OJQMowOh38o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIglB1Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrNTyPCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIglB1Jo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrNTyPCQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tHDB2111116
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oR0xHgOBXTHB3mbB2fYrEG1u
	zN9XOep8KCEuy/4J+/Q=; b=XIglB1JoNlxqpHbbQJLWsKmbWDv1IVt+GHEjmKz6
	14M0m+PoTeHRkHuE3wjjUUZ87BF2hKQdDAim0Fjp0ebnVYlK5KcoStz6hymnVwIw
	rOcAhqmMtDqKPcGhQ6z5Cfp76BiELLZ2Nx9xRiFhboApVbYKqA45ffM5Ay615FK9
	Dl8Js+9gcX7v3cdkr9LkRUW/sV9CYQdXREJpcXMn8Fleh8xvL0T9tQknBHZsv7uZ
	pCoOlh2hgFVILJhGnZ8tIX/cHuGCc6FbN7Qwjl57Yqs6gUUcGg5TcCLWXILZsxHF
	VHEXQzDwBRpXwAsvAq2HCjb5BK9vaMkzuhDgMvM/Aia13A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7u1d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:49:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso4042323eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792327764; x=1792932564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oR0xHgOBXTHB3mbB2fYrEG1uzN9XOep8KCEuy/4J+/Q=;
        b=PrNTyPCQPcjwXfGCZF1gPLJwicrGr+Rh/KEddUJOw9ejpfPrJagiwNLI5IxNAestY/
         zATXEyBcLkO+YiocX7maUuq3Npq0UD0HR45xJxzU5PZqlkhrvohvf/WKAWacf5HAvD+x
         LNt9PPpr0N0iEmg5cd6XU6bfxK9IVAfaB1drVtzdq7NJhQ8HzRRNKyc1Bu+g5QWXoD+N
         i58pZDzVmsblJLjsDJGTgcHwDutwrz3uYGR2lbvxtT48rir0YPmxqf98gDfziLk7IBo/
         hUuX0yuryk/UOxswAJqG3BX10RZmTrrz/3pvCGg9ie/cNI0CqlKAQBZu4DRG8gYU+PKT
         W2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327764; x=1792932564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oR0xHgOBXTHB3mbB2fYrEG1uzN9XOep8KCEuy/4J+/Q=;
        b=So/qHWppMKLGjxLxtxHerXx7bfap7QfopKETHnYjdZUfNe3cIL7ShciqXZNWTK3Tqh
         T2VTez/Pafw/Oix4oIvy/jR87wfWp1Hn/TumN3yIHTCHDXHtoV79aOgJxRtjcHX9ejF7
         BDdo5osOcvExNHZVtQZZandG0TNDNjCE7ZfdQGD2DGi3IwCguQIQ/nI3AjDk74LKjbVR
         qgsGHSsVmtQkg1vsFDlmhIxuyTBQ5QCBmRemL/612QvP9JmJ0JrAxBLBNPyvIopKzH1L
         a5oPmQiI6cPCbrv7Pp677oXgaAw1HK2RjdTiKDOtISe5pwcB0JjngyToaln1RFnkLDE1
         WEnw==
X-Forwarded-Encrypted: i=1; AKwUvBxUbZPJNo8NrgK3wgQzDOjG2ohluwfvH63xvihEMYcK+yweSIrZskWjkUjAEVxN1pvy50EJtl+awOwP14c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBRLf4zHAWukHfU5ceRoHSRkRFML70De9L0B8/HDHq4XW5MJSr
	JZTsoxNO39mUJIRFt38Uak7vp83Mkh0bqkUe9GEmGkH41PKiHRy69t0Knf6UQPOhR7VXnsZYoyn
	679nMwpStQupabpjNmLidmonX5wSDidq9rRsGJvxH/SrXpRUFAT6YEwdznHDlLcrQiNY=
X-Gm-Gg: AYBFou20Mkgh3kqk5PZDymMGbSzLXSolgx1uVCc8uD4g/KQnGi9ntF+N6N1dOfkrouU
	lZRCElKcSQMuUaW6v/JJmkvQn96IBxvNwLDoAZVX/mBLbJaLts7pdfAk9m1Od9Sa5+6gMjYpWla
	DyUpJlzz8CVTR79KZUq5M0/upFpz4/jT7eQVf5lE/QebgGEcsuwB4FhBOZ7EgjfqQc9cxiYBcm1
	6vJn4J5xKghDx68d08wjCyIzhnd5y7kxmcYvR03jC3MsfoOmYBVgyE8tnw537+yWC2RHySzhd2/
	1+Azp2JP0jrIV/kDhpPQMvuWZ8Ko01Lnr5vXpqmdXHWVyBHghtkVnkmIpdifkUEkNJK6C0Ix2/D
	4Cp19kmG1v8iB89qLaRCMSjymSXapNSf/zJJ46iglYw==
X-Received: by 2002:a05:7022:fe06:b0:151:7831:e401 with SMTP id a92af1059eb24-185120a8c4fmr11330684c88.15.1792327764351;
        Sun, 18 Oct 2026 05:49:24 -0700 (PDT)
X-Received: by 2002:a05:7022:fe06:b0:151:7831:e401 with SMTP id a92af1059eb24-185120a8c4fmr11330594c88.15.1792327763450;
        Sun, 18 Oct 2026 05:49:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm21496025c88.2.2026.10.18.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:49:22 -0700 (PDT)
Date: Sun, 18 Oct 2026 20:49:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA1MCBTYWx0ZWRfXwvzGR0fuGjsF
 tv80eB8b9wyktxsMThUTWHq/8d9NWZaRXKcl/hP9xZuJR0A5/DmnAyWWK7GNKI9C0KZBHxFXt/t
 GcFFz5xKlNBlDbApN2U6Eq0No1QAdFM=
X-Proofpoint-ORIG-GUID: kTviXhEznTY4ylNoTC59nWdiXsUDkhP3
X-Proofpoint-GUID: kTviXhEznTY4ylNoTC59nWdiXsUDkhP3
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad4c055 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BAA5RAoUlf9vgojSqUoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA1MCBTYWx0ZWRfXzsGtvXpYxxoZ
 3enXCWwWzVEj+1ZZvgHLU9Al/FMPMpq9fjqFY93SIvVBmskT2ofdoPXClRUJ0xJ8/SpP9NoDLIq
 W8SGjAtMXcDy/zwOalW5CdSOFV2VRff+ByOZM3rU5to+RvrBybx98sWnk0Ek7ueB9NzXQDdxBy+
 cfNIGPPInhcpz3nlhNfnFIt2CNzSyOI38koAi2PLFzL0lDs9UP7wIuP/XWsIayd7BnlxZxvLhTz
 ftjVdoWH6uSKFgDzOH7Uui5pBPf8EXyZrTiFlxv8L7dhNoHJ9d6kH0CgGPaKRDeMcBCad1a/cRY
 XScOPiU+rro8KqKJLnCTV7wIZ0TcA646nGkztoT6ZuQimqCbwHulp+DsmA7LaFKaSv27lQcmSlM
 qaIpd2179ZRxkbqbwo7PR3vrGQsR7HVYZUAtZ2/VEkg2PZsYOCYgA+lbjRIu9LO2pe3zo6WthA4
 W5MM1y/8oEsrl2ZvXhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180050

On Sun, Oct 18, 2026 at 12:46:47PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 47978df0af92..89f8d36ed812 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -434,6 +434,10 @@ &spi16 {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp {

In alphabetical order, I think it should go right after remoteproc_cdsp3
rather than spi16.

Shawn

> +	firmware-name = "qcom/nord/soccp.mbn";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
> -- 
> 2.43.0
> 
