Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0C4446EB;
	Wed,  9 Sep 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939384; cv=none; b=i5aYLtKp+dzTv+iN4/uWhSD3bBz8L0e9XZT2G6zCc08Riec8XhVo3cbXdbmCQTQcN9xoKAWh+NPT5ZdTQMHdJo/yaD4+YHxnPyx1G4PKpXExDG5lvKA5zhHsVHR3jaeYPfUGPqx5C/nKod4aCIrIlEQRPsi3gl74r7W/Pj0cbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939384; c=relaxed/simple;
	bh=+9WuLl1oElZk4HlSIyBtNy8gcu4pAfjIJvqSrBP46Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw9J2bIJcZFFbvRGWEVDqwtIFTRoN+4H/UEuAGzucsOGR9tl6t2aMD+5xGtaRy/hb0Vxy/6t0mBSQxtL+TtTF59BDxoVeIsdTh1G1EYH8ihHh4+jrIMc4fPkhBwgfrK2BdklymVlXJ8PRoDf3186yX6ht61UIfWJdyMshDgbQRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gp3pPNbW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gp3pPNbW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61281F00A3A;
	Wed,  9 Sep 2026 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939381;
	bh=50/Uc4Yl1tKGwCLAhA68Cobk3fPug6UFczZHGZ6O+As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gp3pPNbWMNCe2PPjvWto9sA/78o4DJGp8fsnWEJztp0a+AsMBrwJOCDgrb0Opi6vz
	 2Lkr5EKk8GGIFR2GhBqQL3gbxdkdCgu/0QCY16W8RDai0S+D7CtNjcForw+tGLBxrf
	 NM834njWu61JAhgSJiW/00HQfcLgy3d9/6QmtpmXdEH1HEAQq8qAQmSRahu4VKQEpT
	 c9yy41m7GzRC1oEeEe36cYQWJKoevzzej1SFGTLLYGjYJsJC8UWloE7R3Ok7tiJcah
	 3JRzBX9gksZQPle4qw3pTso+mgY6ghd5P+2TuUhHO6z9MjQtq2qrqN8vMH4U/1Qw7w
	 KmUw2l4IIhLjw==
Date: Wed, 9 Sep 2026 09:36:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org, rogerq@ti.com, 
	Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: ti,phy-usb3: Add aspcie
 reference clock setting
Message-ID: <20260909-cherubic-exceptional-hummingbird-27b14c@quoll>
References: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
 <20260905211555.15944-2-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260905211555.15944-2-david.oberhollenzer@sigma-star.at>

On Sat, Sep 05, 2026 at 11:15:54PM +0200, David Oberhollenzer wrote:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: ti,phy-pipe3-pcie
> +    then:
> +      properties:
> +        ti,syscon-acspcie-tx-rx: false
>  
>  required:
>    - reg
> @@ -135,4 +158,19 @@ examples:
>          syscon-pllreset = <&scm_conf 0x3fc>;
>          #phy-cells = <0>;
>      };
> +
> +  - |
> +    /* TI PIPE3 PCIE PHY */
> +    pcie-phy@4a0a4000 {

There are already two examples, so we usually do not need a third one
for difference in one property.

Drop, with this change:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

