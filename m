Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A53F36606A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942639; cv=none; b=q39K60wQY171rr6zvHfHRmTDVAkKejqohaQEcYdro8vQM6JBMOfZSCWUBDK+I4Jj1rGmi0cMB3i0IQjyQb5w1raYHaNmTUgKMj6Un7SSkrlKcx9/pS9UAn0ditx2YysxORkI7zb+i7oSqt5HOllo1LE4RguMZ1qwsCaWBGk95Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942639; c=relaxed/simple;
	bh=bTKE5kgvK0PQTF/o8cSvd+eLlctQUulc/Evxy7GkhwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iiJLBSVONH9xU2OcLP45YN1Iq73i6t8frhvASqHc9RL11RUj7lg9Ayn6aaRKGPW4cakvZyY81pgp/k5n/eos6D/vppmiWjf6+zdmg0HW9Li82DfVNJz9ICNwmZCzUcRHSxD2dJRt8szybw1Qezk02Y3Q0WH3uFVGHgu55GN+VJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAmhpEgK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAmhpEgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790942636; x=1822478636;
  h=date:from:to:cc:subject:message-id;
  bh=bTKE5kgvK0PQTF/o8cSvd+eLlctQUulc/Evxy7GkhwU=;
  b=XAmhpEgKA38wyOXvZNhgE7moa86iFytu+KXp+wa1INp0hBrB3do51bqB
   DwaN/6PI7XXDLIfnje4df/6N1N94nAhO7Wak9r3C+fg56/6k9CSpG283V
   G3pA6ciwULlA0SCujzwjMOBRr+d/oeR1vMj5vFnbEKKgS3iLNl3miXlUL
   /DMibtrtknBsbWKNjZTA11QrT7SSbhR7DhlHZBNLpE7236VBgBWrQheDi
   Nrm9CHPSxH+qEwoMtcA+kfR0SwwTYjrKyTLp6ijQEwQt9kFpnnQlZSzjX
   JEEVl3Sd7tuaHSwkCapfuCU+hpFOcb9tAxn+ttAVX9WEQQJmC50rPE+Ej
   Q==;
X-CSE-ConnectionGUID: znw2WZrFSf+Wx13CRGw7NQ==
X-CSE-MsgGUID: /3MfHBPNRxC1/JyRvuLsJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91569717"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91569717"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 05:03:56 -0700
X-CSE-ConnectionGUID: Cq9OCGjdQXymgyaw5yuoTg==
X-CSE-MsgGUID: 2pyqzYzpRKyHWBg7qfUrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="242656"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 02 Oct 2026 05:03:54 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCbzU-000000000Wd-01t5;
	Fri, 02 Oct 2026 12:03:52 +0000
Date: Fri, 02 Oct 2026 14:03:32 +0200
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [tip:irq/drivers 3/22] .tmp_gl_qcom-pdc.o:undefined
 reference to `qcom_scm_is_available'
Message-ID: <202610021412.sF9k0Grb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   0c65a1331928d0207c385f03fb5eba0cfecce0e6
commit: 1b852de05f74cfc96c58caad9df4cc1fa2dc7689 [3/22] irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM
config: microblaze-randconfig-r2300-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021412.sF9k0Grb-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021412.sF9k0Grb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021412.sF9k0Grb-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
>> .tmp_gl_qcom-pdc.o:(.text+0x1450): undefined reference to `qcom_scm_is_available'
>> microblaze-linux-ld: .tmp_gl_qcom-pdc.o:(.text+0x1468): undefined reference to `qcom_scm_io_writel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
