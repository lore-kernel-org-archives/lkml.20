Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED035C6B4;
	Mon, 28 Sep 2026 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790559768; cv=none; b=jkn9PF2WQkahZpvNuyz2zL/boTsfW4Tg5WsD4rMu/MegwNQV71Ibhh0X9sMeAA1xVDDHh5PZ9ZYT3Q0ivpRcemNRdHxxRcmnJxfE7e30i09cKtrPgqyZkvAmH2qhkcq6HEXG4/H63pvsds7wMEkAnRfLdVColJ6IEPrffmi/VTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790559768; c=relaxed/simple;
	bh=08uq3A9wMtaq4Rr9UDhqOsDLpsURkdgfsP6zAdAMhJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXGVFlJ+mwZ/2eVnwvxrv996LmV7y5OvigdraD3OjLivy9m34V496dWEKyftG5QivmvzOxbPOoTigrds9lQjthc1RtS7oAmLVacg6EYbDXp3Q2KEjJeWRV8WyoVoucfyqbDkn35OXBJ23U9DoxQ/tbqxpkMgrO1W7MS3wbbp7NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WB0bBJ5P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WB0bBJ5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37BB1F00893;
	Mon, 28 Sep 2026 01:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790559767;
	bh=6y0ztU54hUhOYiYC/am70qRYd9AdAgArGk3hXOOhaaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WB0bBJ5PoplqktgtdmoblaaGUd9xLvkcTIzbYA6pDgRI3SHu8VgOyrhGFMtvyBjR+
	 6ppJ0jqVrxbUJu1mw0nt0IqiqbL7InEDevGUQsYHaCHO1fDNtGfzk/R1umaKNxLfQX
	 9dvZIUMdr+KhN4nR9UlBlEQ6ceKllJ7ogP440gqp+tz7qtNrj6feUbs3wgWZecNbnd
	 0YPMuJHVScjYH2GJA7ZdEzpPTuSFy5ts6BlCvHYjlS4pfsmhtTQ1VhA0eAkEug28ae
	 MGvhv6iIMm3Aksu/z5N4LLMxOGCP7lrAFOQ9yiuV3n0ua+LQLsulCdDhn8D0938Z4z
	 S5r3cESCquQzg==
Date: Sun, 27 Sep 2026 20:42:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: erebion <erebion@erebion.eu>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
Message-ID: <arnF0u2F9ipfnNP-@zenbook>
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>

On Sat, Sep 26, 2026 at 04:00:50PM +0200, erebion wrote:
> Add a node for the camera flash LED found on the Xperia 10 III
> 
> Signed-off-by: erebion <erebion@erebion.eu>

Per
https://www.kernel.org/doc/html/v4.19/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
please use your real name.

Regards,
Bjorn

> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6e2bbf4f060ac..79aa2521aed40 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,9 +4,11 @@
>   */
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm6350.dtsi"
> +#include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
>  
>  / {
> @@ -302,6 +304,19 @@ touchscreen@48 {
>  	};
>  };
>  
> +&pm6150l_flash {
> +	status = "okay";
> +
> +	led-0 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>;
> +		led-max-microamp = <180000>;
> +		flash-max-microamp = <1000000>;
> +		flash-max-timeout-us = <1280000>;
> +	};
> +};
> +
>  &pm6350_gpios {
>  	vol_down_n: vol-down-n-state {
>  		pins = "gpio2";
> 
> -- 
> 2.53.0
> 
> 
