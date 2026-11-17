Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906955;
	b=I0B1763LBYZggl0y0szvE/ljqS99orIUHjb6b3FR6/GMCrl4oWieq1WL8TUZpRekND1B
	 PhzzK6SAtLa9OSVAQtkCTIKP8vTzQeRRKrc2vY6bemMKLfMp+T0SCeL59siiwdGT9Z+rF
	 +Z9ILZljilCsCm5Nk+G490+qPbl4psYbGc3SwlcLoAjLNOp/+Cs3dZhLHp/ZFgs0PCuqF
	 ud9LfG+L54ULM6aJaUt6ASjd3yCeHW1V+xqS9qD9l69mg7NyAmOdxeckKhnDZ1b+JYDh5
	 lRmYPunzz9iyOmQa9oMLYUATCvkN0XyguKu2Y2jKnjEa6xWOqNZKCJBdLA0Httd0rEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906955;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0m8XnYVT9DjCg9I39JLr1uBTaZ2tfQtT3Fs85gKbuOE=;
	b=nLdXH1Hk6Yu4OO47NvlrtYapY+eCwlQWDD1CY8cGPzVA3Axua53OV7IbGGxOE5ct0XRD
	 vTuZjkk7Nig4bpKUISYo/zoP5i859EovK0h4XDqsy1gU+mWuDUARVKNFpV0LMMlM3x935
	 VTcSwv9lVdhpoEC+VGzb/HsS12FS79UYKZ9MAxqar/cLlSnrkaHem28VTg2Bv02VelVsY
	 Q8QeZDBGF2gWRvjWE2Z7K2W8+BjQmvlrPX/FS2kP/BaRBR0h2RRKUekA6zsbUtoXMwnM/
	 pbssVFYkuhcyVdJ8qsfHZRo8cUzjvrLlAVJ59Mqwb591JCwuVNehR68XUDs9/Vobgqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmFgFoqp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE8606A32F;
	Tue, 17 Nov 2026 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmFgFoqp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F28A1F000C7;
	Tue, 17 Nov 2026 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906955;
	bh=0m8XnYVT9DjCg9I39JLr1uBTaZ2tfQtT3Fs85gKbuOE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WmFgFoqpb77+UHTiRGgwU5eNNEv8FcJEOLy/ya6rFr2FaujsxbqFZ7NWeUlPIrNyt
	 0PVK83q6cUC08QLvsvZgdJX6FeCTBMv/czsgx981v57GSmFQAcjwyH9tL9zl0s3hoo
	 qLdMpE08LGJhEUYRUhcuKfJ//COdhToVEyYztSn0mlBiEoIpW9yndtVRIg3dd0qKNo
	 caLfoJxbrBLJeTefW7RJzkXIasnwNdy1JwIMiBft7mSuqGxllrsMcTBJUS7EVTpDpU
	 5qSJcYi60aIhUzOvh1NL65v+ZjYEs5VA6ieYx32geaFiT1x4RPvpFqW4rwTY8Lr/yX
	 DtlLHKg6QiGHQ==
Subject:
 Re: [PATCH net 3/4] net: phy: quiesce the state machine during MII resets
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 michael.chan@broadcom.com, hauke@hauke-m.de, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 09:15:54 +0000
Message-ID: <179490695420.3136.9645842823943433050@kernel.org>
In-Reply-To: <20261113-submit-phy-mii-reset-v1-v1-3-02a55f352a91@gmail.com>
References: <20261113-submit-phy-mii-reset-v1-v1-3-02a55f352a91@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch does not fully close the bug it describes.
- [Low] The commit message's only concrete symptom, "A statistics update
  in this window can interpret cleared hardware counters as a…
- [Low] The patch carries `Fixes: 00db8189d984` (the original 2005 phylib
  commit), so stable will select it for every maintained LTS branch.

--

net: phy: quiesce the state machine during MII resets

This commit sends Clause 22 BMCR_RESET writes from SIOCSMIIREG through a
new helper, phy_mii_ioctl_reset(). The helper disables and drains the PHY
state machine work and waits for BMCR_RESET to clear via phy_poll_reset().
It then calls phy_init_hw() and re-enables and triggers the state machine.

> phy_mii_ioctl() performs a BMCR reset write and calls phy_init_hw() while
> the PHY state machine remains active. The worker can access the PHY after
> reset but before the driver has restored its configuration and software
> state. A statistics update in this window can interpret cleared hardware
> counters as a wraparound.

[Severity: Low]
Which driver does the wraparound case refer to?

The worker only reaches driver statistics code through phy_update_stats()
in _phy_state_machine():

drivers/net/phy/phy.c:_phy_state_machine() {
    ...
	case PHY_NOLINK:
	case PHY_RUNNING:
		err = phy_check_link_status(phydev);
		func = &phy_check_link_status;

		if (!err)
			err = phy_update_stats(phydev);
		break;
    ...
}

The in-tree .update_stats callbacks either add read-clear counters to a
software total or assign absolute values:

  qcom_phy_update_stats():   hw_stats->rx_pkts += cnt;
  dp83tg720_update_stats():  priv->stats.tx_pkt_cnt += count;
  dp83td510_update_stats(), gpy_update_stats(),
  xway_gphy_update_stats(), kszphy_update_stats():  accumulate with +=
  lan8842_update_stats():    assigns absolute values

None of them keeps a previous snapshot or computes a delta. It doesn't look
like any of them can mistake a reset for a wrap.

The in-tree effects of the worker running mid-reset look different. One is
a spurious link down/up from reading BMSR during the reset. Another is
possible double counting if the reset clears a read-clear enable that
config_init() restores, for example qcom_phy_counter_config().

The ethtool statistics read path (ETHTOOL_GPHYSTATS) doesn't seem to be a
gap. It and SIOCSMIIREG are both serialized by RTNL or the netdev ops lock.

Could the commit message describe the actual in-tree failure, or name the
driver it refers to? The Fixes: tag will send this to all stable branches.

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 4ac72a1b4f427..5da8a699446c0 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -297,6 +297,30 @@ void phy_ethtool_ksettings_get(struct phy_device *phydev,
>  }
>  EXPORT_SYMBOL(phy_ethtool_ksettings_get);
>  
> +static int phy_mii_ioctl_reset(struct phy_device *phydev, u16 val)
> +{
> +	int ret;
> +
> +	/* Keep the worker out until the driver has restored its state. */
> +	disable_delayed_work_sync(&phydev->state_queue);

[Severity: Low]
Will this build on the stable trees that the Fixes: tag selects?

The patch carries Fixes: 00db8189d984, the original 2005 phylib commit. That
means it will be picked for every maintained stable branch.

disable_delayed_work_sync() and enable_delayed_work() were added in v6.10
by commit 86898fa6b8cd ("workqueue: Implement disable/enable for (delayed)
work items"). They don't exist in 6.6, 6.1, 5.15 or older trees.

Should there be a stable version limit such as "Cc: stable # 6.10+", a
note about the dependency, or a different quiescing approach for older
trees?

> +
> +	ret = phy_write(phydev, MII_BMCR, val);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = phy_poll_reset(phydev);
> +	if (ret)
> +		goto out;
> +
> +	phydev->autoneg = AUTONEG_ENABLE;
> +	ret = phy_init_hw(phydev);
> +out:
> +	if (enable_delayed_work(&phydev->state_queue))
> +		phy_trigger_machine(phydev);
> +
> +	return ret;
> +}
> +
>  /**
>   * phy_mii_ioctl - generic PHY MII ioctl interface
>   * @phydev: the phy_device struct
> @@ -349,6 +373,9 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
>  		} else {
>  			prtad = mii_data->phy_id;
>  			devad = mii_data->reg_num;
> +			if (prtad == phydev->mdio.addr &&
> +			    devad == MII_BMCR && val & BMCR_RESET)
> +				return phy_mii_ioctl_reset(phydev, val);
>  		}
>  
>  		if (mdio_phy_id_is_c45(mii_data->phy_id))

[Severity: Medium]
Can the old reset path at the end of the SIOCSMIIREG case still call
phy_init_hw() while the state machine is active?

The new early return only exists in the Clause 22 else branch. The old
check at the end of phy_mii_ioctl() is still there:

	if (prtad == phydev->mdio.addr &&
	    devad == MII_BMCR &&
	    val & BMCR_RESET)
		return phy_init_hw(phydev);

With a Clause 45 form phy_id, prtad and devad come from
mdio_phy_id_prtad() and mdio_phy_id_devad(). This path is taken when all of
the following hold:

  - prtad matches the attached PHY's address
  - the MMD is 0, which equals MII_BMCR
  - val_in has bit 15 set
  - the bus accepts the C45 write

phy_mii_ioctl()
    mdiobus_c45_write(...)
    case MII_BMCR: phydev->autoneg = AUTONEG_ENABLE;
    phy_init_hw(phydev)

None of disable_delayed_work_sync(), phy_poll_reset() or
phy_trigger_machine() runs on this path. phy_init_hw() can also do its own
BMCR reset through drv->soft_reset (for example genphy_soft_reset()) while
the worker is running.

For Clause 22 IDs the tail branch is now dead code. That leaves
phy_mii_ioctl() with two reset paths, one quiesced and one not. Could the
leftover branch be removed, or routed through phy_mii_ioctl_reset()?

The later patch in this series, "net: phy: reinitialize the PHY after an
MII reset", doesn't change phy.c. Its phylink_phy_write() returns early for
C45 IDs, so drivers that use phy_do_ioctl() without phylink still reach
this path.

Could the commit message also say that genuine Clause 45 resets
(MDIO_MMD_PMAPMD / MDIO_CTRL1 with MDIO_CTRL1_RESET) are out of scope? This
patch doesn't intercept them either.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91%40gmail.com
