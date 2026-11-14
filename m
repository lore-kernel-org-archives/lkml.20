Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651471;
	b=ws0GEQkw/airsu/B4gqb5i7jaqSLfgzp4JAwXU31To4i7RDOV01A62lKybupOwc6I9Bf
	 3L7pVTXj65FNmjlcYeMjvdRASbynnxKUSsDp5ubScxUwD049yd0fm7PzaEn2r2ivzZw/q
	 zfdFLmnBaIIxnVnJBRtz4fVnPQq1zGfx3jnB9Htotb3p1vgz6P1k5YRdNlv2+0PorYmwF
	 nO+E20NBZJRcbWkww7BRkamTYlla2mEujgnyjjYqgZaq2rxur9yW+8Zen6LfG5z18zNx0
	 1BMhDHaK2pVb8v/8FK1UCFQrqYffiLsk8LVqzeW+zfYFV8vqdjxYe0RGt16skJpZGZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651471;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZjWiDwSAra1aE0draaGdSxtcU7ywNhgRXO08U1vNiPI=;
	b=QrPDThIqgNNW+ebG3IPw0EZK4uFeQ7cZf3M102cyq/Dg0s0xay/2gWObR6srfpNuubas
	 2IE0h1Nc60BgC2QliezGchsmAY+i5KXDMGwEclNL3f9mJGx244+D02DrTzc2MKwcQKOw2
	 uQMPqrSP2RdMn07ypfQL6de9eCBH1SJojRmlFFUjP4uVidu5SCvul/TCVBurBy5XxjB4Q
	 7oNMDsc06alVJDIWNVRxZuTnJkvtfV7PlhOTlSANSTAsT9ZqNjAsqK6c+GbBYDAk8EKie
	 7jcGxmtsywzNZ1FQ09boPxLHKiPGOiDZD6tJzljI9KGgZtgUBXQ4gMK+kK6ggI3TpVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiNedbbr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98403606A887;
	Sat, 14 Nov 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiNedbbr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649A61F000C4;
	Sat, 14 Nov 2026 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794651471;
	bh=ZjWiDwSAra1aE0draaGdSxtcU7ywNhgRXO08U1vNiPI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SiNedbbrgem0V6/hUOc70ZyBqNkbT+ffgeMr6LeB4lXRjAEk7SMcq1ycBPiLi5TiP
	 iGAA6T8LL0ehTP+/dfDDXcOateIMThCRaEq4CDmLMCN81Xso7YksKKCzO9199CH7CT
	 hAZ0Fq7nyovPitXdUCBrvUnSEJw8AaCL5zS/3D8axvNrQsfYSF3twpHuz4NcyDfl3e
	 CtZrvjB2zEO71nW9Edfoj3raQkc+hC1pLEpM1X63eAPRgDX2/RZoVJrqEd1Ao+5+Kp
	 ERXEsVuFg31jb15aP1Py3qe2CEkgUpoi2Wc+JTGf4aiFr6f321NmAscP8PliM6zyTq
	 rlOU1wLGcXKvw==
Subject: Re: [PATCH net-next v8 2/3] ptp: Add driver for R-Car Gen4
From: netdev-bot+sashiko@kernel.org
To: niklas.soderlund+renesas@ragnatech.se
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, richardcochran@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, vadim.fedorenko@linux.dev,
 sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Sat, 14 Nov 2026 10:17:49 +0000
Message-ID: <179465146990.2199510.5608660826601726240@kernel.org>
In-Reply-To: <20261110080727.2377040-3-niklas.soderlund+renesas@ragnatech.se>
References: <20261110080727.2377040-3-niklas.soderlund+renesas@ragnatech.se>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new drivers/ptp/ptp_rcar_gen4.c is a second, standalone
  driver for a gPTP block that rtsn (V4H) and rswitch (S4) already map…
- [Medium] ptp_rcar_gen4_probe() calls pm_runtime_resume_and_get(dev) and
  throws away the result.
- [Low] ptp_rcar_gen4_probe() programs the increment and starts the timer
  (iowrite32(1, PTPTMEC_REG), line 182) before ptp_clock_register().

--

ptp: Add driver for R-Car Gen4

This commit adds a standalone PTP clock driver for the gPTP timer found
on R-Car Gen4 SoCs (S4, V4H and V4M). The timer is described as
system-wide and shared by the Ethernet devices. On S4 and V4H it shares
its clock and reset with RSWITCH or RTSN respectively.

> diff --git a/drivers/ptp/ptp_rcar_gen4.c b/drivers/ptp/ptp_rcar_gen4.c
> new file mode 100644
> index 0000000000000..e82b6c5abc306
> --- /dev/null
> +++ b/drivers/ptp/ptp_rcar_gen4.c
> @@ -0,0 +1,225 @@

[ ... ]

> +static int ptp_rcar_gen4_probe(struct platform_device *pdev)
> +{
> +	struct ptp_rcar_gen4_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	unsigned long rate;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);

[Severity: Medium]
How is this driver meant to coexist with the existing users of the same
gPTP block on S4 and V4H?

On V4H, tsn0 in r8a779g0.dtsi already lists this register range as its
"gptp" resource:

arch/arm64/boot/dts/renesas/r8a779g0.dtsi:
	reg = <0 0xe6460000 0 0x7000>,
	      <0 0xe6449000 0 0x500>;
	reg-names = "tsnes", "gptp";

rtsn_probe() requests and maps that range:

drivers/net/ethernet/renesas/rtsn.c:rtsn_probe() {
    ...
	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
    ...
	ptpaddr = devm_ioremap_resource(&pdev->dev, res);
    ...
	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev, ptpaddr);
    ...
}

The binding example for this driver uses the same reg = <0xe6449000
0x500>, and so does the r8a779g0 gptp node added later in this series.
devm_ioremap_resource() and devm_platform_ioremap_resource() both call
request_mem_region().

If a board enables both nodes, wouldn't the second driver to probe fail
with -EBUSY? That would lose either the TSN port or the new PHC. The
later gptp node is added disabled, so no in-tree board hits this yet.

On S4, rswitch_probe() maps its whole register region and reaches the
gPTP inside it:

drivers/net/ethernet/renesas/rswitch_main.c:rswitch_probe() {
    ...
	priv->addr = devm_ioremap_resource(&pdev->dev, res);
    ...
	priv->ptp_priv =
		rcar_gen4_ptp_alloc(pdev, priv->addr + RSWITCH_GPTP_OFFSET_S4);
    ...
}

An S4 gptp node looks like it would collide in the same way.

This driver is also very close to the existing
drivers/net/ethernet/renesas/rcar_gen4_ptp.c, which rtsn and rswitch
already use. Both have the same PTPTMEC, PTPTMDC, PTPTIVC0, PTPTOVC*
and PTPGPTPTM* register map, and the same adjfine, gettime, settime
and adjtime logic. The commit message doesn't mention that code, and
neither consumer is converted.

The Kconfig help says the clock "can then be used by Gen4 Ethernet
drivers". In-tree, only ravb consumes an external timer, through the
"ptp-timer" phandle and ptp_clock_index_by_of_node(). rtsn and rswitch
drive the block privately, so the shared-timer setup described in the
commit message doesn't seem reachable on S4 and V4H.

Could the commit message say how the two implementations relate? Or
should rtsn and rswitch be converted to use this PHC?

[ ... ]

> +	pm_runtime_enable(dev);
> +	pm_runtime_resume_and_get(dev);

[Severity: Medium]
Should the return value of pm_runtime_resume_and_get() be checked here?

pm_runtime_resume_and_get() calls pm_runtime_get_active(dev, 0), which
drops the usage reference itself when the resume fails:

include/linux/pm_runtime.h:pm_runtime_get_active() {
	...
	ret = __pm_runtime_resume(dev, RPM_GET_PUT | rpmflags);
	if (ret < 0) {
		pm_runtime_put_noidle(dev);
		return ret;
	}
	...
}

If the clock enable or power domain power-on fails, probe still writes
PTPTIVC0 and PTPTMEC to a module that isn't clocked. It then registers
a PHC whose gettime64, settime64, adjfine and adjtime callbacks access
the same unpowered registers. Userspace can reach those callbacks
through clock_gettime() and the PTP ioctls.

The ptp_clock_register() error path below and ptp_rcar_gen4_remove()
both call pm_runtime_put_sync() for a reference that was never taken.
That ends in rpm_drop_usage_count(), which warns "Runtime PM usage
count underflow!" and returns -EINVAL.

The v6 changelog says pm_runtime_resume_and_get() was chosen on
purpose. Was the usual check and bail-out after it left out by
accident?

> +
> +	iowrite32(priv->default_addend, priv->base + PTPTIVC0_REG);
> +	iowrite32(1, priv->base + PTPTMEC_REG);
> +
> +	priv->clock = ptp_clock_register(&priv->info, dev);
> +	if (IS_ERR(priv->clock)) {
> +		pm_runtime_put_sync(dev);
> +		pm_runtime_disable(dev);
> +		return PTR_ERR(priv->clock);
> +	}

[Severity: Low]
If ptp_clock_register() fails, does this leave the timer running?

The timer is started with iowrite32(1, priv->base + PTPTMEC_REG) before
registration. This error path never writes PTPTMDC_REG, but
ptp_rcar_gen4_remove() does:

	iowrite32(1, priv->base + PTPTMDC_REG);

On S4 and V4H the module clock is shared with RSWITCH or RTSN.
Dropping this device's runtime PM reference therefore may not gate
the clock. The counter would keep running with this driver's increment
and no software owner.

rcar_gen4_ptp_register() avoids this by setting PTPTMEC only after
ptp_clock_register() succeeds. Could the same ordering be used here,
or could PTPTMDC be written on this error path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110080727.2377040-1-niklas.soderlund%2Brenesas%40ragnatech.se
