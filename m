Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862165;
	b=vnNkRTbAibvkVpy9dAD41qQHJ+GuALppTGuia22Gc+9mA2cB7xqzaLLK1A8mwaLDXPwO
	 6UXFsA3Y1Rm32yqeletqlbDvPIXSu6XNcixrsEFja/U1kWq0FMxXMVj3AaArOdW/Hg39m
	 TJRQ9ahuIYqF7XGLgd8xSKfJ4zXAHyon1a/Thhe41w4rtXtbiqvTdLny0f+I8wW690fpH
	 +T7qGNdwMdk12cXv2fquy0A9uUqrjzAjPnIQbTr4EsFfca0z/WPig66H3r3rS2z7ArPti
	 c7fss6RnsaNKP6/RHSC1Azhpehvd6VyDiSfbqzhJ1hlLLj6HUUGDFffL55HuE5tLoqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=;
	b=cGwm0x0GlKL5t9VWH0G9JwYAmRS3+N672vBlzy768lUWzumkEAn//FCNl7OckJQRwiKJ
	 MEg7k7p7TsscALBsW1T8zJV4XAkhBSGF++/+SAF7e4DIAnMOj4AVjtCjSpPGM9SLIqRq5
	 VJICfo7QBMLpavuJyOzkh9dUAk8qxgwJAdVYLa30OEjfM3qDRkH4Uxs3uK3+7mSYX6+sK
	 Xn7lQDIyotKafUNJIN8Uc0KTzn0EwPIANKIdNH3Xx+w3GSQGDqKQo3r1/b40dIZmEe5el
	 8h3dqtg3aJOTYIL4q5o9VqJjdlvUcod+S8jKFNygcdcU5C2DePba8cdWHAdLGB+U5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HaTRmN9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Yd/ZOfK6";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA11606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA11606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HaTRmN9m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yd/ZOfK6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56TpCq4138156
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 07:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=; b=HaTRmN9mgQns1ziY
	GryUaCo1bcgp/beaRFEQbm9a8noMrVMpnKC5MuZk4ymkHzvKnsr1XLOXM8vfwUkS
	REKlpJPVjr/FPDNd7yJ/nos60C9u9E7Lco6GL452/3R9I+owJuJq21Mf5SL3oAu0
	/rlqSBERS7z/HFlQdedMnZjxFg6hiLzC/dJc8MmNgUlbvsmeFpaf6e+fwrphUevL
	VX5npKNn6WkEjOSWDamFEiSvukAic5BT3bByKkdeAKC6CLbvIV2yjXj1zEwWQP5X
	LacGlIqGgbYOErOKOdFKv/O1MHwUlnJVlDlzHywmT03l5YzZL7QfYdU9OHA0fSZO
	8hfXwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v06fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:02:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08be1c84so23337475ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793862163; x=1794466963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=;
        b=Yd/ZOfK6xMElJxhS8L4XWRmVE4grAzi1CFKlprDeJBuZMxDM7oa0Z7BgcCuIvWbH7e
         xArh5+hZyD6YcGuncSq6cBthmvz22tgPfWW9yeS0JwciVfijGPY47XrKu2QaDK6rIDOR
         YBN/NHPSU4JBJzpo0jXQh3SI9UbDr4Om+aaRZeovVxqR88KymKKTzRCDn8iDD8hYRDSW
         6fgM+ZJblEfKSQIH7DU9tv5FKWKWTcjVM/XtKJiZ67q/sLC0Xo9nMgtR5JG6CB9hkZ9d
         a7Un30JfGc9uWlfugHCJafj6xsg3kV9VuL9XMsHYQoRQaIzeCAdsmYMyj7fL71dBS/q3
         lwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862163; x=1794466963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up0BSC+gGD3bqKoHXKxOsgvvCI5jPh02tY5XUosqXqc=;
        b=OYfFEG14KHdvpX7d9DDpS4datZWr1ABZNxxFQYuYsr6thjYDlAq4DlcKKa8lKECmN7
         YbaLMpbIOPIbu5jfxj3p7oUjkQkZDnvfPBjXT7jaoVLc9dyMiz/t70O5ucanFzZOCuJ3
         wJLL84QswlqxD5tWUHufOzOrtCSFIiWWeg/eVyOhs5A+eFnkCDJgp4A5c/3lKdpf66Z+
         55G57Lmy3I2cw/WKBCcHOPD+HuWGXkBSkB0XPN5pKELxvXYZEYDh9e845MwPTa6RzCuU
         +U0OwB9ZN/195RSVQ2G7/ZefxM9pegQ4cmbeGytVZFl+Gd5q1sSvkg4+Bht/ddPK0eN+
         NWrg==
X-Forwarded-Encrypted: i=1; AKwUvBz4YqWLDPAXFCl34PCdAAKdYnM2iq4UEY4aUhDZ+ccVQ6vq7oKn3o0GBkQ82IpFJi2r7iTrfdNGjsybUWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KVdL+k9UHnwdHJpOLFsL917jFdmFgWDxlkH1knfLVrboGNpl4
	kLTRAM03+vDPHFbQ59+/j4HbmlK8vSXzyUnwkff/wO2CCiPRiGh4SkQrBrwZUN8jccBLcUAPkuu
	N52cGEw5zYN7FOX+y4I3iOVn8i0HEC/mYfxOMy/WoXAb5Ds9vHISU3T/Xs8cnVFKgtJs=
X-Gm-Gg: AYBFou2vmo7b7oxsP81mjk9AFzv/RGdZGOQ/gDxvD6QAyianWLPc+uh99lyk00QnNZe
	jb9pETFl6p9SpP8xq/fu2/GGHaTj4PVB6pnL3WkfpJus2NOiZaFhzcSP/z0TApwK32+L7ehOQlp
	CgEd10Se0S4kzNO50XGicvNI4NGBENFDo2ek3MbXCE7GMIJfBezelR6Css6Ok/5ibWNVKrmuHY3
	FWZv6/xGfa7J0sLzLNdkxGfzw8VntDVl1CxNjeto6f3rQ9ZitpGbeteCBmI/CmDe+KPNbvzusFw
	jyFQxjucfa/aoHjTR2SjzeUVYw4kkTjcHsy6Iae032luQZktvMFNgC97Oqyr8hSJ5OuB2ukkQHY
	LO2WuBkNsIQ82MaVPL/T9dSt+HCW3werMWLxt1cE6fKOT+ShMYw11obqjWdaiwO2NuQWA9gkU0y
	A3GCkARdXtz+Eub9sUQkSXuSMC8Sim0i2BwY3+d7D9upKFnQ4+O3JfYgAeNtMrBd6IZiU=
X-Received: by 2002:a17:903:1c1:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eb364941e6mr160055715ad.13.1793862162888;
        Wed, 04 Nov 2026 23:02:42 -0800 (PST)
X-Received: by 2002:a17:903:1c1:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eb364941e6mr160055495ad.13.1793862162370;
        Wed, 04 Nov 2026 23:02:42 -0800 (PST)
Received: from [10.79.117.66] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e5fsm14061475ad.23.2026.11.04.23.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:02:41 -0800 (PST)
Message-ID: <649f57c9-b1ff-4b59-8be8-a701bf393cc8@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:32:36 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <20260929-kuno-soc-support-v7-2-530f62dc4020@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-2-530f62dc4020@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyNyBTYWx0ZWRfX3qtdoPJ1KrFm
 xxvJMoQEMTg30VEQ0S4bZAMAvnNqEIJh/x9mGh5YdQqTeIGimXAY3Dmkxyypeu0v8dwoiAAIHvL
 BL/oLxdzK8kD9Er3iC5BtHwslYVBW5Y=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec2a13 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=RjJHtU_CfQutE43OvKQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyNyBTYWx0ZWRfX5dnlJNbt+DDX
 O166xmsHHjGz/+3B+K0T7QIW+3U7AfmMsX9u+N5KJwyUQp4AYxN6KQ2i2MDmFyCbV31wFkkxtxv
 68daLFvtxa3txwQjKcOqW8XLwg3cWBWpxM/LyCEg4L/xfYv4TQGlehdMPLgejPcIGLpLY9I4QDM
 oJuPturjjhwurMB3YXCSNx3UuHyJ4JwQlNDIefbGKM82mj1aUBb1yIRLhZu+KqudnPKHEdTaxdn
 PXYqg/yjX9U0aThTYLKWHOaqNsryIiVWooCv/jrygmnlsSYbUFjz3+kIOgROhYHdfrW+x47pQe7
 VGEeCFQBIol4vKLPchTjigCDQekmOpQUZbl9cWyav5YDCLChkh929Mq65SEmRFmKZDRenayWPPI
 jNdLqIecnBSPJW8l5fr5Xn+BCGoaaw9efGeC+Sb48UGbL+Koh5vTTl/gH8CuL1GiTTDga7FUZ8v
 zEuqpcGaZGsLvk34M7A==
X-Proofpoint-GUID: j8vSlCgr5thuwMksVk0QjBfa6zI1svN6
X-Proofpoint-ORIG-GUID: j8vSlCgr5thuwMksVk0QjBfa6zI1svN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050027


On 9/29/2026 3:18 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>
> Peripherals included in this initial set:
>    - Single Cortex-A7 CPU with PSCI idle states
>    - RPMh RSC with clock controller, power domains, and BCM voter
>    - GCC (Global Clock Controller)
>    - TLMM pin controller (110 GPIOs)
>    - Interconnect (aggre-noc, cnoc-main)
>    - GENI UART console (QUP SE3)
>    - SMEM, hardware spinlocks (TCSR mutex)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>   arch/arm/boot/dts/qcom/Makefile          |   1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts |  25 ++
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi    | 444 +++++++++++++++++++++++++++++++
>   3 files changed, 470 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 026d5b682b2b..7327a7b8180e 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>   	qcom-ipq4019-ap.dk07.1-c2.dtb \
>   	qcom-ipq8064-ap148.dtb \
>   	qcom-ipq8064-rb3011.dtb \
> +	qcom-kuno-idp.dtb \
>   	qcom-msm8226-microsoft-dempsey.dtb \
>   	qcom-msm8226-microsoft-makepeace.dtb \
>   	qcom-msm8226-microsoft-moneypenny.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
> new file mode 100644
> index 000000000000..c2f6650d3fe6
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "qcom-kuno.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Kuno IDP";
> +	compatible = "qcom,kuno-idp", "qcom,kuno";
> +
> +	aliases {
> +		serial0 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> new file mode 100644
> index 000000000000..9b111525e12b
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
> @@ -0,0 +1,444 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,kuno-gcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&little_cpu_sleep_0>,
> +					  <&little_cpu_sleep_1>;
> +			power-domains = <&cpu_pd0>;
> +			power-domain-names = "psci";
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			little_cpu_sleep_0: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "standalone-pc";
> +				entry-latency-us = <350>;
> +				exit-latency-us = <450>;
> +				min-residency-us = <1774>;
> +				arm,psci-suspend-param = <0x40000003>;
> +				local-timer-stop;
> +			};
> +
> +			little_cpu_sleep_1: cpu-sleep-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "pc";
> +				entry-latency-us = <550>;
> +				exit-latency-us = <750>;
> +				min-residency-us = <6700>;
> +				arm,psci-suspend-param = <0x40000004>;
> +				local-timer-stop;
> +			};
> +		};
> +
> +		domain-idle-states {
> +			cluster_sleep_0: cluster-sleep-0 {
> +				compatible = "domain-idle-state";
> +				idle-state-name = "cx-min";
> +				entry-latency-us = <750>;
> +				exit-latency-us = <2350>;
> +				min-residency-us = <9144>;
> +				arm,psci-suspend-param = <0x40000008>;
> +			};
> +		};
> +	};
> +
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-kuno", "qcom,scm";
> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		/* Bootloader will fill base and size */
> +		reg = <0x0 0x0>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +
> +		cpu_pd0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +		};
> +
> +		cluster_pd: power-domain-cluster {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&cluster_sleep_0>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		quickboot@82100000 {
> +			reg = <0x82100000 0x100000>;
> +			no-map;
> +		};
> +
> +		aop-image@82200000 {
> +			reg = <0x82200000 0x20000>;
> +			no-map;
> +		};
> +
> +		aop-cmd-db@82220000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x82220000 0x20000>;
> +			no-map;
> +		};
> +
> +		aop-config@82240000 {
> +			reg = <0x82240000 0x20000>;
> +			no-map;
> +		};
> +
> +		uefi-log@82260000 {
> +			reg = <0x82260000 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa-fw@82270000 {
> +			reg = <0x82270000 0x10000>;
> +			no-map;
> +		};
> +
> +		smem@82280000 {
> +			compatible = "qcom,smem";
> +			reg = <0x82280000 0xc0000>;
> +			hwlocks = <&tcsr_mutex 3>;
> +			no-map;
> +		};
> +
> +		tme-crashdump@82340000 {
> +			reg = <0x82340000 0x40000>;
> +			no-map;
> +		};
> +
> +		tme-log@82380000 {
> +			reg = <0x82380000 0x4000>;
> +			no-map;
> +		};
> +
> +		access-control-db@82384000 {
> +			reg = <0x82384000 0x40000>;
> +			no-map;
> +		};
> +
> +		secdata@823c4000 {
> +			reg = <0x823c4000 0x1000>;
> +			no-map;
> +		};
> +
> +		modem-efs@823c5000 {
> +			reg = <0x823c5000 0x10000>;
> +			no-map;
> +		};
> +
> +		cpucp-fw@82400000 {
> +			reg = <0x82400000 0x80000>;
> +			no-map;
> +		};
> +
> +		xbl-dt-log@824c0000 {
> +			reg = <0x824c0000 0x20000>;
> +			no-map;
> +		};
> +
> +		qtee@82500000 {
> +			reg = <0x82500000 0x180000>;
> +			no-map;
> +		};
> +
> +		trusted-apps@82680000 {
> +			reg = <0x82680000 0x600000>;
> +			no-map;
> +		};
> +
> +		mpss-audio@82e00000 {
> +			reg = <0x82e00000 0x5a00000>;
> +			no-map;
> +		};
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gcc: clock-controller@80000 {
> +			compatible = "qcom,kuno-gcc";
> +			reg = <0x00080000 0x1f4200>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		qup0: geniqup@9c0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0x009c0000 0x2000>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			uart3: serial@98c000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0x0098c000 0x4000>;
> +				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> +				clock-names = "se";
> +				pinctrl-0 = <&uart_console_active>;
> +				pinctrl-1 = <&uart_console_sleep>;
> +				pinctrl-names = "default", "sleep";
> +
> +				status = "disabled";
> +			};
> +		};
> +
> +		cnoc_main: interconnect@1580000 {
> +			compatible = "qcom,kuno-cnoc-main";
> +			reg = <0x01580000 0x19200>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		aggre_noc: interconnect@1640000 {
> +			compatible = "qcom,kuno-aggre-noc";
> +			reg = <0x01640000 0x33400>;
> +			clocks = <&gcc GCC_SYS_NOC_USB_SF_AXI_CLK>,
> +				 <&rpmhcc RPMH_IPA_CLK>;
> +			#interconnect-cells = <1>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +		};
> +
> +		tcsr_mutex: hwlock@1f40000 {
> +			compatible = "qcom,tcsr-mutex";
> +			reg = <0x01f40000 0x40000>;
> +			#hwlock-cells = <1>;
> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
> +			reg = <0x0b220000 0x10000>;
> +			qcom,pdc-ranges = <1 148 6>,
> +					  <9 156 2>,
> +					  <17 164 7>,
> +					  <26 173 1>,
> +					  <29 176 1>,
> +					  <40 187 1>,
> +					  <46 193 6>,
> +					  <52 266 32>,
> +					  <84 249 1>,
> +					  <85 256 1>,
> +					  <86 315 4>,
> +					  <90 43 1>,
> +					  <91 45 1>,
> +					  <92 154 2>,
> +					  <94 158 6>,
> +					  <100 171 2>,
> +					  <102 174 1>,
> +					  <103 23 7>,
> +					  <110 147 1>,
> +					  <111 31 4>,
> +					  <115 175 1>,
> +					  <116 177 10>,
> +					  <126 188 5>;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&intc>;
> +			interrupt-controller;
> +		};
> +
> +		restart@c264000 {
> +			compatible = "qcom,pshold";
> +			reg = <0x0c264000 0x1000>;
> +		};
> +
> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,kuno-tlmm";
> +			reg = <0x0f000000 0x400000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			wakeup-parent = <&pdc>;
> +
> +			uart_console_active: uart-console-active-state {
> +				pins = "gpio8", "gpio9";
> +				function = "qup0_se3_mira";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			uart_console_sleep: uart-console-sleep-state {
> +				pins = "gpio8", "gpio9";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +		};
> +
> +		intc: interrupt-controller@17000000 {
> +			compatible = "qcom,msm-qgic2";
> +			reg = <0x17000000 0x1000>,
> +			      <0x17002000 0x1000>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +		};
> +
> +		timer@17020000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x17020000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			frame@17021000 {
> +				reg = <0x17021000 0x1000>,
> +				      <0x17022000 0x1000>;
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
> +		apps_rsc: rsc@17040000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x17040000 0x10000>,
> +			      <0x17050000 0x10000>,
> +			      <0x17060000 0x10000>;
> +			reg-names = "drv-0",
> +				    "drv-1",
> +				    "drv-2";
> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				     /* drv-1: placeholder (unused) */
> +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS 2>,
> +					  <SLEEP_TCS 3>,
> +					  <WAKE_TCS 3>,
> +					  <CONTROL_TCS 1>;
> +			power-domains = <&cluster_pd>;
> +
> +			rpmhcc: clock-controller {
> +				compatible = "qcom,kuno-rpmh-clk";
> +				clocks = <&xo_board>;
> +				clock-names = "xo";
> +				#clock-cells = <1>;
> +			};
> +
> +			rpmhpd: power-controller {
> +				compatible = "qcom,kuno-rpmhpd";
> +				#power-domain-cells = <1>;
> +				operating-points-v2 = <&rpmhpd_opp_table>;
> +
> +				rpmhpd_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					rpmhpd_opp_ret: opp1 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +					};
> +
> +					rpmhpd_opp_min_svs: opp2 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +					};
> +
> +					rpmhpd_opp_low_svs: opp3 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs: opp4 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +					};
> +
> +					rpmhpd_opp_svs_l1: opp5 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +					};
> +
> +					rpmhpd_opp_nom: opp6 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +					};
> +
> +					rpmhpd_opp_nom_l1: opp7 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +					};
> +
> +					rpmhpd_opp_nom_l2: opp8 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
> +					};
> +
> +					rpmhpd_opp_turbo: opp9 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +					};
> +
> +					rpmhpd_opp_turbo_l1: opp10 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					};
> +				};
> +			};
> +
> +			apps_bcm_voter: bcm-voter {
> +				compatible = "qcom,bcm-voter";
> +			};
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};


Hi Bjorn

could you please pick this patch ?

Best Wishes

Hardeep Sharma

