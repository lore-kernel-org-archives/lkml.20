Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F649CF36
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303195; cv=none; b=bxzEEu7OvC5KvudewRus+5UkNBjlg3rfXMxW+ZLnwzONP/+EGEKbkO0Mp2rU9z4Cr05CJLSHRUeeC7Vo9v/He5vDTurQAL7Zo4tvyHtw9LtfOsuRbaA7XJt+y2PBmzv5eQf3559E2UB5eCh6On2DAvEVaHqN+QBLbLyOtXEyEKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303195; c=relaxed/simple;
	bh=jx6nLeQVSmPOPzJY1Yy2Eu9eaUPIEu2vKLVp+Aq7yHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fg3ncF6B8Pl9wf7g+e9iJVQ45tGgPs3Im60cBG0IYgZCI9rbBNqwpTCNzP9MZcEemXP9EPkXb16Lsl7+/F/ljR1HaByvQf+b6RgNJbZ4mKzcN1gSRL1RnzmUiVvKjNEJvFmJqAg9OEU6qVNKNuJ6Gcu9EtvHVxltyCZsiB2bAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4s9lqzM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4s9lqzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791303193; x=1822839193;
  h=date:from:to:cc:subject:message-id;
  bh=jx6nLeQVSmPOPzJY1Yy2Eu9eaUPIEu2vKLVp+Aq7yHE=;
  b=O4s9lqzM8HLkgZY7QLqgkNx11xskj7apm2ZyAnpoiMXDeeVKAMS+FX1f
   obHRdDKRBFr3x1EHZNro5JbO56Ux48Gh6MezECJSXW2TfY6S0u+2437a1
   4qKso0C9H2q33gXIbafkyjn+9y8qbpv9JmSgNHrh7wINOyqSwV9G1B5HA
   ZlSuU2D162UGRgJJVS289mCrWqfBc7WCR/UWAVNpFXDi7ROwFJCda1mD/
   gocYN3joRYhUqURHbSAbtYEG14SoJ4tk+ZhT0VD4eAG/crkFrgKZUlIOP
   gMNDl0wWQTz1BYr2EwDKr1iHi7XFtgcMm092GBWd95kJEZ+LhKWIiy1nS
   A==;
X-CSE-ConnectionGUID: qpk0Sp9YSr2mKEbwIRTX/Q==
X-CSE-MsgGUID: P6qc5/OkQOOJOSG61sCmsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="39540"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="39540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 09:13:13 -0700
X-CSE-ConnectionGUID: WioHkA82QqWjb1FDb2YRhg==
X-CSE-MsgGUID: 4uhTXp3gSkGPyqzZBxyAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303466731"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2026 09:13:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE7mv-000000001U7-1sGD;
	Tue, 06 Oct 2026 16:13:09 +0000
Date: Tue, 06 Oct 2026 18:12:43 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/uio/uio_fsl_elbc_gpcm.c:323:19: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202610061847.h2hn65y5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Rosen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69f80fef3153299d9c72c53d1d71eef6354b6926
commit: c8295feb756f5e3ccf02c14a90a2ee0aed95e409 uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ
date:   10 weeks ago
config: powerpc64-randconfig-r2304-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061847.h2hn65y5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061847.h2hn65y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c8295feb756f ("uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061847.h2hn65y5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/uio/uio_fsl_elbc_gpcm.c:85:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_lbc_bank *bank @@     got struct fsl_lbc_bank [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:85:53: sparse:     expected struct fsl_lbc_bank *bank
   drivers/uio/uio_fsl_elbc_gpcm.c:85:53: sparse:     got struct fsl_lbc_bank [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:89:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:89:43: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:89:43: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:93:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:93:43: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:93:43: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:104:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_lbc_bank *bank @@     got struct fsl_lbc_bank [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:104:53: sparse:     expected struct fsl_lbc_bank *bank
   drivers/uio/uio_fsl_elbc_gpcm.c:104:53: sparse:     got struct fsl_lbc_bank [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:116:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:116:31: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:116:31: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:131:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:131:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:131:27: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:139:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:139:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:139:27: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/uio/uio_fsl_elbc_gpcm.c:323:19: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/uio/uio_fsl_elbc_gpcm.c:322:31: sparse: signed value source

vim +323 drivers/uio/uio_fsl_elbc_gpcm.c

   297	
   298	static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
   299	{
   300		struct device_node *node = pdev->dev.of_node;
   301		struct fsl_elbc_gpcm *priv;
   302		struct uio_info *info;
   303		char *uio_name = NULL;
   304		struct resource *res;
   305		void __iomem *base;
   306		unsigned int irq;
   307		u32 reg_br_cur;
   308		u32 reg_or_cur;
   309		u32 reg_br_new;
   310		u32 reg_or_new;
   311		int ret;
   312	
   313		if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
   314			return -ENODEV;
   315	
   316		/* map the memory resource */
   317		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   318		if (IS_ERR(base))
   319			return PTR_ERR(base);
   320	
   321		/* get optional irq value */
   322		irq = platform_get_irq(pdev, 0);
 > 323		if (irq < 0)
   324			return irq;
   325	
   326		/* allocate private data */
   327		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   328		if (!priv)
   329			return -ENOMEM;
   330		priv->dev = &pdev->dev;
   331		priv->lbc = fsl_lbc_ctrl_dev->regs;
   332	
   333		/* get device tree data */
   334		ret = get_of_data(priv, node, res, &reg_br_new, &reg_or_new,
   335				  &uio_name);
   336		if (ret)
   337			return ret;
   338	
   339		/* allocate UIO structure */
   340		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
   341		if (!info)
   342			return -ENOMEM;
   343	
   344		/* get current BR/OR values */
   345		reg_br_cur = in_be32(&priv->lbc->bank[priv->bank].br);
   346		reg_or_cur = in_be32(&priv->lbc->bank[priv->bank].or);
   347	
   348		/* if bank already configured, make sure it matches */
   349		if ((reg_br_cur & BR_V)) {
   350			if ((reg_br_cur & BR_MSEL) != BR_MS_GPCM ||
   351			    (reg_br_cur & reg_or_cur & BR_BA)
   352			     != fsl_lbc_addr(res->start)) {
   353				dev_err(priv->dev,
   354					"bank in use by another peripheral\n");
   355				return -ENODEV;
   356			}
   357	
   358			/* warn if behavior settings changing */
   359			if ((reg_br_cur & ~(BR_BA | BR_V)) !=
   360			    (reg_br_new & ~(BR_BA | BR_V))) {
   361				dev_warn(priv->dev,
   362					 "modifying BR settings: 0x%08x -> 0x%08x",
   363					 reg_br_cur, reg_br_new);
   364			}
   365			if ((reg_or_cur & ~OR_GPCM_AM) != (reg_or_new & ~OR_GPCM_AM)) {
   366				dev_warn(priv->dev,
   367					 "modifying OR settings: 0x%08x -> 0x%08x",
   368					 reg_or_cur, reg_or_new);
   369			}
   370		}
   371	
   372		/* configure the bank (force base address and GPCM) */
   373		reg_br_new &= ~(BR_BA | BR_MSEL);
   374		reg_br_new |= fsl_lbc_addr(res->start) | BR_MS_GPCM | BR_V;
   375		out_be32(&priv->lbc->bank[priv->bank].or, reg_or_new);
   376		out_be32(&priv->lbc->bank[priv->bank].br, reg_br_new);
   377	
   378		/* set all UIO data */
   379		info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
   380		if (!info->mem[0].name)
   381			return -ENODEV;
   382	
   383		info->mem[0].internal_addr = base;
   384		info->mem[0].addr = res->start;
   385		info->mem[0].size = resource_size(res);
   386		info->mem[0].memtype = UIO_MEM_PHYS;
   387		info->priv = priv;
   388		info->name = uio_name;
   389		info->version = "0.0.1";
   390		if (irq) {
   391			if (priv->irq_handler) {
   392				info->irq = irq;
   393				info->irq_flags = IRQF_SHARED;
   394				info->handler = priv->irq_handler;
   395			} else {
   396				irq = 0;
   397				dev_warn(priv->dev, "ignoring irq, no handler\n");
   398			}
   399		}
   400	
   401		if (priv->init)
   402			priv->init(info);
   403	
   404		/* register UIO device */
   405		if (uio_register_device(priv->dev, info) != 0) {
   406			dev_err(priv->dev, "UIO registration failed\n");
   407			ret = -ENODEV;
   408			goto out_err2;
   409		}
   410	
   411		/* store private data */
   412		platform_set_drvdata(pdev, info);
   413	
   414		dev_info(priv->dev,
   415			 "eLBC/GPCM device (%s) at 0x%llx, bank %d, irq=%d\n",
   416			 priv->name, (unsigned long long)res->start, priv->bank,
   417			 irq ? : -1);
   418	
   419		return 0;
   420	out_err2:
   421		if (priv->shutdown)
   422			priv->shutdown(info, true);
   423		return ret;
   424	}
   425	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
