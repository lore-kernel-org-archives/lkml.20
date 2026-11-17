Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927919;
	b=Dwu/rChkgWmE8NhmVNvmemjuzFjzImBcYpxLAVLbH7Kr7V9Pt4xiKRW661bzLoL7lwUK
	 YKqGRxlu/3AiXgD7LVFoU39OGUQjATOs9v0ZsM6VIaIG6LT0AmexSOBkdxf+Boz9D9a9M
	 PzcnqV5XgnPiHAi/7Y6DgrkZH3TycKYECZKF6lGc1dLBzRv6KpHBN2eHbJrKFPKS9RkE/
	 Krzivignlb2uZxYY37xPJvxM9tL2aufExUmXbQR/kuJaGNrEpOHYSCLlz8gXfO1VY0tK8
	 4JvrrirutX/RNNit35+DWiyuePbZuyhD2cZyqa1BbrW1P5ab44L99exETehyrhB5mJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927919;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PYP4pS2oYWchUxum2IV/ygrscoITw1US0wxQ3Iyq61Q=;
	b=P2zU2u1CpAMFBRX0W+fppm8msYbU7IhC7cEVtL9omPhOe3nVmL0Q4QG1eWcTY/JUVwhx
	 u0nFTq+ZBUhaThUjuF4SGTHJ0O42vGuXnLFRkKYl1BH+Fg3FNViDNYAq3XXDP/TXXJpaA
	 qYVJ84pWVIlweNNvPmtO/mzmG5XIobpZuOZ9Ymvr/SMcWGtpS+eTYCj7MHjOi6D9Vuf6y
	 Oc7SgRqez+VQjX42AQA7nv9l5T55+cLQt7YqrzKvoeaPn6urIIYfzasIJzFyV7ZcB4C/k
	 Vm00iqVp71bCflRCP88Cs54Br+onjmZ0/ymp3jwquw9XBh0wpa65VZrSQHtuUDlhrUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GuDVO4cx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8772606A31C;
	Tue, 17 Nov 2026 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GuDVO4cx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67931F000C4;
	Tue, 17 Nov 2026 15:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927919;
	bh=PYP4pS2oYWchUxum2IV/ygrscoITw1US0wxQ3Iyq61Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GuDVO4cxHXZmPGgM6hpdCWPz4ZGkR3Bb6lfrkz53yHTq7PGu4zNqi3XexNu52mr2q
	 NF2aJIbYCYD6YOCZ6E8TtcWxrBrzdnkSLoDpxfGN2W+6X+NiMibpfyuDYh/o6dk7F4
	 0VUml8mJuX0KQqBE0F/ITeB79ps2B6PLJDL2DLeoLTHr/zir+TNOeOPCXzkWjCrFaJ
	 OwpMBQSBGyElTlPJogqw96/eN5mXauTxPgv1mrViVekmGN8mRnMF1DlgHzyhM77meC
	 6fPZ3Zt/uoCrTM7NfjO+LYODOZQo7EBE5GfjnTcXftNWUR5G4YVtOp3EfY3mZGlba/
	 8Dtul7jQG269w==
Subject: Re: [PATCH net-next v6 3/3] net: ti: icssm-prueth: Support duplicate
 HW offload feature for HSR and PRP
From: netdev-bot+sashiko@kernel.org
To: saivarun@couthit.com
Cc: danishanwar@ti.com, parvathi@couthit.com, rogerq@kernel.org,
 pmohan@couthit.com, vadim.fedorenko@linux.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 afd@ti.com, basharath@couthit.com, arnd@arndb.de, haokexin@gmail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratheesh@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, j-rameshbabu@ti.com, m-malladi@ti.com,
 rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Date: Tue, 17 Nov 2026 15:05:17 +0000
Message-ID: <179492791736.3136.18287944378565620466@kernel.org>
In-Reply-To: <20261113143127.282466-4-saivarun@couthit.com>
References: <20261113143127.282466-4-saivarun@couthit.com>
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

Thank you for your contribution! Sashiko AI review found 9 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch changes the HSR/PRP driver/firmware contract but
  keeps the same firmware file names and adds no version or capability…
- [Medium] In PRP mode with duplicate offload, icssm_prueth_tx_enqueue()
  treats a frame as redundancy-tagged (sets PRUETH_BD_LAN_INFO_MASK and…
- [Medium] The full/empty check on the new shared HSR/PRP TX ring is off
  by one.
- [Medium] In LRE mode, icssm_prueth_tx_enqueue() classifies the frame
  through skb_mac_header(skb) (`ethhdr = (struct ethhdr…
- [Low] The patch contains several behavioural changes that the commit
  message does not mention.
- [Low] The BD layout comment in icssm_switch.h still documents bits
  '8..12 Block_length number of valid bytes in this specific block'.
- [Low] The new LRE queue tables describe the same rings with different
  size constants.
- [Low] icssm_emac_ndo_start_xmit() takes the TX queue lock with
  spin_lock_irqsave() around the whole of icssm_prueth_tx_enqueue(),…
- [Low] The patch now zeroes consumed host RX BDs only when
  PRUETH_IS_SWITCH(prueth), so PRP loses the stale-BD safeguard as well…

--

net: ti: icssm-prueth: Support duplicate HW offload feature for HSR and PRP

This commit adds HSR/PRP duplicate offload. The driver writes each TX
frame once into a shared OCMC queue, both PRU ports consume it, and
NETIF_F_HW_HSR_DUP is advertised together with the TAG_RM and FWD
features. On RX, a new HostRecv BD bit selects which HSR duplicate goes
to the stack, and the driver strips the HSR tag while copying. The patch
depends on updated HSR/PRP PRU firmware that keeps the same file names.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index 0536b0965c222..3ee44fdffcb1f 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

[ ... ]

> @@ -608,6 +641,34 @@ static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
>  		free_blocks = buffer_desc_count;
>  	}
>  
> +	/* Fetch queue state for the second LRE port */
> +	if (prueth_is_lre(prueth)) {

[ ... ]

> +		if (write_block > read_block_other_port) {
> +			free_blocks_other_port = buffer_desc_count -
> +						 write_block;
> +			free_blocks_other_port += read_block_other_port;
> +		} else if (write_block < read_block_other_port) {
> +			free_blocks_other_port = read_block_other_port -
> +						 write_block;
> +		} else {
> +			free_blocks_other_port = buffer_desc_count;
> +		}
> +
> +		if (free_blocks_other_port < free_blocks)
> +			free_blocks = free_blocks_other_port;
> +	}
>  	pkt_block_size = DIV_ROUND_UP(pktlen, ICSS_BLOCK_SIZE);
>  	if (pkt_block_size > free_blocks) /* out of queue space */
>  		return -ENOBUFS;

[Severity: Medium]
Can this fill the shared ring exactly, so that a full ring looks the same
as an empty one?

When write_block equals the peer's read block, the whole ring counts as
free. A frame is rejected only when pkt_block_size > free_blocks. So a
frame whose block count equals min(free_blocks, free_blocks_other_port) is
accepted, and update_block then lands on the lagging consumer's read
block.

The same update_wr_ptr is then written to both descriptors further down:

    writew(update_wr_ptr, &queue_desc->wr_ptr);
    ...
    if (prueth_is_lre(prueth))
        writew(update_wr_ptr, &queue_desc_other_port->wr_ptr);

The lagging PRU would then see wr_ptr == rd_ptr and treat its backlog as
empty. On the next xmit, free_blocks_other_port becomes buffer_desc_count
again. The driver could then overwrite OCMC blocks holding frames that PRU
has not sent yet, and those frames were already counted in tx_packets.

Would rejecting when pkt_block_size >= free_blocks, so one block always
stays unused, avoid this? The own-port check had the same off-by-one
before this patch. The second consumer on the shared ring is new here.

> @@ -657,6 +718,40 @@ static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
>  	if (PRUETH_IS_HSR(prueth))
>  		wr_buf_desc |= BIT(PRUETH_BD_HSR_FRAME_SHIFT);
>  
> +	if (prueth_is_lre(prueth)) {
> +		/* LRE slave ports are driven only by the HSR/PRP master (no XDP
> +		 * TX), so the MAC header is always set.
> +		 */
> +		ethhdr = (struct ethhdr *)skb_mac_header(skb);
> +		proto = ethhdr->h_proto;

[Severity: Medium]
Is the MAC header always set here? A CAP_NET_RAW user can bind an AF_XDP
socket in copy mode to a slave port, which gives this path:

xsk_generic_xmit()
  __dev_direct_xmit()
    netdev_start_xmit()
      icssm_emac_ndo_start_xmit()
        icssm_prueth_tx_enqueue()
          skb_mac_header(skb)

xsk_build_skb() never sets the MAC header. __dev_queue_xmit() calls
skb_reset_mac_header(), but __dev_direct_xmit() and validate_xmit_skb()
do not. skb->mac_header would still be (u16)~0, so skb_mac_header()
returns skb->head + 0xffff.

Would this read h_proto about 64KB past the skb head, and then use that
garbage value to choose the LAN A/LAN B/RED BD bits?

The rest of the function copies from skb->data, which has at least 60
linear bytes after eth_skb_pad(). Could the ethertype be read from
skb->data instead?

> +
> +		if (proto == htons(ETH_P_8021Q)) {
> +			vlan_hdr = (struct vlan_ethhdr *)ethhdr;
> +			proto = vlan_hdr->h_vlan_encapsulated_proto;
> +		}
> +
> +		/* Check if the SKB has HSR tag */
> +		if (PRUETH_IS_HSR(prueth) && proto == htons(ETH_P_HSR)) {
> +			/* Enable flags to duplicate transmission in firmware */
> +			wr_buf_desc |= PRUETH_BD_LAN_INFO_MASK;
> +			wr_buf_desc |= PRUETH_BD_RED_PKT_MASK;
> +		} else if (PRUETH_IS_PRP(prueth)) {
> +			/* Check if the SKB has PRP tag */
> +			prp_ethtype = get_unaligned_be16(skb_tail_pointer(skb) -
> +							 ETH_TLEN);
> +
> +			if (prp_ethtype == ETH_P_PRP) {
> +				wr_buf_desc |= PRUETH_BD_LAN_INFO_MASK;
> +				wr_buf_desc |= PRUETH_BD_RED_PKT_MASK;

[Severity: Medium]
Is the 2-byte suffix check enough to identify an RCT? The HSR core checks
both the suffix and the LSDU size:

net/hsr/hsr_forward.c:prp_fill_frame_info() {
    ...
    if (rct &&
        prp_check_lsdu_size(skb, rct, frame->is_supervision)) {
    ...
}

The PRP master always adds a correct RCT through prp_fill_rct(). Untagged
frames on a slave therefore come from direct transmission on the slave
netdev, for example AF_PACKET. If such a frame's payload happens to end
in 0x88FB, it would be marked for both LANs and sent on the LAN it was not
meant for.

If the firmware rewrites the RCT LAN-ID for the second copy, could it
also change real payload bytes of such a frame?

[ ... ]

> @@ -681,8 +780,10 @@ void icssm_parse_packet_info(struct prueth *prueth, u32 buffer_descriptor,
>  	else
>  		pkt_info->start_offset = false;
>  
> -	pkt_info->port = (buffer_descriptor & PRUETH_BD_PORT_MASK) >>
> -			 PRUETH_BD_PORT_SHIFT;
> +	/* Flag from BD to indicate packet is valid for HOST or not. */
> +	pkt_info->host_recv_flag = !!(buffer_descriptor &
> +				      PRUETH_BD_HOST_RECV_MASK);
> +

[ ... ]

> @@ -742,11 +847,36 @@ int icssm_emac_rx_packet(struct prueth_emac *emac, u16 *bd_rd_ptr,

[ ... ]

> -	/* Exclude the HSR tag bytes already stripped by firmware, if any. */
> -	actual_pkt_len = pkt_info->length - start_offset;
> +	if (PRUETH_IS_HSR(emac->prueth)) {
> +		if (!pkt_info->host_recv_flag)
> +			return 0;

[Severity: Medium]
What happens here when an older HSR/PRP firmware image is loaded? The
commit message says:

  The firmware file names are unchanged.
  With older HSR/PRP firmware images, HSR and PRP offload modes are not
  functional.

icssm_prueth_sw_boot_prus() still loads fw_name[prueth->eth_type], for
example ti-pruss/am57xx-pru0-pruhsr-fw.elf. The only revision information
is the static per-SoC fw_rev in the match data, and nothing reads back
from the running PRU to confirm the new ABI.

The earlier patch in this series that added HSR/PRP offload was written
against the previous firmware ABI under these same file names. So images
with these names and the old ABI exist. That also makes the ABI change
inside the series a bisect hazard.

With such an image:

- this check silently drops every HSR frame whose BD bit 10 is clear,
  and no counter is incremented
- the frame start is parsed as an unshifted MAC/VLAN/ethertype layout
- on TX, both ports' wr_ptrs advance over one shared buffer, with LAN
  bits the old firmware does not understand

icssm_prueth_sw_emac_config() and icssm_prueth_lre_port_config() write
the new queue tables anyway. Could the driver detect the firmware
capability and refuse LRE offload, rather than running incorrectly with
no error?

[ ... ]

> @@ -1313,17 +1452,31 @@ static enum netdev_tx icssm_emac_ndo_start_xmit(struct sk_buff *skb,
>  						struct net_device *ndev)
>  {
>  	struct prueth_emac *emac = netdev_priv(ndev);
> +	/* Spinlock for Tx Queues */
> +	spinlock_t *lock_queue;
> +	unsigned long flags;
>  	int ret;
>  	u16 qid;
>  
>  	qid = icssm_prueth_get_tx_queue_id(emac->prueth, skb);
> +	/* Select the TX queue spin lock for this queue ID */
> +	if (prueth_is_lre(emac->prueth))
> +		lock_queue = &emac->prueth->lre_host_queue_lock[qid - 2];
> +	else
> +		lock_queue = &emac->host_queue_lock[qid - 2];
> +
> +	if (eth_skb_pad(skb)) {
> +		if (netif_msg_tx_err(emac) && net_ratelimit())
> +			netdev_err(ndev, "packet pad failed\n");
> +		atomic64_inc(&emac->stats.tx_dropped);
> +		return NETDEV_TX_OK;
> +	}
> +
> +	spin_lock_irqsave(lock_queue, flags);
>  	ret = icssm_prueth_tx_enqueue(emac, skb, qid);
> -	if (ret) {
> -		if (ret != -ENOBUFS && netif_msg_tx_err(emac) &&
> -		    net_ratelimit())
> -			netdev_err(ndev, "packet queue failed: %d\n", ret);
> +	spin_unlock_irqrestore(lock_queue, flags);
> +	if (ret)
>  		goto fail_tx;
> -	}

[Severity: Low]
Does this need to disable interrupts? The lock is only taken here, and
icssm_prueth_tx_enqueue() has no other caller. Neither
icssm_emac_tx_timer_callback() nor any IRQ handler takes host_queue_lock
or lre_host_queue_lock.

With irqsave, hard IRQs stay off while up to about 1.5KB is copied into
uncached OCMC, plus several MMIO accesses. xmit already runs with BH
disabled, so would plain spin_lock() be enough?

In EMAC and switch modes, the per-emac host_queue_lock also looks
redundant. The driver is not LLTX and has a single TX queue, so
HARD_TX_LOCK already serializes xmit per netdev. The shared
lre_host_queue_lock does look necessary in LRE mode, since two netdevs
write the shared queue.

[ ... ]

> @@ -1338,10 +1491,6 @@ static enum netdev_tx icssm_emac_ndo_start_xmit(struct sk_buff *skb,
>  			      us_to_ktime(HR_TIMER_TX_DELAY_US),
>  			      HRTIMER_MODE_REL_PINNED);
>  		ret = NETDEV_TX_BUSY;
> -	} else {
> -		/* error */
> -		atomic64_inc(&emac->stats.tx_dropped);
> -		ret = NET_XMIT_DROP;
>  	}
>  
>  	return ret;

[Severity: Low]
This isn't a bug, but the commit message only covers the dup offload, the
PRP RCT check, the feature coupling and HostRecv. These other changes in
the patch are not mentioned:

- the TX locking above also applies to dual-EMAC and switch modes
- eth_skb_pad() moves from icssm_prueth_tx_enqueue() into
  icssm_emac_ndo_start_xmit()
- the "packet queue failed" print is removed
- the tx_dropped / NET_XMIT_DROP branch above is gone, so a future
  non-ENOBUFS error from icssm_prueth_tx_enqueue() would be returned
  from ndo_start_xmit as a raw errno
- icssm_prueth_common_emac_rx_packets() stops zeroing consumed BDs for
  HSR and PRP
- port MAC programming moves from icssm_prueth_sw_port_config() to
  icssm_prueth_sw_emac_config() and now runs on every call
- a new TX queue memory map is added (QUEUE_3/4_TXOPT_SIZE and the new
  OCMC and shared RAM offsets)

Could these be described in the commit message, or split out into
separate patches?

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> index 992fadc1521f9..df749ca0a7b1b 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_common.c
> @@ -177,16 +177,17 @@ static int icssm_prueth_common_emac_rx_packets(struct prueth_emac *emac,
>  			used++;
>  		}
>  
> -		/* Zero the BD after consuming it, a misaligned rd_ptr
> -		 * would otherwise mistake stale data for a valid incoming
> -		 * frame.
> +		/* Leave the BD intact after reading. Firmware reuses it to
> +		 * forward the frame to the second LRE port.
>  		 */
>  		if (port == 0) {
> -			writel(0, shared_ram + bd_rd_ptr);
> +			if (PRUETH_IS_SWITCH(prueth))
> +				writel(0, shared_ram + bd_rd_ptr);

[Severity: Low]
Should this exception apply only to HSR? The new comment's reason,
firmware reusing the BD to forward the frame to the second LRE port,
describes HSR ring forwarding. PRP does no port-to-port forwarding:
prp_drop_frame() and prp_is_lan_dup() in the HSR core forbid LAN A <->
LAN B forwarding.

The old comment covered the misaligned rd_ptr case. A zeroed BD fails
the EMAC_MIN_PKTLEN check, and rd_ptr is resynced to wr_ptr. Without the
zeroing in PRP mode, a stale BD with a plausible length would be
processed and rd_ptr advanced by a stale amount.

Would skipping the writel(0) only when PRUETH_IS_HSR(prueth) keep that
safeguard for PRP?

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c
> index 9d67fc7c23acc..7bc65b2901cbb 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c
> @@ -199,6 +199,189 @@ static const struct prueth_queue_info rx_queue_infos[][NUM_QUEUES] = {

[ ... ]

> +	[PRUETH_PORT_QUEUE_MII0] = {
> +		[PRUETH_QUEUE1] = {
> +			P0_Q3_BUFFER_OFFSET,
> +			P0_Q3_BUFFER_OFFSET +
> +				((HOST_QUEUE_3_SIZE - 1) * ICSS_BLOCK_SIZE),
> +			P0_Q3_BD_OFFSET,
> +			P0_Q3_BD_OFFSET + ((HOST_QUEUE_1_SIZE - 1) * BD_SIZE),
> +		},
> +		[PRUETH_QUEUE2] = {
> +			P0_Q4_BUFFER_OFFSET,
> +			P0_Q4_BUFFER_OFFSET +
> +				((HOST_QUEUE_4_SIZE - 1) * ICSS_BLOCK_SIZE),
> +			P0_Q4_BD_OFFSET,
> +			P0_Q4_BD_OFFSET + ((HOST_QUEUE_2_SIZE - 1) * BD_SIZE),
> +		},

[Severity: Low]
This isn't a bug today, but should buffer_desc_end here use
HOST_QUEUE_3_SIZE and HOST_QUEUE_4_SIZE? Each entry uses HOST_QUEUE_3/4
for the buffer end but HOST_QUEUE_1/2 for the BD end of the same ring.

lre_rx_queue_infos[PRUETH_PORT_QUEUE_MII0] describes the same BD ranges
with HOST_QUEUE_3/4_SIZE, and icssm_switch.h sizes P0_Q3/P0_Q4 with
HOST_QUEUE_3/4_SIZE.

icssm_prueth_lre_port_config() also writes HOST_QUEUE_1_SIZE and
HOST_QUEUE_2_SIZE into the firmware queue size table for Q1/Q2 of both
ports, whichever region backs them.

All HOST_QUEUE_*_SIZE values are currently 194, so nothing differs at
runtime. If one host queue size changes later, would the driver and
firmware disagree on the wrap point of these shared rings?

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_switch.h b/drivers/net/ethernet/ti/icssm/icssm_switch.h
> index b4d6b86605395..ec5925c812c36 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_switch.h
> +++ b/drivers/net/ethernet/ti/icssm/icssm_switch.h

[ ... ]

> @@ -51,18 +54,19 @@
>   *				address found in FDB). For switch only.
>   * 8..12	Block_length	number of valid bytes in this specific block.
>   *				Will be <=32 bytes on last block of packet
> + * 8		RED_INFO	Set if the frame carries an HSR or PRP
> + *				redundancy tag
> + * 10		HostRecv	Set if the frame is destined for the host port.
> + *				For HSR only.

[ ... ]

> @@ -86,14 +90,21 @@
>  #define PRUETH_BD_SW_FLOOD_MASK		BIT(7)
>  #define PRUETH_BD_SW_FLOOD_SHIFT	7
>  
> +#define PRUETH_BD_RED_PKT_MASK		BIT(8)
> +#define PRUETH_BD_RED_PKT		8
> +
> +#define PRUETH_BD_HOST_RECV_MASK	BIT(10)
> +#define PRUETH_BD_HOST_RECV_SHIFT	10
> +
>  #define	PRUETH_BD_SHADOW_MASK		BIT(14)
>  #define	PRUETH_BD_SHADOW_SHIFT		14
>  
>  #define PRUETH_BD_TIMESTAMP_MASK	BIT(15)
>  #define PRUETH_BD_TIMESTAMP_SHIFT	15
>  
> -#define PRUETH_BD_PORT_MASK		GENMASK(17, 16)
> -#define PRUETH_BD_PORT_SHIFT		16
> +#define PRUETH_BD_LAN_INFO_MASK		GENMASK(17, 16)
> +#define PRUETH_BD_LAN_A_SHIFT		16
> +#define PRUETH_BD_LAN_B_SHIFT		17

[Severity: Low]
This isn't a bug, but the BD layout table still lists bits 8..12 as
Block_length, and now also lists bit 8 as RED_INFO and bit 10 as
HostRecv. Could the Block_length entry be narrowed or removed so that
each bit has one meaning? The table already had similar overlaps before
this patch, with flag bits inside the Index 0..7 field.

The new macro names are also inconsistent with the other pairs.
PRUETH_BD_RED_PKT has no _SHIFT suffix, and PRUETH_BD_HOST_RECV_SHIFT and
PRUETH_BD_LAN_B_SHIFT are never used.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113143127.282466-1-saivarun%40couthit.com
