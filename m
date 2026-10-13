Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8552CCD5;
	Tue, 13 Oct 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914089; cv=none; b=DWUnvW7/mmo996kswOrlK7Aeob1mguCnYFoBqOZijM7PAXwuITjEnyFu5S34+LubXwia1MTM7UTiooY3eYaK3UyQYVPFioICeNmElVcvfCgTOTZ3xoSns9sKUsbmbuJv2BDlK1bsxNUoOehhXv/cvmncndZ8qBZ7xSjdlrzj8Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914089; c=relaxed/simple;
	bh=ddKVGzWfBmOAVDerK2BUxx2wXfVDrBJEGGKCQ56psI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY3s++WUaJKd4FTtEkbrBzLY+yX6g5jPrvZ2jAw6zEO6VIsv+XQfHDo1cMzIqsyFiM5lucWeNBJw6dw6/Y/ny9zJPJK6KdYLjUcg8HBH30cMefoVQH6hvwktPm0KNOerkTsv1LM8kWseMEEc06JMGxtRzwPNJXGFXTEoeDqc0F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k6j5BKT0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k6j5BKT0"
Received: from killaraus.ideasonboard.com (85-76-151-95-nat.elisa-mobile.fi [85.76.151.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9407919C;
	Tue, 13 Oct 2026 19:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791913962;
	bh=ddKVGzWfBmOAVDerK2BUxx2wXfVDrBJEGGKCQ56psI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6j5BKT0EGOkJios12b3aB7nLoioDIoflPh/BsNditJsMk8lnPZQ35KHQDg7bUQZF
	 J0DlrSGskS/Mp8coI10ndV8FlQJwi/j1VVJWJsF+WXwwSbl3KHRcLVO9MRonL2lw3C
	 djKHXnwNfpWHu4kvN6jIaYH7wSZCOjnF6K/oRkhk=
Date: Tue, 13 Oct 2026 19:54:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Message-ID: <20261013175438.GL4214@killaraus.ideasonboard.com>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
 <20261013132625.GA159927@killaraus.ideasonboard.com>
 <acdfefce-a7cd-4918-bcca-52357bcf182d@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acdfefce-a7cd-4918-bcca-52357bcf182d@amd.com>

CC'ing missing ARM64 SoC maintainers.

On Tue, Oct 13, 2026 at 03:47:12PM +0200, Michal Simek wrote:
> On 10/13/26 15:26, Laurent Pinchart wrote:
> > On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
> >> On 9/16/26 22:44, Marek Vasut wrote:
> >>> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
> >>> The board is populated with four ethernet ports, QSPI NOR,
> >>> eMMC, UART and USB host interfaces.
> >>>
> >>> Signed-off-by: Marek Vasut <marex@nabladev.com>
> >>> ---
> >>> Cc: Conor Dooley <conor+dt@kernel.org>
> >>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >>> Cc: Michal Simek <michal.simek@amd.com>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: devicetree@vger.kernel.org
> >>> Cc: linux-arm-kernel@lists.infradead.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> ---
> >>> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
> >>>         undocumented, but the TI DP83822I is generic C45 PHY that
> >>>         is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
> >>> ---
> >>> V2: - Rename lm75 node to sensor@
> >>>       - Use GPIO_ACTIVE_LOW macro
> >>> V3: - Drop bogus clk_ignore_unused bootargs
> >>>       - Drop gpio line names
> >>> ---
> >>>    arch/arm64/boot/dts/xilinx/Makefile           |   1 +
> >>>    .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
> >>>    2 files changed, 301 insertions(+)
> >>>    create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> >>
> >> I am not able to review or take this board support further without publicly
> >> available hardware documentation for the platform (board-level and relevant
> >> interface details). Please share public documentation links once available, and
> >> I’ll be happy to revisit the patches.
> > 
> > There are plenty of boards that have no public documentation. Pretty
> > much all phones and laptops are like that. We even have a whole
> > architecture that only runs on a few machines in a single person's
> > basement [*] :-) The kernel has never required public schematics for
> > boards, SoCs or IP cores.
> > 
> > [*] A slight exageration possibly, but that's how I heard arch/alpha/
> >      being described at the maintainers summit.
> 
> Pretty much every SOC with programmable logic or FPGA boards have unlimited 
> amount of configurations and make no sense to describe all of them.

As far as I understand, the dts describes the board only, there's no PL
devices in there. The fact that the SoC has programmable logic doesn't
seem relevant, unless I'm missing something. The situation is the same
as with any other SoC. We have lots of device tree sources in upstream
for all kind of boards, with or without schematics available, for
development boards or for boards integrated in products, for easily
available mass-market products or for specialized devices more costly to
source.

Maybe I'm wrong about all this, so I've CC'ed all ARM64 SoC maintainers
on this e-mail to get feedback on the overall mainline policy for
upstreaming device tree sources.

> It means what make sense to describe are boards which people can look, check and 
> compare that configuration against their custom design.
> But if there is no public documentation what you want to use to compare against?
> 
> Can anybody even buy this board? (I expect you can buy that phones and laptops).

-- 
Regards,

Laurent Pinchart
