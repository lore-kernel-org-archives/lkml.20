Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837273;
	b=KXgDY6YVOsp5Sl0E6jsArODwZ92OPVYHJyyvU1MME6sn3CE0maMtgUmoMNYAQd/bHACT
	 01u5bFw/cZClo3HaXWvQQBYsO/mshLL7UbJoz5DjE4iwwLVwworbVVj0FlqBJfwX3lK0T
	 ADILftdkhjeuBPhcjJoDyWmjFSES0Eu0ZJRRi5pzdlhG4YbEylpTvUPGUUlllt3WoHjS3
	 akG3WpuhNgp95svLUnPo3EMkhwAtyhbD2EXpIWeRa+kTuV4NK350L40kqllcPEnjycXRq
	 q5cSLu3vp+ECI2SVknApUeI7oio9lsdROjbXrna/wL9Ta3F+umi4eM7/p7SjPycUv5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837273;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JBDdNs6C9iQfzQmHqjMpdzujKMPQJIlmbDGSyROMF7s=;
	b=MHyqZN1an4pa2mcDWWo/pfKQDSDl6iYNG99GmA00+4st45YAssD1S0vnOZUsYgJNqGgI
	 wnFJT/YNLKRp4PMpFizG4l/GGJMNIkRENWa19S+2+wMVqW3RZj3e0PQMyQGqxK6m6l3q9
	 4rchrIZpcPMMKSxTGXUc5TKoZwKuRLTxKCaC8MSNGPOXUblGabRI/6of6gZ8szU0HFsx/
	 lPe5fwc4ciRrWYxfax9sEU5kzbtMa4//aAQiAzCqosOoOAHfapA6M61QCQZyvOIY60Tr+
	 x4A99hulPcX47c0Sl6LMi1TxADfm4/TpcYKeZxtF7jRAayvcqxx1gXIBnZHSm+bt7Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrOt6vbM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60B260A260A;
	Mon, 16 Nov 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrOt6vbM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F341F0092A;
	Mon, 16 Nov 2026 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837273;
	bh=JBDdNs6C9iQfzQmHqjMpdzujKMPQJIlmbDGSyROMF7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lrOt6vbMchbQiYj4pRGzpk92xJiQVEdTJzTED2tKsT9xChje3Iw2QsvbGCYLQM+AL
	 5+LfRRj3XOOjbbQr2apEjG3ISVmom4Ea4rbPnGO85xzdFGe9uSXXaTQK9pgBp2Gi59
	 t72F1H9nCGu6lzC+uBrfpwx52AHx14VdDjXagoEH91ob5PQYW9ZNPnlGd1vDNz/d14
	 99hKZppSsOaNevRMdpgQN8c47GlBISCGaQzLt4Qxnk4UqOQzHPms00tOoTQSzYuXXU
	 6oT/SWV55/CNMxVsVhwNxO16pPnSx3US9y9zvVi53IZWwLn+Qk4oJ31rVPF45OWcw4
	 VX2v6rmtIsf7A==
Subject: Re: [PATCH net-next v6 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
From: netdev-bot+sashiko@kernel.org
To: vishnu.santhosh@oss.qualcomm.com
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, edumazet@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, deepak.singh@oss.qualcomm.com
Date: Mon, 16 Nov 2026 13:54:32 +0000
Message-ID: <179483727219.3136.17411591489340995392@kernel.org>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
References: <20261112-qcom-bam-dmux-vmid-ext-v6-2-7a16bd3dff18@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch does not do what the commit message says for BAM
  descriptor FIFOs.
- [Medium] The driver can unbind while the restricted DMA pool is still
  assigned to {HLOS, vmid}, and then it loses the only record of that.
- [Medium] Requesting the PC IRQ with IRQF_NO_AUTOEN and enabling it only
  at the end of bam_dmux_probe() means any change in the remote's power-…
- [Medium] bam_dmux_remove() decides whether to take the restricted DMA
  pool away from the remote VM using the cached software flag…

--

net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor

When qcom,vmid is present, this patch requires a restricted DMA pool to
be attached to the device. It then calls qcom_scm_assign_mem() to share
that pool between HLOS and the modem VMID before the DMA channels are
requested. The pool is handed back to HLOS on remove or on a probe
error, unless the remote still holds its power vote, and the PC IRQ is
now requested with IRQF_NO_AUTOEN and enabled at the end of probe.

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index 1479f8362e04e..04f3d46d4c3f3 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c

[ ... ]

> @@ -760,6 +766,88 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> +{
> +	struct device *dev = dmux->dev;
> +	struct device_node *rmem_np;
> +	struct reserved_mem *rmem;
> +	struct qcom_scm_vmperm dst[2];
> +	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);

[ ... ]

> +	if (!is_swiotlb_for_alloc(dev))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Restricted DMA pool not attached\n");

[Severity: Medium]
Does this cover the BAM descriptor FIFOs the way the commit message
describes? The commit message says:

  "BAM-DMUX DMA mappings and BAM descriptor FIFOs must therefore be
  constrained to a designated memory region"

and:

  "When the BAM DMA controller references the same pool, its descriptor
  FIFOs are covered by the assignment as well."

The FIFOs are allocated on the BAM DMA controller's own device, not on
dmux->dev:

drivers/dma/qcom/bam_dma.c:bam_alloc_chan() {
    ...
	bchan->fifo_virt = dma_alloc_wc(bdev->dev, BAM_DESC_FIFO_SIZE,
					&bchan->fifo_phys, GFP_KERNEL);
    ...
}

The FIFOs only come from the restricted pool if the BAM DMA node has its
own memory-region that points at the restricted-dma-pool. The binding
doesn't allow that. qcom,bam-dma.yaml has no memory-region property and
sets additionalProperties: false, and this series only updates
qcom,bam-dmux.yaml.

The check here only looks at is_swiotlb_for_alloc(dmux->dev). Nothing
checks the device behind the rx/tx channels.

With a DT that follows the bindings, probe would succeed without a
warning. Meanwhile, bam_dmux_power_on()->dma_request_chan()->
bam_alloc_chan() would allocate the FIFOs outside the assigned region.
Wouldn't that leave the XPU violation the patch is meant to prevent?

Is a bam-dma binding update or a check on the channel device needed
here?

[ ... ]

> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> +{
> +	struct qcom_scm_vmperm hlos = {
> +		.vmid = QCOM_SCM_VMID_HLOS,
> +		.perm = QCOM_SCM_PERM_RW,
> +	};
> +	u64 src = dmux->dma_pool_perms;
> +	int ret;
> +
> +	if (!dmux->dma_pool_perms)
> +		return;
> +
> +	ret = qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_size, &src,
> +				  &hlos, 1);
> +	if (ret) {
> +		dev_err(dmux->dev, "SCM reclaim restricted DMA pool failed: %d\n", ret);
> +		return;
> +	}

[Severity: Medium]
What happens to the pool ownership when this call fails? The same
question applies when bam_dmux_remove() skips the reclaim on purpose
because pc_state is still set:

	if (!dmux->pc_state)
		bam_dmux_reclaim_dma_pool(dmux);
	else if (dmux->dma_pool_perms)
		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");

In both cases the region stays assigned to HLOS and the modem VMID. The
only record of that is dmux->dma_pool_perms, which lives in the
devm_kzalloc'd struct bam_dmux. devres frees it as soon as remove() or
the failed probe returns.

On the next probe (module reload, sysfs rebind, deferred re-probe),
bam_dmux_assign_dma_pool() always starts from:

	u64 src = BIT_ULL(QCOM_SCM_VMID_HLOS);

That no longer matches the real owners (HLOS | vmid). Hyp-assign checks
the source VM list against the current ownership, which is why users
such as rmtfs_mem keep their perms around for the reclaim.

Wouldn't qcom_scm_assign_mem() then fail with "SCM assign restricted DMA
pool failed" on every probe until reboot?

The commit message says the execution environments are tracked
explicitly for the reclaim. Isn't that record lost in exactly the unbind
case it is meant to handle?

> +
> +	dmux->dma_pool_perms = 0;
> +}

[ ... ]

> @@ -821,7 +913,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  		goto err_disable_pm;
>  
>  	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
> -					IRQF_ONESHOT, NULL, dmux);
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN, NULL, dmux);
>  	if (ret)
>  		goto err_disable_pm;
>  
> @@ -838,11 +930,14 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  			bam_dmux_power_off(dmux);
>  	}
>  
> +	enable_irq(dmux->pc_irq);

[Severity: Medium]
Can a remote power-control transition get lost between the line-level
sample and this enable_irq()? In bam_dmux_probe() the sequence is now:

	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
				    &dmux->pc_state);
	...
	if (dmux->pc_state) {
		if (bam_dmux_power_on(dmux))
	...
	enable_irq(dmux->pc_irq);

With IRQF_NO_AUTOEN, __setup_irq() skips irq_startup(), so the smp2p
and smsm unmask callbacks don't run until enable_irq(). During that
window, qcom_smp2p_notify_in() still updates last_value but only
dispatches bits set in irq_enabled:

drivers/soc/qcom/smp2p.c:qcom_smp2p_notify_in() {
    ...
		status = val ^ entry->last_value;
		entry->last_value = val;
    ...
		for_each_set_bit(i, entry->irq_enabled, 32) {
    ...
}

smsm_intr() also updates last_value, and smsm_unmask_irq() resyncs the
cached state when the IRQ is enabled:

drivers/soc/qcom/smsm.c:smsm_unmask_irq() {
    ...
	/* Make sure our last cached state is up-to-date */
	assign_bit(irq, &entry->last_value,
		   readl(entry->remote_state) & BIT(irq));
    ...
}

handle_nested_irq() is never called, so IRQS_PENDING is never set and
enable_irq() has nothing to resend.

bam_dmux_pc_irq() flips the cached value instead of reading the line:

	bool new_state = !dmux->pc_state;

A single missed edge would therefore leave the driver's view inverted
from then on. The remote's transition is never acked, later edges are
handled with the wrong polarity, and the pc_state check in
bam_dmux_remove() that gates the pool reclaim is wrong too.

When the modem is already up at probe time, the window also covers
bam_dmux_power_on() (dma_request_chan(), skb allocation, DMA mapping).
IRQF_NO_AUTOEN is set unconditionally. Wouldn't this regression affect
every BAM-DMUX platform, not just the ones with qcom,vmid?

>  
>  	return 0;
>  
>  err_disable_pm:
>  	pm_runtime_disable(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
> +	bam_dmux_reclaim_dma_pool(dmux);
>  	return ret;
>  }
>  
> @@ -877,6 +972,12 @@ static void bam_dmux_remove(struct platform_device *pdev)
>  	disable_irq(dmux->pc_irq);
>  	bam_dmux_power_off(dmux);
>  	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +
> +	/* The remote side may still access the pool if it holds its power vote */
> +	if (!dmux->pc_state)
> +		bam_dmux_reclaim_dma_pool(dmux);
> +	else if (dmux->dma_pool_perms)
> +		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");

[Severity: Medium]
Can dmux->pc_state still be trusted at this point? Once
disable_irq(dmux->pc_irq) has run above, bam_dmux_pc_irq() no longer
runs. pc_state then shows the last edge that was processed, not the
remote's current power vote.

The RX side is started by the remote. The comment in probe says "the RX
path may be active even if we are runtime suspended, since it is
controlled by the remote side".

Suppose the remote raises its vote after disable_irq(), or pc_state is
already inverted by the lost edge in bam_dmux_probe(). This code would
still call bam_dmux_reclaim_dma_pool() and remove the modem VMID while
the remote holds its vote.

That seems to contradict the commit message:

  "Skip the reclaim and leave the pool assigned if the remote side still
  holds its power vote, since it may still access the pool."

Should the line level be read again here before deciding whether to
reclaim, for example with irq_get_irqchip_state(dmux->pc_irq,
IRQCHIP_STATE_LINE_LEVEL, ...)?

>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18%40oss.qualcomm.com
