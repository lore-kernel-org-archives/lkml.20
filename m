Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2723E3812EC;
	Sun, 13 Sep 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292604; cv=none; b=GNQWYuR4Ay6osPnEe+M5w9vVeMhPpkpQ+JSeTw/rVH+jrqtr4dZF9DdYGtlCrOo9Fpj9Rj1eSbwXNB7yQYyG0WFubRzC9Nf+L5DOxcgP4dMBDJggcnmIHNnLJio3YVBvQ52tOIA6xOk0xxr74Uh34LhcGZnep6YPRSbAUexvGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292604; c=relaxed/simple;
	bh=4iVtPBVnOV6eK4w6hhYJzV/1e/9yVaux2PD6n/OVPWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnIymu2IKDY0uv7Kyr+53Ps4OOnQCvfHFeFQEQdCo00bckqaGRD8iuzX3NC+er3BejEmEixTL+DnLdX4xlzVmQmZ3D02APmT9k3ygvchSIpP7VDhSAXmyzDx3Ro386cAhU0Gk5FJAXC0fwkHomcAYEYFlf/g9K6lCM/WwcbIbQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmlH6tMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmlH6tMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E84E1F000FF;
	Sun, 13 Sep 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789292602;
	bh=YhzoAzdU7CmBYcfp6mL1Ifuo2y1CgJrgv3i2FzMU4lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RmlH6tMsbBxSE1YKcpXsPIAUEaku18W9kekwmFuSfzHL0zy6BUFc0tpmWpmVXjc+1
	 fIDirXVXc96dC2DELbLH250OLey8gFQBIQMxX3mpIugcoE1cYY8FOb+gyU1TqRynQZ
	 cqnQZ23uPkU0JH7OR6dxKAg2fJ3B4rfqli8GWEI6oEtGXVso3qzJl9zQUaWsVxOuhF
	 Um6lZ678hA8cUJ3t4cWlD0IXZLS4gJ6kOToGTOYe5zzi03EswtUF8cvbY/3dwrP8+J
	 Xl7MalC3nd2vwO7BTqpPLXiykNeXddOqmSl1Z71BZQWC3+2yS7HSREG7+fqgC/7N4W
	 yZdLytjdhG8KQ==
Date: Sun, 13 Sep 2026 11:43:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Message-ID: <20260913-granite-toucan-of-drizzle-cf4b2f@quoll>
References: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
 <20260912-for-upstream-nbxv3-dts-v5-2-ead604dba61b@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912-for-upstream-nbxv3-dts-v5-2-ead604dba61b@free.fr>

On Sat, Sep 12, 2026 at 03:32:37PM +0200, Vincent Jardin wrote:
> Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
> NXP LX2160A based board.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d5..baff4f4159b2 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1937,6 +1937,12 @@ properties:
>                - fsl,lx2162a-qds
>            - const: fsl,lx2160a
>  
> +      - description: Free Mobile LX2160A based Boards

Why this cannot be part of "LX2160A based Boards"? And what other boards
are based on Free Mobile LX2160A?


Best regards,
Krzysztof

