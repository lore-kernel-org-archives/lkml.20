Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837258;
	b=KvCcSRc32e5972gU+J7E7RLVyDIBqYVmhRvV47VThRy3f2S9d0m4X4EHVWEhOn4LRr0a
	 +zxTJlWuKh08QFoKaalba4IsvkpcBlLlZngBzRStxKRgw3mFOg4FW4qgphpqWIomV6GcM
	 4hJeuTHWMCObd3JK2jy66R3UczXgJ9MzRC20Oxv4H/NbOOe6UPNreZRz+DaUelVTTucyt
	 4k2sxijZ4rKyNcAmBVn/Baz6dMKPG/bW2o2jB8JGthmJVDfV8lc/U+YU4aQo+xDjE/556
	 suDrPLmtFDUWKwomcYqrHsCKFVWZ1btIVjqvfun8wVDhcZLeY9M6rjP32qDRWMgybdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837258;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tp4SYQmArwtumUPsA4VFwsspUoHY7/07FpSGgzrJZMk=;
	b=TtxchqQbMw/4vCbIr/S7RO6QmwwUZ67dSYRSYGmJ3EFennFMCGWL1mKjZ9Z54Uq5gsfH
	 ZeW3qJHYlJ0yRiQLX/VadncCm5Xb4iNGDpA2Ib/KYlg1y8brb+5RKwKwrk+cLNXlO4L22
	 rCGfQGrGc/I3d+aNKrty2rYU0/hcbtfTIffpDpGPv1K+P0+OO3n0oJUue5fzdSunbxmJ2
	 7Bc8FP6/jxcz1pnt3t7k/Ij1sHc09tjam53qw02FDuWc5KMeQUar1OiPaweSJdqmbJJCy
	 j5C3xpABeZbGXJRg7kMWtgj7Kn2CqWG1Zm/5hBD/1ArKGKnfNs3zxhU46sugxYutmvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsRw+h5W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4395606A333;
	Mon, 16 Nov 2026 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsRw+h5W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DCC1F000C9;
	Mon, 16 Nov 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837258;
	bh=tp4SYQmArwtumUPsA4VFwsspUoHY7/07FpSGgzrJZMk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jsRw+h5WkBeegvz/3jioVK/Wu2SUbaAh2i1GkW3LtzQn6LrbehgCaXCUGZ9GRc82g
	 h9JKltb1YDjN9kdQzBALn4+2rSdgdHghLeOYb/RMaeA/b3NBH2joKg9IFNipkLa5s0
	 LzC86czQN4kCwzgopQc0Q6dm38GpAVy0c3zsLm7Fk5Htacw1SDXCSNxeDWmcq7LSz7
	 R+R4CWLQusWrZS+6R6DBn+LWGq6Wywn9rtDWDLREROVFVlVt5JH8fCxxcd6xK8qc+Y
	 01kNObVQn/9FfLr6DXFLp4P4Xz9FwojSlWp4AvmYsBrbK6YVxlLvXcHCptkhNvqPb4
	 /9S7qwuFFUTCw==
Subject:
 Re: [PATCH net-next v6 3/7] net: ftgmac100: Add AST2700 compatible support
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 16 Nov 2026 13:54:17 +0000
Message-ID: <179483725712.3136.17992179574597275768@kernel.org>
In-Reply-To: <20261112-support_ast2700-v6-3-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-3-238020bf46cf@aspeedtech.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ftgmac100_reset_and_config_mac() dereferences
  priv->netdev->phydev->interface whenever priv->is_aspeed is true, with…
- [High] net: ftgmac100: missing MAC reset deassertion for AST2700 in
  ftgmac100_probe()
- [Medium] Since this patch, AST2700 goes through the Aspeed path in
  ftgmac100_probe(): is_aspeed is set, EDORR/EDOTR use BIT(30), and…
- [Medium] The series commit "dt-bindings: net: ftgmac100: Make Aspeed
  compatibles standalone" (extended by "dt-bindings: net: ftgmac100: Add…
- [Low] The binding requires `phy-mode` for every aspeed,ast2700-mac
  node, and its commit message says this matches "the driver's probe-…
- [Low] The comment on struct ftgmac100::rclk still says `/*
  AST2500/AST2600 RMII ref clock gate */`.

--

net: ftgmac100: Add AST2700 compatible support

This patch adds an FTGMAC100_AST2700 mac_id, its OF match data and an
"aspeed,ast2700-mac" compatible entry. It also adds AST2700 to the Aspeed
branch in ftgmac100_probe(), which sets is_aspeed and the BIT(30)
EDORR/EDOTR masks for the new MAC.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 6d2fe5c2f3903..67b1fa464a421 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c

[ ... ]

> @@ -2017,7 +2018,8 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  
>  	if (priv->mac_id == FTGMAC100_AST2400 ||
>  	    priv->mac_id == FTGMAC100_AST2500 ||
> -	    priv->mac_id == FTGMAC100_AST2600) {
> +	    priv->mac_id == FTGMAC100_AST2600 ||
> +	    priv->mac_id == FTGMAC100_AST2700) {
>  		priv->rxdes0_edorr_mask = BIT(30);
>  		priv->txdes0_edotr_mask = BIT(30);
>  		priv->is_aspeed = true;

[Severity: High]
With AST2700 now on the is_aspeed path, does anything release the MAC
from reset on this SoC?

On AST2400 to AST2600, the MAC clock gates in the Aspeed clock drivers
carry a coupled reset index. Enabling MACCLK through
devm_clk_get_enabled() in ftgmac100_setup_clk() therefore also
deasserts the SCU MAC reset.

On AST2700 that coupling seems to be gone. The SCU1_CLK_GATE_MAC0CLK to
MAC2CLK gates in clk-ast2700.c only clear the stop bit in
SCU1_CLK_STOP. SCU1_RESET_MAC0 to MAC2 are separate reset lines in
reset-aspeed.c, so enabling the clock leaves the MAC in reset.

ftgmac100_probe() gets priv->rst with
devm_reset_control_get_optional_exclusive() but never calls
reset_control_deassert() on it. The only deassert is in
ftgmac100_reset_and_config_mac(), and only for RMII:

	/* Aspeed RMII needs SCU reset to clear status */
	if (priv->is_aspeed && priv->netdev->phydev->interface == PHY_INTERFACE_MODE_RMII) {

Suppose the bootloader did not release the AST2700 MAC reset. An RGMII
MAC would then stay in reset across probe and ndo_open, and
ftgmac100_open() -> ftgmac100_reset_and_config_mac() ->
ftgmac100_reset_mac() would be driving a block that is held in reset.
The interface would not come up, and the most likely visible symptom is
-EIO from the SW_RST poll.

The probe ordering has a related problem. ftgmac100_initial_mac() reads
FTGMAC100_OFFSET_MAC_MADR and FTGMAC100_OFFSET_MAC_LADR before priv->rst
is obtained and before ftgmac100_setup_clk() enables the MAC clock. On
AST2700 this read can hit a gated and reset block. In that case the
bootloader-programmed address is lost and the driver falls back to a
random MAC.

Other AST2700 peripheral drivers, such as aspeed-vhub and
aspeed-g6-pwm-tach, deassert their reset explicitly in probe. For
AST2700, should ftgmac100_probe() enable the clock and deassert
priv->rst before it first touches MAC registers? Or does the series
expect firmware to always leave the MAC clocked and out of reset? If it
is the latter, that requirement should be stated somewhere.

[Severity: Medium]
This groups AST2700 with the AST2600-style Aspeed MACs. Should the two
AST2600-only workarounds later in ftgmac100_probe() also apply to AST2700?

	/* Disable ast2600 problematic HW arbitration */
	if (priv->mac_id == FTGMAC100_AST2600)
		iowrite32(FTGMAC100_TM_DEFAULT,
			  priv->base + FTGMAC100_OFFSET_TM);
	...
	/* AST2600 tx checksum with NCSI is broken */
	if (priv->use_ncsi && priv->mac_id == FTGMAC100_AST2600)
		netdev->hw_features &= ~NETIF_F_HW_CSUM;

Suppose the AST2700 MAC kept the AST2600 arbitration logic or the NC-SI TX
checksum defect. AST2700 would then run with the hardware default
arbitration mode, and with NC-SI it would still advertise NETIF_F_HW_CSUM.

Neither this patch nor the rest of the series changes these checks or says
that AST2700 is free of these errata.

[Severity: High]
Now that is_aspeed is set for AST2700, can ftgmac100_reset_and_config_mac()
dereference a NULL phydev?

ftgmac100_reset_and_config_mac() {
	...
	if (priv->is_aspeed && priv->netdev->phydev->interface == PHY_INTERFACE_MODE_RMII) {
	...
}

ftgmac100_probe_dt() returns 0 without attaching a PHY when the node has no
use-ncsi, no fixed-link and no phy-handle, but does have an mdio child:

	if (!ftgmac100_has_child_node(np, "mdio")) {
		...
		err = ftgmac100_mii_probe(netdev);
		...
	}

	return 0;

The binding allows this configuration. For such an AST2700 node,
register_netdev() succeeds. After that, both of these paths would reach the
unchecked dereference:

  ftgmac100_open()->ftgmac100_reset_and_config_mac()
  ftgmac100_reset()->ftgmac100_reset_and_config_mac()

ftgmac100_open() runs under RTNL, so an oops there would leave rtnl_mutex
held.

The dereference itself dates back to commit af350ee72e9d ("net: ftgmac100:
Add optional reset control for RMII mode on Aspeed SoCs"), which covered
AST2400 to AST2600. This patch makes it reachable for AST2700.

Later in the series, "net: ftgmac100: Enable AST2700 RMII support" adds a
second unchecked dereference in ftgmac100_start_hw():

	if ((priv->quirks & FTGMAC100_QUIRK_RMII_ENABLE) &&
	    phydev->interface == PHY_INTERFACE_MODE_RMII) {

That commit message says "ftgmac100_probe_dt() always attaches a
phy_device before register_netdev() can succeed". The mdio child path
above shows that this is not always true.

Elsewhere, ftgmac100_open() and the reset task both check
if (netdev->phydev) before using it. Should these two paths do the same?

[Severity: Low]
This isn't a bug, but with is_aspeed now set for AST2700,
ftgmac100_setup_clk() also stores the "RCLK" clock in priv->rclk for
AST2700. The comment on that field in struct ftgmac100 still reads:

	/* AST2500/AST2600 RMII ref clock gate */
	struct clk *rclk;

Should it mention AST2700, as the binding in this series does?

[ ... ]

> @@ -2142,6 +2148,8 @@ static const struct of_device_id ftgmac100_of_match[] = {
>  	  .data = &ftgmac100_match_data_ast2500 },
>  	{ .compatible = "aspeed,ast2600-mac",
>  	  .data = &ftgmac100_match_data_ast2600 },
> +	{ .compatible = "aspeed,ast2700-mac",
> +	  .data = &ftgmac100_match_data_ast2700 },
>  	{ .compatible = "faraday,ftgmac100",
>  	  .data = &ftgmac100_match_data_faraday },
>  	{ }

[Severity: Medium]
This comment is about the binding changes elsewhere in the series, not this
hunk. "dt-bindings: net: ftgmac100: Make Aspeed compatibles standalone",
later extended by "dt-bindings: net: ftgmac100: Add AST2700 compatible",
removes the oneOf that accepted the "aspeed,ast2x00-mac",
"faraday,ftgmac100" pair. In its place is a single-value enum:

  compatible:
    enum:
      - faraday,ftgmac100
      - aspeed,ast2400-mac
      - aspeed,ast2500-mac
      - aspeed,ast2600-mac
      - aspeed,ast2700-mac

Will the in-tree Aspeed MAC nodes still validate? They all still use the
two-string form. For example, aspeed-g6.dtsi has:

	compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";

aspeed-g4.dtsi and aspeed-g5.dtsi use the same form, and the series does
not change any of them. With a bare enum, dtbs_check would reject all of
these nodes as too long.

The change also drops a documented compatible combination that deployed
DTBs use. The match table above already handles both forms, so the driver
does not need the binding restructured.

[Severity: Low]
This one is also about the series. The binding makes phy-mode required for
every aspeed,ast2700-mac node, and its commit message says this matches
"the driver's probe-time requirement". Can the driver ever enforce that
requirement?

"net: ftgmac100: Require phy-mode for AST2700" adds this check to
ftgmac100_mii_probe():

	if (priv->mac_id == FTGMAC100_AST2700) {
		dev_err(priv->dev, "phy-mode is required for this SoC\n");
		return -EINVAL;
	}

However, ftgmac100_mii_probe() returns -ENODEV earlier when !priv->mii_bus.
priv->mii_bus is only set by ftgmac100_setup_mdio(), and ftgmac100_probe()
calls that only for FARADAY, AST2400 and AST2500:

	if (priv->mac_id == FTGMAC100_FARADAY ||
	    priv->mac_id == FTGMAC100_AST2400 ||
	    priv->mac_id == FTGMAC100_AST2500) {
		err = ftgmac100_setup_mdio(netdev);

The other paths behave as follows:

  - ftgmac100_probe_ncsi() hard-codes PHY_INTERFACE_MODE_RMII and never
    reads phy-mode.
  - On the phy-handle and fixed-link path, of_phy_get_and_connect() fails
    without phy-mode for every compatible, not just AST2700.

So the new AST2700 check looks unreachable, and NC-SI AST2700 nodes would
have to carry a property that the driver ignores.

Could the binding constraint and the commit messages be updated to match
what the driver actually does?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-support_ast2700-v6-0-238020bf46cf%40aspeedtech.com
