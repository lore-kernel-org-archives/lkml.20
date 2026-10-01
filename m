Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942A547059;
	Thu,  1 Oct 2026 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837754; cv=none; b=UpvetYoS/dk6g2h/CoY5AJ8mbWfZZnpyL72uuyrLY4j9FQWYGR11it9o8docfO10pSz6thpMALQ0oYgNiA8S7k5ylhZ66ex9+tthAA2npqHGuRqqNV5NJhAQllqZiPM2JVPfN46pdf2qoLtx0gtqqfZb9PwswYRzfXtnCTMCxdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837754; c=relaxed/simple;
	bh=QoLNnGt1QfuA1ANyUEKP/0a+XKjsESBZmtSKcHLf3Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJaRzDwqCWIM+m2414x5IyBQb3n4I1hPMowdei8Pr/tb6YHs+rbhTJez233yJhs9f81Cf2OAmDrp2K2egi7cuGuWnk+0KoamuaVxptu2PLZnWa8HPwQC/onuwsP9Dovv99KRT3yPGxjenzt53X2KrPZ6qAg7kTH2tot0nvVh+Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhANQ7SV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhANQ7SV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CD01F000FF;
	Thu,  1 Oct 2026 06:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837752;
	bh=p4Ts2/n0F4w6WOA2qsy7F0lIPhEi3nzuiwcrYnsLlSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hhANQ7SVoq0le0p9KfJ3llwvejnoX2UI4LZBbxtgz7Ur+VNrdHTzE6AGlMBQH8E6O
	 +Exw8YX9KaS0OurzuUIU7huBrw7o+NhnsVzqk5CKPjqJXk2K2l3KV8GG50nD/SCnpj
	 Iq/KhikYuRPceOvfqv32nVK1NEcymcJBEMNN/v/FwIoQnL+tUBPi+v8N4IPYlpeWah
	 i89FmLeo/JxUzWQZXc8liLJDHUGEHu1M9k5fC07PJTaTvAWFCrcbKKVB6SxHSK9J5o
	 BmqF1nbAR1jE64OEhn4rFr427PYJecyX4uKj2JUNbrGP5+0F6lFlJ260kEGNjM+zUU
	 R0ObaT7Ina3uw==
Date: Thu, 1 Oct 2026 08:55:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
Message-ID: <20261001-private-wooden-chachalaca-51aa57@quoll>
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
 <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>

On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
> Some boards drive the ILI7807S panel's backlight from an external
> WLED driver whose enable input is wired to a GPIO, typically modeled
> as a fixed regulator (e.g. vreg_wled).

You describe something else. What's fixed regulator should not matter
here. Which pin is it in ILI7807S?

It seems you just want to represent GPIO with a regulator. This is just
confusing and typical downstream workaround.

> 
> Document the optional wled-supply property for the ILI7807S panel
> binding. When present, the supply can be used to control the enable
> input of the external WLED driver.
> 
> Platforms without an external WLED enable supply can omit this
> property and continue to use the existing backlight handling.
> 
> Fixes: 447a76a99e24 ("dt-bindings: display: panel: add Ilitek ILI7807S panel controller")
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili7807s.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> index ba8c5bbf8ffc..8d56b74a962a 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> @@ -34,6 +34,10 @@ properties:
>      description: Negative LCD bias supply (AVEE), typically -5.5V
>        (range -6.3V to -4.5V)
>  
> +  wled-supply:
> +    description: Optional Supply for the WLED driver that provides the
> +      panel backlight
> +
>  required:
>    - compatible
>    - reg
> @@ -49,6 +53,13 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>  
> +    vreg_wled: regulator-wled {
> +        compatible = "regulator-fixed";
> +        regulator-name = "vreg_wled";
> +        gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +        enable-active-high;
> +    };

Irrelevant here

Best regards,
Krzysztof

