Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21213B71A4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371200; cv=none; b=jWiacj61Lygp3D6VuzX0LycjQyee90yxgCIteCHA1zBen75Nm9BHB6pVvfagyizzE9ZNGQLHx7Wvzah5PjddSeQ9YUQdyu+6ySWnVj0QuHxrPGUYvOGsud1GGeQPoww+TIRdPwdvZIenUHNXOOqzDJdOUGbX04+VUvYSgHaPirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371200; c=relaxed/simple;
	bh=UCDo1XGFCUWS/y2GM7jQ04nb6u+qVo9cWS+TwSUBROo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0vUShrpxvsZ9WH3uIK/WMJqUbbY230kB9GTKwuOBTtuyWp4ZOmjQz7hUg90vg/Cg+FN3grPA3gAYTBxnhg/XD5Fsz8O4eOqZmtFyp7B/4r+Ahmr9Tza8KQIEAs3DLOuSQbeJqUTPxjYZjn6hAXRrFI84tnFCnam4hd2QBC9XjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tlpx0cy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vv7XB9Th; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tlpx0cy4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vv7XB9Th"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j9b54058971
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PPVHmgYi7mIm8HbRO3S2SjE7
	s1NeTOAcrc3esYObcpQ=; b=Tlpx0cy4xC/PJbyXS/+6IME4cTRft8805PiR1jjE
	871i3Ntx9bL1FEDluPZPNCYzjCkRCpgVn/iUknQBnQ7TfVg7qel4lX+p0Z2ST8aS
	LVDjP4d3MZKmyZ//KhRX6EnEKeVWPgJgE3EZ9biavcGFACtn/cclAeCops025BF7
	DRkP1yT7CS4+YhI5GjQUzBk0QjsrsLRCbMiuQFE7gqkqK8kV9ypRT+ZEa4cFQvk3
	EiWT2d9C4hqYtSjpnSj2/8Ix3b36ATzkC0ehYKENwIVYY7Fc6qVilGyQVqFwoaEq
	Hxvt1thilrpMjDb67zokaMQZ7qaAd8cDuEsbeiIINo5Q6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssbtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:33:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a6937513so462485585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371197; x=1789975997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPVHmgYi7mIm8HbRO3S2SjE7s1NeTOAcrc3esYObcpQ=;
        b=Vv7XB9Thl/CZq6FhIAbut/4dGyH9q2Cvx+SmT2BpmaSTTM9X9swfxqdE57h0dXoOzm
         445OCDfUgFmsM10LdAVRLkfCKxmj9NIIsWg0xlwUk/c2zyuhN7yFc1sL0Zgaz2w8IjeW
         TOOp7QTJk2iDTNgAQkKCGiZmqmx7rqbviCBY+lqa5zcqEjq0jbX/qIszqrbK5q2kyRda
         49FP8v5V8VVpyuvUtYm+2bXSuBYKI9F1Y1xSqeyVu+MHUQUrEIrc0+SRwTnj5CYGleK1
         FAYCkXZ676sNTVPVzjsm73rZbuv/YSR+K+VcL2cM9CQViMn4oQl5KqtXZ+shANqGtz0K
         gi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371197; x=1789975997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPVHmgYi7mIm8HbRO3S2SjE7s1NeTOAcrc3esYObcpQ=;
        b=PKOziuFxJuf6P452+C+ReFoNOoC87fMhALKtZklUqhC67plp9Si5n1NHFjusoOfQha
         M6KxF2W0UxCHhGiX4Kdz4ou1glpv7hDnqk83I28bISzR94c+NgkHUxLI3OJOSprSiUIv
         14+QD9k+zsxQX8bp1Zz90gu4e6r6niidUAYV1RWIHtlluMyImi7dRnJPCdhfhwBduwlI
         ex/g7KcspeLrAgfJE/76P/n6OxBK68wP5IDKFwLdvjqh822Gld+7v4dZsmAt6QYeINGH
         BFN17j988e3SXI0gsN/s3QEfikrU00V/05a5OMLgGeN0CePl1st7S8anyMruEIv4wNyd
         Rrpw==
X-Forwarded-Encrypted: i=1; AKwUvBx9y4aeHkWk6Q0Lj3sSwE7ndVb3h5IrHQsYSwbGKjllg2tIpuD1REN61xrXv/Fq4j2ZHIm3yJAtBfFM1Dc=@vger.kernel.org
X-Gm-Message-State: AFuF++kqgxaAdQAdhMgdQUSNwtsFO5OpK15T2VC5C4dN9S9oSDaUczsE
	lHfbzcem/tlxVI4FFcAsVscdDQma7SUqhhT6sHc3IS8WpglCBNj2pdOinkyMp4tcZcz9ZQM1sOm
	NQDpNd+ifdk5i0z/sZvnxMmDla1Di0S1nEipzrgNW86LGwhEhqc0z1bsTL+BmlYRpvjo1xRESqR
	U=
X-Gm-Gg: AYBFou1RwdVfUS5FymgTGR0suwdxU5zE2xFVrD0Ic404jLgGGH3VEbjfqF7aR0KIJkY
	K3frgLJeplTxSyNqIH2LTCZsB/oy3vjXuE6q0dVKdI5hI7k3oHVfItgu4G+6p6ZDeBFwT8cishK
	uwGQzXPN4r+6/znESAyn4YbJkTBIeDBwQRf9DVCQOirTvRh8fO+OdkH7vCFtHjGY6duEaoELJyA
	cPMadV5wmHioAH/aX16sAVTRE/xjVY0RvS2PkXidFwQJf0kjLx4Gqmly+w40l4tLslfp7ddxjSn
	5zI6pvJ6rASeINB/T4prs14LtiTyEzhESwcUUKM3lA1tY8DXs/quyBFcolZab5ikxyDMApxjOfi
	rugXI73an1uCnDlE=
X-Received: by 2002:a05:620a:684a:b0:939:36f3:fea8 with SMTP id af79cd13be357-93a299fbf40mr181203185a.25.1789371196777;
        Mon, 14 Sep 2026 00:33:16 -0700 (PDT)
X-Received: by 2002:a05:620a:684a:b0:939:36f3:fea8 with SMTP id af79cd13be357-93a299fbf40mr181199385a.25.1789371196308;
        Mon, 14 Sep 2026 00:33:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm194517025e9.12.2026.09.14.00.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:33:15 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:33:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
Message-ID: <654pl65hnq5hrdebqsj7iyse6uea2ltrnahac2fsszj77lodun@56yozp6x44bn>
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNSBTYWx0ZWRfX0Wlr2AAFINQ3
 b9ZNHogEn0GRzM4Mr99BamixJUWHA1nONJNyDwBuch9ugVOCRJkMcnZ6vUSAvHlkj/aXVxMF2ty
 8sOpfnvRsbOah8zvlR/SAmwxID6DM1TATuaLdw91K4I8Pl6eqJg2fy4ECuO5m7nMmMr6wgJcdiM
 nfIReoym7v6UPxOg2Ub0HQnc+ZrawgyG66q7mHyAZAkH436PSaO8BIXNgA3M+ZVyIpTeMErLLPI
 3vPp1v5Bqsi5XDgaIRx0Pzfj6IcNP6+nq3EE4BpGPbpYGfFE6He3y73NgelxGFSxZie46fqCKil
 E4sLxH9K+1dvSHdWd78MMHR/5u4SUawdsUjXxgF1pD7CrP82evaTLluhhIriuNtPpt2HlI0ZnQs
 l3ngR3DgiUN84ouHyFJduJrs5C2oy1k2MgUkgM0CwtNeG2LTS7QBxzAtpsKbGfYs9w9joNJwzQy
 L8+XMs5uPBL2mdFYZQQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7a33d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=akxgaDyAjk3E6sMMxtYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RfLqF5VzjxUJt9kvjgPOsb1dSpaJLauz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNSBTYWx0ZWRfX/txd/gelQY+w
 sz5Lk+DFZiVmYXPiv9KG+POCOgvcoPFc7yJhA2gRgRroz8dMhGdKcjjHW+juEyJET5z+wBmzXFl
 lAF7ZVil1f7NBkFsyK/lpLdufx0hrcA=
X-Proofpoint-ORIG-GUID: RfLqF5VzjxUJt9kvjgPOsb1dSpaJLauz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140105

On 26-09-13 21:18:34, Srinivas Kandagatla wrote:
> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
> design used by mahua-crd.
> 
> Currently working:
> - Display (internal eDP panel)
> - Audio playback and capture (2x WSA8845 speakers on swr0, DMICs via
>   the VA macro)
> - USB-C (host + charging on both ports)
> - Wi-Fi (WCN7850 on PCIe4), Bluetooth (over uart14)
> - NVMe on PCIe5
> - HID-over-I2C touchpad, keyboard and TrackPoint on i2c0
> - Lid switch
> - WWAN wiring is included but remains untested due to lack of access
>   to such a SKU.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

One minor nit below. Anyway, LGTM so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../qcom/mahua-lenovo-thinkpad-t14s-gen7.dts  | 1184 +++++++++++++++++
>  2 files changed, 1185 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6c2ac11133ca..c71d536fc3e7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -59,6 +59,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts
> new file mode 100644
> index 000000000000..be5f12bfe56a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts
> @@ -0,0 +1,1184 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "mahua.dtsi"
> +

[...]

> +
> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +

Nit: Drop this extra line.

> +	sound {
> +		compatible = "qcom,glymur-sndcard";
> +		model = "Lenovo-ThinkPad-T14s-Gen-7";
> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&left_spk>, <&right_spk>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +

