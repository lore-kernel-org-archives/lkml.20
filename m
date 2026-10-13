Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2044D5013DF;
	Tue, 13 Oct 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898000; cv=none; b=FDj+LwUehzXb0nrJY9ysCqcxOqQntZEIrbwiVGY09yIOxUDdv1vEb6gfgXws3sZjshPZ6y3+Jskr/n2y4ceYI+EcqPSfxzk6IKfDT3AAVd7W+WC/w2hilstSEENuuT6eTK7B+Xx1qaK1tQn+NA7OLu3uadcLwqakDlM+HLsdiX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898000; c=relaxed/simple;
	bh=D8X9/HU1ytSHn2aUiGxbzXM2r3PCSS7f5TTvhXGJReE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWigK6qbmEONPB6HdYRJPd/qUfnXxfRcEr0C7yXHifsXmlUYPMbFzM/eNLL/eQwJFajR0YlAOYbZa5M3nVaEvAt7xPxD5s0GCO8S34z3UpxqgAUjKSXMJaoO3VsD3U7nKrX39L8UsFDDEREZ+W0Xi55yR/Vr8OulAF1aEBzokH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dOJAdN4o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dOJAdN4o"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14B34230;
	Tue, 13 Oct 2026 15:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791897875;
	bh=D8X9/HU1ytSHn2aUiGxbzXM2r3PCSS7f5TTvhXGJReE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOJAdN4oo3bZ4UV4ry2O66vUFwnVItB9gsiljzn8x4WEU+bobir9DPk/muyzzsC0d
	 JhoZphnyEt1WwdKyFGzvWU8TvGPzGguBDj/HuVLpgGp+qLU/iGV4pu0kHWTzwjhTqC
	 oQmLZ9T9Bh6tTlESdiElCOynkkb82ehyl66fRGYs=
Date: Tue, 13 Oct 2026 15:26:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Message-ID: <20261013132625.GA159927@killaraus.ideasonboard.com>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>

Hi Michal,

On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
> On 9/16/26 22:44, Marek Vasut wrote:
> > Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
> > The board is populated with four ethernet ports, QSPI NOR,
> > eMMC, UART and USB host interfaces.
> > 
> > Signed-off-by: Marek Vasut <marex@nabladev.com>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Michal Simek <michal.simek@amd.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> > NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
> >        undocumented, but the TI DP83822I is generic C45 PHY that
> >        is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > ---
> > V2: - Rename lm75 node to sensor@
> >      - Use GPIO_ACTIVE_LOW macro
> > V3: - Drop bogus clk_ignore_unused bootargs
> >      - Drop gpio line names
> > ---
> >   arch/arm64/boot/dts/xilinx/Makefile           |   1 +
> >   .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
> >   2 files changed, 301 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> 
> I am not able to review or take this board support further without publicly 
> available hardware documentation for the platform (board-level and relevant 
> interface details). Please share public documentation links once available, and 
> I’ll be happy to revisit the patches.

There are plenty of boards that have no public documentation. Pretty
much all phones and laptops are like that. We even have a whole
architecture that only runs on a few machines in a single person's
basement [*] :-) The kernel has never required public schematics for
boards, SoCs or IP cores.

[*] A slight exageration possibly, but that's how I heard arch/alpha/
    being described at the maintainers summit.

-- 
Regards,

Laurent Pinchart
