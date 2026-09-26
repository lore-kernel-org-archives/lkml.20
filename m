Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED643F4CD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432747; cv=none; b=MK+bNfSTmAvf6+ht1efL9qBeZaoyzIVdBJO/JF/AZBuG4MAmI8XI+boJ6L+JEXd30H0xEVnjesgl9uy6qXrEQl4wPkh4lUTr5928oqJ5rlZBao9UeuVzZikoFQvXRgKNl/cnYFMq+m+VH2zpOrhrVfE3z/7sx5OUQRlYcNijI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432747; c=relaxed/simple;
	bh=sjXsu7Wk9oEJK2CdX+yMd1S1zZaVAPHVkhDsFazZ8Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF4zuym6eauMI4Tlp7K6Rl5RH12Xs0Qrf0bSOeihL7f+GhTZM7MabjUb0DQho+U9NQUa+biygp51xdE82lHVGYMmSgXaxvMrkEk+aZK6LU4zPvcufs29ORnCq0w73qYzNMv7m1Cx8xt+wz2bLInGZoYy0GxuHfLhsrhu9cSVUq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+J2Rni3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+J2Rni3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so9372395e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432741; x=1791037541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=E+J2Rni3FaKWzzynITShS3+ZWZso5J0+VS4o7JSQAuOYIQs77EHACLSHEQ05RLEnr7
         Yhhhq4lsEBbcQuRD6w88Xu4QCBw1W/hAPZ1Op/uiBbcRiZ/NG+Zt88A0YtDFkHYxh+mW
         di6jOPDy690zs2AY0kl+fEIOJ3nxbOmMT7gt6s8NNNC4dfed9w/wwaF29AwtrEWAJouE
         25vyoHv9ErxSEYHPh5ek7dPxd9ZUs6a8xz5vW9TcPdxDZbOS/gI2/uxoa0gVPmf0gjer
         fxLNxHlr3vIH2iD9oCupWmt4j10vgUPxOk0FXwqx7pj0Htm59AV7j35j74i8tBA59uvi
         LhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432741; x=1791037541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=DMEkNWyxQvl2f98KgTGNolyXbb31KWYVTJ05Pnkbh2Gz+tLbfpJDR7yA0rHHx5t7mw
         bf7dIP8ZwX9S1K7NHSt3/2DMOqFLC7ojh/ZdHksVi2aCbV6tFf7/HGBjp8E8SxQVPLwh
         /gS7ZjDshvi4dj1TZdXP1xiPWtnSuwe1yA7uo5UyoJKjLM0nNT8v29n1kg9Cboa3c0E5
         a59ulxXcuYGeBpeGgJfh69BwiDHGmFmb/8r/uULof04XwJb9apdyv6dHMlewX+TVu7CR
         DP5AlCM1APJQehioXjABCev7QxYB54DvqKfGjvZwDNbT0qoB2SfOxxqgEKzPJBfRd4tm
         Fwgg==
X-Forwarded-Encrypted: i=1; AKwUvBy+OKGFD+QLYl14NOz3a+wY6NbkZRj7fsetbvl/UlNvOP3pxe6EKznQigi1DBz2snrc0DiPVQyIAautwTM=@vger.kernel.org
X-Gm-Message-State: AFuF++lgDQhXx31/wqSGxiyq8V8G/sxLJ8/L/cBKCm9dr+u7DyRn6md0
	fARBBM/nH8RwUYqHuC3dgRySwZW2o/ULToCT0bOe1hod0KFY3VuCofnGyGmspi+6AzSDCtSqwJA
	u0BzB2d0=
X-Gm-Gg: AYBFou2cekfZp4BwcWk9t/o6Rc58+eTOtIEAcsEk21dRM41W2d4fs/RWtWA/hBk40tD
	HptBIIaq/ObfIVkHMfOisJGOtRZ+dbYlp2QH2pn3ojG7lr0DN1+HPUBpXtd2cvT4ERYdNXkW6Sa
	YuRHWVQXTfRTgbRQLttZ8mmEdT4AmT8qm/kzZ7kVusFGu7Jg+6lyEW2VTu3u/SbNpjTc0WO10d5
	hEUTOfAoJhp2u4jd6JLpg780f2p9NFcfPOpJcp7AZKDAnOdn1mh/487oETSEESCDI8CKiHaXcuf
	FXOR8tnGup8Vh8gSzgDJKzjv4O0blvcEX+BORzba7gTRSLKcH8/ArfLxXTMlZ6wg8Xpq/xUq6BL
	KswO3ON9BKZeVg0Hs4wgNNeK9Izj26p23ypEYXKMZPkMaZSmlTPlM02VbbMwn43yDM/lphU2+m/
	bL8VgOBy7dEWg5WfvJ5QW6q1a1Dc8QFKWtgNxpFm5faMwQqtn6vTilaM3B7SlL3R6/NirOwCA4e
	2DF83k9EU0=
X-Received: by 2002:a05:600c:698d:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-49fff32848dmr11092055e9.16.1790432741347;
        Sat, 26 Sep 2026 07:25:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm101995495e9.3.2026.09.26.07.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:25:40 -0700 (PDT)
Message-ID: <10108920-4109-42ab-960b-85bfb4a49a80@linaro.org>
Date: Sat, 26 Sep 2026 15:25:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/12] arm64: dts: qcom: pm660: Add USB Type-C port
 controller node
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> Add the PM660 Type-C port controller and PD PHY device node.
> 
> As on PMI8998, the Type-C CC logic is part of the charger's USBIN
> peripheral at 0x1300, the PD PHY is at 0x1700. The node uses the
> 'type-c-change' interrupt from the USBIN peripheral for CC state
> notifications, plus the 8 PD PHY interrupts, including fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pm660.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> index 156b2ddff0dcb..37965a3607417 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -85,16 +85,43 @@ pm660_charger: charger@1000 {
>   
>   			io-channels = <&pm660_rradc 3>,
>   				      <&pm660_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pm660_typec: typec@1300 {
> +			compatible = "qcom,pm660-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "type-c-change",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +
> +			status = "disabled";
> +		};
> +
>   		pm660_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
>   			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
>   			io-channels = <&pm660_adc ADC5_DIE_TEMP>;
>   			io-channel-names = "thermal";
>   			#thermal-sensor-cells = <0>;
>   		};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
