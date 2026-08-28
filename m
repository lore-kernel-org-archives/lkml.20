Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC3F379C32;
	Fri, 28 Aug 2026 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908278; cv=none; b=klwHqdKBUlFHOjqY6RRke006aM8li1GHSz/7TcoYiM3vwVAcwZM+9Xazs3SZrz72OU4EVlyKO7tr3dcSWxB1ynZlOiEVMdnjnPU9XDpf/ZJQiPvy5ZaaffqF3m9vFYw3HB7NuB9ejNSXWPq2/wyEHkZDo+E6MPqEeoaoffsHGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908278; c=relaxed/simple;
	bh=8skoZr4yPoy495fSUzuTQ96ayWgRBInzhVhGZK8hCE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlwEj8IT1SOkzfQ8Km4va2b/6QoqcupXr6GipqUfL82luvZCezvacljagvZJnYBtdAK+ldmL6ZbUQRPuD7GinAfzMGzsNVCzxJ+xChGnj1xSpO8zS7O2nQTvt7Ez1ejdZNoNNtW87tzb6+a0dAurKCGSzmVmblbWJZqL9ZUHYxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjXDMy0B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjXDMy0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB831F000E9;
	Fri, 28 Aug 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787908277;
	bh=oqS5xprZ1U5Arbi7YgzpA2BfebN8jEZgfl8jpD4S1Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EjXDMy0BUaJF6KpLrd5Rotxp/xOauthE6dyLWOxY3IuHpFOv2nJret1pflBEH6x3p
	 9AaTMXtAIsMHM0rA1W/IBvRYOywj0iFWcN9D1OLt0BcH1TPUE9vdsURAg85HXIrolq
	 DKUMkryLBZte5PEu7MII7XUi0ufjdl7WdZ3/1vE6IdUMFtu17nM7tdRYQHEX7aRrD+
	 zOkutv8sqNbUZTYZxM4nrO0caaDLSxT4r0x/dZXzA9GlUyPemI2NaPesg/ULddTVR8
	 jIQoJNOSCN1+qj/lpciftdAbctGKJVvI3KCxHGCX9KXjIbCMrU4WEdG6GsIGMM1JsA
	 SE3Jgrtd+AOtQ==
Date: Fri, 28 Aug 2026 11:11:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <20260828-sepia-vulture-of-glamour-ef861f@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-2-marex@nabladev.com>

On Sat, Aug 22, 2026 at 09:46:34AM +0200, Marek Vasut wrote:
> +  resets:
> +    maxItems: 1
> +
> +  vdd33-supply:
> +    description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - "#phy-cells"

reg should be required, usually. If it is not, please explain why in the
commit msg.

Best regards,
Krzysztof

