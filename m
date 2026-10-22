Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665115;
	b=sKDfb4MCZOB+UnT48Q9ykSWeFfsKSq+HCPnaLCkSptNvth0RdwQ5fv2bKrLBikVVReA5
	 xDvOYGBphE20ficlOD2RG3sT4k1AJmBtOGtqBBGwQFD4u1Vvzt2OtSU6hKDgBWElvdjEQ
	 uB1mp6dn3ES8DE7ARdrB2OjiPI/ElqBmInaoi2Mr00yMy6HM6Insr3beYJMe/oiS1uVZW
	 tf4Iqi2QB/Ch1+/SSqoXB44XB8mOK7HROMGBd1AkFgzI3BONm15EE0HLxELEo743vkCi5
	 56eKWZ/wneqANNQNnACooM//M1ELTGIMHvdiyT2b2LB9K9zldtRWTkdGjZuiusQbqqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
	b=aAtxwBmWtb3w+ul7Ki5VTuCmbWd3MBtQ60QZUd76vblELe6zUg63OMLUZriINILquyrS
	 VNm0d3Wn810/yK29ZsHKR4CBqN3/naUvbgQp5z0judcm2d4QoxuQHhosFyPCIZRAFzqRi
	 57yaZ81NAutWeajmEhg1SSZbaotE9qOuv1eYe09jxf+IpI2m9ygFNzPrz4ztZWs/i69E8
	 1nufFfOUwImISBka6pjT/RPYfFsDAwKubsS6G00NcKD5QnipCiMANr59LhbwZvjkxqo9x
	 NR9pBgZAhmNqpeuytI5f4tNG8wVubmHlbuoy0P52XYxMmgcpeG1GCkVcdpDc9CuuuPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C44D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xo4i346047
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Awbc1OwBDawvw0PsKGiEj8XS
	YNQmg3T/IWA4GpaDj7U=; b=JeJvgDE9s6U4rKR/pH5cLI7hD/uIVCindZ8qA5xc
	jJOiT7VOPN0GQ+VWDhCj6e/88WnNFR1Rl92DvrBAgWlFQBpl73FJNCh0M+okDzpQ
	K1ClcvpDqpIVNTlccpcoiv88nOIS49DEtk/UofgNIhSuFLq1zgZ4E03v7zvaRmg8
	sVm/zSxqR0uJb6kMsB6j3pqekdqR5HxjzO0M4Gz9vRswjJPpdG4vxHLMdG/mc4hf
	5TDfxikWgcmlasdqmZBmAcz74xh89SZyaeyz9qwFbEwwwgCNFhYubFhMJGZAIFQO
	v2z30xxK402n5rp0cITnqovRdUUrET0BsilUcyUC7Qap2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93da306-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:31:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so223844885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665113; x=1793269913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=JiDl1M54vOyZMyIyAKuImMW56nmaJ9WPKvtjZ4nk4ZpPGpargDu8nJsXHgE0yPIebC
         BP5uti5dX0C7bjI04CUVXGVP+JNrXCmlzQSK8qfNndOeReymFyhtipLmVlfEVcoYc/a+
         gGt3XOkIsYO6LUCJg2gvdFkLjvc5O8acMxCPxiVACTlPr1vg5k/EPktDiPM125LHF9N9
         A+tS1DOJj+YVYmA1TBbMKxiIPK8rNLHVE/6r2jUBGByO2U0ml/zOaKWCkBDoLmaVnWHj
         Df40dgsb3fIWPcqrDvvSC4VI9dguraRrX+9Suu6ARGTPhSnIqFjhT+qNJfxJix0eQ/iT
         o7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665113; x=1793269913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=1DswVBdZ6c+vbqo5iLbeKqCqOnpE4FmWQqWWFczb3aa7iYLiLaYjOC9D1q5Q3XIjJn
         NGhDw4Q0k2pJKlpmoaoQmn7IV/unKP4C5PJmEpTwAkZAUQzmYlEpXLPwnEGHka/tRas7
         Pnor0VV2tlLFu/rmdj+z+4aTX1VgCs8IqleqeQwO0u3Vvi9Baa0dpFGBT7/K+4HV525x
         3R4n4sds2Biz/Vp/EkIJBZuWuIiLLstXoJmLUr9RHU5itr1MckW2f0+D2RxF+HrkVzg0
         1+x63PlO2CaBR0QgLIEk5j77VOFgErq31Mdqxg/PbF7yw6WpSWIhGDaOC7riS7CLJ/5V
         IgwA==
X-Forwarded-Encrypted: i=1; AKwUvBzls+Rez7+9JB3X5WpEdaZ5L9rdh7FRfVILl1gHNZk0+7kD7KON9j4HtnN28qrMMn/oevc8+PiZZF2VroY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr0syFKa6U70ra49Onbp+8gZ660bHeBrPv7+LPWl5aQojzT9Bk
	6GDxZLXHcmF1NLiIAClGFs5BlbISPwtM2BZiQcBvYlv3XL8ltcJvwpFO/6Xa+zp+9Yid+5lKNEh
	QI2IyAaem1fjsdnS9h7jvilSRZW4mNAJsSmkdKCmsGfK6hcZKvOdZblloX05qjb3LDuQ=
X-Gm-Gg: AYBFou3piZerJFVn7vCZTGt67hyQJj482j2zmEgPMlQ31QwI7BNMclU+Kmwz/SNWcNB
	SSS2Du+nu2qt6xbLAwuO67422EFYpsCPfe7PazBOJr7f88m8wl/2FX6hx7/vVgTl/fUkSPP4Ze0
	M9xUIPwwUnIw2uCc+xKF5LEHFsHi+PFti/dFLaDgsKA+YMTCgptfEMBfAvNKCmTyD0HBkBoXi3M
	7q+fEmiNVbptjVttqQhaXOyvBm/FFUCe/XS8YjoWZQVixJn6vwXavA3z0T33l6nKVqC6QtYuA7s
	jv3et6H1aHc99YjSJ0E9iyiQA4RJ2H6NyJ2oP7VEh/w/r/KwtNr9dPo/aDNg6FqI+NG9uGVSqJt
	LudkiwM2yWc+ox2BJ6zz+a9n+/JUQ+ixfb2IdAl1A3bi2e6jbwsXOdBHNSJ6q1SFELKtCjlUrwM
	ufqq3Zx//oZy8U
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866627085a.50.1792665112692;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866623985a.50.1792665112215;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f55402csm6899281fa.13.2026.10.22.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:31:50 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI
 audio overlay
Message-ID: <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
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
In-Reply-To: <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX+ZbYra1YXGGH
 6QqgQKYDGz+TDDnbd4Z995lDU1WFobPheEZBFA5B/K4Qz4WZlCTnyFeTzDTmY8R9JNXxw5queZY
 CNmoXPlzZGZC/L9zoQHEz5SFdIaj8M0=
X-Proofpoint-ORIG-GUID: 0C5Su21jSb3cfgs1vASfCtpaB4t59Czy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX01E7/uztEVsd
 SZLFa0YuIHFVNOGdQuzIO7udTaSxFaCz10zyR3OOfZ7jYsEWkl99Tf/r2PdkH6/yyz/FSnkJc/h
 /dws4DfoDsw2IJjDVBIqJz8w7NkMxwLzvFFkAmAL7oCsTcy+xoXi8KuNr09d6ZGJ3g9o4UEMcHk
 yaDtWgs+XQFBs/10b+ebqBiDSVwBe/Dkr7wc6TwZK7Tcydm2b7Zl83rvKp4IDknhULrpw1Rb46o
 LYiTZ7E063lf+jE2tB6+nsepYsVHfvrApxnegKClB95SBpV+BA9cJPIqTlIuXeXerI7BzuvuKYb
 Sgxf8/VTz9Ai2AFFrEkD2CUQ4aWkYllcXbiQ/v6XAngfKhvCje49LQRrFTinEZUzhpxbrlFBPjB
 2F82/0WhSkl4U+iXWOX9uOto82vKCXz8+ICq5M2gPG4PaQHdqykshG+wiVqdG+dvTwvfUNdKdIr
 JI0jRmTYOtXA8iFRQhw==
X-Proofpoint-GUID: 0C5Su21jSb3cfgs1vASfCtpaB4t59Czy
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9e619 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hDuEe94TteisESDp3jcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 03:13:10PM +0530, Karthik S wrote:
> Add a device tree overlay for Shikra IQS EVK boards that use the
> LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
> 
> The overlay reconfigures the sound card compatible to
> qcom,shikra-iqs-lt9611uxd-sndcard, overrides the primary I2S playback
> codec to LT9611UXD, disables the capture DAI link, and disables the
> MAX98091 codec node.
> 
> Add a node label to the sound node in shikra-iqs-evk.dts to allow the
> overlay to reference it, and wire up the new composite DTB in the
> Makefile.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
>  .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
>  3 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..127c5c345eff 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
> +

What does this overlay mean from the hardware point of view? Is it some
hardware variant that requires reconfiguration by soldering? By changing
the jumper? Can one use max98091 and HDMI audio in parallel?

> +
> +/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
> +
> +&lt9611uxd {
> +	#sound-dai-cells = <1>;
> +};

This should be a part of the base DT.

> +
> +&sound {
> +	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
> +	model = "shikra-iqs-lt9611uxd-evk";
> +	audio-routing = "VA DMIC0", "vdd-micb",
> +			"VA DMIC1", "vdd-micb",
> +			"VA DMIC2", "vdd-micb",
> +			"VA DMIC3", "vdd-micb";
> +
> +	pri-i2s-playback-dai-link {
> +		codec {
> +			sound-dai = <&lt9611uxd 0>;
> +		};
> +	};
> +
> +	pri-i2s-capture-dai-link {
> +		status = "disabled";
> +	};
> +};
> +
> +&max98091 {
> +	status = "disabled";
> +};

Keep the nodes sorted.

-- 
With best wishes
Dmitry
