Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B24499B3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772449; cv=none; b=XIjnpkMsvebkBgA0s5up6Pl1+lB6hw8hx+3OKsQbzm38I/Eyjs/e0LS+bh7I4dhzFHVn/ivz1oPjQ2uHrlhQHeKV+X2MHe+WxnJtkkqcS3RVVlOO7+NsQxVz6yuCxKooomkmdAXnBf2D/zcD5av5Ajluj2O7Tp5LGHifGbbGERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772449; c=relaxed/simple;
	bh=7yBNhNMECRErPKAvAk1dDwZ3RKE97WiF8lbynRTizJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBRbtiDfMsY6ofvLgm9YeX+cN1iCTFV5oQmZyh2u10uaNh24bleOFf+LOf6KCOq/KLv6UJQNRUV773eQdd4ILUYwL4Pry2SBIEEiLgMLPdC8L1ZXgFS48UYXg4ZZABMkTgm6VVrl2hDKUUQFd5dHaXvoVJSKyYKYxiUlgQzGIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcZi56L0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgrHhre3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcZi56L0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgrHhre3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777JMn4161113
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=; b=DcZi56L0L/3cyJeS
	dCoLsvsT5uBHlPun6cktmEzdrkFeBPYBR1P7iolA/WfVNUCufTemIr8PksypgB1Z
	QuUCVluqhpGrIEF0CNiVuisFFcJacSOP26yF3NNHNstjMF1WRUq08WhJ8dqJJTPg
	TALrWSQnc8XPwJEY0vYBbbIdMluyzTeSKOedOMT5KheS2YkM4asshJtXP2+hj8I6
	QXdhWgymR8xHE6lZaWvCLcMnZui7ndb35yWf9ZLXZzKI6dkiajeOIf/oOF2ZnItt
	BUggUZK8mckoVcbFaa55hIGhDasAAF50LVgMEjZ/c9Edi+PTjLsWE2glT2HrcXvO
	ixHcsw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhwwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:14:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cd9fe6336so9863176d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788772446; x=1789377246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=;
        b=SgrHhre3857/7+v35X102sxc6onIH3v9p8sjz6ZV1NDmC5hnA+nA1VYOzErigO1YuL
         p26Kvv2EnS6c5Ek9m5UkvMB7crC071ITeuKy6KXQdtIwzJB2AWGKebpmFEsjrwYFweYJ
         pyT4lVGYLjuHBE6QbFilP2AAITMWQawKJ8GVAQ8Hp3+0gpFhnOSUxlIG2cYgi/9Ln48K
         awp2Vvu9FjyYpr9/LHs+/hK3DnxO1UEopv0/a5ARE1ptqefkTBVTc7v6bJ3Yhx5F64o7
         RuHNlw4n1komDhJcCRPXdn8cLGp31d5CF5Z9m/1IVQC+IpvoPHT/2f3sXv460tkARz7S
         mOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772446; x=1789377246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=;
        b=r+kbBqe+jExQoaZvdY/XFWJShRwpQUL6G7uqln/8f0Us+7XzZuNSDyH/1lfBITxBz5
         jdrm9C1GZrfWXS/4Ti/Ui0Rffwv5ORcsqVMB+v/RwMYUut91kKFifk+uwcAtJ/P4gG9k
         kilhF2P4/XQCjDh+W12B2Lj5Y+P+S45+8798ff/eAW+KhPTlsgIdOtT3pUr3dRtwYeEo
         Y4j9MOMfiNno4mI7KkmDONFj7MwV+bVsTIAr+bYNc2kbWEE+kDsLybQx6XYIS2uzyDRh
         ZCBS4bnoGQR9hTQK8zX2Ry8ndc6nbxzfih68wGoSrnr3+142nul97ADsw5HySUO9WbD4
         C2Zg==
X-Forwarded-Encrypted: i=1; AKwUvByp0BLp1QLeXSoWy0e1OsV+clGQs5fucH7+wV+TXm2CAYmdDgrIzbglbkiETyRR06iIrR4FPq9nLiKDJ3o=@vger.kernel.org
X-Gm-Message-State: AFuF++kXE3Hf4uz881CukRswrCbYAxQkgRQ3QKaD28Fcghh6m7Gjzbpy
	0LCMmdih6LyLUgV3AkZPkZY9dMEX7VK1dEfqRbgVygqQeJfkLu+c1u/Xr5mYHZdlAcTnz94kQZA
	4okXp7adN55UDvp3tKUKSGS6DVhzOXp2H0jrY2BOFWWt+Y3a6NlhhDgXXlnUlUBi9Lu8=
X-Gm-Gg: AYBFou0X3kLzuVgn2p5IZYulbhrrIYpnAKYf8P2jb+kxKGRoKF3q3HWb21b1e2W/wvU
	4h2kYcQlf8COBNIpE7z7X1s2tLWrHynxvRzb2ztylLLQZtxcXHEHlSvGpU0mOy+o6qFZijj2q5S
	qW7wNuS0V4MhC43+xkdE/Oa8okhte5mXZsm5+N9mJLLdhe5nU6zBw0m/3EifXvj9zykilr4Y3Ru
	1V4/2FcsUra/6+FkXSyiuPW4GSXlQOBDE0/4/GRCVjQLTN9omB88661mT90KBa3y17TV5YGQnYx
	tT/nSJJC9bVhtKTOta01ACb4cH3PoMCnTvrUAO5tb1qaEwuwPGnK5u+bloQYSEHSFdGpeUs436z
	vxObK8PMT2Clu6ImkZi2Axw==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr717458685a.6.1788772446334;
        Mon, 07 Sep 2026 02:14:06 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr717455285a.6.1788772445808;
        Mon, 07 Sep 2026 02:14:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5b284bsm438969066b.51.2026.09.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:14:05 -0700 (PDT)
Message-ID: <2c524de2-22bc-4bb3-9c20-ffe197819acd@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 11:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX2zrI5PBLDsWb
 Vo2fGCVL+ZbLv82+tK+HZoTVEHHmV74pM094YdQ57ZaGhk1ufRlCkqz8yiTEYs3yNmoOwWWlymZ
 9sUITYgEie/75Y+/ixmi+kL1aOvNVrQ=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e805f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gxl3bz0cAAAA:8 a=x-UWeAqAqefo9e84DDEA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: NBKNbCoKt-zNB88afoiixr_pNKQ4cmm2
X-Proofpoint-ORIG-GUID: NBKNbCoKt-zNB88afoiixr_pNKQ4cmm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX8ZJnDMG5nxQ1
 RicHFmaOrnbbiEhhsoNMzv4V9i07zjCvCmYhvtus0JlyGVFI+qR9mnzJsOIzZdt8xU+dWqDd0EB
 JNFTT3y7OmudJEn2ewJnJ/LWL0GITUTjErOYcFdKcSqZVDDAU3M7Fqxsnk9ra50rBlQSKBTdzl7
 xvYUHKsH6kLAKwVdQdJXKlWOoNPHvpqb+Yu4VW/CpyNGCcgsQd1UKY25BNt3gVVQ1CkZdZXGeFS
 owaniLBJoVWQPodj0h1FyBJdyCsVxzu4wGwW1PTVwX/ACEMmVBRr5BS8pYE89yRavS2448AI5YY
 troDPbx+FVh+q++XqydbvotbBGueiSbwUdv76h9pzczBR99Y1LRDLJNcJs6eXxXp9cA0tm74qs0
 jpgwfyFr6+S4LHQTToA/Yvh5CBaq48LDNWvV14BtUyoa/fRjpTv/wApdhGsTJzxcAd/mPrwMnfP
 6JJ/zVyWZxBUzhS78KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070100

On 9/6/26 2:22 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add a common DTSI plus LCD and OLED board files for the Lenovo
> IdeaPad Slim 5 14Q8X9 (machine type 83HL) on X1P42100. In some
> regions this SKU is sold as "IdeaPad Slim 5x"; the "x" is the
> Qualcomm suffix in Lenovo's current IdeaPad naming (i = Intel,
> a = AMD, x = Qualcomm).

[...]

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	gpio-keys {

nit: 'g' < 'h'

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-LENOVO-Ideapad-5";
> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS1",
> +				"VA DMIC1", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS1",
> +				"VA DMIC1", "VA MIC BIAS1",

https://lore.kernel.org/linux-arm-msm/20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org/

[...]

> +		vreg_l4b_1p8: ldo4 {
> +			regulator-name = "vreg_l4b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			regulator-state-mem {
> +				regulator-on-in-suspend;
> +			};

Why is this necessary?

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* 3d PS883x */

Any reason not to wire it up now?

[...]

> +&iris {
> +	firmware-name = "qcom/x1p42100/LENOVO/83HL/qcvss8380.mbn";
> +	status = "okay";

nit: \n before status, please

[...]

> +&spi10 {
> +	status = "disabled";
> +
> +	/* Unknown device */
> +};

Either enable it, or remove it, I think

> +
> +&swr0 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-names = "default";

'status' should go last

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +		<44 4>,
> +		<72 2>; /* Secure EC I2C connection (?) */

Please align the '<'s

> +
> +	eusb3_reset_n: eusb3-reset-n-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You don't need the output- properties on the TLMM pins

[...]

> +&usb_1_ss2 {
> +	dr_mode = "host";
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_ss2_hsphy>;
> +	phy-names = "usb2-phy";
> +	qcom,select-utmi-as-pipe-clk;
> +	status = "okay";
> +	/delete-property/ port@1;

nit: status last, please

Konrad
