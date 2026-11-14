Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668399;
	b=lnQmTquIyk767raSeOF2WolStmTYj7DdlSdoZzrl0g5l+q2jgVJUauXTnGm3ZsEemSLE
	 3SaGZvJfvzLGLvh18DTBouJ5CylDGyeph9QTHhW13Y039wie4eEk6iBzQW0qmV2tJcbMS
	 cnHPoPBmbZ9HWrJT19hYT5SrOOErao6DkRciIxcVm2S6NkxvqEiFRHivJPrVmTZVZDQMz
	 Xn9nvPcgux583h4Yhi+/zQHOLLGsxAr3FC4oYnfg/UwmKkisuzoag++PF/bo2Xgg0PfAM
	 oPq60/PKuLMTwotfo3xwVFjzKppg+BwzgbbXAxgSLntqh11OPM4UvxyU63IE77OAd9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ermhl1UnR3P1jf8QpCjJHMO6YvKRqIFQzxy0bketdpI=;
	b=ScSGh/oJZSxyxoXIz0+4z2+optbnORYJJ0he03gP3V51n8Qg9mfz6KnYynMIkP84o6sQ
	 Dzu5yaR7fN68TQGVgnK0sK0xlXcu814YXLZO6TCyqOz9cJyt6w7nkQ57PCSoLk6sOxN3F
	 j5uHugSrjj3DNU7SXxPHWtX2KgbBz3zRXjGDAYY6yOFs3AN2iV9cP0twHz4SGFGi36gaq
	 oTFZITQZDQEHWS0kiZ/2fjsNKim9RQGn7fz+IpsDm4KFlonG1WVe6BylzBrYsBvLwxAv6
	 tWR7WxIT+XUaQmH+1G8izfgipH1M2ZYqKz1FFNKD0p69f7M7QwhQcYC8aYxnlS3ayKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pdej1VQE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRMWiWrv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06BC606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06BC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pdej1VQE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRMWiWrv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkPQo3740766
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ermhl1UnR3P1jf8QpCjJHMO6
	YvKRqIFQzxy0bketdpI=; b=Pdej1VQEnn2+mYSUcjY//NAub99DoiBmvj+7+/+l
	g8N9LFt2QSsBA8PBOFsOAaxOFexhOtFjvTXlTKrrTXTrU2ss7CB/b5r5eSz0gTBt
	/nr1MUkI7zP+u44y/ES4N0VF21vDQfdU+AA0EMkSZypSfBcDk56ESxg8xC8goCLo
	bl2rOArij3bhITmVkDVgL4vT+Yisfnt9TZ4cfJe6LIjqiOdS149fmCNT8JPr2IXC
	8LxNUxTZkcrhx4JSJz5+Rzji1DHmEqJMF3Ir+8ycRQFy0dsZzSQz+WHhSLkSsvv/
	6v8g1fWd8iHoxeT3RScAB8t5tyEbnSwWqgMmNDOdKmZbLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqh4gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:59:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso432575085a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794668397; x=1795273197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ermhl1UnR3P1jf8QpCjJHMO6YvKRqIFQzxy0bketdpI=;
        b=YRMWiWrvtnl0zJ7iECs/TfKj/hOBPz0TBHlTYYRo6YXGE5BBed1gbIWPl5p7n6rttT
         JvH3I5OeJRPTS2+Bu0ju67LbsLv2wid7C/KRxB5W9jFPZFqYw0dbuMQIQAJhrFsZylj0
         VhoyMlAtR+rqOjTd24ZTuSsporwpOU/NZ+LbGowdIQT3+miITOaCTfg29EvWDwJuWXr7
         cvdrvv+GriJVpCPah45gMMDcll+rExCJyWqW0k5SttGNfnQjT3pbkaXOnUQb14qck0nI
         7ZXqtUDc2r8AGmnM36PP+c4CGEWKBcZReA6lPsVIhLAt3u8HccOYVPa0U9dQTeEL7GaV
         pWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668397; x=1795273197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ermhl1UnR3P1jf8QpCjJHMO6YvKRqIFQzxy0bketdpI=;
        b=eJV8UsAPFmJUXIgXUaMqMjeuohfrCjfC/D7ve4H7kzhOCubdFRuf794fw6frI1m6aB
         Ue8VVO3NrlTgY9Vx81k2JWDohAAhtprzXlIaFnraAUyDsDF4ZOvIHh4LlhwDrcoHK71s
         H3jbJwMDF8UUtKLks+QcbNGATKWxzv6YZbFm8Y9/SdVKinrKF5fIR31GOslDueddUgeu
         7V2PpC7snX/BnJ8EDOBHhHN8v4RNYCf/8+NEY4m8cDqjw6l7ZjcEe06XycYZeayNlV5m
         dALAbfr/mNK+49LXRgxMp6cAM5FK9nfbbZQIWwGuMT5wv6XsE73q99WK0H2H6vnDt5m1
         qQUg==
X-Forwarded-Encrypted: i=1; AL+hErHc1KVJLRfWOvJIvGG8GQwwo55OxPbvKQf1CruwCXjacXpZdzR4tk9eC9/x08+8Ykfcm0OD/xfbIa3dvlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z967z8+htWD6PmglGDcSBeUg2SsLfID9PKIrOTyYZRcF1dVF3/y
	TEKbBZADfKvho6mst9ZYKQ4/N+BIHmwVRngRn8/nehdp8qr9AlrLnMvx/GJWA50DgWOznHzQNcq
	+mPiHpY85wJBtzO6r8WVyrqPtAMUkYwhLLQK81SCavYQk+9NbGvVukkII4J2gIYmqA3A=
X-Gm-Gg: AYBFou2c5KDpVq2uiaT0zs4O7E1xuBFuHkbWwdLfLSggLEri9Fyqr0TzgCNZKeMrOZh
	Iw4NVPSr+GRX+6Cu+0vvK1JjGm/FrIPX+V4p0SX2b/AH66ZpzVhF4rBXVygftuE1agBRVjSGvqz
	RG37OsU42S8qXIQcmKrSluh9DzrZS9UhsJawxNV6KG3B5oJrhcps9/C80UYJLDPljftxUdzHIZ9
	A7YxOjpEMPsNqNfjSpohF9S55Ojr/hAYXTCwe/X0eKsdxAWRUfGQ+guHlk0GqwpQvSeGbVJlbHn
	DLTQoDp3ADWCcCHLpO0T78euGFXjVY3S2VafwjCALPf3/icrHljmweoipgOvE0PSzvvJpMHS+ZM
	+xkm520NMaflt16G+87+D2qzf9cnRCK528anvR5AtBonkkvhN+7Z/p4Al14XSvkPY
X-Received: by 2002:a05:620a:6e94:20b0:949:6775:4701 with SMTP id af79cd13be357-94967754f7cmr147769585a.10.1794668396472;
        Sat, 14 Nov 2026 06:59:56 -0800 (PST)
X-Received: by 2002:a05:620a:6e94:20b0:949:6775:4701 with SMTP id af79cd13be357-94967754f7cmr147767385a.10.1794668395806;
        Sat, 14 Nov 2026 06:59:55 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm9418283f8f.20.2026.11.14.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:59:55 -0800 (PST)
Date: Sat, 14 Nov 2026 16:59:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Message-ID: <3zuyqwfbdeknuwwuvdapvzrjzqszl7ccqqbeh5d6zw6ttytfef@fdsovauudm6j>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
 <20261113-qn10-v1-2-e09b2aa7ccbe@oss.qualcomm.com>
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
In-Reply-To: <20261113-qn10-v1-2-e09b2aa7ccbe@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af8776d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LzQT_OLw-VgoSYaWdPYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX+NzTvvk53UbV
 Ksk6CZXKzr5XQAp6PZTC+r1H4PnSiCubmNaym3a+rR5gnxrqaaO+gMu7IbzMnzNAEbQSy7wktO+
 c36pwSHIhs+TporSpZLqLBE51x5AOmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX0FKiO5lz6o7l
 ZDPPFKNRSbCGw0nNqFS/2tDMW/zeuORR7noMSobOWgi0P5ovmdAILZDGdr4WFbKPC8xIet0Ch9n
 wIIsdomfyjzZBr9V4XjlxrX1g65LlubpsvcfWgIiWPi3lGzpBp3Mhxk54yIW26w2gh6JcSlIa5T
 JGRQ/sE0aOsqkKPo1hbPpJBICceEHUQolOlMYBiQBqha0Bb1ozFhor/rywyOZWBGI7kwMy1Tn/N
 fr57/pqMPsp9jq/ajboz4MIE3vMrIYKuvw35rj8TtCTpu8BzCybrJWYB5YwpvnGhpbiFV0mhcEP
 FMoe00AQwF+rZFAytyRMTQQxYFveusFQT5f7fwtDEeBaklArwbNX8SFjAF82EHzyp9BZ4qyEi41
 y9fPkf45kLl3TbQw6jXnRdvRTHv8/+Ri4/ARjvIrmTDD1Qm3vKqWSlQo6epBHdHFuP987iS158F
 PxSUq6bEj0KcE86oaiQ==
X-Proofpoint-GUID: C9WRE1PU0izOEBjQ2QySRybXJqM0402s
X-Proofpoint-ORIG-GUID: C9WRE1PU0izOEBjQ2QySRybXJqM0402s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 22:28:26, Bjorn Andersson wrote:
> The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
> Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
> CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
> of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0,
> 2.5Gb Ethernet, three USB Type-C ports, four USB Type-A ports, and HDMI
> output.
> 
> The HDMI output is driven by the eDP output through a PS195 HDMI
> converter. The four USB Type-A ports are connected to a GL3590 USB Hub,
> on one of the USB MP ports. The Ethernet controller is attached on PCIe.
> 
> Introduce the DeviceTree for this board.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 670 +++++++++++++++++++++
>  2 files changed, 671 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 8329c06b60a3..ff38c562f78d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-ascent-qn10.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts b/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
> new file mode 100644
> index 000000000000..d61caa2b5022
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-ascent-qn10.dts
> @@ -0,0 +1,670 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur-cob.dtsi"
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +

[...]

> +	wlan-connector {
> +		compatible = "pcie-m2-e-connector";
> +		vpcie3v3-supply = <&vreg_wcn_3p3>;
> +		vpcie1v8-supply = <&vreg_l15b0>;
> +
> +		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&wcn_wlan_bt_en>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_pcie_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&pcie4_port0_ep>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				m2_e_uart_ep: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&uart14_ep>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&rpmh_vregs_b_e0 {
> +	vreg_l8b0: ldo8 {
> +		regulator-name = "vreg_l8b0";
> +		regulator-min-microvolt = <3304000>;
> +		regulator-max-microvolt = <3304000>;
> +		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +	};
> +};

This is in the wrong spot. Move it under remoteproc_soccp.

> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gmu {
> +	status = "okay";
> +};

Reverse the order of these two nodes.

The rest looks ok, so with the two above fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
