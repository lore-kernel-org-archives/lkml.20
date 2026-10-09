Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E448A8D3;
	Fri,  9 Oct 2026 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541889; cv=none; b=q4ePvipKy+vDovkguEpkSQ/4vYo/LvNbbQCSI8oXTugPh8gdBOZAXRlGQcdAl20p+tCPiA/THb+bA+fk8Ab275Z1WxShFyM308autPYkQ8RMH0Es9PjGcpzPMNLBKWVi1Nk2wmf5plr3zcpPcZPN6xnr4eHIrmXxXHsDmC8HK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541889; c=relaxed/simple;
	bh=GtyHm+xBm2xJUQCd5UyzY97V1vkV2j3WS6JjUjQGmC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6LJOYsDT570wiC3rzvPaZ1ZmyJW8Nw/pK/7jhP9ThalAPLk29mdTXzpoXfZNLdH/mwgonv1COq8Q0VYA1b1WzT45SSab0BbNXGFJz3qGqjMhfAVohAKaRtzNKvqKuj+EjR4LL3ZK7MhWGsbi+Tay40sxcwH5EO47YSvwlBSeHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/kRAwFY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/kRAwFY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B30B1F000FF;
	Fri,  9 Oct 2026 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541888;
	bh=g12nnmx2URm15ceIKI7TQ1hob+O8zuALvg+ycI7aBOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K/kRAwFY9Q+MWWgCT3W+Q7iElzNrv5q3mGba5eAbc6Du5nrDbhqp/oigOYRxiacmj
	 9z2DF366U6XE8r7IyKSUN7iRHmRpidMGrqBMCqyUP79gV62mJnezWlYkx+jyqL51WS
	 6D4XUbh9TqgnTmejUj21EENabGH685/KDjgmrxURCp630//qOCi5V1ukDYraKdXFBb
	 e5I44YFaI0srFzYCgEgsF1LQ4QMIZrIygxeU/nCEWr3Ma6e570+40g2DVFx85JOpNa
	 tefA6Irn7hqOLqh4wO7bLvMM8XxrIvP6u2dzZcbB+bLAuO5GwoaD80UxkEjAddWmZc
	 CzXcukw7iQ08w==
Date: Fri, 9 Oct 2026 12:31:24 +0200
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
Subject: Re: [PATCH 1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
Message-ID: <20261009-vehement-mature-mackerel-f7bc87@quoll>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
 <20261008-aspeed_pcie_phy-v1-1-96764937aef0@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-1-96764937aef0@aspeedtech.com>

On Thu, Oct 08, 2026 at 07:28:19PM +0800, Jacky Chou wrote:
> Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
> The PHY provides the physical layer used by the PCIe
> controller when operating in root complex mode.
> 
> Describe the compatible strings, register range, clocks and
> phy-cells value required by the PHY provider.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
> new file mode 100644
> index 000000000000..686b2e3d9457
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml

What? v9 here:
https://lore.kernel.org/all/20260115-upstream_pcie_rc-v9-1-d6c82a1556a7@aspeedtech.com/
from the same person, reviewed, but you ask us to do the same work
second time? Really?

Best regards,
Krzysztof

