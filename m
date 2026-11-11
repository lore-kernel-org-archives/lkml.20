Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402151;
	b=L5AiV6r2pCviPrDyPu4mlWlYTw6P83npOmSIqbhmvWDZVWLN6P0KchGORK+TOj2Ev8VP
	 wvc2MsHtVB2fM54fL9V8lr1U7D14jIMsOi+Nxn43JrpakZcqD5zli7Ihp0gRcz2rqRccU
	 K2GZgyDNWZbQiVf3a5v1obOawz6nUgtz2UGmx83ROI7fKm1mMDFI/WQh6Gbt/fbOq1jkA
	 CsjcsP0aX37Z+25yTEKms/PbRhnykCmmFyF/FUNI0niEtPvXRzvhNY/XmZH0ahMBhnBJ5
	 SzvEGcfpiXq3pmLKXuJVPYF+Dt5N1E+RmaaLQ/+fisAnaYDkEKR8t2P73xsh72rt9Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402151;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZmjCZzov7nJPqrXQ8bns94ZLa5rs46LAAXyoFHfy5LQ=;
	b=SZFOrT8r4W4FIsVnKImZnjX3MhEFq3Ekh6kWjHclmkUhcPhIdC5uL+bXTA9sRb+4Evvx
	 1/UVXmB5DOTX/jO5gJ0QjjX+bdn4Z9roZf3kDHgLxaFIf0KD+8jEEhkXrgnVRAsB1n6f6
	 G/f4hW68S0ClLAR/3RqT2N3wYOQJVh4tY+csAKlcgJifQr976/cx9tin8cnV+WfOd3uB3
	 /QgNKlaxripRWBOAWu/2J/Dym3gqoLkra60mFu+S1WyKAZsAp85qe8qIcqh4fXOoOy4rt
	 apVy/2HvY5mEoxBLiKaFfScZUgiP7ElnJ2wZU0zh1jleS3ngBcQhpBqceOl8t11rzog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o92QQvLv;
	arc=none smtp.remote-ip=95.215.58.201
Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o92QQvLv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=creIoMaV/TDbJJXHBFgieSAYV23IyjnaN5agwm7HWcI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794402149; v=1; x=1795006949;
 b=o92QQvLvTiVOT85rEhrXY7WZigN9PTIc0TdKCX3N9uXsbP8w3IsKMNjBxKUcp1QcOMBmm2cf
 ovAPzIzAwpc6hYYnVfCCMwrdJSNL/BwrbAv7h5bqRsYXE5+qz7ZnBSEWv/MIYOBCFBHz8cD/Ecy
 l3D8gm98aA/wmM+8iMlnGUc4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id bc78005be9f94d47;
	Wed, 11 Nov 2026 13:02:28 +0000
X-Mizu-Trace-ID: bc78005be9f94d47
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 21:02:17 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Mahesh Bandewar <maheshb@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net] ipvlan: update port flags only after
 ipvlan_set_port_mode() succeeds
Message-ID: <avRnWUbGFbdfirZB@fedora>
References: <20261111064655.233265-1-sunwenbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111064655.233265-1-sunwenbo@cmss.chinamobile.com>

Hi Wenbo,
On Wed, Nov 11, 2026 at 02:46:55PM +0800, Wenbo Sun wrote:
> In ipvlan_link_new(), the shared port->flags is updated before
> calling ipvlan_set_port_mode(). If ipvlan_set_port_mode() fails (e.g.
> switching to L3S mode without CONFIG_IPVLAN_L3S), the error unwinds via
> unlink_netdev, but the shared port->flags has already been modified and
> is never restored.

If ipvlan_set_port_mode() failed, the unregister_netdevice(dev) will be
called. Does port->flags still need to restore?

Thanks
Hangbin
> 
> As a result, subsequent operations on existing ipvlan interfaces on the
> same lower device operate with corrupted port flags (e.g., VEPA or
> PRIVATE flags inadvertently set or cleared).
> 
> Fix this by deferring the update of port->flags until after
> ipvlan_set_port_mode() returns successfully, matching the behaviour of
> ipvlan_nl_changelink().
> 
> This issue was identified with the assistance of an LLM-based code
> review tool, confirmed by reproducing the state corruption in a
> User-Mode Linux (UML) environment when ipvlan_set_port_mode() fails,
> and verified in UML that the shared port flags remain unchanged upon
> failure.
> 
> Fixes: a190d04db937 ("ipvlan: introduce 'private' attribute for all existing modes.")
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
> ---
>  drivers/net/ipvlan/ipvlan_main.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
> index f29864db662a..5732b167c5b3 100644
> --- a/drivers/net/ipvlan/ipvlan_main.c
> +++ b/drivers/net/ipvlan/ipvlan_main.c
> @@ -678,12 +678,6 @@ int ipvlan_link_new(struct net_device *dev, struct rtnl_newlink_params *params,
>  	if (err)
>  		goto remove_ida;
>  
> -	/* Flags are per port and latest update overrides. User has
> -	 * to be consistent in setting it just like the mode attribute.
> -	 */
> -	if (data && data[IFLA_IPVLAN_FLAGS])
> -		port->flags = nla_get_u16(data[IFLA_IPVLAN_FLAGS]);
> -
>  	if (data && data[IFLA_IPVLAN_MODE])
>  		mode = nla_get_u16(data[IFLA_IPVLAN_MODE]);
>  
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
>  	mutex_lock(&port->pnodes_lock);
>  	list_add_tail_rcu(&ipvlan->pnode, &port->ipvlans);
>  	mutex_unlock(&port->pnodes_lock);
> -- 
> 2.33.0
> 
> 
> 
