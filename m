Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BFC4195A1;
	Mon, 28 Sep 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601131; cv=none; b=i9WGt3t44QGPJ5hE5FuQtcoPyqbVw/FyBA+Yb6UrTYtXzqJ3cJZbfvlpy+BLdq7UE88S3vy3BirOJonwuYZMElxpj21C2NmSDOU+eLEG06obMOeR7lYy4WrubZ8AsBXYig9v4VCfpdHVsfE7RWUFic6Ta/EOM3PePO7i0FZCacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601131; c=relaxed/simple;
	bh=LvKznVPaxr7Qn6GS8cQmli/wvuUZXsOoJbTtuEC/ZYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCqyVL7fO9pVMjcVuelLa3wQo13CeGt84Z0ACiS6eIYSHd9e1F4Fvm1/5tV4nw5KyW+H2eup5n5OkGBZQAo8JYcyG5juLd/lcAcQxr1wvOIIaDEbUHy+NnNT9+cfQ6NMB3uJDa0zU5Js0LqDjaSrkj+CqNwM4R6HTqJnnEl1qsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+4dQkcq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+4dQkcq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623771F000FF;
	Mon, 28 Sep 2026 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601129;
	bh=TDGLKvGEvXSVKZZb1PczPZS+/UB+0XMqQgxJOcgkmkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E+4dQkcq+qNatMvKQ3LXKXWIjfOkyAnuFdlxR4dPjrMQGNOHdXpIDTrO68x6RcSd7
	 V6fCYJBoHBblV1gYQxjPYG44oHkYNXSak1lpBkSobiVoG1X/dmVhE4m8e9T2RxEKwI
	 GwwrhPnwfxvt73AHOM+WXEabMMdvVS0EQPO2EU33dohev2Fi/QrLOzVwvEduAIvFtx
	 fey9SXlRPRjCOCh7n5V589PRARQ2ovQ9ET0xmBt1gCIHqNG9l29pBIOC/5ZApQT/j6
	 XAzTwfpacdjCdrJ3ej22aJOq9DN3K3cjwziyk744WfWi7jskYOOO4t3smyQOR7hVYi
	 9u5HiYcmdMdVA==
Date: Mon, 28 Sep 2026 08:12:08 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Koch <mail@alexanderkoch.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO
 support
Message-ID: <20260928131208.GA3834499-robh@kernel.org>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
 <20260928114019.1441752-3-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928114019.1441752-3-mail@alexanderkoch.net>

On Mon, Sep 28, 2026 at 01:40:19PM +0200, Alexander Koch wrote:
> Add documentation for optional property that enables operation of the
> 'PDN' pin during initialization:
> 
>     codec@10 {
>         compatible = "asahi-kasei,ak4619";
>         reg = <0x10>;
>         pdn-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;  // <--
>         #sound-dai-cells = <0>;
>     };
> 
> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
> ---
>  .../devicetree/bindings/sound/asahi-kasei,ak4619.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
> index d412531ef9a2..3c7754351e8a 100644
> --- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
> @@ -34,6 +34,12 @@ properties:
>      $ref: audio-graph-port.yaml#
>      unevaluatedProperties: false
>  
> +  pdn-gpios:

powerdown-gpios is a standard name for this function.

> +    maxItems: 1
> +    description:
> +      GPIO controlling the AK4619 PDN input pin. Used during driver
> +      probing to power up the codec.

When a driver does something is not relevant. Would be useful to state 
the active (meaning powered down state based on the naming) state.

Rob
