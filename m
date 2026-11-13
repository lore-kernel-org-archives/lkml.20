Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553219;
	b=wuN/55u8mYy8QlU+q60Ww7ApfZ1WcjLJj6dcL6SLZyr9al9jJfQA0jYs2iMjEvxUqvrJ
	 r9K/3X1FAlgVYoKPwui1QaogXA2qkyff3Q5kQyUZfsuWj1gQ7xnu0VuWKub6b+5ds8kfO
	 kF65uxqJyO58gjmADZw+8UCiuzEpC1C8etUS4SYXON8EHqGICtACnDhThXmUKF1wsXChl
	 TOju7jPJ/BaOFlpsfTxYeXqoPw+TBrxRFnQ4YU5iby3rwu0pkXxkSQKMbJPjHN3S3D6+P
	 7qNXMKKZv8dE9kmoko/POjYS81p9m9tNl2f8yL3lzOYZ2aGQj4oWneQQ9v809Ogcc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553219;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Jur7gNXc6RzoFtUMGnJVIEqiUFT1JmH94eldE2nDLN8=;
	b=w0x3DHUaUTDtESLN92XnG6k40ebtpzhOKYIL9zjVtYl9+BthoouegZHbcYBGp46spvgn
	 jZAcqpCSi97BFtqg/+4Ala3ZA5GBB4+TSNVPl67abkE0+PuLGcIS98MsofXqDweoVpVHv
	 Uc1ESx2SopvguN5u9mj4x1vxNLsdq4JRKp/70emgnRmrqHD2wkhrk8NksWwYodzbC0jG4
	 NL31Ht6k7ZdoVKlhOHjp33XvIr82AsA1YLG/k3VTzn6eGHt5aNitmqOdlB4xPoRQvmJxe
	 354L4KNwn0Fss2/utCzLhmDpZq2+LsjHKldOXa6SfAMEy6SlN82kN8ZbMtrOinYlI4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Tqw1fNE/";
	arc=none smtp.remote-ip=95.215.58.228
Received: from mta1.migadu.com (out-228.mta1.migadu.com [95.215.58.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71905606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71905606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tqw1fNE/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OtHw3peLgX5/dKrGXdziPiu8mcwronXxshx2E3w49H8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794553216; v=1; x=1795158016;
 b=Tqw1fNE/WQ9mGgcON8/k9q3I+RxbSRraju843BWR9PxxCo/wK4bOLhmg5/y/AzMe8zMyvyn3
 BK0D0KfNyxvCEKXxiZBDDXx5Z19YeP6tPLqM03zx365GhS8NSDoo+kF1QwNmLEy6aLUxAdhMnAq
 ldkhvkVARuG8Ce3DAQcLEcFY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 705d8f2ee70e3f91;
	Fri, 13 Nov 2026 07:00:14 +0000
X-Mizu-Trace-ID: 705d8f2ee70e3f91
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 15:00:06 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Mahesh Bandewar <maheshb@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net v2] ipvlan: update port flags only after
 ipvlan_set_port_mode() succeeds
Message-ID: <ava1dpa2Vd4Cyv0G@fedora>
References: <20261112064821.85624-1-sunwenbo@cmss.chinamobile.com>
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
In-Reply-To: <20261112064821.85624-1-sunwenbo@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 02:48:21PM +0800, Wenbo Sun wrote:
> In ipvlan_link_new(), port->flags is updated before calling
> ipvlan_set_port_mode(). If ipvlan_set_port_mode() fails (for example,
> when switching to L3S mode without CONFIG_IPVLAN_L3S), error unwinding
> calls unregister_netdevice(dev) via unlink_netdev.
> 
> While unregister_netdevice(dev) destroys the port when creating the first
> ipvlan device on a lower interface, struct ipvl_port is shared across all
> ipvlan interfaces on the same lower device (tracked via port->count). If
> another ipvlan interface already exists, unregister_netdevice(dev) only
> drops the extra reference and leaves the shared port alive with the
> updated port->flags, unintentionally altering the flags of existing
> ipvlan interfaces.
> 
> Defer updating port->flags until after ipvlan_set_port_mode() succeeds,
> after which ipvlan_link_new() has no remaining failure paths. This avoids
> modifying port->flags on failure without needing to save and restore it,
> matching ipvlan_nl_changelink().
> 
> This issue was identified with the assistance of an LLM-based code
> review tool, confirmed in a User-Mode Linux (UML) environment by creating
> a second ipvlan interface that fails in ipvlan_set_port_mode(), and
> verified in UML that the existing interface's port flags remain
> unchanged upon failure.
> 
> Fixes: a190d04db937 ("ipvlan: introduce 'private' attribute for all existing modes.")
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
> ---
> v2:
>   - Clarify in the commit message that when creating a second or
>     subsequent ipvlan interface on an already-active port,
>     unregister_netdevice() only drops the extra reference rather than
>     destroying the shared port, and explain why deferring the update
>     avoids needing to save and restore port->flags (Hangbin Liu).
>   - Soften and clarify the wording in the commit message.
> v1: https://lore.kernel.org/netdev/20261111064655.233265-1-sunwenbo@cmss.chinamobile.com/
> 
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

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
