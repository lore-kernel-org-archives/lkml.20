Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692299;
	b=bJBGLOqF2rgZJXq1dE4K9G2wJhcd8njSGEGT/AwQE9neMK+qy8cfZ6H4XDJKWO27eJ2f
	 +t53A4MOrIVYydXRcLNbggiGviTKvzl5sPnX99iAm7ou6LSDmSoAHSUufgTJrFbrwVdcD
	 SufuSnjzlN2n1Kjum36aQ4Wp9OEXMs5Ig5UOQNBbs8T8KG18nl70R7CRRaBGVUXD0O9D/
	 uJiVQW4aQapV3whSJiUsGYu/1uapUGjCnpC+DeTgYflnZ1xrahaoFNW2onnNCAvGKdUWW
	 bhBA0TtMXjUd5emmzu9xewRr9PP/nLaz3pzQerUEAHDMwDTxAs8Ad2SQDdWQ6S1zm3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692299;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5L5sdhRfatV21sxlJx2tqPPxjJ3hrMEhqV+2z8gv72Q=;
	b=vv7nTu4ZKCwxkBdkRRu5qikmtoZA98Gw/9b95/KX1mdh/H9VcJF9ufI8mchmLXAaxC0T
	 5hLvO2PTn9USAFdwYlqmvqZEPdgbyOga7rDL4lD5qlr6t+P/DltgYFj6SwVsNcZDeAMav
	 7KmOJbZzi81O9Jf8hsy0RNpJT71yvUUM34/i/3G3eyzrh8SKeAj7kW+JfUYiIwmwPA578
	 UyTknfm+V5MNMNWyvt7SwwEQLp+saPFNMJli2u+eTuGxO8Lw2+sm9meOyNcB5PAKkm0cW
	 /E5y3ca+SAwPeUFMpsBy9Iwbjw6sV/KzzVO+YCXxN6VVTvr8W343riACk+/J500Xpbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6wUj7vI;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BE606A332;
	Tue,  3 Nov 2026 07:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 403BE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6wUj7vI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793692291; x=1825228291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fVNsNTiaA1qZgb+DUccDK6uxEDilJ7lFPO2KRwu5EoU=;
  b=G6wUj7vIXIWLAsEq60U6AIT4neD6kDZLLkeu3818b1mwaCKtkQkRoetZ
   wINpP3y9QMcChZoud62VoGMWvuXBkbCr3beVuoRkXP/NcGQCAIN/Wp9Ge
   z8DV72y2Em2GlEtNZOGbomtoSb5ubybCpu55Rnuehg/BCdEgxQUTHDs9Q
   ZHzoGgQ/f4j+z1GpPTkjegbTet+I9i8/2x9QZBV42aJmKlJrd/vPk63yl
   1+ysV+DjvM+0at3O8SGwCeP4CC/7coW5UdNeSQkjimCCa6ZVaalBNKPaf
   VZm2G4srKPYLToUsGe/40rPD2EbmgVP8DpJK0RM8+Gf0RCDSbMiaizsXa
   g==;
X-CSE-ConnectionGUID: pOzNowo3QF2ieY1zIKk1yw==
X-CSE-MsgGUID: BOlTT8xnTkymx39VK0J6Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2400392"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2400392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 23:51:11 -0800
X-CSE-ConnectionGUID: wPLKXj1STemxGPMaybf1pQ==
X-CSE-MsgGUID: map9A/dmR/ipEGHfwwjJAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6467703"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Nov 2026 23:51:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO9IN-00000000iT4-3PEW;
	Tue, 03 Nov 2026 07:51:03 +0000
Date: Tue, 3 Nov 2026 15:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
Message-ID: <202611031517.aikxJm6o-lkp@intel.com>
References: <20261102165421.3651202-6-andre.przywara@arm.com>
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
In-Reply-To: <20261102165421.3651202-6-andre.przywara@arm.com>

Hi Andre,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core linus/master next-20261030]
[cannot apply to arm/for-next arm/fixes clk/clk-next kvmarm/next rockchip/for-next soc/for-next nferre-at91/at91-next shawnguo/for-next v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation/20261102-175415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261102165421.3651202-6-andre.przywara%40arm.com
patch subject: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
config: arm64-randconfig-1000-20261103 (https://download.01.org/0day-ci/archive/20261103/202611031517.aikxJm6o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031517.aikxJm6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611031517.aikxJm6o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
>> drivers/firmware/smccc/lfa_fw.c:939:16: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
     939 |         return devm_request_threaded_irq(dev, lfa_irq, NULL,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                devm_request_region
>> drivers/firmware/smccc/lfa_fw.c:940:66: error: 'IRQF_COND_ONESHOT' undeclared (first use in this function)
     940 |                                          lfa_irq_handler_thread, IRQF_COND_ONESHOT,
         |                                                                  ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:940:66: note: each undeclared identifier is reported only once for each function it appears in
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_smccc_remove':
>> drivers/firmware/smccc/lfa_fw.c:1034:9: error: implicit declaration of function 'devm_free_irq'; did you mean 'devm_free_pages'? [-Werror=implicit-function-declaration]
    1034 |         devm_free_irq(&sdev->dev, lfa_irq, NULL);
         |         ^~~~~~~~~~~~~
         |         devm_free_pages
   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
   drivers/firmware/smccc/lfa_fw.c:942:1: warning: control reaches end of non-void function [-Wreturn-type]
     942 | }
         | ^
   cc1: some warnings being treated as errors


vim +939 drivers/firmware/smccc/lfa_fw.c

   925	
   926	static int lfa_register_dt(struct device *dev)
   927	{
   928		struct device_node *np;
   929	
   930		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
   931		if (!np)
   932			return -ENODEV;
   933	
   934		lfa_irq = irq_of_parse_and_map(np, 0);
   935		of_node_put(np);
   936		if (!lfa_irq)
   937			return -ENODEV;
   938	
 > 939		return devm_request_threaded_irq(dev, lfa_irq, NULL,
 > 940						 lfa_irq_handler_thread, IRQF_COND_ONESHOT,
   941						 NULL, NULL);
   942	}
   943	
   944	static bool lfa_smccc_has_all_functions(void)
   945	{
   946		struct arm_smccc_1_2_regs regs = { 0 }, res;
   947		u32 fn_id;
   948	
   949		regs.a0 = ARM_SMCCC_LFA_FEATURES;
   950	
   951		for (fn_id = ARM_SMCCC_LFA_GET_INFO;
   952		     fn_id <= ARM_SMCCC_LFA_CANCEL;
   953		     fn_id++) {
   954			regs.a1 = fn_id;
   955			arm_smccc_1_2_invoke(&regs, &res);
   956			if (res.a0)
   957				return false;
   958		}
   959	
   960		return true;
   961	}
   962	
   963	static int lfa_smccc_probe(struct arm_smccc_device *sdev)
   964	{
   965		struct arm_smccc_1_2_regs regs = { 0 };
   966		int err;
   967	
   968		/* The LFA spec requires SMCCC v1.2 or higher. */
   969		if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
   970			return -EOPNOTSUPP;
   971	
   972		regs.a0 = ARM_SMCCC_LFA_VERSION;
   973		arm_smccc_1_2_invoke(&regs, &regs);
   974		if ((s32)regs.a0 == LFA_NOT_SUPPORTED)
   975			return -ENODEV;
   976	
   977		if (!lfa_smccc_has_all_functions())
   978			return -EOPNOTSUPP;
   979	
   980		pr_info("Live Firmware Activation: detected v%d.%d\n",
   981			upper_16_bits(regs.a0), lower_16_bits(regs.a0));
   982	
   983		fw_comps_update_wq = alloc_workqueue("fw_comps_update_wq",
   984						     WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
   985		if (!fw_comps_update_wq) {
   986			pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
   987			return -ENOMEM;
   988		}
   989		INIT_WORK(&fw_comps_update_work, remove_invalid_fw_components);
   990	
   991		init_component_default_attrs();
   992		lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
   993		if (!lfa_kset) {
   994			destroy_workqueue(fw_comps_update_wq);
   995			return -ENOMEM;
   996		}
   997	
   998		init_rwsem(&smc_lock);
   999	
  1000		err = update_fw_components_tree();
  1001		if (err != 0) {
  1002			kset_unregister(lfa_kset);
  1003			destroy_workqueue(fw_comps_update_wq);
  1004			return err;
  1005		}
  1006	
  1007		if (!acpi_disabled) {
  1008			err = lfa_register_acpi(&sdev->dev);
  1009			if (!err)
  1010				pr_info("registered LFA ACPI notification\n");
  1011		} else {
  1012			err = lfa_register_dt(&sdev->dev);
  1013			if (!err)
  1014				pr_info("registered LFA DT notification interrupt\n");
  1015		}
  1016	
  1017		/*
  1018		 * An ACPI notification or an interrupt are optional, but we must
  1019		 * handle errors that occurred during their setup.
  1020		 */
  1021		if (err != -ENODEV) {
  1022			kset_unregister(lfa_kset);
  1023			destroy_workqueue(fw_comps_update_wq);
  1024			return err;
  1025		}
  1026	
  1027		return 0;
  1028	}
  1029	
  1030	static void lfa_smccc_remove(struct arm_smccc_device *sdev)
  1031	{
  1032		if (!acpi_disabled)
  1033			lfa_remove_acpi(&sdev->dev);
> 1034		devm_free_irq(&sdev->dev, lfa_irq, NULL);
  1035		clean_fw_components_tree();
  1036		flush_workqueue(fw_comps_update_wq);
  1037		destroy_workqueue(fw_comps_update_wq);
  1038		kset_unregister(lfa_kset);
  1039	}
  1040	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
