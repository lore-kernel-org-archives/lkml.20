Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794718613;
	b=pWm7JQydbWHMqXnZTlKszrt1q+TNbrevaSLtQXf3eNhqC4Kob2yRi3SD0BA5tDka01eZ
	 LS6/VMfQEA5fYYtpM6dpBG9eMw/anju/HIQ46fTPCqY8Vm9WZt3HEed6m9GGg0ef/0GQg
	 vDEIvZgLdODQXsrMPqarE8bg3DZVRlek0jv023tocOdwRCt5GXqXNelrJLZNkoOGff49W
	 iLgkFnQSrtW3eM256dQEH84uv83dkifNI0Z/hwkEYj/tAmfIeGyb3kZiKh+pXQtisMagy
	 kc5xYcdTJSnGQw/+kuSUdait/YySbbGsTLJVuNhJGAWAbNRZCj0I6bxGCTtISI0z6Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794718613;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=khASVnuhY+rY9MqIwmoGx90/W2kY6N1cqw0vv22kJ+c=;
	b=E0FW8TN+BHRGqYKiuMPYgemoX6rOr4hQ/8ldx5A28wjOrfxo8cL5FFdtzevHtrztDpoO
	 2eqen5NxY5m0M/tE4zHDoVMdwIQopk04BYCgAx1yVV/jabAdROhEIC06uA26c/8tOqgk8
	 b/90trhpx2SO7MiXcEwdJrXKyjJG9YitpIkh3zfCKgm2UZTkZTDIH7d3ZTZ62RRD3Gg7i
	 O/Zboih5P17jtEtiDfuFVFRj/k0IjV4fKjWdUnSBMPkdONWrLYPb01c2zt1XbhiEjZL9e
	 G9LoycfqYPdEsLHEETGV6ZeT8s6T7rnGlMGT6h82+58gdlWnIrlr8YKdh6Vqj38d5Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6gl0zM1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20422606A329;
	Sun, 15 Nov 2026 04:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n6gl0zM1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF961F000C4;
	Sun, 15 Nov 2026 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794718612;
	bh=khASVnuhY+rY9MqIwmoGx90/W2kY6N1cqw0vv22kJ+c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n6gl0zM18YZKj3v0mhvMmdw3XwY9U2//3h7j2rRa76QNIwaUQOoKGEJZNgunE7+D9
	 MmoFVaxn9yFuCyEzvKYGo5s8f8w9PkKZN8mYhW9g6WtQ1Ox37HIo++C6z3Ai1gl+ZJ
	 Z7GyMzqrVnPFP3+1DIoDl7h1YkjY2O0pr/aAI+pF6+cUpPTq+DbDrR+EGPT9JWIURN
	 C3j7veOyYyKFlsJWy+zcJxI0+4RlNd29I5zQCniohZ0DspeBNJi2Ens8Z3gH1CaQQg
	 n/OWOFkjoRF0EgZXYSL3r0gLr4eq9Yr4HQIBV5XeZ8EWJyiRPmDrFDbBq0W121NAua
	 ibl70NJKqdj6A==
Subject:
 Re: [PATCH net-next v02 1/5] hinic3: Solve an stall issue in hinic3_rx_poll()
From: netdev-bot+sashiko@kernel.org
To: gongfan1@huawei.com
Cc: wudi234@huawei.com, tengpeisen@huawei.com, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, ioana.ciornei@nxp.com,
 maxime.chevallier@bootlin.com, mohsin.bashr@gmail.com,
 dimitri.daskalakis1@gmail.com, hramamurthy@google.com,
 larysa.zaremba@intel.com, vadim.fedorenko@linux.dev,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 zhoushuai28@huawei.com, wulike1@huawei.com
Date: Sun, 15 Nov 2026 04:56:50 +0000
Message-ID: <179471861093.2199510.12521678349103517689@kernel.org>
In-Reply-To: <7b1857bfd040c90baa1777c4c18be56551c4c1b0.1794371175.git.gongfan1@huawei.com>
References: <7b1857bfd040c90baa1777c4c18be56551c4c1b0.1794371175.git.gongfan1@huawei.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch does not close the WQE-starvation stall that its
  commit message describes.
- [Low] When napi_alloc_skb() fails, hinic3_rx_poll() now returns
  `budget` even if zero packets were processed (the poll_again path at…

--

hinic3: Solve an stall issue in hinic3_rx_poll()

This patch makes hinic3_rx_poll() return the full budget in two cases:
when recv_one_pkt() fails, and when the LRO replenish threshold is hit.
In both cases hinic3_poll() then keeps NAPI scheduled instead of calling
napi_complete_done() while an unprocessed CQE sits at the head of the
ring.

> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> index 309ab59013797..f2262cdd66287 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c

[ ... ]

> @@ -571,8 +572,10 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
>  
>  		vlan_len = le32_to_cpu(rx_cqe->vlan_len);
>  		pkt_len = RQ_CQE_SGE_GET(vlan_len, LEN);
> -		if (recv_one_pkt(rxq, rx_cqe, pkt_len, vlan_len, status))
> +		if (recv_one_pkt(rxq, rx_cqe, pkt_len, vlan_len, status)) {
> +			poll_again = true;
>  			break;
> +		}

[Severity: Low]
This isn't a bug, but a note on this path. When napi_alloc_skb() fails,
the CQE stays in place and hinic3_rx_poll() now returns budget even when
nr_pkts is 0. hinic3_poll() then repolls the same head CQE until an
atomic skb allocation succeeds.

This matches the "return failure ? budget : total_rx_packets" idiom in
i40e/iavf/ice. net_rx_action() also bounds it, so it isn't a livelock.

Should this failure be counted somewhere? rxq_stats has an alloc_skb_err
field, but hinic3_rxq_stats_init() only ever sets it to zero, so these
retries can't be seen from userspace.

[ ... ]

> @@ -581,12 +584,14 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
>  
>  		rx_cqe->status = 0;
>  
> -		if (num_wqe >= nic_dev->lro_replenish_thld)
> +		if (num_wqe >= nic_dev->lro_replenish_thld) {
> +			poll_again = true;
>  			break;
> +		}
>  	}
>  
>  	if (rxq->delta >= HINIC3_RX_BUFFER_WRITE)
>  		hinic3_rx_fill_buffers(rxq);
>  
> -	return nr_pkts;
> +	return poll_again ? budget : nr_pkts;

[Severity: High]
Can the RQ still stall for good if hinic3_rx_fill_buffers() can't post
any buffers here?

The commit message describes this case: "WQEs cannot be replenished in
time. The chip will drop packets due to lack of WQEs ... Furthermore,
the NAPI instance will not be polled again". However, the return value
of hinic3_rx_fill_buffers() is ignored, and poll_again is never set
when the refill falls short.

hinic3_rx_fill_buffers() stops at the first page_pool failure and rings
the doorbell only for the buffers it actually posted:

drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:hinic3_rx_fill_buffers() {
    ...
		err = rx_alloc_mapped_page(rxq->page_pool, rx_info,
					   rxq->buf_len);
		if (unlikely(err))
			break;
    ...
	if (likely(i)) {
		hinic3_write_db(...);
		rxq->delta -= i;
    ...
}

Suppose the device has used up every posted WQE, all CQEs have been
processed, and page_pool_dev_alloc_frag() returns NULL. The loop then
exits on !RXDONE, poll_again stays false, and nr_pkts < budget is
returned. hinic3_poll() then completes NAPI and re-arms the vector:

drivers/net/ethernet/huawei/hinic3/hinic3_irq.c:hinic3_poll() {
    ...
	if (likely(napi_complete_done(napi, work_done))) {
		hinic3_net_dim(nic_dev, irq_cfg);
		hinic3_set_msix_state(nic_dev->hwdev, irq_cfg->msix_entry_idx,
				      HINIC3_MSIX_ENABLE);
	}
    ...
}

With no WQEs posted, the device writes no CQE and raises no interrupt,
so NAPI never runs again.

hinic3_rx_fill_buffers() is only called from hinic3_configure_rxqs() and
hinic3_rx_poll(). hinic3_periodic_work_handler() only logs TX timeout
events. Nothing else refills the ring once memory recovers, and the
queue stays dead until the interface is reset. rx_buf_empty and
alloc_rx_buf_err are also never incremented, so the stall is silent.

i40e/iavf/ice handle this by folding the refill failure into the return
value ("failure = failure || iavf_alloc_rx_buffers(...)"). Could
poll_again also be set when hinic3_rx_fill_buffers() posts fewer than
rxq->delta - 1 buffers, or could a deferred refill be scheduled?

>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794371175.git.gongfan1%40huawei.com
