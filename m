Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755243;
	b=W/oIoHowdMSBLktQrqcFd76Lvp+EbncssfJmHJz12huRyOcERG/OVD4I2g4Z5Wup6d/s
	 DDE+sVKJPXYmgdvnQv5lHTuwf6tQIr8k6moXdZOSvgHvNhohekcU7dLBaAX3C3DBEey6e
	 7n3JkHrVM2zcjqVzk5SmzqmMJrSzCrE93BbZC/QrXC6AHRM+SPRlf/eQO7ze7Jf7Uyvjd
	 QiLj9IUUt1iswKpMKXiOsmKcXmApA7XhI4KGsqlxZsMLaZ53mTbvPtjIWZPmAJQ+wCEXQ
	 rdSQ61DnAgLXQ9q9ZAEKmkodJP87tbRivT2Otz9E1WOBj6KQq8+AFQnvyqPqaD3wlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755243;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DZUG/PPjuPvdRwswzkf9nGraeQkRrKt+uRQJZ99oBGw=;
	b=FlEjZfZACiE6RXqB3ow3OWpp3mYJ7Kd7W5GtrQNt9EryYczDgx1DYH04wBQUFGRRf8VK
	 WfsCBW8Tc+p2+tiw5+mVdlIQLPifMWB8LzhJYm8VPpMNx6wfPWY2rVCaDSqsGf670fFKz
	 jUTb8nxzR4YjRP6CeNptpkhXy1yeWecVN1huv7YGgKgN/1C3zo8elR3joDV/tQgqL/s4+
	 Gdyvyy5lN4hydTb/7/da4TaqHZN/LtYazYUPL6VY1KZwraFr3nyhgdasbEQKPlgUSsyAl
	 cGg0QO73OauT/KYyhgs9D/TrC9pIgPrw0DpfwSB6ffq/mfMvwL6yh5Xl+3LChMNQN0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OcqLTmL4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908A4606A31A;
	Sun, 15 Nov 2026 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OcqLTmL4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE431F000C4;
	Sun, 15 Nov 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794755243;
	bh=DZUG/PPjuPvdRwswzkf9nGraeQkRrKt+uRQJZ99oBGw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OcqLTmL4JaRHAGvyjJ9ReSqtsr28SCN3XxaaeXZBYBNmqLUUEUGMzGnmRMbmVxKVM
	 mC0mZ0KFigPkAZlUF1HtcTVGSt9t6RVo1q9vEIuSVAOm5ojWJzESA2PvqxttOcCqiB
	 XXWS/zvCgdP0HV0qgC+7ICIkjOvX8B3eK8DXdsDy383qR1ZHB3YwajVq2eFCbGgfcV
	 x/aZjvzhcxqrm3i881kFZLXGrqVMZqE+zcMG+FsAR7F1t9kgWh5ijzwChug3X2006T
	 oCaj/gWHY8S/LTO6hkwYy6G6bqYReC5Gx7NVz8xt7goPOyrlskeVMYWdnkFlPuHrq9
	 GaoVdcxY9VNYg==
Subject: Re: [PATCH] rxrpc: Fix slab-out-of-bounds write in rxrpc_send_ACK()
 during PMTUD probing
From: netdev-bot+sashiko@kernel.org
To: gowtham398gs@gmail.com
Cc: dhowells@redhat.com, marc.dionne@auristor.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com, horms@kernel.org,
 linux-afs@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Date: Sun, 15 Nov 2026 15:07:22 +0000
Message-ID: <179475524211.2199510.8909289926284506131@kernel.org>
In-Reply-To: <20261111144846.838278-1-gowtham398gs@gmail.com>
References: <20261111144846.838278-1-gowtham398gs@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 (1) · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Regression: PMTUD can no longer grow past one jumbo subpacket,
  so jumbo DATA is turned off for every peer.
- [Medium] Incomplete fix: the patch guards one `if_mtu - hdrsize`
  subtraction, but the same unsigned underflow is left unguarded…
- [Medium] The commit message describes a bug mechanism that the code
  does not support.
- [Low] When if_mtu <= hdrsize, the new code in rxrpc_assess_MTU_size()
  (peer_object.c:214-224) stores peer->max_data = 0, pmtud_good = 0,…
- [Low] The comment the patch adds in rxrpc_send_ACK()
  (net/rxrpc/output.c:328-330) says 'skip padding if the base ACK…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  rxrpc_assess_MTU_size() (net/rxrpc/peer_object.c:193-197) leaks a dst…

--

rxrpc: Fix slab-out-of-bounds write in rxrpc_send_ACK() during PMTUD probing

This patch guards the if_mtu - hdrsize subtraction in
rxrpc_assess_MTU_size() against unsigned underflow. It also derives the
PMTUD search bounds from the clamped max_data. Finally, it limits the
PMTUD padding loop in rxrpc_send_ACK() to the size of local->kvec.

Closes: https://syzkaller.appspot.com/bug?extid=0cd6f4783442ac67b56d

> As a result, peer->pmtud_bad and peer->pmtud_trial become excessively
> large. When rxrpc_send_ACK() builds a padded RXRPC_ACK_PING packet for
> PMTUD probing, it appends PAGE_SIZE zero-page entries to call->local->kvec
> inside a loop until len reaches probe_mtu.

[Severity: Medium]
Is this how the overflow actually happens? Before this patch,
rxrpc_assess_MTU_size() did:

    peer->max_data    = umin(RXRPC_JUMBO(1), peer->if_mtu - peer->hdrsize);
    ...
    peer->pmtud_trial = umin(peer->max_data, peer->pmtud_bad - 1);

In the underflow case, pmtud_trial therefore starts at 1440. That makes
probe_mtu 1468, which needs only a few kvec entries.

The only code that raises pmtud_trial later is
rxrpc_input_probe_for_pmtud(), and it loads pmtud_bad into a signed int:

    int good, trial, bad, jumbo;
    ...
    bad   = peer->pmtud_bad;
    if (good >= bad - 1) {
        conn->pmtud_probe = 0;
        peer->pmtud_lost = false;
        return;
    }

An underflowed pmtud_bad becomes zero or negative here. The search then
returns immediately and pmtud_trial never grows.

The new nr_kv < ARRAY_SIZE(call->local->kvec) bound in rxrpc_send_ACK()
seems to be what actually prevents the out-of-bounds write. Getting
nr_kv past 46 needs a large positive pmtud_bad. Normal IPv4/IPv6 routes
are capped at IP_MAX_MTU, which gives about 20 entries at most. A
dst_mtu provider without that cap could still supply one, for example
dst_blackhole_mtu() returning dst_dev(dst)->mtu.

Could the commit message describe the real triggering state, and name
the rxrpc_send_ACK() hunk as the fix?

> diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
> index 88cad087f13bf..a3dfba0a3bbc5 100644
> --- a/net/rxrpc/output.c
> +++ b/net/rxrpc/output.c
> @@ -325,9 +325,19 @@ void rxrpc_send_ACK(struct rxrpc_call *call, u8 ack_reason,
>  	if (why == rxrpc_propose_ack_ping_for_mtu_probe) {
>  		size_t probe_mtu = call->peer->pmtud_trial + sizeof(struct rxrpc_wire_header);
>  
> +		/*
> +		 * skip padding if the base ACK packets already meets/exceeds probe_mut
> +		 */
> +
>  		if (len > probe_mtu)
>  			goto skip;

[Severity: Low]
This isn't a bug, but the comment doesn't match the code below it. The
goto skip jumps past rxrpc_send_ack_packet():

    rxrpc_send_ack_packet(call, nr_kv, len, ack_serial, why);
skip:
    rxrpc_free_ack(call);

so the whole ACK is dropped, not just the padding. The test is also
len > probe_mtu, so the "meets" case doesn't take this branch.

Both new comments also misspell probe_mtu as "probe_mut".

> -		while (len < probe_mtu) {
> +		/*
> +		 * pad the probe packet with zero pages up to probe_mut,
> +		 * ensuring we never write past the fixed capacity of
> +		 * local->kvec.
> +		 */
> +
> +		while (len < probe_mtu && nr_kv < ARRAY_SIZE(call->local->kvec)) {

[ ... ]

> diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
> index fa9a406e11683..a2f87137bb7e9 100644
> --- a/net/rxrpc/peer_object.c
> +++ b/net/rxrpc/peer_object.c
> @@ -207,11 +207,21 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
>  	peer->tx_seg_max = dst->dev->gso_max_segs;
>  	dst_release(dst);

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch. Does
the AF_INET6 error path in rxrpc_assess_MTU_size() leak the dst
reference?

    dst = ip6_route_output(net, NULL, fl6);
    if (dst->error) {
        _leave(" [route err %d]", dst->error);
        return;
    }

ip6_route_output() always returns a held dst, including ip6_null_entry
after dst_hold(). The dst_release() above is only reached on success.
Other callers, such as ndisc.c and ip6mr.c, release the dst on error.

This function runs for every new peer and every incoming call. Each
failed IPv6 lookup therefore leaks one reference, usually on
ip6_null_entry or a reject route.

>  
> -	peer->max_data		= umin(RXRPC_JUMBO(1), peer->if_mtu - peer->hdrsize);
> -	peer->pmtud_good	= 500;
> -	peer->pmtud_bad		= peer->if_mtu - peer->hdrsize + 1;
> -	peer->pmtud_trial	= umin(peer->max_data, peer->pmtud_bad - 1);
> -	peer->pmtud_pending	= true;
> +	/*
> +	 * Avoid unsigned underflow if the interface MTU is smaller than the
> +	 * transport header size (e.g., on virtual interfaces with MTU 0).
> +	 */
> +	unsigned int max_mtu = peer->if_mtu > peer->hdrsize ?
> +			       peer->if_mtu - peer->hdrsize : 0;

[Severity: Medium]
Does this cover every place where if_mtu - hdrsize can underflow?
Several remain unguarded.

rxrpc_init_peer() runs while if_mtu is still 0 from kzalloc:

    peer->hdrsize += sizeof(struct rxrpc_wire_header);
    peer->max_data = peer->if_mtu - peer->hdrsize;

so max_data always starts at about 0xFFFFFFC8.

The block at the top of rxrpc_assess_MTU_size() only ever raises
max_data, and it underflows itself when hdrsize > 1500:

    peer->if_mtu = 1500;
    if (peer->max_data < peer->if_mtu - peer->hdrsize) {
        ...
        peer->max_data = peer->if_mtu - peer->hdrsize;
    }

Both route failure returns (IS_ERR(rt) for IPv4, dst->error for IPv6)
happen before the new guard. The wrapped max_data then stays for the
life of the peer. That breaks the DF check in rxrpc_send_data_packet().
Once ackr_adv_pmtud is set, it also puts maxMTU =
umax(max_data, rxrpc_rx_mtu) into ACK trailers.

rxrpc_fill_out_ack() also has no guard:

    if_mtu = call->peer->if_mtu - call->peer->hdrsize;
    if (call->peer->ackr_adv_pmtud) {
        max_mtu = umax(call->peer->max_data, rxrpc_rx_mtu);
    } else {
        if_mtu = umin(if_mtu, 1444);

With ackr_adv_pmtud set, an underflowed ifMTU is sent on the wire. The
connection-level final ACK in rxrpc_conn_retransmit_call() uses the same
expression. On receive, rxrpc_input_ack_trailer() clamps this field to
[500, 65535].

rxrpc_new_incoming_call() also calls rxrpc_assess_MTU_size(local,
call->peer) for every incoming call, including calls that reuse an
existing peer. hdrsize is only reset in rxrpc_init_peer(), so on xfrm
routes this line:

    peer->hdrsize += dst->header_len + dst->trailer_len;

keeps adding to hdrsize each time a remote client opens a call. hdrsize
eventually exceeds if_mtu, and as an unsigned short it can wrap.

Should these be handled too, since the commit message targets the
if_mtu < hdrsize case?

> +
> +	/* Clamp payload ceiling and PMTUD binary search bounds to link limits */
> +	peer->max_data      = umin(RXRPC_JUMBO(1), max_mtu);
> +	peer->pmtud_good    = umin(500, peer->max_data);
> +	peer->pmtud_bad     = peer->max_data + 1;
> +	peer->pmtud_trial   = peer->max_data;

[Severity: High]
Does this limit path MTU discovery to a single jumbo subpacket?
max_data is clamped to RXRPC_JUMBO(1) = 1440, so pmtud_bad is now at
most 1441. Before, it was if_mtu - hdrsize + 1, e.g. 8945 on a 9000 MTU
link or 65480 on loopback.

In rxrpc_input_probe_for_pmtud(), once the first 1440 probe succeeds,
good becomes 1440 and the next call takes this branch:

    if (good >= bad - 1) {
        conn->pmtud_probe = 0;
        peer->pmtud_lost = false;
        return;
    }

Every step of the jumbo ladder there needs bad > RXRPC_JUMBO(2), which
is 2856:

    if (good < RXRPC_JUMBO(2) && bad > RXRPC_JUMBO(2))
        trial = RXRPC_JUMBO(2);
    ...

so none of those branches can run any more. pmtud_jumbo =
(max_data + 4) / 1416 stays at 1, and rxrpc_transmit_some_data() uses:

    int limit = min(space, max(call->peer->pmtud_jumbo, 1));

As a result, jumbo DATA packets are never sent to any peer. Even on a
1500 MTU link the search stops at 1440 instead of 1444.

pmtud_bad is also documented as the smallest non-working MTU probe
tried, but max_data + 1 was never probed.

Only the underflow guard seems to be needed. Would keeping
pmtud_bad = max_mtu + 1 (with the guarded max_mtu) and
pmtud_trial = umin(max_data, max_mtu) preserve the old search range?

> +
> +	/* Only schedule PMTUD probing if the link supports more than the floor */
> +	peer->pmtud_pending = peer->max_data > peer->pmtud_good;

[Severity: Low]
When if_mtu <= hdrsize, this code stores max_data = 0, pmtud_good = 0,
pmtud_bad = 1 and pmtud_trial = 0. Elsewhere, 500 is treated as the
minimum for max_data, for example in rxrpc_adjust_mtu():

    max_data = max_t(int, mtu - peer->hdrsize, 500);

and in rxrpc_input_ack_trailer():

    max_mtu = clamp(max_mtu, 500, 65535);

Is a max_data of 0 intended? rxrpc_adjust_mtu() and the ACK trailer
path can only lower it, and rxrpc_input_probe_for_pmtud() returns
immediately (0 >= 1 - 1). It therefore stays 0 until the next
re-assessment.

While it is 0, this check in rxrpc_send_data_packet() is true for every
first transmission:

    if (seq == call->tx_transmitted + 1 &&
        len >= sizeof(struct rxrpc_wire_header) + call->peer->max_data) {
        rxrpc_local_dont_fragment(conn->local, false);

so DF is cleared on all new DATA packets, and /proc/net/rxrpc/peers
shows max_data as 0. Before this patch, the same case gave
max_data = 1440.

The "more than the floor" comment is also a bit misleading, since
pmtud_good = umin(500, max_data) can be below 500.

>  
>  	_leave(" [if_mtu %u]", peer->if_mtu);
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111144846.838278-1-gowtham398gs%40gmail.com
