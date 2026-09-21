Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A89502D4F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025326; cv=none; b=hJc1KuXntjo5Uchfl+nkFPPm9aU5fDIbwFd6nhiqiA8OvsmU5jfTrPjWPrOlkkZAcpYYFwLd9SvwtbDqjnlJkD01ohnjUvYTk/B83zI/jKS/lYCETJFmmJHcash0mxJBUK1DST6eEo3jPQvorVcCwGyac0BLDcuAS8b/47YEw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025326; c=relaxed/simple;
	bh=zSBUMa/A3JvKG97BhCYBFUPrlBsYKRWjf1MH5dSFouE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UL1RzVP5P2NAHPJt/2VG9R38hHYflrGmdAzcoC56Vtgo0oviOscaB3/KbjMAID4bPWDJALT3UhHzqs30yR87dl5gCczUwyMuqi/0iyDfxqt6qhSJOxr12hgqAewFbrMSZ427R2O5HQXErsqegnLjjqEewDQHu9Po4+UAa9CMdfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iezdQNUO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iezdQNUO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF7B21A0F92
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:15:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 162A75FFB2;
	Mon, 21 Sep 2026 21:15:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63C64103291B0;
	Mon, 21 Sep 2026 23:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790025317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=CRp7RNvAsNcbrboO4eg3ynVKeONy6hZ90q9B389EWtU=;
	b=iezdQNUO9thBhgFAoWKbyMX33ErDtaH2Gk7yhqTUX44CCM8HTW3gFcNFOaghvuTbuUvTOU
	koS9/J3GHSHwc95W8sj/259bMA+IS0HGltA0qic4KzGiaTZcEYY4ZDxMEvz6YJYAIF7nfa
	lqhsKi8izxkK8bAsl72dumOYjirAxJ4p7wofE77kQvza4PqrAmq3KlgHyQjc01gzb328QE
	BuiCZdJHWE+TVOfu3Zuq33XmohiFu5ZSTD2K90gAD4rRC77f3h33yPq7kjHjO0qHm/CuZo
	eqKa7BeBHF6QPvEIZpTrYTc6bgVbk40NxBUGznJG6h73VjtgMkPRvkwUDd61Ng==
Date: Mon, 21 Sep 2026 23:15:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v19 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <20260921211513c7d46108@mail.local>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-7-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916070728.1088801-7-lakshay.piplani@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On 16/09/2026 12:37:26+0530, Lakshay Piplani wrote:
> Add virtual I3C bus support for the hub and provide interface to enable
> or disable downstream ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Changes in v19:
>  - No change
> 
> Changes in v18:
>  - Rebased onto v7.3-rc1; no intended driver behaviour changes
> 
> Changes in v17:
>  - Move the lockdep-only routing-lock class assignment into a dedicated
>    helper, leaving hub context initialization unconditional when
>    CONFIG_LOCKDEP is disabled
>  - Document that hub_dev must already be registered and remove the
>    WARN_ON_ONCE checks for its descriptor and parent controller
>  - Export i3c_hub_master_ops as a const object and reference it directly
>    instead of returning it through an accessor
>  - Document that downstream ports share the parent controller's dynamic
>    address domain and that independent per-port DAA domains are not
>    provided
>  - Document that a broadcast CCC on a virtual bus reaches the parent bus
>    and devices behind other connected ports; directed CCCs must be used
>    for per-device scope
>  - Document that fixed-DT address reservations remain allocated for the
>    lifetime of the parent bus, are reused across driver reprobes, and
>    that downstream hot-join support would also require reserving static
>    addresses
> 
> Changes in v16:
>  - Fix the lockdep "recursive locking" false positive on the forwarding path
>    (holding the virtual bus lock while taking the parent bus lock, both
>    sharing one class). Introduce per-nesting-depth lock_class_key arrays for
>    the bus lock and the routing mutex, computed via
>    i3c_hub_controller_depth(), assigned in i3c_hub_master_bus_init() and
>    i3c_hub_init()
>  - Fix the parent-bus dynamic-address reservation: reserve by
>    "assigned-address" regardless of the static address (the old
>    static_addr != assigned_addr skip left addresses free and risked ENTDAA
>    collisions). Reserve only when the slot is currently FREE, under the
>    parent bus maintenance lock
>  - Make the reattach info update atomic w.r.t. asynchronous IBI: update
>    parent_desc.info under i3c_bus_maintenance_lock(&parent->bus) and reject
>    reattach with -EBUSY (WARN_ON_ONCE) while parent_desc.ibi is live
>  - Document and check the detach-time IBI lifecycle invariant:
>    parent_desc.ibi must already have been cleared through i3c_hub_free_ibi()
>    before the parent-facing descriptor is detached and freed. Add
>    WARN_ON_ONCE() to detect a violation. The underlying generic I3C-core
>    unregister/IBI-quiesce behaviour is a known I3C-core limitation
>  - Document that DAA is intentionally run on the parent controller because
>    downstream devices share the parent's dynamic-address space; broadcast
>    RSTDAA is intentionally not forwarded (would reset the hub address)
> 
> Changes in v15:
>  - Replace temporary descriptor reparenting and hub-address switching with
>    a permanent parent-facing descriptor for each downstream I3C device
>  - Keep the logical device descriptor associated with the virtual hub
>    controller while using the parent-facing descriptor for physical
>    controller operations
>  - Implement downstream device attach, reattach and detach using the new
>    controller-only helpers
>  - Forward IBI slot recycling to the physical parent controller
>  - Remove the helper that temporarily changed the logical descriptor's
>    master pointer
> 
> Changes in v14:
>  - Add hub route serialization around DAA, CCC, private transfer and IBI paths
>  - Add comments explaining that downstream devices behind hub target ports
>    share the parent controller address space
>  - Use i3c_bus_maintenance_lock()/unlock() instead of raw parent bus lock
>    operations
>  - Hold the parent maintenance lock across temporary hub address reattach,
>    transfer and address restore
>  - Rework IBI request/free forwarding, so downstream devices are temporarily
>    attached to the parent controller for IBI setup
>  - Clean up the preallocated virtual IBI object and workqueue before forwarding
>    the IBI request to the parent controller
>  - Avoid NULL dereference in the core IBI free path when the forwarding
>    callback has already cleared dev->ibi
> 
> Changes in v13:
>  - Reserve parent I3C bus address slots for downstream devices with matching static and
>    assigned addresses by parsing target-port DT nodes
>  - Keep broadcast RSTDAA blocked and add explanatory comment
>  - Add TODO for empty IBI slot recycle callback
>  - Add comments for intentional no-op callbacks
> 
> Changes in v12:
>  - Drop redundant depends on I3C from config I3C_HUB
>  - Return -EOPNOTSUPP for unsupported I2C transfers instead of reporting
>    success.
> 
> Changes in v11:
>  - Fix virtual hub address reattach handling
>  - Fix parent bus locking during address reattach operations
>  - Improve transfer and IBI request error handling
> 
> Changes in v10:
>  - Remove unnecessary ibi_lock handling in request/enable/disable/free
>    IBI APIs
>  - Remove redundant parent pointer from struct i3c_hub and derive upstream
>    master from hub_dev
> 
> Changes in v9:
>  - No change
> 
> Changes in v8:
>  - No change
> 
> Changes in v7:
>  - Convert Kconfig option to tristate
>  - Fix signedness issue in return value
>  - Fix kernel-doc warnings
> 
> Changes in v6:
>  - Add support for the generic I3C interface in the I3C Hub
> ---
> ---
>  MAINTAINERS             |   2 +
>  drivers/i3c/Kconfig     |  14 +
>  drivers/i3c/Makefile    |   1 +
>  drivers/i3c/hub.c       | 832 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/hub.h |  92 +++++
>  5 files changed, 941 insertions(+)
>  create mode 100644 drivers/i3c/hub.c
>  create mode 100644 include/linux/i3c/hub.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 514cda5088ba..142b0f7636c1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19766,8 +19766,10 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/i3c/hub.c
>  F:	drivers/mfd/p3h2840.c
>  F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
> +F:	include/linux/i3c/hub.h
>  F:	include/linux/mfd/p3h2840.h

This should be moved to 7/8 so it can be applied independently of the
p3h2840 driver itself. I'm ready to take 1,2 and 6 but to be able to
apply the rest, I need an ack from Lee on 4/8.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
