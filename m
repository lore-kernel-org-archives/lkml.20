Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417670;
	b=bWGDbJZfxdGZZmiVcFFV2Q9RIrxvjcHqrj08GAI3m9PrxWu0LOqLm7V1SC2p/19/DnZs
	 O3GdX4SxpUhvoUl9Wtj/a83dP9p2tPHP3EI2UuADmpzO1TLPF4Z5e/rGllGvWewjb69gG
	 0nFeKp3q6MXVJUWtVLdBxedLTS6+guJaez05S455TZLq/gCo4E+22SVDrpYIZX8iO3BZ0
	 nIrzbaCu72OK4V02Yr5fHsBdrss2hDZTOLFRH/piiiNs754Kf706V72IOuU/dEXFFbUrG
	 Gre9FhKdSjBdqd2tuYNlU+jfMCmQF8LJiFxWeAIhLaZgsR5ubHMOWx2QrlrMN+fzulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417670;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SNmxs33a++hap6+9z+zZQZkxs/XGn3U1MODMukYAn74=;
	b=rry3HTmdtT+QYcdoA6V06UcDFMHZPbXL+48sliv4eqL+zz0v12R9ETIeAuiMJmBJ5tdQ
	 0S+kO8BCHAXtq9K0D7CwcIp8/p1lcJD+c9soJcGDeVTaHWknOiQHEQl0Nm0IXT9ZcRGzJ
	 3IPNtbqAQhNi2vpTu2VSaxtw/q/uyPY8QlPyoHu/bQTwWS4DcyNEDAABLVAtiQKn9ORfk
	 uNsqD1eVqE53bQEGfrpoqS5jR42+HB1C8JH75yXC1rOvTZXd1CU+kU9NZhPRkyhN3Icpf
	 PQcV3PlVcxt9XViA6QpsjgZ1/94BcVn0AzJ0W5vBoVt9xKVdck6gAlk/9rO0jIN4Rrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCsULW5Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3FA606A31C;
	Wed, 11 Nov 2026 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCsULW5Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B71A1F00A0C;
	Wed, 11 Nov 2026 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417669;
	bh=SNmxs33a++hap6+9z+zZQZkxs/XGn3U1MODMukYAn74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cCsULW5ZrXcMgx2ZJeM5/QeUiIirveecJtKFa7ehfOm0ZzjKdRsqSLqu2zv5CSsmv
	 UwiT1Ye3sytToAoQ9DvT9oayXwEbccydl9f+Hd1KQtI1vZq8loLg4KBsy5kVXGIrlF
	 Ba6eQ5eaA0vLbM5wuv2qlZNspxDoBdxilJlCCtfINfYRxTLDy397xVHyJ/LiPp1BOS
	 hqqITse+xodJY4u0AiIJBgqjGBcscoznJm3z16gVJZtWuKvTp746pSht0ya5tDBQK9
	 EcnmNZQYH1pY0bhfTjN4AbKhp4IYHSHYllVKGjeEYbbHuCzbgzd8Cx4N06t3pfMYpT
	 6ZwKZZ/aY1WfA==
Date: Wed, 11 Nov 2026 11:21:07 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: example-schema: Show example of
 dependentRequired
Message-ID: <20261111172107.GA3839021-robh@kernel.org>
References: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Nov 11, 2026 at 12:14:04PM +0100, Krzysztof Kozlowski wrote:
> dependentRequired is shorter and preferred form of conditional property
> requirement, over allOf:if:then: block, so document example usage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Use clocks/clock-names in the dependentRequired, to avoid conflict
>    with existing foo-supply constraint.
> ---
>  Documentation/devicetree/bindings/example-schema.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
> index b04f3cc4312c..a37d10ff7469 100644
> --- a/Documentation/devicetree/bindings/example-schema.yaml
> +++ b/Documentation/devicetree/bindings/example-schema.yaml
> @@ -217,6 +217,14 @@ required:
>    - interrupts
>    - interrupt-controller
>  
> +# Properties might be required only if some other property is present.
> +# dependentRequired is a shorter and preferred way to express this, instead of
> +# if:then: block.
> +dependentRequired:

Update 'dependencies' instead. We can drop 'dependencies' for 
dependentRequired. Would be good to add a dependentSchemas too though we 
don't use that too much.

Rob
