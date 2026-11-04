Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789350;
	b=qt9XqbxcGQZqdxkhE2wOUHREhvHY2YwJcMi0AW7FGMvkoMFNwboNVMCtTdS/s6T2RXXT
	 JOCXK4T+txvXbSriuuhjuLdAhKFjEbnQfEKWDIwRTn2gpZz3WyIaXuox04565ngTWCNBl
	 gJJzNJX3G0pFm353N/iGVFXfGcMY5JqbfsTRpoZdh76zOv4eAmzj3bcM6SZ1U1YXGUzkD
	 MwxR1DxAXFhpFi53z3g31tTjnKT2FGihA5zZHXe0o1Ps2DaE5RUuLO0FbXDreBDDtQX33
	 +AoTW1ImO0flDFFKsXKTAf0I/G3FrDh3BuZUg+hyINBE3VOkAbHVmdwWpjBfycuCFXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789350;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vZTO7e+scOHMZfZ0rgBwT14GC+n8HQAdcfXeVAuK/yM=;
	b=rieRhvo6uS1QrIPjTQieOxzSsnbqHQB2bShhfglepSLXtarxO63h/MHiNt6+LJT8DvJi
	 rV6ofCzJYBlViqNmLPNqhRVu5/+hTxn3h9zgZCNUx9WsrF27anpu0iDtWv+qEjS6wqWsn
	 2JtNa3GY7LswONqp0wNLwhdEQChgzpXbSVo1DuTu55+9aylU0HOCa2epT20WVb1+sy+qj
	 UV2Q+DDGpY6NOI2gTaGCG8PNF6W+A1uVPgUuzXpJlGL2+5gDYb6KbPJnfWLSkgQZfOfHs
	 yjoD+c27tvtpBzAJ/fxDSZdtqWS7BdxoyX5rFX3qD0FJsTRtW5f+G/47GC4qaX02v3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=le3NFuUc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F68606A31B;
	Wed,  4 Nov 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=le3NFuUc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9A61F000C1;
	Wed,  4 Nov 2026 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789349;
	bh=vZTO7e+scOHMZfZ0rgBwT14GC+n8HQAdcfXeVAuK/yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=le3NFuUcHXFH8dt8dhX/enpkJvbAqvt5iYEuKTjz/MCdSCaMfBEGrXZiEz6bnNscf
	 0VNK4hsQ8MC8BRbBEpdSkBgB0XUPK+UPUof5+jfwAW6p2fFs2fpcGPXn1jAaaXzROt
	 9+Ai0sn8EtYyfzlLGeTjaqZCQBIwaOgxl1j7gAevqnG5PGVs/5JT/rkroEgoh18okE
	 h+56o3Z3abo3yst7h8q0sbnSLX6dZ8EOPIG2fvBpPHGYn+O2H2plaWyhGBS2lkXW4f
	 yjXtGqyurw91eBLXwq6miaQEbrVxPRREeIMzphddaoa+mtotdoS5pER5ypfeYLSTur
	 V9D1C4ZvOBamw==
Date: Wed, 4 Nov 2026 11:49:06 +0100
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
Subject: Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
Message-ID: <20261104-strict-precise-mouflon-85cbad@quoll>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-2-637484efe46d@gmail.com>
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
In-Reply-To: <20261103-macaudio-v4-2-637484efe46d@gmail.com>

On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
> We may need to define both #sound-dai-cells and sound-name-prefix on some
> machines where this codec is part of a simple DAI. Allow this by refrencing
> dai-common.yaml and allowing its properties to be used.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index ab4c7d22dc0e..4ac0af34c464 100644
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
> @@ -193,7 +196,7 @@ required:
>    - VL-supply
>    - VA-supply

Missing dai-cells constraint

Best regards,
Krzysztof

