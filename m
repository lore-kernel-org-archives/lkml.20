Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444079;
	b=tjICPPdLodogBeRyN3zDWS1Idpn+nCawRTTGuHtYQ6ZGyXz39nB94Uf7A67Gs4KAoi5Z
	 WSH9hoKpI1pPJGvWUtVcFhrqwXSoRSmPYbRG8tegA5YOUdNnbMI6N138PNdhwUU9+qDMl
	 iyQkiwSyxzU5JnzDPIv5PIB08Rga/3h/WPKqK0kG6bxVAtdYedaJ+mjsZ5cV+AO3DKOmB
	 kWmZh8GAgWvCy39cOotW9lguUQ2c028+GKVria+cH0hJsztctr+N4ZvJuGKo+3ebwfvkD
	 kXS80FFnVL7k/6/wnmA7cMjhPK35CQ4G9ws0Yi4tOf6u9gWV1hSMxjQdnGgigMXbBUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444079;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Yw31CXHtALD9+rlXmyh33It7GXnvhUwt2iK6ewaR4dU=;
	b=yHcjy7h7wxLf9GGTwMaybb+crn+YtYm0AbMnQxAGilZO/nxDzITRkq4ubPR9TopH6dT8
	 0F/7kFo38rmQuoPY5LZHvZbEHP4617LCHfM9esTh2FflW1EfQ8yM+7tnT/rCrNlyK/YxD
	 WOkcenrQw643/dHy5Man1h4yKvRWg99qCcVV487fpBddXs4HjIJJ+xcTi10NtqsMGpqWg
	 BjxUTc013TSleFTjVvs/86jV77waefKb4+Bh7NaFNsmLU+t5vwzJmM7+p3LsgXX9EbRG+
	 iCYyE2VTaEj0l7VhEtHkuDuv3DzgriNB+Ap9hHFn5mEb3GZcwMXnFXXjZDAMpfBDXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="YXUgt/QC";
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C00606A326
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YXUgt/QC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G8BSMK/JGL39KoesEzLdLzGnPrhRNJKjOy5VM7SOH3k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794444075; v=1; x=1795048875;
 b=YXUgt/QCbZuZheMKcUZU5r8w8Awez1lahURDOiXCqAoE1DQSjWUJvpcphdLTZvC80s0eZ0I0
 /SepG1YQBZHdF/PJWA4aJkk6uUY7JgiPIw9B1bzHjHB0TyLjybOn0LEXIeeaSdMY+LGtx54RCA/
 H73NYgWKAYioqx0aI/qZctGA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7f7faac83d7e72b7;
	Thu, 12 Nov 2026 00:41:15 +0000
X-Mizu-Trace-ID: 7f7faac83d7e72b7
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 08:41:04 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	MD Danish Anwar <danishanwar@ti.com>,
	Murali Karicheri <m-karicheri2@ti.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net] net: hsr: clean up synced addresses and allmulti in
 hsr_del_port()
Message-ID: <avULIJLRzOEoefJI@fedora>
References: <20261111060143.183670-1-sunwenbo@cmss.chinamobile.com>
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
In-Reply-To: <20261111060143.183670-1-sunwenbo@cmss.chinamobile.com>

On Wed, Nov 11, 2026 at 02:01:43PM +0800, Wenbo Sun wrote:
> hsr_set_rx_mode() syncs unicast and multicast addresses to slave A and
> slave B devices via dev_uc_sync_multiple() and dev_mc_sync_multiple(),
> and hsr_change_rx_flags() propagates IFF_ALLMULTI via
> dev_set_allmulti().
> 
> However, when an HSR device is deleted via hsr_dellink(),
> hsr_del_ports() removes all ports from hsr->ports before
> unregister_netdevice_queue() invokes hsr_dev_close(). Similarly, when a
> slave device is unregistered while the HSR master is UP,
> hsr_netdev_notify() calls hsr_del_port() directly. Because
> hsr_del_port() does not unsync unicast/multicast addresses or restore
> the allmulti count, the slave devices permanently retain synced hardware
> addresses and a leaked allmulti reference count after port deletion.
> 
> Fix this by calling dev_uc_unsync() and dev_mc_unsync(), and
> decrementing allmulti via dev_set_allmulti(port->dev, -1) if
> IFF_ALLMULTI is set on the master device, when detaching slave A or
> slave B in hsr_del_port().
> 
> This issue was identified with the assistance of an LLM-based code
> review tool, confirmed by reproducing the leaked allmulti reference
> count and synced multicast address in a User-Mode Linux (UML)
> environment, and verified in UML that both states are properly cleaned
> up upon HSR port deletion.
> 
> Fixes: 36b20fcdd966 ("net: hsr: Add support for MC filtering at the slave device")
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
> ---
>  net/hsr/hsr_slave.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
> index a546f70f9cc8..bab0c27dd06a 100644
> --- a/net/hsr/hsr_slave.c
> +++ b/net/hsr/hsr_slave.c
> @@ -245,8 +245,14 @@ void hsr_del_port(struct hsr_port *port)
>  		netdev_rx_handler_unregister(port->dev);
>  		if (!port->hsr->fwd_offloaded || port->type == HSR_PT_INTERLINK)
>  			dev_set_promiscuity(port->dev, -1);
> -		if (port->type == HSR_PT_SLAVE_A || port->type == HSR_PT_SLAVE_B)
> +		if (port->type == HSR_PT_SLAVE_A ||
> +		    port->type == HSR_PT_SLAVE_B) {
>  			vlan_vids_del_by_dev(port->dev, master->dev);
> +			dev_uc_unsync(port->dev, master->dev);
> +			dev_mc_unsync(port->dev, master->dev);
> +			if (master->dev->flags & IFF_ALLMULTI)
> +				dev_set_allmulti(port->dev, -1);
> +		}
>  		netdev_upper_dev_unlink(port->dev, master->dev);
>  		if (hsr->prot_version == PRP_V1 &&
>  		    port->type == HSR_PT_SLAVE_B) {
> -- 
> 2.33.0
> 
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
