Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733552;
	b=hWMxJ6o+spzsl64ea/18aJ2cfPfhuF+dz4EoycJOIUh17kjYI+nVpLuvTvGMQbDGAYqV
	 63r1tp2f0J+IPDhQLl88THWnlZKg0hZ8HYJo2xtgy5vjXWNXNsylJtP1n4ibC9/fYbu0i
	 rEONhI+f7yPfzk8klo00dqd+CXgfBD+eyHp1x/ah80I2imGWtz4/8VUYEVtW8k1+WoLe+
	 N6kYFswpDIxDtVYG2sQ+2UhBpY9QCANkQ0/W9cafkRRtdKovf/NVmedlJjcYY8d9ObqQv
	 JkR1+tCd0MAPFVUbe1Ksq6hYZh0bjTpgu+DMkQUV56OYgrsm3Kb+sVWuQScDBDD+7Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733552;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TKt998PVRVHncZl+m90gE7o67vZ5t7x6XEqDnaaR7Xg=;
	b=h4mUdfqvMpKm4qHLGcCXRGov+hY86Qw+6/nW+CQ+FzeStKCEcnR13gsJllxTM95EM9SE
	 c4LxwoXEMLaoEZZaLTXTN50zN/jI4Yam3sGExdYZd49i7tHeMurwQac73bM6nxrKYe4fi
	 Y/p/+Bdv7EH7kaKsMtOm/6MhZXOq2fAEoKho6r3Qzg9aNK6xAQGcJK9ri8anH4BA8IS3T
	 GcxicGRKI8L+74UA2pyg0XCUn2XVyQebsElc/gP4kVC6lp/4MfGrmBb25UQrINzpSr0r0
	 ZziKV6oTXEkU/QeO/cHjIJayByJ8IRfpEOwiea2JdzK9TITysVxCEZmUJ6Qdi49XNkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocOCCOnh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A59606A339;
	Sun, 15 Nov 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocOCCOnh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D53F1F000C4;
	Sun, 15 Nov 2026 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733552;
	bh=TKt998PVRVHncZl+m90gE7o67vZ5t7x6XEqDnaaR7Xg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ocOCCOnhdZ7vm6x0ecBZtDleYrZhtoDLV5ri6qJFXop5gbe/6LYqEFKOi5hZfBCmz
	 cpB4PTprwtBtlt+2kpR3MR7LLagt377as1O0z0Kg2JXdm8O+9E2soel2Kp8CLhZnju
	 gVZuhyLlYeCUj9QPkHvVnel6z7loQ6gsDRGGx9/5nPt9zL1c9ZQYbM7ZIyDKKl94Ox
	 iHuayAGnucv97oR7cJhE4QidQ6E2iQhaQ4SQGq60K2VH5bHVxTcKsi6svRFSbkSI6I
	 6g4weI+0LRnhWzURPd+RDDyEW3UvHtnu7IxyMsorkmEcln2SN5zNa9Ckr9PtgZqnBU
	 Lu5TSAtk7BHtw==
Subject: Re: [PATCH net-next v2 2/2] net: phy: realtek: add hardware
 timestamping for RTL8127a
From: netdev-bot+sashiko@kernel.org
To: javen_xu@realsil.com.cn
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 freddy_gu@realsil.com.cn, nb@tipi-net.de, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org,
 vladimir.oltean@nxp.com
Date: Sun, 15 Nov 2026 09:05:51 +0000
Message-ID: <179473355118.2199510.17549901451639410191@kernel.org>
In-Reply-To: <20261111083807.1529-3-javen_xu@realsil.com.cn>
References: <20261111083807.1529-3-javen_xu@realsil.com.cn>
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

Thank you for your contribution! Sashiko AI review found 12 potential
issue(s) to consider.

Critical: 0 · High: 3 · Medium: 7 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] rtl8127a_ptp_txtstamp()
  (drivers/net/phy/realtek/realtek_ptp.c:508-526) hands the driver's…
- [High] rtl8127a_ptp_remove() (lines 702-719) clears phydev->mii_ts with
  a plain store and immediately tears down: ptp_clock_unregister()…
- [High] rtl8127a_ptp_rxtstamp() (lines 528-553) takes ownership of every
  received PTP event packet and queues it on ptp->rx_queue with…
- [Medium] While a TX timestamp is pending, rtl8127a_ptp_do_aux_work()
  (line 494) returns 0.
- [Medium] rtl8127a_ptp_config_init() (lines 645-659) runs on every
  phy_init_hw(), for example from rtl8169_init_phy()…
- [Medium] rtl8127a_ptp_egress_time() (lines 229-265) treats a failed or
  ambiguous TX-ready poll as if a Sync timestamp were ready.
- [Medium] rtl8127a_ptp_hwtstamp_set() stores the new state
  (`WRITE_ONCE(ptp->tx_type, ...)` and `ptp->rx_filter = ...`) before…
- [Medium] RX timestamps are read late from what the register interface
  shows as one capture per message type (TRX_TS_STA SEL_RX + MSGTYPE ->…
- [Medium] rtl8127a_ptp_hwtstamp_set() reprograms the hardware without
  coordinating with an in-flight TX timestamp.
- [Medium] The driver tracks a single TX timestamp in software, but the
  PHY timestamps every outgoing event message, and nothing ties the…
- [Low] The patch changes REALTEK_PHY_PTP to `depends on PTP_1588_CLOCK
  && NETWORK_PHY_TIMESTAMPING` (drivers/net/phy/realtek/Kconfig:19).
- [Low] rtl8127a_ptp_ts_info() (lines 622-643) advertises rx_filters
  NONE, PTP_V2_EVENT, PTP_V2_L4_EVENT, PTP_V2_SYNC, PTP_V2_L4_SYNC,…

--

net: phy: realtek: add hardware timestamping for RTL8127a

This commit adds mii_timestamper support to the RTL8127A internal PHY so
that the PHY hardware timestamps PTPv2 event messages. The PTP aux worker
reads both TX and RX timestamps over MDIO. Only one TX timestamp can be
pending at a time, and it is dropped after 15 seconds.

> diff --git a/drivers/net/phy/realtek/Kconfig b/drivers/net/phy/realtek/Kconfig
> index 93a8fb552834f..ab375c42a7f22 100644
> --- a/drivers/net/phy/realtek/Kconfig
> +++ b/drivers/net/phy/realtek/Kconfig
> @@ -16,12 +16,12 @@ config REALTEK_PHY_HWMON
>  config REALTEK_PHY_PTP
>  	bool "PTP support for Realtek PHYs"
>  	default y
> -	depends on PTP_1588_CLOCK
> +	depends on PTP_1588_CLOCK && NETWORK_PHY_TIMESTAMPING

[Severity: Low]
Does this remove the existing PHC support on configs that don't enable
NETWORK_PHY_TIMESTAMPING?

NETWORK_PHY_TIMESTAMPING in net/Kconfig is a bool with no default. Its
help text says "If you are unsure how to answer this question, answer N."

Take an existing .config with PTP_1588_CLOCK=y but no
NETWORK_PHY_TIMESTAMPING. olddefconfig will now silently set
REALTEK_PHY_PTP=n, and the RTL8127A PHC goes away even though it only
needed PTP_1588_CLOCK before.

Only the mii_timestamper part seems to need PHY timestamping. Could that
part be made conditional instead? If not, could the commit message
mention that the PHC now needs this option?

[ ... ]

> diff --git a/drivers/net/phy/realtek/realtek_ptp.c b/drivers/net/phy/realtek/realtek_ptp.c
> index bd5c0d6988dae..5e02707620064 100644
> --- a/drivers/net/phy/realtek/realtek_ptp.c
> +++ b/drivers/net/phy/realtek/realtek_ptp.c

[ ... ]

> @@ -171,6 +206,64 @@ static int rtl8127a_ptp_write_time(struct rtl8127a_ptp *ptp,

[ ... ]

> +static int rtl8127a_ptp_trx_ts_cmd(struct rtl8127a_ptp *ptp, u16 cmd)
> +{
> +	int ret;
> +
> +	ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_TRX_TS_STA,
> +				  RTL8127A_PTP_TRX_TS_SEL_RX |
> +				  RTL8127A_PTP_TRX_TS_MSGTYPE,
> +				  RTL8127A_PTP_TRX_TS_RD | cmd);

[ ... ]

> +static int rtl8127a_ptp_egress_time(struct rtl8127a_ptp *ptp,
> +				    struct timespec64 *ts)
> +{

[ ... ]

> +	val = rtl8127a_ptp_poll(ptp, RTL8127A_PTP_TRX_TS_STA,
> +				RTL8127A_PTP_TX_RDY, true);
> +	if (val < 0)
> +		val = 0;
> +
> +	switch (val & RTL8127A_PTP_TX_RDY) {

[ ... ]

> +	case RTL8127A_PTP_TX_SYNC_RDY:
> +	default:
> +		msgtype = PTP_MSGTYPE_SYNC;
> +		break;
> +	}

[Severity: Medium]
What happens here when the poll fails, or when more than one ready bit is
set?

If rtl8127a_ptp_poll() gets an MDIO error or times out after 1 ms, val
becomes 0. If several of bits 12-15 are set, none of the single-bit cases
match. Either way the code takes the default branch, latches the Sync
capture, and rtl8127a_ptp_egress_time() returns 0.

rtl8127a_ptp_tx_tstamp() then hands that value to
skb_complete_tx_timestamp() as a valid hardware timestamp, whatever the
pending skb's real message type is. For example, a Delay_Req could get
an earlier, unrelated Sync's egress time.

More than one ready bit can be set because the hardware still
timestamps frames whose clones were dropped while the slot was busy.
Should the poll failure and the ambiguous case return an error instead?
The pending skb's msgtype is also never recorded, so there is nothing to
compare against.

Also, rtl8127a_ptp_trx_ts_cmd() does a read-modify-write of TRX_TS_STA.
That writes the TX_*_RDY status bits back along with the command bits.
If those bits are write-1-to-clear, could an RX latch clear a fresh TX
ready bit?

[ ... ]

> @@ -306,6 +399,101 @@ static int rtl8127a_ptp_settime64(struct ptp_clock_info *info,

[ ... ]

> +/* Returns true if no TX timestamp is pending anymore */
> +static bool rtl8127a_ptp_tx_tstamp(struct rtl8127a_ptp *ptp)
> +{

[ ... ]

> +	if (time_is_before_jiffies(ptp->tx_start + RTL8127A_PTP_TX_TIMEOUT)) {
> +		rtl8127a_ptp_write(ptp, RTL8127A_PTP_INSR,
> +				   RTL8127A_PTP_INT_TX_TS);
> +		mutex_unlock(&ptp->lock);
> +
> +		rtl8127a_ptp_tx_complete(ptp, NULL);
> +		return true;
> +	}
> +
> +	ret = rtl8127a_ptp_read(ptp, RTL8127A_PTP_INSR);
> +	if (ret < 0 || !(ret & RTL8127A_PTP_INT_TX_TS)) {
> +		mutex_unlock(&ptp->lock);
> +		return false;
> +	}
> +
> +	ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_INSR,
> +				 RTL8127A_PTP_INT_TX_TS);
> +	if (!ret)
> +		ret = rtl8127a_ptp_egress_time(ptp, &ts);

[Severity: Medium]
How is the TX_TS event tied to the skb in ptp->tx_skb?

The driver tracks one TX timestamp in software, but the PHY timestamps
every outgoing event message. When the slot is busy,
rtl8127a_ptp_txtstamp() frees the clone. The original frame is still
sent and timestamped, which sets its TX_*_RDY bit and INSR TX_TS.

Suppose an untracked frame raises TX_TS after the INSR clear above. The
next armed skb can see TX_TS on the worker's first pass, possibly before
its own frame has left the MAC, and get the untracked frame's timestamp.

An untracked frame of the same type can also overwrite the per-type
capture before the pending skb is latched. One of a different type
leaves a stale ready bit, which later sends rtl8127a_ptp_egress_time()
into the SYNC fallback.

The timeout path clears only INSR TX_TS, not the latched ready bits.
Nothing clears stale TX_TS or ready state when rtl8127a_ptp_txtstamp()
arms a new skb, and the skb's msgtype and sequenceId are never recorded
or compared.

Can this attach TX timestamps to the wrong packet when two event
messages go out close together? Examples are multiple PTP instances,
overlapping P2P Pdelay_Req/Resp, or ptp4l moving on after its
tx_timestamp_timeout.

[ ... ]

> +static void rtl8127a_ptp_rx_tstamp(struct rtl8127a_ptp *ptp,
> +				   struct sk_buff *skb)
> +{

[ ... ]

> +	mutex_lock(&ptp->lock);
> +	ret = rtl8127a_ptp_trx_ts_cmd(ptp, RTL8127A_PTP_TRX_TS_SEL_RX |
> +					   FIELD_PREP(RTL8127A_PTP_TRX_TS_MSGTYPE,
> +						      msgtype) |
> +					   RTL8127A_PTP_TRX_TS_EXEC);
> +	if (!ret)
> +		ret = rtl8127a_ptp_read_time(ptp, RTL8127A_PTP_TRX_TS_TIME,
> +					     &ts);
> +	mutex_unlock(&ptp->lock);
> +
> +	if (!ret)
> +		skb_hwtstamps(skb)->hwtstamp = timespec64_to_ktime(ts);

[Severity: Medium]
Can this give the skb another packet's ingress time?

The register interface appears to hold one RX capture per message type,
and the aux worker reads it here some time after the frame arrived. The
code does not check INSR RX_TS or any valid flag. It does not compare the
sequenceId, and it does not acknowledge RX_TS, even though
rtl8127a_ptp_hwtstamp_enable() unmasks it in INER.

If two event messages of the same type arrive before the worker handles
the first one, the first skb gets the second packet's time. A frame the
hardware did not capture gets a stale value, which is still reported as
a valid hardware timestamp.

rtl8127a_ptp_rxtstamp() also does not reject PTPv1 frames. For v1,
ptp_get_msgtype() returns the control field, so v1 frames with control
<= 3 are queued and latched against the v2 per-type captures.

Anyone who can send event messages to UDP port 319 can trigger this.
Could a remote sender make ptp4l's genuine Sync or Delay_Req carry the
arrival time of the sender's own packet?

I could not confirm whether the hardware keeps one register per type or
a FIFO.

> +
> +	netif_rx(skb);
> +}
> +
> +static long rtl8127a_ptp_do_aux_work(struct ptp_clock_info *info)
> +{
> +	struct rtl8127a_ptp *ptp = container_of(info, struct rtl8127a_ptp, info);
> +	struct sk_buff *skb;
> +
> +	while ((skb = skb_dequeue(&ptp->rx_queue)))
> +		rtl8127a_ptp_rx_tstamp(ptp, skb);
> +
> +	/* Keep polling until the pending TX timestamp is available */
> +	return rtl8127a_ptp_tx_tstamp(ptp) ? -1 : 0;
> +}

[Severity: Medium]
Does returning 0 here make the aux worker busy-poll MDIO?

ptp_aux_kworker() requeues the work with the returned delay:

drivers/ptp/ptp_clock.c:ptp_aux_kworker() {
    ...
	delay = info->do_aux_work(info);

	if (delay >= 0)
		kthread_queue_delayed_work(ptp->kworker, &ptp->aux_work, delay);
}

So while a TX timestamp is pending, the worker runs again immediately.
Each pass takes ptp->lock and reads RTL8127A_PTP_INSR over MDIO. That
competes with phylib, and with gettimex64/adjfine/adjtime calls from
phc2sys and ptp4l.

TX_TS may never arrive: the frame was dropped, the link is down, the
packet was not an event message, timestamping was disabled, or
rtl8127a_ptp_hwtstamp_enable() cleared INSR. In that case the polling
lasts the full 15 second RTL8127A_PTP_TX_TIMEOUT, and every other TX
timestamp request is dropped in the meantime.

Would a non-zero delay be more appropriate here? The commit message only
says:

    A pending TX timestamp is dropped after 15 seconds.

It does not mention the busy polling, or that TX timestamping is blocked
during that time.

[ ... ]

> @@ -314,8 +502,146 @@ static const struct ptp_clock_info rtl8127a_ptp_info = {

[ ... ]

> +static void rtl8127a_ptp_txtstamp(struct mii_timestamper *mii_ts,
> +				  struct sk_buff *skb, int type)
> +{
> +	struct rtl8127a_ptp *ptp = container_of(mii_ts, struct rtl8127a_ptp,
> +						mii_ts);
> +
> +	/* Only one TX timestamp can be pending at a time */
> +	if (READ_ONCE(ptp->tx_type) != HWTSTAMP_TX_ON ||
> +	    test_and_set_bit_lock(RTL8127A_PTP_TX_IN_PROGRESS, &ptp->state)) {
> +		kfree_skb(skb);
> +		return;
> +	}

[Severity: High]
Can an unprivileged sender take the only TX timestamp slot here?

skb_clone_tx_timestamp() calls ->txtstamp() for every socket-owned skb
the core classifies as PTP, whether or not a hardware timestamp was
requested. The classifier accepts any UDP datagram to destination port
319 regardless of messageType, and any L2 0x88F7 frame without the
general bit.

This check does not parse the PTP header and does not reject non-event
message types, which rtl8127a_ptp_rxtstamp() does on the RX side. It
also does not check the PTP version or SKBTX_HW_TSTAMP.

So while ptp4l runs with HWTSTAMP_TX_ON, an unprivileged local user can
send a UDP/319 datagram with a non-event messageType:

  sendto() to UDP dport 319
    rtl8169_start_xmit()
      skb_tx_timestamp()
        skb_clone_tx_timestamp()
          rtl8127a_ptp_txtstamp()   <- takes the slot

The hardware does not timestamp that datagram. Every ptp4l Sync or
Delay_Req clone sent afterwards fails test_and_set_bit_lock() and is
freed.

The hardware still timestamps ptp4l's frame and raises INSR TX_TS.
rtl8127a_ptp_tx_tstamp() then attaches that egress time to the other
user's skb and queues it on that socket's error queue.

If no later event message is sent, the slot stays held for the full 15
second timeout while the aux worker polls MDIO. Should this path check
SKBTX_HW_TSTAMP and filter with ptp_parse_header() and
ptp_get_msgtype(), as the RX side does?

[ ... ]

> +	/* Only event messages are timestamped by the hardware */
> +	msgtype = ptp_get_msgtype(hdr, type);
> +	if (msgtype > PTP_MSGTYPE_PDELAY_RESP)
> +		return false;
> +
> +	RTL8127A_PTP_SKB_CB(skb)->msgtype = msgtype;
> +	skb_queue_tail(&ptp->rx_queue, skb);
> +	ptp_schedule_worker(ptp->clock, 0);

[Severity: High]
Is anything limiting the length of ptp->rx_queue?

skb_defer_rx_timestamp() runs in the RX softirq for any frame the
classifier marks as PTP, from any sender: a UDP datagram to port 319 or
a non-general L2 0x88F7 frame. Every event message is queued here with
no length cap, drop policy or expiry.

The only consumer is rtl8127a_ptp_do_aux_work(). It handles one skb at a
time under ptp->lock: a read-modify-write of TRX_TS_STA, a poll with a
timeout of up to 1 ms, and five time register reads. Each of these goes
through r8169's OCP accessors.

While queued, these skbs bypass netdev_max_backlog and socket memory
accounting. Could a remote host flooding UDP/319 over a 10GbE link make
this queue grow without bound, so that the worker's while loop never
exits?

[ ... ]

> +	if (ptp->tx_type != config->tx_type ||
> +	    ptp->rx_filter != config->rx_filter) {
> +		WRITE_ONCE(ptp->tx_type, config->tx_type);
> +		ptp->rx_filter = config->rx_filter;
> +		ret = rtl8127a_ptp_hwtstamp_enable(ptp, enable);
> +	}
> +	WRITE_ONCE(ptp->rx_enabled, rx_enabled);

[Severity: Medium]
What happens to the cached state if rtl8127a_ptp_hwtstamp_enable()
fails?

tx_type and rx_filter are updated before the hardware is programmed.
rx_enabled is updated whatever the return value is.

rtl8127a_ptp_hwtstamp_enable() is a series of separate MDIO
read-modify-writes (SYNCE_CTL, INER, GEN_CFG, INSR, CTL, 0xa640) with no
rollback. An -ETIMEDOUT partway through can leave the block half
configured, for example with INER unmasked but CTL not enabled.

After such an error:

- rtl8127a_ptp_txtstamp() sees HWTSTAMP_TX_ON and arms TX timestamps
  that never arrive.
- rtl8127a_ptp_rxtstamp() sees rx_enabled and attaches stale captures.
- rtl8127a_ptp_hwtstamp_get() reports a configuration the hardware is
  not running.

A retry with the same configuration then matches the cached state,
skips the reprogramming and returns 0. Should the new state be stored
only after the hardware has been programmed successfully?

[Severity: Medium]
Is a pending TX timestamp handled during this reconfiguration?

Any filter change while TX is on calls rtl8127a_ptp_hwtstamp_enable(ptp,
true), which does:

	ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_INSR, 0xffff);

That clears a TX_TS event latched for ptp->tx_skb before the aux worker
reads it.

tx_type is also set to HWTSTAMP_TX_ON before the hardware is enabled. A
concurrent rtl8127a_ptp_txtstamp() can therefore arm the slot for a
frame that goes out before PTP is enabled.

Switching TX off does not cancel a pending tx_skb either. That includes
one armed by an rtl8127a_ptp_txtstamp() call that read the old tx_type.

In each case RTL8127A_PTP_TX_IN_PROGRESS stays set until the 15 second
timeout. Every new TX timestamp request is freed during that time, and
rtl8127a_ptp_do_aux_work() keeps polling INSR under ptp->lock.

[ ... ]

> +	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_EVENT) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_EVENT) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_SYNC) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_SYNC) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_DELAY_REQ) |
> +			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ);

[Severity: Low]
Should the L2 filters be listed here too?

rtl8127a_ptp_hwtstamp_set() accepts HWTSTAMP_FILTER_PTP_V2_L2_EVENT,
HWTSTAMP_FILTER_PTP_V2_L2_SYNC and HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ,
and rtl8127a_ptp_rxtstamp() handles PTP_CLASS_L2 frames. ethtool -T and
the tsinfo netlink reply will not report the L2 filters as supported.

> +
> +	return 0;
> +}
> +
>  int rtl8127a_ptp_config_init(struct phy_device *phydev)
>  {
>  	struct rtl8127a_ptp *ptp = phydev->priv;

[Severity: Medium]
Should rtl8127a_ptp_config_init() also restore the timestamping
configuration?

It runs on every phy_init_hw(), for example from rtl8169_init_phy() on
open, reset and resume, but it only steps the clock again:

drivers/net/phy/realtek/realtek_ptp.c:rtl8127a_ptp_config_init() {
    ...
	/* (Re)start the clock from the system time whenever the PHY is
	 * (re)initialized, e.g. each time the MAC driver brings it up.
	 */
	ktime_get_real_ts64(&ts);

	return rtl8127a_ptp_settime(ptp, &ts);
}

That comment suggests the PTP block's state may not survive a PHY
re-init. If CTL and INER are reset as well, ptp->tx_type, ptp->rx_filter
and rtl8127a_ptp_hwtstamp_get() still report timestamping as enabled
while the hardware has it off. TX skbs then wait out the 15 second
timeout with busy polling, and RX skbs get stale captures.

Sending the same SIOCSHWTSTAMP again does not help.
rtl8127a_ptp_hwtstamp_set() only reprograms the hardware when the
requested config differs from the cached one.

Stepping the PHC here while timestamping is active also means captures
pending across the step can mix two timebases.

I could not confirm whether PHY re-init or power-down actually clears
these vendor PTP registers.

[ ... ]

> @@ -369,6 +706,14 @@ void rtl8127a_ptp_remove(struct phy_device *phydev)
>  	if (!ptp)
>  		return;
>  
> +	phydev->mii_ts = NULL;
> +	phydev->default_timestamp = false;
> +
>  	rtl8127a_ptp_hwtstamp_enable(ptp, false);
> +	/* Also stops the aux worker */
>  	ptp_clock_unregister(ptp->clock);
> +
> +	if (ptp->tx_skb)
> +		rtl8127a_ptp_tx_complete(ptp, NULL);
> +	skb_queue_purge(&ptp->rx_queue);
>  }

[Severity: High]
What stops the datapath from still using ptp after this function
returns?

phydev->mii_ts is cleared with a plain store, and teardown follows
straight away. There is no synchronize_net() or RCU grace period, and
rtnl_lock is not taken. devres frees ptp after remove returns.

phy_remove() calls drv->remove() without detaching the netdev. A sysfs
unbind of the PHY driver can therefore run this while traffic is
flowing.

skb_clone_tx_timestamp() and skb_defer_rx_timestamp() read
phydev->mii_ts without locking. A CPU that has already loaded it can
still call rtl8127a_ptp_txtstamp() or rtl8127a_ptp_rxtstamp() after this
point. Those calls could:

- call ptp_schedule_worker() on a destroyed kworker
- touch the devm-freed struct
- leak a TX clone that holds a socket reference, if it is published
  after the ptp->tx_skb check
- queue an RX skb after the purge

rtl8127a_ptp_ts_info(), rtl8127a_ptp_hwtstamp_get() and
rtl8127a_ptp_hwtstamp_set() run under rtnl, which this path does not
take. They can also call ptp_clock_index() on a freed clock.

There is a second case. If the PHY was selected as hwprov through
ethtool tsconfig, dev->hwprov is only cleared in phy_detach(), not on
driver unbind. After this remove, skb_defer_rx_timestamp() takes the
hwprov path, skips phy_is_default_hwtstamp(), and then dereferences the
now NULL mii_ts:

net/core/timestamping.c:skb_defer_rx_timestamp() {
    ...
	mii_ts = phydev->mii_ts;
	if (likely(mii_ts->rxtstamp))
		return mii_ts->rxtstamp(mii_ts, skb, type);
    ...
}

Would any received PTP frame then oops in the RX softirq?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111083807.1529-1-javen_xu%40realsil.com.cn
