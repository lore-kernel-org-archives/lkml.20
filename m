Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9F9542ECE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920956; cv=none; b=MQSbAP7ldCm3hqY+zgtQU1it+BrFYMdxjvkACq5sqAJ6uQTUDRuf5OzEknN6h0GUZ5zgca9+O1s2HLNkY/98qB1nguZQmudVzqeuCIvHPntp6Uz0/atOamc5ZnfK0Sl1UCZMUgKx7GYMcozy8ThJi6a5Ys2ReuAKXuJQY9fz+/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920956; c=relaxed/simple;
	bh=OYdbEexPKQP558RqTakI7yACMXW1nvshSk1ec/NyyB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OPoA6KfCThJaU7Xn/l7s21fses+CIY0V/m2INxeUcot05Aj4BjeraFkhnYCUq3h5sUE+mr+l2IZibpvFLuN+rlInkpI4OjFcerbPyMWm15TETZ9WgpdGEIa5CZnPdseIbgYAJGOR2fbGt0f3HxHQ4b15V5YlJtQefNVYJAAGJuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO1Ms9Yr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO1Ms9Yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791920953; x=1823456953;
  h=date:from:to:cc:subject:message-id;
  bh=OYdbEexPKQP558RqTakI7yACMXW1nvshSk1ec/NyyB0=;
  b=DO1Ms9YretUoigWTD4TWfYW5aQpysWm9H1Hn2Ex7PZRK5OxwfWbtrsrE
   PdwuiGJoZXbMJJdAVT1aEjQ/UIt4HAzuDZ+4YD7OfXQZFo3uUsF+a9kJp
   S4YNanP2H1c7922D1XE9PzKD6NE/c/ruh1RQnh532cryuq11ZccVlqUH8
   /bomo91tG9uz0hzpW1DNpKoV7+FE0FesTs0yTp64lkcBMoMJIZUe3mULE
   mT0T63euGYCk4i6HbMJ4+UGGtiQdB0ZqOATQbwsG5iRDyyky+i6diyPDJ
   3DxH5kWukv2nvQsoZ9lF5KPEtivDR4I5QRuHlJxsKIkAWQs1Lod7msrxl
   w==;
X-CSE-ConnectionGUID: Gp0UjlXXRa2rqVIp+lwMXQ==
X-CSE-MsgGUID: oZj96rrqShOdZi8lubSGLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="754366"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="754366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:49:13 -0700
X-CSE-ConnectionGUID: nr67X3QJTGiZEsJ8rOBUMQ==
X-CSE-MsgGUID: QHXr6O4PSv20n1YHNoQnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1338325"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 12:49:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGiUn-00000000AdH-09JK;
	Tue, 13 Oct 2026 19:49:09 +0000
Date: Tue, 13 Oct 2026 21:48:59 +0200
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: drivers/irqchip/qcom-pdc.c:719: undefined reference to
 `qcom_scm_is_available'
Message-ID: <202610132148.dsoLTiBa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
commit: ad01c2b2f29163ca0bbe1fd4f9343fbc5119c239 irqchip/qcom-pdc: Configure PDC to pass through mode
date:   3 months ago
config: arm64-randconfig-r2200-20261013 (https://download.01.org/0day-ci/archive/20261013/202610132148.dsoLTiBa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610132148.dsoLTiBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610132148.dsoLTiBa-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
>> drivers/irqchip/qcom-pdc.c:719: undefined reference to `qcom_scm_is_available'
>> aarch64-linux-ld: drivers/irqchip/qcom-pdc.c:722: undefined reference to `qcom_scm_io_writel'


vim +719 drivers/irqchip/qcom-pdc.c

   654	
   655	static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *parent)
   656	{
   657		struct irq_domain *parent_domain, *pdc_domain;
   658		struct device_node *node = pdev->dev.of_node;
   659		struct device *dev = &pdev->dev;
   660		resource_size_t res_size;
   661		struct resource res;
   662		u32 irq_param;
   663		int ret;
   664	
   665		/* compat with old sm8150 DT which had very small region for PDC */
   666		if (of_address_to_resource(node, 0, &res))
   667			return -EINVAL;
   668	
   669		res_size = max_t(resource_size_t, resource_size(&res), PDC_DRV_SIZE);
   670		if (res_size > resource_size(&res))
   671			pr_warn("%pOF: invalid reg size, please fix DT\n", node);
   672	
   673		pdc = devm_kzalloc(dev, sizeof(*pdc), GFP_KERNEL);
   674		if (!pdc)
   675			return -ENOMEM;
   676	
   677		pdc->base = devm_ioremap(dev, res.start, res_size);
   678		if (!pdc->base) {
   679			pr_err("%pOF: unable to map PDC registers\n", node);
   680			return -ENXIO;
   681		}
   682	
   683		pdc->version = pdc_reg_read(PDC_VERSION_REG, 0);
   684	
   685		if (pdc->version >= PDC_VERSION_3_2) {
   686			pdc->cfg_fields = &pdc_cfg_v3_2;
   687			pdc->regs = &pdc_v3_2;
   688			pdc->enable_intr = pdc_enable_intr_cfg;
   689		} else if (pdc->version >= PDC_VERSION_3_0) {
   690			pdc->cfg_fields = &pdc_cfg_v3_0;
   691			pdc->regs = &pdc_v3_0;
   692			pdc->enable_intr = pdc_enable_intr_bank;
   693		} else {
   694			pdc->cfg_fields = &pdc_cfg_v2_7;
   695			pdc->regs = &pdc_v2_7;
   696			pdc->enable_intr = pdc_enable_intr_bank;
   697		}
   698	
   699		pdc->mode = PDC_PASS_THROUGH_MODE;
   700	
   701		/*
   702		 * PDC has multiple DRV regions, each one provides the same set of
   703		 * registers for a particular client in the system. Due to a hardware
   704		 * bug on X1E, some writes to the IRQ_ENABLE_BANK register must be
   705		 * issued inside the previous region. This region belongs to
   706		 * a different client and is not described in the device tree. Map the
   707		 * region with the expected offset to preserve support for old DTs.
   708		 */
   709		if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
   710			pdc->prev_base = devm_ioremap(dev, res.start - PDC_DRV_SIZE,
   711						      pdc->regs->irq_en_reg + IRQ_ENABLE_BANK_MAX);
   712			if (!pdc->prev_base) {
   713				pr_err("%pOF: unable to map previous PDC DRV region\n", node);
   714				return -ENXIO;
   715			}
   716	
   717			pdc->x1e_quirk = true;
   718	
 > 719			if (!qcom_scm_is_available())
   720				return -EPROBE_DEFER;
   721	
 > 722			ret = qcom_scm_io_writel(PDC_GPIO_INT_CTL_ENABLE, PDC_PASS_THROUGH_MODE);
   723			if (ret) {
   724				pdc->mode = PDC_SECONDARY_MODE;
   725				pdc->unmask_gpio = pdc_unmask_gpio_cfg;
   726				pdc->clear_gpio = pdc_clear_gpio_cfg;
   727			}
   728		}
   729	
   730		irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
   731		pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
   732	
   733		parent_domain = irq_find_host(parent);
   734		if (!parent_domain) {
   735			pr_err("%pOF: unable to find PDC's parent domain\n", node);
   736			return -ENXIO;
   737		}
   738	
   739		raw_spin_lock_init(&pdc->lock);
   740	
   741		ret = pdc_setup_pin_mapping(dev);
   742		if (ret) {
   743			pr_err("%pOF: failed to init PDC pin-hwirq mapping\n", node);
   744			return ret;
   745		}
   746	
   747		pdc_domain = irq_domain_create_hierarchy(parent_domain, IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
   748							 PDC_MAX_IRQS, of_fwnode_handle(node),
   749							 &qcom_pdc_ops, NULL);
   750		if (!pdc_domain) {
   751			pr_err("%pOF: PDC domain add failed\n", node);
   752			return -ENOMEM;
   753		}
   754	
   755		irq_domain_update_bus_token(pdc_domain, DOMAIN_BUS_WAKEUP);
   756	
   757		return 0;
   758	}
   759	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
