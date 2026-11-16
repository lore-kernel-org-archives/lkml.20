Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837289;
	b=oDJarjtc6IfpkhNXzAsAMekJv0T2sO2d4qHhir255XjX1LUanGiRO/VThhGTH/htMUhr
	 xZHk4jLjCt/lLMyEQYNTj5AUZHx15JmFyoy/XpZSdJeHmZwbqXIplUZXkMK76CMfUrshN
	 1ktVWi0dvnogWQmcEGNiKT51FvLx0fBpVeEhG/RBXO25gnCOL2mYuIDnP0bqijrwa+e/7
	 9yjQJfW/uBwc9n5WijLn369wA2JSIB2BXKo3IiM5nt7GZAgppUlTODHdNqCAULoneiV2B
	 roqjpINfdNeRi6PW8A5usSuhyQUPTbIr8HdRz0OMxllCgz1iPFRBH7KLWW5SK+ReYIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837289;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XCIGIeS5uHdZm2Kdlff9ZyrR1cpN2eecQEyDWRwOU/4=;
	b=McxXMubUft2a9gfs0HC3c/NCWcbcs1fCWsR7mWQeeEpSnUAsrVQOqgGaJfrsXwrO3MmD
	 u+hlmULZEJ7bBZTf9StOnM2KZLBGH/SJU8vCz7L7fGFX2zU7VS5orqQQwCJ/8sAwjVP50
	 W/XVKpOzROMIOeS6TJJjdCDWVhoHDWL+Sb4HNFAAfS96IFchrFJ0iVrjvL2aW8ebjG4dc
	 B4MBHfAd7VsbxePffMlSwP0fJ3p2QUQLYyGLzhZCypQ5Wl2tsk7AWzH+oPfcOlnRMgxTC
	 b13b09WnJcyROmtpBeIjEocyOvRGl7wiumR2ix0HrcOGuHqIqV3gxjmyY7264xC9kxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BNndyU/V";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3635F60A6F5F;
	Mon, 16 Nov 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNndyU/V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFC21F000C6;
	Mon, 16 Nov 2026 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837288;
	bh=XCIGIeS5uHdZm2Kdlff9ZyrR1cpN2eecQEyDWRwOU/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BNndyU/VT14gSzDt5PzgK48bnkbUUQR6kLAAtbhm8RFjf828q0NRaGiX6+V3D/eSm
	 uAqE7qhjJiNaR1+7LAqPS7EFnx6GJ9pi7CouU4eUc9/xRNmPgvm4BBCEqIEgSnzus4
	 gRsJGDhtb0Kf+BErjY0ShBzDWbGPEKDpn/24OaNnOidPITwSq5zkpYVdaZ4Xxo+Ds8
	 6Dk7T6YHKJ8hKdwWz1epfA7EtFo4bKOrhvJGDbomTkKCyrM0hNTiI4lBqC2quq+iui
	 82mjX535VAbLLcz1DvMaOZtRU/JkcJBlj2z5oJqMmsBir2MX/KXzzIfNqrq65N0anV
	 2J18MhCw8Ou7Q==
Subject: Re: [PATCH v34 net-next 7/8] net/nebula-matrix: add common/ctrl dev
 init/remove operation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:47 +0000
Message-ID: <179483728776.3136.1710957657844189962@kernel.org>
In-Reply-To: <20261112094925.6098-8-illusion.wang@nebula-matrix.com>
References: <20261112094925.6098-8-illusion.wang@nebula-matrix.com>
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

- [Medium] This patch's teardown ordering assumes that no sibling PF can
  probe while the control PF runs nbl_dev_remove().
- [Medium] This patch adds nbl_dev_init() to nbl_core_init(), and
  nbl_probe() calls pci_set_master() only after nbl_core_init() returns.
- [Low] The comment block added above nbl_dev_remove_ctrl_dev()
  (drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c, lines…
- [Low] The commit message and the code comment added by the same patch
  give opposite reasons for deferring the VSI/ETH identity lookup.

--

net/nebula-matrix: add common/ctrl dev init/remove operation

This commit adds nbl_dev.c and related headers that provide nbl_dev_init()
and nbl_dev_remove(), and wires them into nbl_core_init() and
nbl_core_remove(). Common setup creates the mailbox clean work and the
mailbox channel queue. The control PF also programs the mailbox QINFO
routing and runs init_module(), and calls deinit_module() after the
mailbox has been torn down.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c
> new file mode 100644
> index 0000000000000..0cc0c58ad6336
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c

[ ... ]

> +	nbl_dev_register_chan_task(dev_mgt, NBL_CHAN_TYPE_MAILBOX,
> +				   &common_dev->clean_mbx_task);
> +	/*
> +	 * VSI/ETH identity is deliberately not fetched here but in the
> +	 * start path, which is where it is used: the IDs only feed MSI-X
> +	 * and queue setup.  Responder availability is not what defers it -
> +	 * nbl_probe_chip_deps() keeps a sibling in -EPROBE_DEFER until
> +	 * func 0 is bound, and driver_bound() only runs after func 0's
> +	 * whole probe, this function included, has returned.
> +	 */

[Severity: Low]
The commit message gives the opposite reason for deferring the VSI/ETH
lookup:

  "VSI/ETH identity lookup and MSI-X vector allocation are deferred to the
  subsequent start routine, so that the control PF mailbox responder is
  fully ready before any cross-PF RPC is issued"

This comment, on the other hand, says responder availability is not why
the lookup is deferred.

Later in the series this comment is unchanged. The nbl_dev_start() comment
added there argues that responder readiness (func 0's set_mailbox_irq(true)
at the end of its start path) does matter.

Which of these is the real reason? Could the commit message and this
comment be made to agree?

[ ... ]

> +/*
> + * Tear down control device: deinit_module sets driver_status=false
> + * to notify firmware to clean all per-PF hardware state (including
> + * qinfo registers).  The qinfo map programmed in nbl_dev_init() via
> + * nbl_dev_setup_chan_qinfo() is not explicitly cleared; firmware
> + * handles it on driver_status change.
> + *
> + * Teardown ordering guarantee: every non-management PF creates a
> + * consumer->control PF device link in its probe path, so the driver
> + * core always unbinds all siblings before allowing the control PF to
> + * be detached (sysfs unbind, driver unregister and hot-unplug alike).
> + * nbl_probe_chip_deps() defers a sibling's probe until the control PF
> + * is fully bound (DL_DEV_DRIVER_BOUND), and holds the management PF's
> + * device lock across both that check and device_link_add(), so a
> + * supplier cannot slip to DL_DEV_NO_DRIVER or DL_DEV_PROBING in
> + * between.  A sibling therefore cannot

[Severity: Low]
Is this an accurate description of nbl_probe_chip_deps()? The function
itself says it does not take the management PF's device lock:

drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c:nbl_probe_chip_deps() {
    ...
	/*
	 * Deliberately lock-free.  This probe already runs under
	 * device_lock(funcN), while __pci_bus_lock() (AER recovery, slot
	 * reset) walks the bus in devfn order, i.e. 0 -> N: taking
	 * device_lock(func0) here would establish the opposite order, and
    ...
	if (READ_ONCE(mgt->dev.driver) != pdev->dev.driver ||
	    !device_is_bound(&mgt->dev)) {
    ...
	link = device_link_add(&pdev->dev, &mgt->dev,
			       DL_FLAG_AUTOPROBE_CONSUMER);
    ...
	if (READ_ONCE(mgt->dev.driver) != pdev->dev.driver ||
	    !device_is_bound(&mgt->dev)) {
    ...
}

There is no device_lock(&mgt->dev) call. The check reads dev.driver and
device_is_bound(), not links.status.

driver_bound() sets knode_driver with klist_add_tail() before
device_links_driver_bound() moves links.status to DL_DEV_DRIVER_BOUND. So
the check can accept a supplier that is still DL_DEV_PROBING.

This comment is still the same at the end of the series. Could it be
updated to match the lock-free implementation in nbl_main.c?

> + * reach its mailbox setup before the control PF is fully probed, nor
> + * race this deinit afterwards - the link forces it to be unbound
> + * first.  The link is a persistent managed link with

[Severity: Medium]
Does the link really keep a sibling from racing this deinit? The commit
message makes the same claim:

  "The device link created during non-control PF probe makes the driver
  core unbind all sibling PFs before the control PF is removed."

The checks in nbl_probe_chip_deps() don't seem to catch a control PF that
is already unbinding. dev->driver and knode_driver both stay set for the
whole of ->remove():

drivers/base/dd.c:__device_release_driver() {
    ...
		device_remove(dev);
		...
		device_unbind_cleanup(dev);
		device_links_driver_cleanup(dev);

		klist_remove(&dev->p->knode_driver);
    ...
}

Suppose func 0 is unbound through sysfs while a sibling with no link yet
probes (a first bind, a driver_override switch, or a deferred-probe retry):

func 0 (sysfs unbind)
__device_release_driver()
  device_links_busy()
    links.status = DL_DEV_UNBINDING      /* no busy consumer link */
  device_remove()
    nbl_remove()->nbl_core_remove()->nbl_dev_remove()
      nbl_dev_remove_common_dev()
      nbl_dev_remove_ctrl_dev()->deinit_module()

sibling funcN (probing concurrently)
device_links_check_suppliers()           /* no link yet, passes */
nbl_probe_chip_deps()
  dev.driver / device_is_bound() check passes
  device_link_add()
    device_link_init_status()
      link->status = DL_STATE_SUPPLIER_UNBIND
  re-check with the same predicates passes
nbl_core_init()->nbl_dev_init()->nbl_dev_setup_common_dev()
  nbl_dev_setup_chan_queue()             /* sibling mailbox enabled */

The sibling's mailbox setup then overlaps func 0's mailbox teardown and
deinit_module(). deinit_module() sets driver_status=false, which lets
firmware reclaim the QINFO routing.

When the sibling's probe finishes, device_links_driver_bound() hits
WARN_ON(link->status != DL_STATE_CONSUMER_PROBE) and forces the link to
ACTIVE. func 0's device_links_driver_cleanup() then hits
WARN_ON(link->status != DL_STATE_SUPPLIER_UNBIND) and sets the link
DORMANT.

On the next bind of func 0 the link becomes AVAILABLE while the sibling
is still bound. A later unbind of func 0 then sees device_links_busy()
return false and removes the control PF with the sibling still bound.

A sibling that already has a link from an earlier probe is deferred by
device_links_check_suppliers() while the link is SUPPLIER_UNBIND, so this
seems limited to a sibling's first probe. nbl_probe_chip_deps() comes from
earlier in this series and is unchanged at the end of it.

Is there anything that orders a sibling's first probe against func 0's
unbind here?

[ ... ]

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> index 830ef7ebea053..dd81720df9ff0 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c

[ ... ]

> @@ -53,7 +54,14 @@ struct nbl_adapter *nbl_core_init(struct pci_dev *pdev,
>  	ret = nbl_disp_init(adapter);
>  	if (ret)
>  		goto out_res_remove;
> +
> +	ret = nbl_dev_init(adapter);
> +	if (ret)
> +		goto out_disp_remove;
>  	return adapter;

[Severity: Medium]
With nbl_dev_init() now called from nbl_core_init(), is the mailbox DMA
engine armed before bus mastering is enabled? nbl_probe() calls
pci_set_master() only after nbl_core_init() has returned:

drivers/net/ethernet/nebula-matrix/nbl/nbl_main.c:nbl_probe() {
    ...
	 * point is host-side setup plus MMIO and nothing in it waits for
	 * the device, so it does not need bus mastering.
	 */
	err = nbl_probe_chip_deps(pdev, param.caps.has_ctrl);
    ...
	adapter = nbl_core_init(pdev, &param);
    ...
	pci_set_master(pdev);
    ...
}

The chain nbl_dev_init()->nbl_dev_setup_common_dev()->
nbl_dev_setup_chan_queue()->nbl_chan_setup_queue() programs the ring
addresses with QUEUE_EN and gives the RX descriptors to the device:

drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:nbl_chan_setup_queue() {
    ...
	nbl_chan_config_queue(chan_mgt, chan_info, true); /* tx */
	nbl_chan_config_queue(chan_mgt, chan_info, false); /* rx */
	nbl_chan_update_tail_ptr(hw_ops, chan_mgt->hw_ops_tbl->priv,
				 rxq->tail_ptr, NBL_MB_RX_QID);
	WRITE_ONCE(chan_info->active, true);
    ...
}

This runs on both the control PF and the other PFs. The nbl_probe()
comment saying nothing before pci_set_master() needs bus mastering is no
longer true after this patch. The ordering is still the same at the end of
the series.

With Bus Master Enable clear, the function cannot issue memory requests.
Depending on the mailbox engine, an RX descriptor prefetch after the tail
doorbell could stall, be dropped, or latch an error. Nothing re-kicks or
re-validates the queue after pci_set_master().

Does this hardware hold such requests until bus mastering is enabled? If
it doesn't, can the queue state drift away from the driver's rings while
chan_info->active is already true?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094925.6098-1-illusion.wang%40nebula-matrix.com
