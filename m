Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665C8407590;
	Tue,  1 Sep 2026 17:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285291; cv=none; b=ApHnbUauR4DdPidiL+QrgKBdkcqNgYB8d6yG+gc3M8YRz8HZQ8tIg3Wu6BE9Znsv0tXalvxUHS6tAJULSzDe5Y+wFwzdb4HFrWu0tQ9br/ra7O5SDZ1JNcx0sFX2xidio0kmWByFw6SUWrYjJszNkFXRi73Mnb0Q5fs6Jt1fUGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285291; c=relaxed/simple;
	bh=JS2UddQn5/i7c2debuCR2EQ7wtM3zEj2IIxRcO7H4h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJEtkMK44LA+PcU4ajZ8AWEpXgpSBx/+U+VhgiIJOx6XqZDPBAvjx3gAw5tUt88Et0bw3u8Bjs3ZA3e8Egv/kXyoLzUYjBxdeZY+REqYAsEKrUl4b4zA2FlkF/yyH42at9OoU0ukVwITvgLyIKk/A3po+x16SWjfB9f3L8wX62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XE7mpnwR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XE7mpnwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA621F000E9;
	Tue,  1 Sep 2026 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788285290;
	bh=VkP1vNEKI6uUWzzivLoL8Kvrvp5iSP9jmOdS7vY4RF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XE7mpnwRst/vuAgkcv1zY7mH3V4esg+Zr6i3BfCFjHy9Whqjv7iBXWHtCkF2yeRIF
	 vTBdT9BO+ZH2oMQR6KQ1bqT9Tzbt9dXu5/8PATv0hCVtie20vxsiXF3RurV7mDs58s
	 970ue5ZeV1rgt7g6dFZ+8oIpf8QAIo3F6Tjh5cSYlydy0BpYx5alCTNNdtzcLcaodN
	 og9dOyUdAchXj7eSUxN9wizGrmoYXsDSV1nCQcTMmW4k9sLjtcFFVwTOka0kSJHG9u
	 RJpA1utgKrUPd7BGeOArJLDahZg4QF0t/T5bvwFtbf3bYRDfYeRRkjmFq+6wnj0ZF6
	 g4SXpG+horvyQ==
Date: Tue, 1 Sep 2026 18:54:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 2/4] dt-bindings: usb: generic-ehci: Document ST
 STM32MP2 SoC compatibles
Message-ID: <20260901-buzz-mousiness-96fa5be618eb@spud>
References: <20260831231814.137120-1-marex@nabladev.com>
 <20260831231814.137120-3-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M8TW/Do5h1gH3Rsl"
Content-Disposition: inline
In-Reply-To: <20260831231814.137120-3-marex@nabladev.com>

--M8TW/Do5h1gH3Rsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 01:17:33AM +0200, Marek Vasut wrote:
> Document SoC compatibles for ST STM32MP23xx and STM32MP25xx series of
> SoC, so they can be used as more accurate compatible in SoC DTSI. The
> SoC uses access controllers, therefore document access-controllers DT
> property. For details, see access-controllers/access-controllers.yaml.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V4: New patch
> V5: - Fix typo, clocs -> clocks
>     - List clocks entries as list of description:
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 5d9dfea8e2160..908b02d9175e0 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -57,6 +57,8 @@ properties:
>                - socionext,uniphier-ehci
>                - st,stm32mp13-ehci
>                - st,stm32mp15-ehci
> +              - st,stm32mp23-ehci
> +              - st,stm32mp25-ehci
>            - const: generic-ehci
>        - items:
>            - enum:
> @@ -82,6 +84,9 @@ properties:
>      minItems: 1
>      maxItems: 2
> =20
> +  access-controllers:
> +    maxItems: 1
> +
>    dma-coherent: true
> =20
>    interrupts:
> @@ -195,6 +200,23 @@ allOf:
>      else:
>        properties:
>          clock-names: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp23-ehci
> +              - st,stm32mp25-ehci
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PHY clock
> +            - description: Bus clock
> +
> +      required:
> +        - access-controllers
> +        - clocks

Since the property is new, I think you should add

else: properties: access-controllers: false

even though it may mean a bit more of a restructure if another platform
wants access controllers.

pw-bot: changes-requested

Cheers,
Conor.

> =20
>  unevaluatedProperties: false
> =20
> --=20
> 2.53.0
>=20

--M8TW/Do5h1gH3Rsl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcRZQAKCRB4tDGHoIJi
0lp4AP9cO9zhPwXHXdTZ0IDfuCD/7PlDxqvGX0qqGN7BC14/qwD9HpJvU/g8afzg
cbfHzBkuvbcExEn4EkIIee5Xqz/7LQI=
=xSDU
-----END PGP SIGNATURE-----

--M8TW/Do5h1gH3Rsl--
