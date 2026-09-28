Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CD94BD34A;
	Mon, 28 Sep 2026 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629849; cv=none; b=PS78ApFZzfjng2SDQt6UJWoGV8AM0eIaaeIwC5u0JKndm3yuJBiCF2rZKoOkHml0eblBzqIx7FBt2lxp85mmyPilqAwtYAvJRlUQ7v4BRX9sJPROqLjTFhNld60/ZAjK9FOLZ0hjPZ7bR913RDHCoiDcmEqlQMSe7Fodo8MJ7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629849; c=relaxed/simple;
	bh=hRfyDUVnITDnBzRxofvWNUUeQnper94JNdRjWNwzfS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxVKPyLhFp4EOJ3JQViZAghfbo/DdSyHGGhTekxzDya4yicskggGxZHm4Tkj+VF8cjR0M5rBiIxC2dEiY6M/JsyMkqJCQ9+pACKHAl8s0QIQODDzkfgKz0NB9ZIzNNaHMk3c2CdRZlXtzHFHEByrDGsYuMQ93/IV/4CkXzqcj6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=EWWljlk6; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="EWWljlk6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=y4GOBYDPRlGhb6aBAB1LERdD58JntG//PZlojT1T0KM=; b=EWWljlk6qh/IxPjyxEZC0GGsyz
	Sg+exB4Gxe7dar/3NBuWkB3VQEVkqcsWFFDYBI7ovgZ0D46lzNQJgDrwALffQ+H/8dr9fY8yR1olE
	9xhA0MKRl1DfJsO4UpLh7G2C0knDIvg5QF0G/voGVvqJAUz5EErZw/bSD+PWIvVCrmlNniecS3Y5H
	DHUJgh6ZjcGE0WkkwPrLK3vmszum1UripnyUAslUFGUFNdEXKK6yBhIMCY2BK1XXWoGDgSuBj5GTv
	GA6ufkDkxnaE151FiNAWd7w/vVfjHa0yGq6IoMy3d7m/G9eVs8FI0blIE+fuFoaZNmtj5HN5jD000
	5wFPCxww==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIcW-0000000F959-2zh9;
	Mon, 28 Sep 2026 23:10:44 +0200
Date: Mon, 28 Sep 2026 23:10:44 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v5 2/5] riscv: dts: spacemit: k3: add USB3 B and C
 controllers for Pico-ITX board
Message-ID: <arrX1KoS-ghNhTve@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
 <20260928205012.3689405-3-aurelien@aurel32.net>
 <20260928210216.7DCB41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928210216.7DCB41F000FF@smtp.kernel.org>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-09-28 21:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing required phys properties in usb3b and usb3c nodes
> --
> 
> commit 89b216baa5d6be0e4a7be800d568bba679087495
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
> 
> This commit adds the USB3 controller nodes (B and C) to the SpacemiT K3 SoC
> device tree. It also enables them and adds the corresponding USB2 PHY nodes
> for the Pico-ITX board.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index 1af47b7f1c8af..cf1c8b572c86b 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> 
> [ ... ]
> 
> > @@ -441,6 +441,66 @@ soc: soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		usb3b: usb@81400000 {
> > +			compatible = "spacemit,k3-dwc3";
> > +			reg = <0x0 0x81400000 0x0 0x10000>;
> > +			interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
> 
> [Severity: Low]
> Does omitting the phys and phy-names properties here cause a devicetree
> validation regression?

No it doesn't, I checked that before the submitting the patch.

> The SoC devicetree fails dtbs_check validation against the binding schema
> (spacemit,k1-dwc3.yaml), which unconditionally requires the phys and
> phy-names properties.

No, as explained in patch 1, dtbs_check only check enabled nodes, so this is fine.

> Should this node define its hardwired connection to usb3b_u2phy via the
> phys and phy-names properties here, instead of omitting these SoC-internal
> hardwired connections from k3.dtsi and forcing downstream boards to
> redundantly define the SoC hardware topology?
> 
> > +			interrupt-parent = <&saplic>;
> > +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;

No, this has already been discussed as part of the v3 review:
https://lore.kernel.org/spacemit/aomWjQGk_p84pPD2@inochi.infowork/

> [ ... ]
> 
> > +		usb3c: usb@81700000 {
> > +			compatible = "spacemit,k3-dwc3";
> > +			reg = <0x0 0x81700000 0x0 0x10000>;
> > +			interrupts = <148 IRQ_TYPE_LEVEL_HIGH>;
> 
> [Severity: Low]
> Similarly, does this node also need to define its hardwired connection to
> usb3c_u2phy via the phys and phy-names properties to avoid the same schema
> validation regression?
> 
> > +			interrupt-parent = <&saplic>;
> > +			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;

Ditto.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
