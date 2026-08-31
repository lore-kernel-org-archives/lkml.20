Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6F63D47B5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166806; cv=none; b=DiLFwMH77KKccnky8BhMOdJmzfwuKfYr3NJDxUwHD5NAGl9bQBVMkCREVXiwgSLi1EmEbFWJMurdvVL2/8itJ/0zQDhkA7Wg7V9vUEq86AbyZqDxcSHf3q1JZgA2tIVoukcr1Ul72fCivmG2dg7ylVPG4+pc9Anad9w6N9BQkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166806; c=relaxed/simple;
	bh=jvdnrXqp0So+L0OugWrFevRhrkv5stAV+RX+VwOhSPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyXyuvTMX0Ut63t4lS0Kt1xpmmodaWBI9YyVB8hvmKFvZxN0mndz5lWO81/SnOwDYJ5HxDaMaMFOA9pZucL2bNAdM6qhgrEy07BYZU65AuKacNhpFbPMlzvspPq1Zi56rLgcZij32TszH38i7YXVzalrOQsLJPO/rzfhRP/YT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJihJ2CP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYk4GWo6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJihJ2CP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYk4GWo6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xaeR3427322
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9FuUCIMDjybr7544D8V8n2Pc
	ssXYGDDsZCLG0tBRN7E=; b=VJihJ2CP2Ywq0cPWcjkQcosp5F2G7GqE4fhY5vZR
	zjZjN24dQ+ybuiiRunMHuXdzf4nfs1XIoq75NL/Q2i0SJ4aZ/yKC78z026FryPg8
	5Dmhg3Bwh16uV1lgaAem9cz83GQBwPQt/boMyPeW1KaR27jMD1mTGycpi+HmjmWM
	N0QNV95CYZm5eH9zy/9X8NF1wu52lPCCDJi0iEiAFMNQoUvnWxq39JKhk+bjKrqf
	jM5wWpverslpbalHo/pS5gNXiZE/KpSpQHeZrr+ng6a4Ai/qwUH74fLz09sGfBmg
	z/c/j6FRDm8ZiWCEA3/eiS9fkDjljx7bb5U4IUaqZwqnWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8j5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:00:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d8cdso577443685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788166801; x=1788771601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9FuUCIMDjybr7544D8V8n2PcssXYGDDsZCLG0tBRN7E=;
        b=SYk4GWo6MellHmO5Lzln6Xfn78ghxJ/5fC/c9gQ7C9c+UKjGn1whIYJLM691QJ0nyp
         7goafDmbpq1uFr9QN73+qk6NwuwE0ubyui3g4x96+tfpJH4e3Yfy6+vQEEJ9cwXtT6nz
         fO1fiKLJb/YJOpZ3ghTTXZiaWU25Hal8JmQcJiQ6K+3oZfOZeYgjYw83zHo/JcgjOnWB
         T0xQnUNXxgs/NZ/YRqcAqvQ+B987wFWvFMd6xeBZZ8bD/KvIMJmZHvdqDM6zBUq+jf1e
         0GpI/Ann8sSEtRPXuZd+x16V7711KRi3UVrpQcXw/TxGm5qJCAx0DzD793Bq+7S2JlRo
         ZEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166801; x=1788771601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FuUCIMDjybr7544D8V8n2PcssXYGDDsZCLG0tBRN7E=;
        b=m9kSQ+SPWj9B5LoJL+dgUxWa3i46w4149gOrS+ts6lg/jMs5GsFc2fU+v9U7k9dNoi
         hfNXyUlTX0l9xNUor3n8GQQvZcZqNtKAlmt4MPvkBi+WP4mDkBMTx8kGKV6vDn0gDH5p
         MFSlt1gD43IhI5LT+fiXnHTwAMxKZEelG0p7dFVUNlk477L24h66c409t670PXNyRLZP
         h6ypfDF/Gqt8l8TUWZZX9GCWibxf89NmQi/X+c11olyqhjErjIDxCKya/vIXeCcPfk5o
         HWGhgdCEVJ5t4wotaUaOhbEjWr58q0ch5uZ4p9h5ENRxDvsCtlFGp99c4ic70mgxIj+F
         1UjA==
X-Forwarded-Encrypted: i=1; AHgh+RqNgSrYjbFPpKpgE+wiOwO9gTqMsVtmtH5V6KgIXHnFj/ArS31GGMZdoO+PfvdAsgvPbhWV+cAswGYOMXs=@vger.kernel.org
X-Gm-Message-State: AFuF++mCy92Ry7C5frzm6SYHt6izFoFZJ1Oe1+SMlcaq7Nbo1YDSevM2
	+dqbD3tVqZOBuThSIkwG5X1zCC1vwKuvdIfYrghFVXTyBM5qlb7aXDkwIAuLj7GJCNSQg4RDpJm
	SfF6Kp4mMAAd+yabFOTmfgAx0rNx+IfzsFDrSBnTj2bgkFbPnVUOKPrLSIJHZXcRIeWQ=
X-Gm-Gg: AR+sD13AQvMhPe/ICFNcWQUUMxywTtc6TtQP5hL2tVSFX34nADXV11hWvUTYhxoPmXq
	drRKlQ2owxwx2tWn4O4rdc3HjKL/MCTENI+MmCPR23KnHUxvNEGPYUVfbR0iYWts6gKzV1z/lln
	/X24t8/M/N4xoO6YSpLDydXEZGTFA1bSNJBDZ09qiOvlExVqUv0BhQLrbD7wlJ3zEMteHPZQcgf
	Gd202SH88XSSNL6OKOERCZcsEg0Ha1q+tnjCJeZCdEhouaBpHC28Cr2ZTVJTlL+4N6y8pp1a3aR
	JVcWfLReFY5ctTeDgwcxlxX7ql+4EcBr5xmjZO9n996NSB/OTZLnNbtHkp0bUnNDD7Rixdq+DZq
	yB5Agyofe6kv1
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr2425680285a.30.1788166801410;
        Mon, 31 Aug 2026 02:00:01 -0700 (PDT)
X-Received: by 2002:a05:620a:461f:b0:939:124c:b7d1 with SMTP id af79cd13be357-9391393787bmr2425676485a.30.1788166800825;
        Mon, 31 Aug 2026 02:00:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm316668185e9.9.2026.08.31.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:59:59 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:59:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Message-ID: <kusfd4y6shizthco62loqfzngdmzbixltnciwanrj3zd7zbek2@6ca5dubvk5vu>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
 <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DVWSCkF1n0iTiNLw_luGJP2GPx_cT3H9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NiBTYWx0ZWRfX6IB80KIEl/Y9
 fcMDYgWcLfcyDDshly7mMD6iEBKn1Wv68uiv2XAlnXUxnBJaVvr+gjwyYj2czitk0l875YF6Wv7
 76JYmQ67NGDNzX6KNYf7RXkVZstiFOuwGlZfpE9o0tLyfQX/c438ONdkCcDYpZ7XM93kh/aiJ1o
 XF8+qw22S1pHZlRsYXkIte1p2q3N58vw8ANO4tLoKmI6YZBLHHyikSOpaKd3C9J3N54xtKHRDOh
 iR/SofGGkbHqobv5kUkZtMm7wbSEtE0cVtuEzTOaXDC/u1HWHIYBzDpthxneXKHZ+vweKuh9o0I
 rYcrz79eC4GprbL+8hTR6MJqZokDAO9UTKQtitRXmC/j6lMK1RKV2ZtKmtCawbNkiEs1WZpTcYK
 dE53gU4242yLsHTHX0D4+B0VSOZx/vceTQDBJ2n4Ijk08OD7GBDz4jUviW43ilIlvo+gXqnTl/H
 TD7bvg94dPKBcjw6e3g==
X-Proofpoint-GUID: DVWSCkF1n0iTiNLw_luGJP2GPx_cT3H9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NiBTYWx0ZWRfXxXfZb5CtXuG2
 JSk7GWGcCrMnHwHxiXSviKfGdfPn/uR+r5x0wDpJ/zi97hqJ7p1RmLZyKbxaUzAemIIDwZ85A9o
 KOx5yEDI2LlGKc8nlpdi53qCCae8Gn8=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a954292 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nt-mjZQ3KoXs-jP8cHgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310076

On 26-08-29 12:08:09, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
>   - real-time clock
>   - compute DSP (cDSP)
> 
> The DisplayPort outputs need the Glymur DP PHY series at runtime. This
> device tree builds without it.
> 
> The chassis HDMI jack is removed in v5. It is driven from the usb_2
> combo PHY as a DisplayPort-only instance, and that path does not come up on
> Glymur. The same failure was reported against the already-merged Asus
> Zenbook A16 (UX3607OA), which describes its usb_2 combo PHY the same way. A
> fix is in progress but not yet available.

No point of having this in the commit message, as Konrad also pointed
out.

> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

With the comments addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 940 +++++++++++++++++++++
>  2 files changed, 941 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..146955de4606 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> new file mode 100644
> index 000000000000..096d40e49210
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
> @@ -0,0 +1,940 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +

[...]

> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@10 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x10>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		post-power-on-delay-ms = <200>;

No supplies?
