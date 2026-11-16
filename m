Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837055;
	b=QRIrixVXGRFOS0vK7pFr7R7jkYxlSAURx5l543u27GjgCko289LodRbQdDmdX0dZHXpC
	 yawRr7aArjQrEE1IzJgI7zzLhlAqj89oqlQZlX78dbBgMs1/XmMIfOxNvFYcQgT0JACob
	 XpIZsNpyj8w5OFhecyD+S0FZQVNmT+OnpBa6I9YBbM9JCBMwd2QX/xy9JQMfxCR3lgjTv
	 hhSS6USDYSgEKOBGS0TiZgfu8OSHQ9AcECw9i1J7tBIXZi4DC0SnuBr5zo75y4EKKU/+/
	 ibpYITsG3IjywbYs2hqxDWLodnieWaI7OKltOS0NKWZxXE34RJdCk0IdJQ4VNeTMo3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837055;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8b871WDqcJhHO7oSApD+GPocLTUTSN7bR7eaowyl3bY=;
	b=tAGc4aX35L3XEUQVuGi2rMZFDaD1w7TmHFzeJjo+nXoeLE8TR3JLhBehinycDPBNeTXV
	 Wf1FFVaVHy17/S3v1HIuZfSvsCGDr3lhlA6OuQnK/nZaJVYFPwIXO+fgJPSJB4oA9oEDh
	 cuXPA2PoqOePCDmtQmDryQ0eAHZW/gnbqCK2OcQwHwWa2CVyDWirSW+DyFJSTP2ynO+0j
	 2YOm2Fwc9aJ5JEbmosV/Frj6PsLQHXBsNj7tciuRkHAncX5HDQ0iht6NC7aHIdhX2dtcr
	 nw+lG+eJ9GaalFPq8f2g4ZSlELS70yoxCar5kGJk6QRKNPFB4vmuhBgxoLZbCYPoHaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gu3q8FpB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB26085932;
	Mon, 16 Nov 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gu3q8FpB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCE81F0093B;
	Mon, 16 Nov 2026 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837055;
	bh=8b871WDqcJhHO7oSApD+GPocLTUTSN7bR7eaowyl3bY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gu3q8FpBb025ztZ0rHT/RNpY2eTdaRrJnLF1yqiA4ztz8bfaOLlY6GU5vsDTKCOFF
	 8Bgo/YMSMsC0O7uwy06fIeH6oaxKTBpsT3qdTA5O6FG7HMkNUHUNcL+QrI0SmPttDq
	 QI5vqk5b7v2Xg9TEsd3sRDqro70KYqmGI9zQ/xn/+zPjnVqsCsn647/mKDd/RaTODt
	 fxPH6h8MQGHEvmICKDq1JllTD55YyM81ean5EeAMN9KrDOzooPN0lXMhrZPRZKQhrc
	 7jvAMSdJDK8ayy62p1w+uaQdrvYejFWs4/XjH0UJdaq+Qxqiiomh/45deV+ppg/HNQ
	 scnV+1+A1LM6g==
Subject: Re: [PATCH net v2] ipvlan: update port flags only after
 ipvlan_set_port_mode() succeeds
From: netdev-bot+sashiko@kernel.org
To: sunwenbo@cmss.chinamobile.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, hangbin.liu@linux.dev, kuniyu@google.com,
 maheshb@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 1342116488@qq.com
Date: Mon, 16 Nov 2026 13:50:54 +0000
Message-ID: <179483705411.3136.2665029224845053782@kernel.org>
In-Reply-To: <20261112064821.85624-1-sunwenbo@cmss.chinamobile.com>
References: <20261112064821.85624-1-sunwenbo@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.

--

ipvlan: update port flags only after ipvlan_set_port_mode() succeeds

This patch moves the write of the shared port->flags in ipvlan_link_new()
to after ipvlan_set_port_mode() has succeeded. The goal is that a failed
creation of a second ipvlan on an active port does not change the flags
of the ipvlan interfaces that already exist.

> diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
> index f29864db662aa..5732b167c5b3c 100644
> --- a/drivers/net/ipvlan/ipvlan_main.c
> +++ b/drivers/net/ipvlan/ipvlan_main.c

[ ... ]

> @@ -691,6 +685,12 @@ int ipvlan_link_new(struct net_device *dev, struct rtnl_newlink_params *params,
>  	if (err)
>  		goto unlink_netdev;
>  
> +	/* Flags are per port and latest update overrides. User has
> +	 * to be consistent in setting it just like the mode attribute.
> +	 */
> +	if (data && data[IFLA_IPVLAN_FLAGS])
> +		port->flags = nla_get_u16(data[IFLA_IPVLAN_FLAGS]);
> +

[Severity: High]
Can a failed RTM_NEWLINK still overwrite the shared port->flags here?

The commit message says:

  "Defer updating port->flags until after ipvlan_set_port_mode() succeeds,
  after which ipvlan_link_new() has no remaining failure paths."

When ipvlan_link_new() returns 0, the creation is not yet committed. The
caller, rtnl_newlink_create(), can still fail after ops->newlink():

net/core/rtnetlink.c:rtnl_newlink_create() {
    ...
	err = rtnl_configure_link(dev, ifm, portid, nlh);
	if (err < 0)
		goto out_unregister;
	if (tb[IFLA_MASTER]) {
		netdev_lock_ops(dev);
		err = do_set_master(dev, nla_get_u32(tb[IFLA_MASTER]), extack);
		netdev_unlock_ops(dev);
		if (err)
			goto out_unregister;
	}
    ...
out_unregister:
	if (ops->newlink) {
		LIST_HEAD(list_kill);

		ops->dellink(dev, &list_kill);
		unregister_netdevice_many(&list_kill);
    ...
}

For ipvlan, the dellink callback is ipvlan_link_delete(), which calls
__ipvlan_link_delete(). Neither function restores port->flags. When
port->count > 1, the shared port survives with the flags from the failed
request.

The IFLA_MASTER failure is easy to trigger. A new ipvlan has no master
upper device, so do_set_master() goes straight to the ifindex lookup. That
returns -EINVAL for a nonexistent ifindex, or -EOPNOTSUPP for a device
without ndo_add_slave, such as lo.

For example, with ipv1 on eth0 in bridge mode, this command fails but
leaves ipv1 in private mode:

  ip link add link eth0 name ipv2 master lo type ipvlan mode l2 private

The port->mode change made by ipvlan_set_port_mode() also persists on this
path. Moving the assignment within ipvlan_link_new() cannot cover this
case.

Would this need port state to be saved and restored across the whole
rtnl transaction, for example by restoring it from dellink when creation
is rolled back?

>  	mutex_lock(&port->pnodes_lock);
>  	list_add_tail_rcu(&ipvlan->pnode, &port->ipvlans);
>  	mutex_unlock(&port->pnodes_lock);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112064821.85624-1-sunwenbo%40cmss.chinamobile.com
