Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386904;
	b=fRAO7N5WZIKB+oHMTqC6mxwvLBH44bVIcXlVM4RFFGW1WOmepVpYUrkmgXvt2b1FAhjT
	 EGKSyTCgz2gVtGl99rtnm2uLR5O0ZG6HuwepsWwzBTQ1MH6WpeQqBnqSqC5Ro/NkPfb6Q
	 kkkFu/sSzWWDFzEfzxz5vunUT1PHlhVDWhUfge5nHLUXm7qK7mCJ7bV0QFVgUqbmLUOVq
	 xcSC/p1K6dBTLHd/eE6c4U7YUyohIgIhR3Cgugj7rujM2SY3OseWs0tKAPAuKiDP+zFLZ
	 w/Eqgi8dJa+7UuuOto2ZWM+pdOlXNQLi+y6iwzg1SQ/VAutAHwKA+isbucsB0lJD2cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386904;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L03Xks0F4JS44tFcmr8wV8P5pEKbbPBkcDezNiRJeVU=;
	b=5rRKUmvPPoZ9aDU91l5o0U/xmVA574e0Hez4CF05+ezIJk7CPXMaB3cbe4pNue6mPnnW
	 gloewjhjXKgBhwkyOalcl5jRS0i5E7QTOqoxpRP8I0vN9OC0BaGRen3UXGdJix6FCwzAE
	 xt6Er3QznNoMnZJkKYFiVA/YoymRX19fWz3LHAsfc/pZKNYuRWGtsFhpYDdqyQ61QMgjb
	 WaQ2aFIGdz1dFuw5UkXA6TilsoZwDST0xRKE+w9QlMpoqkcquA2uMz17EI+vFw0UU+9al
	 12oFwO8WPa39CPwPiLuO4BUYKYKM3UlGKX4xDlK1Y1JfgvAnR4wazx0b0mzGUKI+uCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abnqDfH0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7E8606A31C;
	Wed, 11 Nov 2026 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abnqDfH0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CFD1F00A06;
	Wed, 11 Nov 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386904;
	bh=L03Xks0F4JS44tFcmr8wV8P5pEKbbPBkcDezNiRJeVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=abnqDfH0odENuQHiaCZy7paRwa0bh3EZqXIfvDlZdaqqf6DaMa3EyZMeRYHi/E0M9
	 KzVY164E6utc/FuZf/GxmEI4+qmIfzV2Yj5RDd/mD4082LUqbi8s4DjsGqiFmAIkqT
	 Cilk+iwvNuAnFlsEj+I+kZ/BFfIuYGsAnUGB1yQV5FvR7d64ldlEsfPSbPsfxDXUKr
	 ncQ58hUMKSE1n1ei56aoNzRbf4GsNWEqfc3S00syujMM6S4X1AP6jS4rLLZEHyVJlC
	 Td+RY8rsJUpNA/YZ5NAYeUqELvuddCA7jgMOQVvFvlGLPCIulexQL7XVjScGyGyc7B
	 1EmRAmFPSXCNA==
Date: Wed, 11 Nov 2026 09:48:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Message-ID: <20261111-fictional-vigilant-serval-eea5bd@quoll>
References: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
 <20261106101210.1059256-2-hongliang.yang@cixtech.com>
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
In-Reply-To: <20261106101210.1059256-2-hongliang.yang@cixtech.com>

On Fri, Nov 06, 2026 at 06:12:09PM +0800, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 Cadence USBSSP controller.
> Each instance wraps one of the two USB3 Type-A DRD controllers of the
> SoC and owns a register range in the USB30 Type-A DRD RCSU block at
> 0x091c0000:
> 
>   offset  register       contents                       controller
>   0x0300  STRAP_PIN0     stream ID (SID/SSID)           USB4
>   0x0304  STRAP_PIN1     stream ID (SID/SSID)           USB5
>   0x030c  STRAP_PIN3     clock enables, ctrl and PHYs   USB4, USB5
>   0x0314  STRAP_PIN5     awcache[3:0], arcache[7:4]     USB4
>   0x0324  STRAP_PIN9     awcache[3:0], arcache[7:4]     USB5
>   0x0328  STRAP_PIN10    USB2 PLL controls              USB4
>   0x0400  STRAP_STATUS0  AXI clock enable/valid/req     USB4
>   0x0410  STRAP_STATUS4  AXI clock enable/valid/req     USB5
> 
> Controller 0 of the block is used by USB4, controller 1 is used by
> USB5. The range of each instance starts at its own AXI cache attribute
> strap register and ends after its own AXI clock status register, so the
> two ranges overlap: the strap and status registers of the two
> controllers are interleaved in the block.
> 
> The Cadence USBSSP core itself is described by a child node at its own
> address. Mode strap controls are programmed through the Sky1 S5 system
> controller referenced by the cix,usb-syscon phandle, whose arguments
> give the register offset and the bit position of the strap field.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---

Unanswered comments from Sashiko, dropping from DT Patchwork.

Best regards,
Krzysztof

