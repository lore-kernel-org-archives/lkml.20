Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B19472F87;
	Mon, 19 Oct 2026 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400045; cv=none; b=M6cgS1XZTE39OWeAXzIpmizoxX2Oc/oymRuSoz3lJsdcu82hglWh7WP9X9PkCaqXnRsUPV1qd1qE6Ou69USjewJF9avAGPYWtHT0VRSuxJWV+d1HMFusu23b2bL39939apee++ZhHvAuc6yUxX5YBEHENrXp7jf/A+/A0+hAuvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400045; c=relaxed/simple;
	bh=bTp8y+1waJDAhENmcOlWp8C5F1Eiv+aK0EqvUVSX7wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAqZTzeAXLwkwg9XJf+UCiFAWJI29Q4VAWSY5CdneotKqisFEkngmpkaCENRXsTHpd+txBWzKN+SG2ISWhXfPs/NCDd9q99jVp+kvu8GrEuKqx/H/RYnywUSzB/ctXUJvmM9tR0ptMuf9JLjcF2t7eCjS4Przyy5yiiQjPMspVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUTpvRew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUTpvRew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABD81F000C4;
	Mon, 19 Oct 2026 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792400044;
	bh=deOppFeydKzw0+yILTrtXYZ1PYcVSBm6AiEBoif93gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bUTpvRewgEZ03yMjzvH2QCsI5DzsapK6kjzNUurje84l1cm+lOD6KgigKLw7YnyEK
	 sBtDeRmMeyvMUWt11tgVnAsFxPsZs8yrG2ftACdfiLe1M2xPX1h/rrW3i0Z16r0oDn
	 fFdCPxPUom0VseerOYR90OtWOmk2SrgkT1zfqBE18xBqr6t+XRAEalqJCt1FMsWDCr
	 ZhbRf1Mmt2K0dzHs4tIdlBa4Rmw/TKuKWfM3urkY/8XRLBuyStn4WGAUh8YNrLrX5K
	 mo4jMpprjgN+jGmY3EYqVxHmSBkDePyGLOuLd9L7wi16aQo4Dw4KktGNIdSKB5x6kV
	 YKjhowKZci9bQ==
Date: Mon, 19 Oct 2026 10:54:01 +0200
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
Subject: Re: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document additional
 dai-common properties
Message-ID: <20261019-overjoyed-outgoing-wren-4fdcc7@quoll>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>

On Sun, Oct 18, 2026 at 03:53:56PM +1000, James Calligeros wrote:
> We may need to define both #sound-dai-cells and sound-name-prefix on some
> machines where this codec is part of a simple DAI. Document them with
> reference to dai-common to keep the style checker happy.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l42.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index ab4c7d22dc0e..aba2121ac64a 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
>  maintainers:
>    - patches@opensource.cirrus.com
>  
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description:
>    The CS42L42 is a low-power audio codec designed for portable applications.
>    It provides a high-dynamic range, stereo DAC for audio playback and a mono
> @@ -26,6 +29,10 @@ properties:
>        The I2C address of the CS42L42.
>      maxItems: 1
>  
> +  '#sound-dai-cells': true

Instead const.

> +
> +  sound-name-prefix: true

And drop this one.

Best regards,
Krzysztof

