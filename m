Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906956;
	b=J6iWe0QaZZuxyDdud6dJreQArn4zz6Q2NRR3MRUWMUyJ38rvrD5UUTYpxJnajB5Wqdix
	 JQjrTl7oXINd2A/cpmJCBcJfvI7dzQsX1Iq1h7yYDNsvJnmFsho3lFuA78qtitfyO2Elq
	 tr9k3iFnd5J/qiIxFouTM8ZmaU/j1IL8vQTyaVOzXOIzyl/LJYxLOmTBIkcmTEliqi3hd
	 LDp92MJuCFYa5NQmPhBcmxa/20dw1iZtbDtpZiyJrMNU3SfX4zh/v4HqpekTZAiGPcaTt
	 6FsewP8N9hxJXn0Pe3zb/AyRZH42odZE97ZEJJ2IWOnqJbWcpU/ywv15ZnE01wpl5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906956;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Orab/TU7x//tl8WYikKDAEUliLfJS1G9bxffaYSsnrU=;
	b=yyKhRuDsIhV5qaZOfb7NwEMvnEEEYb+ASg71bcxZmMQ1T3z5jWsUCJfdLg0pe3cozZef
	 KBZp4nZTeq2qNk5To8w/OgfuIf1cAaczMaqmhDWgeS2Mfw21T6eurLo1GrzDhrdgYWFWd
	 Oig8amWzMSITwhDMQhocWRZOLYDgdPXBbA9O7S067Tq9iqyMYjdPkJDPXqJ5PKikky/Fs
	 Yji55j1v/noUpuLKZls+7yaXpME+nOwf4wgWy+C2Q9OtDG4Huyj6YfXib0BvSvCa9jkWu
	 UHRrna6I6RcEgNqO/YJg1Eabi6TZgZIo0GDbzrUBFe41r1Os/wyjDqToAVhhTJTpmWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxnCamND;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC328606A31C;
	Tue, 17 Nov 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxnCamND
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76EF1F000C8;
	Tue, 17 Nov 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906956;
	bh=Orab/TU7x//tl8WYikKDAEUliLfJS1G9bxffaYSsnrU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DxnCamNDnJqVjWQKvgZ9/K/syOKQu775Fw6++8/+st9UaW3rh4g6NRxuGiTZu07mI
	 3CttRuAqQg4EYvQ4y4qIZHYQtPK5i4OSy64/NoL4/dfGcPQMkOX6L7dMNMduQgM8sP
	 2JsCVUaPXVq53vms792tbE0d4pRVEBJDyJkpDYMfv1zWw2iBB1kcGRTckyVKz8FEf1
	 vcuk58U9ejyBCQwswkXAbcA9HEt+jtuCTuZ9/HekkugJ2XbVrqB1cfeSLEeMJU+Qfd
	 xbWdqY8an/IigmvgMUYQJl3gjAOB+Lqv30VKwPqvcM9wmuBtePDy60kNTk4GkbfF0B
	 N0+zipCAbqrFQ==
Subject:
 Re: [PATCH net 4/4] net: phylink: reinitialize the PHY after an MII reset
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 michael.chan@broadcom.com, hauke@hauke-m.de, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 09:15:55 +0000
Message-ID: <179490695546.3136.9741825606101086256@kernel.org>
In-Reply-To: <20261113-submit-phy-mii-reset-v1-v1-4-02a55f352a91@gmail.com>
References: <20261113-submit-phy-mii-reset-v1-v1-4-02a55f352a91@gmail.com>
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

- [High] phylink_phy_write() (drivers/net/phy/phylink.c:3614-3616) now
  sends a BMCR reset of the attached C22 PHY to phy_mii_ioctl() ->…
- [Medium] phylink chooses the PHY's in-band AN mode (pl->phy_ib_mode:
  disable/enable/bypass) and programs it only in phylink_major_config()…
- [Medium] Through phylink, the BMCR reset now goes to
  phy_mii_ioctl_reset() (drivers/net/phy/phy.c:300-322).

--

net: phylink: reinitialize the PHY after an MII reset

This patch changes phylink_phy_write() to send BMCR reset writes for the
attached Clause 22 PHY to phy_mii_ioctl(). The phylib reset handling then
runs in place of a raw mdiobus_write(). All other register writes still
use raw MDIO access.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e885da1c28311..2f0e3a30615c8 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -3608,6 +3611,10 @@ static int phylink_phy_write(struct phylink *pl, unsigned int phy_id,
>  					 reg, val);
>  	}
>  
> +	if (phy_id == phydev->mdio.addr && reg == MII_BMCR &&
> +	    (val & BMCR_RESET))
> +		return phy_mii_ioctl(phydev, ifr, SIOCSMIIREG);

[Severity: High]
Does this path ever write the advertisement back to the PHY after the reset?

phy_mii_ioctl() passes this to phy_mii_ioctl_reset(), which does:

drivers/net/phy/phy.c:phy_mii_ioctl_reset() {
    ...
	phydev->autoneg = AUTONEG_ENABLE;
	ret = phy_init_hw(phydev);
out:
	if (enable_delayed_work(&phydev->state_queue))
		phy_trigger_machine(phydev);
    ...
}

phy_init_hw() runs soft_reset, the fixups, config_init, config_intr and
the autonomous EEE disable. It does not call config_aneg or
phy_start_aneg().

phydev->state also stays PHY_RUNNING or PHY_NOLINK. In those states,
_phy_state_machine() only calls phy_check_link_status().
_phy_start_aneg() only runs from PHY_UP or after a cable test.

So after the reset, MII_ADVERTISE, MII_CTRL1000 and the EEE advertisement
seem to stay at their hardware defaults. phydev->advertising still holds
the MAC-limited mask that phylink_bringup_phy() set up:

	linkmode_copy(phy->advertising, config.advertising);

Take a 10/100-only MAC with a gigabit PHY as an example:

  - After the reset, the PHY advertises 1000baseT again and can link at
    1000.
  - genphy_read_status() works out the speed from the stale
    phydev->advertising and lp_advertising, and reports 100.
  - phylink calls mac_link_up() at 100 while the PHY runs at 1000.

The commit message says:

    The PHY worker continues using the old software state.

After this change, isn't that still true for the advertisement registers?

phy_mii_ioctl_reset() was added earlier in this series, and this patch
relies on it to resynchronize the state. Should phy_init_hw() be followed
by phy_start_aneg() (or config_aneg) on this path?

[Severity: Medium]
Is the PHY in-band AN mode that phylink chose lost here?

phylink only programs pl->phy_ib_mode in phylink_major_config():

	err = phy_config_inband(pl->phydev, pl->phy_ib_mode);

phy_init_hw() never calls drv->config_inband. After this return, phylink
also does not set force_major_config or requeue pl->resolve.

The config_init callbacks don't seem to reapply the in-band mode either.
For example, m88e1111_config_inband() writes
MII_M1111_HWCFG_SERIAL_AN_BYPASS and the fibre page BMCR_ANENABLE:

	err = phy_modify(phydev, MII_M1111_PHY_EXT_SR,
			 MII_M1111_HWCFG_SERIAL_AN_BYPASS, extsr);
	...
	return phy_modify_paged(phydev, MII_MARVELL_FIBER_PAGE, MII_BMCR,
				BMCR_ANENABLE, bmcr);

m88e1111_config_init() does not touch those bits. In the same way,
rtl822xb_config_init() leaves RTL822X_VND1_SERDES_ADDR_AUTONEG alone.

Whether a soft reset actually clears these SerDes bits depends on the
PHY. If it does, the PHY's in-band mode no longer matches the pcs_neg_mode
that phylink configured. The copper side can then report link up while
the SGMII or 1000BASE-X link to the MAC is down.

The other phylink paths that run phy_init_hw() (attach or resume, then
phylink_start()) all reach phylink_major_config() afterwards. Should the
reset path also ask phylink to redo the major config?

[Severity: Medium]
Can the reset and phy_init_hw() run at the same time as pl->resolve or
the PHY interrupt thread?

phy_mii_ioctl_reset() only quiesces phydev->state_queue:

	disable_delayed_work_sync(&phydev->state_queue);

	ret = phy_write(phydev, MII_BMCR, val);

After that, the reset, phy_poll_reset() and phy_init_hw() all run under
RTNL without phydev->lock.

phylink_resolve() runs from a workqueue without RTNL. It takes phy->lock.
When the interface changes, it calls
phylink_major_config()->phy_config_inband(), which writes PHY registers:

	mutex_lock(&pl->phydev_mutex);
	phy = pl->phydev;
	if (phy)
		mutex_lock(&phy->lock);
	...
		phylink_major_config(pl, false, &link_state);

The threaded IRQ handler is also serialized only by phydev->lock:

drivers/net/phy/phy.c:phy_interrupt() {
    ...
	mutex_lock(&phydev->lock);
	ret = phydev->drv->handle_interrupt(phydev);
	mutex_unlock(&phydev->lock);
    ...
}

Suppose phylink_phy_change() queued a resolve just before the ioctl, for
example after an SGMII to 2500BASE-X switch on an RTL822x. Could the
config_inband writes interleave with the config_init sequence and leave
the PHY partly configured?

Before this patch, phylink's raw reset never ran phy_init_hw(), so
phylink users did not have this overlap. On the resume path,
phylink_stop() and phylink_suspend() disable and flush pl->resolve before
phy_init_hw() runs.

The commit message says phy_mii_ioctl() "quiesces the PHY worker across
reset completion and driver initialization". For phylink devices, isn't
that only true of phydev->state_queue?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91%40gmail.com
