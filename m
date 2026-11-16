Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837781;
	b=fuefPXTBVGvtjk18Ekq600Hwxrdu4YolnVDhOP477M0yFM0qB6Mt1C7iFARzGVXcDlVU
	 U4VgZeIdwRbgFYqDDUvcl2auFW+A3z9aznfY7YyarGmzh1vfqOTHbqjt/eOrFTi/54WGK
	 9sLqHSTvGs8iItEG2/6zpEnmyPUo2vL2aPcIJ+BkTLffnFKKUc7r5Wt/2IYtILIPGYbRd
	 jNaq0Hz3MZdZgZinjNT52vvH40dgsm5hnsDUCw9opLct7wwEl3W0wpeYqVECHj0uAD0M1
	 eAX1C+iDWPNoVWx+ffMdJBBIGhzg2T4PPa+M/hZsJZIl+soc4tUPxN5yMLchcAI4r7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837781;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=cq6C85nzMOCVD9RUFqpVZVZ4ydyduqUTyhszrHHjH8w=;
	b=t7DzXhXmFvYhubuGaaAgr3dM+n0c3PurWJDaiu2BLyubmexX3OtCqTTEWwNaYF0jXtxy
	 u8dFH23swW+Ln3V0ALFk1vA8GhrDwJoLKuljZJ+0UXENM63FJ5bbCciKBxba8S7hlMCt+
	 udq2YG1JpgP52jth953aWy7nAR2rGPe7i7L2M20qu3m2Ix77NMkNkPc0M/2j39oFW1Wea
	 dsH3PWM128Vx3kHLBLw8qISRuQfgKTDaP6kqdQ2S7rOQhbnbTxgC7j3A360Glp9BBFefl
	 rP13PLcdngO0ihPVayLAAR2JxCw3Vy5r6Xw5HS8JKRpp5tX0rUs/0ZuzriGmTUAys2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=H2Gy2DDZ;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B19606A32A;
	Mon, 16 Nov 2026 14:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B19606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=H2Gy2DDZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794837780; x=1826373780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r89a9phg2PmIZeV6rJGpD0UdhhNupMsuPVFwWdMmR4g=;
  b=H2Gy2DDZWr5KVYlswGLt4u7y6/Klp/UgM8q/hrlhA7UcQusMkiuqAhUT
   JvPsi86VgeVIDMMR2L4OeI8tNveReCossrrdKERuSXSgVa6wMaoAhZFim
   /cSvt9komGeoSyo1Tw8G1gcDDNOdvLtM+p3Nqoc+bJuAcxm9VqcY/yHzY
   r07fEwffiifESXCEgLKS4wWiugX3c7ZLAa3UnFdAYXHN/K8ZEJuMT/Mdo
   4uMIJSQEIKkWsj4uFEYqDmWUwKF59GkwAOLPe2FORzA0hyxrfQSduvVsJ
   xSVoW9Ot3c+B/585db1tW60MOzAZ73YP7T8V3UujdXIdo+JyaUe983g3N
   A==;
X-CSE-ConnectionGUID: dmad7ia3SHimmztP85R43w==
X-CSE-MsgGUID: fc0Le7fGTmqaQHz5F14IQA==
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="233622650"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Nov 2026 07:02:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 16 Nov 2026 07:02:58 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 16 Nov 2026 07:02:56 -0700
Date: Mon, 16 Nov 2026 15:02:55 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <UNGLinuxDriver@microchip.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 3/4] net: lan969x: configure the core PLL
Message-ID: <20261116140255.aap65thluxeaia6v@DEN-DL-M70577>
References: <20261113-lan969x-core-skew-v1-3-b9b02b863d38@microchip.com>
 <179483535329.3136.8847960801289420948@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179483535329.3136.8847960801289420948@kernel.org>

> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 5
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In lan969x_init_core_pll() the new DIVFI/DIVFF (FREQ_CFG, line
>   514) and DIVQ/DIVR/REF_CLK_SEL/FILTER_RANGE (line 523) values are…
> - [Low] The commit fixes a bug that users can see on every lan969x board,
>   but it has no Fixes: tag.
> - [Low] In lan969x_init_core_pll()
>   (drivers/net/ethernet/microchip/sparx5/sparx5_main.c, lines 506-512),…
> - [Low] The patch makes a core PLL failure abort the whole switch probe
>   on lan969x, and the commit message does not say so.
> - [Low] In lan969x_init_core_pll() (lines 520-531), the comment says the
>   CORE_PLL_CFG write will "select the reference clock from the strapping…
> - [Low] The LOCK_STAT check in lan969x_init_core_pll() (lines 561-569)
>   may pass without proving anything.
> 
> --
> 
> net: lan969x: configure the core PLL
> 
> This commit programs the lan969x core PLL to a rate about 200 ppm above
> 328.125 MHz. That is the rate the PTP TOD increment in
> sparx5_ptp_get_nominal_value() already assumes. The dividers and the TOD
> increment are chosen from the reference clock strapping (25 MHz or 39 MHz),
> and the divider change uses the NEWDIV/DIVACK handshake in CORE_PLL_CFG.
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> > index 93a7cb89493c4..244974ffe496b 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> > @@ -474,10 +474,120 @@ static int sparx5_init_switchcore(struct sparx5 *sparx5)
> 
> [ ... ]
> 
> > +static int lan969x_init_core_pll(struct sparx5 *sparx5)
> > +{
> > +	const struct lan969x_core_pll_dividers *div;
> > +	u32 hw_stat, pll_cfg, freq_cfg;
> > +	enum sparx5_core_clockref ref;
> > +	int err;
> > +
> > +	hw_stat = spx5_rd(sparx5, CHIP_TOP_HW_STAT);
> > +	ref = CHIP_TOP_HW_STAT_REFCLK_SEL_GET(hw_stat) ?
> > +		SPX5_CORE_CLOCK_REF_39MHZ : SPX5_CORE_CLOCK_REF_25MHZ;
> > +	div = &lan969x_core_pll_328mhz[ref];
> > +	sparx5->coreclockref = ref;
> > +
> > +	/* Already configured by an earlier probe? */
> > +	pll_cfg = spx5_rd(sparx5, CHIP_TOP_CORE_PLL_CFG);
> > +	freq_cfg = spx5_rd(sparx5, CHIP_TOP_CORE_PLL_FREQ_CFG);
> > +	if (CHIP_TOP_CORE_PLL_CFG_ENA_CFG_GET(pll_cfg) &&
> > +	    CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI_GET(freq_cfg) == div->divfi &&
> > +	    CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF_GET(freq_cfg) == div->divff)
> > +		return 0;
> 
> [Severity: Low]
> Is this check strict enough to conclude that the PLL already runs at the
> skewed rate?
> 
> It checks only ENA_CFG, DIVFI and DIVFF. The function also programs DIVR,
> DIVQ, REF_CLK_SEL and FILTER_RANGE, and it depends on the NEWDIV/DIVACK
> handshake and on LOCK_STAT. None of those are checked before the early
> return.
> 
> sparx5->coreclockref is set just above. That means
> sparx5_ptp_get_nominal_value() always picks the skewed TOD increment for
> the detected reference, whether or not the PLL produces that rate.
> 
> The err_disable path clears ENA_CFG, so a completed run of this driver
> should not leave such a state behind. There are two other ways it could
> happen. A bootloader or firmware could set ENA_CFG with these DIVFI/DIVFF
> values but different DIVR/DIVQ/REF_CLK_SEL. Or a probe could be interrupted
> between the ENA_CFG=1 write and the end of the lock poll, since CHIP_TOP
> state persists across unbind/bind.
> 
> In either case the reprogramming and the checks are skipped without a
> message. Would it make sense to also compare DIVR, DIVQ and REF_CLK_SEL,
> and to check LOCK_STAT and that NEWDIV is clear?
> 
> > +
> > +	spx5_rmw(CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI_SET(div->divfi) |
> > +		 CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF_SET(div->divff),
> > +		 CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFI |
> > +		 CHIP_TOP_CORE_PLL_FREQ_CFG_DIVFF,
> > +		 sparx5, CHIP_TOP_CORE_PLL_FREQ_CFG);
> > +
> > +	/* Set the reference and output dividers, select the reference clock
> > +	 * from the strapping pin and use fractional mode.
> > +	 */
> > +	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_DIVQ_SET(div->divq) |
> > +		 CHIP_TOP_CORE_PLL_CFG_DIVR_SET(div->divr) |
> > +		 CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL_SET(0) |
> > +		 CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE_SET(0),
> > +		 CHIP_TOP_CORE_PLL_CFG_DIVQ |
> > +		 CHIP_TOP_CORE_PLL_CFG_DIVR |
> > +		 CHIP_TOP_CORE_PLL_CFG_REF_CLK_SEL |
> > +		 CHIP_TOP_CORE_PLL_CFG_FILTER_RANGE,
> > +		 sparx5, CHIP_TOP_CORE_PLL_CFG);
> 
> [Severity: Low]
> Which write here selects fractional mode?
> 
> This rmw touches only DIVQ, DIVR, REF_CLK_SEL (written as 0) and
> FILTER_RANGE (written as 0). In sparx5_main_regs.h, neither
> CHIP_TOP_CORE_PLL_CFG nor CHIP_TOP_CORE_PLL_FREQ_CFG defines a fractional
> mode or DSM enable field. The only extra setting is FILTER_RANGE, and the
> comment does not mention it.
> 
> Is the comment just inaccurate, or is a fractional enable missing? Both TOD
> increments in sparx5_ptp_get_nominal_value() depend on DIVFF taking
> effect. With only the integer part, the core clock would be about 325 MHz
> instead of about 328.19 MHz.
> 
> > +
> > +	/* Switch the PLL from its reset defaults to the register settings */
> > +	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_ENA_CFG_SET(1),
> > +		 CHIP_TOP_CORE_PLL_CFG_ENA_CFG,
> > +		 sparx5, CHIP_TOP_CORE_PLL_CFG);
> > +
> > +	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_NEWDIV_SET(1),
> > +		 CHIP_TOP_CORE_PLL_CFG_NEWDIV,
> > +		 sparx5, CHIP_TOP_CORE_PLL_CFG);
> 
> [Severity: Medium]
> Does the switch from reset defaults to the register settings happen at the
> ENA_CFG write, before the NEWDIV/DIVACK handshake starts?
> 
> If the comment above is accurate, the PLL takes the new DIVFI/DIVFF, DIVR,
> DIVQ and REF_CLK_SEL values at the ENA_CFG=1 write. The commit message
> describes the handshake as "the glitch free divider change documented for
> CORE_PLL_CFG", but this switch happens outside it. The handshake would then
> cover only what NEWDIV latches afterwards.
> 
> The core clock also changes after sparx5_init_switchcore() has already done
> the EACL force init, RAM init and counter reset:
> 
> mchp_sparx5_probe()
>     sparx5_init_switchcore()
>     sparx5_init_coreclock()
>         lan969x_init_core_pll()
> 
> The reset controller is optional. A core left enabled by a bootloader could
> still be running while its clock source changes.
> 
> The err_disable path raises the same question in reverse. Clearing ENA_CFG
> there goes back to the reset defaults without a handshake, and the function
> returns without waiting for relock.
> 
> Could the ENA_CFG versus NEWDIV ordering be checked against the CORE_PLL_CFG
> datasheet?

This is the frequency change procedure described in the datasheet for
CORE_PLL_CFG, and the patch follows it step by step.

On the first probe the switch comes out of reset with the queue system
disabled, and patch 2/4 keeps it that way until the core clock is set
up. On a rebind the PLL is already configured and is left alone.

The err_disable path only runs if the PLL never acknowledges the change
or never locks. Probe then fails, and the next probe redoes the change
and waits for lock. Waiting for relock on the error path would not buy
anything.

> 
> > +
> > +	err = read_poll_timeout(spx5_rd,
> 
> [ ... ]
> 
> > +	/* LOCK_STAT resets to 1, so sleep before the first read */
> > +	err = read_poll_timeout(spx5_rd,
> > +				pll_cfg,
> > +				CHIP_TOP_CORE_PLL_CFG_LOCK_STAT_GET(pll_cfg),
> > +				100,
> > +				10000,
> > +				true,
> > +				sparx5,
> > +				CHIP_TOP_CORE_PLL_CFG);
> 
> [Severity: Low]
> Can this poll confirm that the PLL relocked?
> 
> According to the comment, LOCK_STAT already reads 1 before the change. With
> sleep_us = 100 and sleep_before_read = true, poll_timeout_us() in
> include/linux/iopoll.h does:
> 
> 	if ((sleep_before_op) && __sleep_us) \
> 		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
> 
> So the first read can happen only about 26 us after NEWDIV is cleared. If
> the DIVACK poll succeeded on its first read, which has no sleep, that is
> also very soon after the ENA_CFG/NEWDIV writes.
> 
> If the lock detector has not deasserted by then, the first read returns 1.
> The function then reports success whether or not the PLL has settled.
> 
> Is this delay based on a documented minimum lock detector response time?
> Could the poll instead wait for LOCK_STAT to drop and then come back?
> 
> > +	if (err) {
> > +		dev_err(sparx5->dev, "Failed to lock the core PLL\n");
> > +		goto err_disable;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_disable:
> > +	/* Make the next probe redo the change */
> > +	spx5_rmw(CHIP_TOP_CORE_PLL_CFG_ENA_CFG_SET(0),
> > +		 CHIP_TOP_CORE_PLL_CFG_ENA_CFG,
> > +		 sparx5, CHIP_TOP_CORE_PLL_CFG);
> > +
> > +	return err;
> > +}
> 
> [ ... ]
> 
> > @@ -573,6 +683,15 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
> >  			 CLKGEN_LCPLL1_CORE_CLK_CFG_CORE_CLK_ENA,
> >  			 sparx5, CLKGEN_LCPLL1_CORE_CLK_CFG);
> >  	} else {
> > +		if (freq != SPX5_CORE_CLOCK_328MHZ) {
> > +			dev_err(sparx5->dev,
> > +				"%d coreclock not supported\n",
> > +				freq);
> > +			return -EINVAL;
> > +		}
> > +		err = lan969x_init_core_pll(sparx5);
> > +		if (err)
> > +			return err;
> 
> [Severity: Low]
> Before this patch, the lan969x branch of sparx5_init_coreclock() could not
> fail for a supported target. Now a DIVACK or LOCK_STAT timeout makes the
> whole switch probe fail:
> 
> mchp_sparx5_probe()
>     sparx5_init_coreclock()
>         lan969x_init_core_pll()
>             read_poll_timeout() returns -ETIMEDOUT
>             goto err_disable
>     dev_err(sparx5->dev, "LC-PLL initialization error\n");
>     goto cleanup_config;
> 
> The commit message says:
> 
>     Leave the PLL alone if it is already
>     configured, and disable the register configuration again if the change
>     fails.
> 
> That reads like a fallback to the default clock. In fact the PLL is
> reverted and the device no longer probes. A board that used to probe and
> forward traffic, with the 200 ppm skew, would end up with no networking.
> 
> Is the probe failure intended? If so, could the commit message say so?
> 
> >  		pol_upd_int = 820; // SPX5_CORE_CLOCK_328MHZ
> >  	}
> 
> [ ... ]
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> > index 9f61692b243b7..544e9513a9a53 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
> > @@ -62,7 +62,10 @@ static u64 sparx5_ptp_get_nominal_value(struct sparx5 *sparx5)
> >  		res = 0x1FF0000000000000;
> >  		break;
> >  	case SPX5_CORE_CLOCK_328MHZ:
> > -		res = 0x18604697DD0F9B5B;
> > +		if (sparx5->coreclockref == SPX5_CORE_CLOCK_REF_25MHZ)
> > +			res = 0x186044FEF1EA9C10;
> > +		else
> > +			res = 0x18604697DD0F9B5B;
> >  		break;
> 
> [Severity: Low]
> Should this commit have a Fixes: tag?
> 
> Commit 1ebaa5e18915 ("net: sparx5: add support for lan969x targets and
> core clock") added the 0x18604697DD0F9B5B increment, a period of about
> 3.04701 ns against the nominal 3.047619 ns. It did not program the PLL to
> the matching rate. As the commit message describes, TOD and the scheduler
> clock have run 200 ppm apart on lan969x since then.
> 
> Something like:
> 
> Fixes: 1ebaa5e18915 ("net: sparx5: add support for lan969x targets and core clock")
> 
> would give stable and backport tooling a pointer. This fix also depends on
> two earlier patches in the series: "net: lan969x: add the core PLL
> registers" and "net: sparx5/lan969x: enable the switch core after clock
> setup". Could the commit message note that dependency, or say whether the
> series is meant for net-next only?
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-lan969x-core-skew-v1-0-b9b02b863d38%40microchip.com
