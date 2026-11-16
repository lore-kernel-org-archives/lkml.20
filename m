Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853630;
	b=fb6cg8QIjuNRNYEwRIjOT3YXEqGTHZnb+sm5nrjXYXmzTPPWO6UOSES7p66EbuHFZ6oa
	 nkf+oRgSrY/6PzVw9YqiFpc0lAWc5UZmKCj4IlbC0xMNF4VV47CvcNVpboMnoMerr2Rlr
	 /gtp/Um/N7RVcCB/K8psgQPGviwwUeQtXDsy+jVP39XYfTD9IAio3oqYh5mnXC1OIoBvc
	 5MNS47xMImZKiEmoPwZLSG/nFzbInGT0qpdscx72Dr5mnBMiBSQa+cGMSHsXFXLojmV0Y
	 5QFD5PjhTTnZ/r3k+eyfYaKLTyXniY/yyyXyNjrOAKlB+sP9CdtT6uxYktgbiLsKFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i0+NdK/YeASsZuhz7coPXNHnm1YViQRZlPGWrC7m3dY=;
	b=LcUgrd0mXtjQ1R01SlyjpHfD8hHk1unfN1L12dKFa9t5s+xfOMcMh4fCyzTtSsamSpu/
	 vHqMDOfVp5Hjb22tVHtuUdI5nCSxR4NoszE9dKPiIUdgqNAfWXK9L0dEWA5r5FQ9JXFQv
	 stRoCxlphkIQ3CEvYDNua1JkP+xB7sMV8ilsWu1csKlcUlDkaKk5xfO89DYGpQNrJRMjE
	 B0AqRRCw1V8+1vpMnmn22UdryrJ4k3dpbHIl8/y0KTmQ4oRvGy9ozp1E0wTAt2ED3TCik
	 e+jYTOMDXXqu3hta3FA2AWXgqUBuUoOMvrFLMKJndkRfJBnmfo8HKw8XOCeMx5gzwQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qr4RejGE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC85606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC85606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qr4RejGE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso2035e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853628; x=1795458428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0+NdK/YeASsZuhz7coPXNHnm1YViQRZlPGWrC7m3dY=;
        b=Qr4RejGEWeUwI0wtVtMolfzVWYPmWIxJfwOGpJssQTLxQ3Mj/VhD1UlHy6KuHOqqSL
         FAhSyKSey47XQIUuhSJXQbSTECFAINqlpr7/7qz5DW+httFcF+CMGLNOtgzd54S2NPZD
         gaYYo7UV+pUGwsrSh92T+ex26qSG4aSqT7wc7dx/KPUlexjlDCGlXRITajRZHc5SQ75y
         Im8W3+17t5eoEn6NCo6Tn1skt3YZ06Y4WqUafzX4HamVJrzpOfAS4DHGVUYPM58W268f
         kZp1ypdqLR5WfqzYfbKZH5hfqAhrIim+UYp5zeRV7adDftPXx1l5DEcincnjDx9eAFsr
         AGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853628; x=1795458428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0+NdK/YeASsZuhz7coPXNHnm1YViQRZlPGWrC7m3dY=;
        b=CIbKdlcID6q1E7jmOeBzGa9WMMycCMkPnW1OpvfanrGv+VSJafAyiOPtcMROEP2kHg
         tvNm8ymwMegqBqI0N7vbwQrGp/A/KXCE8GptRAdJdF0BhSbMpV5Rd+lIoMVLUYk2Adgh
         8CZ3okVV0aSshRgf76zfP7V6Ra/1EODJMvuIm2k+f19eBz4NBSI/WWeOzJpLAeHsafa5
         i3EVuLczMyOq6l7JGnjIqgmHX/gzYh/Ie63KqS80lJSlzhOV1WU4lw0FlXirUl50xO+X
         un0p0xpUZUH81G8VAPhQWdCkfQzR5h85PutwKTza9LoDPXXMmgtw0RC43h0j9RZjREBc
         pzOw==
X-Forwarded-Encrypted: i=1; AL+hErHlOez0NBTPJ19MQ5cNBE2v2T/KuKqcbzWcbkW1ys0XiHJiyTeZqoV8SMpWZ1fXeFjHW6t+h1B2Ii/IyNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h0TGSPEewH+wOosQJvwja0kUf5U3M9X0hNvJSQ/Lm7ntvgCoh
	kTa+jdhrZi63l9fU4lPSeV7BCeGkcogwaovmjEiAy49LmshpyoV6tdpuKCHZkrJKiw==
X-Gm-Gg: AYBFou1Nfc6577TUcx4lucXzQjf4WPvBCTckgwsMmH67a28yk0vEmdvfUfKX9mH2h7c
	qnxe2vaV9GR2Z2INe2wxNG4rSa+LIeGVXCiAuMn4eKu2PZCtQlPwStmvYbgFe9Au9jNOCecWRcu
	8/pWVS8j/NQeWyVfB1ZJlvkrtcqRVMqlovbuKzViqq1Uh2iT+v509jeotGbK5DYZIEuY/kOVxAX
	nhNDNJnKDqbW0ych9XwdbkVMr5oV0cJiGTLVNUiz1/JES76Pqn+m8nWcLq3acvsjK5o9NSe5HUi
	WZ1yD72D51P/zNJuYiDNughqUuUBl2umn7eaAOJZdN70tc7Kv0eZxYGdwAoeWySMTtgxnrZTkB3
	OrtZyTChVCUJA1zZJNfQ8gwppgd0M7ZCrJimjczjcu0cuUu5sOeRBDV/mnA5Q+9Hi4MtSX0uZlJ
	8r3I0E8IM39bMeRkvmoF7Iht+WyOc74CK5/ATK0JDgtGOqJkuSR4gZMn9h9IHHDMYiPPb9Ti1xn
	x6VRwUNlJBH9lXg2Y205drKV3qP64Rq8Pw+4H55wbg6Q3LkOEaWOJZWtXIgw7N9Lskpy0fyPNss
	DYaTPmuqrhVv9q1ocv30c4nEMcpBR7Tmv0iI5XorWKjGLrh5WmvoriyDmX2UszUB9c6JJwBKxp2
	FwmV7SVNYrkx68MMS
X-Received: by 2002:a05:600c:491c:b0:4a1:d2f2:9fbd with SMTP id 5b1f17b1804b1-4bb7894d9bfmr42925e9.0.1794853627708;
        Mon, 16 Nov 2026 10:27:07 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1968sm24006935f8f.10.2026.11.16.10.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:27:06 -0800 (PST)
Date: Mon, 16 Nov 2026 18:27:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Daniel Mentz <danielmentz@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line
 parameter
Message-ID: <avtK9qMAjIIwD84k@google.com>
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>

On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:
> Currently, the generic IOMMU core only provides an all-or-nothing global
> switch ('iommu.passthrough={0,1}' and CONFIG_IOMMU_DEFAULT_PASSTHROUGH)
> to configure default DMA domains in passthrough (IOMMU_DOMAIN_IDENTITY)
> mode at boot time.
> 
> Add an 'iommu.passthrough_devs=<dev_name>[,<dev_name>...]' early
> command-line parameter. When allocating the default domain for a group in
> iommu_group_alloc_default_domain(), if no mandatory domain type override
> is present, check whether any device in the group (or any of its
> parent/bridge devices via dev->parent) matches 'iommu.passthrough_devs'
> and request IOMMU_DOMAIN_IDENTITY, warning and falling back to
> IOMMU_DOMAIN_DMA if identity domains are unsupported (consistent with
> 'iommu.passthrough=1').
> 
> Device names match dev_name(), such as PCI BDFs ('0000:01:00.0'),

I believe BDFs are not reliable as they can change based on how Linux
enumerates the bus and hotplug.
Probably we'd need something as pci_dev_str_match() which is used
in other cmdline options.

Thanks,
Mostafa

> Device Tree platform devices ('3c400000.ufs'), or ACPI platform
> devices ('AMDI0010:00'). Walking dev->parent also allows specifying a
> parent PCIe host controller or root port (e.g. '3c500000.pcie' or
> '0000:00:1c.0') to cover its downstream endpoints.
> 
> Note: Untrusted PCI devices ('pdev->untrusted') and explicit IOMMU
> driver '.def_domain_type' requirements continue to take precedence.
> 
> Configuring per-device passthrough mode at boot is needed for several
> use cases:
> 
> - Performance tuning and benchmarking: high-throughput storage
>   workloads (e.g. fio benchmarks on UFS) can incur measurable
>   IOPS/latency and CPU overhead from IOMMU page table management and
>   TLB invalidations. Selective device passthrough allows bypassing
>   translation for these devices while keeping IOMMU isolation enabled
>   for other devices in the system.
> 
> - SoC/board bringup and debugging: isolating whether a DMA fault or
>   regression is caused by a specific device's IOMMU translation without
>   disabling the IOMMU globally across the entire platform.
> 
> Implementing this in the generic IOMMU core allows it to work with
> ACPI and Device Tree (DT) systems as well as across all IOMMU drivers.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Hi folks,
> 
> This patch follows up on a conversation with Jason Gunthorpe at
> Linux Plumbers regarding how to upstream support for configuring
> per-device IOMMU passthrough (IOMMU_DOMAIN_IDENTITY) at boot without
> abusing Device Tree properties.
> 
> Downstream on Google Pixel G5 Laguna platforms, we have historically
> carried a custom 'iommu-idmapped' DT property parsed by the arm-smmu-v3
> driver to place specific client devices into bypass mode. As discussed
> at Plumbers, Device Tree seems the wrong place for this because choosing
> passthrough vs. translation for a given device can sometimes be an OS
> policy trade-off where we choose device peak performance at the expense
> of DMA isolation. This is the case for UFS and PCIe WLAN on Laguna,
> which share a common SMMU instance with other peripherals (such as DMA
> controllers, VPU, and ISP) where we want DMA isolation to remain
> enabled.
> 
> A secondary benefit is it could be useful during device bringup and
> debugging for fault isolation and to work around firmware/device issues
> before a proper driver quirk is in place.
> 
> Instead, I propose handling this in the generic IOMMU core via a
> kernel command-line parameter. This makes it available uniformly
> across both Device Tree and ACPI systems and across all IOMMU drivers.
> 
> In terms of upstream Laguna support, initial DT support has already
> landed in tree, along with USB and phy support. Other support for
> mailbox, clocks, powerdomains, reset is under review in the following
> series with more to follow.
> 
> https://lore.kernel.org/lkml/20261023235408.3063350-1-dianders@chromium.org/
> https://lore.kernel.org/lkml/20261026214359.3122870-1-briannorris@chromium.org/
> 
> Feedback and suggestions are very welcome.
> 
> Thanks,
> 
> Peter
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 11 ++++
>  drivers/iommu/iommu.c                           | 76 +++++++++++++++++++++++--
>  2 files changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index c343bc9a0d28..926380cb1e99 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2689,6 +2689,17 @@ Kernel parameters
>  			1 - Bypass the IOMMU for DMA.
>  			unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
>  
> +	iommu.passthrough_devs=
> +			[KNL,EARLY] Configure DMA to bypass the IOMMU by default
> +			for specific devices.
> +			Format: <dev_name>[,<dev_name>...]
> +			Specify a comma-separated list of device names (matching
> +			dev_name() of the client device or any of its parent/bridge
> +			devices) whose IOMMU groups should default to passthrough
> +			(identity) mode (e.g. "0000:01:00.0" for PCI,
> +			"3c400000.ufs" for Device Tree, or
> +			"AMDI0010:00" for ACPI).
> +
>  	iommu.debug_pagealloc=
>  			[KNL,EARLY] When CONFIG_IOMMU_DEBUG_PAGEALLOC is set, this
>  			parameter enables the feature at boot time. By default, it
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index b486b8bbd1fc..0a7796e0311e 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -33,6 +33,7 @@
>  #include <trace/events/iommu.h>
>  #include <linux/sched/mm.h>
>  #include <linux/msi.h>
> +#include <linux/string.h>
>  #include <uapi/linux/iommufd.h>
>  #include <linux/generic_pt/iommu.h>
>  
> @@ -43,9 +44,12 @@ static struct kset *iommu_group_kset;
>  static DEFINE_IDA(iommu_group_ida);
>  static DEFINE_IDA(iommu_global_pasid_ida);
>  
> +#define IOMMU_PASSTHROUGH_DEVS_MAX_LEN	256
> +
>  static unsigned int iommu_def_domain_type __read_mostly;
>  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
>  static u32 iommu_cmd_line __read_mostly;
> +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;
>  
>  /* Tags used with xa_tag_pointer() in group->pasid_array */
>  enum { IOMMU_PASID_ARRAY_DOMAIN = 0, IOMMU_PASID_ARRAY_HANDLE = 1 };
> @@ -805,6 +809,27 @@ static int __init iommu_set_def_domain_type(char *str)
>  }
>  early_param("iommu.passthrough", iommu_set_def_domain_type);
>  
> +static int __init iommu_set_passthrough_devs(char *str)
> +{
> +	size_t len;
> +
> +	if (!str || !*str)
> +		return -EINVAL;
> +
> +	len = strlen(iommu_passthrough_devs);
> +	if (len + (len ? 1 : 0) + strlen(str) >= IOMMU_PASSTHROUGH_DEVS_MAX_LEN) {
> +		pr_warn("Too long list of device names for 'iommu.passthrough_devs'!\n");
> +		return -EINVAL;
> +	}
> +	if (len)
> +		iommu_passthrough_devs[len++] = ',';
> +
> +	strscpy(iommu_passthrough_devs + len, str,
> +		IOMMU_PASSTHROUGH_DEVS_MAX_LEN - len);
> +	return 0;
> +}
> +early_param("iommu.passthrough_devs", iommu_set_passthrough_devs);
> +
>  static int __init iommu_dma_setup(char *str)
>  {
>  	int ret = kstrtobool(str, &iommu_dma_strict);
> @@ -1750,14 +1775,45 @@ __iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>  	return ERR_PTR(-EINVAL);
>  }
>  
> +static bool iommu_is_passthrough_dev(struct device *dev)
> +{
> +	for (; dev; dev = dev->parent) {
> +		const char *name = dev_name(dev);
> +
> +		if (name && *name &&
> +		    parse_option_str(iommu_passthrough_devs, name))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static struct device *iommu_group_passthrough_dev(struct iommu_group *group)
> +{
> +	struct group_device *gdev;
> +
> +	if (!iommu_passthrough_devs[0])
> +		return NULL;
> +
> +	for_each_group_device(group, gdev) {
> +		if (iommu_is_passthrough_dev(gdev->dev))
> +			return gdev->dev;
> +	}
> +
> +	return NULL;
> +}
> +
>  /*
>   * req_type of 0 means "auto" which means to select a domain based on
> - * iommu_def_domain_type or what the driver actually supports.
> + * iommu.passthrough_devs, iommu_def_domain_type, or what the driver
> + * actually supports.
>   */
>  static struct iommu_domain *
>  iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>  {
>  	const struct iommu_ops *ops = dev_iommu_ops(iommu_group_first_dev(group));
> +	unsigned int def_type = iommu_def_domain_type;
> +	struct device *pt_dev = NULL;
>  	struct iommu_domain *dom;
>  
>  	lockdep_assert_held(&group->mutex);
> @@ -1777,19 +1833,29 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>  		return __iommu_group_alloc_default_domain(group, req_type);
>  
>  	/* The driver gave no guidance on what type to use, try the default */
> -	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
> -	if (!IS_ERR(dom))
> +	if (def_type != IOMMU_DOMAIN_IDENTITY) {
> +		pt_dev = iommu_group_passthrough_dev(group);
> +		if (pt_dev)
> +			def_type = IOMMU_DOMAIN_IDENTITY;
> +	}
> +
> +	dom = __iommu_group_alloc_default_domain(group, def_type);
> +	if (!IS_ERR(dom)) {
> +		if (pt_dev && dom != group->default_domain)
> +			dev_info(pt_dev,
> +				 "Setting default IOMMU domain to passthrough via command line\n");
>  		return dom;
> +	}
>  
>  	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
> -	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
> +	if (def_type == IOMMU_DOMAIN_DMA)
>  		return ERR_PTR(-EINVAL);
>  	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
>  	if (IS_ERR(dom))
>  		return dom;
>  
>  	pr_warn("Failed to allocate default IOMMU domain of type %u for group %s - Falling back to IOMMU_DOMAIN_DMA",
> -		iommu_def_domain_type, group->name);
> +		def_type, group->name);
>  	return dom;
>  }
>  
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261106-b4-iommu-passthrough-devs-03b7c957ac69
> 
> Best regards,
> -- 
> Peter Griffin <peter.griffin@linaro.org>
> 
