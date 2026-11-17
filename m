Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917308;
	b=jCFEYWCSy6vvgTxuA9aHm88guyt5CEMFwvfyFqg3KmEcIDPG0jTnqER0lmJyOS2tVPba
	 XxtH45FQRdPmNDZl2JZo309+m8vEIreQQ/xmapD4967LKB/Wg8GvJFCk/awA6D9KUgc1L
	 61JYQJ87SUnt6PSrJGT8mHQ8609YuZzYB+5nyFPnaig9p+2wZ51U07V50ssraRqZGG3Ow
	 Ouw6rSMVrmvX1g59laqMS+jzfbcVC2nBjb7uVyja4IEJgdxVICd3xeX+BaD87QkulgwBI
	 9vRWqzca8PVYY3MkFZIa2CdzxZjmI2T/ZNpC7QPSpBwrd59+mljIUOLq4Lpb/eAaZkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917308;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bAWHAy9krkgBXlIJkxkcBl1dWt2HRR+GxtmxZjDrD8c=;
	b=Hwsi5Bli/GsajwkcsUYjLEJ+8Buz1eNa46tGGBDWLmBXr9KGAOJ3EoTLzAhjBTyg9Lky
	 4KxbhEkb08yTvp7KE33xnKfyn/ZXy1KEKCFEFRnfxqyGM0uYeWhzmee0P3Jzgox25K1ih
	 72QrcY3vvn/Gdb2A/lDyCNQDsglWDz5ix7uJiQbDeNH4o4w97SQcUKAP7mlIHYQVYhuay
	 5hilsAIPnYSniSHmL3IYL7CQccAJCObhVWK+gfce9go+IjfwPS4mm7KjtaPkDTlXQA53E
	 Vx5i8M/dWYQXX+gEF2Ju8N/80t9fit5wEsE7u03cYQ7Y5KxVl+vPnEeCiGKwMbXqELA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NXh54g7J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9351606A336;
	Tue, 17 Nov 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NXh54g7J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666BB1F000C4;
	Tue, 17 Nov 2026 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794917308;
	bh=bAWHAy9krkgBXlIJkxkcBl1dWt2HRR+GxtmxZjDrD8c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NXh54g7JfcvQcSqYFFTql6s+2Hq2EuhQ26zuRlAY/uyeaw20sxNkgmsR5KYsKxBkP
	 nkw2kAwTu7HMFmQj7eX63tFZpNeYEoP39M3QSCz2pt0xi5VA9bwvqCFt/Wh+pkDUho
	 Zz3sDzTL9LLxg3Z7cEmmcdrHoBpLuEnm7lggjG28TuCOwA1a4TYZjC0Qq5T4S3Y7PX
	 CPxJkUk/ALySgsLGxW94c/lNHgyhspvLt/3OBEu0nLkcKJVOcdjvPXJb0H51AcwTXr
	 VlXTfxJbqnwT815TvqX0i+d6xCMjiRmwsOWQ3zISc7w7nMGbolxN+7Vus2u+Q/wds+
	 IEOHP1ul31y0A==
Subject: Re: [PATCH net v6 4/4] net: phy: postpone PHY interrupts during sleep
 with MAC-managed PM
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com,
 wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev,
 florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com,
 shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 12:08:26 +0000
Message-ID: <179491730695.3136.5496741718229288871@kernel.org>
In-Reply-To: <20261113-b4-phylib-mac-pm-irq-v3-v6-4-05af2503cb23@iav.lv>
References: <20261113-b4-phylib-mac-pm-irq-v3-v6-4-05af2503cb23@iav.lv>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 4 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: phy: inverted PM IRQ ordering when consumer MAC links to
  PHY
- [Medium] PHY Wake-on-LAN can be lost for MAC-managed PHYs whose
  interrupt line is also their wake IRQ.
- [Medium] The postponed interrupt is lost for MAC-managed PHYs whose
  interrupt is a nested threaded IRQ (for example PHY INT routed through…
- [Medium] A shared IRQ line's disable depth can leak when a MAC-managed
  PHY's interrupt is re-requested from the MAC's resume callback.
- [Medium] net: phy: unbalanced enable_irq() in mdio_bus_phy_resume_irq()
  on shared IRQ

--

net: phy: postpone PHY interrupts during sleep with MAC-managed PM

This commit makes mdio_bus_phy_suspend() and mdio_bus_phy_resume() set
and clear irq_suspended for PHYs whose PM is managed by the MAC driver.
phy_interrupt() then postpones handling during the sleep transition
instead of touching a possibly powered-down MDIO bus. For MAC-managed
PHYs, the postponed interrupt no longer reports a wakeup event.

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 8e03c99fce8f5..ccf0658c4d101 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -1419,7 +1419,10 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
>  	if (IS_ENABLED(CONFIG_PM_SLEEP) && READ_ONCE(phydev->irq_suspended)) {
>  		struct net_device *netdev = phydev->attached_dev;
>  
> -		if (netdev) {
> +		/* With MAC-managed PM, a postponed interrupt cannot tell
> +		 * Wake-on-LAN from a link change the MAC causes.
> +		 */
> +		if (netdev && !phydev->mac_managed_pm) {
>  			struct device *parent = netdev->dev.parent;
>  
>  			if (netdev->ethtool->wol_enabled)

[Severity: Medium]
With this patch, a MAC-managed PHY gets irq_suspended set in
mdio_bus_phy_suspend() before the MAC's own suspend callback runs. Any
PHY interrupt from then until mdio_bus_phy_resume() takes this postponed
path. For mac_managed_pm no wakeup is reported, but the line is still
disabled:

		if (!phydev->irq_rerun) {
			phydev->irq_rerun = true;
			disable_irq_nosync(irq);
		}

Could this lose PHY Wake-on-LAN for the whole sleep on PHYs whose
interrupt line is also their wake IRQ? Both rtl8211f_probe() and
an8801r_probe() register phydev->irq as the wake IRQ:

		devm_pm_set_wake_irq(dev, phydev->irq);

In the noirq phase, suspend_device_irq() re-enables a disabled
wake-armed line only when the irqchip has
IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND:

kernel/irq/pm.c:suspend_device_irq() {
    ...
		if ((chipflags & IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND) &&
		     irqd_irq_disabled(irqd)) {
			...
			__enable_irq(desc);
    ...
}

On other irqchips the line would stay masked until resume. A later PME
or magic packet interrupt then could not wake the system.

One concrete case is stmmac with an RTL8211F and PHY WoL enabled. The
link partner changes the link after irq_suspended is set, but before
rtl8211f_suspend() switches INER to PME only:

	if (device_may_wakeup(&phydev->mdio.dev)) {
		ret = phy_write_paged(phydev, 0xa42, RTL821x_INER,
				      RTL8211F_INER_PME);

rtl8211f_suspend() then clears INTB. The software disable of the line
stays in place until mdio_bus_phy_resume_irq().

Before this patch, phy_interrupt() ran handle_interrupt() here and the
oneshot line was unmasked again. On boards whose MDIO bus stays
powered, WoL kept working in this case.

The phylink_speed_down() renegotiation in phylink_suspend() does not
appear to trigger this for RTL8211F or AN8801.
phylink_stop()->phy_stop()->phy_suspend() already restricts the
interrupt mask before that point. It would only matter for a wake IRQ
PHY that leaves link interrupts unmasked in suspend.

The commit message says the line "may then stay masked until resume, so
such a PHY may not wake the system from that sleep". It does not say
that any link event in this window disables WoL for the whole sleep
cycle.

The Helios64 WoL test also runs on gpio-rockchip, and
rockchip_irq_suspend() does this:

	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);

That unmasks wake pins in hardware whatever the software disable state
is. Would that test be able to show this regression?

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 39e232a3144a2..c043071784f5b 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -369,11 +369,14 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
>  	struct phy_device *phydev = to_phy_device(dev);
>  	int ret;
>  
> +	/* An interrupt can fire while the MAC has the MDIO bus powered
> +	 * down, whether or not the MAC manages PHY PM.
> +	 */
> +	mdio_bus_phy_suspend_irq(phydev);
> +
>  	if (phydev->mac_managed_pm)
>  		return 0;

[Severity: Medium]
For a MAC-managed PHY, irq_suspended is now set here, before the MAC's
suspend callback runs. cpsw and cpsw_new set mac_managed_pm, and they
also disconnect the PHY from that callback. cpsw_suspend() calls
cpsw_ndo_stop(), which ends in phy_disconnect(), and cpsw_resume()
connects the PHY again.

Can this leave a stale irq_rerun and an unbalanced enable_irq() on a
board where the two slave PHYs share one interrupt line?

phy_request_interrupt() uses IRQF_ONESHOT | IRQF_SHARED, so phy0 and
phy1 each have an action on the same irq_desc. If the line fires after
both mdio_bus_phy_suspend() calls, both threads run. Each
phy_interrupt() takes the postponed path, sets its own irq_rerun and
calls disable_irq_nosync(). The depth is then 2.

cpsw_suspend() then disconnects phy0. phy_free_interrupt() keeps
phy0->irq_rerun set, because phy1 still has an action on the line:

	if (!irq_has_action(phydev->irq))
		phydev->irq_rerun = false;

Disconnecting phy1 removes the last action. free_irq() shuts the line
down and phy1->irq_rerun is cleared, but phy0->irq_rerun stays true.

On resume, cpsw_resume() runs before mdio_bus_phy_resume() and calls
phy_request_interrupt() again. With no actions left on the line,
__setup_irq() calls irq_startup() and the depth goes back to 0.
mdio_bus_phy_resume_irq() for phy0 still sees irq_rerun:

	if (phydev->irq_rerun) {
		phydev->irq_rerun = false;
		enable_irq(phydev->irq);
		irq_wake_thread(phydev->irq, phydev);
	}

Wouldn't that enable_irq() hit the unbalanced enable WARN in
__enable_irq()?

The stale flag also matters before that point. Suppose the line fires
after cpsw_resume() has requested phy0's IRQ but before
mdio_bus_phy_resume(). phy_interrupt() for phy0 sees irq_rerun already
set and skips disable_irq_nosync(). It returns IRQ_HANDLED without
touching the PHY. If phy1 has not been reconnected yet, nothing masks a
level-triggered line, so the oneshot thread keeps being woken.

MAC-managed PHYs could not get here before, because irq_suspended was
never set for them. Should phy_free_interrupt() undo this PHY's own
disable_irq_nosync() whenever irq_rerun is set, instead of basing the
cleanup on irq_has_action()?

[Severity: Medium]
For MAC-managed PHYs, irq_suspended is now set here and cleared only in
mdio_bus_phy_resume(). That runs after the MAC's resume callback, so
the flag is still true while the MAC resumes.

ravb and sh_eth set mac_managed_pm. They call phy_disconnect() in
suspend and of_phy_connect() in resume. So the PHY IRQ is requested
again while irq_suspended is true:

ravb_resume()->ravb_open()->...->phy_request_interrupt()

Can this leave a shared IRQ line disabled?

On an IRQF_SHARED line, the other device can interrupt after
request_threaded_irq(). phy_interrupt() then takes the postponed path,
sets irq_rerun and calls disable_irq_nosync(). Suppose
phy_enable_interrupts() then fails:

drivers/net/phy/phy.c:phy_request_interrupt() {
    ...
		if (phy_enable_interrupts(phydev)) {
			phydev_warn(phydev, "Can't enable interrupt, falling back to polling\n");
			phy_free_interrupt(phydev);
			phydev->irq = PHY_POLL;
		}
    ...
}

phy_free_interrupt() clears irq_rerun only when the line has no other
actions left. On a shared line it still has one:

	if (!irq_has_action(phydev->irq))
		phydev->irq_rerun = false;

mdio_bus_phy_resume_irq() then returns early because the IRQ is now
PHY_POLL:

	WRITE_ONCE(phydev->irq_suspended, false);
	if (!phy_interrupt_is_valid(phydev))
		return;

The matching enable_irq() never runs. Wouldn't the other device on that
line stop getting interrupts, with irq_rerun left stale?

MAC-managed PHYs could not reach this path before, because irq_suspended
was never set for them.

>  
> -	mdio_bus_phy_suspend_irq(phydev);
> -
>  	/* We must stop the state machine manually, otherwise it stops out of
>  	 * control, possibly with the phydev->lock held. Upon resume, netdev
>  	 * may call phy routines that try to grab the same lock, and that may

[ ... ]

> @@ -406,8 +409,10 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
>  	struct phy_device *phydev = to_phy_device(dev);
>  	int ret;
>  
> -	if (phydev->mac_managed_pm)
> +	if (phydev->mac_managed_pm) {
> +		mdio_bus_phy_resume_irq(phydev);
>  		return 0;
> +	}

[Severity: High]
The ordering argument in the commit message needs the MAC to be the
MDIO bus parent or one of its ancestors. That does not hold when the
PHY sits on an MDIO bus owned by another device. In that case
phy_attach_direct() calls device_link_add() with dev->dev.parent as
consumer and &phydev->mdio.dev as supplier.

device_link_add() moves the consumer to the tail of dpm_list. The MAC
then suspends before mdio_bus_phy_suspend() and resumes after
mdio_bus_phy_resume(). Examples are two FEC instances with
FEC_QUIRK_SINGLE_MDIO, dual stmmac or macb sharing one MDIO bus, and
MACs behind an mdio-mux.

On resume, mdio_bus_phy_resume() for such a PHY clears irq_suspended
and replays the postponed interrupt before the consumer's resume
callback has run. handle_interrupt() then reads the PHY before
fec_resume() has re-enabled fep->reg_phy and fep->clk_enet_out. It
also runs before phy_resume() has turned the PHY driver's own clock
back on, as rtl821x_resume() does with priv->clk. Interrupts after this
point are not postponed either.

If that MDIO access fails, the handler calls phy_error() and the state
becomes PHY_ERROR. phy_start() from the MAC's resume only accepts
PHY_READY or PHY_HALTED, so it hits its WARN and returns without
starting the PHY. The link then stays down after resume.

If the access succeeds, phydev->state is still PHY_HALTED.
phy_trigger_machine() then queues a state machine run that takes the
PHY_STATE_WORK_SUSPEND path and calls phy_suspend() outside
phydev->lock. Can that race with the MAC's later
phy_start()->__phy_resume()?

The suspend side is not covered for this topology either. The
consumer's suspend callback runs before mdio_bus_phy_suspend() sets
irq_suspended. That callback may call phy_stop(), call
phylink_speed_down() as stmmac_suspend() does, or gate clocks and
regulators as fec_suspend() does. A link-down interrupt caused there
still runs the handler directly.

So for these PHYs the patch only moves the handler from
resume_device_irqs() to mdio_bus_phy_resume(), still ahead of the MAC.
Should the replay for a PHY with phydev->devlink wait until the
consumer has resumed? Or should the commit message say that this
topology is not covered?

[Severity: Medium]
For a MAC-managed PHY, this replay now runs without a phy_init_hw() call
before it:

	if (phydev->irq_rerun) {
		phydev->irq_rerun = false;
		enable_irq(phydev->irq);
		irq_wake_thread(phydev->irq, phydev);
	}

Is the postponed interrupt lost when the PHY interrupt is a nested
threaded IRQ? One example is a PHY INT routed through an I2C or SPI GPIO
expander such as pca953x.

For a nested IRQ, __setup_irq() creates no thread. irq_wake_thread()
only wakes a thread that exists:

kernel/irq/manage.c:irq_wake_thread() {
    ...
		if (action->dev_id == dev_id) {
			if (action->thread)
				__irq_wake_thread(desc, action);
			break;
		}
    ...
}

The postponed path in phy_interrupt() disabled the line without reading
the PHY's interrupt status. Getting there only takes the MAC's suspend
stopping the PHY and the link going down, as the commit message
describes.

After resume, nothing reads the latched status (for example RTL8211F
INSR), so INT stays asserted. An edge-triggered expander input would
then never see a new edge.

For non-MAC-managed PHYs this is hidden: mdio_bus_phy_resume() calls
phy_init_hw()->config_intr() before the replay. stmmac_resume() does not
call phy_init_hw(), while fec_resume() does.

The state machine is in interrupt mode and does not poll. On such stmmac
boards, could link up go unreported after resume, leaving the network
down until the interface is reinitialised?

>  
>  	if (!phydev->suspended_by_mdio_bus)
>  		goto no_resume;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-b4-phylib-mac-pm-irq-v3-v6-0-05af2503cb23%40iav.lv
