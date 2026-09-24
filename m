Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F3537F324;
	Thu, 24 Sep 2026 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258586; cv=none; b=lE7QXs+1bT5msVvJaJZEbOrAMFUvb06W8uOlZ8pF/Ryi4RkHiI74ifoZ999kjY77tQqZ5WcitBc5U2CJE6AKQWPHtjdGI6E/PlRSv+janMHEbaozG6bQo1tvCw/seio3fZH3EjiyPw7n6NURANI+7jq6CB7/wv6ODK/qpxJDGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258586; c=relaxed/simple;
	bh=2lKYLt6kBnBNyZdKzWnNbey4gymvXeAKbO6AN2n1VoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZFz7vgdU7J+23xuEI2CoA2Hbe+4To728HT+84q3goATXqf2OKuTf1h85U/R+NRR6w5+HacuJxPWRn83PkPmV9UerVIcrENZGAaYugOA31Mv1MKW65p7fHUGTdbvuhP5kXjGw8ehKxfRlOHfuJzPNbALZ/edPqeVPQxavdriB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHDNnIya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHDNnIya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE941F000FF;
	Thu, 24 Sep 2026 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790258584;
	bh=bT2hyD58yE4Bwij0cU1re8RgfUx2xVSwEEVdr4Sr2xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NHDNnIya57yXo3X+BaazR/pTsRnhC+WttCrtop18ZnR9S2t7scKCsRUDBLpiV9PVE
	 JHRBYOW6HhuZqxI+c3QW2eIpFx/MYltDOyeeJI4dzQE/a8sr5OuV4Tg8f8JXjBmm/K
	 EtieBZERX+mbrOiI3DVrHDXHs5CkUKbdFVUfCzB8AUYMy9qFcBzfxnmI4Gc0YAhu9o
	 r85jde0tiwPXT2OjsmalI5bVKcQ4AncpNyccJdIsNDcm/BHA7FSY4sZvjDXUPlYWZc
	 7xg0ZHgrS3zi502mSAQMNwbw2kL/CnU3biZRkV2LIhaRNHr8yHnvEIzcremPYL19lU
	 thZGstq8fB/aQ==
Date: Thu, 24 Sep 2026 15:03:00 +0100
From: Lee Jones <lee@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI
 compatible
Message-ID: <20260924140300.GE453446@google.com>
References: <20260923191526.2206628-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923191526.2206628-1-robh@kernel.org>

On Wed, 23 Sep 2026, Rob Herring (Arm) wrote:

> Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
> and matched by the Hi6421 SPMI PMIC driver.
> 
> Assisted-by: LLM
> Fixes: dee8a4e807dc ("dt-bindings: mfd: Convert hisilicon,hi6421-pmic to DT schema")

What is this commit?  I don't see it anywhere.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Drop "gpios" addition.
> ---
>  .../devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> index 6a824351834e..0dd37c40eeff 100644
> --- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> @@ -24,7 +24,7 @@ properties:
>      pattern: "pmic@[0-9a-f]"
>  
>    compatible:
> -    const: hisilicon,hi6421v600-spmi
> +    const: hisilicon,hi6421-spmi
>  
>    reg:
>      maxItems: 1
> @@ -66,7 +66,7 @@ examples:
>          #size-cells = <0>;
>  
>          pmic@0 {
> -            compatible = "hisilicon,hi6421v600-spmi";
> +            compatible = "hisilicon,hi6421-spmi";
>              reg = <0 SPMI_USID>;
>  
>              #interrupt-cells = <2>;
> -- 
> 2.53.0
> 

-- 
Lee Jones
