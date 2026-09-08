Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C37353A7D;
	Tue,  8 Sep 2026 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845044; cv=none; b=Z42/3PJ5HvqiJlc0HwrnI9qm3hvd1vDkSdTOA2tW4xpwy7Qvfw9bYmEQl/hVqvSdQ4RdwiWNVocD+L0Y75yFi/lktnXxCHyxBwJlL+sPl2EkMsW8JOXobJqByzKBHoNNRxL3A8XUpTgN/S9P58pdveFZrrACWdeeQllcMdaSUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845044; c=relaxed/simple;
	bh=sgwobKVbp4S5e++w1bz/E3jM/+lRt+UdSpMyzDRk6+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1dXS9b8T7k49a1/JeSzidy55qAwDJqp1YH2huPKxyWHN8aUwA7JemKabnnGx/9iC/qHJLjfXIMeG2NukisoVUDoLNh3skbkyOt1zubmIyPs4E4nHa3GwyZ5lzhvp72WRtbJ7euaEOke6k5Ai3ZcmhSNaA2Uv3QvUcpLuQzx8G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=y0XAEvGm; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="y0XAEvGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788845033; x=1789449833;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=TkaGy77eKmTNsJm/UwBqcUW5rWjpxVgfLeZ/5Ai+p5E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=y0XAEvGmtdNH0NGN1GVi6jCoQW5P8lFqSqK3LuRYK3jzB/JMWphwG9Dd1Ao9kAPr
	 Z4PwvsZV1skkMuVaU69alaVSEkTcHKBX618mB8MZ05eKIYKfSUTIeco49pc1zJwyJ
	 /UJ5XZG0rLBgDY8Wudr8qG9z6uMtRcUIe4htNY2D7op0+UF9DvFkcJHdYXj+mNUgt
	 BP5U8BKP9AFNCcLSwzCMAhBjXj3HRJF+1QUeXFAafusFwtz7PLEZdN6TI4qG5u5oH
	 wKrURruaKDaNW13j/jAxYRsTnSfE9VYEqvJLE86Glid85G40ujBDdKTISGVgobUr8
	 harYn5ypFq0SoQBPVQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M3DBd-1x0ENv2oQ9-004Euz; Tue, 08
 Sep 2026 07:18:22 +0200
Message-ID: <84e545b9-3c81-49d0-9ac4-1aa84eabd3d0@oldschoolsolutions.biz>
Date: Tue, 8 Sep 2026 07:18:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
 <2c524de2-22bc-4bb3-9c20-ffe197819acd@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <2c524de2-22bc-4bb3-9c20-ffe197819acd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hZziq8oZYpa6UHGOxdDRZ+Bbaj9MIYuK9yqk7OVTO7bg/mDO09W
 rPp4OwZjj8SRN5YSU8f4L0rnEo/cvAJlbo5cJte9y+S43nt2GqGmG9bXXkJyf+IaLy0jpnR
 KdYIHNVjQDqr2B6Ocxgq8ZHFj84sfSFAkftpZhtyfLZCNfx6+m6QwD9Jz3TcaDRFq87+o9J
 MaEF8s2YdEvNitySWqdtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ClEQUHLu8uc=;JfwKGyigNhmJDStt+V328eV2VRk
 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

Hi Konrad,

On 07.09.26 11:14, Konrad Dybcio wrote:
> On 9/6/26 2:22 PM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Add a common DTSI plus LCD and OLED board files for the Lenovo
>> IdeaPad Slim 5 14Q8X9 (machine type 83HL) on X1P42100. In some
>> regions this SKU is sold as "IdeaPad Slim 5x"; the "x" is the
>> Qualcomm suffix in Lenovo's current IdeaPad naming (i =3D Intel,
>> a =3D AMD, x =3D Qualcomm).
> [...]
>
>> +	hdmi-connector {
>> +		compatible =3D "hdmi-connector";
>> +		type =3D "a";
>> +
>> +		port {
>> +			hdmi_con: endpoint {
>> +				remote-endpoint =3D <&hdmi_bridge_tmds_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	gpio-keys {
> nit: 'g' < 'h'

yep, will change in V2


>
> [...]
>
>> +	sound {
>> +		compatible =3D "qcom,x1e80100-sndcard";
>> +		model =3D "X1E80100-LENOVO-Ideapad-5";
>> +		audio-routing =3D "SpkrLeft IN", "WSA WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
>> +				"IN1_HPHL", "HPHL_OUT",
>> +				"IN2_HPHR", "HPHR_OUT",
>> +				"AMIC2", "MIC BIAS2",
>> +				"VA DMIC0", "MIC BIAS1",
>> +				"VA DMIC1", "MIC BIAS1",
>> +				"VA DMIC0", "VA MIC BIAS1",
>> +				"VA DMIC1", "VA MIC BIAS1",
> https://lore.kernel.org/linux-arm-msm/20241203-x1e80100-va-mic-bias-v1-2=
-0dfd4d9b492c@linaro.org/

Yes will change that in V2. Thanks for the link.


> [...]
>
>> +		vreg_l4b_1p8: ldo4 {
>> +			regulator-name =3D "vreg_l4b_1p8";
>> +			regulator-min-microvolt =3D <1800000>;
>> +			regulator-max-microvolt =3D <1800000>;
>> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +
>> +			regulator-state-mem {
>> +				regulator-on-in-suspend;
>> +			};
> Why is this necessary?

I had a debug session on the Thinkbook 16 with Grok where I chased stuck=
=20
mouse via USB dongle after long suspend. This is what resulted from=20
this, PTN3222 losing its state on deep suspend when the vreg shuts off.=20
And it solved the problem, propagated it over to the Ideapad 5 device=20
trees. I also observed that on the Ideapad 5 2in1 before. Never seen on=20
the Slim5x, but I got that one after the change was in. So, yes, IMO.

> [...]
>
>> +&i2c1 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	status =3D "okay";
>> +
>> +	/* 3d PS883x */
> Any reason not to wire it up now?
>
> [...]
>
>> +&iris {
>> +	firmware-name =3D "qcom/x1p42100/LENOVO/83HL/qcvss8380.mbn";
>> +	status =3D "okay";
> nit: \n before status, please
>
> [...]
>
>> +&spi10 {
>> +	status =3D "disabled";
>> +
>> +	/* Unknown device */
>> +};
> Either enable it, or remove it, I think
>
>> +
>> +&swr0 {
>> +	status =3D "okay";
>> +
>> +	pinctrl-0 =3D <&wsa_swr_active>, <&spkr_01_sd_n_active>;
>> +	pinctrl-names =3D "default";
> 'status' should go last
>
> [...]
>
>> +&tlmm {
>> +	gpio-reserved-ranges =3D <34 2>, /* Unused */
>> +		<44 4>,
>> +		<72 2>; /* Secure EC I2C connection (?) */
> Please align the '<'s
>
>> +
>> +	eusb3_reset_n: eusb3-reset-n-state {
>> +		pins =3D "gpio6";
>> +		function =3D "gpio";
>> +		drive-strength =3D <2>;
>> +		bias-disable;
>> +		output-low;
> You don't need the output- properties on the TLMM pins
>
> [...]
>
>> +&usb_1_ss2 {
>> +	dr_mode =3D "host";
>> +	maximum-speed =3D "high-speed";
>> +	phys =3D <&usb_1_ss2_hsphy>;
>> +	phy-names =3D "usb2-phy";
>> +	qcom,select-utmi-as-pipe-clk;
>> +	status =3D "okay";
>> +	/delete-property/ port@1;
> nit: status last, please

Will amend all these in V2, too.=C2=A0Thanks for the review.

with best regards

Jens

