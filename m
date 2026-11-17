Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919967;
	b=TdQEbBm0sfBbJSoIM8wGbwZ//zgwQXy8TLrcmSJZ8eMDeblUx5zCLYuOaqUQpG+kGCjA
	 ZgOaBGhMRVrpSN8YeOzEwge0Gjn2UyeP5tuih5YwXD4pi4ZNzzt1kh0vMu1dcGQPc+ryU
	 V/C/d6iwqn8Bh+YYw50Tz0Qu6LOCSegTHVphsZTjw3i2D1P/WOk8UR2daKmj/2nNE3Vrz
	 P0BRZ+RI7r6+9DQ5jddTCNsz/RWZaUx4oRw53NVVsUppYL8EtQfVTSQPOWP16URcKTNYx
	 fq3G6ifVOebQVRoemALntWbnXSuKgJ2z4WhjmeiCqaer+Glfrbc7UOb9OhkLYWSSEnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919967;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=f6uY2JVEGVtzYN21lOZWPDHJr2zwjadsZxpjqzELALE=;
	b=bzFIKAcTP9ctM2/slVksDBBCNizqqeBOMajk0bWNrUdek9hvR1FVrZPnQlORMLDXDpKr
	 up7XGAYcVxj2ntUuceOtuVnjTOKz97zjVFX4TB0xxiIt3OP+hLlvmo45YP3NPqVKD3gjE
	 wkIlFEUcnp6ZCDYQVSf8JPTN1RLWdMWLarSdQ30h4dWkT/+yvxR+VCEqlwq/qGCLG7dGT
	 BDu1Bo43pSExlLWXqiwf29XCIkG9A2cDgykXEZHsrC3ErchHEPZjoDbXxxFEyQ9rI3rdn
	 m+F/GM42qZgpTGHPML2xpTkI7xG2U/xOaJRtKsKIVlQDSfu/Dlbh907hof1p/kT+otA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FRaYtQLS;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD4606A886;
	Tue, 17 Nov 2026 12:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDD4606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FRaYtQLS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794919967; x=1826455967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q275WPfEwe6W7pcEp+TL6ULow3PdvnztyW6fJYb3THY=;
  b=FRaYtQLSeV55XAtJxNULYjV1mmAF0Lh9R4lFMnhs+2emS3HjAt0Yj3Zb
   nIJJZhCZILme7wKGL/F+IZ9tcNy+N0ShWUwjy37Fj6jLyNLvRCQtvoYcq
   hPL3cmPiqC3Nuav0ITccL4fhxJ4DJVxTVshxTYJBM+Xk8UwSwTLHWfWeh
   XW5vUICcVKMl9I90C6HUk7ey6QHOTm0M216J7OufW/4xFcDWzC50Z5CPX
   vbgV/eds5PzaqPzyiez9bCWwABj+yzr8h+x9QCC0YdA9mxO+aeUCf15na
   +s8ckhnZvClXRF9Y59uM+QX+DcTyu7K+H2KAjRo8HUJvCIRKrtWJXkvqs
   g==;
X-CSE-ConnectionGUID: 1ppKtCJ6QdeE8vyccUo15A==
X-CSE-MsgGUID: yJ6j8ps9QguoxbmaoM7e3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3586370"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3586370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 04:52:46 -0800
X-CSE-ConnectionGUID: zt3FFLAASBSXX040rUVezA==
X-CSE-MsgGUID: c+7/hjrnTf+VX3mUHBpZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9768168"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 04:52:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3EBB499; Tue, 17 Nov 2026 13:52:41 +0100 (CET)
Date: Tue, 17 Nov 2026 13:52:41 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Message-ID: <20261117125241.GA259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
 <20261110143758.GC259790@black.igk.intel.com>
 <2807832e631dca98846d201b571f623210820268.camel@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2807832e631dca98846d201b571f623210820268.camel@mediatek.com>

Hi,

On Tue, Nov 17, 2026 at 12:14:29PM +0000, Chunfeng Yun (云春峰) wrote:
> On 二, 2026-11-10 at 15:37 +0100, Mika Westerberg wrote:
> > On Tue, Nov 10, 2026 at 07:48:52PM +0800, Chunfeng Yun wrote:
> > >  
> > > -void nhi_enable_int_throttling(struct tb_nhi *nhi);
> > >  void nhi_disable_interrupts(struct tb_nhi *nhi);
> > >  irqreturn_t tb_nhi_isr(int irq, void *data);
> > >  irqreturn_t tb_ring_msix(int irq, void *data);
> > > diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> > > index 9379c598a221..698f47ec63da 100644
> > > --- a/drivers/thunderbolt/pci.c
> > > +++ b/drivers/thunderbolt/pci.c
> > > @@ -736,4 +736,5 @@ static struct pci_driver nhi_driver = {
> > >  	.shutdown = nhi_pci_shutdown,
> > >  	.driver.pm = &tb_nhi_pm_ops,
> > >  };
> > > +
> > 
> > I guess this is unintented change?
> > 
> will drop it
> 
> > >  module_pci_driver(nhi_driver);
> > > diff --git a/drivers/thunderbolt/platform.c
> > > b/drivers/thunderbolt/platform.c
> > > new file mode 100644
> > > index 000000000000..3562b6c7ea7d
> > > --- /dev/null
> > > +++ b/drivers/thunderbolt/platform.c
> > > @@ -0,0 +1,172 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Thunderbolt driver - NHI driver (Platform bus specific
> > > implementation)
> > > + *
> > > + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > + */
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/pm_wakeirq.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "nhi.h"
> > > +#include "tb.h"
> > > +
> > > +static int nhi_platform_init(struct tb_nhi *nhi)
> > > +{
> > > +	/* avoid device link fail for pcie tunnel */
> > 
> > Do you have the ACPI _DSD there in place? 
> Yes, we use the same uefi as WoA which pass Windows HLK and usb-if
> certitfication
> 
> > Then I don't think you need
> > these. And "pcie" -> "PCIe" everywhere (except in code).
> ACK
> 
> > 
> > > +	pm_runtime_set_active(nhi->dev);
> > > +	pm_runtime_get_noresume(nhi->dev);
> > > +	pm_runtime_enable(nhi->dev);
> > > +
> > > +	device_set_wakeup_capable(nhi->dev, true);
> > > +	device_enable_async_suspend(nhi->dev);
> > 
> > I also suggest not to enable all the fancy power management until you
> > have
> > the basic stuff like tunneling fully functional.
> I'm not sure understand what you mean.
> 
> if you mean the function test:
> I already test usb4net, usb3 tunnel, PCIe tunnel and dp tunnel data
> transfers, and also runtime suspend/resume and system suspend/resume.
> 
> if you mean when to enable pm:
> do you mean enable pm at the enable of tb_nhi_probe()?
> 
> +	pm_runtime_set_active(nhi->dev);
> +	pm_runtime_get_noresume(nhi->dev);
> +	pm_runtime_enable(nhi->dev);
> 
> these three line shall be put before nhi_select_cm(), otherwise, it
> fail to link PCIe devices, and I will check it again.
> 
> +	device_set_wakeup_capable(nhi->dev, true);
> +	device_enable_async_suspend(nhi->dev);
> 
> these two line can be put at the end of probe.

I meant device_enable_async_suspend() it's not stricly required and we
don't do it elsewhere so I would leave it out now and then add it
everywhere later.

> 
> if you have any suggestions, please describe more details, I will try
> it.
> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void nhi_platform_clear_wake_irq(void *dev)
> > > +{
> > > +	dev_pm_clear_wake_irq(dev);
> > > +}
> > > +
> > > +static int nhi_platform_init_irq(struct tb_nhi *nhi)
> > > +{
> > > +	struct device *dev = nhi->dev;
> > > +	int ret;
> > > +
> > > +	ret = devm_request_irq(dev, nhi->irq, tb_nhi_isr,
> > > IRQF_NO_SUSPEND,
> > > +			       dev_name(dev), nhi);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "request irq
> > > failed\n");
> > 
> > failed to request interrupt
> > 
> > Please be consistent with the rest of the driver.
> ACK
> > 
> > > +
> > > +	if (nhi->wake_irq) {
> > > +		ret = dev_pm_set_dedicated_wake_irq(dev, nhi-
> > > >wake_irq);
> > > +		if (ret) {
> > > +			return dev_err_probe(dev, ret, "set wake
> > > irq %d failed\n", nhi->wake_irq);
> > 
> > Split this into 2 lines.
> ACK
> > 
> > > +		}
> > > +
> > > +		dev_info(dev, "wake irq %d\n", nhi->wake_irq);
> > 
> > Remove this. The driver should be silent when it works. You can add
> > debug
> > but I don't think this is useful.
> ACK
> > 
> > > +
> > > +		ret = devm_add_action_or_reset(dev,
> > > nhi_platform_clear_wake_irq, dev);
> > 
> > Can you pass dev_pm_clear_wake_irq directly here?
> 
> the parameter type do not match which cause build warning
> 
> kernel/mediatek/drivers/thunderbolt/platform.c:8:
> kernel/mediatek/drivers/thunderbolt/platform.c: In function
> 'nhi_platform_init_irq':
> kernel/mediatek/drivers/thunderbolt/platform.c:53:53: error: passing
> argument 2 of '__devm_add_action_or_reset' from incompatible pointer
> type [-Werror=incompatible-pointer-types]
>    53 |                 ret = devm_add_action_or_reset(dev,
> dev_pm_clear_wake_irq, dev);
>       |                                                    
> ^~~~~~~~~~~~~~~~~~~~~
>       |                                                     |
>       |                                                     void
> (*)(struct device *)
> upstream/k7/kernel/mediatek/include/linux/device/devres.h:283:41: note:
> in definition of macro 'devm_add_action_or_reset'
>   283 |         __devm_add_action_or_reset(dev, action, data, #action)
>       |                                         ^~~~~~
> upstream/k7/kernel/mediatek/include/linux/device/devres.h:271:73: note:
> expected 'void (*)(void *)' but argument is of type 'void (*)(struct
> device *)'
>   271 | static inline int __devm_add_action_or_reset(struct device
> *dev, void (*action)(void *),


Oh right it has different prototyp so you need the wrapper. Then it's okay.
