Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F68B1A3160;
	Sun, 30 Aug 2026 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788081435; cv=none; b=qNf9tm8jE4+g6eerJQwvrDIWti1BOKNlGfN5wxBzXHRzmFIP/yKQdL4o1LxrEzTulveO4x/X+yCveV4RzqD+lsztFAZr40dpaQj0c2ff5W06jZ0337AEuHj8PthOGUGJkMHgLuPCnXrO69NQnilK7POsI1Ezko2MUU8vi5swCvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788081435; c=relaxed/simple;
	bh=tNgQ509FZ+j2PxztRmFKBlZyeCCP1alIpJF6O9ZvKt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5VpJGWrwxQsIfTkNVWa0gqMcduD61JySHm1f2t0tFnpN7BOwk3WjK64R9kCVN4sXz76DVHNF45YRlrv3mTwSL99WVKprFG0SNEh9RFXPuzRYLJ5ws5BNcmMOHHZFsa+tdngIp9JI016nIHlSoi3dtVmG+Z7QnPlRupuaAvaPEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdYVXevx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdYVXevx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8381F000E9;
	Sun, 30 Aug 2026 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788081434;
	bh=ztiemCkPngzxUC8ET3EP9gxuLIkhffiw69NDRN9nzS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IdYVXevxR4YDbDzdUgiZ2LplNUt74u2lDwOLOz7CPcPJKDF5NdaXJptVvqcC8ZS5i
	 2gm5HZMj6+MLVVfUco8D1vHOJU/IwibGYvAAQT38pXjgm5ZI8uljcMJgPzRogOWU20
	 Fktt4drqDLbDWM0MAnWmCLefJ+VejZ9GlH8cWis+qIszi0kxDja7SS+GCTinLYYBqI
	 4QqMcgiF9H2EIGzfl+yTykOWv6ffVoZ4+wF+jkSQfO8JfZkuE8niWG8eonbe5u+EDF
	 ZTOXxQ2pNFbQkGz56N13DZBvCDehl27lO3zfw68JUKJGuF6PwdHlQ6ohvMZCxcAys8
	 j8dmzapipCGhQ==
Date: Sun, 30 Aug 2026 11:17:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, goledhruva@gmail.com, 
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH] regulator: dt-bindings: ti,tps6586x: Convert to DT schema
Message-ID: <20260830-honored-llama-of-realization-38eddd@quoll>
References: <20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com>

On Sat, Aug 22, 2026 at 12:40:28AM +0530, Bhargav Joshi wrote:
> +    patternProperties:
> +      "^ldo([0-9]|_rtc)$":
> +        type: object
> +        $ref: regulator.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          nvidia,tegra-cpu-regulator:
> +            type: boolean
> +            description:
> +              designates regulator as the "CPU domain" voltage regulator.
> +
> +          nvidia,tegra-core-regulator:
> +            type: boolean
> +            description:
> +              designates regulator as the "Core domain" voltage regulator.
> +
> +          nvidia,tegra-rtc-regulator:
> +            type: boolean
> +            description:
> +              designates regulator as the "RTC domain" voltage regulator.

These are coming from nvidia,tegra-regulators-coupling.txt, so the best
if you also:
1. First patch: convert nvidia,tegra-regulators-coupling.txt, to a
shared schema and correct other devices which use nvidia properties,
e.g.: ti,tps62360.yaml if I am right.

2.  Second/this patch: reference here the schema
allOf:
 - $ref: regulator.yaml#
 - $ref: nvidia,tegra-regulators-coupling.yaml

Rest looks good, thank you for doing the conversion. It is very
appreciated, although I am bit slow with the reviews last days.

Best regards,
Krzysztof

