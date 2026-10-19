Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660533CA49D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407454; cv=none; b=sVSgi0c8nfVxlQLyn90Zb365Ib/vyfnHrBoS4lUmOELgOq1ruNabyo/1A959x2+oc7198wUtu/l/MfPgBDDDDJH3eRJkprJJJ8gjF2ZajRsK757clI4qYxM0q7zFnrBZV/tIyASx8dAsGKipzmMCz5QJtOV//KD4Yna2qf+w2Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407454; c=relaxed/simple;
	bh=5FnAfw771S1f645aUOF/G9AknlHEsp37eG6RbnedW0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLObWZdIvlGqnJujhhifV+111HBmmFHqq5cYoHPHOzX6yQApx/6sbSUEgb76OjnuvXW/QsS1sziUd/dg8qnm8H0OIGqmqzhjC8q8PZYozMcnvNyBCjlgqPjHiQnpAmgANR1xyXQjMbmBsc+aFoCbvHT3m54qZy0DlsWBZpeu2Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tc1oMOgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVLwn68i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tc1oMOgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVLwn68i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Os5d2752268
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HbORuw32mJtlyHlMUmui1fS/
	h6DkAg7PrVYgntu7FXM=; b=Tc1oMOgfbiXElQxQwZIvTJyaB9q6nu/Ack+xkzjt
	FFwgtY6/uDP1mtVIMFMy5CNBA1a15EN0DH70/Du5ToCbdzJGqAyh+u0vp77yycik
	aXn/UABCMaoEPVikdXHnbqgGEg88iO8u37wl+Qajl2cy/6TUqldBwe+HWq18H7z9
	vMG5dB01VTcqvOJ88IvqhEXWXKb4AP3J4VSq0Mn8WpybQT9NPlXguHGUz9Evi5Qn
	sp51095iZzfsMDlAJ20MFDAqZFEjQR6SV9LdckqT8NBe3axnFUCoHDqxUQO64ysf
	UGIPFnwYy6VvOQFMJ1MvzqzE7ysszt74v4MNYRNk0mu/jA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gq5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:57:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179a556c43so47731226d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792407449; x=1793012249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbORuw32mJtlyHlMUmui1fS/h6DkAg7PrVYgntu7FXM=;
        b=ZVLwn68ifjnu9SMEo0G8YxCuEzb2L3tbzodsWXXQL/XGuKiMsBNj5XnKf6ekIwaomD
         S0SMC0QJA0e6fVlV/7L1L9xOcpAM15ALNnwLPn6OvdlYBvoSgu0GlbKFGrpuwNJRc458
         6ZDy931KUh+3VvXf4PFXptqnu4aFB4QqAhWv+fQg6thJzaSnxPZfQbNdXB7aXH55KJIg
         X1N94/8jdpzxBUkO+eZI+YAoyECa1RoVb0FPrEfKozPCeG0yCFIZcvEk3CHVCiM94qtW
         HHuo/2s5dCa9ps0tKsDC9/4ae74iXGakThE+Gcr0ebAEPyog5ZmgBlMAd8YvWegEEUZM
         +XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407449; x=1793012249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbORuw32mJtlyHlMUmui1fS/h6DkAg7PrVYgntu7FXM=;
        b=fPPcNBMx/MnAM2fQh8QU9DOkJe7/9SnDVa8mBNgdtreeNWQGnbiyDJVRDfHhWLOVpR
         MK9+NK/4p1rx2xB9pr1cG16ovoQDnHT+ueJar6NsMvUjcz+YYIaKQ5P66aQfBJHe940W
         FsDiE5X0aGQOBWCva7FcgoGwuX5lzMWkNvlZf8QJ7EF8UZfPtvEwrc0GwDF/6+GXDbaK
         2MkTVxvNm71DDwSccUapgHVZoUr3XfjqtAXiqCA3tKNrqXp0zxw3/W7/LoR1psW6fAKS
         axcmuz5jjab/BO9rU0miOQSWwOUUEEEISYGALF74vFy+zUWFd/+FvYyt1y5rndL9D6C1
         bnRw==
X-Forwarded-Encrypted: i=1; AKwUvBx6bO8SP2zwYgn2GDByZPbHDCHipygTcUCIjzHgO55+aD1IHUq3kncIrQPOUrhOQk3/by+6IOZEOXckEwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzBBXuIORp2kBE7hPJ+2VQBoAVA1GkHMpxNAkHcs8cXronhluE
	ZxV9qeS/FaTjhkpaKCG2jKNPLie5gLe4GsXI3cBJvrrC3rxSkNcCs7WzN3OoPAIE9uc2ZU2/b8V
	bp42rVkCtPevHtmBD4hnhU6AlTAVeGCVB11eRP3Of5hBnX9Hw4hahhClgT249EMExlqs=
X-Gm-Gg: AYBFou2fa8ng/K7/Mhnu8bydoJ13+eT4SBs2yIByOrHL2b4BCswEaoaIrtBpmqXwa+b
	I574okne73Fi6d/TYSqvTtDN7SFQF8O1D+t+6MkcMupmkG9FrmRQDWbtH66uY8MwBjRdBIdFOHR
	GGVWIDerVG9kd2gJYXR+MR9/MM8aIkLYin5grYJqzfBN+qqEXBErfdFocXO+CgEzh+mzwWBsokp
	KJuvDoR9Iq4Cnb2BwQOcwDes3+cht0bca5OjEur+wnMf5y36D1ZgKSkJVD7di51Ltd7fXOnqJGJ
	8siG95CcBsxWr3tjCcaKfAGS3WuFAwSxoB5ENRG+5nC42VE2FRrdK/vH8x6dJP0wGd0N2O21p4W
	MwQ44WEeM+PH0Trd3
X-Received: by 2002:a05:620a:28c1:b0:93e:7939:acd0 with SMTP id af79cd13be357-93f29d10508mr1240372685a.37.1792407449274;
        Mon, 19 Oct 2026 03:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:28c1:b0:93e:7939:acd0 with SMTP id af79cd13be357-93f29d10508mr1240369585a.37.1792407448596;
        Mon, 19 Oct 2026 03:57:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ec8dfsm23408352f8f.26.2026.10.19.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:57:27 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:57:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
Message-ID: <srwzxkzxbbgtlnhp6nndneoh6wgmfuheryxkaezi3jyps6f23c@jj7bgtezypqm>
References: <20261018-nezha-v3-0-7e8c63903290@mentallysanemainliners.org>
 <20261018-nezha-v3-2-7e8c63903290@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-nezha-v3-2-7e8c63903290@mentallysanemainliners.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MyBTYWx0ZWRfXxlpwvaEgdTfI
 itusJkIPa5jRaFxoRh6aaqib5nzrvvwC38gzyMvU0GAWEcMSFFvOr1k38ZxBOC1UR86eFj7LWuC
 1TWPzk8yXiEaaaVBkmiv66fGnCbRlXk56eGbriU6V0FDcJ1lawpQDloukIkWimat15Bl+vGrX5U
 KZXUcW3CN20yoxnLpf0ziyQgkOh11qxZeV5uNj5u4TCCNmWyv6pi5j+tcvJZiBqefSfdg/wRFdp
 toDZHeROwDj3NnM0TT3hMT15E2MAQVUHrvlIrSELIYcGS/CGbettILU7WHRpeWnEv8Dop42YR9g
 rWi38ZR80vYmCFgTpF8b0UlYzAN0S9vWzDzgSgBCPXFnOpPGarnWtZoxOjmL38BCSjtFiLvn0Hy
 d5qyjmc5JpjTx9S6mHpvUJk9prCFu0dyLkqFiR8TcRTnc54ZYcSDmlWyjyg78rQr+5z0ZKUzpt8
 sUDSQ4/w9J86y+8jrNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MyBTYWx0ZWRfX9MSug+//w89+
 /rdxtXEbQAROQuu+sFVhlL+26tc//+nMnXX9ctzu8cNVh78N95QRBpzClTX8sBCiaykwk29yv3Z
 6TqItjd10c5Ei+Mm9XAj1w2/dIY/oN0=
X-Proofpoint-ORIG-GUID: 9kaEplHEn9Xvf_4kGsc3UEvKqbRiRmJL
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5f79a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=4I5MClDQAAAA:8 a=IHXNap-42Rlxiar0hgwA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=1V3rjZ7Gd4_ILS_TCx9Q:22
X-Proofpoint-GUID: 9kaEplHEn9Xvf_4kGsc3UEvKqbRiRmJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190043

On 26-10-18 11:17:57, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.
> 
> This device's configuration is based on the 'MTP' from Qualcomm,
> as is also referenced in the downstream sources. Apart from the
> usual differences (i.e. codecs, panel), it also uses the newer
> WCN7860 (peach) connectivity chip, which is why WiFi/BT are not
> brought up.
> 
> The difference between the EEA and the Chinese model is the battery
> capacity, notably, the EEA model has a smaller 6000 mAh battery when
> compared to the CN 6800 mAh SiC battery.
> 
> Currently implemented features are:
>  - Booting
>  - Power and volume keys
>  - Storage (UFS)
>  - USB-C Peripheral and Host modes
>  - GPU
>  - Fuel gauge
>  - ADSP, CDSP, SoCCP remote processors
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts    |  20 +
>  .../dts/qcom/kaanapali-xiaomi-nezha-common.dtsi    | 883 +++++++++++++++++++++
>  .../boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts   |  20 +
>  4 files changed, 924 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e00ea..a00871781c8f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -50,6 +50,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-eea.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
>  
>  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts
> new file mode 100644
> index 000000000000..564f22bff203
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-cn.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Igor Belwon <igor.belwon@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "kaanapali-xiaomi-nezha-common.dtsi"
> +
> +/ {
> +	model = "Xiaomi 17 Ultra (China)";
> +	compatible = "xiaomi,nezha-cn", "xiaomi,nezha", "qcom,kaanapali";
> +};
> +
> +// Battery model: BM6N

Use /* */ instead of //.

> +&battery {
> +	voltage-min-design-microvolt = <3200000>;
> +	energy-full-design-microwatt-hours = <25840000>;
> +	charge-full-design-microamp-hours = <6800000>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi
> new file mode 100644
> index 000000000000..941bfe930ddc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-common.dtsi
> @@ -0,0 +1,883 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + * Copyright (c) 2026, Igor Belwon <igor.belwon@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "kaanapali.dtsi"
> +
> +#include "pm8010-kaanapali.dtsi"     /* SPMI1: SID-12/13   */
> +#include "pmd8028-kaanapali.dtsi"    /* SPMI1: SID-4       */
> +#include "pmh0101.dtsi"              /* SPMI0: SID-1       */
> +#include "pmh0104-kaanapali.dtsi"    /* SPMI1: SID-9       */
> +#include "pmh0110-kaanapali.dtsi"    /* SPMI0: SID-3/5/6/8 */
> +#include "pmih0108-kaanapali.dtsi"   /* SPMI1: SID-7       */
> +#include "pmk8850.dtsi"              /* SPMI0: SID-0       */
> +#include "pmr735d-kaanapali.dtsi"    /* SPMI1: SID-10      */
> +
> +/ {
> +	chassis-type = "handset";
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +	};
> +
> +	// Without this node, the bootloader will get mad and reject our dtb.

Use /* */ instead of //.

> +	chosen {};
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <76800000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;

Is this not 32764 ?

> +			#clock-cells = <0>;
> +		};
> +
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			#clock-cells = <0>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +		};
> +
> +		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			#clock-cells = <0>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,kaanapali-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	reserved-memory {
> +		/*
> +		 * If we do not have this exact region with this exact name
> +		 * present, the bootloader disables the display panel and
> +		 * for some reason it cannot be re-enabled.
> +		 */
> +		splashmem: splash_region {
> +			reg = <0x0 0xfc800000 0x0 0x2b00000>;
> +			no-map;
> +		};

This adds a new dtc warning (unit_address_vs_reg).

Please add the unit address: splash_region@fc800000.

> +
> +		/delete-node/ pdp@81300000;
> +		pdp_mem: pdp@81200000 {
> +			reg = <0x0 0x81200000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		/delete-node/ adspslpi@a1400000;
> +		adspslpi_mem: adspslpi@a1400000 {

No need to delete and re-add. Override of reg values is enough.

> +			reg = <0x0 0xa1400000 0x0 0x5580000>;
> +			no-map;
> +		};


> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id = "B_E0";
> +
> +		vreg_bob1: bob1 {
> +			regulator-name = "vreg_bob1";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <4000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob2: bob2 {
> +			regulator-name = "vreg_bob2";
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <3552000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1b_1p8: ldo1 {
> +			regulator-name = "vreg_l1b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l2b_3p0: ldo2 {
> +			regulator-name = "vreg_l2b_3p0";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3048000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l4b_1p8: ldo4 {
> +			regulator-name = "vreg_l4b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l5b_3p1: ldo5 {
> +			regulator-name = "vreg_l5b_3p1";
> +			regulator-min-microvolt = <3100000>;
> +			regulator-max-microvolt = <3148000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l6b_1p8: ldo6 {
> +			regulator-name = "vreg_l6b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l7b_1p8: ldo7 {
> +			regulator-name = "vreg_l7b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l8b_1p8: ldo8 {
> +			regulator-name = "vreg_l8b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l9b_3p3: ldo9 {
> +			regulator-name = "vreg_l9b_3p3";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_1p8: ldo10 {
> +			regulator-name = "vreg_l10b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l11b_1p0: ldo11 {
> +			regulator-name = "vreg_l11b_1p0";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1292000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l12b_1p8: ldo12 {
> +			regulator-name = "vreg_l12b_1p8";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l13b_3p0: ldo13 {
> +			regulator-name = "vreg_l13b_3p0";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l14b_3p2: ldo14 {
> +			regulator-name = "vreg_l14b_3p2";
> +			regulator-min-microvolt = <3200000>;
> +			regulator-max-microvolt = <3200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l17b_2p5: ldo17 {
> +			regulator-name = "vreg_l17b_2p5";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_1p2: ldo18 {
> +			regulator-name = "vreg_l18b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "D_E0";
> +
> +		vreg_s10d_1p0: smps10 {
> +			regulator-name = "vreg_s10d_1p0";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1d_1p2: ldo1 {
> +			regulator-name = "vreg_l1d_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1256000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l2d_0p9: ldo2 {
> +			regulator-name = "vreg_l2d_0p9";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <958000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l3d_0p8: ldo3 {
> +			regulator-name = "vreg_l3d_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l4d_1p2: ldo4 {
> +			regulator-name = "vreg_l4d_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E0";
> +
> +		vreg_s6f_0p5: smps6 {
> +			regulator-name = "vreg_s6f_0p5";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <570000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7f_1p2: smps7 {
> +			regulator-name = "vreg_s7f_1p2";
> +			regulator-min-microvolt = <1224000>;
> +			regulator-max-microvolt = <1372000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8f_1p8: smps8 {
> +			regulator-name = "vreg_s8f_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1f_1p2: ldo1 {
> +			regulator-name = "vreg_l1f_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l2f_1p2: ldo2 {
> +			regulator-name = "vreg_l2f_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l3f_0p8: ldo3 {
> +			regulator-name = "vreg_l3f_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l4f_0p8: ldo4 {
> +			regulator-name = "vreg_l4f_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "G_E0";
> +
> +		vreg_s7g_0p9: smps7 {
> +			regulator-name = "vreg_s7g_0p9";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s9g_1p0: smps9 {
> +			regulator-name = "vreg_s9g_1p0";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1g_1p2: ldo1 {
> +			regulator-name = "vreg_l1g_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l2g_1p8: ldo2 {
> +			regulator-name = "vreg_l2g_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l3g_1p2: ldo3 {
> +			regulator-name = "vreg_l3g_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l4g_0p9: ldo4 {
> +			regulator-name = "vreg_l4g_0p9";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "I_E0";
> +
> +		vreg_s7i_0p9: smps7 {
> +			regulator-name = "vreg_s7i_0p9";
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <972000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2i_1p2: ldo2 {
> +			regulator-name = "vreg_l2i_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l3i_0p8: ldo3 {
> +			regulator-name = "vreg_l3i_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l4i_1p8: ldo4 {
> +			regulator-name = "vreg_l4i_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +			RPMH_REGULATOR_MODE_AUTO>;

Indentation is wrong on this line.

> +		};
> +	};
> +
> +	regulators-5 {
> +		compatible = "qcom,pmh0104-rpmh-regulators";
> +		qcom,pmic-id = "J_E1";
> +
> +		vreg_s1j_0p8: smps1 {
> +			regulator-name = "vreg_s1j_0p8";
> +			regulator-min-microvolt = <400000>;
> +			regulator-max-microvolt = <1000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2j_0p8: smps2 {
> +			regulator-name = "vreg_s2j_0p8";
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s3j_1p2: smps3 {
> +			regulator-name = "vreg_s3j_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4j_0p7: smps4 {
> +			regulator-name = "vreg_s4j_0p7";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-6 {
> +		compatible = "qcom,pmr735d-rpmh-regulators";
> +		qcom,pmic-id = "K_E1";
> +
> +		vreg_l1k_0p8: ldo1 {
> +			regulator-name = "vreg_l1k_0p8";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2k_0p7: ldo2 {
> +			regulator-name = "vreg_l2k_0p7";
> +			regulator-min-microvolt = <700000>;
> +			regulator-max-microvolt = <1000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3k_1p2: ldo3 {
> +			regulator-name = "vreg_l3k_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4k_1p0: ldo4 {
> +			regulator-name = "vreg_l4k_1p0";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5k_0p7: ldo5 {
> +			regulator-name = "vreg_l5k_0p7";
> +			regulator-min-microvolt = <700000>;
> +			regulator-max-microvolt = <1000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6k_1p7: ldo6 {
> +			regulator-name = "vreg_l6k_1p7";
> +			regulator-min-microvolt = <1700000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7k_0p7: ldo7 {
> +			regulator-name = "vreg_l7k_0p7";
> +			regulator-min-microvolt = <700000>;
> +			regulator-max-microvolt = <848000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-7 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "M_E1";
> +
> +		vreg_l1m_1p0: ldo1 {
> +			regulator-name = "vreg_l1m_1p0";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p0: ldo2 {
> +			regulator-name = "vreg_l2m_1p0";
> +			regulator-min-microvolt = <1096000>;
> +			regulator-max-microvolt = <1104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_2p8: ldo3 {
> +			regulator-name = "vreg_l3m_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_2p2: ldo4 {
> +			regulator-name = "vreg_l4m_2p2";
> +			regulator-min-microvolt = <2200000>;
> +			regulator-max-microvolt = <2200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6m_2p8: ldo6 {
> +			regulator-name = "vreg_l6m_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p8: ldo7 {
> +			regulator-name = "vreg_l7m_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "N_E1";
> +
> +		vreg_l1n_1p1: ldo1 {
> +			regulator-name = "vreg_l1n_1p1";
> +			regulator-min-microvolt = <1096000>;
> +			regulator-max-microvolt = <1104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2n_1p2: ldo2 {
> +			regulator-name = "vreg_l2n_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3n_1p8: ldo3 {
> +			regulator-name = "vreg_l3n_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4n_1p8: ldo4 {
> +			regulator-name = "vreg_l4n_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5n_2p8: ldo5 {
> +			regulator-name = "vreg_l5n_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6n_2p8: ldo6 {
> +			regulator-name = "vreg_l6n_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7n_3p3: ldo7 {
> +			regulator-name = "vreg_l7n_3p3";
> +			regulator-min-microvolt = <3304000>;
> +			regulator-max-microvolt = <3304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/kaanapali/Xiaomi/nezha/gen80200_zap.mbn";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +
> +	bq27z561: fuel-gauge@55 {
> +		compatible = "ti,bq27z561";
> +		reg = <0x55>;
> +		monitored-battery = <&battery>;
> +	};
> +};
> +
> +&pmih0108_e1_eusb2_repeater {
> +	qcom,tune-usb2-amplitude = /bits/ 8 <0x1>;
> +	qcom,tune-usb2-disc-thres = /bits/ 8 <0x3>;
> +	qcom,tune-usb2-preem = /bits/ 8 <0x2>;
> +	qcom,tune-res-fsdif = /bits/ 8 <0x7>;
> +	qcom,squelch-detector-bp = <(0)>;

<0>;

> +
> +	vdd18-supply = <&vreg_l15b_1p8>;
> +	vdd3-supply = <&vreg_l5b_3p1>;
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/kaanapali/Xiaomi/nezha/adsp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/kaanapali/Xiaomi/nezha/cdsp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_soccp {
> +	firmware-name = "qcom/kaanapali/Xiaomi/nezha/soccp.mbn",
> +			"qcom/kaanapali/Xiaomi/nezha/soccp_dtb.mbn";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <28 4>,  /* Unknown */
> +			       <36 8>,  /* Secure NFC */
> +			       <74 1>,  /* eSE */
> +			       <119 1>, /* SoCCP */
> +			       <144 4>; /* CXM UART */
> +
> +	key_vol_up_default: key-vol-up-default-state {
> +		pins = "gpio101";
> +		function = "gpio";
> +		output-disable;
> +		bias-pull-up;
> +	};
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 217 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1200000>;
> +	vccq-supply = <&vreg_l4d_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l4g_0p9>;
> +	vdda-pll-supply = <&vreg_l1d_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb {
> +	status = "okay";
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&vreg_l4f_0p8>;
> +	vdda12-supply = <&vreg_l1d_1p2>;
> +
> +	phys = <&pmih0108_e1_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l4f_0p8>;
> +	vdda-pll-supply = <&vreg_l1d_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> +
> +&usb_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts
> new file mode 100644
> index 000000000000..996bb52c37be
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-xiaomi-nezha-eea.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Igor Belwon <igor.belwon@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "kaanapali-xiaomi-nezha-common.dtsi"
> +
> +/ {
> +	model = "Xiaomi 17 Ultra (EU)";
> +	compatible = "xiaomi,nezha-eea", "xiaomi,nezha", "qcom,kaanapali";
> +};
> +
> +// Battery model: BM6P

Use /* */ instead of //.

> +&battery {
> +	voltage-min-design-microvolt = <3200000>;
> +	energy-full-design-microwatt-hours = <22860000>;
> +	charge-full-design-microamp-hours = <6000000>;
> +};
> 
> -- 
> 2.56.0
> 
