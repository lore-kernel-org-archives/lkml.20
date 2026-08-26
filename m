Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BDC3F6613
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769883; cv=none; b=kOFxO9/EZ8xe7zM3cV54A0KvW9eHbDM5chGYxKCei2VleXybwZod1iK9g51aT1ZfNk/eXiaZopU7udj14Hf2G0BGOtLxtB8173Dq6mg7krntAML/MktcG+uY7XRhE/iXkJKIp9oainOn5LOzq+orTxbj+WRSkVtlaGTwEEXtaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769883; c=relaxed/simple;
	bh=RuZik7LEEZ5/1dxCqSZbYgP7BzWVxV7F/jZJ3xtnNOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X+wmmPnc0cmxfKZxWfuf/hVBLjd8233/I1SURQApZa+U1xfvwDXxns0lofHgM/U+xsH8Rs+0zcfJiYL3oPU/eUZYGTZrC99pRi4+A5gWwE3tc4wk8/Yl6PwUeUxfWnfz3YNiSKvlOCe1PBDkR/HMwFYtPLweiEaGvT2qoxh0Ls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEcB1MAU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEcB1MAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787769875; x=1819305875;
  h=date:from:to:cc:subject:message-id;
  bh=RuZik7LEEZ5/1dxCqSZbYgP7BzWVxV7F/jZJ3xtnNOs=;
  b=JEcB1MAUEul98PftnePpseGLNPcPMShe1PMsxBnYnHZIS1HCwtB1Zf+b
   HOMU/0JAeutK2UZSmo/P7cAbc3dR4kBSaLFaUDw0P55sK0WtBPzB626xl
   8T5WqNfoCYQD8hIaCTLIoRaB3X/IW9Dmdy+Uxo7A3B00xp8Lb0Nt+x5cp
   eK5DsHKmwMCMv0PGdNGkDLlk92kMzy4ppasUDOqbRomKbkX9v2BJKoZxg
   je4s+w2a7Gjl1eka1FhUcxivXkLL2t+v4TgwIf4Q9q9PLffWy6haRPxnB
   WHbAqQ8shOS+lYzvcucEfu0qJ9tNtPauMqaYkussGw0ry1SjpKQpf7o8u
   g==;
X-CSE-ConnectionGUID: kHXb5JtyS9GRv/+LNfxTKg==
X-CSE-MsgGUID: wSHIquVNQRG+MNforA1PCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87203853"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="87203853"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:44:29 -0700
X-CSE-ConnectionGUID: h3v7QopgReaB4psh3mqjKw==
X-CSE-MsgGUID: YKqEjqyhSnyXZadZ1H/ojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="267074528"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2026 11:44:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzIbp-000000000Yv-0Os9;
	Wed, 26 Aug 2026 18:44:25 +0000
Date: Wed, 26 Aug 2026 20:43:49 +0200
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
Message-ID: <202608262054.WWa7JMca-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
date:   3 years, 5 months ago
config: arm-kismet-CONFIG_HAVE_ARM_SMCCC_DISCOVERY-CONFIG_ARM_GIC_V3-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262054.WWa7JMca-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262054.WWa7JMca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262054.WWa7JMca-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
   WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY
     Depends on [n]: ARM_PSCI_FW [=n]
     Selected by [y]:
     - ARM_GIC_V3 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
