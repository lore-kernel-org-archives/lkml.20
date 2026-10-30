Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350076;
	b=w2M9sUXR+05xdNiGiD/XJR8jowjmNE6m4cNau1/Vm5fzxvmLYHsVnvGD8+OO/7QraJC7
	 thnrwdacJKL/kRXO/UdQZDV6gQBN/plzsp2vQmpF48uqwYc0QT+CtBSdR5VsFLI8v+DlH
	 LS2qkPht8W5e2vZnbSdPFbN2nRPu68qds3sqFg+yMTLl01eAlz4tzKyGSj/cMpdJ7bT5y
	 K+YgV8+I+46CWIOGvyJrCvK+1wRbH8GMNC4BGMINL0E7Pah+BmnZbvhH8hrdkzsehT3yd
	 VJi7L1NOh9wKP04FhXJONq437DmlvYfsUHbe2LihNfad2KSbECqUGBfIGCVZad7+CEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350076;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=focRYHe+lLJ7WgjazgIVN+EOiAAyKkLKpH1zWpglXSg=;
	b=ha3bgl6sxVLTgGsI1/CpCoErLjangO/13X+T69t57chRg68KiI8f2qbYTCTaumIQp10c
	 NsMEgu5htDU2CZkueeHn2dla6c2ovV3/6XAo+Ia8MQSkrKvWizpDj+rNXtTEV0cNwHCXD
	 VXdLynzPTdBVulwb0UaKvC7KgnkZPXKcYvBqt58Bo4n2Bd7oFvbvyx7o9sIBH3TYD6Rza
	 l7DBRkiBlbC8AaC63zzvzFYaO+dsa0AJEnvVuHwuMIzz+WyLA41IorSGoyGkJ0fXCD/JZ
	 p5yspjJ64QhXU9uJX0zw4GYHYknBTV8M4jY3faNtowoFHjjgVxe3zvfKNys/9jdQM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="a3g8cK/1";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23ED606A31E;
	Fri, 30 Oct 2026 08:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3g8cK/1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350075; x=1824886075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JfiM+BJFzo6/ofk3Y9BcFh3FD/ABNUljlg2cidkKFDI=;
  b=a3g8cK/15kHodICUHeMW7wI/ZexRX/JOwhDD1T5PwkHnl1psP9dGG1Fq
   5CdgDzx0nyO/fv5aCDwaDQu7RdN4e3Af97kB92in3Jl87hBiydwNdjWK1
   cmDlyHhehPkpVze9jyNzP9ZuViNFloiaRlSpSbced4Zhh3pY3sGTwAUCF
   c7TP9HyJQt1ON1Kbp6756C6YIP599qlrmXLrxH19hlRxA5Go63iOJlwjs
   9cZyXJTeh+nWH9aEOkl0fbzcUPENdJFhLzRzIGTXiUxCZb1i9HehllB2J
   reFtyuHxe2YWtpAc/xEpXN81VFAeNdFUNe4Cy359309zcYDqop5oVwCBJ
   A==;
X-CSE-ConnectionGUID: QZGK6tQyQ0K/0kfPylOnKg==
X-CSE-MsgGUID: Q3PQ8871Rv6HX1TKEIFXug==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2102486"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2102486"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:47:54 -0700
X-CSE-ConnectionGUID: xp/+FRjtRBK1m+vPmx/iGg==
X-CSE-MsgGUID: TfjHYg9uSj2UnXdMgjiUGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5277303"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2026 01:47:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 170A899; Fri, 30 Oct 2026 09:47:50 +0100 (CET)
Date: Fri, 30 Oct 2026 09:47:50 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Message-ID: <20261030084750.GP158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>

Hi,

Adding Konrad and Sven because they are also working towards the same goal
to get non-PCIe "platform" hosts supported.

On Fri, Oct 30, 2026 at 04:25:36PM +0800, Chunfeng Yun wrote:
> Add a new file plat.c to register platform NHI driver for MediaTek
> mt8901/mt8992 SoCs.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/Makefile |   2 +-
>  drivers/thunderbolt/domain.c |  10 ++-
>  drivers/thunderbolt/nhi.c    |   2 +
>  drivers/thunderbolt/nhi.h    |   1 -
>  drivers/thunderbolt/pci.c    |  26 +-----
>  drivers/thunderbolt/plat.c   | 155 +++++++++++++++++++++++++++++++++++

Call it platform.c

>  drivers/thunderbolt/tb.h     |   2 -
>  include/linux/thunderbolt.h  |   1 +
>  8 files changed, 169 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/thunderbolt/plat.c
> 
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index beb054c3126b..9c941682f3d6 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -3,7 +3,7 @@ ccflags-y := -I$(src)
>  obj-${CONFIG_USB4} := thunderbolt.o
>  thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
>  thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
> -thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
> +thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o plat.o
>  
>  thunderbolt-${CONFIG_ACPI} += acpi.o
>  thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 24611f05b3cd..bec7e6ebc4a8 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -881,7 +881,7 @@ int tb_domain_unregister_unplugged_xdomains(struct tb *tb)
>  	return ctx.n;
>  }
>  
> -int tb_domain_init(void)
> +static int __init tb_domain_init(void)
>  {
>  	int ret;
>  
> @@ -907,7 +907,7 @@ int tb_domain_init(void)
>  	return ret;
>  }
>  
> -void tb_domain_exit(void)
> +static void __exit tb_domain_exit(void)
>  {
>  	bus_unregister(&tb_bus_type);
>  	ida_destroy(&tb_domain_ida);
> @@ -917,3 +917,9 @@ void tb_domain_exit(void)
>  	tb_debugfs_exit();
>  	tb_configfs_exit();
>  }
> +
> +subsys_initcall(tb_domain_init);
> +module_exit(tb_domain_exit);
> +
> +MODULE_DESCRIPTION("Thunderbolt/USB4 domain driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index e99a3fcc4a29..c0f9f1855e8f 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1379,8 +1379,10 @@ int nhi_probe(struct tb_nhi *nhi)
>  	device_wakeup_enable(dev);
>  
>  	pm_runtime_allow(dev);
> +	device_enable_async_suspend(dev);

Why you add this?

>  	pm_runtime_set_autosuspend_delay(dev, TB_AUTOSUSPEND_DELAY);
>  	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);

and this

>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 88af9ab9fde7..37c11de167ad 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -29,7 +29,6 @@ enum nhi_mailbox_cmd {
>  
>  int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
>  enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
> -void nhi_enable_int_throttling(struct tb_nhi *nhi);
>  void nhi_disable_interrupts(struct tb_nhi *nhi);
>  void nhi_interrupt_work(struct work_struct *work);
>  irqreturn_t nhi_msi(int irq, void *data);
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 4408229d8ac7..91d236300703 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -715,7 +715,7 @@ static struct pci_device_id nhi_ids[] = {
>  };
>  
>  MODULE_DEVICE_TABLE(pci, nhi_ids);
> -MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
> +MODULE_DESCRIPTION("Thunderbolt/USB4 PCI host interface driver");
>  MODULE_LICENSE("GPL");
>  
>  static struct pci_driver nhi_driver = {
> @@ -727,26 +727,4 @@ static struct pci_driver nhi_driver = {
>  	.driver.pm = &nhi_pm_ops,
>  };
>  
> -static int __init nhi_init(void)
> -{
> -	int ret;
> -
> -	ret = tb_domain_init();
> -	if (ret)
> -		return ret;
> -
> -	ret = pci_register_driver(&nhi_driver);
> -	if (ret)
> -		tb_domain_exit();
> -
> -	return ret;
> -}
> -
> -static void __exit nhi_unload(void)
> -{
> -	pci_unregister_driver(&nhi_driver);
> -	tb_domain_exit();
> -}
> -
> -rootfs_initcall(nhi_init);
> -module_exit(nhi_unload);
> +module_pci_driver(nhi_driver);
> diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
> new file mode 100644
> index 000000000000..85a00cd391d4
> --- /dev/null
> +++ b/drivers/thunderbolt/plat.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Thunderbolt driver - NHI driver (Platform bus specific implementation)
> + *
> + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include "nhi.h"
> +#include "tb.h"
> +
> +static int nhi_plat_init(struct tb_nhi *nhi)

nhi_platform_

> +{
> +	/*
> +	 * avoid device link fail for pcie tunnel
> +	 */

What's this? And the comment style is not the expected.

> +	pm_runtime_set_active(nhi->dev);
> +	pm_runtime_get_noresume(nhi->dev);
> +	devm_pm_runtime_enable(nhi->dev);

This means we never runtime suspend? Then this is not good.

> +
> +	return 0;
> +}
> +
> +static irqreturn_t nhi_plat_isr(int irq, void *data)
> +{
> +	struct tb_nhi *nhi = data;

Did you run checkpatch.pl against this? If not please do.

> +	schedule_work(&nhi->interrupt_work);
> +	return IRQ_HANDLED;
> +}
> +
> +static int nhi_plat_init_irq(struct tb_nhi *nhi)
> +{
> +	int ret;
> +
> +	INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> +
> +	ret = devm_request_irq(nhi->dev, nhi->irq, nhi_plat_isr, IRQF_NO_SUSPEND,
> +			       dev_name(nhi->dev), nhi);
> +	if (ret)
> +		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
> +
> +	return 0;
> +}
> +
> +static void nhi_plat_exit(struct tb_nhi *nhi)
> +{
> +	devm_free_irq(nhi->dev, nhi->irq, nhi);
> +	flush_work(&nhi->interrupt_work);
> +
> +	pm_runtime_put_noidle(nhi->dev);
> +	pm_runtime_disable(nhi->dev);
> +	pm_runtime_set_suspended(nhi->dev);
> +}
> +
> +static const struct tb_nhi_ops nhi_plat_default_ops = {
> +	.init = nhi_plat_init,
> +	.shutdown = nhi_plat_exit,
> +	.init_interrupts = nhi_plat_init_irq,
> +};
> +
> +static int nhi_plat_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb_nhi *nhi;
> +
> +	nhi = devm_kzalloc(dev, sizeof(*nhi), GFP_KERNEL);
> +	if (!nhi)
> +		return -ENOMEM;
> +
> +	nhi->dev = dev;
> +	nhi->ops = &nhi_plat_default_ops;
> +
> +	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nhi->iobase))
> +		return PTR_ERR(nhi->iobase);
> +
> +	nhi->irq = platform_get_irq(pdev, 0);
> +	if (nhi->irq < 0)
> +		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
> +
> +	return nhi_probe(nhi);
> +}
> +
> +static void nhi_plat_do_remove(struct platform_device *pdev, bool reset)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb *tb = platform_get_drvdata(pdev);
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	/*
> +	 * On system shutdown/reboot force a host router reset so the
> +	 * CM asserts DPR on connected tbt3 devices before the router tree
> +	 * is removed (see tb_stop()).
> +	 */
> +	if (reset)
> +		nhi->host_reset = true;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +	tb_domain_remove(tb);
> +	wait_for_completion(&nhi->domain_released);
> +	nhi_shutdown(nhi);
> +}
> +
> +static void nhi_plat_remove(struct platform_device *pdev)
> +{
> +	nhi_plat_do_remove(pdev, false);
> +}
> +
> +static void nhi_plat_shutdown(struct platform_device *pdev)
> +{
> +	nhi_plat_do_remove(pdev, true);
> +}
> +
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id nhi_plat_of_match[] = {
> +	{ .compatible = "thunderbolt-platform" },

Not sure if this is correct? Should this have mediatek,... ?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nhi_plat_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id nhi_plat_acpi_match[] = {
> +	{ "ACPI0015", 0 },

Same here, where is this ID defined in the ACPI spec?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, nhi_plat_acpi_match);
> +#endif
> +
> +static struct platform_driver nhi_plat_driver = {
> +	.probe = nhi_plat_probe,
> +	.remove = nhi_plat_remove,
> +	.shutdown = nhi_plat_shutdown,
> +	.driver = {
> +		.name = "thunderbolt",
> +		.of_match_table = of_match_ptr(nhi_plat_of_match),
> +		.acpi_match_table = ACPI_PTR(nhi_plat_acpi_match),
> +		.pm = &nhi_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(nhi_plat_driver);
> +MODULE_ALIAS("platform:thunderbolt");
> +MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index e86845762e22..6dfdc47e05d2 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -768,8 +768,6 @@ extern const struct device_type tb_retimer_type;
>  extern const struct device_type tb_switch_type;
>  extern const struct device_type usb4_port_device_type;
>  
> -int tb_domain_init(void);
> -void tb_domain_exit(void);
>  int tb_xdomain_init(void);
>  void tb_xdomain_exit(void);
>  
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 57502da29080..212c8fea6571 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -532,6 +532,7 @@ struct tb_nhi {
>  	u32 *interrupt_mask;
>  	bool going_away;
>  	bool iommu_dma_protection;
> +	int irq;

You are missing kernel-doc.

>  	struct work_struct interrupt_work;
>  	u32 hop_count;
>  	unsigned long quirks;
> -- 
> 2.43.0
