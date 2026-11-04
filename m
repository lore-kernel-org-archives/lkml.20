Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789311;
	b=ZTL5YaOE/8CO8YbAfuKCMMIZ+mRUFbDGBGIQVWqHdRJv1fPKPnA4nix+V2OVa4cegl2l
	 8ESQJjlUwXPzKby9zwDIL5zCkji3f/kO7tBgOa5VCRAElteJXFJ/025w94cNXjNFECe2d
	 Y6N/P6gEFuXcTqhrKiFAibwOV9rNRMXD2wVgVHqoa9jUzpGPWkfHmBKMFx0NUZmazFZpz
	 P37vsaHIMOMiNCBoEXdkg3cTLgTi0/IC1vWYj+rGrY3Ub4LUsVipPfuZDglvPWxtbJvNG
	 LMwluNlXyFt2DZlCP/+DlW2UZmaQRV8LAxbaFmlbQW2n07FEyPuE+rT3s+dvKYVxdPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789311;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=r0yndPxUhhPiOlKsOGZcPIxshPKvfSmviX9txktuT6o=;
	b=bLLThhI264s5x/EAPmB9OEO72bK+y81+I3CknR7K8HUFYuet2eYl7v1+uiB/K/kYonwF
	 9Aii8HEDLSOS2k0QMG5lETgH+/JHLjwpeJJ21rWoOvP6gJk1Et2uY5hf60ePbqcrDW/11
	 UTBWw5iPXDTHwhmll6q8T1R9uoSc/PDI1n7lay6ocIBUp/XeenZ89MkWQHwy75zj2cBsv
	 DBAFk7OGSVpfB95VWTU1sfEpKwS3fO32rVOjgEOZLJ2MWpGVleQ5fW8dy5h0oLDyC0e97
	 I3o4rp7Kzw1BdOTVw0wBjYJm94X4i/c5Re7JEYUAXP391LmD1Fz6gbkzSfYr/PSXCbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ii+Uo71R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3354606A31B;
	Wed,  4 Nov 2026 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ii+Uo71R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE90C1F00A17;
	Wed,  4 Nov 2026 10:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789310;
	bh=r0yndPxUhhPiOlKsOGZcPIxshPKvfSmviX9txktuT6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ii+Uo71R6czgiB17H6WDqTqqQ0xTPO1fBU8EtxEAPFVA4ntlhk8S/834W7Pv6V8hT
	 4I3EDGs2Vw8QG+GxUZnGI6VK5tQWb9XMVplL4OtWSzZcBFry5H59dnlb11Lvs8lEYL
	 8T10fWSGuC1ATHYC8zw4tU9LQufBL1cex5+YM3EqwjCkde/aqypXt+VaxUemgcwMlX
	 SCEw9cYwrP9UCaPJ8VmjkUz+r6pPTExufacLcsbeopvqtO7IdX592eEc3Gihl42hXK
	 Xhf5Cvo9LJL7Cdni19/YDPKq/zmmiShUn7gysgrntxpBFyB/7lAyFDJ+YgzSFfg4It
	 bxYOpHci/bRRA==
Date: Wed, 4 Nov 2026 11:48:25 +0100
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
Subject: Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
Message-ID: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261103-macaudio-v4-1-637484efe46d@gmail.com>

On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many and set #sound-dai-cells. Allow
> this by allowing referenced properties from dai-common.yaml.
>=20
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> index 94062c1d9d45..66cae8b7db5d 100644
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
> @@ -29,14 +32,11 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> -  '#sound-dai-cells':
> -    const: 0

This should not be removed. Why cells of 1 would be correct? If so,
explain in commit msg.

Best regards,
Krzysztof

