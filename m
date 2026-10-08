Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75F63D5259;
	Thu,  8 Oct 2026 20:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490303; cv=none; b=cVubVSmBka4m2jfz34PQfJCQUr4ZH5NjDOHcMWu6ZoI4KSriKecWjVPwTo9s9xOHkNU5SOF3NPNKP+uUf+i8adb7Nui+YE9vr0evrF7YkDc21VTJILT4CIaHRXg4Sno+GYlOCWikUe3j19wLYYON1X0AGiCm8o4phhMwcGqdXm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490303; c=relaxed/simple;
	bh=cZYZciy7NvkCD12j8v1A/CagzeUeLZ7oql+i/9gkfbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TekciEadD4nDv13CcL+Ova9GZZvGyN8b4kMb/8Hm8V2D8Tk2hFjCMa0JUDUw6yy9IaXQ+wA0NhsyJu1qTFg7NsSireAJsW3W/1mV/84+397G68bdaM8nUyRZk/YsmsP42zEi3W/7BK0xjv8XaSpsKR1I8wbpSVJpCj/tXQImsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeTtrcrX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeTtrcrX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580B71F000FF;
	Thu,  8 Oct 2026 20:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791490302;
	bh=y+LU+BOjw6joWkwdZzQGP7qJ8+C8nKCj6V+2fuOth18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KeTtrcrXmy6M3X83s/POX9CQL0Qq2E5dCx5gJ+yf5ZEqN/XzjyjJGqfRmkv9DE+A7
	 n2shM8wlo6l4bIhsnvgykme6qI0WlpNNodant9s7JNRLICaFuj+GCKfSpZmM05gFwz
	 egPXHjKXG5iDcVuSUOzSbEZU+c6K7pAHZluRIQ3HA0pQRotDoRWlGhibcCGFzJIZBj
	 8jMyZWo2chnukWoggP6uyr5Z0fWK8IlMmiB91umqMJRnBgZyps89fU53W26+W7wVvr
	 4FHsCRAl4kvr4pKoMl91b7A0v8ujIGi9FgWFRsVCrMr08gWaEsKyZwR6IFws9aao6y
	 xGraP3PpUhznw==
Date: Thu, 8 Oct 2026 15:11:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: reset: Drop obsolete STM32(MP1) RCC bindings
Message-ID: <179149030098.984968.1748859910250860413.robh@kernel.org>
References: <20261002171412.2716314-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002171412.2716314-1-robh@kernel.org>


On Fri, 02 Oct 2026 12:14:10 -0500, Rob Herring (Arm) wrote:
> The STM32 RCC bindings are replaced with schemas already. Drop the
> obsolete .txt bindings.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/reset/st,stm32-rcc.txt    | 6 ------
>  Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt | 6 ------
>  2 files changed, 12 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
>  delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
> 

Applied, thanks!

