Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651473;
	b=HoQZr8IlifC1HoX8yDPHB7JMpVZht10sbrc4i8OWNaQsgIoW6FWAPE58RSkrzyyPvAvU
	 nY0O5Ykd3wh6n0TcZjoxSwQy0F3+NDUkhE1SbH7dJusPIAcg5Y5FPhUlVS6bLzw+ddhmp
	 5t1jdPr4jUZeGxHM2UKpOGhbxWOReV8g6mQSTn2xZIMcD8fBbMxF1emMHzBZJLhByjUEw
	 flDuLRM0BZUpAKheRKYOgA77QFttZ6ALkEJAhmTMLHoLlhAAf1d+PQVezjXzQLIG6dP5l
	 Xgzt6myUvdq1EpyaMr9LSmE//FhOqxT/sWtbhhrF/6L1x6mStXMyZ9h9IlWlzsIL1Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651473;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sE4Cm5Gek3IQkKMKh5CcxTRTj/SWHXCIUtLGgi/uNRQ=;
	b=nmUXV8Ok3vJtPdK4hCmv/gW6D9K7/B6krGjIHUro0SzkH4O8iCfx9yFBNOAlP+pgmdL1
	 8e3ppUSiS5vBKP0BBxcDRl2WHxGaKFlINkLL/SnTUdL27/trHcE45F0dcuEtyXbAKszlf
	 Q9MDgbq+/+9h0vWVtyjmu0KIcYn14Is4UbA+VOGK0KMvx5zD4HlCDX6vXqnYyIwaQsKdX
	 WoVQ5hALGKXKMQ2KOK495qsH5fA8y4xLtGjoq+V9OgI+vZ5Um20c2jz3qhcnfWX72/tZ5
	 Px6Hnybwj0cHTgi8iPBksfV6Ox+VqjgIjIRlGZTs8iZLlJ438kuSUFo91fZu+HQCr+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=adIHoyIu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57235606A329;
	Sat, 14 Nov 2026 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=adIHoyIu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156B21F000C4;
	Sat, 14 Nov 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794651473;
	bh=sE4Cm5Gek3IQkKMKh5CcxTRTj/SWHXCIUtLGgi/uNRQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=adIHoyIub1KHXf+vd8VSLOJtpEUTqAQO8BhfhoN6BKp1MiK5679/9CnL/q/Ha8IkW
	 d9L4xPswoMfkasqOtH54SS0Y7sdgmW2+2R5exg9P/5FVx4ZV4+PTmljbc5l5cz3yXP
	 LTrJmhQMySlH5AAgeqPEGxOFDREzzh73Er0Anb6MWOudKHtckk/53nvD3IF6+C468J
	 UvPndpcP+7cErCTiUf0aMc9frQzqQG8MssT4eAGntzf5Vl8sS6dIPPCCMYD2vKkiVF
	 +hM+iRlV1Totks00bL3pBFcjMp/xItZI2lKFa6fGLATxny9JGyuY1cVBL4NnGMOHjz
	 JNLYkWcEWTCOw==
Subject:
 Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
From: netdev-bot+sashiko@kernel.org
To: niklas.soderlund+renesas@ragnatech.se
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, richardcochran@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, vadim.fedorenko@linux.dev,
 sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Sat, 14 Nov 2026 10:17:51 +0000
Message-ID: <179465147165.2199510.7987717328787148087@kernel.org>
In-Reply-To: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
References: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new `gptp: ptp@e6449000` node in
  arch/arm64/boot/dts/renesas/r8a779g0.dtsi uses `reg = <0 0xe6449000 0…

--

arm64: dts: renesas: r8a779g0: Add gPTP node

This adds a gptp: ptp@e6449000 node to the R-Car V4H SoC dtsi. The commit
message says the gPTP module is shared between the RAVB and RTSN Ethernet
devices.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 5284923b6cef7..f2d6696680db8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
>  			status = "disabled";
>  		};
>  
> +		gptp: ptp@e6449000 {
> +			compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +			reg = <0 0xe6449000 0 0x500>;
> +			clocks = <&cpg CPG_MOD 2723>;
> +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets = <&cpg 2723>;
> +			status = "disabled";
> +		};
> +
>  		tsn0: ethernet@e6460000 {
>  			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
>  			reg = <0 0xe6460000 0 0x7000>,

[Severity: Medium]
Can tsn0 and the new gptp node both be enabled on the same board?

The existing tsn0 node, which this patch does not change, already claims
the same window as its second reg entry:

	tsn0: ethernet@e6460000 {
		reg = <0 0xe6460000 0 0x7000>,
		      <0 0xe6449000 0 0x500>;
		reg-names = "tsnes", "gptp";
		...
		clocks = <&cpg CPG_MOD 2723>;
		resets = <&cpg 2723>;

rtsn_probe() in drivers/net/ethernet/renesas/rtsn.c maps that region
exclusively and runs the timer itself:

	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
	...
	ptpaddr = devm_ioremap_resource(&pdev->dev, res);
	if (IS_ERR(ptpaddr)) {
		ret = PTR_ERR(ptpaddr);
		goto error_free;
	}

	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev, ptpaddr);

ptp_rcar_gen4_probe() in drivers/ptp/ptp_rcar_gen4.c claims the same
range:

	priv->base = devm_platform_ioremap_resource(pdev, 0);
	if (IS_ERR(priv->base))
		return PTR_ERR(priv->base);

If a board sets both &tsn0 and &gptp to okay, the device that probes
second should get -EBUSY from its request on 0xe6449000-0xe64494ff. When
rtsn is the one that fails, the whole TSN Ethernet interface is lost,
because a failed gptp mapping takes the error_free path in rtsn_probe().

The commit message says:

    The gPTP module is shared between the RAVB and RTSN Ethernet devices on
    the SoC.

The new renesas,rcar-gen4-gptp.yaml binding also says "On R-Car V4H it is
shared between RTSN and RAVB". However, renesas,ethertsn.yaml still
requires the gptp reg entry on the TSN node. rtsn also has no ptp-timer
phandle path. No DTS under arch/arm64/boot/dts/renesas/ references &gptp
yet, so RAVB is not connected to this node either. RAVB uses the timer
only through of_parse_phandle(..., "ptp-timer", 0).

Would it make sense to either move RTSN over to the shared node or
document that the two nodes are mutually exclusive? Moving RTSN would mean
dropping the gptp reg from tsn0 and from the ethertsn binding, and
switching rtsn to a ptp-timer phandle.

A shared-node conversion would also need to handle reset 2723. rtsn takes
it with the exclusive devm_reset_control_get() and pulses it in
rtsn_reset(). That looks like it would wipe the timer setup, which
ptp_rcar_gen4_probe() writes only once.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110080727.2377040-1-niklas.soderlund%2Brenesas%40ragnatech.se
