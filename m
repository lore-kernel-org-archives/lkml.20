Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802347;
	b=o2rEg3OT9DOjeLOCqyJCLvfvcKk5iLmChrs7sBAgYm/vVRelSWSP6ClCOdzyNUR04ZW0
	 9I+WEHQBd6VYChB8rccFOVolu6CAuxfx/WUuuaHyWugIgB9lw36azomtsstZcVFDzvaKW
	 mNM7iim/jDVTbYFFgM5BSRGGNbdXrLJrSAV2+/30jxyoLEjYT/Nq6V3PqYIGIE/jUFsyk
	 WWaqEvA2iIVcaY213zKcR7ATcO3PHL32Y1MGqIEVEeKC9NzBfo9FHmEXhvx7HHwcvsmQ9
	 kZ+hscRR+T7wZ7XjjBsYMkLsEjPIujVHZJ7VewBhGk2gb71HZVFEAF4JuUz+wEOi9Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802347;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=P6MXyLorrEi2Q6poZtanQJsUY+XSMKVdKruJnDJpfew=;
	b=BusAeQDGo68q4A+IvjyT08eL68HzoGDSy4L40Fzh2ktrkR2KrGv0mirQNcZLCs6P6Nir
	 WTWAodSYNkYZDr/fgDSTK5v6qK0BPCIFa7Ue+di23bAJycsCTrRlFXCgEeYMYtP07PScy
	 Yv7ZWAXElEF+i65wYQITXZukgqdZvRUu/T4JPdFfol7fgwC8AIRY2NgTMKtWJbqA2SrzZ
	 D8NHjBeEFdhxUu9IAr5CwF4ILdoAI5CPygydTGZ15EUGo0TreErrMrIz+4fzmQGuMFN40
	 HYtiZN8MbqIJfLk8XaBsYY3vzuqS6XPPLfxwsQ7pjtFo++jzFsgT2v+Ai6wh9zerPJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sq32BQPw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDEC606A31C;
	Mon, 16 Nov 2026 04:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sq32BQPw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A0B1F000C4;
	Mon, 16 Nov 2026 04:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802347;
	bh=P6MXyLorrEi2Q6poZtanQJsUY+XSMKVdKruJnDJpfew=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Sq32BQPw4RrZOevkYexKbQFHBwyonASywftHViXVbbXPXczpj3lp3xN6jwNdn9NI7
	 KsZ78/YodpQkXSuyZbrbgfL0ek4SKzBI2WMTe9zS8FmZG/XIpNtxu1Yj1cOXQz8HCp
	 1iyQxWBVHDyZktkJR/g0DVZCTPToggHpavQGKrleaXS1GbJbA4q+GM0pIErB1Er17Z
	 LN+mp4SMbUaLJr0aNK+GFcIPbXt/vH2za8HvaFP3oC+mE4PTL5lzNIEhI4PnOe7rJG
	 n3puxhsjA1sJoLICYh5/Nc4Xr9AzYxUayeGgTMrzYMxYtYDGz4bDti/DN2e1Y8NdTW
	 xmTFtuVGFRQuw==
Subject: Re: [PATCH net-next v5 1/6] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:26 +0000
Message-ID: <179480234612.3136.14924278307079342368@kernel.org>
In-Reply-To: <20261114182947.2908628-2-suraj.gupta2@amd.com>
References: <20261114182947.2908628-2-suraj.gupta2@amd.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: xilinx: axienet: axienet_probe() fails on software-node
  devices
- [Medium] This commit is presented as a no-functional-change refactor,
  but it also contains a real fix for a NULL pointer dereference.

--

net: xilinx: axienet: Introduce axienet_config for MAC-specific ops

This commit adds struct axienet_config, which holds MAC capability flags
and MAC-specific callbacks. It is filled in from the OF match table, and
the shared 1G code paths now use it. It also puts a NULL check on
lp->mii_bus around the MDIO teardown in axienet_remove().

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 7e83c4b5f1931..125ad3dbf6aa9 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -3149,10 +3297,12 @@ static int axienet_probe(struct platform_device *pdev)
>  	lp->tx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_TX_THRESHOLD,
>  					XAXIDMA_DFT_TX_USEC);
>  
> -	ret = axienet_mdio_setup(lp);
> -	if (ret)
> -		dev_warn(&pdev->dev,
> -			 "error registering MDIO bus: %d\n", ret);
> +	if (lp->axienet_config->mdio) {
> +		ret = axienet_mdio_setup(lp);
> +		if (ret)
> +			dev_warn(&pdev->dev,
> +				 "error registering MDIO bus: %d\n", ret);
> +	}
>  
>  	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
>  	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {

[ ... ]

> @@ -3235,7 +3383,8 @@ static void axienet_remove(struct platform_device *pdev)
>  	if (lp->pcs_phy)
>  		put_device(&lp->pcs_phy->dev);
>  
> -	axienet_mdio_teardown(lp);
> +	if (lp->mii_bus)
> +		axienet_mdio_teardown(lp);
>  }

[Severity: Medium]
Could this NULL check go to net as its own fix, with a Fixes: tag and
Cc: stable, and this refactor then be based on it?

Without the guard, the current 1G driver can oops on unbind. Every
failure path in axienet_mdio_setup() frees the bus and sets lp->mii_bus
to NULL. The failure paths are an MDC divisor overflow, a timeout in
axienet_mdio_wait_until_ready(), and a failed of_mdiobus_register():

drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:axienet_mdio_setup() {
    ...
unregister:
	of_node_put(mdio_node);
	mdiobus_free(bus);
	lp->mii_bus = NULL;
	return ret;
}

axienet_probe() only warns and continues, so the device binds with
lp->mii_bus == NULL. Then, on unbind or remove:

axienet_remove()
  axienet_mdio_teardown(lp)
    mdiobus_unregister(lp->mii_bus)
      reads bus->state on a NULL bus

The commit message already describes this:

  It also hardens the existing 1G path: a failed
  axienet_mdio_setup() already left lp->mii_bus NULL while probe only warns
  and continues (e.g. a 1G device using a fixed-link), so unbinding such a
  device would dereference NULL in mdiobus_unregister().

The fix is part of a large refactor and has no Fixes: tag, so stable and
LTS kernels can't backport it. No other patch in the series carries it
on its own. Two candidates for the Fixes: tag are the commit that made
MDIO setup failure non-fatal in probe and the commit that clears
lp->mii_bus on failure.

[ ... ]

> @@ -2894,27 +3042,13 @@ static int axienet_probe(struct platform_device *pdev)
>  	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
>  	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
>  
> -	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev,
> -						    "s_axi_lite_clk");
> -	if (!lp->axi_clk) {
> -		/* For backward compatibility, if named AXI clock is not present,
> -		 * treat the first clock specified as the AXI clock.
> -		 */
> -		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
> -	}
> -	if (IS_ERR(lp->axi_clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
> -				     "could not get AXI clock\n");
> -
> -	lp->misc_clks[0].id = "axis_clk";
> -	lp->misc_clks[1].id = "ref_clk";
> -	lp->misc_clks[2].id = "mgt_clk";
> +	lp->axienet_config = device_get_match_data(&pdev->dev);
> +	if (!lp->axienet_config)
> +		return -ENODEV;
>  
> -	ret = devm_clk_bulk_get_optional_enable(&pdev->dev, XAE_NUM_MISC_CLOCKS,
> -						lp->misc_clks);
> +	ret = lp->axienet_config->clk_init(lp);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "could not get/enable misc. clocks\n");
> +		return ret;
>  
>  	/* Map device registers */
>  	lp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);

[Severity: High]
This makes missing match data a hard probe failure. Doesn't that
break devices that are not instantiated from DT?

device_get_match_data() only asks the device's fwnode, through
fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev). For
an OF node that resolves through axienet_of_match. software_node_ops
does not implement .device_get_match_data, though, and axienet_driver
has no id_table either.

The driver still carries MODULE_ALIAS("platform:" AXIENET_DRIVER_NAME).
Probe also reads its configuration through device_property_read_u32()
and the fwnode helpers, so a parent driver can create the AXI Ethernet
device by name with a software_node attached. The ptp_ocp TimeCard
child device is one example. Such a device has no OF match, so
device_get_match_data() returns NULL. axienet_probe() then returns
-ENODEV before it touches the hardware. Before this patch the same
device probed fine as a 1G MAC.

The commit message says no functional change is intended for the
existing 1G path, and this is one. As far as I can see the later
patches in the series keep this lookup as is, so the regression is
still there at the end of the series.

Since every device bound by name today is a 1G MAC, would it be enough
to fall back to &axienet_1g_config when device_get_match_data() returns
NULL? Or would you rather add a platform_device_id table whose
driver_data points at axienet_1g_config, and have probe use
platform_get_device_id() when there is no fwnode match data?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com
