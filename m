Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917307;
	b=hlYpvvGePL0072OHyV2p0Jq147XyIpVZeKsljrVQXGiUhJl0Au++ePZpMgXUOe1SlOFg
	 SmDZc76a1CL/ktol46djTLRFSI8dFAEeyVJ2nYCtJpvc3X3OWz2JWdzKmuEIzlugvtTxR
	 8LSGUvHaY+Y8mHObKMnLMycqITZYm8qw8Ho6ASBdW+4OHsdWwIQH5oQoYxbnvtZ6OxZOV
	 WUV6Mz9O2hBTD2AmlqoRQOOFTo2U8qm6WBijMJDnKV77/QUDFj6ecV7Y8PeR2EKjuS7+7
	 Y50hHEyGiOMFNiBVCLPojTM30oaCpKo2j3Vrk4pva9FY1wk5BdvHJWp+AlECQQbVAQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917307;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=56OkhrGtrgZLgIxtH1MefuUDKlgxUJ+RKCBMt2Ztnt4=;
	b=O+2y1iCIHih+/K7uMMcewRT2qzKM5p3CQnFn7DwmHQLCY9Xb8yFfLu1bOVLmhKzI496O
	 uG5g4KVZSEyQN7obX+CjwVwUWKHGHbdTZcBYFBABkUXMGkqJpFCrQ4/GUf4PzwOtqjj1C
	 cYSQJejq5kD9Xgr6o2EP60IzWeGGAmAHkR92Y1HSShmVtQtpDi5MxL8Ml0nE3CiUJ4Vjb
	 8AVUY3rt+1S5wCOGigEL9gdV2lBNwdU2g6h7ZA9DNj+CJUrafFM3/YIB+TMu0yGZnqKuh
	 tQA+PRhzprXgm9Ifhh+xxxMi2WZZAHaUElXrHl2XHojHebQJvFg5e/LOkzUrADkzR3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8H75bw2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31223606A33A;
	Tue, 17 Nov 2026 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8H75bw2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7F61F000C4;
	Tue, 17 Nov 2026 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794917306;
	bh=56OkhrGtrgZLgIxtH1MefuUDKlgxUJ+RKCBMt2Ztnt4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=F8H75bw2K23ed5fTh2YEovfZCCoE4Bwb3o10F2V8Lkznkbkz4kgHIqT9BNxdJPmpN
	 gUHPsfe7ktO3deEyB2AndUcFsN3Bz381m95/n0Wlsa86O/GWUhnQ19m0MztvkpBlnC
	 sLvki6RVtq9NbmGNUT8ZYv6sBGUWwcacWGuQX3j+vYcZIEw1Y8pKaWcfadEvXf9vCk
	 TUDVU+4uEgVMC+6nwJWpyheorFKIGoYcjCxjv5YqCs1suxQbD7xuAt8T89yn17o/ni
	 bIQJfgV//tk3VQ9I1fNqmZ6gb9dS9XxiniEoyYPTR8A6XfgTqds09TqqfGqMXu9pY6
	 RQx9UoiISPZIA==
Subject: Re: [PATCH net v6 2/4] net: phy: keep the line of a postponed PHY
 interrupt balanced
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
Date: Tue, 17 Nov 2026 12:08:24 +0000
Message-ID: <179491730493.3136.3230057770418919660@kernel.org>
In-Reply-To: <20261113-b4-phylib-mac-pm-irq-v3-v6-2-05af2503cb23@iav.lv>
References: <20261113-b4-phylib-mac-pm-irq-v3-v6-2-05af2503cb23@iav.lv>
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

- [High] phy_free_interrupt() decides once, from irq_has_action() right
  after this PHY's free_irq(), whether irq_rerun still owns a unit of…
- [Medium] On a shared line, phy_free_interrupt() (drivers/net/phy/phy.c)
  keeps irq_rerun set and leaves the rebalance to resume.

--

net: phy: keep the line of a postponed PHY interrupt balanced

With this change, only the first postponed run of phy_interrupt() disables
the PHY interrupt line. phy_free_interrupt() now clears irq_rerun when
free_irq() leaves the line without users. It also adds irq_pm_lock to
serialize phy_free_interrupt() against the rerun after resume, and moves
the postpone/rerun logic into mdio_bus_phy_suspend_irq() and
mdio_bus_phy_resume_irq().

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 9af303d60bd6b..8e03c99fce8f5 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c

[ ... ]

> @@ -1430,8 +1430,11 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
>  				pm_wakeup_dev_event(parent, 0, true);
>  		}
>  
> -		phydev->irq_rerun = true;
> -		disable_irq_nosync(irq);
> +		/* Disable the line only once: an edge can rerun the thread. */
> +		if (!phydev->irq_rerun) {
> +			phydev->irq_rerun = true;
> +			disable_irq_nosync(irq);
> +		}
>  		return IRQ_HANDLED;
>  	}
>  
> @@ -1507,7 +1510,15 @@ EXPORT_SYMBOL(phy_request_interrupt);
>  void phy_free_interrupt(struct phy_device *phydev)
>  {
>  	phy_disable_interrupts(phydev);
> +
> +	mutex_lock(&phydev->irq_pm_lock);
>  	free_irq(phydev->irq, phydev);
> +	/* free_irq() shuts down a line left without users and the next request
> +	 * resets its depth; mdio_bus_phy_resume_irq() enables a shared line.
> +	 */
> +	if (!irq_has_action(phydev->irq))
> +		phydev->irq_rerun = false;
> +	mutex_unlock(&phydev->irq_pm_lock);
>  }

[Severity: High]

Can irq_rerun go stale on a shared line here?

Whether to keep irq_rerun is decided once, by irq_has_action() right after
this PHY's free_irq(). If another user is still on the line, irq_rerun
stays true.

When that remaining user frees the line later, __free_irq() shuts the line
down. The next request then goes through irq_startup(), which resets
desc->depth to 0. Nothing clears the first PHY's irq_rerun at that point.

Take two PHYs sharing one IRQF_SHARED line behind cpsw, which sets
mac_managed_pm. A later patch in this series brings those PHYs under
postponing:

  wakeup interrupt
    phy_interrupt(PHY0): irq_rerun0 = true, disable_irq_nosync()  depth 1
    phy_interrupt(PHY1): irq_rerun1 = true, disable_irq_nosync()  depth 2

  cpsw_suspend()->cpsw_ndo_stop()->phy_disconnect()
    phy_free_interrupt(PHY0): PHY1 still on line, irq_rerun0 stays true
    phy_free_interrupt(PHY1): line empty, shut down, irq_rerun1 = false

  cpsw_resume()->cpsw_ndo_open()->phy_request_interrupt()
    irq_startup() resets depth to 0, irq_rerun0 still true

  mdio_bus_phy_resume_irq(PHY0)
    enable_irq() at depth 0

Wouldn't this hit the "Unbalanced enable for IRQ" warning in
__enable_irq()? That is the symptom the commit message says is fixed.

The new guard in phy_interrupt() also seems to make a stale irq_rerun
worse. Between the line restart and the PHY's resume, a postponed
level-triggered interrupt now returns IRQ_HANDLED without being serviced
or masked:

		if (!phydev->irq_rerun) {
			phydev->irq_rerun = true;
			disable_irq_nosync(irq);
		}
		return IRQ_HANDLED;

The ONESHOT unmask would then keep firing it until that PHY resumes.
Before this patch, such an interrupt disabled the line again, and resume
balanced it.

There is also a race. irq_has_action() runs after free_irq() has dropped
desc->request_mutex, and irq_pm_lock is per phydev. So a request_irq() or
free_irq() by another driver on the same line can change the answer
between the two calls.

Would it be possible to tie irq_rerun to the lifetime of the line, rather
than to a snapshot taken at free time?

>  EXPORT_SYMBOL(phy_free_interrupt);
>  
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 1791d578f4dde..573eb234dc799 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -332,6 +332,38 @@ static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)

[ ... ]

> +/* Rerun interrupts which were postponed by phy_interrupt()
> + * because they occurred during the system sleep transition.
> + */
> +static __maybe_unused void mdio_bus_phy_resume_irq(struct phy_device *phydev)
> +{
> +	WRITE_ONCE(phydev->irq_suspended, false);
> +	if (!phy_interrupt_is_valid(phydev))
> +		return;

[Severity: Medium]

The new comment in phy_free_interrupt() says "mdio_bus_phy_resume_irq()
enables a shared line". Is that always true?

This early return comes before irq_rerun is checked.
phy_request_interrupt() sets phydev->irq to PHY_POLL in two failure cases:

drivers/net/phy/phy.c:phy_request_interrupt() {
	...
	if (err) {
		...
		phydev->irq = PHY_POLL;
	} else {
		if (phy_enable_interrupts(phydev)) {
			...
			phy_free_interrupt(phydev);
			phydev->irq = PHY_POLL;
		}
	}
}

Suppose a postponed interrupt took a disable on a shared line. Then
phy_free_interrupt() runs during the sleep window while another user stays
on the line, for example from cpsw_suspend() or stmmac_reset_subtask()
through phy_disconnect(). irq_rerun is still true at that point.

If the reopen then fails in one of these two ways, for instance because of
an MDIO error while the bus is down, phydev->irq becomes PHY_POLL. In the
second case, phy_free_interrupt() again keeps irq_rerun, because the other
user is still on the line.

mdio_bus_phy_resume_irq() then returns here without calling enable_irq().
Since phydev->irq is never set back to the old number, can anything ever
balance that disable? It looks like the other users of the shared line
would stay masked for good.

> +
> +	mutex_lock(&phydev->irq_pm_lock);
> +	synchronize_irq(phydev->irq);
> +	if (phydev->irq_rerun) {
> +		phydev->irq_rerun = false;
> +		enable_irq(phydev->irq);
> +		irq_wake_thread(phydev->irq, phydev);
> +	}
> +	mutex_unlock(&phydev->irq_pm_lock);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-b4-phylib-mac-pm-irq-v3-v6-0-05af2503cb23%40iav.lv
