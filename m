Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802352;
	b=BFLZjlj2lIB/3/DUGAkJN8Z3DG1+JnWd5WeSgnWXgtFZCuwzeuQ25WuxjCpwvIzA2yxz
	 PnZSj/MaKwajRM7MLGD4o3SNj/g0USyEtgxuAekWuMdobE44Ce9umZUUmFjyHmrplkhoP
	 yG7NUXP6+hEUVv/bJ6RjlP8zQuBxSsL10VESeOpxsxBinw3htEo63EoMQUxEWM7XyPaFR
	 eRhx1On6Zpe+Ylbce6dvZTgB6JzCVGZb3BsomYjy37UEbcl9pJE49X+AsPcA8QKO6thKi
	 2vv59Y1E/Yp6arPxujIntW3hQgjfa0Tf6M+k0IssZXa2PbmNuHhERUV4wajt4+oj1nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802352;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8oYOY2NTfu9tj/qa/VJPJPG8PtiGkUvPv1hgkWBpXVo=;
	b=WYfQn33y70MC/pL5awoRMdaPfp6sEIpme3ZxyR19LKNjsAvpBP7WzhfFkZSUFTqriFhF
	 NF8f4JZKV1HRWhHoTJ89HkvgS70z1t7xqwPSoKaZJon41xU66g0vBww1iEQ6/AwOkyhuN
	 vXodEOH0bHN5q66iFRj5qfOmUJ8qyqGAwlDl+egMKXxNzCiebIzr5PLMZcCmutFhsMwOR
	 L89WKRUAAeq5Cj69LmfQdbZzQyNzZTuCS/hWgs8cAVzvfQ/dpvm/1uF4wEhDIik8aOwET
	 LPcO3U4jlYsW9TW9AbgouqI2c75E1WdV8/oUvx5BOYAZ8jdk7ZQkXa83XiGOUCoIciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxbPub6O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64529606A89C;
	Mon, 16 Nov 2026 04:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxbPub6O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488EE1F000D3;
	Mon, 16 Nov 2026 04:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802352;
	bh=8oYOY2NTfu9tj/qa/VJPJPG8PtiGkUvPv1hgkWBpXVo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fxbPub6Oq5pwAmxc9yexlpIHNy7YnWpTd04/yXPEKnnfC3Rl1gzb8CISsUoPJK/4Q
	 /aE+aUiniwgzMuNFEHSHuLjU+EjNGQHwu5ZUZ7fqUCmzaUcw8zeDEXd4rVZE15sbJS
	 6NXFO7KpjoS3Ln2t4iTp59zP95K7CaqBuPbmNrbzMo+gtVorawjMMVRX9xOdG6PYLj
	 4Bi6EAqjKqiWW5+OiFIs6ILQo+2a5w0JZmfOpK/2evBIX/BHYKcuByH5afC7uc7tF4
	 ToqNjbj80tlP2y9/89VQAfxiqfobHEm06aCJ02J+P+8ax97uOAVv9lhU51eAgKElMe
	 SdrqeUOWh/Aug==
Subject: Re: [PATCH net-next v5 4/6] net: xilinx: axienet: Add 10G/25G (XXV)
 ethernet support
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:30 +0000
Message-ID: <179480235080.3136.8103502035761762075@kernel.org>
In-Reply-To: <20261114182947.2908628-5-suraj.gupta2@amd.com>
References: <20261114182947.2908628-5-suraj.gupta2@amd.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] XXV receive is routed through the shared dmaengine RX callback,
  axienet_dma_rx_cb()…
- [Medium] axienet_mac_select_pcs() is shared by all MAC types.
- [Medium] PG210's XXV MAC flags bad-FCS, oversize/length-error and
  truncated frames only through rx_axis_tuser at end of packet, and…
- [Low] axienet_xxv_get_regs() reads every STAT_* status register on each
  'ethtool -d'.
- [Low] axienet_ethtools_get_regs() always sets regs->version = 0 and
  regs->len = sizeof(u32) * regs_n, then dispatches to…
- [Low] The patch builds xilinx_axienet_xxv.o into xilinx_emac under
  CONFIG_XILINX_AXI_EMAC, adding 10G/25G XXV support to that option, but…
- [Low] In axienet_open(), axienet_device_reset() runs first.

--

net: xilinx: axienet: Add 10G/25G (XXV) ethernet support

This commit adds support for the Xilinx XXV 10G/25G Ethernet MAC to the
axienet driver. The XXV-specific code goes into new xilinx_axienet_xxv.c/.h
files and is described by an axienet_10g25g_config. The shared paths use
the callbacks from that config, and axienet_mac_select_pcs() now also
handles 10GBASER and 25GBASER.

> diff --git a/drivers/net/ethernet/xilinx/Makefile b/drivers/net/ethernet/xilinx/Makefile
> index 7d7dc1771423e..db90e691fec58 100644
> --- a/drivers/net/ethernet/xilinx/Makefile
> +++ b/drivers/net/ethernet/xilinx/Makefile
> @@ -6,5 +6,6 @@
>  ll_temac-objs := ll_temac_main.o ll_temac_mdio.o
>  obj-$(CONFIG_XILINX_LL_TEMAC) += ll_temac.o
>  obj-$(CONFIG_XILINX_EMACLITE) += xilinx_emaclite.o
> -xilinx_emac-objs := xilinx_axienet_main.o xilinx_axienet_mdio.o
> +xilinx_emac-objs := xilinx_axienet_main.o xilinx_axienet_mdio.o \
> +		    xilinx_axienet_xxv.o
>  obj-$(CONFIG_XILINX_AXI_EMAC) += xilinx_emac.o

[Severity: Low]
This isn't a bug, but should the XILINX_AXI_EMAC Kconfig entry be updated
too? XXV support now builds under this option, but the prompt still reads:

    tristate "Xilinx 10/100/1000 AXI Ethernet support"

The help text also still says "This driver supports the 10/100/1000
Ethernet from Xilinx...". It is unchanged at the end of the series, so
nothing points someone configuring an XXV-based board at this option.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index a553150faa89b..47c84014921c8 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -801,6 +801,12 @@ static int axienet_1g_mac_init(struct net_device *ndev)
>   * Ethernet core. No separate hardware reset is done for the Axi Ethernet
>   * core.
>   *
> + * It also recomputes @max_frm_size from the current MTU and runs the
> + * MAC-specific mac_init() callback, so it is the point at which length-related
> + * MAC configuration (such as the XXV RX max-packet-length) is reprogrammed.
> + * Because it is reached from the open path, a new MTU takes effect on the next
> + * interface up.
> + *
>   * Return: 0 on success or a negative error number otherwise.
>   */
>  static int axienet_device_reset(struct net_device *ndev)

[Severity: Low]
Is the ordering in axienet_open() safe for XXV? The XXV receiver is
enabled before any RX DMA buffer is posted:

axienet_open()
    axienet_device_reset()
        axienet_setoptions(ndev, lp->options)   <- sets XXV_RCW1_RX_MASK
    phylink_start()
    axienet_init_dmaengine()                    <- RX channel and buffers

PG210 describes the XXV RX AXI4-Stream as having no tready backpressure.
If a frame arrives before the S2MM channel accepts data, could the first
RX buffer capture only the tail of that frame (ending at tlast) and pass
it up as a frame?

On the 1G core, its internal RX FIFO made this ordering safe. With XXV it
depends on the FPGA logic between the MAC and the DMA.

[ ... ]

> @@ -2788,7 +2789,9 @@ static struct phylink_pcs *axienet_mac_select_pcs(struct phylink_config *config,
>  	struct axienet_local *lp = netdev_priv(ndev);
>  
>  	if (interface == PHY_INTERFACE_MODE_1000BASEX ||
> -	    interface ==  PHY_INTERFACE_MODE_SGMII)
> +	    interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_10GBASER ||
> +	    interface == PHY_INTERFACE_MODE_25GBASER)
>  		return &lp->pcs;
>  
>  	return NULL;

[Severity: Medium]
Can this hand phylink a PCS with NULL ops on a 1G MAC?

axienet_mac_select_pcs() is shared by all MAC types. On the 1G config,
axienet_probe() sets lp->pcs.ops only for SGMII/1000BASEX, and
axienet_1g_config has no internal_pcs.

axienet_1g_phylink_set_caps() still does this for any phy_mode:

    __set_bit(lp->phy_mode, config->supported_interfaces);

So a 1G compatible node with phy-mode = "10gbase-r" or "25gbase-r" is not
rejected at probe.

With fixed-link, probe still succeeds. phylink_validate() prints
"uninitialised PCS" with a dump_stack() and returns -EINVAL, but both
phylink_create() and phylink_parse_fixedlink() ignore that result. Then
on ifup:

axienet_open()
    phylink_start()
        phylink_major_config()
            pl->pcs = &lp->pcs;
            phylink_pcs_pre_config(pl->pcs, ...)
                if (pcs && pcs->ops->pcs_pre_config)   <- pcs->ops is NULL

Before this patch, these modes returned NULL here. Should &lp->pcs only be
returned when lp->pcs.ops is set?

[ ... ]

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
> new file mode 100644
> index 0000000000000..3c204dbbf6aec
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
> @@ -0,0 +1,351 @@

[ ... ]

> +static int axienet_xxv_mac_init(struct net_device *ndev)
> +{
> +	struct axienet_local *lp = netdev_priv(ndev);
> +	int ret;
> +
> +	ret = axienet_xxv_poll_link_ready(ndev);
> +	if (ret)
> +		return ret;
> +
> +	/* Bound the MAC's RX max packet length to the posted buffer size so an
> +	 * oversized frame is truncated to a single buffer instead of spilling
> +	 * across several DMA descriptors (PG210 CONFIGURATION_RX_MTU).
> +	 */
> +	axienet_iow(lp, XXV_JUM_OFFSET,
> +		    FIELD_PREP(XXV_RX_MAX_LEN_MASK, lp->max_frm_size) |
> +		    XXV_RX_MIN_LEN_DEFAULT);

[Severity: High]
Where does XXV get the RX frame length from? axienet_10g25g_config does
not set non_dmaengine, so every XXV RX completion goes through the shared
dmaengine callback:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_dma_rx_cb() {
    ...
	if (IS_ERR(app_metadata)) {
		if (net_ratelimit())
			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
		dev_kfree_skb_any(skb);
		lp->ndev->stats.rx_dropped++;
		goto rx_submit;
	}

	/* TODO: Derive app word index programmatically */
	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
	skb_put(skb, rx_len);
    ...
}

app_metadata[LEN_APP] is APP4. Only the 1G AXI Ethernet IP fills that
word, through its RX status stream. The PG210 MAC has no status stream,
and nothing in the XXV config or binding provides one.

In xilinx_dma.c, software never writes the S2MM app words: hw->app is
copied only for DMA_MEM_TO_DEV, and segments are zeroed. For MCDMA, which
the XXV binding example uses, xilinx_dma_get_metadata_ptr() returns
&seg->hw.s2mm_status for DEV_TO_MEM, so index 4 lands on app[2] and not
on a length field.

What happens then depends on the DMA setup:

- Without xlnx,axistream-connected on the DMA, no metadata_ops are
  attached. Every frame is dropped with "Failed to get RX metadata
  pointer".

- With it, rx_len comes from a zeroed or unrelated word. Each frame
  becomes a zero-length skb and rx_bytes stays at 0.

- If that word ever holds a stale non-zero value, rx_len is not checked
  against lp->max_frm_size. Anything above the skb tailroom (up to
  0xFFFF) reaches skb_put() and hits skb_over_panic().

The DMA does report the real transfer count, via
xilinx_dma_get_residue() into result->residue, but the callback ignores
it.

The comment above says CONFIGURATION_RX_MTU keeps frames within one
buffer. However, the length passed to skb_put() never comes from the MAC.

The last patch in the series ("net: xilinx: axienet: Add statistics
support for XXV ethernet") does not change axienet_dma_rx_cb() either.
Does XXV receive work on any of the documented DMA configurations?

> +
> +	lp->options |= XAE_OPTION_FCS_STRIP;
> +	lp->options |= XAE_OPTION_FCS_INSERT;
> +
> +	return 0;
> +}

[Severity: Medium]
How are errored frames dropped on XXV? Per PG210, the XXV MAC reports
bad-FCS, length-error and truncated frames only through rx_axis_tuser at
end of packet. It still forwards those frames on the stream.

AXI DMA S2MM does not record tuser. axienet_dma_rx_cb() also checks no
per-frame error status before it calls __netif_rx().

With XAE_OPTION_FCS_STRIP set here, the FCS is gone before software
could check it. The oversized frames that ctl_rx_max_packet_len
truncates, per the comment above, would also go up as valid packets.

The 1G core drops errored frames in its own RX FIFO and raises
XAE_INT_RXRJECT, so the shared datapath never needed this check.

Does the FPGA design need a tuser-aware drop stage between the MAC and
the DMA? If so, should that be documented or detected?

[ ... ]

> +static void axienet_xxv_get_regs(struct axienet_local *lp, u32 *data)
> +{
> +	bool has_gt_status = axienet_xxv_ip_has_gt_status(lp->xxv_ip_version);
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(axienet_xxv_reg_dump_offsets); i++) {
> +		u32 off = axienet_xxv_reg_dump_offsets[i];
> +
> +		/* The GT registers only exist on the IP versions that report
> +		 * reset-done. Leave their slots zero on the others so the
> +		 * dump keeps a fixed layout.
> +		 */
> +		if (!has_gt_status && (off == XXV_GT_CTRL_OFFSET ||
> +				       off == XXV_STAT_GT_OFFSET))
> +			continue;
> +
> +		data[i] = axienet_ior(lp, off);

[Severity: Low]
Can an ethtool -d dump interfere with link reporting? This reads every
STAT_* register, including XXV_STAT_RX_STATUS_OFFSET. PG210 describes
that register's bit 0 as latched and cleared on read.
axienet_xxv_pcs_get_state() uses the same bit for the link:

	state->link = axienet_ior(lp, XXV_STAT_RX_STATUS_OFFSET) &
		      XXV_STAT_RX_STATUS_MASK;

lp->pcs.poll is true for internal_pcs. A dump taken between two phylink
polls could therefore clear a latched link-down event, and phylink would
never see the flap. STAT_RX_BLOCK_LOCK, STAT_TX_STATUS and the AN/LT/FEC
status registers are read the same way.

The skip logic is also uneven. GT_CTRL/STAT_GT are skipped on IP older
than v3.2. But STAT_CORE_SPEED is read unconditionally, and the commit
message says it exists only on 64-bit AXI4-Stream builds. The same goes
for the build-optional RS-FEC/AN/LT/1588 registers.

> +	}
> +}

[Severity: Low]
Should the dump version tell the two layouts apart? The caller reports
version 0 for every MAC type:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_ethtools_get_regs() {
    ...
	len = sizeof(u32) * lp->axienet_config->regs_n;
	regs->version = 0;
	regs->len = len;
    ...
}

After this patch, the driver produces both the 1G layout (AXIENET_REGS_N
words with the DMA registers at fixed indices) and this 46-word PG210
layout, both under version 0. That leaves userspace decoders no way to
tell which format they have.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com
