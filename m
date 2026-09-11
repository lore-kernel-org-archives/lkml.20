Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65DC26ED37;
	Fri, 11 Sep 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111942; cv=none; b=caoB6GhDHxk2gexJDwFRnDVjgzX9q/y1eXi1HYkq65y50F5HbfcJH13JXcYFu9TPVfQew7O4lkw+NVlMdoJb5mLcm62m2SpwhR143EWh3xsbia7xWw7AQhlrfi35X681Uj48aCBFoc+vgfVoEfUTzoqX0/sBCE9l5VMr40VGmNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111942; c=relaxed/simple;
	bh=aPn2V09iW2RqcLu8Hup1c5t8+ndZdGeYIGgvVAoAQ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKmOjVNlTeUu04SLrHPmGQdY5xgbKzYGvDur8MfLiPeKM2zlpiabPsutYWHgGNmZx3jMG6gwgB7OLUwx4CqG6vEuKgcSF3EUTF1U8COHSujRsCzlpukIM3v55z5RqtAb5r3ZnOU5YmSXZJimKHEQvYjAc3rhiyMjGCJVPrTr1sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isZHds3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isZHds3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A9B1F000FF;
	Fri, 11 Sep 2026 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111941;
	bh=8NRZUbtUucUhw0WkqpcYIAzHqGYCykdJeiO5IvMZwJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=isZHds3RVUgkbzYmuIAs026IhkzEJjYNTCq2AR0SisNdLX5luwLSdo7hMZH1vZ7BK
	 S7Zv/7lj58eB4kRjCf5HQ+bEhViwArNhumUpObc6wDHv5JnYU2kxZhVNp3lRbuWsyv
	 pYwvHz5ZHk+EL9KGDBkCVNE4b1WL0OA7mJnuaBTU14yqMFS81WYOQi3vGQyQdqmrcb
	 /GUoxsu9j1vW4g/S9U9IHnJEiMlJJJZetc/hXbHTSjMRPkQFK7LYvz8Ss8qEQ6sDPE
	 7hQ1khoSdYUA8bAibBuCkGVvs66XfD4EQkBhRY/bwbhU24f3188rURADagzGszCnXY
	 cJ7NRveh+gkHA==
Date: Fri, 11 Sep 2026 09:32:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Message-ID: <20260911-sweet-industrious-stallion-b7a727@quoll>
References: <20260909182641.165383-1-marex@nabladev.com>
 <20260909182641.165383-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909182641.165383-2-marex@nabladev.com>

On Wed, Sep 09, 2026 at 08:26:05PM +0200, Marek Vasut wrote:
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +
> +#include "zynqmp.dtsi"
> +#include "zynqmp-clk-ccf.dtsi"
> +
> +/ {
> +	model = "ifm ZynqMP VHIP6 Evaluation Board";
> +	compatible = "ifm,zynqmp-vhip6-evalboard", "ifm,zynqmp-vhip6", "xlnx,zynqmp";
> +
> +	aliases {
> +		ethernet0 = &gem0;
> +		ethernet1 = &gem1;
> +		ethernet2 = &gem2;
> +		ethernet3 = &gem3;
> +		gpio0 = &gpio;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		rtc0 = &i2crtc;
> +		serial0 = &uart0;
> +		spi0 = &qspi;
> +		usb0 = &usb0;
> +		usb1 = &usb1;
> +	};
> +
> +	chosen {
> +		bootargs = "clk_ignore_unused";

You should not have such bootargs in mainline DTS. It ties DTS to
currecnt Linux driver implementation, not mentioning that it is
subjective choice. And once such bootargs appear, then they are tricky
to remove because users of DTS might rely on them.


Best regards,
Krzysztof

