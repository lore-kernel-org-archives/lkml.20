Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9072D471D1F;
	Fri,  9 Oct 2026 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529910; cv=none; b=I8cRwz907VA/iEgcdqtNpRaMY4w6PeB7hTaCWUgfNQOzWb5abkyNIWpOmXbm+BoG/gigbMMXoaCQD9VzHhite0QO80M9b9J6dMZkcZtshRov26O3xtPymdu5Sj1YrpD91r+R1EyojaDJ8nQTHR5o/eUDvkaiffIoQzkFRLA+Aio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529910; c=relaxed/simple;
	bh=ZTTeEfKO0JQYilSrfkLNFEbkGh5wzdDZPBQrwtai6kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7J7u+XEsWH+USwhcoXxfstW4LoiZrFJ5JfYWdW5d7vq0yjOcNQRFXzFKjSWQrG4jmAq2I1Lpqk8v5jn1aM8zm30Hg3hG2M8J7MfhKX9mkoqL5ApqbB/k2dUapSaqceQbldjH6GfrZWiEK7BZSP7KgGrK2WZOoa0Ice/UoYRsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBLCCVAR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBLCCVAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D48A1F00893;
	Fri,  9 Oct 2026 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529909;
	bh=ev/NmiRklbf7MpR6x3GqJ6NVg6ju9b3tRe0belW+GrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBLCCVARNQZjCVwaKE7AvOVM94/5/weCbcxR8bc5UFMLbCNAcLT/fTp5h4pbn08qW
	 8NJd5dgSEgtr/9G4nUmxjnOXqgjKeMErK1T6cw8RuntpPSkJfW7bCflwQHvlLCrNj+
	 HLkBOizDCX2+nPGTiS4yf+j+J3HmG7eqDZBTkY6F+/Cd4Ki/+4/qQW14Aaihkln3J5
	 oK5ea3QtI+UtDG9k3NIF9Ktot8Bw0NTAM+gIubWxSzyNCDEY/BYS6//6abYBBWftwj
	 hwf28Ds5v+9ZRTA+vi7WXeJTX9u28mGwkRFX8zcWjjNowUVW82JDXNc1i+3xX4NZzN
	 BzGF1rBnZSEEQ==
Date: Fri, 9 Oct 2026 09:11:46 +0200
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
Subject: Re: [PATCH v2 04/21] ASoC: dt-bindings: cs42l42: Document
 sound-name-prefix property
Message-ID: <20261009-festive-able-nautilus-b92ffd@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>

On Sun, Oct 04, 2026 at 04:03:31PM +1000, James Calligeros wrote:
> Some consumers may wish to prepend the codec's name with a known value
> to identify a specific codec among many. Enable this with the common
> sound-name-prefix property.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index bc759eaadeca..035463be1456 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -29,6 +29,9 @@ properties:
>    '#sound-dai-cells':
>      const: 0
>  
> +  sound-name-prefix:

No. You reference respective schemas.

> +    $ref: component-common.yaml#/properties/sound-name-prefix

git grep 'properties/sound-name-prefix'

You cannot find such code. This should give you a hint, that you are
doing something odd.

Best regards,
Krzysztof

