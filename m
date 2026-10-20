Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484888;
	b=OBDuY6zTIjHURK+bh3qpdOp3380oEwjCQFsassD5vTqTsRcPDOT+QdrnWH+tDy6z15LB
	 2DDYeTHOJTgwf1zD0xW+yJHEITFDMAB5c1JYGWIxcp2HgP8Gz9xleMYySBhoFE2mPmXq6
	 1Y8KxpEXADkZcO+JEf47cALh0vTt5geJRjqmMgc/wJ/QNfBVzSpzmEN439mk5yUdEqS5Z
	 E7xvifUsE6exFRKawSVT7qlENyO6dJ8hcxgFlFkJ6tjMiX00DVRd5reGS68hbGBC4E3HZ
	 kjeE6Gu+5KKGIvGmatf7wQUH4oUt8DSH7gQB9JsZIGfUJbF093ZcyMDo6BxSM5e+z+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=;
	b=nDKHOPdrv/pRBQtQe5jnJSMkhZF6Hccpi1R8uHg31/YIlspkmmcgnsQ3sCG4tp8mOoJI
	 wcfQBC0urfQVlNH1MEU8QKJRBUI5wRB21hQkp8ixtSwlu9jJkJmWo4iVNOGqHxpWV4B0S
	 +sPXPazTuhzQukun8ki1FXJGf5w8XuUq9FGK4KQhD00H2TN/FFhIawKcUXHPyTKOVo+qT
	 CPPMwGvePpK7brFLJhg9qWADmKLqzSl5IDFXIhCFx1V5i5S2HzuHa+W7WMqflDVpwvYRM
	 k4pZmsgVsXCvltb7knPENtzECbEm5XKGK68W7XOnwp9A12nbEisTXqr4ZeiV8rJ9v8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WT/u5oY4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzcXqymI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747B606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7747B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WT/u5oY4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzcXqymI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Q5sk1254855
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=; b=WT/u5oY4quedgaYW
	sNkGzWJBXrGFl58suco6iOTM/CvDjTLebyfUUMjQd3LPvnBUhFAJU66cgBrgsg2X
	JZZyIFO5K9HmA/krlRozcBrmZn/r6kqRh68dgE7YbYLVsQHHWey4l3RpljtWcll1
	U0Dh55ii337z4yqu93Td6M7ZFJshHFAXtOG6Th5fW7lLD5dNppk9rbsjkcKPfc0+
	GZmSE6hXCG5PM/wYBchkExPQff+fwu4YRWYLX7MAB1Oob4lNGJrwz8sWglNKDR5l
	G81za669iwQOjSBwQkhTvGESG6Uz+qxUIRa7HHe4lrr3t9+1e9jl3gD/CnMauaag
	oT9xdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9kv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:28:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so54191685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484882; x=1793089682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=;
        b=GzcXqymIWI+SKVdL/V0UPbFaK4oHd7Zdq5/vCJtBTu/t0ZaUuBKgrLmou/Kw/cjMHJ
         4ob7odx2U69tAp/OuKB0EJRooZ8jBQG0/Zav1oPLy0Ji8ImphyruGKwi3m02H982x9o3
         cwdUpU8O+laxzVbfg1+kPKnmA4OcCUNRyrSialruOkHeoEKclhYIUJrBChtMMTI/wmLD
         7CHvJTBlA4MxFQzTur987COlxTN0Shu17Swg72QnGGWPMWUn6IBm6ZMhpvg3NM2suR5V
         aje1nIYw96V6G1DlRkeTyabVONc1zlTOmsX0ldchljRDvT/wuebM1PM3hRp6bWegNKhB
         HROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484882; x=1793089682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=;
        b=q8dBPu6Qs9hN7jH2LZHisCuIlyiyHPfsVauuPMHk9sBZ4dhgeI7f6NPQzENco5d3B0
         CNgO2l2yaMLe7A5MYUhbk2y8odYXCdhhOPZwrMrEBFVaIvg/Ge1qKfxAvrUwYxnEX5sR
         FTEkJ5bZPag9R4jPUabrzxTYjJ3cuyByVhCz6wXRarapqyq2XOHyVCCSOXty59666/he
         HT7HdfeF5oTSROdEz9C4DIFmjrBg64KNlmyJha5W2UkA/FRH6JwixzWQjf8ODDSlgdUB
         47U5q8XuAfEZ/uBbKRf/qoG5JExsnLi+aIZ8R+6IG7C5DqJQoAITrn5pzw25nl6yF1Zq
         vN6w==
X-Forwarded-Encrypted: i=1; AKwUvByGNoVgKiyHTa7Fb64uPXUvGvv46LEuFoYv+CB3vLfP7lIKkYHJpo0STM3lcfkR+lZcMUKkIgd0ToLzUp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKojtapDjEdAewNapmZvf4EIkuWv8nFutQ7TVG3GyFDtj3p9IcQ
	i6mC6kbDhE+xdgtknAjpeljr2rBaA1QwQRrLVsXz4kwu15LPW3cojQOEQ2EUpuEs74stc4Sbb3s
	5pYTQEH99PR8YhfxJCxcBhvYAov1oRCbHuS4OvdaEGWPk3aZA1rFMuLYIoGf24P4iuKVAFL5nTg
	E=
X-Gm-Gg: AYBFou2AoIOpO6KRzpX4AMhEkpr/hdk8JzTZje3edMFX64SanI2KL+AtO8hOei+fGBX
	JWa56qvVrk213olrgIlg41j5/6dQczB6Vk21VR7nxqAr/JVR89h94k+uImov8Pbl5JBcQGiuKBF
	Wn1Eta591kWTXoMll+EnwIu99hngBKujimMbW2XjtYEQ56WSRivZBkos2j7Nwf7KpIA8XPdl84y
	cUlj0+W0HS+UxUwakbE1y8LmCuSk8B4z51O07EgWbM8ckv9E5ix+DUHEb52O2VNwN9KkEuhBTqV
	KwkaqqGXW5PNVL4fdCrvWDt8DHQ6i0M1jP35PFqVTHeNUBNhI1QCMnrz3IXW56cfq+cKGqhd6bA
	jQIaj3feQRtj9GvoY8n8Z/w==
X-Received: by 2002:a05:620a:c55:b0:939:9205:4d78 with SMTP id af79cd13be357-93f29d39ad8mr1871581285a.3.1792484881630;
        Tue, 20 Oct 2026 01:28:01 -0700 (PDT)
X-Received: by 2002:a05:620a:c55:b0:939:9205:4d78 with SMTP id af79cd13be357-93f29d39ad8mr1871579585a.3.1792484881209;
        Tue, 20 Oct 2026 01:28:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb165bsm451124266b.71.2026.10.20.01.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:27:59 -0700 (PDT)
Message-ID: <3bb9a390-3b5e-4321-a25f-77e4f5c88f9a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:27:54 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g7ZwLuMKGZFfHOhds3-jXY20RnWCG671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX8hdrUD4vXlX1
 aQ7nIgkG5TOM6h1JRLkdc2FJIswNJPwqVHvJx67aesLfBt24cgcqYoxJ6uqkXwchi1STWjzcZ9T
 CL/SodcCieHcP2rfqSK8CjuLeJRkonztlQBUz85tifLkS8IcqKgV6ksKgf3wiEtD3D1qwFodYYG
 bNp/5mH4asLt8F6pFmF2Yqgm/BejQxciltgQ6dXfkx2OpZTdu/ZOHhM8bmStaypVZldQnD4JetB
 T4OMp6cS9CXFx5OEPffL8jEHTGUFp3w7RFUArufJzx/RkcH0LtJYAbB+77yFyj+yzMmHKTpzK1T
 0kobXhNHnJ0W8gK2zCizBfnJzKpZ6ptMgJl0nRXgVTANffygYJUVT6REE7270wY8S57+ccpeIPf
 HJ0UaFAf/COnZRwtebv1ac55yt68J6XEPecqbkrykOlYhOT5fWBB5nSPEZHaC301+KbAeJyewzw
 0jWFt67lUU1JPjgEYow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfXwGzAv8rcZnCe
 tgy356vH5A/tpJJEST07eQLaqquyfqWn156yqS6zngGwVUT0rcsVUoS4VNVytir3HPGiFMDdiMh
 DHdn01F2c6V7dc6ZqbVxOotrlE4IwmI=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad72612 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=u2Fyij-s7XdpVA4p1MkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: g7ZwLuMKGZFfHOhds3-jXY20RnWCG671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/9/26 9:55 AM, Xilin Wu wrote:
> Add initial device tree support for the Radxa Dragon Q8B,
> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
> SC8280XP platform.

[...]

> +	pmic-glink {
> +		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
> +					<&tlmm 49 GPIO_ACTIVE_HIGH>;

Please align the '<'s


> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

Please add a \n before the subnode

[...]

> +	vcc_5v_s: regulator-vcc-5v-s {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vcc_5v_s";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 159 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <250000>;
> +		off-on-delay-us = <150000>;
> +
> +		pinctrl-0 = <&vcc_5v_s_reg_en>;
> +		pinctrl-names = "default";
> +
> +		/* CH7218A needs to be powered on for HPD logic to work */
> +		regulator-always-on;

Does the power supply reference at the connector node not handle this?

[...]

> +&gpu_zap_shader {
> +	/* Reuse firmware from x13s as the SoC is unfused */
> +	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
> +};

Other than the signature, the zap firmware is wholly generic.. I wonder
if we can just add a symlink in l-f to get a generic path..

WDYT +Dmitry?

[...]

> +/* M-key Gen3 x4 */
> +&pcie2a {
> +	/* Place ECAM and BAR space above 4 GiB to accommodate large BARs. */
> +	reg = <0x0 0x01c20000 0x0 0x3000>,
> +	      <0x0 0x3c000000 0x0 0xf1d>,
> +	      <0x0 0x3c000f20 0x0 0xa8>,
> +	      <0x0 0x3c001000 0x0 0x1000>,
> +	      <0x5 0x00000000 0x0 0x10000000>, /* ECAM config */
> +	      <0x0 0x01c23000 0x0 0x1000>;
> +
> +	ranges = /* IO (1 MiB) */
> +		 <0x01000000 0x0 0x00000000 0x0 0x3c200000 0x0 0x100000>,
> +		 /* 32-bit non-prefetchable memory (256 MiB) */
> +		 <0x02000000 0x0 0x40000000 0x5 0x10000000 0x0 0x10000000>,
> +		 /* 64-bit non-prefetchable memory (3.5 GiB) */
> +		 <0x03000000 0x5 0x20000000 0x5 0x20000000 0x0 0xe0000000>;

Please drop this change on the board side, this is SoC-specific.
Likewise for the other ports.

[...]

> +&pmk8280_pon_pwrkey {
> +	status = "okay";
> +};

I am confused why this isn't enabled by deafult but that's of course
not your fault

[...]


> +&sdc2 {
> +	pinctrl-0 = <&sdc2_default_state>;
> +	pinctrl-1 = <&sdc2_sleep_state>;
> +	pinctrl-names = "default", "sleep";
> +
> +	full-pwr-cycle;

Hm, is that something that comes from the controller itself? Should
we advertise it on other SoCs too?

[...]

> +
> +	vmmc-supply = <&vreg_l9c>;
> +	vqmmc-supply = <&vreg_l6c>;
> +
> +	cd-gpios = <&tlmm 131 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&sound {
> +	compatible = "qcom,sc8280xp-sndcard";
> +	model = "SC8280XP-Radxa-Dragon-Q8B";
> +
> +	audio-routing =
> +		"IN1_HPHL", "HPHL_OUT",

Please don't break the line here, start right after the '='

[...]

> +	usb0_sbu_default: usb0-sbu-state {
> +		oe-n-pins {
> +			pins = "gpio101";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +			output-high;

Drop the forced output state from both SBU pin states

Konrad
