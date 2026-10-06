Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E23DDDC1;
	Tue,  6 Oct 2026 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275878; cv=none; b=YVuIvvIuqs5YnYzN4Baj5Fu9Xw4gAnXRUL8i9zog1WA1eUKlaV/nwxlYJSWpQzE9xPZvP9x3N0ziChPCq19booYKbJbaQjRlXnzszY86ho+rPt2pby9s5zftOiuVf2T+HNA6Cg3hMqJyyjh+AmuCiWvlbjTlzKCzLU+1QhktciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275878; c=relaxed/simple;
	bh=EP3LPe1zHnw82bduoKfj7aeLJx7r5B6vQA0yYV2jBOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdTS1ao0iT3eKxk1qV3g+n9qkX7U7depbd1g7seegDUOU/syJM3YbmI1solPUyfCSbwBp8yP0iGSLvDhGmLGvHNeYrnyBVrtPnObBRg1Xji8RvtAT6UFEr6R5UZGwfgQ7Hj5mgL2RrnjXPoUtIZqGyL/nxVP6pSKR/orrQzW6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZh0E8Gq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZh0E8Gq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6EC1F000FF;
	Tue,  6 Oct 2026 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791275877;
	bh=XVvGpJ6ulp1owYNI32OyuXl21ymeks60rItkOGgWYFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HZh0E8Gq5Ba0eZjJ1GdHmDWjZhe5MLIsOd+8jCx9X7+lEp6PNYtmjM2pJ7BZ/62l7
	 fEgyFBzJHDmUEVJF8cycD77ONcWd+oHM83ma/agHg/D2vI7redKr1cJ2l8DyBhc3zl
	 fj+9vy3Hjf4zUF1wvU1OyMcaL7dv//aGaf7sG9ifOR8ueSILhsStmaqllxZdeWz6Fi
	 wXRRxQDvMOMgDi0BtNuoPEPBYg9fq8qZdePlntGSCBEH3pZS9I4MOoTDz/PcCm4niU
	 CroWRoWfRwyX+4RSAOe4XczYKBsNajVeuwtnHveVIms7XuB+8UpccGlfc5vBHzU334
	 /uvGYNrvXbnMg==
Date: Tue, 6 Oct 2026 10:37:53 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Message-ID: <asSzYUA5W51Ngn4X@parshuram>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com>
 <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>

On 06-10-26, 09:37, Joey Lu wrote:
> 
> Vinod Koul 於 2026/10/5 下午 06:07 寫道:
> > >    */
> > >   #include <linux/bitfield.h>
> > >   #include <linux/clk.h>
> > >   #include <linux/delay.h>
> > > -#include <linux/io.h>
> > why is this dropped?
> This driver never did direct MMIO access (no readl()/writel()/ioremap()/
> __iomem), even before this series - all register access goes through
> regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
> unused include already, and it's dropped here as part of the broader
> rewrite touching this include block. Happy to keep it if you'd prefer
> not to bundle unrelated include cleanup into this series.

Then it should be a different patch explaining this

-- 
~Vinod
