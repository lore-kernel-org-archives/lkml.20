Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837284;
	b=LXx2wGBP7ZoROm2vsibVII0SyR+wg7gJAWw9TjXpufz5yLXTUNSc6T3/JLmkDcvdm4S3
	 ZfF1OiqayAsVRH4N4LS+E0egnyeMF/kNpCeCkSylRkVY0JyvY2O20TaU1LTGru4axUgTM
	 6gjqUDdY4JoWeY0QoLt6rfm7j/S8LpuZNupWjFOTl+78WrlIGP2X5xcVlQ+b6Fvg2OquD
	 OYo3yoqOLCjxjomGUCBHBjjbdFCY6MtLCguQ8orO9uIS0EuK8k8oPhh3xE80Lp5QDDXbu
	 5cLPDyxAsE7sJOyzI3hMfXgowYeNZ1MCy+P9kKExg0ccKF+aWSsuELGtrDDcTgcZW0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837284;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LdPrdqDVGSq85earGVbqzNm8ZY3wLZIZJodo9Oko1aI=;
	b=wCkCVGk7SXvGS3Im+/Jbw/Ocgsy6phGWmbp0MjGDhlqYpMoRNnTSiGaQdqqQWrDBZOLF
	 HqzLjVAnZUStO64sRU2i+jB82LA8ZsU+chQUC/xRlqucnJbxm64nafK/XQQqicNATPB8E
	 qtinEHKn8N37MX6XvUsH55L+BuLpKdLNfsjDpvbykTl8EhSfjndMYc1zsPk/7g21bnlm1
	 dDXhQM0AUh9tvQedFvTknYOw6yMKHF/5an5aHmYAj4O1pp23bNIQe3PvDGWbA39eSKB1Q
	 8NdQA2jCpIY63Vi/C1hL2//MXD+RzBoiLxW9Pmx5JOO5nELshsjVxv45+CaZXV30nnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbNTAJ7r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1960A262B;
	Mon, 16 Nov 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbNTAJ7r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173E81F000C4;
	Mon, 16 Nov 2026 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837283;
	bh=LdPrdqDVGSq85earGVbqzNm8ZY3wLZIZJodo9Oko1aI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bbNTAJ7rnLl2FZSK286iyOfPz4hKjBUBzZsitamgerYyY3PvvIxmFSQm6txkgAEEK
	 2ZRyhAhl9ZCUZX4yQiS8XGx7+nhgTPlVoXWsbtX+La0Wm5VLOnvOTHuC3ORelYoPx7
	 2/lfe1iyiQpj1ULchkA9tPtAjgYmqmjs/d1sH3QPF6W+MuUU1cXuwGmdGNTieVtNJ5
	 SwuVysFUT0nghHrJnsW5nl8+Bd/lqevngwUiWK2LuUe5xBrbSY9Wp2jy/p62qL1ifZ
	 yrDi6GwJtmJI/rDOWdxus6vKKKbSL+SfFfWi6mbGshnYGz89YXgX59l1AwLctyy2UQ
	 fWXsJYUNZ6rCA==
Subject: Re: [PATCH v34 net-next 3/8] net/nebula-matrix: add intr resource
 implementation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:42 +0000
Message-ID: <179483728260.3136.1392283157752816887@kernel.org>
In-Reply-To: <20261112094925.6098-4-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-4-illusion.wang@nebula-matrix.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The error path of nbl_res_intr_cfg_msix_map()
  (drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c) frees…
- [Medium] nbl_intr_setup_mgt() (drivers/net/ethernet/nebula-
  matrix/nbl/nbl_hw/nbl_interrupt.c) invalidates FUNCTION_MSIX_MAP only…
- [Low] The note added to nbl_res_remove_leonis()
  (drivers/net/ethernet/nebula-…
- [Low] nbl_probe() (drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c)
  and the commit message argue that the stale-FUNCTION_MSIX_MAP scrub in…

--

net/nebula-matrix: add intr resource implementation

This commit adds an nbl_interrupt module for the control PF. The module
manages the chip-internal MSI-X vector bitmaps and the per-function
coherent MSI-X map tables. It also adds hardware ops that program
FUNCTION_MSIX_MAP, HOST_MSIX_INFO and mailbox IRQ routing. nbl_probe() now
calls pci_set_master() only after nbl_core_init(), and nbl_remove() now
calls pci_clear_master() before nbl_core_remove().

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c
> index d19d87ae044e4..3304420560d40 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c

[ ... ]

> @@ -331,8 +340,31 @@ int nbl_res_init_leonis(struct nbl_adapter *adap)
>  
>  void nbl_res_remove_leonis(struct nbl_adapter *adap)
>  {

[ ... ]

> +	if (common->has_ctrl && res_mgt->intr_mgt)
> +		nbl_intr_mgt_stop(res_mgt);
> +
> +	/* Note:
> +	 * per-function interrupts arrays (kcalloc) are freed by
> +	 * nbl_intr_mgt_stop().
> +	 * MSIX coherent tables are explicitly freed by dma_free_coherent()
> +	 * inside the intr destroy path, before nbl_intr_mgt_stop() returns.
> +	 * intr_mgt itself (devm_kzalloc) is released by devres after this
> +	 * function returns
>  	 */
>  }

[Severity: Low]
Is this note accurate? Elsewhere in the patch, the "destroy path" means
nbl_res_intr_destroy_msix_map()->__nbl_res_intr_complete_destroy_msix_map().
That path does not free the table on purpose:

	/*
	 * The coherent table is kept, not freed here.

The dma_free_coherent() calls are actually in a separate loop at the end of
nbl_intr_mgt_stop(). The commit message also says the table is "released
only by nbl_intr_mgt_stop()".

Could the comment name nbl_intr_mgt_stop() directly, so it isn't read as
saying destroy_msix_map frees the DMA memory?

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c
> new file mode 100644
> index 0000000000000..19ef88069aeb4
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c
> @@ -0,0 +1,853 @@

[ ... ]

> +int nbl_res_intr_cfg_msix_map(struct nbl_resource_mgt *res_mgt,
> +			      u16 func_id, u16 num_net_msix,
> +			      u16 num_others_msix,
> +			      bool net_msix_mask_en)
> +{

[ ... ]

> +	had_config = intr_mgt->func_intr_res[func_id].state ==
> +		     NBL_INTR_FUNC_CONFIGURED;

[ ... ]

> +	/* Allocate MSIX DMA table once per function */
> +	if (!official_tbl->base_addr) {
> +		official_tbl->size =
> +			sizeof(struct nbl_msix_map) *
> +			NBL_MSIX_MAP_TABLE_MAX_ENTRIES;
> +		official_tbl->base_addr = dma_alloc_coherent(dev,
> +							     official_tbl->size,
> +							     &official_tbl->dma,
> +							     GFP_KERNEL);
> +		if (!official_tbl->base_addr) {
> +			dev_err(dev, "Failed to allocate DMA memory for MSIX table\n");
> +			ret = -ENOMEM;
> +			goto release_vecs_unlock;
> +		}
> +	}
> +
> +	/* Allocate net interrupt vectors */
> +	for (i = 0; i < num_net_msix; i++) {
> +		intr_index = find_first_zero_bit(intr_mgt->intr_net_bmap,
> +						 NBL_MAX_NET_INTERRUPT);
> +		if (intr_index == NBL_MAX_NET_INTERRUPT) {
> +			dev_err(dev, "No free net interrupt vectors left\n");
> +			ret = -EAGAIN;
> +			goto release_vecs_unlock;
> +		}

[ ... ]

> +release_vecs_unlock:
> +	nbl_intr_release_bitmap(intr_mgt, res_mgt, tmp_interrupts,
> +				allocated_cnt);
> +	kfree(tmp_interrupts);
> +	/*
> +	 * On a failed fresh configuration, release the DMA table
> +	 * allocated during this call. On a failed reconfiguration the
> +	 * old configuration is still intact (it is only torn down
> +	 * after all vector allocations succeed) and owns the table.
> +	 */
> +	if (!had_config && official_tbl->base_addr) {
> +		dma_free_coherent(dev, official_tbl->size,
> +				  official_tbl->base_addr,
> +				  official_tbl->dma);
> +		official_tbl->base_addr = NULL;
> +		official_tbl->dma = 0;
> +		official_tbl->size = 0;
> +	}

[Severity: Medium]
Can this free a table that this call did not allocate?

Suppose a function is configured and then destroyed. In that case
__nbl_res_intr_complete_destroy_msix_map() sets the state to
NBL_INTR_FUNC_IDLE and keeps official_tbl->base_addr allocated.

On the next nbl_res_intr_cfg_msix_map() for that function, had_config is
false. The "if (!official_tbl->base_addr)" allocation is skipped, so the
kept table is reused.

If the net or other vector allocation then fails with -EAGAIN, the code
jumps to release_vecs_unlock. The !had_config check then frees the kept
table at runtime, while the control PF is still bus master.

This conflicts with the comment in
__nbl_res_intr_complete_destroy_msix_map() ("freeing here would let a late
fetch read reused memory"). It also conflicts with the comment in
nbl_intr_mgt_stop() ("so this is the only place they are released"). In
addition, the next configuration allocates a fresh table, so the table is
not "allocated once per function".

Later in the series, the sibling PF path reaches this code. nbl_dev_stop()
sends the destroy RPC, and a rebind goes through nbl_dev_start() -> cfg
RPC -> nbl_res_intr_cfg_msix_map(). With today's single mailbox vector per
PF the pool is hard to exhaust. However, the RPC accepts up to 1024 vectors
per function.

Would a local flag that records whether this call allocated the table be a
better condition for the free than !had_config?

[ ... ]

> +/*
> + * Reset the software state and invalidate every function's hardware MSI-X
> + * map entry once.  The chip-internal tables (FUNCTION_MSIX_MAP,
> + * PADPT_HOST_MSIX_INFO, HOST_MSIX_FID_TABLE) can survive a kexec or a
> + * forced unload without FLR and there is no .shutdown callback to scrub
> + * them.  Only FUNCTION_MSIX_MAP is scrubbed here: it is indexed by
> + * func_id, so covering all NBL_MAX_PF entries costs one register write
> + * each, after which the pcompleter can no longer fetch a stale table that
> + * points into memory this kernel may have reallocated.  The INFO/FID

[ ... ]

> +	for (func_id = 0; func_id < NBL_MAX_PF; func_id++)
> +		hw_ops->cfg_msix_map(res_mgt->hw_ops_tbl->priv, func_id,
> +				     false, 0, 0, 0, 0);
> +	hw_ops->flush_write(res_mgt->hw_ops_tbl->priv);
> +	nbl_intr_quiesce_wait();

[Severity: Medium]
Does this loop cover every FUNCTION_MSIX_MAP entry that the hardware can
fetch? It only invalidates func_id 0 through NBL_MAX_PF - 1.

The patch itself describes a function-id space wider than the PFs.
__nbl_res_intr_set_mailbox_irq() says func_intr_res[] "is indexed by the
raw hardware function id; this bound check ... is what keeps VF ids out".
Also, NBL_PCOMPLETER_HOST_MSIX_FID_TABLE_FID_MASK is GENMASK(9, 0).

Suppose a previous kernel, for example one running an out-of-tree driver
with VF support, left VF map entries VALID and they survived kexec. This
loop would not scrub those entries. Their fetches carry the control PF's
BDF, so pci_set_master() in nbl_probe() would re-enable them.

The patch doesn't say whether the table has entries beyond PF 7, or
whether the chip still fetches them when VFs are disabled. If it does,
should the scrub cover the full function-id range?

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> index 09e3eabfbcae9..6b69ed11fa96c 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> @@ -234,24 +234,36 @@ static int nbl_probe(struct pci_dev *pdev,
>  	/* never return fail when DMA_BIT_MASK(64) */
>  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>  
> -	pci_set_master(pdev);
> -
> +	/*
> +	 * Bus mastering is enabled only after nbl_core_init() returns.
> +	 *
> +	 * FUNCTION_MSIX_MAP survives a kexec or a forced unload without
> +	 * FLR and there is no .shutdown callback to scrub it, so at this
> +	 * point every map entry left VALID by a previous kernel still
> +	 * holds a DMA address that this kernel has already reallocated.
> +	 * Those entries tag their table fetches as bus-master reads, and
> +	 * the only thing standing between such a fetch and a read of
> +	 * reused memory is Bus Master Enable, which the PCI core cleared
> +	 * on the way into this kernel.  nbl_intr_setup_mgt() invalidates
> +	 * the entries from inside nbl_core_init(); enabling bus mastering
> +	 * before that would re-open the window.  Everything up to that
> +	 * point is host-side setup plus MMIO and nothing in it waits for
> +	 * the device, so it does not need bus mastering.
> +	 */
>  	err = nbl_probe_chip_deps(pdev, param.caps.has_ctrl);

[ ... ]

> +
> +	pci_set_master(pdev);
>  	pci_set_drvdata(pdev, adapter);

[Severity: Low]
Is Bus Master Enable guaranteed to be clear at this point? The patch only
moves pci_set_master() later. Nothing clears the bit before the scrub in
nbl_intr_setup_mgt().

On the way out, the PCI core clears it only in pci_device_shutdown() when
kexec_in_progress is set, so the kexec case in the comment does hold.

On a kdump boot, the crashed kernel runs no shutdown callbacks. Also,
pci_device_remove() does not clear the bit when a previously bound driver
unbinds without calling pci_clear_master() or pci_disable_device().

In those cases, could the device fetch stale VALID map entries between
pcim_enable_device() and the scrub? Would an explicit pci_clear_master()
before nbl_core_init() make the stated guarantee hold no matter how the
device was left?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094925.6098-1-illusion.wang%40nebula-matrix.com
