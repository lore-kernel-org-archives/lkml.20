Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97F46E000;
	Wed, 16 Sep 2026 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545595; cv=none; b=n5WwDDe0wFcjqkmfs6JPWGNmdZ5s8Lv2V0b1QCZZMwnVTFGb8T+BxxTvXHnvrbwv7+QRxahuk+hSr/yd55JTTDXKrr8TGJPTo74WjE4jkTOc1G53Ndhz0lQE0CWNGbK44YUrGPnSxEx4nVcmfzQxwKoEWOhnSbh2pvdkrMTrBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545595; c=relaxed/simple;
	bh=b4CqmzvQVSWRsMYDiuzp2BVcXBYrPbrqgrL7jKTp+C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYLNTK+fgvmIuWUlExU+CaNUQ7wUC7TbRtZLdJXSoD+TKRVnVGuGL1Jn4xjSwT/iGH42SaDpn/mDOmSK/ht5gJl10nCTmyaDJjlBPTdFbMsFRosvYh2qsiWtNKaZiplhHLNUFZFsL8D8OB6ObDO0swA6lCxwDHliRxRpX67DcN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=db80HVJD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db80HVJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789545573; x=1821081573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b4CqmzvQVSWRsMYDiuzp2BVcXBYrPbrqgrL7jKTp+C0=;
  b=db80HVJDgOXSTDglzLs5ZDPmBx5aXT7rfPxyMCTtVqMVpHRbhEVPZB4w
   C3nHgiI4YQ9Ia70jKG9XnyCP+/WEvHdyFGhhQ+6jzTs73OSHawjjYSc3r
   lIuJG6pvNlpGxV+VGMd/a+IF5AQ8S0L5nCDk4g0qbTuoHJDFvZN4WRkca
   iTMUDdp+3c5mnRvLJ86sYiokHpveBpSUX7WHLxpPpeaTPzz+SUBOcviuM
   zY8fn5cMX3DKLdBpHKO7Uoh3FYjKQIwEDTaHf07+PoE11tsfU8GbPVphk
   d8ogu5twVDYdubUVa9UVBq1W2O6j1q6L5xCRcc+uLa6On4b93aTK3QSk7
   Q==;
X-CSE-ConnectionGUID: qFCb0fWARFayeqPswppXQg==
X-CSE-MsgGUID: hca7KLx+S9qcd9dhfvtqOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90050962"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90050962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:59:27 -0700
X-CSE-ConnectionGUID: SHkrBPlPTSqxkBqYym0tFw==
X-CSE-MsgGUID: io/nI3CpSQKChBsvvbXWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271812541"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2026 00:59:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 84FC499; Wed, 16 Sep 2026 09:59:24 +0200 (CEST)
Date: Wed, 16 Sep 2026 09:59:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] thunderbolt: Make PCIe NHI support opt-in
Message-ID: <20260916075924.GO106095@black.igk.intel.com>
References: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>

Hi,

On Tue, Sep 15, 2026 at 07:04:10PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> With more implementations coming in, one may desire not to enable
> support for the PCIe-attached NHIs. Allow it to be built as a module
> atop the framework.

Is it so that Qualcomm platform does not support PCIe tunneling at all
then?

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> The diff came out a little messy.. compile-tested with CONFIG_PCI=n and
> tested USB4_PCIE=m/=y on a NUC with an Alpine Ridge controller
> ---
>  drivers/thunderbolt/Kconfig   | 11 ++++++++++-
>  drivers/thunderbolt/Makefile  |  7 +++++--
>  drivers/thunderbolt/ctl.c     |  6 +++++-
>  drivers/thunderbolt/domain.c  | 14 ++++++++++++--
>  drivers/thunderbolt/nhi.c     | 18 +++++++++++-------
>  drivers/thunderbolt/nhi.h     |  2 ++
>  drivers/thunderbolt/pci.c     | 39 ++++++++++++++-------------------------
>  drivers/thunderbolt/switch.c  |  9 +++++++++
>  drivers/thunderbolt/tb.h      |  2 --
>  drivers/thunderbolt/tunnel.c  |  1 +
>  drivers/thunderbolt/xdomain.c |  5 +++++
>  11 files changed, 74 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
> index 294b3227a545..81fca3bfcdd7 100644
> --- a/drivers/thunderbolt/Kconfig
> +++ b/drivers/thunderbolt/Kconfig
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig USB4
>  	tristate "Unified support for USB4 and Thunderbolt"
> -	depends on PCI
>  	select APPLE_PROPERTIES if EFI_STUB && X86
>  	select CRC32
>  	select CRYPTO_LIB_SHA256
> @@ -18,6 +17,16 @@ menuconfig USB4
>  
>  if USB4
>  
> +config USB4_PCIE
> +	depends on PCI
> +	tristate "Support for PCIe-attached USB4 and Thunderbolt controllers"

I think USB4_PCI and so on.

> +	help
> +	  Say Y here to add support for the USB4 and Thunderbolt host
> +	  routers attached over the PCIe bus, commonly found on x86 PCs.
> +
> +	  To compile this driver a module, choose M here. The module will be
> +	  called thunderbolt_pcie.

thunderbolt_pci

> +
>  config USB4_CONFIGFS
>  	def_tristate USB4
>  	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index beb054c3126b..fc808c6b23e6 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -1,10 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  ccflags-y := -I$(src)
>  obj-${CONFIG_USB4} := thunderbolt.o
> -thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
> -thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
> +thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
> +thunderbolt-objs += domain.o dma_port.o property.o xdomain.o lc.o tmu.o usb4.o
>  thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
>  
> +obj-${CONFIG_USB4_PCIE} += thunderbolt_pcie.o
> +thunderbolt_pcie-y := pci.o icm.o
> +
>  thunderbolt-${CONFIG_ACPI} += acpi.o
>  thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
>  thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index 965988b18608..96717a0a94b1 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -9,7 +9,6 @@
>  #include <linux/crc32.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/pci.h>
>  #include <linux/dmapool.h>
>  #include <linux/workqueue.h>
>  
> @@ -96,6 +95,7 @@ struct tb_cfg_request *tb_cfg_request_alloc(void)
>  
>  	return req;
>  }
> +EXPORT_SYMBOL_GPL(tb_cfg_request_alloc);
>  
>  /**
>   * tb_cfg_request_get() - Increase refcount of a request
> @@ -128,6 +128,7 @@ void tb_cfg_request_put(struct tb_cfg_request *req)
>  	kref_put(&req->kref, tb_cfg_request_destroy);
>  	mutex_unlock(&tb_cfg_request_lock);
>  }
> +EXPORT_SYMBOL_GPL(tb_cfg_request_put);
>  
>  static int tb_cfg_request_enqueue(struct tb_ctl *ctl,
>  				  struct tb_cfg_request *req)
> @@ -575,6 +576,7 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
>  	tb_cfg_request_dequeue(req);
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(tb_cfg_request);
>  
>  /**
>   * tb_cfg_request_cancel() - Cancel a control request
> @@ -634,6 +636,7 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
>  
>  	return req->result;
>  }
> +EXPORT_SYMBOL_GPL(tb_cfg_request_sync);
>  
>  /* public interface, alloc/start/stop/free */
>  
> @@ -1009,6 +1012,7 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
>  		memcpy(buffer, &reply.data, 4 * length);
>  	return res;
>  }
> +EXPORT_SYMBOL_GPL(tb_cfg_read_raw);
>  
>  /**
>   * tb_cfg_write_raw() - write from buffer into config space
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 12c88509a54f..1c76fd8151ca 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -313,6 +313,7 @@ const struct bus_type tb_bus_type = {
>  	.remove = tb_service_remove,
>  	.shutdown = tb_service_shutdown,
>  };
> +EXPORT_SYMBOL_GPL(tb_bus_type);
>  
>  static void tb_domain_release(struct device *dev)
>  {
> @@ -421,6 +422,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
>  
>  	return NULL;
>  }
> +EXPORT_SYMBOL_GPL(tb_domain_alloc);
>  
>  /**
>   * tb_domain_add() - Add domain to the system
> @@ -514,6 +516,7 @@ void tb_domain_remove(struct tb *tb)
>  
>  	device_unregister(&tb->dev);
>  }
> +EXPORT_SYMBOL_GPL(tb_domain_remove);
>  
>  /**
>   * tb_domain_suspend_noirq() - Suspend a domain
> @@ -904,8 +907,9 @@ int tb_domain_unregister_unplugged_xdomains(struct tb *tb)
>  
>  	return ctx.n;
>  }
> +EXPORT_SYMBOL_GPL(tb_domain_unregister_unplugged_xdomains);
>  
> -int tb_domain_init(void)
> +static int __init tb_domain_init(void)
>  {
>  	int ret;
>  
> @@ -931,7 +935,7 @@ int tb_domain_init(void)
>  	return ret;
>  }
>  
> -void tb_domain_exit(void)
> +static void __exit tb_domain_exit(void)
>  {
>  	bus_unregister(&tb_bus_type);
>  	ida_destroy(&tb_domain_ida);
> @@ -941,3 +945,9 @@ void tb_domain_exit(void)
>  	tb_debugfs_exit();
>  	tb_configfs_exit();
>  }
> +
> +postcore_initcall(tb_domain_init);
> +module_exit(tb_domain_exit);
> +
> +MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 020db5a1f029..9b1165b2a484 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -548,6 +548,7 @@ irqreturn_t ring_msix(int irq, void *data)
>  
>  	return IRQ_HANDLED;
>  }
> +EXPORT_SYMBOL_GPL(ring_msix);

We need to think what is going to be exported and how. For example here
ring_msix is pretty common name so if nothing else it needs to be properly
namespaced and that should be the first patch in the series.

Secondly I think it would be good to have this whole thing as part of a
patch series that adds the Qualcomm controller support so we have an
explanation there why we are doing all this.

>  
>  static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>  {
> @@ -1001,6 +1002,7 @@ int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(nhi_mailbox_cmd);
>  
>  /**
>   * nhi_mailbox_mode() - Return current firmware operation mode
> @@ -1021,6 +1023,7 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
>  
>  	return (enum nhi_fw_mode)val;
>  }
> +EXPORT_SYMBOL_GPL(nhi_mailbox_mode);

We really need to think what should be exported and what not. This for
example I think we can move inside pci.c because there is really no user
outside of Intel PCIe based systems for these.

Ideally export the minimal.
