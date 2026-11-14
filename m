Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651470;
	b=qluRAx0caZRjT+am6jTes5ak6je5oy36G99m1yFiwCjFGc7E11W23XDCqpJOllrgs9f1
	 deouoc6HAImSIjfYKYEbKooR4GmPlLrTPfMPEqQA2aoZJlMShOUJ2EINWW342gG1besuY
	 w3mp3dP5qVMjI5wqCWRjMeNHbvxscb7TBSNps8kjifTSFo72AozCglQy96MJxfsBliMOp
	 r8M2NYbYqUdNhBtx5y38spgTuOmeD3i8/mprc3v07U4I48XKKjrD6hIkmqSI9GzUDt3nA
	 9dXvD9VQh2uDc/MxR4zuFO6p6Rl852bEGPk7bfM+rfFDLefcOnrOQb5W4vrTrAFPRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651470;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iyjrDebmwBcAxKG4JOtSLYLLHCHa+nEWL8zP1dBnH7c=;
	b=PA6rjrDAdxqyeZuuMzSHPuUJBxknTts4jjSgVGnpCN0bBfuWpmC8kr490eRzVASNmciK
	 Q/WtRMXEdcV3xt5+qZHTI7o7dwKkugtCCWUk3reEA682hIk6Pf8Dy6hDxH3vTXcpn46tn
	 df738iotk8ouN/KToNzkQHbTev3w2aiSjRAfWNf6xAYdTrvcaLWBAWkAy5DcYD0bhZiiK
	 xheQC7h6RZRxwWuu56nTwBLkixU49LoICzPuVCsrfBDj9FMmoZ8kI4rA2yWEEdx6v48u5
	 4LDLrt8rDP1jhwm5ycTFGpBs+t/eI2Ic+tlDuHwq0+C597yOGhiWyjXyrGWRLkTmN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qot8PA+C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF3606A329;
	Sat, 14 Nov 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qot8PA+C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34BD1F000C4;
	Sat, 14 Nov 2026 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794651469;
	bh=iyjrDebmwBcAxKG4JOtSLYLLHCHa+nEWL8zP1dBnH7c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qot8PA+CrUe6lVQMlVuKx+7k6HdU6xZg3xYhSbfwbVAcrwZll9iq0u16zBZkE3vl2
	 C3AJcW/oWqHx13841sCF8iCn/YZwv+f2jdd0y+zsu1YWohN+EcjWVIN9ZmokkNe/b9
	 vIHizN+X34kcyPInj3dVxbVz7MjR6CvUasiEQeKUoiEhS/d3r82/z50HhwdKqXYLF+
	 JWBBYKWd13ag96EyqUEG8l2OECyxBd08Qe4WkOd0Xx9ayzLXiwJxodzmY9crvItq5Z
	 1he6fyhl7VlOxQwwlp4gAXLF7eC2zzz6bA+cM9av1H3zUySXpgIf7/RXrvTMlSa4Mt
	 pCN4KSqtUYL8g==
Subject: Re: [PATCH net-next v8 1/3] dt-bindings: ptp: renesas,rcar-gen4-gptp:
 Add R-Car Gen4
From: netdev-bot+sashiko@kernel.org
To: niklas.soderlund+renesas@ragnatech.se
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, richardcochran@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, vadim.fedorenko@linux.dev,
 sergei.shtylyov@gmail.com, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Sat, 14 Nov 2026 10:17:48 +0000
Message-ID: <179465146821.2199510.735416369980468650@kernel.org>
In-Reply-To: <20261110080727.2377040-2-niklas.soderlund+renesas@ragnatech.se>
References: <20261110080727.2377040-2-niklas.soderlund+renesas@ragnatech.se>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new renesas,rcar-gen4-gptp binding describes the gPTP
  timer as a standalone device.
- [Low] The binding sets additionalProperties: false and has no
  'interrupts' property, but the Gen4 gPTP IP appears to have status…
- [Low] The commit message and the binding description (renesas,rcar-
  gen4-gptp.yaml line 19) say that on R-Car S4 the timer is 'shared…
- [Low] Not confirmed (baseline decision: false).
- [Low] Not confirmed (baseline decision: false).

--

dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4

This adds a DT binding for the R-Car Gen4 gPTP timer on S4, V4H and V4M.
The timer is described as a standalone node with reg, clocks,
power-domains and resets. The patch also adds a MAINTAINERS entry for the
binding.

> diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> new file mode 100644
> index 0000000000000..3edd64d400387
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> @@ -0,0 +1,64 @@

[ ... ]

> +description:
> +  The R-Car Gen4 gPTP timer enables accurate synchronization of the clock in
> +  the control system. The timer is system-wide and used by different Ethernet
> +  devices on each Gen4 platform.
> +
> +    - On R-Car S4 it is shared between RSWITCH and RAVB.

[Severity: Low]
Is the S4 part of this accurate? The tree doesn't seem to have an EtherAVB
on S4:

- renesas,etheravb.yaml lists only r8a779a0, r8a779g0 and r8a779h0 under
  renesas,etheravb-rcar-gen4. There is no renesas,etheravb-r8a779f0.
- ravb_main.c has no S4 match.
- r8a779f0.dtsi only has the renesas,r8a779f0-ether-switch node and no
  etheravb node.

Also, "ptp: Add driver for R-Car Gen4" later in the series only mentions
RSWITCH for S4.

The commit message makes the same claim:

  - On R-Car S4 it is shared between RSWITCH and RAVB.

> +    - On R-Car V4H it is shared between RTSN and RAVB.
> +    - On R-Car V4M it is only used by RAVB.

[ ... ]

> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - resets

[Severity: Low]
This is a minor point. On V4H, the reset (and clock) here is the RTSN
module reset 2723, which tsn0 also uses. On S4 it would be the RSWITCH
module.

In the final series state this does not cause a conflict:

- ptp_rcar_gen4.c never calls any reset_control API.
- rtsn and ptp_rcar_gen4 cannot be bound at the same time because of the
  exclusive MMIO claim described below.

Once that register overlap is resolved and both drivers can bind,
rtsn_reset() would pulse the shared line:

drivers/net/ethernet/renesas/rtsn.c:rtsn_reset() {
    ...
	reset_control_reset(priv->reset);
    ...
}

Would that reset the timer that RAVB relies on?

"ptp: Add driver for R-Car Gen4" says the gPTP shares its clock and reset
with RSWITCH or RTSN. Could the binding description say so too?

> +
> +additionalProperties: false

[Severity: Low]
The binding has additionalProperties: false and no interrupts property.
How would the timer's interrupt outputs be described on this node?

On S4, r8a779f0.dtsi routes dedicated SPIs named "gptp0_status" and
"gptp1_status" in the rswitch node. They might come from the gPTP block,
though they could also be RSWITCH status aggregation. The tree alone
doesn't make that clear.

A binding should describe the hardware fully, even where the driver doesn't
use a resource. Should an optional interrupts property be added here?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    ptp@e6449000 {
> +            compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> +            reg = <0xe6449000 0x500>;

[Severity: Medium]
Isn't this the same register window that renesas,ethertsn.yaml already
requires as the second reg entry of the RTSN node?

Documentation/devicetree/bindings/net/renesas,ethertsn.yaml:
  reg-names:
    items:
      - const: tsnes
      - const: gptp

r8a779g0.dtsi uses this window in tsn0:

		tsn0: ethernet@e6460000 {
			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
			reg = <0 0xe6460000 0 0x7000>,
			      <0 0xe6449000 0 0x500>;
			reg-names = "tsnes", "gptp";

rtsn_probe() maps that region exclusively and registers its own PHC on it:

drivers/net/ethernet/renesas/rtsn.c:rtsn_probe() {
    ...
	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
    ...
	ptpaddr = devm_ioremap_resource(&pdev->dev, res);
    ...
	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev, ptpaddr);
    ...
}

Later in the series, "arm64: dts: renesas: r8a779g0: Add gPTP node" adds a
ptp@e6449000 node with the same reg, clock and reset. In "ptp: Add driver
for R-Car Gen4", ptp_rcar_gen4_probe() maps it with
devm_platform_ioremap_resource(), which is also an exclusive request.

Take a V4H board with &tsn0 enabled, such as White Hawk Single. If it also
enables &gptp so that RAVB can use ptp-timer = <&gptp>, won't whichever of
rtsn and ptp_rcar_gen4 probes second fail with -EBUSY? That would lose
either the TSN interface or the PTP clock that RAVB needs.

S4 has a similar overlap. The gPTP block sits at RSWITCH base +
RSWITCH_GPTP_OFFSET_S4, inside the base region that renesas_eth_sw_probe()
maps exclusively. A renesas,r8a779f0-gptp node written to this binding
would overlap that region.

dtc doesn't check for reg overlap between non-sibling nodes, so this would
only show up at runtime.

Is there a transition plan for the gptp reg entry in renesas,ethertsn.yaml
and for the rswitch mapping, such as deprecating the ethertsn gptp reg?
The commit message doesn't mention the overlap or the DT ABI impact.

> +            clocks = <&cpg CPG_MOD 2723>;
> +            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +            resets = <&cpg 2723>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe23913b1e432..085fedac38ef5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23822,6 +23822,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
>  F:	drivers/mtd/nand/raw/renesas-nand-controller.c
>  
> +RENESAS R-CAR GEN4 GPTP DRIVER
> +M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml

[Severity: Low]
This is a minor note. At this point the "GPTP DRIVER" section lists only
the binding, and nothing binds renesas,rcar-gen4-gptp yet.

Later in the series this is resolved. "ptp: Add driver for R-Car Gen4"
adds F: drivers/ptp/ptp_rcar_gen4.c to this section, along with a platform
driver that matches renesas,rcar-gen4-gptp. Putting the binding before the
driver looks fine.

> +
>  RENESAS R-CAR GYROADC DRIVER
>  M:	Marek Vasut <marek.vasut+renesas@mailbox.org>
>  L:	linux-iio@vger.kernel.org

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110080727.2377040-1-niklas.soderlund%2Brenesas%40ragnatech.se
