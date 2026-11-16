Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837068;
	b=3WY1dhbCfbROofHzKlODwbxLVHCe2dxPQ08rK++W9D9QDronjlKP1Pazxrxj3KGoyXBg
	 +iqoFCe/30lmmlYXiPTgvfTzmIL7ClTFgNi08aApzOiUj0NiW7m4v7OhA9DoLzat/UhNC
	 DNnBxPtk11VsRmnOPghj/wjSOYWjH326J2FLVBxq/OocjlR1WFxEBBkPjuX2QC6jI7jj8
	 iif+6BsrmS6sQQFXHfX7+cy9hQwNpKNsZ4rMNTpMtbhIY+XLoLosdZ/ZtXCVMfmYFcGKP
	 4/kNUK0pPlB0rq6/nfSZovG4nhZ6K91TxqNzBxzEOIkSDLHg7KEcK1IHnYkXy/g362A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837068;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4ZuD8B6hoNm8RHjKxcqJEK2enGEm+a0togdRV6PHQdQ=;
	b=oWTZJ4lXorsjZ/IJHVIGoqOzm2wsIUg0Mzg15lV6xlswEMAszAIfA4ijwLsOwRVXOVk/
	 iC4PMjGHTQGeKfPwXHKPbJt/0X1Nn23EJy6fqatMQz1/GuloPYg7W5WwI7+UM2SJJtpOU
	 3ykxlKDSoOaY/JmknqkgeRwQdzlXJDv1r7b3AqmH4UtRMDZXDIVyir18xuVTxsmXxPgoj
	 dKhA6jk+fuqjmW2pvX4c2J+0NrtWJEb3H8USLaHb+Pefq8ODHsZhoYvdczeN0/DkeZbc0
	 LCK9IyimQYMM5RI0sClLyMo4+G5t1+avAvXhZ3EmqL6VxsJAERBEK12YhFADbmOGpAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2u72R0l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D1606A896;
	Mon, 16 Nov 2026 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2u72R0l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0A01F000C4;
	Mon, 16 Nov 2026 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837067;
	bh=4ZuD8B6hoNm8RHjKxcqJEK2enGEm+a0togdRV6PHQdQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M2u72R0lKsdFXpPt2rj1f0V6NREVyNtpflspHFPxqWpwLgSIg99ycLNte0cDSixiu
	 xGgBVLgbYANmznimAEGQ/gQ4dX7Naw8gNit823UXp6kYow2oO2nic6Qr/fxuqJD/oQ
	 OYYnRvZKAf5igr7CFJx5QBkMNeFNUQpig8DLf/WVsQ76JvPjjhoggy9coRb+0Y8hPc
	 ynj2WI7y7UwitpR9XS9i0Jq4FDOP+rj4Haj38dMbu7VKNTVbBJ/0L8LYQ+aTTPqNV6
	 zQ+6JhJrhQqcQ92Ayh0LLtkRln4dbrqGWkSouDe+n+v0D+AuEezxR24eDKIC5QOfs1
	 PbliYSXwliKDg==
Subject: Re: [PATCH net] net: ibm: emac: attach the fixed-link PHY with
 of_phy_connect()
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, rosenp@gmail.com,
 jacob.e.keller@intel.com, daniel.machon@microchip.com, chunkeey@gmail.com,
 kees+treewide@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xiaolinkui@kylinos.cn
Date: Mon, 16 Nov 2026 13:51:06 +0000
Message-ID: <179483706662.3136.12689489417547730312@kernel.org>
In-Reply-To: <20261112075321.3903875-1-xiaolinkui@126.com>
References: <20261112075321.3903875-1-xiaolinkui@126.com>
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

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch attaches the fixed-link PHY with of_phy_connect() in
  emac_init_phy() (drivers/net/ethernet/ibm/emac/core.c:2680) but never…
- [Medium] In emac_init_phy()
  (drivers/net/ethernet/ibm/emac/core.c:2684), the fixed-link path calls…
- [Medium] net: ibm: emac: fixed-link PHY leak in emac_init_phy() on
  connect error

--

net: ibm: emac: attach the fixed-link PHY with of_phy_connect()

This commit changes the fixed-link branch of emac_init_phy(). Instead of
setting ndev->phydev by hand, it now calls of_phy_connect(), so the fixed
PHY is properly attached and enters the netdev's phy_link_topology. This
avoids a NULL link_topo dereference in phy_prepare_data() for
ETHTOOL_MSG_PHY_GET.

> diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
> index 640618c0a09e9..6e8b71138bb9a 100644
> --- a/drivers/net/ethernet/ibm/emac/core.c
> +++ b/drivers/net/ethernet/ibm/emac/core.c
> @@ -2674,11 +2674,14 @@ static int emac_init_phy(struct emac_instance *dev)
>  				return res;
>  
>  			res = of_phy_register_fixed_link(np);
> -			ndev->phydev = of_phy_find_device(np);
> -			if (res || !ndev->phydev)
> -				return res ? res : -EINVAL;
> -			emac_adjust_link(dev->ndev);
> -			put_device(&ndev->phydev->mdio.dev);
> +			if (res)
> +				return res;
> +
> +			if (!of_phy_connect(ndev, np, &emac_adjust_link, 0,
> +					    dev->phy_mode))
> +				return -EINVAL;

[Severity: Medium]
When of_phy_connect() fails here, the fixed PHY that
of_phy_register_fixed_link(np) registered a few lines above is never
cleaned up. emac_init_phy() returns -EINVAL immediately. Neither this
function nor the emac_probe() error path calls
of_phy_deregister_fixed_link(np).

of_phy_register_fixed_link() goes through fixed_phy_register(), which
does three things:

- takes one of the NUM_FP slots in the fixed PHY table;
- takes a reference on np with of_node_get();
- registers a phy_device on the global fixed MDIO bus.

All of this survives the failed probe.

of_phy_connect() can return NULL here in several ways:

- of_phy_find_device() does not find the device;
- phy_attach_direct() fails in try_module_get(),
  phy_link_topo_add_phy() or phy_init_hw();
- phy_attach_direct() hits the -EBUSY "PHY already attached" case.

The last case ties in with the missing phy_disconnect() in
emac_remove(). On a rebind the first fixed PHY is still attached. Every
later probe attempt then registers another fixed PHY for the same
of_node, fails to connect, and leaks it. The fixed PHY table has only
NUM_FP slots and is shared by the whole system. Wouldn't a few
unbind/bind cycles exhaust it, so that fixed-link users of other
drivers fail too?

The old code had a similar leak when of_phy_find_device() returned
NULL. This patch rewrites this error handling anyway. Could the failure
branch call of_phy_deregister_fixed_link(np) before returning? The
drivers named in the commit message deregister the fixed link on their
probe error paths. The same unwinding would also be needed when probe
fails after emac_init_phy() has succeeded.

[Severity: High]

This path now really attaches the PHY. Does anything ever detach it? I
couldn't find phy_disconnect(), phy_detach() or
of_phy_deregister_fixed_link() anywhere under
drivers/net/ethernet/ibm/emac/.

Two paths leave the attach in place. In emac_probe(), a register_netdev()
failure jumps straight to err_detach_tah:

    err = register_netdev(ndev);
    if (err) {
        ...
        goto err_detach_tah;
    }

and emac_remove() only does:

    unregister_netdev(dev->ndev);
    ...
    mal_unregister_commac(dev->mal, &dev->commac);
    emac_put_deps(dev);

The ndev comes from devm_alloc_etherdev(), so devres frees it on unbind or
on a failed probe. The fixed PHY stays registered on the global fixed MDIO
bus. Its attached_dev, adjust_link and phy_link_change fields still point
at the freed netdev. Before this patch, attached_dev stayed NULL on this
path.

Can this lead to a use-after-free on system suspend? The path would be:

mdio_bus_phy_suspend()
  mdio_bus_phy_may_suspend()
    if (netdev->ethtool->wol_enabled)
        return false;

where netdev is the stale attached_dev. phy_suspend() also reads
netdev->ethtool->wol_enabled.

Does rebinding break too? On unbind/bind, a module reload, or a retry
after a failed register_netdev(), of_phy_register_fixed_link(np) registers
a second fixed PHY with the same of_node. But of_phy_find_device(np)
inside of_phy_connect() returns the first one, which is still attached.
phy_attach_direct() then fails here:

    if (phydev->phy_link_change) {
        phydev_err(phydev, "PHY already attached\n");
        err = -EBUSY;

so emac_init_phy() returns -EINVAL on every later probe. The old code
rebound without an error, which doesn't seem to match this part of the
commit message:

    so nothing else changes.

Each bind also seems to leak a few things:

- the device reference;
- the try_module_get() on the fixed_phy module, which then can't be
  unloaded;
- the module reference on the genphy driver;
- the phy_device_node allocated by phy_link_topo_add_phy(), because
  netdev_free_phy_link_topology() only calls xa_destroy() on topo->phys.

The of_phy_connect() kernel-doc says:

    The refcount must be dropped by calling phy_disconnect() or phy_detach().

The drivers named in the commit message (gianfar, fec, davinci_emac,
nixge) pair of_phy_connect() with phy_disconnect() and
of_phy_deregister_fixed_link(), both on teardown and on the error paths.

The commit message leaves phy_disconnect() to a separate change. But this
patch is what creates the attach state on the fixed-link path. Should
phy_disconnect() and of_phy_deregister_fixed_link() be added here, both to
the emac_probe() error path after emac_init_phy() and to emac_remove()?

> +
> +			emac_adjust_link(ndev);

[Severity: Medium]

Does phydev hold valid speed, duplex and pause values at this point?

fixed_phy_register() only stores the status in fmb_fixed_phys[] for
register emulation:

    fmb_fixed_phys[phy_addr].status = *status;
    fmb_fixed_phys[phy_addr].status.link = true;

and phy_device_create() starts with:

    dev->speed = SPEED_UNKNOWN;
    dev->duplex = DUPLEX_UNKNOWN;
    dev->pause = false;

None of phy_attach_direct(), phy_probe(), phy_init_hw() or phy_resume()
reads link status, and the state machine is not started.

So emac_adjust_link() copies SPEED_UNKNOWN, DUPLEX_UNKNOWN and pause = 0
into dev->phy. That overwrites the dev->phy.pause = 1 set earlier in this
branch, and the SPEED_100/DUPLEX_FULL defaults from emac_probe().

emac_open() then calls emac_configure(). Because duplex is not
DUPLEX_FULL, it leaves out EMAC_MR1_FDE / EMAC_MR1_MWSW_001 and the flow
control bits. It takes the default case in the dev->phy.speed switch, and
it passes SPEED_UNKNOWN to rgmii_set_speed() / zmii_set_speed().

Wouldn't that leave the MAC at 10 Mb/s half duplex whatever the
fixed-link node says, for example 1000/full to an RTL8363SB switch?

The old hand-assignment code behaved the same way, but the commit message
relies on this call to configure the link:

    emac_adjust_link() is still called once by hand
    afterwards and the PHY state machine is still not started, because a
    fixed link does not change.

Now that the PHY is attached, could phy_read_status(ndev->phydev) be
called under phydev->lock before emac_adjust_link()? Or could phylib drive
the handler instead?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112075321.3903875-1-xiaolinkui%40126.com
