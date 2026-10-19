Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1148DB37;
	Mon, 19 Oct 2026 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400021; cv=none; b=pgjUFpHjVoRPZEtrrcguUdZulpAul3j3OhDe5EUU1FzeWIeh3ymZmFe9BI1Mfd5BxtnP1F9SJcVhJGWna5ULpnFNFme9+CT7/gVbYE2PA3gQ0rwUutnz0QZNVqb+Ies0ESbNRVPYnqj1gAoiPxOxQEhgGhtFZrHhcm1HlfpNPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400021; c=relaxed/simple;
	bh=iE/9OeIe9LEM3gCqnE1A0C+mVuaVLsnNC4ZcvLVzlP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxUduH/HEDR4x3TedfSw9Xd6UDI0p3sYgYhGUfW62xmbM5Np7edKKWlo4C1F/FMXbZO3/qS46eGPYxDYHYrbfw+vTmluxVi6FWJS6V7GBJZYIviKk262hEt4ETjgVMUkqunsAlrxl61uD4xmrg4qvbsZqN8yAOYYcLEPL2wZhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FS66MYHD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FS66MYHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD951F000C4;
	Mon, 19 Oct 2026 08:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792400018;
	bh=wVbdW4U5nHvILqR2Sarhn6+ygp6qQGiqBjV2V8YyhjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FS66MYHDGt9FkU4MDgxc6VyocLm3TND5YW6PM98TIB4hzWG1Z43tt7Wbc9QkTbT1f
	 poWIuR7Rc8+l3kpDP4+/MkDFLjQyYrSOL5Yu1DbWumqO+qLOVAf6SrLR51W35J9/ph
	 kx1u5nBcM6IlY+RoWwy6Lg3hV9suKE7xljLmC+Krw0geCojFdpNvm64i8al+cQrxy5
	 60eUlfiZtBR1NoGTw5hcbR7QDt/jdqHy3Dj8+5L7BwBdYU8TDT2yTKeTY9gmwHqw8n
	 dzlTbS0QEnhhSB4MGhUYnY2fuRjnEAAqjRSd4vcOYR+OqvAKUhE3iWLBufp9AVQsxe
	 Q2Lqbf0Wc7EeQ==
Date: Mon, 19 Oct 2026 10:53:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Message-ID: <20261019-zealous-origami-angelfish-207da7@quoll>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261018-macaudio-v3-1-abdff7741dea@gmail.com>

On Sun, Oct 18, 2026 at 03:53:55PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many. Enable this with the common
> sound-name-prefix property.
>=20
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l84.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> index 94062c1d9d45..ca137aa57461 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
>  maintainers:
>    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> =20
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description: |
>    The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
>    in personal computers sold by Apple. It was first seen in 2021 Macbook
> @@ -32,6 +35,8 @@ properties:
>    '#sound-dai-cells':
>      const: 0
> =20
> +  sound-name-prefix: true

Drop. Repeating myself from v2: just use the same code as others, e.g.
cirrus,cs42l51 or other codecs. You only need ref and unevaluatedProps.

Best regards,
Krzysztof

