Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837261;
	b=23iQkpgcWBzP4bJ0GNHsnlk8Y5Em3VddgDBba/0kKlRhGdZjjyl1+CiRBtKPnWOj10Ya
	 xL5htOkg6eLkpDaDNMlg1zC+gNdGJIKkpA5qGz2cBlaoiTRFtAeswBP0e4wwvOoLz7WWQ
	 QNjh1ntw3HBQ0KGN4bby1iiqAkuGE0tZEMtGqU3UxGK6GSIjvNOtbPJMsnEa5v/eJ2GH1
	 9AXPrP0HZOMMB8KBwS5JrHtZkCwyIlCywHJRahAOEMvyVK2XrKaCctsLyVRclcTwCv2Xa
	 dnzXapSnCDYCePffInIYG1xIrZtLBvZ8DMpUHNFPfbZ/HfLlK+aBLVeLWB0QamLxa3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837261;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=P+N7AP+jMXptUY2cqeMwvnQE+TWjN2dvZ/FJTtPhFl8=;
	b=zA3aFzV1f2/zZZdKQC6qABCxJ7mjDcphZ4Ui6YJGYuByqPdnMJX4TSFESEhseT6NZ3DY
	 6Cbi23NDacUKqZ0WI00UvUDthf83jJEFePvBmhOPWtbD73kZ6Iuk2lFh5xSB0ZgQuqt+k
	 DbuIpDVaetJsdHFedqoYR+XdjMG40vcRM37Nd9hHG+p9LFKyaIOnfz5yAl9rA14waVQeH
	 iNpbV/Q6w1uT0RlbPCCkreCHS0ajNlABkwkR0O16zxgL3RNgnmMiklqbjHs/l4oSrNsw3
	 uXX8SZMcaX+fYCE+MK9KXvkohVg3UfzfzS/1z2wo8VY/HT4qVThcNX9vmt48ZUlO13w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bv7f9cJL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620F606A8A8;
	Mon, 16 Nov 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bv7f9cJL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE761F000C6;
	Mon, 16 Nov 2026 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837261;
	bh=P+N7AP+jMXptUY2cqeMwvnQE+TWjN2dvZ/FJTtPhFl8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bv7f9cJLbc/hytJRaPq6I/D24euOPIzMAZSDCd5fWteFagDQk8Ni6wriGFkmMURC+
	 2HUPpSz0C0AMi1xAvPIKo+pdTTMSnXsLbfEbNVuxuVMZM6C85z+osPL8ewbkK/17n9
	 o58q6X4FoP7AUASRT+BISCNVQl1AnxJcq/J+lSkQ/XIlSn+MnTwXMznQsjlviY47Ul
	 34qqvWG60S39OdHMa917c2D3JWWQZdU5imfBElaKCUvELg6QE6vftuSaPScdhlbUSW
	 vKWNHGUtCRgS/V7fiNho9w28ROWscGbohzIngE0RcDDQy7xF4201zcrGf+aDWACqdi
	 VpNjLOxoQNdDA==
Subject:
 Re: [PATCH net-next v6 5/7] net: ftgmac100: Require phy-mode for AST2700
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 16 Nov 2026 13:54:20 +0000
Message-ID: <179483726032.3136.17044396273720911557@kernel.org>
In-Reply-To: <20261112-support_ast2700-v6-5-238020bf46cf@aspeedtech.com>
References: <20261112-support_ast2700-v6-5-238020bf46cf@aspeedtech.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new AST2700 check in ftgmac100_mii_probe()
  (drivers/net/ethernet/faraday/ftgmac100.c, lines 1529-1535) can never…
- [High] The commit says it makes phy-mode required for AST2700 and fails
  probe when it is missing.
- [Low] In the series' binding change (commit "dt-bindings: net:
  ftgmac100: Add AST2700 compatible"), phy-mode is required for every…

--

net: ftgmac100: Require phy-mode for AST2700

This commit makes ftgmac100_mii_probe() fail with -EINVAL on AST2700 when
the phy-mode property is missing, instead of falling back to RGMII. The
stated goal is to make phy-mode a required property for AST2700, since
that SoC also supports RMII.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 9b7becb017262..5a578a62df673 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1526,8 +1526,13 @@ static int ftgmac100_mii_probe(struct net_device *netdev)
>  
>  	/* Default to RGMII. It's a gigabit part after all */
>  	err = of_get_phy_mode(np, &phy_intf);
> -	if (err)
> +	if (err) {
> +		if (priv->mac_id == FTGMAC100_AST2700) {
> +			dev_err(priv->dev, "phy-mode is required for this SoC\n");
> +			return -EINVAL;
> +		}
>  		phy_intf = PHY_INTERFACE_MODE_RGMII;
> +	}

[Severity: High]
Can this new branch ever be reached on AST2700?

priv->mii_bus is only set by ftgmac100_setup_mdio(), and ftgmac100_probe()
only calls that for the Faraday, AST2400 and AST2500 variants:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe() {
    ...
	if (priv->mac_id == FTGMAC100_FARADAY ||
	    priv->mac_id == FTGMAC100_AST2400 ||
	    priv->mac_id == FTGMAC100_AST2500) {
		err = ftgmac100_setup_mdio(netdev);
    ...
}

So on AST2700 priv->mii_bus is always NULL, and ftgmac100_mii_probe()
returns before it gets to the new check:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_mii_probe() {
    ...
	if (!priv->mii_bus) {
		dev_err(priv->dev, "No MDIO bus available\n");
		return -ENODEV;
	}
    ...
}

That would mean the "phy-mode is required for this SoC" message is never
printed, and the patch has no effect at runtime.

The commit message also says:

  The driver currently defaults to RGMII when the "phy-mode" property
  is missing from the device tree.

Is that accurate for AST2700? These are the probe paths in
ftgmac100_probe_dt():

  - use-ncsi: ftgmac100_probe_ncsi() hard-codes PHY_INTERFACE_MODE_RMII.
  - phy-handle / fixed-link: of_phy_get_and_connect() calls
    of_get_phy_mode() itself and returns NULL if phy-mode is missing, so
    probe already fails with "Failed to connect to phy".
  - no "mdio" child: stops at the mii_bus check above.

None of these paths reach the RGMII fallback.

The binding patch in this series ("dt-bindings: net: ftgmac100: Add
AST2700 compatible") says its required phy-mode matches the driver's
probe-time requirement, but this check doesn't seem to provide that.

The later patches in the series ("net: ftgmac100: Add AST2700 upper DMA
address support", "net: ftgmac100: Allow building on ARM64") don't touch
ftgmac100_mii_probe() or ftgmac100_probe_dt(). The check would still be
unreachable at the end of the series.

Would it make more sense to put this check on a path AST2700 actually
takes, for example at the top of ftgmac100_probe_dt()?

[Severity: High]
Apart from the reachability question above, some AST2700 probe paths
still succeed without phy-mode and never read it.

If the node has an "mdio" child but no phy-handle, fixed-link or
use-ncsi, ftgmac100_probe_dt() skips the legacy block and returns 0 with
no PHY attached:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe_dt() {
    ...
	if (!ftgmac100_has_child_node(np, "mdio")) {
		...
		err = ftgmac100_mii_probe(netdev);
		...
	}

	return 0;
}

The use-ncsi path also connects the fixed PHY with a hard-coded
PHY_INTERFACE_MODE_RMII and ignores phy-mode.

In the mdio-child case, netdev->phydev is still NULL after a successful
probe. Could opening the interface then oops in
ftgmac100_reset_and_config_mac()?

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_reset_and_config_mac() {
    ...
	if (priv->is_aspeed && priv->netdev->phydev->interface == PHY_INTERFACE_MODE_RMII) {
    ...
}

ftgmac100_start_hw() has the same kind of unchecked dereference through
the RMII quirk:

	if ((priv->quirks & FTGMAC100_QUIRK_RMII_ENABLE) &&
	    phydev->interface == PHY_INTERFACE_MODE_RMII) {

This would happen through ftgmac100_open()->ftgmac100_reset_and_config_mac(),
whether or not the DT has phy-mode. It also contradicts the claim in
"net: ftgmac100: Enable AST2700 RMII support" that ftgmac100_probe_dt()
always attaches a phy_device.

The dereference in ftgmac100_reset_and_config_mac() already existed for
AST2600 (since af350ee72e9dda). Earlier patches in this series make it
reachable on AST2700.

Should the phy-mode check go at the top of ftgmac100_probe_dt() (or in
ftgmac100_probe()), before the branching, instead of in the legacy
MDIO-scan helper?

[Severity: Low]
This isn't a bug, but the binding and the driver disagree on the NC-SI
path. "dt-bindings: net: ftgmac100: Add AST2700 compatible" requires
phy-mode for every aspeed,ast2700-mac node, including use-ncsi nodes:

  - if:
      properties:
        compatible:
          contains:
            const: aspeed,ast2700-mac
    then:
      required:
        - phy-mode

ftgmac100_probe_dt() hands off to ftgmac100_probe_ncsi() as soon as
use-ncsi is present, and that path connects with a fixed RMII mode:

	err = phy_connect_direct(netdev, phydev, ftgmac100_adjust_link,
				 PHY_INTERFACE_MODE_RMII);

An NC-SI node with phy-mode = "rgmii" would pass schema validation, but
the value is silently ignored. ftgmac100_start_hw() would still set
FTGMAC100_MACCR_RMII_ENABLE.

Should the binding exempt use-ncsi nodes, or should the driver check
phy-mode against RMII on that path?

>  
>  	/* Aspeed only supports these. I don't know about other IP
>  	 * block vendors so I'm going to just let them through for

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-support_ast2700-v6-0-238020bf46cf%40aspeedtech.com
