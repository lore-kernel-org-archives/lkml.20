Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837288;
	b=oY13Uvl6It6hrAdxAhmqgqQKF1dPHVo2UcCw9YbGjLLIUyTE+56NKGdQXdtcmq+NUiCR
	 r5twNZKtUXGTyc8dFJAfh6hNG2zRfNb5SLvFgIiKTjFU5yK8BeNg05d7T7UJ/w4bc2x08
	 fqbwRPpryUyNIroG8gb88KAA9fwTkZks5S6jw063i6s5iW8eQki5KABt5T/VikGmo9y+s
	 9uGa4DzRtFL0W7nsHxdFnwTZpFN4TtnNdluukTT3Iv+wrYfTGDYQUhQljQMJP6Bu7SbwQ
	 DfNjIb+1ZF4DXN5Yk5cL2DqQVoZ2Nq7skTnLBx/c3VRbR2bsvQQ8/Lo9nUiELjv69CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837288;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=agaTM/V/UOzvQr8+HHs0qaYier0Zw/THguyr2WoWb0o=;
	b=KO+OexHLtrJkHa+63q8kpbp5VD+aKOEk0yJchJvdnra8+YzM0ehN1+dm2qSYE7Wipozm
	 FMiUAqjxRQw8VLTAJgV7M8PPoJIiadis2VbXNOrOXM6DSfTtsNUPpkgknt77kHKA+9WRC
	 cXHI9z2ly0KcYDtEbop/G24dDQJnSnWKxAyQBlBKh+E3cToPaDNljRT5IO04DJCe7ZFEZ
	 dtZfRJGp3rYvIaEB9ZbAHLexhR3fmeAG7gD/nRR2ku1QE84BSjdjoQ5rglNPtAeX4WO6B
	 DLqAz0FQjVz+NQcys9X+TmY6LdjyV30zjWui/mOGVGpH598mUYiavtJc90+dEK8rlGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mcN+bwH+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B72E60A5BFE;
	Mon, 16 Nov 2026 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mcN+bwH+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9F21F000C6;
	Mon, 16 Nov 2026 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837287;
	bh=agaTM/V/UOzvQr8+HHs0qaYier0Zw/THguyr2WoWb0o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mcN+bwH+3xaD7itlk+nio6RJFoyTYwyRUPP0UveAkLX8yPoyJCOW1wAa/NpZJk8vj
	 8wHM2OmqxdDxR3zRjL2KRNoEBwtP/heGm8DbdHCKIJ4ztYGyGVYqp/AXmOdEgwnRiA
	 jg2tQepIHpYg0ogl4XO1Q00TVUW89b/Nzh+9sS9pZPCRmTwuVUmCRQd8bwetMW2si9
	 HHVHIjp8NA/e9IDnGcFS1femmq3nvjLT+vLcgXKp9+aJsQLuU98G1bK1EwSuOnqF6U
	 SSKwhuEyFUzVvTAPWio6YRLDARsVtus3n7tkk3QdtfzsqjkUL4QtyXyQc7v2ejFkxu
	 Jrh9W8suLlBDQ==
Subject: Re: [PATCH v34 net-next 6/8] net/nebula-matrix: dispatch: add mailbox
 RPCs for msix map, mailbox irq and vsi/eth id
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:46 +0000
Message-ID: <179483728648.3136.14599740534108145269@kernel.org>
In-Reply-To: <20261112094925.6098-7-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-7-illusion.wang@nebula-matrix.com>
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

- [Medium] The new NBL_CHAN_MSG_CONFIGURE_MSIX_MAP responder in
  nbl_disp_chan_cfg_msix_map_resp() (nbl_dispatch.c:286) passes a peer…

--

net/nebula-matrix: dispatch: add mailbox RPCs for msix map, mailbox irq and vsi/eth id

This patch adds request and response handlers for five dispatch
operations: cfg_msix_map, destroy_msix_map, set_mailbox_irq, get_vsi_id
and get_eth_id. A control PF calls the resource ops locally. A has_net PF
forwards them to the management PF over the mailbox channel, where the
new responders run them on the requester's behalf.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> index 966fee2dec8b0..cb68544e02723 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c

[ ... ]

> @@ -25,6 +193,353 @@ static int nbl_disp_init_module(struct nbl_dispatch_mgt *disp_mgt)

[ ... ]

> +static void nbl_disp_chan_cfg_msix_map_resp(void *priv, u16 src_id, u16 msg_id,
> +					    void *data, u32 data_len)
> +{

[ ... ]

> +	if (rel_pf_id >= disp_mgt->common->max_pf) {
> +		err = -EPERM;
> +		goto ack_out;
> +	}
> +	if (data_len < sizeof(param)) {
> +		err = -EBADMSG;
> +		goto ack_out;
> +	}
> +	memcpy(&param, data, sizeof(param));
> +
> +	if (res_ops->cfg_msix_map) {
> +		/*
> +		 * The vector counts come from the peer PF.  A peer is
> +		 * trusted: hardware and firmware forbid PF passthrough to
> +		 * guests (see nbl_get_func_param()), so every peer runs this
> +		 * same host driver, and the resource layer bounds the counts
> +		 * by the global vector pool.  A peer asking for the whole
> +		 * pool can starve the others with -EAGAIN, but it cannot
> +		 * corrupt state.
> +		 */
> +		ret = res_ops->cfg_msix_map(p, src_id,
> +					    le16_to_cpu(param.num_net_msix),
> +					    le16_to_cpu(param.num_others_msix),
> +					    !!le16_to_cpu(param.msix_mask_en));

[Severity: Medium]
Can one sibling PF use this responder to drain the shared MSI-X vector
pools?

Before res_ops->cfg_msix_map() runs, the only checks are the rel_pf_id
range and data_len. So num_net_msix and num_others_msix reach
nbl_res_intr_cfg_msix_map() exactly as the peer sent them.

There is no per-function quota in nbl_res_intr_cfg_msix_map() either. Each
count is only capped at NBL_MSIX_MAP_TABLE_MAX_ENTRIES (1024), which is
the same size as the whole NBL_MAX_OTHER_INTERRUPT pool:

drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c:nbl_res_intr_cfg_msix_map() {
    ...
	for (; i < requested; i++) {
		intr_index =
			find_first_zero_bit(intr_mgt->intr_other_bmap,
					    NBL_MAX_OTHER_INTERRUPT);
		if (intr_index == NBL_MAX_OTHER_INTERRUPT) {
			dev_err(dev, "No free control interrupt vectors left\n");
			ret = -EAGAIN;
			goto release_vecs_unlock;
		}
    ...
}

The control PF already holds one vector, so a peer request for 1023
other vectors succeeds. After that, every sibling PF that configures its
map gets -EAGAIN from cfg_msix_map().

With the later "add common dev start/stop operation" patch, that error
makes nbl_dev_start() fail, so the sibling loses its mailbox interrupt
and its probe fails.

The net pool (NBL_MAX_NET_INTERRUPT, 4096) can be drained the same way by
four peers asking for 1024 net vectors each.

A peer can also send reconfiguration requests over and over. Each one
does a kcalloc() and a usleep_range()-based nbl_intr_quiesce_wait(), and
it still holds intr_mgt->lock during the wait.

The comment above trusts peers because "hardware and firmware forbid PF
passthrough to guests (see nbl_get_func_param())". However,
nbl_get_func_param() only selects the control PF:

drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c:nbl_get_func_param() {
    ...
	if ((PCI_FUNC(pdev->devfn) == 0) && !pdev->is_virtfn)
		param->caps.has_ctrl = 1;
}

No software check stops a sibling PF from being bound to another driver
or passed through. The in-tree driver only requests one non-net vector,
so this needs a misbehaving or out-of-tree peer driver. Whether such a
peer can exist depends on the hardware and firmware claim, which the code
does not show either way.

This is the first runtime path from a sibling PF into the control PF's
shared allocator. Would a fair-share cap here help, such as pool size
divided by max_pf, or one reserved other vector for each present PF?

> +		/* Forward the resource errno verbatim to the requester */
> +		if (ret)
> +			err = ret;
> +	} else {
> +		err = -EOPNOTSUPP;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094925.6098-1-illusion.wang%40nebula-matrix.com
