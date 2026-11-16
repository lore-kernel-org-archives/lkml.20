Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837053;
	b=dDNWTT7aXaQP3ek7U4rxtBAHb7Q+d1Zpzs3eVNS5cBDYObZfVbnhU7MtMKWTFCm1CUR7
	 bzv3TF1ZeG6NRNQ1pv8AoZ7J5Cfc5FkHsX7eQ/1i1KGGu4Q+dvUO+ejUD5dt2ljvOcznN
	 rPcHj4v0GR6CdrQf+aLic8F6O1Hn77Kfi62Iiv5Sfc4N0Ha7Sq156QaU01EqP7QCSQLmy
	 1FVOIau8HcMAn2TbyZGsMZYxyq5aRRmNIWF9PjaEosgDuNzMj/g8Clz0KmZL0rVlxLvCe
	 hKCAq65ydBwpLQocHf6ySjTxgBosSxBbYcwEe1TP3pPpLjWa2SGRQ654UH8yojsKxUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837053;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IQPaGDuA0dXaRrtGSz5VxiNlPWjICEZ74VcwXr9qXXs=;
	b=FITJL0G1/lqEspmIWb4DMObf2PVGJYNdZhn06uig7c7D5gbRLP0KsvLUUqT/FwHfsEgM
	 +slY1PddSq6jk8Q66YEiLr7f+FJPNMDk1GziCoETW58dMzdh2Obp4zu/6SbZK+WFMsVKZ
	 v+RBlxUhEcQd5UHvt1Qbd4Ilhdy3TqaEHrcf34MeOVX5k48SE5tEnJcd0Yp+5C7HWHRca
	 6Y5vPMnNNLR1nuuD2vpi+d5IA5DH78OSu/LHSqtyIdBUiPjWjH/2T6naiSzUjpMTyTtZM
	 v1h/Ys2JQz6sjNZmWZoKvPXX1wUBnzlSPwINVbJiUF1A7jYHb0iev3kMqgHcDnxrbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXl9Dn4Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A284F60A6F71;
	Mon, 16 Nov 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXl9Dn4Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0771F000C4;
	Mon, 16 Nov 2026 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837053;
	bh=IQPaGDuA0dXaRrtGSz5VxiNlPWjICEZ74VcwXr9qXXs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UXl9Dn4Yu5JeahgDzpXB5A+QnDGFe9oH+Yo6x4m8hKBfAvzEAvTk7LUE8oqXyI+gW
	 eLqrZnP4HfKBUeGn9Yxqe5T34V+iNf0+Tt/6ech/ehIhzANMKZayWGoR6EJtveEkKe
	 IEymI5eCEDIf0Yj4juqb1KFhSZD5ywg9zd6I1jEwG8yvRFoJhG4KdAzIvZjIPZzp0z
	 2ZbTQiPJKung3WsVcj46NAu4ua/JASJ6FR/RiMB1kRNZ1mNoxbZwYg8D/7ktFxZA25
	 6aA4C6Tew07aV2k6ESH3nxyzY/DQac2Jj0wBclrAejjDg3n1p5j9+UeCH4FpUvohL+
	 LO8EAAewiix6A==
Subject: Re: [PATCH net v2 12/12] net: au1000: reject frames larger than the
 TX bounce buffer
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org, jeff@garzik.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Mon, 16 Nov 2026 13:50:51 +0000
Message-ID: <179483705182.3136.18065066878486336390@kernel.org>
In-Reply-To: <20261112045301.3669532-13-f.fainelli@gmail.com>
References: <20261112045301.3669532-13-f.fainelli@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message understates how the overflow can be reached.

Pre-existing issues:
- [High] Several other drivers in drivers/net/ethernet/amd/ have the same
  unchecked copy of skb->len bytes into a fixed-size TX buffer.

--

net: au1000: reject frames larger than the TX bounce buffer

This patch adds a length check to au1000_tx(). Frames larger than
MAX_BUF_SIZE are now dropped and counted in tx_dropped instead of being
copied past the end of the TX bounce buffer.

> au1000_tx() copies skb->len bytes into a MAX_BUF_SIZE coherent buffer
> without checking the length. Oversized non-GSO packets can reach this
> path through AF_PACKET with PACKET_VNET_HDR and PACKET_TX_RING, whose
> MTU checks are skipped when a virtio header is present.

[Severity: Low]
Is this description narrower than the real exposure? It reads as though
PACKET_TX_RING is required. The plain sendmsg path through packet_snd()
seems to get to the same place:

net/packet/af_packet.c:packet_snd() {
    ...
	if (!vnet_hdr.gso_type &&
	    (len > dev->mtu + reserve + VLAN_HLEN + extra_len))
		goto out_unlock;
    ...
}

After that, __virtio_net_hdr_to_skb() only marks the skb as GSO when the
payload is larger than gso_size:

	/* Too small packets are not really GSO ones. */
	if (skb->len - nh_off > gso_size) {

Take a 4000-byte frame sent with gso_type=TCPV4 and gso_size=65000. It
would skip the MTU check and reach au1000_tx() as an ordinary non-GSO skb.

Real GSO skbs also get through, because gso_size is never checked against
dev->mtu. au1000 has no TSO, so validate_xmit_skb() segments them in
software into frames that can be larger than 2048 bytes.

The new check in au1000_tx() catches all of these paths, so the code
looks right. Could the commit message also mention the packet_snd() and
GSO routes?

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index d60430a3795ed..d8855ccf87aa1 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> @@ -1008,6 +1008,12 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
>  	int i;
>  	unsigned long flags;
>  
> +	if (unlikely(skb->len > MAX_BUF_SIZE)) {
> +		dev->stats.tx_dropped++;
> +		dev_kfree_skb_any(skb);
> +		return NETDEV_TX_OK;
> +	}

[Severity: High]
This is a pre-existing issue that this patch did not introduce. Do other
drivers in drivers/net/ethernet/amd/ need the same check?

Several lance_start_xmit() implementations copy skb->len bytes into
fixed-size TX slots with no upper bound. Their slots are smaller than
au1000's 2048-byte MAX_BUF_SIZE, so a frame one byte over the limit
already overruns the slot:

7990.c:lance_start_xmit()
    skb_copy_from_linear_data(skb, (void *)&ib->tx_buf[entry][0], skblen);
    (skblen = skb->len, tx_buf slots are 1544 bytes)

a2065.c:lance_start_xmit()
    skb_copy_from_linear_data(skb, (void *)&ib->tx_buf[entry][0], skblen);
    (skblen = max(skb->len, ETH_ZLEN), tx_buf slots are 1544 bytes)

sunlance.c:lance_start_xmit()
    PIO path: lance_piocopy_from_skb()
    DMA path: skb_copy_from_linear_data(skb, &ib->tx_buf [entry][0], skblen);
    (TX_BUFF_SIZE is 1544)

sun3lance.c:lance_start_xmit()
    skb_copy_from_linear_data(skb, PKTBUF_ADDR(head), skb->len);
    (PKT_BUF_SZ is 1544)

atarilance.c:lance_start_xmit()
    lp->memcpy_f( PKTBUF_ADDR(head), (void *)skb->data, skb->len );
    (PKT_BUF_SZ is 1544)

declance.c:lance_start_xmit()
    cp_to_buf(lp->type, lp->tx_buf_ptr_cpu[entry], skb->data, len);
    (len = skb->len, TX buffers are 1536 bytes)

Using the AF_PACKET route from the commit message, can an oversized frame
in these drivers overwrite the next TX slot and then the RX buffers?

For frames near 64KB, the copy also looks like it would run past the end
of the lance_init_block or shared memory area.

Triggering this needs CAP_NET_RAW in the device's netns. The hardware is
legacy: Amiga, Sun, Atari, DEC and HP300/MVME.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112045301.3669532-1-f.fainelli%40gmail.com
