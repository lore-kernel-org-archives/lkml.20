Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58F236A367;
	Sat,  3 Oct 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038409; cv=none; b=Ybnebd47MqV4hsbFDdVkwbfNnOqJHDGjZO4K/SEh/el1bRL5IzhZD0YIGDlkdKwSs5k/xckRUcP2DTdWNs5sQ9+OtlbykO8spLEdSz8AiaC4F/SKBcPAC4yULU+kK5Ac6ZucmF0RcGB2X78capo9oCpYuYM5YuNSnGVjeinoEcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038409; c=relaxed/simple;
	bh=4/ep0ly5IKG6T+M5PHDM9lTyqAaJf0SNuhSnwW0ak7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOevdxksTSLyX5rUz8WF7EtOipPvNLByhwxgduoWNwmFGi6Gby3LSpbc3X/JbeT4f0cAfEKa6wmHMi9JAu75x+P28KZ4fwfRooC8LMwWsIDmI1zHUq2MZ5JzC5buIvW/LqIh+QKh77SaUJclmaEn8u8yXr8ddcugs4M51uqorzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8KKBSqd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8KKBSqd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1D71F0089B;
	Sat,  3 Oct 2026 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038405;
	bh=CTabz4k5Pu6RL0JYLkoNNQQVHbYboO3IWOxirWvU088=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H8KKBSqd1lH0Fx13M/hdBhHXIVsjXUY29DeHXhIVdOmKjKEX/QgLfSm/Xsrp8CmTc
	 H8pEQcZCCz2OYKD6ocLSGdywoW3a4X43NL62xecE8aKvLPr+LYlivANEKH3z9A3oga
	 Z1tFrwik1JiJ903uFLy6l8/FxZJI+sC3vA6U122n6mI0/2lxFXbb+xTJv9DvnL+Cmu
	 RSFWMWzkec/Nq/eqSTthzF/HEzhovWtiSljIYRyk4JwfnxmRoKcdotFf+9OP1V+qYt
	 22WJPi4uaDFLPEDuCdzLXIBNDUY4pkIWrIEF/Ilh1gFrFI0cL8b5ULYo70GbVCA6kU
	 kJFkTMx//2dFA==
Date: Sat, 3 Oct 2026 16:40:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH 1/4] dt-bindings: arm: aspeed: Add Intel AVCRP board
Message-ID: <20261003-effective-acoustic-toucanet-7f615f@quoll>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <63367a27ef8c7f27a9d273b65b02b02009d149c6.1790344811.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63367a27ef8c7f27a9d273b65b02b02009d149c6.1790344811.git.dawid.glazik@linux.intel.com>

On Fri, Oct 02, 2026 at 06:32:42PM +0200, Dawid Glazik wrote:
> Add a compatible string for Intel AVCRP BMC board.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 8ec7a3e74a21..2c8180e49b2f 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -106,6 +106,7 @@ properties:
>                - ibm,rainier-bmc
>                - ibm,sbp1-bmc
>                - ibm,system1-bmc
> +              - intel,avcrp-bmc

Why breaking the order? I could imagine people adding to the end,
because they do not care yet still follows some logic. But this
counters any logic.

>                - ibm,tacoma-bmc

Best regards,
Krzysztof

