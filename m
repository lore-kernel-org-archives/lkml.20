Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837294;
	b=mhWh15zk9sPJPi7NZwMF1YAzNbVtl6sHmIu+jxBw0fiVQ6JX94NGJgXRxeK4CaZ4s2eL
	 80pF3K1nbwvWpH6YiSauNCf2N0ECPHTcidPPyirPCTrstKqWbeb2iKrzdh4mwi1D9Jf7W
	 nMViamU50aaGBxAltyLXFLPHl4C83BUDLstCgRyQMrFs3WzExVctzYA6HjrhXCpqKGNNh
	 1ifhmAUdqkmb4zxyCPEqq+q4XYFLA8Z7kSTC9I1s5W6nDnUphTRSCz3d1HGoTWNhT/u+9
	 AnXNW8AeCF6G2L6tudIYV7QSV2PYAxXTSIlNxHhBDvB1bXXnULOU1o2vTxwK+BaboHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837294;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VQpQ/BkgELCh0EQTsS1x2Mq4o8wvN5MsedoF6SbdzAM=;
	b=eOniXHwqhtj/H8zDvhaKnXHpBVqZEacb4FbwHNjrVLmW8nJYzDhkzxgqEy6tPvFGKwG9
	 SZI5Q0aSplRZrJ9/q02+F6MtFbpYY17EvD0BjeV59QwDBBgUJnapKRoSj3+A5zYxUwZZy
	 ubxjriKiY05cR9DYl9dzbV2oxrPT14lzUpXiS+fwXNESUt+hyAUzYVu3tfn/2i+sp+tIs
	 YdrjyficWJ72g0Mm9bQsg1N1rwtCrCO3Qnf8AtXlPO1csbIrvf76wFiLsnIecUoEHrT6E
	 boRxestG7ihQ4LyToqyfL36LJdQ+ReOP12StiPVrlTTqEFDR2US/iRl4RsaNouNCXeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WTta7Q2h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87076606AE7C;
	Mon, 16 Nov 2026 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WTta7Q2h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C8C1F000C4;
	Mon, 16 Nov 2026 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837294;
	bh=VQpQ/BkgELCh0EQTsS1x2Mq4o8wvN5MsedoF6SbdzAM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WTta7Q2hJgOqiL5DOLU+Ks+AyQXYnRI3d6+7BMmHU41M4D+s7Ttwft4z5QGx9POTi
	 IexV9bLHOv3/9UI3BVuT2Tx8GBCRyNnTSTU1bfaJnfZRaejVJ1GYY2X8j/VduLDIaa
	 /tmNBP8NZS4AFQKef9aYn0pcsKjvpaFRvWihBRhFJH15UvgdIK9N/wJpcV8YLbB6Vi
	 p6WVP0fYIFoCqKUo5CvylsH20lotjRjt3JPIWecU62XvSLFvFUL8f+/LgIC8c2hSgT
	 H4xaUpBXoq+smG/j2wjPwdQRYsvpktvBg51OuPdOFittFs5rWndroGHh5HWuDxvtvM
	 oZbAW42SNR/Zw==
Subject: Re: [PATCH net v3 RESEND 2/3] net: ti: icssg-prueth: Fix phylib
 stop/start in emac_restart
From: netdev-bot+sashiko@kernel.org
To: m-malladi@ti.com
Cc: diogo.ivo@siemens.com, haokexin@gmail.com, philippe.schenker@impulsing.ch,
 devnexen@gmail.com, horms@kernel.org, jacob.e.keller@intel.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, danishanwar@ti.com
Date: Mon, 16 Nov 2026 13:54:53 +0000
Message-ID: <179483729301.3136.8061372443057253896@kernel.org>
In-Reply-To: <20261112102140.2744508-3-m-malladi@ti.com>
References: <20261112102140.2744508-3-m-malladi@ti.com>
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

- [High] prueth_emac_restart()
  (drivers/net/ethernet/ti/icssg/icssg_prueth.c) now calls phy_stop()…
- [Medium] The new restart_phy error label in prueth_emac_restart()
  restarts phylib even when the firmware is known to be stopped.
- [Medium] The commit message presents phy_stop()/phy_start() only as a
  way to block emac_adjust_link() R30 commands.

--

net: ti: icssg-prueth: Fix phylib stop/start in emac_restart

This patch adds phy_stop() calls for both ports before
prueth_emac_restart() halts the PRU firmware, and phy_start() calls after
the restart. It also turns the early error returns into a goto to a new
restart_phy label. The goal is to keep emac_adjust_link() from sending R30
commands to the PRU while it is stopped.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 591be5c8056b4..ef5dce595f68a 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -1837,6 +1837,14 @@ static int prueth_emac_restart(struct prueth *prueth)
>  	struct prueth_emac *emac1 = prueth->emac[PRUETH_MAC1];
>  	int ret;
>  
> +	/* Halt phylib to stop emac_adjust_link() from issuing R30 commands
> +	 * to the PRU while the firmware is stopped.
> +	 */
> +	if (emac0->ndev->phydev)
> +		phy_stop(emac0->ndev->phydev);
> +	if (emac1->ndev->phydev)
> +		phy_stop(emac1->ndev->phydev);

[Severity: High]

What happens when one of the ports is down at this point?
emac_phy_connect() runs at probe, so ndev->phydev is never NULL here. None
of the callers check netif_running():

prueth_netdevice_port_link()->icssg_change_mode()->prueth_emac_restart()
prueth_netdevice_port_unlink()->prueth_emac_restart()
prueth_hsr_port_link()->icssg_change_mode()->prueth_emac_restart()
prueth_hsr_port_unlink()->prueth_emac_restart()

prueth_emac_restart() itself checks netif_running() before calling
netif_device_detach(), so it already expects ports to be down sometimes.

A port that was never opened has its PHY in PHY_READY. A port closed by
emac_ndo_stop() has its PHY in PHY_HALTED. phy_stop() WARNs and returns for
both of those states:

drivers/net/phy/phy.c:phy_stop() {
	...
	if (!phy_is_started(phydev) && phydev->state != PHY_DOWN &&
	    phydev->state != PHY_ERROR) {
		WARN(1, "called from state %s\n",
		     phy_state_to_str(phydev->state));
		return;
	}
	...
}

The phy_start() at restart_phy runs unconditionally. It accepts READY and
HALTED, so it resumes the PHY and starts the state machine on a netdev
that is administratively down.

Once autoneg completes, emac_adjust_link() runs for the closed port. It
sends icssg_config_set_speed() and ICSSG_EMAC_PORT_FORWARD commands and
wakes the tx queues. Before this patch, that PHY stayed halted.

If both ports are down, emacs_initialized is 0 and the PRUs are not
running. Then icssg_set_port_state(ICSSG_EMAC_PORT_DISABLE) times out, the
code jumps to restart_phy, and both PHYs are started.

Wouldn't emac_adjust_link() then send R30 commands to the halted PRU cores,
which is the case this patch is meant to prevent?

On the next ifup, emac_ndo_open() calls phy_start() while the PHY is
already in PHY_UP, PHY_NOLINK or PHY_RUNNING. phy_start() then WARNs and
does nothing.

A CAP_NET_ADMIN user can hit this with "ip link set ethX master br0", or
by adding the port to an HSR/PRP master, while the other ICSSG port is
down.

Would it work to record which ports were running, or phy_is_started(),
before calling phy_stop(), and restart only those PHYs?

[Severity: Medium]

The commit message describes phy_stop() and phy_start() only as a way to
block emac_adjust_link() R30 commands. phy_stop() also does more than
that. It sets PHY_HALTED and runs _phy_state_machine() synchronously.
That path clears phydev->link, calls phy_link_down() and returns
PHY_STATE_WORK_SUSPEND, so the PHY gets suspended. phy_start() later
resumes it and restarts autoneg.

So does every bridge or HSR/PRP join or leave that reaches
prueth_emac_restart() now take the physical link down on both ports and
force a full renegotiation? The link partner and the bridge, STP or HSR
layer would see the carrier drop.

Should the commit message mention this?

This also seems to turn the forced resync in prueth_emac_common_start()
into a no-op on the restart path:

prueth_emac_common_start() {
	...
		emac->link = 0;

		mutex_lock(&emac->ndev->phydev->lock);
		emac_adjust_link(emac->ndev);
		mutex_unlock(&emac->ndev->phydev->lock);
	...
}

After phy_stop(), phydev->link is already 0. emac_adjust_link() sees no
state change, so speed and FORWARD programming waits until autoneg
finishes after phy_start().

> +
>  	/* Detach the net_device for both PRUeth ports*/
>  	if (netif_running(emac0->ndev))
>  		netif_device_detach(emac0->ndev);
> @@ -1847,20 +1855,20 @@ static int prueth_emac_restart(struct prueth *prueth)
>  	ret = icssg_set_port_state(emac0, ICSSG_EMAC_PORT_DISABLE);
>  	ret |= icssg_set_port_state(emac1, ICSSG_EMAC_PORT_DISABLE);
>  	if (ret)
> -		return ret;
> +		goto restart_phy;
>  
>  	/* Stop both pru cores for both PRUeth ports*/
>  	ret = prueth_emac_common_stop(prueth);
>  	if (ret) {
>  		dev_err(prueth->dev, "Failed to stop the firmwares");
> -		return ret;
> +		goto restart_phy;
>  	}
>  
>  	/* Start both pru cores for both PRUeth ports */
>  	ret = prueth_emac_common_start(prueth);
>  	if (ret) {
>  		dev_err(prueth->dev, "Failed to start the firmwares");
> -		return ret;
> +		goto restart_phy;
>  	}

[ ... ]

> @@ -1871,6 +1879,13 @@ static int prueth_emac_restart(struct prueth *prueth)
>  	netif_device_attach(emac0->ndev);
>  	netif_device_attach(emac1->ndev);
>  
> +restart_phy:
> +	/* Resume phylib now that the firmware is running again. */
> +	if (emac0->ndev->phydev)
> +		phy_start(emac0->ndev->phydev);
> +	if (emac1->ndev->phydev)
> +		phy_start(emac1->ndev->phydev);

[Severity: Medium]

Does this comment hold on the error paths? Say prueth_emac_common_stop()
succeeds and then prueth_emac_common_start() fails in icssg_config(),
prueth_emac_start() or icss_iep_init(). Its own unwind leaves the PRUs
stopped and classification disabled. The goto restart_phy still calls
phy_start() on both PHYs.

When the state machine runs again, emac_adjust_link() calls
icssg_config_set_speed() and icssg_set_port_state() against the halted
PRU. Each call polls for up to 10ms before it times out.

Isn't that the case the commit message says this patch fixes?

  "to prevent phylib from issuing R30 commands to the stopped PRU"

The label also comes after netif_device_attach(), so both netdevs stay
detached while phylib toggles carrier and tx queues on them. The netdevs
were already left detached on error before this patch.

Should phylib be restarted only after the firmware has actually come back
up?

> +
>  	return ret;
>  }
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112102140.2744508-1-m-malladi%40ti.com
