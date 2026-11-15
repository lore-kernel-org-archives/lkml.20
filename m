Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727469;
	b=Y/y89YgvWgNmupyghFAQqe1g33XVlAQhaXnM+bPqW714XUqRPvpmkLNV5RwFr92vyVDj
	 SzcP/1+BwdjkCNUlw7AJ7ify+E9RPffosgGjRDPKBmBIwA6MubGlCwEj1ctxjUmbNCV5/
	 PnpthTvMaPb4yzW5z5AIegysjK4y1jL7dwolANePKWxI2izDPAj5lon3L0J6dJbzDYK5u
	 Oup7/X+MvA1f9cb3mb1VlIa9CYdtaMI2xR2KQ2rIFNOkWY/v87T5OL9Ly4mGh4Sp3WlHj
	 Yw8XYQ60pcy+Y+EcI/r41b6pk7xu01HF5A8WbNk99+qiGyFWmOHuD99dnXVknyto43w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727469;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XJvoq1Xx3i//LS85IKNJhTpt4GaOTRDB2ZKGZaEdhIM=;
	b=KlK05rLJewPy1iz7cc5wY0YIHXSuMQCv9KT6JhnhOOlUEH+368guQY4PqtPIlV8fI5fx
	 keVroTAu86foTw+ZUI1yOrG/vM2g8B4bgDHK5DKuzWsUu6T+uBs8C7roIE6y4j69Wxyfz
	 /qfIG6AgYFIIr8TQlall5nw1EhCQqMm5z3GdY9JPX8pBV2PlZhYqRwGSrypUam10xnvR8
	 H5nRltZ/4O+ikbYha83h9VtL8iEtJJmv0aTWXjCMnAI1LibomwxL4ksaEmQYcKYNPP1wj
	 N1N1/OzSCffiAtI2PP0i4mQpGS/UNIV2dcawJbNJWc1mgw61FN8O2eGNT4xfb5UknSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjCdzTFF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0204606A8A9;
	Sun, 15 Nov 2026 07:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjCdzTFF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDAF1F000CB;
	Sun, 15 Nov 2026 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794727469;
	bh=XJvoq1Xx3i//LS85IKNJhTpt4GaOTRDB2ZKGZaEdhIM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bjCdzTFFWOTQxYzdNReFNPy7ZvRQqVahtRIZC2T6jYZvNMXHdRGUcTk+G/es81Gzd
	 XyHevjYjEx3BAvNNCrG0bddehM0wH2Cxkczo7zAXWq0pcAoPfbFeK/JpmpZp//T6i4
	 PwJLUMw+HMhjcRcgjqIP08F9kvS9TWI4nmCMLKVDWv8Dq4D5HHzkqtzvQ5Cc0ZtcQU
	 4UhG6sfbm91CAh1sIXcOvWqjoFB1PYgtceNoL4lO7XmkJIoeRt3RKDDzX0k/CtwMpe
	 8AF1SxC9A/0BHheAo4iNj8ZwRT4vPzk/vRY41D55fTkM7XVLekiBE4ekuaID/1qVkN
	 ox/df4CzkDifQ==
Subject: Re: [PATCH v7 net-next 9/9] net: dsa: netc: add PTP one-step
 timestamping support
From: netdev-bot+sashiko@kernel.org
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Date: Sun, 15 Nov 2026 07:24:28 +0000
Message-ID: <179472746829.2199510.2714083926199671078@kernel.org>
In-Reply-To: <20261111062753.1397582-10-wei.fang@oss.nxp.com>
References: <20261111062753.1397582-10-wei.fang@oss.nxp.com>
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

- [Medium] In one-step mode, netc_port_prepare_onestep_sync()
  (drivers/net/dsa/netc/netc_ptp.c) falls back to two-step whenever…
- [Low] The comment in netc_onestep_timeout()
  (drivers/net/dsa/netc/netc_ptp.c) says that adding one tick makes 'the…
- [Low] When one-step mode is enabled, every Sync-classified frame on a
  user port goes through one per-port FIFO, onestep_queue, capped at…
- [Low] PM_SINGLE_STEP is a single per-port register that the hardware
  applies when a subtype-3-tagged frame egresses.

--

net: dsa: netc: add PTP one-step timestamping support

This commit adds one-step PTP Sync offload for NETC switch user ports.
The tagger hands one-step Sync frames to the switch driver. The driver
queues them per port and sends them one at a time from a work item,
programming the shared PM_SINGLE_STEP register and inserting a To_Port
subtype 3 tag. Other PTP frames still fall back to two-step timestamping.

> diff --git a/drivers/net/dsa/netc/netc_ptp.c b/drivers/net/dsa/netc/netc_ptp.c
> index 0bcc01ebf01de..738855bd4bbf8 100644
> --- a/drivers/net/dsa/netc/netc_ptp.c
> +++ b/drivers/net/dsa/netc/netc_ptp.c

[ ... ]

> @@ -68,8 +97,283 @@ static int netc_get_ts_req_id(struct netc_port *np)

[ ... ]

> +static bool netc_onestep_timeout(struct netc_port *np)
> +{
> +	u64 expire_time;
> +
> +	/* Use monotonic jiffies_64, as the PHC may be stepped backwards.
> +	 * Add one tick since the ns-to-jiffies conversion rounds down, so
> +	 * the software window is never shorter than the hardware window.
> +	 */
> +	expire_time = np->onestep_tx_time + 1 +
> +		      nsecs_to_jiffies64(NETC_ONESTEP_VALID_WINDOW);

[Severity: Low]
Is the "never shorter than the hardware window" guarantee accurate?

The hardware window is 2^30 ns of PHC time, because the 30-bit tag
timestamp and the SFD capture both come from the NETC timer. This window
is measured in jiffies instead. The one tick margin is about 0.26 ms over
1.07 s at HZ=1000 (roughly 240 ppm), and about 2100 ppm at HZ=250.

The NETC timer driver allows a much larger frequency adjustment:

drivers/ptp/ptp_netc.c:
	.max_adj	= 500000000,

Say the PHC runs slower than the system tick, during servo convergence or
just from crystal tolerance. Could netc_onestep_timeout() then return true
and let netc_port_onestep_sync_enqueue() reprogram PM_SINGLE_STEP before
2^30 ns of PHC time have passed for the in-flight frame?

Should the comment be softened, or the margin widened by the maximum
frequency adjustment?

> +	if (np->onestep_state == NETC_ONESTEP_IN_FLIGHT &&
> +	    time_is_before_jiffies64(expire_time))
> +		return true;

[Severity: Low]
Is it safe to treat PM_SINGLE_STEP as free based only on elapsed time?

After netc_port_onestep_work() programs the register and calls
onestep_sync_xmit(), the tagged frame may not have left yet. It can still
be in the conduit qdisc, the ENETC TX ring, or a switch egress queue (for
example under pause/PFC or a closed Qbv gate).

Three paths seem to reprogram the register without knowing whether the
previous subtype 3 frame has gone out:

  netc_port_onestep_sync_enqueue(), once netc_onestep_timeout() is true

  netc_port_tstamp_timeout_work(), which sets resume_onestep after 5 s

  netc_mac_link_down()->netc_port_disable_onestep() followed by
  netc_mac_link_up()->netc_port_enable_onestep(), which sets
  NETC_ONESTEP_IDLE without tracking frames already handed to the conduit

Suppose the old frame goes out after the register has been rewritten for
a new Sync with a different layout (L2 vs UDPv4 vs UDPv6, or VLAN vs
untagged). Would the MAC then apply the new correction offset and CH bit
to the old frame?

The NETC_ONESTEP_VALID_WINDOW comment says such a frame "is already
invalid, whether it has been dropped or not". In this case, though, the
hardware could add the residence time at the wrong byte offset, for
example inside the IPv4 header or the originTimestamp. It could also
update or skip the UDP checksum wrongly. The frame on the wire would then
be malformed, not just carrying a stale correction field.

This depends on when the hardware latches PM_SINGLE_STEP. That point is
inferred from the commit message, not checked against a datasheet.

[ ... ]

> +void netc_port_onestep_sync_enqueue(struct dsa_switch *ds, int port,
> +				    struct sk_buff *skb)
> +{
> +	struct netc_port *np = NETC_PORT(ds, port);
> +
> +	spin_lock_bh(&np->onestep_lock);
> +	if (unlikely(np->onestep_state == NETC_ONESTEP_PORT_INACTIVE))
> +		goto free_skb;
> +
> +	if (unlikely(skb_queue_len(&np->onestep_queue) >= NETC_ONESTEP_QTH))
> +		goto free_skb;

[Severity: Low]
Can an unprivileged local sender crowd the real Sync frames out of
onestep_queue?

SOF_TIMESTAMPING_TX_HARDWARE needs no capability. ptp_classify_raw()
treats any UDP datagram to port 319 as a PTP event, and the sender
controls the payload (msgtype Sync, twoStepFlag clear). With
HWTSTAMP_TX_ONESTEP_SYNC set, such frames take this path:

  dsa_user_xmit()
    dsa_skb_tx_timestamp()
      netc_port_txtstamp()
        netc_port_prepare_onestep_sync()   /* NETC_PTP_FLAG_ONESTEP */
  netc_xmit()
    netc_port_onestep_sync_enqueue()       /* shared FIFO, drop at 512 */
  netc_port_onestep_work()                 /* one frame per response */

These frames share the single per-port onestep_queue with the ptp4l
Syncs. A flood would delay the real Syncs, or get them dropped once
NETC_ONESTEP_QTH is reached.

The same sender can also send non-Sync event frames. Those take the
two-step path and can use up the 16-entry ts_req_id pool. Then
netc_port_onestep_work() drops the real Syncs when netc_get_ts_req_id()
fails. If tagged frames are also lost in the conduit, the queue stays
stuck until the window check fires on a later enqueue or the 5 s timeout
runs.

The ts_req_id pool exhaustion already exists before this patch. What is
new is the serialized one-step FIFO.

[ ... ]

> @@ -409,6 +718,67 @@ int netc_port_hwtstamp_get(struct dsa_switch *ds, int port,
>  	return 0;
>  }
>  
> +static void netc_port_prepare_onestep_sync(struct netc_port *np,
> +					   struct sk_buff *skb,
> +					   u32 ptp_class, bool *twostep)
> +{

[ ... ]

> +	/* Ensure the buffer is linear and writable so the packet can be
> +	 * parsed and updated in place. Otherwise, fall back to two-step.
> +	 */
> +	if (unlikely(skb_linearize_cow(skb))) {
> +		*twostep = true;
> +		return;
> +	}

[Severity: Medium]
What happens here if the frame really is a one-step Sync (msgtype Sync,
twoStepFlag clear)?

skb_linearize_cow() makes a GFP_ATOMIC copy whenever the skb is cloned or
nonlinear. A clone is common, for example from dev_queue_xmit_nit() when
tcpdump is attached to the user port. So this can fail under memory
pressure before the message type is checked.

netc_port_txtstamp() then sends the frame down the two-step path:

	if (tx_type == HWTSTAMP_TX_ON || twostep)
		netc_port_prepare_twostep(np, skb);

netc_xmit() then gives the frame a subtype 2 tag. On this path
originTimestamp is never written, PM_SINGLE_STEP is not programmed, and
the correction field is not updated. The frame still says it is one-step,
so no Follow_Up will be sent.

Would the slave then compute its offset from whatever originTimestamp
user space left in the frame? The socket would also get an unexpected
hardware TX timestamp through skb_complete_tx_timestamp().

The commit message says:

  "Frames that are not one-step Sync still fall back to two-step
  timestamping."

and:

  "If the originTimestamp field of the sync frame is not in the linear
  buffer of the skb or the correction offset exceeds the hardware
  capability, the frame will be dropped."

Should this path drop the frame and count it in tx_dropped, like the
offset check further down? The ptp_parse_header() failure falls back the
same way. There the header is incomplete, though, so that frame cannot be
a well-formed Sync.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111062753.1397582-1-wei.fang%40oss.nxp.com
