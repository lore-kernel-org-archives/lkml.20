Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B2353EEB;
	Tue, 29 Sep 2026 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667659; cv=none; b=hcKxWm5MQhuLpA0ArrX0TMVDveFZ3a7C340psakE8H44RYSPCR8gKmjdjZsqwVkjLbTqVTg7CBwUhnRXiaM9GxDlOB1S8Bs9Thlfg/1g1ervxeu8TDwy/y5yvGoG7vr4JM6sjHh6R8NBDmXJL8IC89cITFutAtp9J/PH56k1/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667659; c=relaxed/simple;
	bh=MYMx2gylDtJrUiWAS38fKwK19h/+Z3rEEV8/GDtvrHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPhjhIXMLg0Xw+SXfsO77+MJ/zsZfIvslA7ptpnRcLZC6t+D/wc6j5X6+jFNtvVdFoscEbfO07G67kMSxjcijrgWVhs9K4PaIUhSgCNsxwJkhVG6fQ7dEHmxXk3764PbVdJZJuM5qduX7e8j4FR3mSmS36a8UoMHt+14tJpsIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlwQWTro; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlwQWTro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B968D1F000FF;
	Tue, 29 Sep 2026 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790667657;
	bh=fd4A2Z+Bnb9oINYHV5jhGXCTwA1yaoQRBpuQeCIHu/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jlwQWTroPm7tl1DzY66fPzrLaKdTCTAyGMJ1lYyTARRhA7Qx7JXEYjkTuQvbR/ZMk
	 dxFdavsXsyFZ7TxIkrqOjBkdx43QPSWhv/c73XJghxd3jf03UJQwQBBZhBqA7HgCY/
	 R/1zf9KeOL8PsBbryQC99PtWbURazUPR0Bk5DSJCHUUmqbJW0mr1TCgBzag4v8D571
	 q2acn5PP2Zkg74zyipT0JMJUYmbYAaXHypmV28TtEbm2E9HnSPrABiXLshkjLNvPOH
	 K1u/jVp2x8GUuUt184AoRsAeTNrPcash3VMV+jlIsTxhkcAGt/diW4jM2fPO/Nz074
	 aWlV3st2mc6rw==
Date: Tue, 29 Sep 2026 09:40:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Petr Vorel <petr.vorel@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: display: panel: samsung,s6e3ha8:
 Add AMB630QY01 panel
Message-ID: <20260929-automatic-humorous-muskox-45bdfd@quoll>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-2-08d5c7bf72fc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-crosshatch-panel-v2-2-08d5c7bf72fc@ixit.cz>

On Thu, Sep 24, 2026 at 04:01:30PM +0200, David Heidelberg wrote:
> The Google Pixel 3 XL (crosshatch) uses a Samsung AMB630QY01 6.3"
> 1440x2960 flexible AMOLED panel.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3ha8.yaml    | 31 ++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> index ca250b1b91712..acc2ea2969298 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> @@ -7,48 +7,75 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Samsung s6e3ha8 AMOLED DSI panel
>  
>  description: |
>    The s6e3ha8 is a display driver IC used in 1440x2960 AMOLED panels from
>    Samsung Mobile Displays (SMD).
>  
>    Known panels:
>      - AMB577PX01, 5.77", Samsung Galaxy S9 (samsung,s6e3ha8-amb577px01)
> +    - AMB630QY01, 6.3", Google Pixel 3 XL (samsung,s6e3ha8-amb630qy01)
>  
>  maintainers:
>    - Dzmitry Sankouski <dsankouski@gmail.com>
>  
>  allOf:
>    - $ref: panel-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,s6e3ha8
> +              - samsung,s6e3ha8-amb577px01
> +    then:
> +      required:
> +        - vddr-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s6e3ha8-amb630qy01
> +    then:
> +      required:
> +        - vddpos-supply
> +        - vddneg-supply

Entire allOf goes after required: block.

Best regards,
Krzysztof

