Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA14457B4;
	Wed, 16 Sep 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588310; cv=none; b=mcWcege7pCNB4qAaJJOju04ZrecHWm2BfuUhX/h5qkX78hZ6znJLQnrYjhm7Zoduy5itbr/UmRhL1Z/iVGBZIeZ9lWQctCwslwfgJnhSOmmDvtZtzXfAfrCG6bZLllgGzbnyHIFdV6hMIjRIUJjhQ+K3uKnsW/XXGs24BdzxHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588310; c=relaxed/simple;
	bh=rR8gio8NXT+Xi1NkKIXHl+wglb1CRjzxcAQTyOeL+zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFtaYUxjlzONa3U+ISdmdUlI92qWiLWMvOp8CwGvSuqLzjRx+VamIKc+ZouJGYjS4ChK0oy0AuUJ7iortSwJXHZpBGi/95xAymNqEncf4F2ARPBsivHfZx921zUNWpNfVJuz/rxpVxMy7YOooZVw3KN7e12eus0+L+R2FObhfpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqt3+WcF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqt3+WcF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABEE1F000FF;
	Wed, 16 Sep 2026 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789588296;
	bh=8YzxLAMnfGl5BhYaFgKTaTnTFzUnXMcgb3Sp9oKvyr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqt3+WcFSVwC2u4dwCexPSH6aBhAcMrolGhryP7XCA+ALp7Ze7SZnX0KXCl/+qYr2
	 dO6IAy8byx9bRp/aSvB/1fpfaeuBfRKBYEg3rtZk4q3OsmR/r4heYDF9cu672fsORN
	 nBw7+e3gbNdllC2cTRQ5GBj9fXrnVpXf+LNO+dEYy9IreB7m3C7bdBZ7IaNcwS9mzv
	 OOBe5cOz8Mg2W9ANzsb9EoWHuaPm4psaqTDq1me06BAVAC/RXI4wGlpVrfPc7NFBrt
	 ZR2LwUj/1or8bYAm045g4CWx8GREr24vyZ4G/LhXF7/loEnwTtMgP9rHD/CrbWqvk1
	 pZ41iYq/Nwzcg==
Date: Wed, 16 Sep 2026 14:51:34 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Message-ID: <20260916195134.GA1340176-robh@kernel.org>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>

On Thu, Sep 03, 2026 at 11:30:12PM +0200, Marek Vasut wrote:
> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> controller with glue logic wrapper around them. Document the glue
> logic and DWC3 controller.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Rework to use flat bindings for generic plat driver
> V3: - Support one or two PHYs to correctly describe the hardware
>     - Make maximum-speed optional
> V4: - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-speed/phys/phy-names
>     - Switch to unevaluatedProperties: false
> V5: - Limit maximum PHY count to 2
> V6: No change
> V7: No change
> ---
>  .../bindings/usb/renesas,rcar-gen5-dwc3.yaml  | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
