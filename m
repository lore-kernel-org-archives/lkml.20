Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA34471D1F;
	Fri,  9 Oct 2026 07:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529849; cv=none; b=MJ1AVXWA5gvK9NXEaqziG8CYheg3/Qp2bBCPtKmaKQsyr0wks8dG94kaGdGmXp0ymWPI1oGwzeiUDPrmYrHdGzxYEqQAVfsN/C0xG1uYR3VJJajy4oF6yNwf/utP99u53/QDl+QPWpC0o5htP9zfwA8zuq7ib49Uh67GFdpnmiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529849; c=relaxed/simple;
	bh=g/t80+NYDa33JyTxb5dIwlWtKYDHVwp0G4jN79NA0sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5tKTvYCDD+EdpC/sZvh3lp2TZCGbhROHu0ekFe0X1NQJiBsbDMVoCU7CjRg6iMpNmmoJhxwv15QpsWMoPxioVLg4UlOggE7wPlDF/YBk7XJuI+fmCWmP/EsTpBlutjhR24jSeIoYJkxeHPqmWIlIXBWEHUxTCZeSaSzLTNt2/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpmbKJJ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpmbKJJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665D61F000FF;
	Fri,  9 Oct 2026 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529848;
	bh=Cbqcw/ZcJpAS2N0wcQ+lROnRhzGRuCryFX/mxseCRCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KpmbKJJ3kS+Y4PM3xApljYc4t4pcQ2/wqbIzf0sWre1HvkdbkCqmep6MNmZYSxNph
	 aB9hRUL7q01A0DMzkD+Bo8lZi6ImwTQhKJLlLkdmrnQ6kdyWO683Ya9Rl0+YSv7YgI
	 BFBO/Jhh188Ty66vLgC4SS87vdG7IzMCLYubwyvGJ4TLC1nPwytaPh2liXYESYypFJ
	 lh7QK6dao5n9RDwk9/Z6EyzBDsA9BSSSxWsW9rCBqUqeGtU5oXt3Ztxw73kcl2hX8S
	 msGxSCdsYFZjOjxCifUC/IXQIQCRLRdWsdpAQhPLb+3g4BKE9UYgGMIYtKmennE+II
	 VYTV59atDvz3A==
Date: Fri, 9 Oct 2026 09:10:44 +0200
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
Subject: Re: [PATCH v2 03/21] ASoC: dt-bindings: cs42l42: Document
 #sound-dai-cells property
Message-ID: <20261009-daft-raspberry-woodpecker-a88efd@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>

On Sun, Oct 04, 2026 at 04:03:30PM +1000, James Calligeros wrote:
> We may need to define #sound-dai-cells on some machines where this
> codec is part of a simple DAI. Document this property to keep the style
> checker happy.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index 6c100cb36699..bc759eaadeca 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -26,6 +26,9 @@ properties:
>        The I2C address of the CS42L42.
>      maxItems: 1
>  
> +  '#sound-dai-cells':
> +    const: 0

So a DAI? Then just like for every codec you need dai-common.yaml.

Best regards,
Krzysztof

