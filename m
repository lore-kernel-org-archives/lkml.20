Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFCF4C9E01;
	Fri, 16 Oct 2026 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168713; cv=none; b=B4Y9KZOlFAB13D6cwFdN1oIsQVdOF43E2gINhlmBeXkGeKIoF+Y1uRUw1691alNHF4KQ6ip5lDnrdW4ByBaH0p9x8QpAUtDQhYPGw94l4sgiPgu+SY5S3llSbyOXhlZ7AB8Hx5a/vmnIijFercAW5kpsZHGASwSrszV/QZ1UjcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168713; c=relaxed/simple;
	bh=iy+Huz9CW4T2GWHOcLU7+Fv6hIf4yWIOcMvWFcLWwqo=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=nGi3TaZUepgyof+Co+GuF5HzKpHfImKzW33vQCf4g9uTmLqAxgBZl3+Ayc9IUDuizLD180fMefhJMLfx1CBX7dNDp4lc+dtMGprRUHgSZZrSxjjP6MAIBft70YallFjJxAzLzMM5a4isNCuLuDvtMFooklVvTuN3UbNawc+K0+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=Qe+B7lgT; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="Qe+B7lgT"
Message-ID: <0ff136f5-5ed7-4fa0-a93a-07c06706273f@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792168703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=e7b24QwjbL5Rp7Pwru68/kBNU3OhYLVXU1CkIm0gP/o=;
	b=Qe+B7lgT0NrhM0scM6LY/0LOg5xkYe2Qrxt/TSOa27KU3psCxmyIKDgQTeYGFWX3qwoIBi
	Gy0dllQ6TvSglgLwxbSh86KVNp0awDs2ZESV3KD7HtRNWamDCP14ryMW/tqiXHzUJZCUHZ
	rktPhncvbvA1fE6rteRVK9PWV1N++vA=
Date: Fri, 16 Oct 2026 18:38:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: oneplus-kebab: new device
Content-Language: en-US
References: <c14fe062-2e87-4040-b9a8-7d90a04d7a8c@fhannenheim.net>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Frieder Hannenheim <git@fhannenheim.net>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
 =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Frieder Hannenheim <mail@fhannenheim.net>
Autocrypt: addr=mail@fhannenheim.net; keydata=
 xjMEaX+iTBYJKwYBBAHaRw8BAQdAjgnNmu6pLzUJq/DD3ZU3tTbKzC2npfFhEK6NYMLRukrN
 KUZyaWVkZXIgSGFubmVuaGVpbSA8bWFpbEBmaGFubmVuaGVpbS5uZXQ+wpAEExYKADgWIQRD
 lxn4P3kTLC9X/iFsAXPIt5MeUwUCaX+iTAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAK
 CRBsAXPIt5MeUzNaAP9KklaL+chH1bUa7To1Pn346guR/N/PkMkyvWgKRs+yzwEA6N2E6TZ6
 CJF8cW6gVaSFmNgGcGZUAw5A5MrUleV5PwPOOARpf6JMEgorBgEEAZdVAQUBAQdA51B2jbQ4
 iUnmggSYEqwukOYQmjBwsyUpc8Wkk9I8qkYDAQgHwngEGBYKACAWIQRDlxn4P3kTLC9X/iFs
 AXPIt5MeUwUCaX+iTAIbDAAKCRBsAXPIt5MeU3oKAQDyZDbjdjzNsJdliBQBkZXuaJDAB1Mn
 59LycSSRsRVCPQEAmNQIItBArt/kiQFu6vC4mXjtM5LzbPLmj/QA26ee2Qk=
In-Reply-To: <c14fe062-2e87-4040-b9a8-7d90a04d7a8c@fhannenheim.net>
X-Forwarded-Message-Id: <c14fe062-2e87-4040-b9a8-7d90a04d7a8c@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad, thanks for the review comments. Replies inline.

On 16.10.26 10:23, Konrad Dybcio wrote:
> On 10/15/26 2:32 PM, Frieder Hannenheim wrote:
>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
>>
>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>
>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
>>   arch/arm64/boot/dts/qcom/Makefile                 |   1 +
>>   arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts | 129 ++++++++++++++++++++++
> 
> Better. Please split off the dt-bindings changes to a separate patch,
> and put it first in the series.
> 
> [...]
> 
> 
>> +&framebuffer {
>> +	width = <1080>;
>> +	height = <2400>;
>> +	stride = <(1080 * 4)>;
> 
> Does the resolution differ between the two devices?

There's 4 devices: 8 (instantnoodle), 8T (kebab), 8 Pro (instantnoodlep)
and 9R (lemonades).

All except the 8 Pro have a 2400x1080 screen, the 8 Pro has a 3168x1440 
screen.

> 
>> +};
>> +
>> +&i2c2 {
>> +	status = "okay";
>> +
>> +	pm8008: pmic@8 {
>> +		compatible = "qcom,pm8008";
> 
> Is it not present on the other one?

The OnePlus 8 doesn't have this according to the downstream dt. >> +	 
reg = <0x8>;
>> +
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
>> +
>> +		reset-gpios = <&tlmm 93 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd-l1-l2-supply = <&vreg_s8c_1p3>;
>> +		vdd-l3-l4-supply = <&vreg_bob>;
>> +		vdd-l5-supply = <&vreg_bob>;
>> +		vdd-l6-supply = <&vreg_bob>;
>> +		vdd-l7-supply = <&vreg_bob>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pm8008_default>, <&pm8008_interrupt>;
> 
> nit:
> 
> property-n
> property-names
> 
> in this order, file-wide, please

Will fix

> [...]
> 
>> +&i2c16 {
>> +	status = "okay";
>> +
>> +	fuel-gauge@55 {
>> +		compatible = "ti,bq28z610";
>> +		reg = <0x55>;
>> +		monitored-battery = <&battery>;
>> +	};
> 
> Likewise, is this absent on the other phone?

Not absent but different. The 8T and 9R use two-cell batteries while the 
others only have one cell and use a different fuel gauge.

>> +};
>> +
>> +&tlmm {
>> +	pm8008_default: pm8008-default-state {
>> +		pins = "gpio93";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +		output-high;
> 
> Drop the output-high, the driver will set it for you

Will do.

Frieder
