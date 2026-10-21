Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551961;
	b=XDrKbPxdAC7nKZjGYiDZkJVvbaMAecqwW79VNicVySOP0Y41xFv/hTxRtTq6+5iPeZ9+
	 efuMgbwlZULjc3Tw2I5qmnTV9jDIS6D31QtouuGK8WngugxbRir9fFoo1RpO+SzxAyFso
	 xjqRaMzVcsheLk3AAF2xpFmy9CBoTKtklAhDz2zNcUrJODukI/9PwwsIViFDsOgjx5u5o
	 jh1I3HcbNozVLs2Ievd6NqBx/q2s7IVfbCP3v0/Byhsf57H84dFl/l9OmzfWrxzXwU0HL
	 Wy/0qj/B4dwwHH+I8WOZ+7riTJ3ytjyz2kSGvm7nGHWsbyD6PijQsnXPziv3IoN46xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551961;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YWCBZA77zc/p/5rLcj2aumPqvMgt4N1QGO7iyPGLOqs=;
	b=g2woWanqd0JJfGUj4T4AboiBl2ZYiuTY3KxXGGESBWud088f9A2ICCnXqvXTRbBAntd/
	 dNiKPQKVo69qKa40c/+I+CyVLYyqbpYyQBePlebvfKJwvh4KgboCiqAX933drmTu7al9R
	 mq2C2rWdOrG1AY70NxX84pYpwWdYBdpRxW9rljqcOUUVj3lAqBaDBT8OCulxRY6CxD44a
	 4gYEllJy2v7WDiwkpj0FFrebddCYEPu9ktZj7K6ayQKrk8U4dFvPPhb3EqhsHluRAdDI3
	 E6d9+GLOhlncLGJHXlAGT4dV6hxjE7hFeAffShq5jU4Kjuwc5bLqhfidUaDV3t8e4WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMv2JSWj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218A7606A319;
	Wed, 21 Oct 2026 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMv2JSWj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C873A1F000C9;
	Wed, 21 Oct 2026 03:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792551961;
	bh=YWCBZA77zc/p/5rLcj2aumPqvMgt4N1QGO7iyPGLOqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CMv2JSWjRnAZ2/m4AEei3NrqIExmFUjFGQ1RY/thuH7p1SGY1bj5GCd14enqm6Ef7
	 Sf65nQBJlLmx6elbTPwkhB/IxYoD6bdGI1ZkYIBdzJM9kZpL2T0lDQ84f1E4kOiyqN
	 MY2UEqCt82KT7NTkTlqjviUzZrtr7tI3nWRAwJ0S1HwTjn4AaUcpFFstAvhm35Ob8q
	 Gdx2kqBn5wdbxhPpCHdjLV854oQD1H9q2ocTp4HVU1zdiJZxGw7SmBZN6xqKTzMhkk
	 KnRyuHFxmOxH7kgh3pMf9v9O2ehLKl2yKSjivHPvR+SzLgKV0eq092neBf+owZFfAg
	 CvstQOvSTwohg==
Date: Tue, 20 Oct 2026 22:06:00 -0500
From: Rob Herring <robh@kernel.org>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Message-ID: <20261021030600.GA3816650-robh@kernel.org>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
 <20261020140127.720-2-yaozhonguwl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020140127.720-2-yaozhonguwl@gmail.com>

On Tue, Oct 20, 2026 at 10:01:12PM +0800, Yaozhong Li wrote:
> Some boards route "power hold" lines from the SoC into the board's power
> circuitry. Those lines have to be held asserted while the system is
> running and released before the PMIC shutdown request is written,
> otherwise the rails can drop and come back up instead of staying off.
> 
> Add power-hold-gpios to describe those lines and power-hold-delay-ms for
> the settle time. The driver reads them for every RK8xx variant that is
> the system power controller, so add them to all seven RK8xx schemas.
> 
> The array is bounded at two entries. Firefly's vendor kernel handles
> exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
> files use one or both of them, with an RK808 and with an RK818.
> 
> The lines are released from the PMIC's power-off path, so they are only
> meaningful when the PMIC is the system power controller. Require that,
> accepting whichever spellings of the property each schema allows.
> 
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
>  .../bindings/mfd/rockchip,rk801.yaml          | 23 +++++++++++++++
>  .../bindings/mfd/rockchip,rk805.yaml          | 29 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk806.yaml          | 23 +++++++++++++++
>  .../bindings/mfd/rockchip,rk808.yaml          | 29 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk816.yaml          | 23 +++++++++++++++
>  .../bindings/mfd/rockchip,rk817.yaml          | 29 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk818.yaml          | 29 +++++++++++++++++++
>  7 files changed, 185 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> index 7c71447..2f9554d 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> @@ -29,6 +29,25 @@ properties:
>      description:
>        Telling whether or not this PMIC is controlling the system power.
>  
> +  power-hold-gpios:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Board level power hold lines driven by the SoC. They have to be held
> +      asserted while the system is running and released before the PMIC
> +      shutdown request is written, otherwise the rails can drop and come
> +      back up instead of staying off. Only meaningful when this PMIC is the
> +      system power controller, as the lines are released as part of its
> +      power-off path.
> +      The lines are released in the order listed, and power-hold-delay-ms
> +      elapses once, after the last of them.
> +
> +  power-hold-delay-ms:
> +    default: 0
> +    description:
> +      Time to wait after releasing power-hold-gpios before the shutdown
> +      request is written, to let the lines settle.
> +
>    wakeup-source:
>      type: boolean
>      description:
> @@ -71,6 +90,10 @@ properties:
>          unevaluatedProperties: false
>      additionalProperties: false
>  
> +dependencies:
> +  power-hold-delay-ms: [ power-hold-gpios ]
> +  power-hold-gpios: [ system-power-controller ]
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> index da23915..1a11c98 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> @@ -48,6 +48,26 @@ properties:
>  
>    system-power-controller: true
>  
> +  power-hold-gpios:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Board level power hold lines driven by the SoC. They have to be held
> +      asserted while the system is running and released before the PMIC
> +      shutdown request is written, otherwise the rails can drop and come
> +      back up instead of staying off. Only meaningful when this PMIC is the
> +      system power controller, through either system-power-controller or
> +      the deprecated rockchip,system-power-controller, as the lines are
> +      released as part of its power-off path.
> +      The lines are released in the order listed, and power-hold-delay-ms
> +      elapses once, after the last of them.

If you have paragraphs, you need a '>' modifier and blank line between 
paragraphs.

> +
> +  power-hold-delay-ms:
> +    default: 0
> +    description:
> +      Time to wait after releasing power-hold-gpios before the shutdown
> +      request is written, to let the lines settle.
> +
>    wakeup-source:
>      type: boolean
>      description:
> @@ -102,6 +122,15 @@ allOf:
>          clock-output-names:
>            maxItems: 2
>  
> +dependencies:

If you are going to use dependentSchemas, then use dependentRequired 
here.

> +  power-hold-delay-ms: [ power-hold-gpios ]
> +
> +dependentSchemas:
> +  power-hold-gpios:
> +    anyOf:
> +      - required: [ system-power-controller ]
> +      - required: [ 'rockchip,system-power-controller' ]

Presumably the latter is deprecated. If you are updating a DT to use 
power-hold-gpios, then replace 'rockchip,system-power-controller' with 
'system-power-controller' while you are doing that. Then this can be 
just a dependentRequired entry.

Rob
