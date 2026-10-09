Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365E4A3D45;
	Fri,  9 Oct 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542306; cv=none; b=aC8gGOK7dUVlG5et8wXtKd4fgXxMM1LvTCgtjukJIxrEVszwe3luSD0HV5mhlQuhDwglE57lRCrj3Yfl/NnG1FLxyUXY/NEBFrTATnlA63A0SpYmen13iE4h/Y341euGVDGEla8STHEoXgJ3mwN2BsWvkd71xMWhiK2KUl9hhgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542306; c=relaxed/simple;
	bh=htENU+WFv6b7WEProazmWjD+smGKS7hwdNNZFKYqrJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1FnLVARTVFf37t7WZvSDtmQmnZ3Qr5aFUuGJPFZbrfbokaSmOSxurue9giShamaOjdPYDqDTwnlyJuET4klYQiU+YXDQri6VLLs11ZapYEcCRFqTK/NufIiEaAsm6BQs/06qoHckKE+iHvlDWWgDqnKdly7D44S/SoNjhggi6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ukif069b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ukif069b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C0D1F00893;
	Fri,  9 Oct 2026 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791542304;
	bh=w5904W0t0ZnvcUfCq5bhPXcTL7BLZj4BKiiOXdO29Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ukif069bsCLtQOooviYuWtvgl9fw2ZX8IPNm34pI0LflzZOKQaKHMZ1PZGy/6vrg/
	 MABARoWjyTQIPt50Y+6gGWkTv+/nKeKcoCiU9lwYe7GZaabvVBg3Ibi33+3fefgaMc
	 35RtQnn2gyFIm4mETr9StcYYzBXtxJVRdBVpAPQo3hJwYoTGJLvG5LFpA8j5kYn7sl
	 pqSddMM7LzYlq1AG5OqbtyUcyoFbOl4uIgVIVWqkYAZxHes/ys54S5nEWXaiPrE7eG
	 6n/KIIFZOvK4NT1wmtGSyl4LztVrSsEUwzTktiQyVfey2LBOMpdXhdr4CQRc2UaMrI
	 hnyts23gYx7Cw==
Date: Fri, 9 Oct 2026 12:38:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OV3660 image
 sensor
Message-ID: <20261009-merry-idealistic-hornet-0ee3e9@quoll>
References: <20261008160650.73927-1-tien.nguyenminh@embeddedlinux.blog>
 <20261008160650.73927-2-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008160650.73927-2-tien.nguyenminh@embeddedlinux.blog>

On Thu, Oct 08, 2026 at 11:06:49PM +0700, Nguyen Minh Tien wrote:
> Add a binding for the OmniVision OV3660, a 1/5" 3 megapixel CMOS image
> sensor with an image signal processor and a parallel (DVP) output.
> 
> Its 1.5 V core can come from an internal regulator, so the DVDD supply
> is optional. The endpoint gives the bus width, the sync and pixel clock
> polarities, and the pixel clock frequencies the board can take.
> 
> Assisted-by: Claude:claude-opus-5-5

: LLM

(see current docs)

> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>

...

> +  avdd-supply:
> +    description: Analog voltage supply, 2.8 volts
> +
> +  dovdd-supply:
> +    description: Digital I/O voltage supply, 1.8 or 2.8 volts
> +
> +  dvdd-supply:
> +    description:
> +      Digital core voltage supply, 1.5 volts. Not needed when the internal
> +      regulator is used.
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Reference to the GPIO connected to the PWDN pin, if any.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reference to the GPIO connected to the RESETB pin, if any.
> +

All this looks the same as ovti,ov2732, so are you sure bindings should
be different?

> +  port:
> +    description: Parallel output port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-width:
> +            enum: [8, 10]
> +
> +          data-shift:
> +            enum: [0, 2]
> +
> +          pclk-sample:
> +            enum: [0, 1]

I guess these constraints are different than other ov-sensors...

> +
> +        required:
> +          - bus-width
> +          - hsync-active
> +          - vsync-active
> +          - pclk-sample
> +          - link-frequencies

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

