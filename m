Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837290;
	b=3lypspvXwWfgbC/wmrUdlcv2W0fk1m4ZYG6b3L889/YZ+UH1KGPoGDu7Rsl6OvALJ34L
	 0Om+WEw/O/XIdVGRAppB+9tgKuBH+2N/7nq5uz9t/mwpksy0tqo/ggU+0PXjVQ1do9dNp
	 S5V0nGOp9OFTmcWqL+pdj4dgDpCnhHjeB2e5wx2alUqB2FttH/7o0zn2kcg035eqjRPiB
	 c5AINOmpERp/hDLgZoO3ViWHkoi1yTl61SnehOs7amoH6kA5O2VX/z+bgPfbPn95V2Zvx
	 O85iUQuSCB4Ky9uQzN9+8kxwuWyO00ijs47jRka5kTp+hQJtLqwKTZz4vi2b/8YDdHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837290;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pSYfW5er8Di/H2t51zBQxx5mfxWOcW2UG0df2Q2sYMg=;
	b=PdozPVBsrBXoh7Nfv9UO/19MmDcUca1nMxs9yHybcn2ug2eOX7dkz34qwVMcllwg/rT2
	 Z4Fsb9IL10t6phgW38wbEk2jAwvT17aoGkcxXoULrycIfRXu/mkeyvvrvG4hOb7BsfP67
	 YutrJwLPaZBH0nbCyhgAAahsRIkAof345qhkyk/T9sIOlG6yBtsHtJ9kKRpVQ+OpaXkV7
	 Awp+CSLfDbATgYl9xoW0jpeyBs7mMpoIBK/P+a/OQ+iTxP/pHv+LTclyTVPNAYFUEhnIR
	 9EBZxFs6irScS+OuMQSht0m0MHYZ1B0GCXcQglUSflMyMwsp44OuyzETovICitXJiDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0bThjZb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8DC60A6F6C;
	Mon, 16 Nov 2026 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0bThjZb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881FC1F000C5;
	Mon, 16 Nov 2026 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837290;
	bh=pSYfW5er8Di/H2t51zBQxx5mfxWOcW2UG0df2Q2sYMg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y0bThjZbLTC60MsMQFuoDQbxFFEfUwGhPwFjUfWyjEP2Vufjz/9TBbaNbs84AKDgo
	 TWOxC2a67J1Uddseaw0UvzQmAXKA07KY2/fLjf/zGPQ4OHVkT6rozLjV5LWDrqE43k
	 ZaipJUIKml2f3GvLxSrN7NuyObQDArnbMH27sxzMxmwFPYmfSuRX7Xa0a+K9yh4MAT
	 RvOq58P5aw8Sr+OOc/9NhzcpoHdYZJLI/rv2YViYGU4qi0p071tJX3YYtJa5x1HarZ
	 5vdvTzo4oET5fQmwq4lp9AWR/1WO3GpsxTCIw56guL64LEIYjj1Y2B6JGiKBgmPLH9
	 jDDdojVjdQCdw==
Subject: Re: [PATCH v34 net-next 8/8] net/nebula-matrix: add common dev
 start/stop operation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:49 +0000
Message-ID: <179483728908.3136.13154556595001281898@kernel.org>
In-Reply-To: <20261112094925.6098-9-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-9-illusion.wang@nebula-matrix.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net/nebula-matrix: unbind race and managed link del in
  nbl_probe_chip_deps()
- [Low] This patch's commit message, and the new comment in
  nbl_dev_stop() (around nbl_dev.c:729), say the coherent MSI-X map…
- [Low] The comment on nbl_dev_clear_interrupt_scheme() (nbl_dev.c:260)
  says "The handler is expected to be gone by now: both callers run…
- [Low] A comment in nbl_res_remove_leonis()
  (nbl_resource_leonis.c:358-360) says "Sibling PFs are already unbound…
- [Low] The kernel-doc of nbl_res_intr_cfg_msix_map()
  (nbl_interrupt.c:361-363) says "The in-tree caller…

--

net/nebula-matrix: add common dev start/stop operation

This adds nbl_dev_start() and nbl_dev_stop(), which nbl_probe() and
nbl_remove() call through nbl_core_start() and nbl_core_stop(). Start
configures the MSI-X map, fetches the VSI/ETH ids, allocates the MSI-X
vectors and arms the mailbox interrupt, and stop undoes those steps.
nbl_probe() also now rejects a function that has neither the ctrl nor
the net capability.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c
> index 0cc0c58ad6336..e91ec22e3f76b 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c

[ ... ]

> +static int nbl_dev_cfg_msix_map(struct nbl_dev_mgt *dev_mgt)
> +{

[ ... ]

> +	err = disp_ops->cfg_msix_map(dev_mgt->disp_ops_tbl->priv,
> +				     msix_net_num, msix_not_net_num,
> +				     mask_en);
> +
> +	return err;
> +}

[Severity: Low]
This isn't a bug, but nbl_dev_cfg_msix_map() is now the in-tree caller of
cfg_msix_map. The kernel-doc of nbl_res_intr_cfg_msix_map() in
nbl_interrupt.c names a different function:

 * in-tree caller (nbl_dev_init_msix_cnt()) asks for one non-net vector
 * per PF, far below NBL_MAX_OTHER_INTERRUPT.

nbl_dev_init_msix_cnt() only sets serv_info[NBL_MSIX_MAILBOX_TYPE].num = 1
and never calls cfg_msix_map.

Should the kernel-doc point to nbl_dev_cfg_msix_map(), reached from
nbl_dev_start(), instead?

[ ... ]

> + * The handler is expected to be gone by now: both callers run
> + * nbl_dev_free_mailbox_irq() first.
> + */
> +static void nbl_dev_clear_interrupt_scheme(struct nbl_dev_mgt *dev_mgt)
> +{
> +	struct nbl_common_info *common = dev_mgt->common;
> +
> +	pci_free_irq_vectors(common->pdev);
> +}

[Severity: Low]
Is this comment accurate for the nbl_dev_start() rollback? Five of the
error exits in nbl_dev_start() jump straight to err_destroy_map. That
label calls nbl_dev_clear_interrupt_scheme() without
nbl_dev_free_mailbox_irq():

	ret = nbl_dev_cfg_msix_map(dev_mgt);
	if (ret)
		goto err_destroy_map;
	...
	ret = nbl_dev_request_mailbox_irq(dev_mgt);
	if (ret)
		goto err_destroy_map;

The same applies to the get_vsi_id, get_eth_id and
nbl_dev_init_interrupt_scheme() failures in between. Only the
nbl_dev_enable_mailbox_irq() failure goes through err_free_irq.

On those direct paths request_irq() was either never reached or failed,
so no handler is registered and nothing goes wrong today.

Could the comment describe that case instead of saying that both callers
free the IRQ first?

[ ... ]

> @@ -303,3 +559,185 @@ void nbl_dev_remove(struct nbl_adapter *adapter)

[ ... ]

> +void nbl_dev_stop(struct nbl_adapter *adapter)
> +{

[ ... ]

> +	/*
> +	 * Destroy the hardware MSI-X map: masks all device vectors and
> +	 * clears the pcompleter map entry.
> +	 *
> +	 * Best-effort: if the destroy RPC fails, the control PF still owns
> +	 * this function's map entry, its intr_net/other_bmap bits and its
> +	 * kcalloc()ed vector array.  Those are host resources of that
> +	 * driver, released either by a later successful configuration of
> +	 * this function - nbl_res_intr_cfg_msix_map() invalidates and
> +	 * rewrites the entry, releases the old bits and frees the old array
> +	 * on its had_config path - or by nbl_intr_mgt_stop() when the
> +	 * control PF is removed, which walks every
> +	 * NBL_INTR_FUNC_CONFIGURED function through
> +	 * __nbl_res_intr_prepare_destroy_msix_map() and clears the
> +	 * FUNCTION_MSIX_MAP valid bit.  The coherent map table is neither
> +	 * freed nor reallocated by reconfiguration: it is kept for the
> +	 * function's lifetime and released only by nbl_intr_mgt_stop().
> +	 * Both rewrite the hardware entry without a chip reset; nothing else
> +	 * collects it, so a stranded one just stays as it is, and nothing
> +	 * requests one.
> +	 *
> +	 * pci_clear_master() on a non-control PF cannot stop DMA using the
> +	 * management PF's BDF.  It has not run yet on the control PF either,
> +	 * since nbl_remove() clears it after this function returns; what
> +	 * makes the only free - the one in nbl_intr_mgt_stop() - safe is
> +	 * that it runs after that point, with bus mastering off.
> +	 */

[Severity: Low]
Is "the only free" accurate here? The commit message makes the same
claim:

  The coherent map table is different: neither per-function path frees
  it, it is kept for the function's lifetime and reused in place, and
  nbl_intr_mgt_stop() is the only place it is released.

nbl_res_intr_cfg_msix_map() is a per-function path. Its
release_vecs_unlock error label frees the table while the control PF is
still bus master:

	if (!had_config && official_tbl->base_addr) {
		dma_free_coherent(dev, official_tbl->size,
				  official_tbl->base_addr,
				  official_tbl->dma);

had_config is false on a first configuration. It is also false after a
destroy, because __nbl_res_intr_complete_destroy_msix_map() keeps
base_addr but resets the state:

	func_res->state = NBL_INTR_FUNC_IDLE;

Suppose a sibling PF is configured again after an earlier destroy.
cfg_msix_map reuses the kept table, which the pcompleter has already
used. If a later vector allocation then fails with -EAGAIN, the error
path frees that table.

That contradicts the label's own comment ("release the DMA table
allocated during this call"). It also contradicts the keep-for-lifetime
rule documented in complete_destroy.

With the in-tree vector counts (one non-net vector per PF) the bitmap
pools can't run out, so the stop ordering added here is still safe
today.

Should the error path free the table only when this call allocated it?
Alternatively, should the commit message and this comment be adjusted?

> +	ret = nbl_dev_destroy_msix_map(dev_mgt);
> +	if (ret)
> +		dev_err(dev_mgt->common->dev,
> +			"Failed to destroy MSI-X map: %d\n", ret);

[Severity: Medium]
This patch doesn't change nbl_probe_chip_deps(), but with
nbl_core_start() a sibling PF now sends cfg_msix_map, get_vsi_id and
get_eth_id to func 0 from inside its own probe. The ordering that
nbl_probe_chip_deps() is meant to guarantee therefore matters more
now. Does it hold if func 0 is unbound while a sibling PF is probing?

In __device_release_driver(), device_links_busy() moves func 0's
links.status to DL_DEV_UNBINDING before device_remove() calls
nbl_remove(). Two things are only cleared after device_remove()
returns: mgt->dev.driver, by device_unbind_cleanup(), and
knode_driver, by klist_remove(). So for the whole of func 0's
nbl_core_stop() and nbl_core_remove(), the post-check in
nbl_probe_chip_deps() still passes:

	if (READ_ONCE(mgt->dev.driver) != pdev->dev.driver ||
	    !device_is_bound(&mgt->dev)) {

In that window, device_link_add() sees the supplier in
DL_DEV_UNBINDING and creates the link in DL_STATE_SUPPLIER_UNBIND.
nbl_probe_chip_deps() returns 0 anyway. The sibling then runs
nbl_core_init() and nbl_dev_start() against a control PF that is
disabling its mailbox and heading into nbl_intr_mgt_stop().

device_links_unbind_consumers() has already run on func 0, so nothing
unbinds the sibling afterwards. If the sibling's probe does complete,
device_links_driver_bound() hits its
WARN_ON(link->status != DL_STATE_CONSUMER_PROBE).

The other outcome of the race is also wrong. If func 0 has finished
nbl_remove() by the time of the post-check, the check fires and calls
device_link_del() on a link created with DL_FLAG_AUTOPROBE_CONSUMER.
That is a managed link, and the consumer is registered, so
device_link_put_kref() takes its "Unable to drop a managed device
link reference" WARN branch and leaves the link in place.

Triggering this needs root to unbind func 0 while a sibling probes.
The window is all of nbl_remove(), though, which sleeps during the
mailbox and interrupt teardown.

Could nbl_probe_chip_deps() check link->status on the link it just
added, and defer unless it is DL_STATE_CONSUMER_PROBE? A link in that
state makes device_links_busy() wait for the sibling's probe before
func 0 is unbound.

And should the defer path keep the managed link instead of calling
device_link_del() on it? That would let the driver core reprobe the
sibling when func 0 binds again.

[Severity: Low]
This destroy RPC can fail, for example with a polling-mode -ETIMEDOUT.
The comment above says the sibling's entry then stays
NBL_INTR_FUNC_CONFIGURED until nbl_intr_mgt_stop() collects it.

Does that make the existing comment in nbl_res_remove_leonis()
inaccurate?

	 * Sibling PFs are already unbound by the device-link ordering
	 * so no remote PF still has a live map entry or a running
	 * mailbox RPC at this point.

After this patch, a sibling that unbound after a failed destroy still
has a valid map entry when nbl_res_remove_leonis() runs.

The code handles this, because nbl_intr_mgt_stop() walks every
CONFIGURED function. Could the leonis comment be updated so that a later
change doesn't drop that walk based on it?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094925.6098-1-illusion.wang%40nebula-matrix.com
