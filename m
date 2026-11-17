Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923592;
	b=bVfoJ/hGw1GYfS/svHfDcW9GQ1rqtJtc6MLRQAJcPu2t1no2ESthEJETsUvIjpVGaDft
	 38dOB4esWhB0/KQi616RUvX7jTlQqlO5+gvKdr04jhwB6HenSlDS+UDsJaeUDdQayPTxD
	 skkdfySYT0X9PqB2Z49rxjlJZVdTkHWTozCoQJIUbYPt43jYf7yq048YQIoylu3W2mbwB
	 uvOp1RDD1XudeZZiJqIOF8IJKsu3kEEB/rzLbkSM5CNC5FK4UpiB1pMbfphSpTM3I+HQq
	 aIVe4iYqj6ECvzCtLK3d8Rk44lgyeI3IVB/aV9AV82X0mhDjnnUu/XJV1/+PfeQZ2Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923592;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wjQL4ewuxT6uz+ickh+uDk0E3nEeYBbCzyHP1xoD3C4=;
	b=DC+b85bLF5POh48CpZJ5vvtH6fVjuZOk1aQWrzXk4/lkELYgKIfltAIsmESrDOWsE882
	 c/PmrpIFKKHrD51uyAHMVN3CqaM7b1hvqY3WUwPvxFMqOl9RVzPtETHGleYqr/FB6/fU0
	 2o9zto242zOFNFqtYcNakvj4F348cav0XcpiIGbjkzQzRb09C8Ds3Evq2ueuB60DTg7Na
	 T42stfj3CICZUDEpmsxramIdKnBoyCv7KAk+RUb+8zLJ7/43auBSLQlpGUBeKsx6JhD7P
	 sNemWNdceiRsJpqm4l5aCqSSRmqLiaYYVZ4/tOoik4fUOfZtzckfmrjBJYIALbCnGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jwe6ZRmn;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EC606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jwe6ZRmn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794923591; x=1826459591;
  h=date:from:to:cc:subject:message-id;
  bh=5YPpPj397tmvDb/zMTFD1jBIbuIsbruFJxvvddDXf2w=;
  b=jwe6ZRmnrG5UknsaTaFXy9JDYLcREzV7Pyi0obd2lmEHk1glwE2J2TgX
   w+e8laVFeT4aHmUz4qB5OJQ+3qtdpg5DnSwgsF3DX4bgh4t2kymGAWBlN
   XKArYBGjkixUoij1y3V2Pjmv79l7bZ6C6c9vHtnwSBQvSO7RA8TTewSbg
   a/dXcZVeYyKCaIzO3k4fGd8aGF/VqjelFsd/13yUSk9x7E9EIoOFHHiRy
   qvx+u8hV/ABs6t7DdQM4uXQZ4ygIyW6nPWZ5+Z4+nDXSVr7zvOuw5dzMk
   7xJb5UyQqGbam8SQvTid7PITZg5OiGrLtoexbyc1Z1e1vhWyuP0FfFu+r
   w==;
X-CSE-ConnectionGUID: Epxrl0T7RcSou4pMcaC9Mw==
X-CSE-MsgGUID: Vvi1jyU/SHyqKPlM4JUXJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3687323"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3687323"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:53:10 -0800
X-CSE-ConnectionGUID: HJ+j/LzbSLSghJTLMpq46w==
X-CSE-MsgGUID: NU29smkRQWeCDMt+prghEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9774701"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 05:53:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTJcP-00000000382-0CPW;
	Tue, 17 Nov 2026 13:53:05 +0000
Date: Tue, 17 Nov 2026 14:52:42 +0100
From: kernel test robot <lkp@intel.com>
To: Zyta Szpak <zyta@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:irq/drivers 20/24]
 drivers/irqchip/irq-mtk-cirq.c:292:34: warning: unused variable
 'mtk_cirq_of_match'
Message-ID: <20261117144350.wOuBa9ZW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Zyta,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   aab02e49f0b54a0837e58c67651c4abdad1a3208
commit: 702ae15488ce96d9818deee812d9fc271316fa6e [20/24] irqchip/mediatek: Add Kconfig option for MediaTek SYSIRQ and CIRQ
config: hexagon-randconfig-r2111-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117144350.wOuBa9ZW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c7014922f5829426952a38d079220c21b0a8ebe8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117144350.wOuBa9ZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117144350.wOuBa9ZW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-mtk-cirq.c:292:34: warning: unused variable 'mtk_cirq_of_match' [-Wunused-const-variable]
     292 | static const struct of_device_id mtk_cirq_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/mtk_cirq_of_match +292 drivers/irqchip/irq-mtk-cirq.c

9dbbbd33aafaf1f Youlin Pei                 2017-04-07  291  
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28 @292  static const struct of_device_id mtk_cirq_of_match[] = {
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  293  	{ .compatible = "mediatek,mt2701-cirq", .data = &mtk_cirq_regoffs_v1 },
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  294  	{ .compatible = "mediatek,mt8135-cirq", .data = &mtk_cirq_regoffs_v1 },
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  295  	{ .compatible = "mediatek,mt8173-cirq", .data = &mtk_cirq_regoffs_v1 },
5c4e0aac0b2a271 AngeloGioacchino Del Regno 2022-11-28  296  	{ .compatible = "mediatek,mt8192-cirq", .data = &mtk_cirq_regoffs_v2 },
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  297  	{ /* sentinel */ }
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  298  };
45ac01959edcecf AngeloGioacchino Del Regno 2022-11-28  299  

:::::: The code at line 292 was first introduced by commit
:::::: 45ac01959edcecfa5d6652c2397d3866e55b0da8 irqchip/irq-mtk-cirq: Move register offsets to const array

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
