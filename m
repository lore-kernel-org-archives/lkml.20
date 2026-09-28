Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB33370AE0;
	Mon, 28 Sep 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576798; cv=none; b=HyMlYyXNeRs33p0qtL0coPPH8mcIZujgc2h8FNWF3j/pgPklFu/QW5GG72ZZYfUpSxApt8bqbrSSZLk+sOpdj/wx74FS2ryyX0+/Jqu44bIkU4eu9l4NNZZ0A0gdbVVvVXEFibdt+W38QxFocpc7+GWG9QumSjU+Ze9cC4IZYTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576798; c=relaxed/simple;
	bh=danY1/3QYgjgXRAkhsnU84WXE6Unw+o2tWh5stmxuMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjw17PQVay7g/0AirPdapGF8jUDCfqKYMJyNggPrA/gq/fRqluLRWtRfAqm5Iyi9mdOT4sYmy6J8Trj6ceMFjN4GLXXd2H126/fcTfeoSSnW/Wn1htK7uPGOIE1N0LKPwHCPn+zrYMo6QwfFC0h9v6ZP4XMiCcIqOl6mcEMwPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9SasWgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9SasWgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9541F00893;
	Mon, 28 Sep 2026 06:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790576796;
	bh=qOioi9o3R1Ts8psFnPK7TSix7Udz0DSZGiarerXWJ6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q9SasWgGM9salqUrT59EZ/UZxa9kJcGh8XMCesLqZ73V8/gLZ147WEukiY/jcWggu
	 /QX4u7MI3v1uO1fIPKWsCDrzlXag/C4SoBuSpqX6Qh3mVry/JoGHNraazcYDXQIm3i
	 SmwfsNyIxy4seZKSKcJB6CLPR4JOarqzxj7uzG5gbIdGkqJEVBRFwZxqJlCJaDqkhB
	 AMs9bEGMPDhmBbHcwH84PzWm79GQ/wsa+Hs+VjOSVGUYxAB0hzonEJYur48fg6ayh/
	 iWgylxUw9xEK3/DRkXanUaSaFEjy5BLbFtpzk6HreG7Tup2ykmIkehvuVXvOFhgXCH
	 da5nvdPK4MaMQ==
Date: Mon, 28 Sep 2026 08:26:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
Message-ID: <20260928-loose-outstanding-woodpecker-dfa8db@quoll>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-1-6c6cb6444caf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-add_shikra_support-v1-1-6c6cb6444caf@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 03:12:30PM +0530, Mohammad Rafi Shaik wrote:
> Document compatibles for Qualcomm shikra rx and va macro codecs.
> This SoC does not provide macro and dcodec clock so reflect that in
> the bindings.
> 
> Shikra integrates LPASS codec version 4.1, which is not backwards
> compatible with the already described compatibles.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++++++++
>  .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index 4988e7ed6e34..69d7b7332d36 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sc7280-lpass-rx-macro
> +          - qcom,shikra-lpass-rx-macro
>            - qcom,sm6115-lpass-rx-macro
>            - qcom,sm8250-lpass-rx-macro
>            - qcom,sm8450-lpass-rx-macro
> @@ -138,6 +139,22 @@ allOf:
>              - const: dcodec
>              - const: fsgen
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,shikra-lpass-rx-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3

You can drop this one, it's already set in top-level.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

