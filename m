Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870186;
	b=ST1/2C4kzns7sbWOn8J88WLbSscM8/zZfYAq0hI+ZBpP6UCUF5zcr75Hi+/OnpxjhhfC
	 +0ihNhyJWGGhyCYntLms1X0ghpr6hwYe43P+UvvX57Qje9by2y05AA9bzcU5bHMnotm1f
	 Vc6MdDe6QLGZ3KrP3NyXxm8/ut4nD2bbOWQUgUkHi3e8fybSF+e9p0Nm+tpNCJXW9ent2
	 GTLEVAUyOvQexinFN+OdUfmYb9FFxVA2MGeBWDxDqV/4t4gUeU/40wyiJgItTtbTmDlbJ
	 8xsoKxmotB2smxTJwq7DUtWnhOfq7s5II/XeW0XS4qFyRvcwN9tGfAXj8Lt5HoA3mig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wf7Ik254Hs1LnPHVTqliKwyaBvyUYHDcoNqQBpCGZmw=;
	b=OMFdszG84vjGtYJIte7vV/1Vola8S62qYKqzKjY4iauHGAPwDI9rerpVTKhNsl4l2qrK
	 4wGZoSl6tHxy7sSbYWQN7f0rQvUPfu38vafE5bIUNr1RLLejIt3RHFZ9zHdk21CRjU/Z4
	 4hiBubyXLxMNuLeJzkmkieaY1jxZZ5bIpTw07Ve2nTEneyayp1wIvySAxxsD8/nSrHt7D
	 7b6jWc3jiotUrg7b0R/qhrCI8a6MUSIgP5XQlVyhRiv3+xnk+udJknZTW+SzuBiIJStcz
	 freXfaovLdbUfD0leSANx4jRJ8S5NzUzJkfYcDfBJmOsu1SuEFgmSevhE/XopDzDQDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eYakE5HI;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF1606A31B;
	Sat, 24 Oct 2026 19:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEF1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eYakE5HI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792870185; x=1824406185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LhhCKSsi5TJmK4KnvzjxZP/PcsPAwBm1SWTrA8Wsbp0=;
  b=eYakE5HI83jspUpW75HuH/XrWl1EAeNCXS8k259jwgbTS6LOK6puI/oO
   TKk/5dAWKixkAO8njRr+VjDBQfPdLCAqpUnalHb7B77TK6bOBzyv33yv6
   ZS+F5Meb3JY89N34Vo7n4qMl8oZyy/EBJYLBMqVHiWiEI4vlI9cnNRcMQ
   dEqJJYfGi2V+oIA0WnXEyoDTXvocuiTWAeN7w7nVIO07A6OuzmI9SfVvy
   v2Sa6ngR4gsPr/xDN7B5feX88Gh8oX5AIUVjeyvLdCLU40I9VJ8HdV8tg
   Wb1ejjKCzV6P4udpgtcZh2xwXSrToEpUhhtqhdJJfV+oxgXf04eCseGKO
   g==;
X-CSE-ConnectionGUID: P0qprq2FS7meschx2cyihQ==
X-CSE-MsgGUID: 7N1hSnxBSIekPWrhOjKLSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1485906"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1485906"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 12:29:44 -0700
X-CSE-ConnectionGUID: 9SEKm4miRUSOFkMvE9pqKw==
X-CSE-MsgGUID: OJEVBD3DTOSKtnh5MNoZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3843058"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2026 12:29:41 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKhQv-00000000UBK-1jMj;
	Sat, 24 Oct 2026 19:29:37 +0000
Date: Sun, 25 Oct 2026 03:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Louvel <paul.louvel@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
Message-ID: <202610250312.7jcnCxbw-lkp@intel.com>
References: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
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
In-Reply-To: <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0785f7172040512cba759838b27286646773c735]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Louvel/regulator-dt-bindings-Add-regulator-boot-force-off-property/20261021-122742
base:   0785f7172040512cba759838b27286646773c735
patch link:    https://lore.kernel.org/r/20261021-paul-lm51772-v1-5-25f0ffbffa8d%40bootlin.com
patch subject: [PATCH 5/5] regulator: Add TI LM51772 support
config: xtensa-randconfig-1000-20261024 (https://download.01.org/0day-ci/archive/20261025/202610250312.7jcnCxbw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250312.7jcnCxbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610250312.7jcnCxbw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x28 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: init_tracefs.isra.0+0x218 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> ERROR: modpost: drivers/regulator/lm51772-regulator.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
