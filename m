Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837689;
	b=jQOgtA4u7Rk8Ci07SL+HFvhX2sNXvN3kPIlBLLo/1Urq5G7WUsTxeJCWcdcTvxWFAKoS
	 6eNGyfyrxL5V8vkes1rtMQrO1uvaofwEjKKqDb5egbqo2NBXj341Snnguws6GbgntV0wn
	 mLyngxN+XsxT9ZDxceoFw4kDBXJ8uJZ+/aCzvNTfOnDxThLhtG41IE0LcLl9iU5KEhHMH
	 JtH/IdEFKduOi8pISzZ30rN0EZQmBKN9+CxMaRKsLgPTO5YCuNtiPp6KVNAsKJ/aL/1jQ
	 2xPuJ+/E9hc5HZ80pI5U9tIvBa5jkF/0tv+KcpwbYSk3jRqrCuX6VKhb73E1khTjusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837689;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AcI5O5MVmz/sMdzZjpcXmsQSI2YiMfU3J4R/RHPWjLk=;
	b=icYvnxPr+AHOnrYUh7GOBr66lUwU8P3kGDg2nC0EcDbB7ABgvZDYCOYhAm7DZ+mZU4B5
	 ppb0w4dybBS+JGsHbp2TaCW7LNLMZFpFUBo6Pot0gKbwJBaiCVnRycNrVuU9FoZ1p7kpy
	 UqT9Kx9wqQuniTP4Xl7tszGRBV1uTtebL69ggHkhifev3EcaFS+0bz81dcnY4tnu1MEJO
	 tKJTwfQ6zMxfvX4Oueqb0H295vyK+9hq8bKAMjST77T/bPPaUPmiP9MDSja9GQcNL4VG9
	 ODz/ZhsY14Jf4r9taZKnNyj4/L5GTJ5j0FIhYUHSWnQUB5S4HD906DLd6rDBTWLC0Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRowMdmR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AF606A8AE;
	Mon, 16 Nov 2026 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRowMdmR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A30E1F000C7;
	Mon, 16 Nov 2026 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837689;
	bh=AcI5O5MVmz/sMdzZjpcXmsQSI2YiMfU3J4R/RHPWjLk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SRowMdmRKr8bt0UEpVVKpzPHsooZjMsXJe387NrjH4YfbU1S9NOyc3XS2d9qhPsVe
	 LVSh2mlGuM+enJFFeW/z9tYYc1xnmEgDEvcISNSUWFz2cLhToPG+8igZE73r948J8/
	 jMOzB1NVzW135Cy5yMoAXrboWiWuI80TtQZwA8sRjevSTb5U6jIHxa1/n5aXMm9wCm
	 kCpAIfuAT6h3+CK83Xjjr/b9AeySe0PYeHivvn1IYe8E4ycSQxK+1Y/Dhh/bWKX65S
	 8E+QHrK2n8XFgqCCvH7Vz0Q9s/62NITzlaH9GnB0yOYTVLjfIzFhrlugwH1lqbu8mN
	 btC/04tSUV3MA==
Subject:
 Re: [PATCH net] net: ethernet: mtk_eth_soc: Fix potential PPE hash table leak
From: netdev-bot+sashiko@kernel.org
To: liguangshuo@mail.sdu.edu.cn
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 16 Nov 2026 14:01:27 +0000
Message-ID: <179483768794.3136.13845952044990808928@kernel.org>
In-Reply-To: <20261112-88a3a7ff32-net-mtk@mail.sdu.edu.cn>
References: <20261112-88a3a7ff32-net-mtk@mail.sdu.edu.cn>
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

Critical: 0 · High: 1 (2) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is a high-
  severity use-after-free in the same PPE teardown.
- [High] This problem wasn't introduced by this patch, but it is a high-
  severity work-cancellation ordering race in the remove path the patch…

--

net: ethernet: mtk_eth_soc: Fix potential PPE hash table leak

This patch adds a call to mtk_ppe_deinit() in mtk_remove(). The goal is
to destroy the PPE L2 flow rhashtables, whose bucket tables are not
device-managed. This matches what the probe error path already does.

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index ad0fdc4133fb6..08973b6f0711d 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5426,6 +5426,7 @@ static void mtk_remove(struct platform_device *pdev)
>  	netif_napi_del(&eth->rx_napi);
>  	mtk_cleanup(eth);

[Severity: High]
This is a pre-existing issue, but the commit message says
mtk_ppe_deinit() runs "after unregistering the netdevs and cancelling
the driver work". Is the driver work actually guaranteed to be stopped
at this point?

mtk_cleanup() frees the netdevs before it cancels either work item. It
also cancels pending_work before monitor_work:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_cleanup() {
	mtk_sgmii_destroy(eth);
	mtk_unreg_dev(eth);
	mtk_free_dev(eth);
	cancel_work_sync(&eth->pending_work);
	cancel_delayed_work_sync(&eth->reset.monitor_work);
	...
}

monitor_work stays armed during all of mtk_remove(), and it can queue
pending_work again:

mtk_hw_reset_monitor_work() {
	...
	if (mtk_hw_check_dma_hang(eth))
		schedule_work(&eth->pending_work);
out:
	schedule_delayed_work(&eth->reset.monitor_work,
			      MTK_DMA_MONITOR_TIMEOUT);
}

Say a monitor_work instance is running when
cancel_work_sync(&eth->pending_work) returns. It can queue pending_work
again. cancel_delayed_work_sync() waits for monitor_work but does not
cancel that newly queued pending_work.

mtk_pending_work() would then run after mtk_remove() returns:

	if (!eth->netdev[i] || !netif_running(eth->netdev[i]))
		continue;
	mtk_stop(eth->netdev[i]);

Would that dereference the netdevs freed by mtk_free_dev()? The
eth->netdev[] pointers are never cleared, and eth itself is
devm-allocated, so it may already be freed too.

pending_work queued during remove can hit the same problem. It waits
for rtnl while unregister_netdev() holds it, and runs once rtnl is
released.

Would it be safer to disable monitor_work first and then pending_work,
for example with disable_delayed_work_sync() and disable_work_sync(),
before the netdevs are unregistered and freed?

>  	free_netdev(eth->dummy_dev);
> +	mtk_ppe_deinit(eth);

[Severity: High]
Does this cover all of the PPE offload hash tables? mtk_ppe_deinit()
only destroys ppe->l2_flows. A second rhashtable that is not
device-managed, eth->flow_table, is never destroyed anywhere in the
driver:

drivers/net/ethernet/mediatek/mtk_ppe_offload.c:mtk_eth_offload_init() {
	if (!eth->ppe[id] || !eth->ppe[id]->foe_table)
		return 0;
	return rhashtable_init(&eth->flow_table, &mtk_flow_ht_params);
}

mtk_probe() calls this inside the per-PPE loop:

	for (i = 0; i < ppe_num; i++) {
		...
		eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
		...
		err = mtk_eth_offload_init(eth, i);

Some SoCs set .ppe_num to 2 (MT7981/MT7986) or 3 (MT7988). On those,
does each loop iteration re-initialize the shared eth->flow_table and
lose the bucket table allocated in the previous iteration? That would
also repeat on every EPROBE_DEFER retry.

The bucket table that remains also stays allocated after mtk_remove(),
even with this patch. The same is true for the err_deinit_ppe unwind
in mtk_probe().

There is also the deferred shrink work to consider. mtk_flow_ht_params
sets .automatic_shrinking = true. That means rhashtable_remove_fast()
called from mtk_flow_offload_destroy() can queue ht->run_irq_work, and
then ht->run_work, when the table is lightly loaded.

Without a rhashtable_destroy(&eth->flow_table), nothing syncs or
cancels that work. Can rht_deferred_worker() then run on eth after
devres has freed it?

Would it make sense to initialize eth->flow_table only once, and pair
it with rhashtable_destroy() in both mtk_remove() and the probe unwind?

[Severity: High]
This isn't a bug introduced by this patch, but mtk_ppe_deinit() also
leaves the per-PPE debugfs entries in place. mtk_ppe_init() calls
mtk_ppe_debugfs_init(), which does this:

drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:mtk_ppe_debugfs_init() {
	...
	root = debugfs_create_dir(ppe->dirname, NULL);
	debugfs_create_file("entries", S_IRUGO, root, ppe, &mtk_ppe_debugfs_foe_all_fops);
	debugfs_create_file("bind", S_IRUGO, root, ppe, &mtk_ppe_debugfs_foe_bind_fops);
	...
}

The root dentry is thrown away, and debugfs_remove() is never called.
That is true for mtk_remove(), mtk_ppe_deinit() and the probe error
path.

Unbinding, or a probe failure after mtk_ppe_init(), releases ppe,
ppe->foe_table, ppe->acct_table and the MMIO mapping through devres.
But /sys/kernel/debug/ppeN/entries and /sys/kernel/debug/ppeN/bind
stay in place.

Can reading those files after unbind use freed memory?
mtk_ppe_debugfs_foe_show() dereferences the freed ppe and foe_table.
It then calls mtk_foe_entry_get_mib(), which reads registers through
the stale ppe->base and writes into the freed acct_table:

	acct->bytes += bytes;
	acct->packets += packets;

On re-probe, debugfs_create_dir() fails because the directory already
exists. The stale files would then keep pointing at the old ppe.

Could the dentry be stored in struct mtk_ppe and removed in
mtk_ppe_deinit() and the probe error path?

>  	mtk_mdio_cleanup(eth);
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-88a3a7ff32-net-mtk%40mail.sdu.edu.cn
