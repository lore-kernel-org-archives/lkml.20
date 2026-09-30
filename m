Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889D5111B5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786274; cv=none; b=MVoF/D3jpdz7qlqBdR6oSwVMxDBfSRRkwxJ+Me3jkivOpTpwUHAJWQii1FI614kIs6jJsGvLeI63rukLFCHhryAhKIimaQGR5puopuK6XnJxy/HBJ0Ca6nIzkOAdrKZ5qxQ4fjL4h2JHbng+oZ3j5X0+OeDoFGDpqLQZUG7i+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786274; c=relaxed/simple;
	bh=NHGLmzgTqg+atFlfLjNFgrrVr9jXYipGErdXaLGp0Ms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FwJsWLFIAp2/ptZHM/PbcvhTatPep2BrTWWNbpulTk6PBujouRQKdvRUUo97j4cz1RB0hP9Z17CWpz4Cnaed9iaNWK8xGneEyf0eJiRROUC+mEk7i5zYue7bJ9vQmI45MrMAWHVk52po7p85TWdPsEHA5p+yDc+L7mvlFH9VbOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOS3YayJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOS3YayJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790786270; x=1822322270;
  h=date:from:to:cc:subject:message-id;
  bh=NHGLmzgTqg+atFlfLjNFgrrVr9jXYipGErdXaLGp0Ms=;
  b=gOS3YayJSJhy//TpBFJI+2Bn3SjCIRFCzsohUUpty95hoWL612dK9rcr
   sAq+jGRbj3X9W4Ved2UDgbJsmtJQfJMNkVo/S2+lSkCV5nAjxiHE9unwj
   ILKaPmckNy2GDDm/Gqr7gWS8hWE/y+f7SYXEjMgEiueXSmrO6cB+bCzu8
   Wg+CadIi1O/ZQu3TFZyRIAkX8esc6D/PWxhQmKBUiRrQNCNxo13OB31bA
   vorlG9f0J18CjtmL3/471oZnH54ApsJ/T7EjgykT/y3MKA8Ktfcizz413
   tdW1y8DLHKoDpLJ4YjQ7aNxn1MDBPrBE3saqhoIGG9ljTlIQVfu8oRZBa
   Q==;
X-CSE-ConnectionGUID: aMQyJJYxTgu+28kvPj4JnA==
X-CSE-MsgGUID: Xy84wQadQHKLSXOm9bBCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90584913"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90584913"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 09:37:50 -0700
X-CSE-ConnectionGUID: Rnnulm6HRriijV502SoCMg==
X-CSE-MsgGUID: xJMbo8jrTE6yK3ml1AZxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="280499999"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Sep 2026 09:37:48 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBxJS-000000001vv-0vfY;
	Wed, 30 Sep 2026 16:37:46 +0000
Date: Wed, 30 Sep 2026 18:36:50 +0200
From: kernel test robot <lkp@intel.com>
To: Josh Law <objecting@objecting.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: arch/mips/boot/compressed/decompress.c:undefined reference
 to `__ashldi3'
Message-ID: <202609301826.MFaFMsmd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   551c722f40809618230001baccf219193e22fc5a
commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
date:   6 months ago
config: mips-randconfig-r2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301826.MFaFMsmd-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `get_bits':
>> arch/mips/boot/compressed/decompress.c:(.text+0xf4): undefined reference to `__ashldi3'
>> mips-linux-ld: arch/mips/boot/compressed/decompress.c:(.text+0x168): undefined reference to `__ashldi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
