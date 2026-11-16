Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816369;
	b=AFQpoMlH7R5WeR5+DTezZ+S7EBLp22wyOz1pT9LFBP9FBNoJTYnGDZbtzQFrc0kqhrp0
	 F5u7sZufSzAa06TgrKkdssRMFI3WtQ0Xslm14/f6FLdyxCJrUYgxs1l27IBY4lZ7bX0bE
	 ewu/7i3m5MOr66CVJSkb/R3OaD5rvI2ZpGURZd6SYB5oaebn3X+/L6rvHZ71YmxeDlFgN
	 Zpj0jb/D+t3OvIvxQPsF1XGd9yIwMAbiZFpzJsZTcG0Cwl93KH3iakMW55NRdYzX2FLFE
	 3r0qbJXl3YQ/mE4NkrzzErpaUCbcWBv6piyUg6cSaZLKJjWLWE5rt0K/D7hUVeVZf5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816369;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WrNMjZ1cg44sx/ddOkwvwb0oBthUqp7HvPVwzzPtlto=;
	b=juZQ+UOaidHjdMBesEJ5GdQQ2v1ttaNcccpxUPgq9fv3cHFfo4diADsVfV9KqA1TcCvC
	 kEFFZDzvAKc0Lt8eSLySEXDyXpCJGCJDocDFFpXnRrxKp1gYRaexzepNjW6oKVUqnOaZ/
	 uEuqVBjDX7KJBj69ne5aTG3cAlUx6XD8w+UxXqfjIUZdaj9um6PNCC21jt7xC0oMZRGPd
	 1DHJRxuAoD0wrFbc7xusJ1ueyRcZzxJSgmWR5G6eu4eneDVZ84UzW6wOuWheq2LGx2ONI
	 bI2ZXPB47Sm5iiqbnGByNqEt+LOgRlc9Cm9QrLEGDJD0HXMTIXbwjVJDsQv2LVkryuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eR3HSG8a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC8606A323;
	Mon, 16 Nov 2026 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eR3HSG8a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E148C1F000C5;
	Mon, 16 Nov 2026 08:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794816368;
	bh=WrNMjZ1cg44sx/ddOkwvwb0oBthUqp7HvPVwzzPtlto=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eR3HSG8aqQvCc5iKa7+OuPC3WTp+uZjio6dYKNneCQYilzYfVf/cyyNo9qyjpE+KH
	 kel5CAqKTPzl8tSwRBK59MK9RZdMltpS0LGUTKiYVN7vC5HnjV6rwDc8EAwL6Emais
	 konJTZuJQnIvpsIbOzrwNJd3Cdznws/DmtPrtqy68Dsgga5wbIin6LyUTpbqSeAmRa
	 N2m1FVHmA5xDlA/PB8BYn2oLWD4gxLf254OYXN9jQNzEk0vSvGZRMeSkAsEfyQ57IK
	 79/myxEKgQiI19jtCQOPs3n6JK/esVHnWInJdW6/NpKD5IZKZtdXyVAJBVVmEq4o7s
	 ykDvjMFCtoi6A==
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date: Mon, 16 Nov 2026 08:06:07 +0000
Message-ID: <179481636739.3136.18135231904320788064@kernel.org>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
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

- [Medium] ethtool: unagreed UAPI addition of
  ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL

--

> diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
> --- a/include/uapi/linux/ethtool_netlink.h
> +++ b/include/uapi/linux/ethtool_netlink.h
> @@ -202,6 +202,7 @@ enum {
>  	ETHTOOL_A_STATS_PHY_TX_PKTS,
>  	ETHTOOL_A_STATS_PHY_TX_BYTES,
>  	ETHTOOL_A_STATS_PHY_TX_ERRORS,
> +	ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
>  
>  	/* add new constants above here */
>  	__ETHTOOL_A_STATS_PHY_CNT,

[Severity: Medium]
This patch adds three things:

  - ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL to the uAPI enum
  - a new RxOctetsTotal entry in stats_phy_names[]
  - rx_bytes_total in struct ethtool_phy_stats

Once this ships, the attribute and the string are uAPI. We cannot
change or remove them later.

On v3, Andrew and Oleksij both objected to adding generic PHY counters
just because the ACx00 happens to expose the registers. They asked for
a concrete use case. v5 drops the packet total by deriving it in the
driver, but the byte total is still here. I don't see that use case
answered in the commit message.

What does user space do with RxOctetsTotal that it cannot already do
with RxOctets, RxErrors and the MAC level counters?

The patch also rewrites the kernel-doc for the existing rx_bytes field.
It now says the count includes header, padding and FCS, and excludes
preamble and SFD. That narrows the meaning of a counter drivers already
report through stats_put_phydev_stats(). Two questions on that:

  - Have the drivers that already fill phydev_stats.rx_bytes been
    checked against the new definition?
  - What should a PHY that counts preamble/SFD, or uses some other
    boundary, do? Leave both counters at ETHTOOL_STAT_NOT_SET, or
    report a value that doesn't match the documented semantics?

I'd like the PHY maintainers to agree on the semantics before this
goes in. If ACx00 is the only user, could the errored-frame byte
total stay a PHY driver private statistic for now?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373%40gmail.com
