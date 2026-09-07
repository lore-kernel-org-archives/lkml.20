Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43547447817;
	Mon,  7 Sep 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.42.129.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770322; cv=none; b=Cn2Sg/SAi1GbmniOoi/3QfteO7yy9kpKc3rndwPpvWn0ESVU2RO1SkWCy+xWrHh6OL1T2wLZIBYA8iSswADTyakYcyjQyVDSb0xvj4C3ej2DBr/tEJZ4fE3J21oW6u3UPnczJMtZTTwmj9vTIuwlndLK72sfNYeGR0ghbPRIoe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770322; c=relaxed/simple;
	bh=gWgkdboDQ/IzDV7lsyjWofp8E47IAGaOvHJuQF8TrLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DewVmGiII3UXXeIdlweSawbHPYPhIYOXtOA02pTWqdclSz94jjVm7iVWBZ9q9tzALfFh/LgwbUHWFqXKx9KjAAzchJGUSH69tpBGGN1L45d6/YY0K6isznUlpNfd+1mUIdVYmeB/wvanX78ZShvqhl4SDEAI92k92VRm2EIGLVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=IbdWFyvJ; arc=none smtp.client-ip=84.42.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="IbdWFyvJ"
Received: from [10.0.0.152] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 41B2F534054E;
	Mon, 07 Sep 2026 10:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1788770315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rm23DHnP6XKYCBBlmUZyx5e9Qqle+n+KwyQsuDqjd7I=;
	b=IbdWFyvJGXg8e4d6mpAlaGWRdvwu7F+jLc/E03b5pWCA/HXOpL3kuK7Gd3ETD46GasJZxl
	RYZlz1I9dKF30Br1WLcJRyXxKPKRds5y+OHxIJi7og3m8+Ves67NMrzK9IGa+bi5M7n2vA
	YOALy17t8HI75/dge39BsaVGqzXjokc=
Message-ID: <06aa2b47-c5d0-4ef4-8d3b-9780dcc4bcf3@ixit.cz>
Date: Mon, 7 Sep 2026 10:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge
 compatible
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Caleb Connolly <caleb@connolly.tech>, Frederic Laing <dev@fredfunk.tech>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2026 01:38, Rinat Muhamedgaliev wrote:
> The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports
> DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.
> 
> Binding it as bq27411 selects the wrong register map and produces
> invalid voltage, state-of-charge, and temperature readings. Use the
> bq27541 compatible and rename the shared label along with its fajita
> and enchilada consumers.
> 
> Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C,
> built the DTB, booted it once with fastboot boot, then installed a
> locally built postmarketOS kernel package. Before the change, readings
> included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the
> bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and
> 33.3 C.
> 
> Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")
> Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
> Link: https://gitlab.com/sdm845-mainline/linux/-/merge_requests/148
> Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++--
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 948a0dd18..0c6203fa8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -790,8 +790,8 @@ &i2c10 {
>   	status = "okay";
>   	clock-frequency = <100000>;
>   
> -	bq27441_fg: bq27441-battery@55 {
> -		compatible = "ti,bq27411";
> +	bq27541_fg: bq27541-battery@55 {
> +		compatible = "ti,bq27541";

Original OP6/6T has bq27411, replacements (or later series) bq27541.

This change is no-go as is, would be great thou to have auto-detection and use 
something such as:

compatible = "ti,bq27xxx";

and adding logic to detect chip id (and maybe also non-sense values)?

We could also multiply device-trees (fajita + enchilada) x2 (bq27411 + bq27541) 
and let u-boot decide, but it seems a bit overkill for a battery chip from the 
same generation and vendor.

Thanks
David


>   		status = "okay";
>   		reg = <0x55>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> index 5f01115e2..21ebd3f67 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> @@ -44,7 +44,7 @@ main_cam_ois: main-cam-ois-regulator {
>   	};
>   };
>   
> -&bq27441_fg {
> +&bq27541_fg {
>   	monitored-battery = <&battery>;
>   };
>   
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> index 7ffcad24d..d640b38b5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> @@ -67,7 +67,7 @@ tfa9894_codec: tfa9894@34 {
>   
>   };
>   
> -&bq27441_fg {
> +&bq27541_fg {
>   	monitored-battery = <&battery>;
>   };
>   

