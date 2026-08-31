Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8A3D75CD;
	Mon, 31 Aug 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166924; cv=none; b=Ug07MLslKh/K0ytf1euaghwG8sON8VH0xp2DqI3IwlTi/rOn4wYFcLGXu/tHTO++n+R7TsGmr6ny7tiBaUJVHJ+LtavC3WNW2D+BhKAIaT8UVC5BtvImtUJN9h3i74ms1BwnUAPnRghnQQ+20x9I6G5grpurgM/JhdEYsW6wqDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166924; c=relaxed/simple;
	bh=TGX0paItAlz/l4JU0yXCY6KnrHtnsv0UNSqHwmV/KvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDnSuYHpTCsHbPAQOx41DRuSpZeQBQ1m3zFxew03gH/qDzyYI7cuSdqwDv6xE9g5KIxn9GLDCq92z/CgjptLsMNun411PERdvg9ndtonvmJqutak2fkUzv31LjTg9DLyhBvXKgrJHab1gxNwb+GRyoEQzRysS9srEwhx+hqfmrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Owdxdr+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Owdxdr+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8D21F000E9;
	Mon, 31 Aug 2026 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166922;
	bh=qk+S1cHfnfHxFjIJjHJ4ccWAMWO2ZP19H3Ul48WvpRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Owdxdr+gcBh1zf9PJ5z5jRG6a+rJTSv+40kJ0NYpFEb5hWCxEDiUzEiAH5NIcITgJ
	 8w0HNSMyjpYUPj0N4rn0WU/RojR5BTsD34ioPva62wqJf5SQ6R7Dkw9O0NqovplcWo
	 A9N+iTUxqnIOy/WEIIYxlWaRzRfKHHHNAZFNmNXKvNUtFigAKRYQ2YiLtL+CdQYjVX
	 qTw1QGQrDhkb4MXbjT3q6cFuChV2F9HICg9JDM3agDPNGZVVQSDG2GtZhOgT8YyGYq
	 ni+/ylmoSnbhCUSREoCU4G48WxDYD6NfgRmNv43dsH6RXQfJGQUiQhAyU4i6mkTLZz
	 rNymuabMUJvGA==
Date: Mon, 31 Aug 2026 11:01:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: generic-ohci: Document ST
 STM32MP2 SoC compatibles
Message-ID: <20260831-judicious-incredible-aardvark-baa48a@quoll>
References: <20260828155647.353877-1-marex@nabladev.com>
 <20260828155647.353877-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828155647.353877-2-marex@nabladev.com>

On Fri, Aug 28, 2026 at 05:55:45PM +0200, Marek Vasut wrote:
>    interrupts:
> @@ -215,6 +220,22 @@ allOf:
>          clocks:
>            minItems: 1
>            maxItems: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp23-ohci
> +              - st,stm32mp25-ohci
> +    then:
> +      properties:
> +        clocs:

typo

> +          minItems: 2
> +          maxItems: 2

Instead these two list clocks with description

Best regards,
Krzysztof

