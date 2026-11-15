Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760960;
	b=Pf+DVRIHlBw8z5lLGv4H6Gd6YGcZWlCaNUUO4D/KRhhpB1b1IX0OrZ+zsEnuFL3muP5j
	 NkRYgvGYAJc2r+gALjZ44ltdiW7wU1E9S3xHEIfy20M1sB834SaF5SE/P9NlTac58FpNQ
	 uS7OTzRQxfEF6sz4+jIc1djoyGi9n/LaxRERIqNne0O8PG8qIeTP7+eddETJFx3bm1MeS
	 NtVjJODvy4obr/sPEeXaiP3wDiTT+emm2KyIGR1kfsSOYlaijoiy66wJRmkxbWfs4k2ol
	 H4QcfkPialMzp0DlJ7/LVgvt9pBcAMB3Ptm5HK+ca/x2nMEsWbz4Z3RXGhdNZd0SaPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760960;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gWeY517Ke0uGVHUv0TVgDQAs3UNrX8FLyLwTiu4EloA=;
	b=1Mm/AGrlqBAK1kjSedPWwC8KlnmYdCWxyZFt55OHHkxi0ZkXMIDE8cxX+CX10deH6yZR
	 0ACAqg9WxYoCNoZJhRJxZFEhk5I7bxGtObVh2Q4Dk2XA5piqu8psWgJLSuF4NzVNPpyQi
	 3RQtPzAFubiCFODgdErr9qGimeX9dSGqx5hMbgsb3jjI7BpdFU3Y/jcOblCZLuTxj9FS9
	 KglX4Lknsar1EVEZLVCc6eer3QliW9+elcP8tBUhV+SvmeHFOxjIGlRYiq8k4wxz0MkNY
	 XeUbWjZT8R+Y2VrBKdfNoL5BTdrLrQ2Qea/waZSILuqhfItbS8AdDCZUdePDW6TcKVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jeQahA+l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF7606A337;
	Sun, 15 Nov 2026 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jeQahA+l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80331F000C8;
	Sun, 15 Nov 2026 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794760960;
	bh=gWeY517Ke0uGVHUv0TVgDQAs3UNrX8FLyLwTiu4EloA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jeQahA+lxYYyOfLeiHudF2Q59ebsIsygaAoe87xAPFPiR8y9ZQdQ4HvmHKwUUGeUe
	 eXXApPZ0heuigybhyIeqcel8MWbbiYvI6QEkFuGwCAGEr4jDOlx6DQww8iFLbnkQxr
	 +s8S1NjPV9lxz7p4hAbtNt88ijBC/odZvvQSQG9Y84XfCOHTOiwc6XusT9OGi4F1bj
	 SCIGCKB0sL7L2AeCin55wPaktjzXmTzWp3q8zF0EIyDalfaINgmvtktKwVGcrx7sOw
	 433t4XXH9SiO21XqE3yxXAWeUgdO8AiDWY3QRBUdDGFyPujVvD8WbWJ2InYKOwnAJG
	 ltZ4kagFLcjQA==
Subject: Re: [PATCH net-next v17 4/4] net: dsa: lan9645x: add basic dsa driver
 for LAN9645X
From: netdev-bot+sashiko@kernel.org
To: jensemil.schulzostergaard@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 woojung.huh@microchip.com, linux@armlinux.org.uk,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, edumazet@kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Sun, 15 Nov 2026 16:42:38 +0000
Message-ID: <179476095835.2199510.1283236817441472762@kernel.org>
In-Reply-To: <20261111-dsa_lan9645x_switch_driver_base-v17-4-83a471c5bddb@microchip.com>
References: <20261111-dsa_lan9645x_switch_driver_base-v17-4-83a471c5bddb@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The driver never explicitly initializes the analyzer MAC table
  or VLAN table.
- [Low] Several comments and register writes in this patch describe
  features the driver does not have.
- [Low] In lan9645x_phylink_mac_link_up() (lan9645x_phylink.c), the
  comment above the DEV_CLOCK_CFG write gives the…
- [Low] For the NPI port, lan9645x_port_set_maxlen() (lan9645x_port.c)
  adds both LAN9645X_IFH_LEN_BYTES (28) and LAN9645X_LONG_PREFIX_LEN…

--

net: dsa: lan9645x: add basic dsa driver for LAN9645X

This adds a basic DSA driver for the Microchip LAN9645x switch. The driver
gets named regmaps from a parent device. All ports run as standalone ports,
with phylink integration for the internal CuPHYs on ports 0-4 and RGMII on
ports 7-8. SerDes modes are left for follow-up patches.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> new file mode 100644
> index 0000000000000..0eee05034458b
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> @@ -0,0 +1,464 @@

[ ... ]

> +static int lan9645x_reset_switch(struct lan9645x *lan9645x)
> +{
> +	u32 rst_cfg, val = 0;
> +	int err;
> +
> +	/* The parent must reset the whole chip before instantiating its
> +	 * children, so the switch core is disabled when we get here. The
> +	 * sequence below must not run more than once: initializing the
> +	 * memories on a running core corrupts pointers inside the queue
> +	 * system, which eventually fills up and stops passing traffic. If the
> +	 * core is already enabled the chip was not reset, so skip it.
> +	 */
> +	err = regmap_read(lan_rmap(lan9645x, SYS_RESET_CFG),
> +			  lan_rel_addr(SYS_RESET_CFG), &rst_cfg);
> +	if (err)
> +		return err;
> +
> +	if (SYS_RESET_CFG_CORE_ENA_GET(rst_cfg))
> +		return 0;

[Severity: Medium]

If CORE_ENA is already set, this returns before SYS_RAM_INIT. That is the
only memory or table initialization in the driver. On this path, is anything
clearing the analyzer MAC table and the VLAN table?

ANA_MACACCESS and ANA_VLANACCESS are defined in lan9645x_regs.h, but no
driver file uses them. lan966x runs the same RAM_INIT sequence and then
issues MACACCESS_CMD_INIT (lan966x_mac.c) and VLANACCESS_CMD_INIT
(lan966x_vlan.c) as separate steps.

This path can be reached after kexec, because lan9645x_shutdown() only
calls dsa_switch_shutdown() and leaves the core enabled with the tables
populated. It can also be reached with a bootloader that leaves the switch
running.

The driver depends on flooding to deliver host traffic: learning is
disabled, PGID_SRC + p is 0, and PGID_UC/MC/BC include the CPU port
module. Suppose the analyzer behaves like ocelot and lan966x, and a stale
unicast entry points at another front port. Would DEST resolve to that
port, PGID_SRC then mask it to nothing, and the frame be dropped before
the CPU sees it?

Dynamic entries would age out through ANA_AUTOAGE after about 300 seconds.
Static entries would never age out.

lan9645x_setup() also sets ANA_PGID_CFG.OBEY_VLAN on every destination
PGID. Does the CPU copy then depend on inherited VLAN table contents, such
as VLAN_PGID_CPU_DIS, that the driver never programs?

[ ... ]

> +static int lan9645x_setup(struct dsa_switch *ds)
> +{

[ ... ]

> +	/* Link Aggregation Mode: NETDEV_LAG_HASH_L2 */
> +	lan_wr(ANA_AGGR_CFG_AC_SMAC_ENA |
> +	       ANA_AGGR_CFG_AC_DMAC_ENA,
> +	       lan9645x, ANA_AGGR_CFG);

[ ... ]

> +	/* Disable learning for frames discarded by VLAN ingress filtering */
> +	lan_rmw(ANA_ADVLEARN_VLAN_CHK_SET(1),
> +		ANA_ADVLEARN_VLAN_CHK,
> +		lan9645x, ANA_ADVLEARN);

[ ... ]

> +	/* Setup flooding PGIDs for IPv4/IPv6 multicast. Control and dataplane
> +	 * use the same masks. Control frames are redirected to CPU, and
> +	 * the network stack is responsible for forwarding these.
> +	 * The dataplane is forwarding according to the offloaded MDB entries.
> +	 */

[Severity: Low]

This isn't a bug, but this comment says control frames are redirected to
the CPU and the dataplane forwards according to offloaded MDB entries. Does
the driver set up either of these in this patch?

Nothing sets ANA_CPU_FWD_CFG_IGMP_REDIR_ENA or
ANA_CPU_FWD_CFG_MLD_REDIR_ENA. lan9645x_switch_ops also has no port_mdb_add
or port_mdb_del.

Some other writes look left over from functionality the v16 changelog
says was dropped:

  - The ANA_AGGR_CFG write under "Link Aggregation Mode:
    NETDEV_LAG_HASH_L2". There are no LAG ops.

  - The ANA_ADVLEARN VLAN_CHK write. lan9645x_port_setup() disables
    learning on every port with ANA_PORT_CFG_LEARN_ENA_SET(0).

  - ANA_PGID(PGID_CPU) in lan9645x_port_cpu_init(). It is written once and
    never used as a destination.

The comment in include/linux/dsa/lan9645x.h, added by the tag driver patch
earlier in this series, has the same mismatch:

  /* Chip has 8 cpu queues. The cpu queues used by a frame are passed as a mask in
   * the IFH on extraction. We use this to avoid classifying BPDU, IGMP and MLD
   * frames in the tag driver.
   */

The switch driver only programs LAN9645X_CPUQ_TRAP, for BPDUs through
ANA_CPUQ_8021_CFG. LAN9645X_CPUQ_COPY and the IGMP/MLD queues in
ANA_CPUQ_CFG are never configured.

Could these comments and writes be dropped or changed to match what the
driver does now?

[ ... ]

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
> new file mode 100644
> index 0000000000000..7ca4a67d154e9
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
> @@ -0,0 +1,315 @@

[ ... ]

> +static void lan9645x_phylink_mac_link_up(struct phylink_config *config,
> +					 struct phy_device *phydev,
> +					 unsigned int link_an_mode,
> +					 phy_interface_t interface, int speed,
> +					 int duplex, bool tx_pause,
> +					 bool rx_pause)
> +{

[ ... ]

> +	fc_spd = lan9645x_speed_fc_enc(gspeed);

[ ... ]

> +	/* Take out the clock from reset. Note this write will set all these
> +	 * fields to zero:

[ ... ]

> +	 * This linkspeed field has a slightly different encoding from others:
> +	 *
> +	 * - 0 is no-link
> +	 * - 1 is both 2500/1000
> +	 * - 2 is 100mbit
> +	 * - 3 is 10mbit
> +	 *
> +	 */
> +	lan_wr(DEV_CLOCK_CFG_LINK_SPEED_SET(fc_spd),
> +	       lan9645x,
> +	       DEV_CLOCK_CFG(p->chip_port));

[Severity: Low]

fc_spd comes from lan9645x_speed_fc_enc(). That helper is documented as
the PFC_CFG.FC_LINK_SPEED encoding, and it maps 2500 to 0:

lan9645x_main.h:lan9645x_speed_fc_enc() {
	...
	case LAN9645X_SPEED_2500:
		return 0;
	...
}

The comment just above says this field uses a different encoding, where
0 means no-link. Should DEV_CLOCK_CFG.LINK_SPEED have its own encoding
instead of reusing fc_spd?

For 10/100/1000 the two encodings agree. SPEED_2500 cannot reach this code
today, because lan9645x_phylink_get_caps() does not advertise MAC_2500FD
and the speed switch returns early for anything else.

When 2500BASE-X support is added, would DEV_CLOCK_CFG be programmed as
no-link? For reference, lan966x uses one encoding for both registers, with
2500 mapped to 1.

[ ... ]

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
> new file mode 100644
> index 0000000000000..4d2d922bacba6
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
> @@ -0,0 +1,166 @@

[ ... ]

> +/* VLAN tag overhead is handled by DEV_MAC_TAGS_CFG */
> +int lan9645x_port_set_maxlen(struct lan9645x *lan9645x, int port, size_t sdu)
> +{
> +	struct lan9645x_port *p = lan9645x_to_port(lan9645x, port);
> +	int maxlen = sdu + ETH_HLEN + ETH_FCS_LEN;
> +
> +	if (port == lan9645x->npi) {
> +		maxlen += LAN9645X_IFH_LEN_BYTES;
> +		maxlen += LAN9645X_LONG_PREFIX_LEN;
> +	}

[Severity: Low]

Is LAN9645X_LONG_PREFIX_LEN needed here? lan9645x_npi_port_init()
configures injection with no prefix:

	lan_rmw(SYS_PORT_MODE_INCL_XTR_HDR_SET(LAN9645X_TAG_PREFIX_LONG) |
		SYS_PORT_MODE_INCL_INJ_HDR_SET(LAN9645X_TAG_PREFIX_NONE),

lan9645x_xmit() in the tag driver only pushes the 28-byte IFH. The long
prefix is only used on extraction.

ocelot_port_set_maxlen() sizes the NPI MAXLEN from the injection prefix
(npi_inj_prefix). If DEV_MAC_MAXLEN_CFG works the same way on this chip,
the NPI port accepts frames 16 bytes longer than needed. The pause
watermarks derived from 4 * maxlen and 6 * maxlen would also be slightly
larger than intended.

If MAXLEN here also limits frames sent with the extraction header, could a
comment say why the extraction prefix is counted?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-dsa_lan9645x_switch_driver_base-v17-0-83a471c5bddb%40microchip.com
