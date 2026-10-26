Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032081;
	b=4oDZ6n04AwLia0FeE9EkfkCehkJ5mGl+kCz4x0JsMiv3u2dqlNRoHt9oPcyikaLikkNr
	 dQyU8AaKFvhjF7KtMwc/kif24UsdMvgj4WqDTjE3l2yqVO+TVXmTer8TUzTZ1xtn2YPhF
	 f56lkUPGrJHElXynElxYl1xVIln73xXFj4CK/1Zh/ltI4kMwyMwxVvZrB3fc0jgRu+qtG
	 FfH4S8uumC6cjmNeTnZHIB5gYQ3gX1a7HD4QHMlnTMYAXCiYcnoWLe5M8ooUKUaKNXcnT
	 qIX7w/9k/Klj81dFqvt7S6F19sdMcNBL7ZgJRiQhHnX3eoGJb62SOcAZXygOm6IMAzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
	b=oYsUEOxWV6igx7fu+ipmX5W2+KZr+LMJ8WkvDpPWyu0mqM2Ajgz/wp9+7fiEu4GX2Gx/
	 eWmaJFipNeASNSl6rj3EF6nYaYWd7RgiPqHZT74hFFVBipzD1qAgutmsOIbtJUYzMMzbG
	 D+ltNcZyEbh04liRLBBghqa0Oyri/NqZcyFnVeHUojO2WztuG0brEGfpWRmwAJefA/ALC
	 8Vc/k283+edYG4z7MHKsqwvzk7Bu5humZr1veOg7f5yibLGnBmIOXluWLwHJV9im/7bHO
	 TK+Sm4/TSHGyZimbHxtDwvawY0qaqXgPSkGAnP5OpQ96pGTcEG4lp/bB3JMParuTZlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Icvcr8v8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6gLnBcl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADDD606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADDD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Icvcr8v8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6gLnBcl
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvv0e2707724
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DgbFgdGwx0LxvaVp9RgzD0rA
	2Eaf0b4Fh1Y0S4eeYow=; b=Icvcr8v8v7hK8qcfYwrBYrcqCMVNXeTz3YpTKEXg
	mdmdJ5SuXbVcw945UvK6fUFy7RYibLBAbrK9JVEJ/fBsyVazlw4CvovBwSBDax5O
	JFmOcSwc4pt41RSCoZg1HvxRc1DExZgWUj6rf7TyerDYnGku69EpU5YAb6BbYBHl
	Unv+vZJOfYr5sPnBUerBWR0/68KBwCeb6iec/tGteUwt+VAQlg36QDA90tpD431j
	t36hoZZwXXNbjJsr+hg9erH4C/+HvLN0VMZSDlXwNuDpKa6TWnICxKknknZ1X29L
	j+yCYLrKXmPub9xBgoI8c581p1fNBGyfyyLZjkwCWEt9cA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u61q2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:28:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so14622085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032079; x=1793636879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
        b=j6gLnBcla2HE5aRaz6IunowyyoGLQREkoQaaGRXLUmzgEmASZ3EIX9yDjYlRi2aJCt
         iaoPRJnVL8yHvAuXgk2VE1Y9KZ/R4QNFMaqTZhvJocKBhKo5xBHIwJcomERoxFuEKN2m
         sQbXBCWTBalS8JM/Jq+aRBdVt+QW0FKqAQL58tKo1EEfoKgiZ6Tl7HczpZ+KPRxbIgs3
         30pnAnMf3xxN6N1xIP557rsB0zrICK3iGqSioMzighwpAppjobXnb5Lu6ktIaInE7cmx
         xjjLt6JznYJ3mKKl7B6WbQch4NDP7DI44wRwuU7p0EQcjv9TIlTvnNCyddQBpuJlG74W
         2N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032079; x=1793636879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgbFgdGwx0LxvaVp9RgzD0rA2Eaf0b4Fh1Y0S4eeYow=;
        b=f1AopavdVInMT+xs0WIfedI1njWdL2Kge4gHZtnh7LqWxwlPrPQxS9qYFCTTZ53RmV
         ZKs1VPHEhsytbDlK/NsJNlnZ8y9rWt8t/yK0FonEwwRl+W+6Yn7iGUtXYe4rRyUQPXnl
         xJgHeSUuTrWZ1mFv3G9dkk1kFNBzHKugp67ZMII/xM8mzN4IpOvVw7aXnCaWfOI5ogh7
         wt/VO/P+/Xh9FC0F8hXaZf4428xhyt4upCCoxsExZkLXRdgLBkOsw21q502PSXLZHGu9
         acJOxBfFBbtds6rK3gB0H9FisN50cAipgHlEBJo+N0OM+axq5lMFEthdo7roMs8kgJ5g
         Kfuw==
X-Forwarded-Encrypted: i=1; AKwUvBxkeH4l7Kd+HQ262xqSk5N9NgPWJ8jhbhtQGs7aatNTrjcdRAuO48QSsGXsbBSR7HFdXcjsZxGpwaBAD9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ45bAiG1wWKyz98XXG82VPEKEz+7B+1lPgNtoj1pwWzbscE7CM
	kZZsKY0oZ5e5M4S23AvidIz1MrzLt7nWMY2nI9pd+A2/XwgrMITBuQTuuNuHx/L5XHtAiizkV+F
	iUbhs3vdhlT4gMgpynLft4fyPHZtSwjdVGbKWIslSmqJpKpBXKblk7YWl2iJALqj5U2M=
X-Gm-Gg: AYBFou3xBz6K/gY+tNwCN3+LoEXnr0QkEdlC2kn84P405hAzVLjJqJNI8X2d0EExC6U
	jx+k1G0KYa87HTZ1rpM5F/9lS3E3ZI1WfVwIew6zECP0b0hJ8XBUaeSelXmMFKbnA+u5hPsuSpr
	J1rnOkVfqHc94cpE4hLfb3G5E5kxTG2M2h0KZiFW2jpBBp5AFXElDJ6JDFBkDuHV9OqxQnxz3zO
	yBlUzzmB8eV+J7sp8TTQldSJD4EVEWCq3TfeHmxcwGPU/yGjVb7erGzKsHfe7Bv/4JE8mghRxGy
	HVjSaQAYR8nCrVAkl51qQt0HKdgfXqZwD4xcwGWxGcQPF7TL0VIKvXy2PmpoZMtHj4+fgv90N3L
	UjsiUeRDN2lkF0ZY7l+V/DCExBtfd00U00K+MVkIz9rRVW1Zi6Pb9ehs/SvV7RLtpMg==
X-Received: by 2002:a05:620a:27d5:b0:943:2746:3c4a with SMTP id af79cd13be357-943f4a05fb2mr32405285a.5.1793032078856;
        Mon, 26 Oct 2026 09:27:58 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:943:2746:3c4a with SMTP id af79cd13be357-943f4a05fb2mr32399785a.5.1793032078257;
        Mon, 26 Oct 2026 09:27:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm18160539f8f.24.2026.10.26.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:27:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:27:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sc7280: Add GP M/N clock
 controller
Message-ID: <oxkqlvbjnlji4zyx7frurfjzf2ryfkbjjirwkewtp5trj7q5nf@pg6pogt5z6pi>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-GUID: KTytyCnT8JYs5H5c5H4d4fcx8Zhb3lZb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX42pWhGj6gUqX
 wIBHccNx84PxN8HIUN7qtiTAZVpisVw+ufDZXKyclbVp6I7JJWk8RaU/pRmr32/3HX4bIw1p+NI
 k+gmegUvjDYoX3K5xOEJ7zlU4Ku4lOrJzE8SAQh7ljQi+u4AsV2t9UUUJgKyKjMg+m67HdE/1tl
 dzaNATtODvVWIYXfVCpnhdk7iEQUcd8Ob3N8x5r/mwzb/Q1b1qcDWdr6utGwtTxttB6jibQrROB
 Pw9bVATywV9GoeAbnSTDCE9l+yzJhexhpFAWh8+9Za1x2D3n2RkJ/4coGbBEFTwCIUsmi+G57hk
 /FLJDmgJXjcFtkTKLQYgOHaClK6xehQfv4q5K0/S9wBvzvRZVMxqF1Ew3CRKPKPU29UJE5Ws1Ye
 um3GlrXZJDoJv4skBRipVnpLfItl5Nr5Va6QIZAK9QdKqz+ZXV+R/Fr2qz2kJGCpVtZeEI41Vw3
 9Af/mq/hsRvOVZCxggA==
X-Proofpoint-ORIG-GUID: KTytyCnT8JYs5H5c5H4d4fcx8Zhb3lZb
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf7f90 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oTvOlQyMf-P45GjRKUkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXzzDA59/noCDc
 ybQuCYOnmDXZBHojOl4A9W/50GjVh5Ws75G+i1lUJxHEMgrQiuhxNysJ5tarsWxyJOILZACdCTN
 w1Wo8qG+qUiIi9UQLtVRpJP5d3HLFfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On 26-10-26 16:59:37, Taniya Das wrote:
> Add the GP M/N clock controller and its pin configuration for SC7280.
> The controller uses the PDM XO4 and AHB clocks from GCC and routes its
> output to gpio60.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 8c7523602d2719775b8f5c6a8cef138a93292721..de27a051ee3b0e9046ff97b8e6fe0164985d7b17 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4442,6 +4442,20 @@ usb2_role_switch: endpoint {
>  			};
>  		};
>  
> +		gp_mn: clock-controller@88d3000 {
> +			compatible = "qcom,sc7280-gp-mnd";
> +			reg = <0x0 0x088d3000 0x0 0x1000>;
> +			clocks = <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names = "pdm_clk", "ahb_clk";
> +			#clock-cells = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&gp_mn_active>;

pinctrl-0
pinctrl-names

Same for all other patches.

> +			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates = <4800000>;
> +			status = "disabled";
> +		};
> +
>  		qspi: spi@88dc000 {
>  			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
>  			reg = <0 0x088dc000 0 0x1000>;
> @@ -6653,6 +6667,13 @@ mi2s0_sclk: mi2s0-sclk-state {
>  				function = "mi2s0_sck";
>  			};
>  
> +			gp_mn_active: gp-mn-active-state {
> +				pins = "gpio60";
> +				function = "gp_mn";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>  			mi2s0_data0: mi2s0-data0-state {
>  				pins = "gpio98";
>  				function = "mi2s0_data0";
> 
> -- 
> 2.34.1
> 
