Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3598943B6EC;
	Fri,  9 Oct 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541970; cv=none; b=nbVysJ1wwPkbVqeeE5m9wyLJ/E/GC4PqDb1fc/AJdWQXO0z2GL+SHo6I97veYZN53OuoLFUANoqa8JQH4t0tVbKNmNqZXf9+mhoNHj5E9PABdtOr0//wb8aCTP4K5f8HwciCp9TmPKoByEKx810JopfKTZNR+MJS2UUafIEykwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541970; c=relaxed/simple;
	bh=3Ne+nEz1b8uethpHI8612uhLHdS9T7oCAX7KfvZ2aPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1IEj6mSoo3U4UM/wW6dVICZW3z4KwCQcmdp5+4DpHXyluDdMhfFZnykcGIAsP1phXFowJTe5DkzjOFLTkCuFZnVFJdujVwbbNo/dmgsPQBmz4WJ0GLpS1FL1vVuywVHbNRPptw8ZrsgfoGXlqIqMLe/RHlByfygybsUVD9G9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlRHztSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlRHztSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7EC1F000FF;
	Fri,  9 Oct 2026 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541968;
	bh=Fz4v9C4NJeucclJ4dP4f/7Y/qrP44cVlU8hrb155EX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IlRHztSPGHLNnIEqKiOzckUamhY3gEriL98qwKunMtuXg52gXtbU/pABUzt1GmZoi
	 bsPPguajRRS2afjxnAXk4Mh+XMPrXcQ6Z5dGzzyWWkjM5aqpcVOEwS5c+p+VlgxJYk
	 xqsPDgkAJRl1bJjife2FkYh+f+DpEgHcWj1so7nfGyMXqwTzOe+fiGJoDc6tXYl8+a
	 OOUjJ7O2ovUus+WjJRiJQCga2LHfjk6v3IghycjItQMW84hfawikzlzZpLx0yPs6Tg
	 86TlwUso9zQAxtapPRSHlN+Y30z33bcpJ76knV38aZgiLA5a8EZGpH3yOcjKkx9VlR
	 L2LWs8SfGPnFw==
Date: Fri, 9 Oct 2026 12:32:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: aspeed: Add ASPEED PCIe PHY support
Message-ID: <20261009-vociferous-puma-of-amplitude-1c4dde@quoll>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>

On Thu, Oct 08, 2026 at 07:28:18PM +0800, Jacky Chou wrote:
> Add the ASPEED PCIe PHY binding and driver for AST2600 and AST2700
> SoCs. The PHY provides the physical layer used by the PCIe controller
> when it is configured to run in root complex mode.
> 
> The driver registers an ASPEED PCIe PHY provider through the generic PHY
> framework and programs the SoC-specific PEHR registers from set_mode().
> For AST2600 this selects the root complex port type. For AST2700 this
> also configures the posted/completion credit values, local scaling,
> device type, internal reset selection, and downstream port setting
> needed by the controller.
> 
> This series also adds the devicetree binding for the PHY provider and a
> MAINTAINERS entry for the ASPEED PCIe PHY driver.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
> Jacky Chou (3):
>       dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
>       phy: aspeed: Add ASPEED PCIe PHY driver
>       MAINTAINERS: Add ASPEED PCIe PHY driver

And changelog plus versioning are completely missing.

People sometimes wonder why maintainers are grumpy. Easy answer: you
do not respect their time.

Best regards,
Krzysztof

