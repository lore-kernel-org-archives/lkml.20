Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840154;
	b=M7FC7y3f1Nck5X1qRsE6iagKyvtA8rGBTdMTUD/s+iQT5de6gWHHboS0AeGgshWm5a+t
	 hlzVqOq0NubMIMLH2RAvNh9OagkbVeGh1l0+zIuD31DW0FtbmlTImgPud7G9eTORpsW83
	 2QmjqQBRwz+DPjFSTnpvKLvjRRcUWj9xJMQWPZFY0yuZEYD8LtwDfJuSyCoRSrHmyI7WJ
	 28F4yGcseNhAZN9VxtWmNs/WSXcgNbh8IiDmKIXzKfZyk3GmKliA7fKQKlvuvR4XcuqpV
	 tGgMfL2hJCpgzHzfbrZUYRtSj8GYo2DocyNGf0xKdDVRdofMpqXcMXyE0pptmRdvHDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840154;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=q5fTVKGrskJG4rdSydPr4XMv95Db9+O3BQWMmUFXULI=;
	b=h/CnNb4k6p0WTfzgzUVSjV57WTJWXZIhQfRS81S2qL3+kKEXIB81e9zYJ/vQrbOqFpXX
	 v6L2xFye9AToUL8PIbTqfRv90CaMphkOzkQ+gjIOXt2klsUeebJ8wL7SBxVgL34KacKdC
	 4tAh92og+V9a80VInGybwMjtXwTOZMFMPfnjbiszwR5qdXz84k6RotimyiPD0YZLV6Iu6
	 SJLsz/2G7FVRt/jLm9KzdZsu36iViTOeVEXScnJn37tSFVnVixITSsdBanWtWOaP/fzLT
	 x5z5LQcDWE5AfsT0l5LTWQbQMRSlOwtkGypTtNVKjHOf8C2V6BMRcnIfK5PZ8ylFtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LG7D9VlL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E153D606A31C;
	Mon, 16 Nov 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LG7D9VlL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD611F000C4;
	Mon, 16 Nov 2026 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840153;
	bh=q5fTVKGrskJG4rdSydPr4XMv95Db9+O3BQWMmUFXULI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LG7D9VlL4ycHov4A3MFP0swl7FuLeK3/NWZCcN0scM6Z9FrBhWr5UHnFsuWQfeAHf
	 +Rduaj5TAKFSzumhW2L1L+eA07I65IohhX7Eod1PstibMo8Ugm50XhzTKiAO24ppkj
	 nQFLZUFEpj2eOuGCO8BeMqT+xcdLDDAsQEnrdqdTfqiWSS2bT4Kv7WxtKeDQlI+b2V
	 N4s00Zd1bHU4BpvX+ttPjaZSsFm3lQ0dmFGKH5Rnl3OIM4XW/+Kc2swF1hEcyAJSwg
	 p5q57ANVmtAlmHYzxDwO7GVNV+Y4EcB6pJluPnpYdyKp9YinMOEIBb5olYxIk7s0XQ
	 mfGMQ4syM2fKQ==
Subject:
 Re: [PATCH net-next] net: sparx5: check DT port reg against array size
From: netdev-bot+sashiko@kernel.org
To: haoranwangsec@gmail.com
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org
Date: Mon, 16 Nov 2026 14:42:32 +0000
Message-ID: <179484015280.3136.6207275462106785238@kernel.org>
In-Reply-To: <179457014579.23820.10657909253312598784@gmail.com>
References: <179457014579.23820.10657909253312598784@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new range check in mchp_sparx5_probe()
  (drivers/net/ethernet/microchip/sparx5/sparx5_main.c:848) compares the…

--

net: sparx5: check DT port reg against array size

This patch adds a range check on the DT 'reg' value of each ethernet-port
node in mchp_sparx5_probe(). Nodes with portno >= SPX5_PORTS are now
skipped, so sparx5_create_port() can no longer index past the end of
sparx5->ports[].

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 9b67a0520907b..d975474792f9f 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
>  			dev_err(sparx5->dev, "port reg property error\n");
>  			continue;
>  		}
> +		if (portno >= SPX5_PORTS) {

[Severity: High]
Should this bound be sparx5->data->consts->n_ports rather than SPX5_PORTS?

SPX5_PORTS (65) is the compile-time size of sparx5->ports[]. It matches the
front-port count on Sparx5 only. mchp_sparx5_probe() is also used for
lan969x, and its consts are smaller:

drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c:
	.n_ports             = 30,
	.n_ports_all         = 35,

drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_regs.c:
	[TC_DEV2G5] = 28,
	...
	[RC_QSYS_ATOP] = 35,

On lan969x, a reg value from 30 to 64 passes this check.
lan969x_port_is_rgmii() is only true for ports 28 and 29, so such a port
just needs a phys phandle for devm_of_phy_get() to succeed. After that it
is accepted and goes through this path:

mchp_sparx5_probe()
  sparx5_create_port()
    sparx5->ports[config->portno] = spx5_port;
    sparx5_port_init()
      sparx5_port_max_tags_set()
        spx5_wr(..., DEV2G5_MAC_TAGS_CFG(port->portno));

The DEV2G5 registers resolve to regs[TARGET_DEV2G5 + portno]. The lan969x
iomap only fills TARGET_DEV2G5 + 0..27, and the sparx5 struct is
zero-allocated, so those slots are NULL. spx5_addr() warns but still
returns the address:

drivers/net/ethernet/microchip/sparx5/sparx5_main.h:spx5_addr() {
	WARN_ON((tinst) >= tcnt);
	WARN_ON((ginst) >= gcnt);
	WARN_ON((rinst) >= rcnt);
	return base[id + (tinst)] +
		gbase + ((ginst) * gwidth) +
		raddr + ((rinst) * rwidth);
}

Can this end up as an MMIO write to a near-NULL address during probe?

sparx5_port_init() also uses portno directly as the replication index for
QSYS_PAUSE_CFG(), QSYS_ATOP(), ANA_CL_CAPTURE_BPDU_CFG() and
ANA_CL_FILTER_CTRL(). With RC_QSYS_ATOP = 35 on lan969x, ports 30..34 would
reconfigure the internal CPU/VD ports, the ones sparx5_get_internal_port()
returns as n_ports + N. Ports 35..64 would go past the replication range.

If such a port survives init, sparx5_register_netdevs(),
sparx5_destroy_netdevs() and sparx5_unregister_netdevs() only walk
portno < consts->n_ports. Would its netdev then never be registered, and
its phylink never be destroyed?

The commit message describes the DT as possibly untrusted (overlay, kexec,
bootloader fixup). The binding in microchip,sparx5-switch.yaml sets no
maximum on the port reg, so this driver check is the only guard. Would
checking against the per-chip limit close the out-of-bounds case on
lan969x as well?

> +			dev_err(sparx5->dev, "port %u: reg out of range\n",
> +				portno);
> +			continue;
> +		}
>  		config = &configs[idx];
>  		conf = &config->conf;
>  		conf->speed = SPEED_UNKNOWN;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179457014579.23820.10657909253312598784%40gmail.com
