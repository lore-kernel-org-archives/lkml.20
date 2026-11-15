Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733551;
	b=pB8FbWSeeohW9zBXfivadGhGnomDEyxnbs7PgYeWcUMkYM/G86mkuWkic/1RZcmVcm9l
	 vvrJJmbT1Tx4LV+SMXAdyAe98eQG510m35AAUeS1tMBr6k6+fINkvF1AjiJYYAde06lvX
	 3NLIOIHffpp6aavgc+ZiyncuN2E/tlWi2www3pa8qkhuDjFw5DNgGLIdonXkKIchvBZA4
	 bkHF+NYTtzoSxbQ6P4B19VTCjPso+En/0pdkxyjxfohxyr2Q3b8UzcBL6ozriVQVGvgrj
	 Xjwgz6eERYikX679YvrzdFy6uB3j7gFf0Rmh3FYLCk10Drn/4UCbo5cmgrqsZxsyeaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733551;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Zf72ZQ+w95POj6DWynx7TH8s1lmsxub+ZoagEDrITyE=;
	b=XoZvXearzvXbBNo2jqRURx1qaSZWtK7iZ/qXlhsww0uj14eOWktIcr2KcrQf0N9EY+jo
	 Jn5rpgW4M3/J+MlyQZmeTuGYuUfH/UQSSw7U+ac3c2E1KHVWpd69eXUuII3GM6kuTYSSE
	 bZ0++bRdfDZc0rUk3eYuAYu/gGJhhaFRmsTq+DA5WA3usIypkLxNZvRqPY8bgZOYIgief
	 nLOxzsflrrg/zMVeN0LqqFQ5FZf8nJwPhReScbp9FR1WEoVVVw7g3F71O+pzBWnWzD8x8
	 1YvMriVai/TtPz1kZvXgql0wxeOZycHUgTYKwUwrf1kqaCVf/wp877Goz48j25ToRkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHSLhI7q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644EA606A33A;
	Sun, 15 Nov 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHSLhI7q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495541F000CB;
	Sun, 15 Nov 2026 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733551;
	bh=Zf72ZQ+w95POj6DWynx7TH8s1lmsxub+ZoagEDrITyE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MHSLhI7qPjvmgcPZxdLZqoGGBzZ9zwoErz0k+Kuf/0Entg5KUdIMulTx8CAkArbJ9
	 ZHPU0ca84ZNTAxWmwLk8OjCZnXvddkmziGrzvn/jKO3fkJ/7ZGxW61mVTWTXW2SyMT
	 E662tF5kYn/7ctAuCG/ciB0Raal+0LLBVIMWHkX5P2Co3PzIFqARIT7CO2Ksb0VwtB
	 GUxcRpzxmj68bvwx5thg/Wrwkd3qFCO4MXTH55tTUIPwcRTwLNLrL7PTLQ1jPuQ4sL
	 6qjFAXDMc4w/pEJMuk113KNkrDGBnknz5lUuDS8q2L/Htjy84VShqPCo8MX/rn0meA
	 6DsplvJ4Jlc6g==
Subject:
 Re: [PATCH net-next v2 1/2] net: phy: realtek: add PTP clock for RTL8127a
From: netdev-bot+sashiko@kernel.org
To: javen_xu@realsil.com.cn
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 freddy_gu@realsil.com.cn, nb@tipi-net.de, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org,
 vladimir.oltean@nxp.com
Date: Sun, 15 Nov 2026 09:05:49 +0000
Message-ID: <179473354983.2199510.8206567516875465231@kernel.org>
In-Reply-To: <20261111083807.1529-2-javen_xu@realsil.com.cn>
References: <20261111083807.1529-2-javen_xu@realsil.com.cn>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rtl8127a_ptp_remove()
  (drivers/net/phy/realtek/realtek_ptp.c:365-374) unregisters the clock…
- [Medium] The patch adds a PHC whose callbacks
  (gettimex64/settime64/adjtime/adjfine) can reach the PHY's GPHY_OCP…
- [Medium] The PHC is registered at PHY probe and stays reachable from
  userspace for the whole binding.
- [Medium] The PHC is seeded in .config_init, which runs from
  phy_init_hw() before the rest of r8169's PHY bring-up.
- [Low] rtl8127a_ptp_hwtstamp_enable() ends with
  `rtl8127a_ptp_modify(ptp, 0xa640, 0, BIT(15))` (realtek_ptp.c:216),…
- [Low] In rtl8127a_ptp_gettimex64() (realtek_ptp.c:290-293),
  ptp_read_system_prets() and ptp_read_system_postts() bracket the whole…

--

net: phy: realtek: add PTP clock for RTL8127a

This patch registers a PTP hardware clock for the internal PHY of RTL8127A
(RTL8261C, PHY ID 0x001cc890). The PHY's free-running clock is read, set,
stepped and frequency-adjusted through vendor MMD registers, and a driver
mutex serializes multi-register sequences. The clock is seeded from system
time in config_init each time the PHY is initialized.

> diff --git a/drivers/net/phy/realtek/realtek_ptp.c b/drivers/net/phy/realtek/realtek_ptp.c
> new file mode 100644
> index 0000000000000..bd5c0d6988dae
> --- /dev/null
> +++ b/drivers/net/phy/realtek/realtek_ptp.c
> @@ -0,0 +1,374 @@

[ ... ]

> +static int rtl8127a_ptp_read(struct rtl8127a_ptp *ptp, u16 reg)
> +{
> +	return phy_read_mmd(ptp->phydev, MDIO_MMD_VEND2, reg);
> +}
> +
> +static int rtl8127a_ptp_write(struct rtl8127a_ptp *ptp, u16 reg, u16 val)
> +{
> +	return phy_write_mmd(ptp->phydev, MDIO_MMD_VEND2, reg, val);
> +}

[Severity: Medium]
Do these accesses need more than the MDIO bus lock to stay serialized
against r8169? The PTP accessors end up on the MAC's GPHY_OCP register:

phy_read_mmd()
  rtl822x_read_mmd()
    rtlgen_read_mmd()
      rtlgen_read_vend2()
        __mdiobus_c45_read()
          r8169_mdio_read_reg_c45()
            r8168_phy_ocp_read()

r8169 loads the RTL8127A PHY firmware through the same register, and that
path does not take the MDIO bus lock:

rtl8169_up()
  rtl8169_init_phy()
    r8169_hw_phy_config()
      rtl8127a_1_hw_phy_config()
        r8169_apply_firmware()
          rtl_fw_write_firmware()
            rtl_writephy()
              r8168g_mdio_write()
                r8168_phy_ocp_write()
                  RTL_W32(tp, GPHY_OCP, OCPAR_FLAG | (reg << 15) | data);

/dev/ptpN exists from PHY probe onward. A gettimex64, settime64, adjtime
or adjfine call could arrive from phc2sys or a chrony PHC refclock during
interface open, the reset worker, or runtime/system resume. Its GPHY_OCP
transactions could then interleave with the firmware patch writes.

Could that lose or redirect a firmware write, or hand the other
transaction's data back to the PTP code?

The unlocked firmware loader in r8169 predates this patch. This patch adds
a path that userspace polls continuously.

[ ... ]

> +static int rtl8127a_ptp_hwtstamp_enable(struct rtl8127a_ptp *ptp, bool enable)
> +{

[ ... ]

> +	if (ret)
> +		goto out;
> +
> +	ret = rtl8127a_ptp_modify(ptp, 0xa640, 0, BIT(15));

[Severity: Low]
This isn't a bug, but what does BIT(15) of 0xa640 control? The register is
outside the 0xe4xx PTP block and has no define or comment.

Both the enable and the disable branch reach this write. Probe and remove
only call rtl8127a_ptp_hwtstamp_enable(ptp, false), but they still set the
bit, and nothing ever clears it.

If the bit turns on some PHY-core timestamping function, does it stay on
after disable, remove() and driver unbind? The later hardware timestamping
patch in the series keeps the same unconditional write.

> +out:
> +	mutex_unlock(&ptp->lock);

[ ... ]

> +static int rtl8127a_ptp_gettimex64(struct ptp_clock_info *info,
> +				   struct timespec64 *ts,
> +				   struct ptp_system_timestamp *sts)
> +{
> +	struct rtl8127a_ptp *ptp = container_of(info, struct rtl8127a_ptp, info);
> +	int ret;
> +
> +	mutex_lock(&ptp->lock);
> +	ptp_read_system_prets(sts);
> +	ret = rtl8127a_ptp_clkadj(ptp, RTL8127A_PTP_DIRECT_READ);
> +	ptp_read_system_postts(sts);

[Severity: Low]
Should prets/postts surround only the EXEC write that latches the counter?
rtl8127a_ptp_clkadj() first does an MDIO read of CLK_CFG inside
rtl8127a_ptp_modify(), then the EXEC write, then a read_poll_timeout()
(1us sleep, 1ms timeout) until EXEC clears.

All of that falls inside the system-time window. The window is wider than
it needs to be, and its midpoint is shifted away from the actual latch
point.

Taking prets just before the EXEC write and postts just after it, then
polling, would avoid this.

> +	if (!ret)
> +		ret = rtl8127a_ptp_read_time(ptp, RTL8127A_PTP_CFG_TIME, ts);
> +	mutex_unlock(&ptp->lock);

[ ... ]

> +int rtl8127a_ptp_config_init(struct phy_device *phydev)
> +{
> +	struct rtl8127a_ptp *ptp = phydev->priv;
> +	struct timespec64 ts;
> +
> +	if (!ptp)
> +		return 0;
> +
> +	/* (Re)start the clock from the system time whenever the PHY is
> +	 * (re)initialized, e.g. each time the MAC driver brings it up.
> +	 */
> +	ktime_get_real_ts64(&ts);
> +
> +	return rtl8127a_ptp_settime(ptp, &ts);

[Severity: Medium]
Does the time written here survive the rest of the r8169 PHY bring-up?
config_init runs from phy_init_hw(), before the firmware load and the soft
reset:

drivers/net/ethernet/realtek/r8169_main.c:rtl8169_init_phy() {
	phy_init_hw(tp->phydev);
	phy_resume(tp->phydev);
	r8169_hw_phy_config(tp, tp->phydev, tp->mac_version);
	...
	genphy_soft_reset(tp->phydev);
}

rtl8127a_1_hw_phy_config() starts with r8169_apply_firmware(), which loads
the PHY MCU patch and polls for BMCR_RESET. It then writes a number of PHY
parameters.

If the firmware load or the BMCR soft reset resets the PTP block, the
commit message would no longer hold:

  "The clock is started from the system time each time the PHY is
  initialized."

The probe-time programming in rtl8127a_ptp_hwtstamp_enable() (SYNCE_CTL,
INER, CTL, 0xa640) would be lost as well.

With the later hardware timestamping patch, the PTP_CTL/INER/GEN_CFG setup
written by rtl8127a_ptp_hwtstamp_set() is never re-applied after
rtl8169_up() either (open, reset worker, resume). hwtstamp_set() only calls
rtl8127a_ptp_hwtstamp_enable() when tx_type or rx_filter change, so
re-issuing the same configuration would not restore it.

Could hardware timestamping then stop silently after a MAC reset or
resume? The code alone doesn't show whether these registers are actually
cleared; that depends on the hardware.

> +}
> +
> +int rtl8127a_ptp_probe(struct phy_device *phydev)
> +{
> +	struct device *dev = &phydev->mdio.dev;
> +	struct rtl8127a_ptp *ptp;
> +	int ret;
> +
> +	ptp = devm_kzalloc(dev, sizeof(*ptp), GFP_KERNEL);
> +	if (!ptp)
> +		return -ENOMEM;

[ ... ]

> +	ptp->clock = ptp_clock_register(&ptp->info, dev);
> +	if (IS_ERR(ptp->clock))
> +		return PTR_ERR(ptp->clock);

[Severity: Medium]
What happens to PHC users while the r8169 PCI function is
runtime-suspended? The clock stays registered for the whole PHY binding.
r8169 schedules a runtime suspend 10s after the interface goes down or
loses carrier:

drivers/net/ethernet/realtek/r8169_main.c:rtl8169_runtime_idle() {
	...
	if (!netif_running(tp->dev) || !netif_carrier_ok(tp->dev))
		pm_schedule_suspend(device, 10000);
	...
}

In D3hot, r8168_phy_ocp_read() returns 0xffff. r8168_phy_ocp_write() times
out and logs a rtl_loop_wait error, but r8169_mdio_write_reg_c45() still
returns 0.

Every PHC operation (clock_gettime, settime, adjtime, adjfine, and
PTP_SYS_OFFSET_EXTENDED with up to 25 samples) would then send MMIO to a
suspended device. It would busy-wait through the write timeouts and the
1ms EXEC poll and then fail with -ETIMEDOUT.

Other userspace-reachable r8169 paths guard against this: the LED ops use
pm_runtime_resume_and_get() and get_stats64 checks pm_runtime_active().
This PHY-side path has no such guard.

When the link comes back, the resume path re-seeds the clock:

rtl8169_runtime_resume()
  rtl8169_up()
    rtl8169_init_phy()
      phy_init_hw()
        rtl8127a_ptp_config_init()

That steps the PHC to CLOCK_REALTIME. A ptp4l/phc2sys session would see
errors while the cable is unplugged and then a clock jump. This is still
the case at the end of the series.

> +
> +	phydev->priv = ptp;
> +
> +	return 0;
> +}
> +
> +void rtl8127a_ptp_remove(struct phy_device *phydev)
> +{
> +	struct rtl8127a_ptp *ptp = phydev->priv;
> +
> +	if (!ptp)
> +		return;
> +
> +	rtl8127a_ptp_hwtstamp_enable(ptp, false);
> +	ptp_clock_unregister(ptp->clock);
> +}

[Severity: Medium]
Should phydev->priv be cleared here? rtl8127a_ptp_probe() allocates ptp
with devm_kzalloc() on &phydev->mdio.dev. Devres frees it right after
remove() returns, but phydev->priv still points at it.

rtl8127a_ptp_config_init() and rtl8127a_ptp_remove() treat any non-NULL
priv as a live object. Consider this sequence:

  - the realtek PHY driver is unbound through sysfs while r8169 stays
    attached
  - it is rebound, and the probe fails before phydev->priv = ptp
    (devm_kzalloc() failure, an MDIO timeout in
    rtl8127a_ptp_hwtstamp_enable(), a ptp_clock_register() failure, or a
    hwmon init failure in rtl822x_probe())

phy_probe() sets phydev->drv before calling drv->probe and does not clear
it on the out_reset path. The next rtl8169_up() would then do:

rtl8169_init_phy()
  phy_init_hw()
    rtl8127a_ptp_config_init()
      rtl8127a_ptp_settime()
        mutex_lock(&ptp->lock);

Wouldn't that be a use-after-free on the devres memory? The later hardware
timestamping patch keeps the same remove() and only clears mii_ts and
default_timestamp, so the problem remains at the end of the series.

Setting phydev->priv = NULL in rtl8127a_ptp_remove() would avoid it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111083807.1529-1-javen_xu%40realsil.com.cn
