Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774EC4B4043;
	Tue, 13 Oct 2026 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884464; cv=none; b=aPQcM+ZLPROZ6SpEyJa4GwS+Dmw18RTFTcl+soNoDQpzS2bOEMqpWP6xwfsWdho1P7PwQITkrsCisIx8FGTJTyOabylnFzL90aKbF2ckxU5+CnnisOz/ls/EXVXwUEvuspT/0b6TUMYbJm50pqGWjWDHczSmrShAvFOsC4a5BeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884464; c=relaxed/simple;
	bh=tfWeFSEfwsSNTscm6ppw/n9iGraZHe95uXgtVlfnWAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3VRjn4cmrxMGZj5aIqxi4dB6wMGVfs0R3ylPQeb+ahSAkUJ3400sCUMPLznuu42nmBsCbatqVY81lAPY8GNcIlTk36kzUf26+U7hTscUU8H2td4cnaWrp8tmVZSvPKWSmDzth03agGrZF+yZ4MLx9wgZShCZjscmQ1yYm9gAsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+fppoNq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+fppoNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6A71F00893;
	Tue, 13 Oct 2026 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884462;
	bh=N90VTDWAcSBxmJHYTRRT0u+qaInpSRMKQf89mvp79vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+fppoNqhMe1v3RPuJDvbRyAm39XI5p/yIVhVwdwDThh12HKoiesrFwzj74wLzEO6
	 UeeRVzmGkLDwhapz+Qo4fuSVu2dFzyE06GLv5a+qKdNmZO+8VAsggN2wV8hKPmwmbK
	 m+o43GN0UG1/uo3fu7T/ehDQ3t8+7ytqRmpr9uw3bUGrdFkHnJS+Cg2eIlLIFM/mhd
	 aye5J08jMAj4zxI49m9e8KWRxUkGwSCdY/oLqM/c91O8MTd7kI5upJ4KRUd/BOWop4
	 aod0mEjOkdIp8i2V6pJuZ1mqjLqB5W8p8jMWbc2Eo2i/Rzg0B7aLZvP8NTP75SZzl2
	 L18lxT99AlLLg==
Date: Tue, 13 Oct 2026 11:40:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mingxuan Guo <gmx472@qq.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: media: i2c: dongwoon,dw9768: add Giantec
 GT9764
Message-ID: <20261013-godlike-luminous-kingfisher-feb1db@quoll>
References: <tencent_FA6A841DD9155FEEBFDEA7FE7310568E4606@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_FA6A841DD9155FEEBFDEA7FE7310568E4606@qq.com>

On Tue, Oct 13, 2026 at 12:37:01PM +0800, Mingxuan Guo wrote:
> The GT9764 is one of Giantec's VCM driver parts and shares the register
> model of the GT9769 already covered by this binding: the vendor's VCM
> driver application note (AN971) covers GT9764, GT9767, GT9768, GT9769,
> GT9772 and GT9778, all built around the same 10-bit DAC with the AAC
> actuator-control extensions.
> 
> Document it as a specific compatible that requires the GT9769 as its
> fallback, so the existing driver binds through the GT9769 entry and no
> driver change is needed.
> 
> Signed-off-by: Mingxuan Guo <gmx472@qq.com>
> ---
> Changes in v2:
> - Use the GT9769 as a fallback compatible instead of a standalone driver
>   entry (Conor Dooley), and drop the driver patch accordingly; this also
>   clears the Media CI warning about the compatible being undocumented.
> 
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> @@ -20,9 +20,13 @@ description: |-
>  
>  properties:
>    compatible:
> -    enum:
> -      - dongwoon,dw9768 # for DW9768 VCM
> -      - giantec,gt9769  # for GT9769 VCM
> +    oneOf:
> +      - enum:
> +          - dongwoon,dw9768 # for DW9768 VCM
> +          - giantec,gt9769  # for GT9769 VCM
> +      - items:
> +          - const: giantec,gt9764 # for GT9764 VCM
> +          - const: giantec,gt9769 # fallback, same register model

Drop comments, they duplicate compatible and as you can see, the
existing comments confuse people into thinking adding more duplicated
information is a positive thing.

Without comments:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

