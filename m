Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA322E8DE3;
	Fri,  2 Oct 2026 06:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922479; cv=none; b=Djtpw0SODeq6c52BixC2fhfhgQl/WZ45/jBXn/RbuYDoiAru58vJ1ZWQAtgRH7HU5JLT0+zRznKgaO+RA2f8JfE1nk/JvKLf6oo6P8yNcuWpmTNT9SL1/Tr7wEur3zkrpVggVDWPT4RCxvIo1Y5U60Mq0MSMl0NzidGmOiqp6rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922479; c=relaxed/simple;
	bh=tBgt/DCMYCMSup6pPHTLX/YjKgXdjVSe+7aRSR4FT/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3dFh3Haaynme1StxTcSC7M+dq5FhUF5nprWc/JhcVkTzZ8g/IMukcmKDN0wNQhIBHxew09lMN/BggmNREv4ppHByHzeoCkY6XwVFei9u9Bn+IiKo75QiIURXu2eeCOypTzGRuDQ0L38aAIhLSAE13QFRC+otyfAe+zlulTYWGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kj0nE/ky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kj0nE/ky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B07C1F00893;
	Fri,  2 Oct 2026 06:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790922477;
	bh=P5VwjfKYVSDYAYJM9q7TEEVakSHWBpFYqmQbJbCfhOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kj0nE/ky6wliTggjFUkJLVrez1VLVBXnwWc3ztijEm2gWCvzZv+8yPiFZ9lCvedZE
	 Z36EU8D14bjn6OET0SHMqirnZCxGCn04hqEiBPJ0tnQwPu8xSBTpZdUj67JyD8TgrD
	 RUIq6cc2kDaKZLLJjycixpZXst37r5AJKzQwfFUpFtaphGU0yh3W1KN2qDPtqlHuK0
	 ZpZuxQKbU/WRw/SrWD0S8NDm4cMSwxrX8+2xsYxv0iIO40DJZrjinzHIQfuBiIeDTT
	 /YuamlGrn9Qs+v1sCnk5+yuILqZBAQ9Q7NJdbk47AHnp9Yqt+wrzzb5XFUpn/VX8l4
	 bVHnjrhEzWhsg==
Date: Fri, 2 Oct 2026 08:27:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com, 
	vigneshr@ti.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: keystone: ti,sci: Update nodename
 pattern
Message-ID: <20261002-rugged-nondescript-cheetah-8caa9b@quoll>
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-2-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930194131.117129-2-b-padhi@ti.com>

On Thu, Oct 01, 2026 at 01:11:26AM +0530, Beleswar Padhi wrote:
> The $nodename pattern for TI-SCI controllers mandates specifying a unit
> address, which in turn requires a 'reg' property. This 'reg' is only
> used to describe an optional memory-mapped debug-messages region.
> 
> Some controllers may not implement this debug region, so it has no 'reg'

Which ones?

> and unit address. Therefore, relax the $nodename pattern to allow the
> unit address to be omitted for such controllers. Keep the unit address
> mandatory for the existing ti,k2g-sci and ti,am654-sci controllers.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Note: This patch is independent can be applied directly.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
>  .../devicetree/bindings/arm/keystone/ti,sci.yaml  | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 25a2b42105e54..67acce8a559a1 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -30,7 +30,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^system-controller@[0-9a-f]+$"
> +    pattern: "^system-controller(@[0-9a-f]+)?$"
>  
>    compatible:
>      oneOf:
> @@ -84,6 +84,19 @@ required:
>    - mbox-names
>    - mboxes
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,k2g-sci
> +              - ti,am654-sci
> +    then:
> +      properties:
> +        $nodename:
> +          pattern: "^system-controller@[0-9a-f]+$"

Drop, not worth complexity.

Best regards,
Krzysztof

