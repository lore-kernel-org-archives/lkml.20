Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802354;
	b=OAEPZ/OlYnMcMb8gSmho+ARX/UX51TRCr7y3uw6wXW0ozW0vzORKjKqXh5M3fQD/JVRN
	 wV+FvxjTWN4luzRvqCQe7efv0R4Sm+Kc9ZWDzAom7id6r/gctToF42HpIsxtNon4bBTth
	 o3lgEa4H4Es0JVE28gIQsgX8onJjBroGTecyReCeVesu5JlhYbZbNpeIdXpx9D3Hndylb
	 WjwJrr/DrDm8f3xTRi0laztJz7oiC/PrZ3V/kEvfwuib8160y+RPzEA/9k8ifwYfLyYQG
	 P+EtKoas1E4+kAa0ZUbLawO14Mc6DS16GPHHHYO/QDYbx+GJMtzbGbBnPdffB/xn1Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802354;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OgoZIslZ8ASBJ7r2dv1Kt/IA3qoVmwzLgsguUAZyJYk=;
	b=ynnaEN6kV574HDJz4qg6ZBqRQhXA+wZrEe+sQd1iUdGHuPyZojYFFlszJUXKZ85AEllc
	 a91kGKaxvJpLbpt5yU6B5rvnHoufIXSiQqinvZ2ziPqWfbZ9FCgzLhE5CTx/jMXhY9oPH
	 ao3Ks9pzHuzoAfffnwUWQ3yWrXeyP3Pv8zA2kT81mhitYuUcQs22p8yPl1qjKM3nQIKHo
	 9cFjJtsRncBsrCHEoG1DmjKGRBmONpXiKFeIE4N4xwxqeNXkadhXocA9s6HpdP9pIcUYV
	 M7Tl3p8RLTzumHk9EM0m0HVpJo36oj0byYP1GwtUa+49xzEsoo0YMlsqhhsaSCDegqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vw7NLOXA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED752606A882;
	Mon, 16 Nov 2026 04:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vw7NLOXA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5041F000CF;
	Mon, 16 Nov 2026 04:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802353;
	bh=OgoZIslZ8ASBJ7r2dv1Kt/IA3qoVmwzLgsguUAZyJYk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vw7NLOXAtbzx8pDVFwY5rq+UBMkeNrcDELgejJQDzgoa1s0Bb6daVuR6UVKntmG7v
	 QTx8sZ5AAMz0ZsnAcRYTK3ccAqXhHIsqG/dmTlLa+SXegljTffYEUQAb5Muqa4tPKZ
	 LVIOv2JJWXJnzLWBQzUfM4StH5OjMH9jcpXbWAEMqWBk6EAqPAuMDHHDTDrzdEasIJ
	 SrTHPbo7eNx9/e40JHMR/xu9OFSH5Cya4JGsq4uOOboGjHdHDJjni4+TImZYYaAcxe
	 j92uGzce95p7h3HEneQH1CtEq07gUcQV+3AA60lmIjvw9qbHqoQM49Eh0cSTLlw7tK
	 uK/tTl/R010hw==
Subject: Re: [PATCH net-next v5 6/6] net: xilinx: axienet: Add statistics
 support for XXV ethernet
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:32 +0000
Message-ID: <179480235240.3136.10661182266349624826@kernel.org>
In-Reply-To: <20261114182947.2908628-7-suraj.gupta2@amd.com>
References: <20261114182947.2908628-7-suraj.gupta2@amd.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] None of the XXV statistics readers in
  drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c latch the clear-on-…
- [Medium] The new XXV ndo_get_stats64 reader, axienet_xxv_get_stats64(),
  runs read_seqcount_begin()/read_seqcount_retry() on…
- [Low] The kernel-doc of axienet_xxv_get_rmon_stats() (xxv.c:585-586)
  says "XXV exposes aggregate RMON counters only, not per-bin histogram…
- [Low] axienet_xxv_get_stats64() treats XXV_STAT_RX_OVERSIZE as an IEEE
  802.3 frame-too-long error and folds it into rx_length_errors.
- [Low] The patch updates the @hw_stats_seqcount kernel-doc in struct
  axienet_local for XXV but leaves @stats_work saying "Work for reading…
- [Low] axienet_stop() writes TICK_REG for the final XXV statistics
  snapshot (via axienet_xxv_stats_update) right after…

--

net: xilinx: axienet: Add statistics support for XXV ethernet

This patch adds support for the clear-on-tick XXV (PG210) statistics
block. The counters are accumulated in software by the periodic stats
work and by a final snapshot in axienet_stop(). The result feeds
ndo_get_stats64() and the ethtool -S, pause, MAC and RMON callbacks,
gated on the "xlnx,has-statistics-counters" devicetree property.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> index 7468fed1416ef..10cb73bc460d2 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -520,7 +520,7 @@ struct skbuf_dma_descriptor {
>   * @reset_in_progress: Set while we are performing a reset and statistics
>   *                     counters may be invalid
>   * @hw_stats_seqcount: Sequence counter for @hw_stat_base, @hw_last_counter,
> - *                     and @reset_in_progress.
> + *                     @reset_in_progress and, on XXV, @xxv_stat_base.
>   * @stats_lock: Lock for @hw_stats_seqcount
>   * @stats_work: Work for reading the hardware statistics counters often enough
>   *              to catch overflows.

[Severity: Low]
This isn't a bug, but should the @stats_work description be updated as
well? On XXV this work is now the only latch for the clear-on-tick
counters. The new comment in axienet_refresh_stats() says:

    This work is
    what latches them between queries.

The @stats_update kernel-doc in struct axienet_config has not changed
either:

 * @stats_update: Callback to latch/accumulate the periodic MAC counters, or
 *		  NULL if the MAC has no periodic statistics counters

The new comments in axienet_refresh_stats() and axienet_stop() say
something different: a config installs the hook unconditionally, and
XAE_FEATURE_STATS decides whether the counters exist.

Could these two descriptions be updated to match?

[ ... ]

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 260755fbe465c..a046290522f4d 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -1884,6 +1903,17 @@ static int axienet_stop(struct net_device *ndev)
>  	axienet_setoptions(ndev, lp->options &
>  			   ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
>  
> +	/* Final snapshot after RX/TX is disabled, so no frames are missed.
> +	 * Gate on XAE_FEATURE_STATS rather than the stats_update hook: a config
> +	 * always installs the hook, but the counters are optional in both MACs,
> +	 * so only probe_init() knows whether they are there.
> +	 */
> +	if (lp->features & XAE_FEATURE_STATS && lp->axienet_config->stats_update) {
> +		mutex_lock(&lp->stats_lock);
> +		lp->axienet_config->stats_update(lp);
> +		mutex_unlock(&lp->stats_lock);
> +	}

[Severity: Low]
Is "no frames are missed" guaranteed here? axienet_setoptions() only
does a few posted read-modify-write MMIO accesses to clear ctl_tx_enable
and ctl_rx_enable. Nothing waits for the MAC to go idle before
axienet_xxv_stats_update() writes TICK_REG.

Suppose the MAC finishes a frame that is already in flight after the
enable is cleared. A jumbo frame takes about 7.7 us at 10G and about
3 us at 25G. Could that frame be counted into the internal accumulator
after this final tick?

On the next open, axienet_xxv_mac_init() does:

	if (lp->features & XAE_FEATURE_STATS)
		axienet_iow(lp, XXV_TICKREG_OFFSET, XXV_TICKREG_STATEN_MASK);

This latches the late count into the readable registers. The first
stats_update tick then overwrites those registers without reading them.

Would up to one frame per direction per stop then never reach
xxv_stat_base?

This depends on how PG210 behaves when the enable is deasserted, which
could not be checked from the tree.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
> index 3c204dbbf6aec..83782bfbce4ce 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c

[ ... ]

> @@ -335,6 +411,204 @@ static int axienet_10g25g_clk_init(struct axienet_local *lp)
>  	return 0;
>  }
>  
> +/**
> + * axienet_xxv_stats_update - Latch and accumulate XXV hardware counters

[ ... ]

> + * Readers copy @xxv_stat_base and do not tick. ndo_get_stats64() may run in
> + * atomic context, so it cannot take @stats_lock and tick itself. The periodic
> + * statistics work, and the final snapshot in axienet_stop(), are the latches.
> + */
> +static void axienet_xxv_stats_update(struct axienet_local *lp)
> +{

[ ... ]

> +	write_seqcount_begin(&lp->hw_stats_seqcount);
> +	for (stat = 0; stat < XXV_STAT_COUNT; stat++)
> +		lp->xxv_stat_base[stat] += counter[stat];
> +	write_seqcount_end(&lp->hw_stats_seqcount);
> +}
> +
> +/**
> + * axienet_xxv_get_stats64 - Fill rtnl_link_stats64 from XXV counters
> + * @lp: Pointer to the axienet_local structure
> + * @stats: Output rtnl_link_stats64 structure to populate
> + */
> +static void axienet_xxv_get_stats64(struct axienet_local *lp,
> +				    struct rtnl_link_stats64 *stats)
> +{
> +	unsigned int start;
> +	u64 tx_hw_errors;
> +
> +	do {
> +		start = read_seqcount_begin(&lp->hw_stats_seqcount);

[Severity: Medium]
Can this reader sleep on PREEMPT_RT? hw_stats_seqcount is a
seqcount_mutex_t bound to stats_lock in axienet_probe():

	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);

With CONFIG_PREEMPT_RT, read_seqcount_begin() on a seqcount_mutex_t
calls mutex_lock(s->lock) and then mutex_unlock() when it sees an odd
sequence. On RT the writer also stays preemptible between
write_seqcount_begin() and write_seqcount_end().

The write section in axienet_xxv_stats_update() runs with stats_lock
held, from the stats work or from axienet_stop(). A reader that
overlaps it would block on stats_lock. ndo_get_stats64 can be called
under rcu_read_lock(), for example from /proc/net/dev, where
dev_seq_start() takes rcu_read_lock():

dev_seq_show()
  dev_seq_printf_stats()
    dev_get_stats()
      axienet_get_stats64()
        axienet_xxv_get_stats64()
          read_seqcount_begin()
            mutex_lock(&lp->stats_lock)

Bonding also calls it under its stats spinlock plus RCU.

Would this trigger a "sleeping function called from invalid context"
splat on RT kernels? The kernel-doc above says ndo_get_stats64() cannot
take @stats_lock, but on RT the seqcount takes it anyway.

The 1G reader axienet_1g_get_stats64() already uses the same pattern.
This patch adds a new atomic-context reader whose design assumes that
readers never take stats_lock.

[ ... ]

> +static void axienet_xxv_get_ethtool_stats(struct axienet_local *lp, u64 *data)
> +{
> +	unsigned int i, start;
> +
> +	do {
> +		start = read_seqcount_begin(&lp->hw_stats_seqcount);
> +		for (i = 0; i < ARRAY_SIZE(axienet_xxv_priv_stats); i++)
> +			data[i] = lp->xxv_stat_base[axienet_xxv_priv_stats[i]];
> +	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
> +}

[Severity: Medium]
Will ethtool -S on XXV return values that are at least one work
interval old? This reader only copies lp->xxv_stat_base. So do
axienet_xxv_get_pause_stats(), axienet_xxv_get_eth_mac_stats(),
axienet_xxv_get_rmon_stats() and axienet_xxv_get_stats64().

The base only changes in axienet_xxv_stats_update(), which is called
from axienet_refresh_stats() and axienet_stop(). The work is set up
with INIT_DEFERRABLE_WORK() and re-armed every 13 * HZ, so on an idle
CPU the lag can go well past 13 seconds. After a traffic burst, the
ethtool -S totals and the pause, eth-mac and RMON groups would not
change until the work runs.

The commit message explains why ndo_get_stats64() cannot tick. The
ethtool callbacks, though, run in process context under RTNL.

Could they take stats_lock and call stats_update so they return
current values?

For comparison, the 1G readers go through axienet_stat(), which adds
the live register to the software base:

	counter = axienet_ior(lp, XAE_STATS_OFFSET + stat * 8);
	return lp->hw_stat_base[stat] + (counter - lp->hw_last_counter[stat]);

so the 1G ethtool and stats64 values are current.

In ndo_get_stats64 the software rx/tx packet and byte counters are live,
while the XXV hardware error and multicast counters come from the
cached base. A single snapshot therefore mixes values from different
points in time.

[ ... ]

> +		mac_stats->InRangeLengthErrors =
> +			lp->xxv_stat_base[XXV_STAT_RX_INRANGEERR];
> +	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
> +}

[Severity: Low]
Should FrameTooLongErrors be filled in here too? axienet_xxv_get_stats64()
treats XXV_STAT_RX_OVERSIZE as a frame-too-long error and folds it into
rx_length_errors:

		/* Both in-range length errors and frame-too-long (oversize)
		 * frames are IEEE 802.3 length errors, so fold them together

axienet_xxv_get_rmon_stats() also reports it as oversize_pkts.

struct ethtool_eth_mac_stats has a FrameTooLongErrors field, but it is
never set here. As a result, ethtool -S <dev> --groups eth-mac shows it
as unsupported, even though the driver already accumulates the counter.

> +
> +/**
> + * axienet_xxv_get_rmon_stats - Fill RMON statistics and histogram ranges
> + * @lp: Pointer to the axienet_local structure
> + * @rmon_stats: Output ethtool_rmon_stats structure to populate
> + * @ranges: Set to NULL; XXV exposes aggregate RMON counters only, not
> + *          per-bin histogram ranges.
> + */

[ ... ]

> +	/* XXV currently exposes only aggregate RMON counters, not per-bin
> +	 * histogram buckets. Keep ranges NULL until histogram bins are wired.
> +	 */
> +	*ranges = NULL;
> +}

[Severity: Low]
Is the kernel-doc accurate about the hardware? The register map this
patch adds in xilinx_axienet_xxv.h has a gap here:

#define XXV_STAT_RX_TOTAL_GOOD_BYTES_OFFSET	0x00000820
#define XXV_STAT_RX_UNDERSIZE_OFFSET		0x00000898

That gap is 14 skipped 8-byte counter slots, 0x828 to 0x890. There is a
similar gap here:

#define XXV_STAT_TX_TOTAL_GOOD_BYTES_OFFSET	0x00000718
#define XXV_STAT_TX_BAD_FCS_OFFSET		0x000007B8

These look like the PG210 per-size-bin packet counters (64, 65-127, ...
8192-9215 bytes, plus large and small). This could not be checked
against the PG210 datasheet from the tree. The inline comment
("currently ... until histogram bins are wired") reads like a driver
limitation rather than missing hardware.

The commit message says the RMON statistics come from this path. It
does not mention that the RX and TX histograms are left out.

Could the kernel-doc and the commit message say that the histogram
counters exist but are not wired up yet?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com
