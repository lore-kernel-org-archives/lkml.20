Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF03C76A0;
	Tue,  6 Oct 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283175; cv=none; b=t89vGRQN6Thn6Hedm++AHHu9TsxxTYaxKLkAYDz+P+EgSJilU9q8tLvh7Dtcx1VnWWVT8GLsMCw4Iam0+DokOpvor7a5n/2Fdi4CuYXp/DWm+IDKjnoCqePevz/6CHzb+heL+DdE3hyaDPDFlHDIl0f7ihU3o/FsnyC5veQHf88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283175; c=relaxed/simple;
	bh=uHhLksw+SaQbTq6T0bsFQltUqf6MN3ztzugZWEA66uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ergEH5hU9tc9EXvwk0ux4Y9XkJ2XbnIp74OGx93IBYV5twzQQ6zbBc4Tw9p9wwevxpm01iIhWP6fiBUGR0wzfnVHKDwpt5P8QUJGNi/dOSOLONuQIGp5INnuiy5NZ7EsBNGVPnO5EbR2tCQ+RP0ADNrkcwhSuAUACNTbyIE9wSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiIWmASu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiIWmASu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BAD1F000FF;
	Tue,  6 Oct 2026 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791283173;
	bh=dLU+evSr9Yr5I7+bxIvZFtnl9Tc1V6u/KdtkDVmD0Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GiIWmASu/hUtJP9PSjFKsoGZ8HfL8gn3fv8Wdb1OtfjjpMiYMK70/HkRIwBpI9ZcL
	 NuHFpwrIudVF2nlswRK3ZrtYnLjewRPxctLvsQSsQD/FCCA/wKmSA9lEGdPP+i3h2T
	 /15gINR1QV9O6K14Marxnr5smQPx9HF6AsH1aNSsim+M2O9ayRPq1sSHYHC+jFg2EL
	 CTpsowTfxdMpwoyxn38DNOea3u3Srl1xt4xC21u9urYoF9Bcdfu2/bq12Dc04xZfbV
	 Dr/OfztyGpURnYxKzpMXW7+nAXfdLWb0moUetJ3IGO3f+miod5o7vople0CH2grHDk
	 Lpk4iK3VhAVtw==
Date: Tue, 6 Oct 2026 12:39:30 +0200
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
Message-ID: <asTP4lI3psLy5GCg@parshuram>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com>
 <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
 <asSzYUA5W51Ngn4X@parshuram>
 <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com>

On 06-10-26, 18:22, Joey Lu wrote:
> 
> Vinod Koul 於 2026/10/6 下午 04:37 寫道:
> > On 06-10-26, 09:37, Joey Lu wrote:
> > > Vinod Koul 於 2026/10/5 下午 06:07 寫道:
> > > > >     */
> > > > >    #include <linux/bitfield.h>
> > > > >    #include <linux/clk.h>
> > > > >    #include <linux/delay.h>
> > > > > -#include <linux/io.h>
> > > > why is this dropped?
> > > This driver never did direct MMIO access (no readl()/writel()/ioremap()/
> > > __iomem), even before this series - all register access goes through
> > > regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
> > > unused include already, and it's dropped here as part of the broader
> > > rewrite touching this include block. Happy to keep it if you'd prefer
> > > not to bundle unrelated include cleanup into this series.
> > Then it should be a different patch explaining this
> Understood. I'll drop this change from the series. I'll leave the include
> unchanged.

Nope, pls add it, but a separate patch. This in unrelated to this one,
and should be added but as a different patch.

-- 
~Vinod
