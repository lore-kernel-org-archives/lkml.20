Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837062;
	b=We6f56KHEiOJQAmlwpK+HhpdGzBlGDZ3T1k8DopYrn4FYXMmPqvgBjv6X7il5aFoe8Vu
	 Mpj8E9B3p/ZFfUN0F+fsuSClvIffsz0kykSjHgI2Aazmp6HwGlFRtFJJb8g9NccowuCT7
	 maycapiuM0zMzx7Be/VyBjGDw969O5yG7gNai1EmBCe0aZSipC3oaaedcxBxxblwPIRV0
	 8KOEhv8imKaAz+UKHr40lXW1H3+XRkmiNv3fuwUyN0r8v6w0yM67/vahDh1+AB9bWMEkK
	 Lgwt8uH3uKOjV8zx3Zj+7Oz9YZUzGGRb6pcneSBbPLI2Vm925gnH/fDmbqVV1HHw0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837062;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lgF1/gF7h+RVc8g5jPb5SPiZYQniC3NQfKWjaikhx3k=;
	b=R2XWG3m/jqA88VZT9MB3m22veqZLviqih7F+UGEgG/atJqMU/n4QwdURevFcJZHb9U20
	 1dhH3/W/M1uuJQUIK7d3hNMMfEeZUCIhF1YCvx3LrV1pFtinYcVBD2IuvSHpr5i6R4D2c
	 S/cAMbx6+M+ImHcuh572jX6rFUNqygshUVO5/ic+bhXCvN0oOaL/n+1N7CxBxk0VudhJv
	 KATCaMUNu+J7X9iV2nqtcDjGapoLHXLMB6gt9F2Gx7Uqord8oczbaElpcO98utmRWfxm6
	 XYa5NObCSI60hSbF9LNRvIk7I4zB4s8kOo9Hso531UVoApeuxlHu2J8RInYBzr9csPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSn6v31x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92D606B22D;
	Mon, 16 Nov 2026 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSn6v31x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D801F000CF;
	Mon, 16 Nov 2026 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837062;
	bh=lgF1/gF7h+RVc8g5jPb5SPiZYQniC3NQfKWjaikhx3k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TSn6v31x8W+l0sD8mYCVIj3CbMNq5CArt/9Z8c6/f/lr4CsbV5vLIxiU2sjwzdYp5
	 wpOl1WIp1Q8hCn8KAbUjKLc8BUu9mQe2V6qqgU7qIF6Z3CALEtC6DZQVClzR4+/hkA
	 KtUhPH8vdK7AmhnN4IDC25XHu6wtcvL6XSriXuk7sM9RDzTx2ivWDtNX+6pSWWAHf5
	 T37c48dPkI+L5VNFCjyiaTCWmb4aKzdB0SD+DgU5c15XLgBNRAFn62voyJZUab9+5m
	 UsWj51gmzYr0sglufkHGvtKy3UBUr0N2jGup4AbD6dVYeheZ2wPOSiwS3R5p4As8A4
	 Q22LX6ihtY7BA==
Subject:
 Re: [PATCH net-next v03 1/4] hinic3: Solve an stall issue in hinic3_rx_poll()
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
Date: Mon, 16 Nov 2026 13:51:00 +0000
Message-ID: <179483706058.3136.10285830784203129885@kernel.org>
In-Reply-To: <8d5247fdc88d6a2db6340da79eb9b64f3cdd20e0.1794467919.git.gongfan1@huawei.com>
References: <8d5247fdc88d6a2db6340da79eb9b64f3cdd20e0.1794467919.git.gongfan1@huawei.com>
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

- [High] The fix does not cover the case where the RX refill fails, so
  the RQ can still stall.

--

hinic3: Solve an stall issue in hinic3_rx_poll()

This patch makes hinic3_rx_poll() return the full budget in two cases:
recv_one_pkt() fails, or the LRO replenish threshold is reached. In both
cases NAPI keeps polling instead of completing and re-enabling the
interrupt while unprocessed CQEs or depleted WQEs remain.

> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> index 309ab59013797..f2262cdd66287 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c

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
Can the RQ still stall when the refill itself fails? The return value of
hinic3_rx_fill_buffers() is ignored here, and poll_again is not set when
fewer WQEs than needed get posted.

hinic3_rx_fill_buffers() stops at the first page_pool allocation failure.
If that happens on the very first WQE, it rings no doorbell at all:

drivers/net/ethernet/huawei/hinic3/hinic3_rx.c:hinic3_rx_fill_buffers() {
    ...
	for (i = 0; i < free_wqebbs; i++) {
		...
		err = rx_alloc_mapped_page(rxq->page_pool, rx_info,
					   rxq->buf_len);
		if (unlikely(err))
			break;
		...
	}

	if (likely(i)) {
		hinic3_write_db(rxq->rq, rxq->q_id & 3, DB_CFLAG_DP_RQ,
				rxq->next_to_update << HINIC3_NORMAL_RQ_WQE);
    ...
}

Under memory pressure, refills can fail across several polls while
hinic3_fetch_rx_buffer() keeps adding sge_num to rxq->delta for each
consumed packet. Large LRO frames, which use up to 16 WQEs each, drain the
posted WQEs quickly.

On the last such poll the loop drains all CQEs and exits on !RXDONE. The
refill fails again, and hinic3_rx_poll() returns nr_pkts < budget. Then
hinic3_poll() does this:

drivers/net/ethernet/huawei/hinic3/hinic3_irq.c:hinic3_poll() {
    ...
	if (likely(napi_complete_done(napi, work_done))) {
		hinic3_net_dim(nic_dev, irq_cfg);
		hinic3_set_msix_state(nic_dev->hwdev, irq_cfg->msix_entry_idx,
				      HINIC3_MSIX_ENABLE);
    ...
}

As the commit message says, the chip drops packets when it has no WQEs, so
no CQE is written and no RX interrupt is raised. qp_irq() is the only
napi_schedule() caller in the driver. hinic3_rx_fill_buffers() is called
only from hinic3_configure_rxqs() and hinic3_rx_poll(), and the periodic
work does not refill RX buffers.

Wouldn't the queue then stay dead even after memory frees up, until the
interface is reconfigured? That looks like the same "WQEs cannot be
replenished in time ... the NAPI instance will not be polled again"
failure, reached through the refill allocation failure path.

Would it make sense to also set poll_again when hinic3_rx_fill_buffers()
posts fewer WQEs than requested? Several other drivers do this; i40e, for
example, does "return failure ? budget : total_rx_packets". A deferred
refill would be another option. The later patches in this series don't
seem to touch hinic3_rx.c, so this case still looks open at the end of
the series.

>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794467919.git.gongfan1%40huawei.com
