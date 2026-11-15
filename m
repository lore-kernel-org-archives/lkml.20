Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760956;
	b=Tzhi3wEsWzKKMjDlGtmacIQHr2jtxXGcD/AVvKLcN4p/4hWVtjkVSLmpdWJsyXDK/KyD
	 Xy6ZmwO7v7IPMe1+DfDGK6k3b9bW2Fo8Ub6tJvb3uXytu7ij+dVKd7Kg4qHpo0FKrJdyX
	 SZ4xRPtNqSd12lAvuW3m6NESu0UbTIgN8i91xXJGNo/yZnbfom93XbjvvnX9palJWOfYm
	 nJSpFX26q/tfBQ8fqu/LgiaK8xMQ7XoCvDqMRXCiFUVGYmJQazl2TxGrsBA6xa0JwIWFd
	 e/9XaDI53yG7+LoB3BWP04+UrAkXuWbkLi0C59FlDF3HCwq8wMlnVMuqD1on2ohlo9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760956;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=eFPfB38MvkeNGjDVSx4Pv8v8DcKjA8PCK5ZW0XvuVkg=;
	b=lcM3zCf9D+e2UEOv90uUy4Tz1x1HTkYgHuKivBZQn959nrHJ97uuYDQpKyyrQFunDq5V
	 PsAPA0oK5W6K8JJ78jlDB/Z1nCk/1EjVyOuRQ0tM9rEzFiZYIeLc5v1D0NGCEplBDVw1Z
	 ADfbENnX+p+hlTSOgciY0TIR4nW3ERhTFC6YhBage65B1qsA/w9Eclvkgqw/iZs6jbwTD
	 GWOOqv/wVpXcgY2jVqpXNMLwZlJnKgWi7ELt7pkeaaKOsVI+bXiBtlNQWf+pC5tKJi30q
	 +kmAyMHgdr2m3FgV/cePZgcicnAmLkewTeDBztBKx3iNz/8gvcsv7F/359UEWZSyRbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewnJUitb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC08606A31D;
	Sun, 15 Nov 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ewnJUitb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1411F000C5;
	Sun, 15 Nov 2026 16:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794760956;
	bh=eFPfB38MvkeNGjDVSx4Pv8v8DcKjA8PCK5ZW0XvuVkg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ewnJUitbYcRSmeAqXxKMb/EO995fz/VHAl7payGa3yw4ydihc3GYGgvSbkSOwk4ND
	 /A3yoD1asUdPSricBR5SSiK4yMivD0hhZMfwRv+xLMZItQBEckZ5hw5EF738NX92c+
	 l6HjqOijS3GcQk/tvQ5WXnhejtcxCgaeeMPm4tHA+8U+N1WPOT3Q494TAuCLydpvzm
	 vEZvvuPTyRsmUAf/i9iWVuSL7lO8KmQGm7Oah/HcdiVX4OhAfJrKZbn9p8LX/cKUvF
	 7FpYM6Hqt4JGGydblMQ6QFBygzvEMpkBlQAgW1arQSObRCofhxv3wY8s5Y1zS/xYYI
	 gfEddFtYiUNTg==
Subject: Re: [PATCH net-next v17 1/4] net: dsa: add tag driver for LAN9645X
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
Date: Sun, 15 Nov 2026 16:42:34 +0000
Message-ID: <179476095473.2199510.3725439999561374295@kernel.org>
In-Reply-To: <20261111-dsa_lan9645x_switch_driver_base-v17-1-83a471c5bddb@microchip.com>
References: <20261111-dsa_lan9645x_switch_driver_base-v17-1-83a471c5bddb@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The receive and transmit halves of the LAN9645x tagger
  disagree about which bridge VLAN protocol they support, and nothing…

--

net: dsa: add tag driver for LAN9645X

This adds a DSA tag driver for the Microchip LAN9645x switch, which uses a
front port as an NPI CPU port. Extraction uses a 16 byte long prefix plus a
28 byte IFH, and injection uses the IFH only. On receive, VLAN tags popped by
the hardware are restored as hwaccel tags; on transmit, VLAN tags are moved
into the IFH.

> diff --git a/net/dsa/tag_lan9645x.c b/net/dsa/tag_lan9645x.c
> new file mode 100644
> index 0000000000000..95caf4e0cc663
> --- /dev/null
> +++ b/net/dsa/tag_lan9645x.c
> @@ -0,0 +1,514 @@

[ ... ]

> +static struct sk_buff *lan9645x_xmit_get_vlan_info(struct sk_buff *skb,
> +						   struct net_device *br,
> +						   u32 *vlan_tci,
> +						   u32 *tag_type)
> +{

[ ... ]

> +	br_vlan_get_proto(br, &proto);
> +
> +	*vlan_tci = 0;
> +	if (skb->len >= VLAN_ETH_HLEN) {
> +		if (unlikely(!pskb_may_pull(skb, VLAN_ETH_HLEN))) {
> +			kfree_skb(skb);
> +			return NULL;
> +		}
> +
> +		hdr = skb_vlan_eth_hdr(skb);
> +		if (ntohs(hdr->h_vlan_proto) == proto &&
> +		    ntohs(hdr->h_vlan_TCI) & VLAN_VID_MASK) {
> +			vlan_remove_tag(skb, &tci);
> +			*vlan_tci = tci;
> +		}
> +	}
> +
> +	*tag_type = (proto != ETH_P_8021Q) ? LAN9645X_IFH_TAG_TYPE_S :
> +					     LAN9645X_IFH_TAG_TYPE_C;
> +
> +	return skb;
> +}

[ ... ]

> +static struct sk_buff *lan9645x_rcv(struct sk_buff *skb,
> +				    struct net_device *ndev)
> +{

[ ... ]

> +	if (ifh_gap_len) {
> +		/* The tag is restored as a C-tag, not as the TAG_TYPE the IFH
> +		 * reports. The classifier recognizes both TPIDs as VLAN tags,
> +		 * so an S-tag has already been used for classification by the
> +		 * time we get here. Restoring it as 802.1AD would make the
> +		 * bridge push it back into the payload and reclassify the frame
> +		 * to the port pvid, on a different VID than the one the
> +		 * hardware forwarded it on.
> +		 */
> +		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vlan_tci);
> +	}

[Severity: Medium]
Do the transmit and receive paths agree on which bridge vlan_protocol is
supported?

The commit message says:

  This assumes a bridge vlan_protocol of 802.1Q, which is the only
  protocol the driver offloads.

lan9645x_xmit_get_vlan_info() does three things:

- It reads the bridge protocol with br_vlan_get_proto().
- It strips a payload tag whose TPID matches that protocol, and the protocol
  can be 0x88a8.
- It sets LAN9645X_IFH_TAG_TYPE_S when the protocol is not ETH_P_8021Q.

So the transmit path looks written for 802.1ad bridges. lan9645x_rcv(), on
the other hand, always restores the popped tag as ETH_P_8021Q.

Does anything enforce the 802.1Q-only assumption?

__br_vlan_set_proto() in net/bridge/br_vlan.c sends
SWITCHDEV_ATTR_ID_BRIDGE_VLAN_PROTOCOL with SWITCHDEV_F_SKIP_EOPNOTSUPP and
ignores -EOPNOTSUPP:

	err = switchdev_port_attr_set(br->dev, &attr, extack);
	if (err && err != -EOPNOTSUPP)
		return err;

Nothing under net/dsa/ handles that attribute. So it looks like
"ip link set br0 type bridge vlan_protocol 802.1ad" cannot be vetoed, even
after lan9645x ports have joined the bridge.

Here is what would happen on such a bridge:

- Every popped S-tag reaches the bridge as a 0x8100 hwaccel tag.
- br_allowed_ingress() sees that skb->vlan_proto != br->vlan_proto.
- It pushes the tag back into the payload as a C-tag that was never on the
  wire.
- It classifies the frame to the port pvid, not the VID the hardware used.

Meanwhile the transmit path treats S-tags as bridge VLAN tags.

At this point in the series the switch driver has no .port_bridge_join and
does not program VLAN popping. So dp->bridge is NULL and no tags get popped.
The problem would only become reachable once VLAN-aware bridge offload is
added.

Would it make sense to use one model in both directions? One option is to
drop the LAN9645X_IFH_TAG_TYPE_S handling on xmit and reject 802.1ad. The
other is to handle the TPID the same way on transmit and receive.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-dsa_lan9645x_switch_driver_base-v17-0-83a471c5bddb%40microchip.com
