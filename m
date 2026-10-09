Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2946DFF2;
	Fri,  9 Oct 2026 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529756; cv=none; b=AHwEA2Ne5tAepIDGRyjWkd9zy1ICpoveevD6MsNPj3IMLLfMBKOBnb11t1noVmOVhdEKFHKyL4FkeFmikzyNxe62IK5rlAKjmb4m8V4T9twg/U58RSw+SivoyaPXtXUouvBoJdFQLp5c+jPXA4jGVEeQWrGhWaOmjawgjfsiSks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529756; c=relaxed/simple;
	bh=dRSKqxBk0l4UTOK5yCxTGrnmuOaylw24FNivom5VtTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjokWehfugz/J2ysUBPpawks77oNTeN03nT122AEB9vTErdoMngIAof0cFHgZEkQlpS7WaPj0TNOOjAHcH16WjhBGe22cp2lGn3gf2olVEfhPZp92wt31N5kUvuylvAxoWXIFtRQIKs8XrBVN+eqLuFDT5IU2HSULxxlyWn1h8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avLoLWDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avLoLWDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2451F000FF;
	Fri,  9 Oct 2026 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529755;
	bh=/bxYgc+BIWyTHTpIoYsKHTtIpwISik8NaCfsLHWZJJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=avLoLWDSeATNSyKLU6aWZlJTBy1To5PXYpH2ocPDV3UNfsGGrvHtgYIl0GJHlIALv
	 rJrpi1OFqokCT06+NXJFsC9HBjo43n084vwduZvy8//hW8e9DdXmYpZgJZDJ0s3vhZ
	 E4qHkdvH11SHh2eyDUXEr3eOXbiR5fKPvr+8FrTF9UG4aCG5GEO1i7J7IcwVgEMwWl
	 F8g0ihEihi0kXLrCRECgANDv0Y6JmUi0qujNG2jf3xJJiKMYEkmzxltxhi8t5xNHPj
	 +16x0WapHBldX0OAOdoZ683THeQnkE/ZXEvLVbaD8o7QA2mVbRC7Yf2WMdvHRCmhbZ
	 nE8XtVOT3yW2g==
Date: Fri, 9 Oct 2026 09:09:11 +0200
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
Subject: Re: [PATCH v2 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Message-ID: <20261009-kind-crouching-sparrow-1bcd94@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>

On Sun, Oct 04, 2026 at 04:03:28PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many. Enable this with the common
> sound-name-prefix property.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l84.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> index 94062c1d9d45..2637aa5f4326 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> @@ -32,6 +32,9 @@ properties:
>    '#sound-dai-cells':
>      const: 0
>  
> +  sound-name-prefix:
> +    $ref: component-common.yaml#/properties/sound-name-prefix

That's a codec device, so why aren't you just using dai-common.yaml
($ref) like others?

Best regards,
Krzysztof

