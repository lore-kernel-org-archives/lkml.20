Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412920;
	b=p0wYdPydPqO0J8iZGzLbcK5imkTfPuJ88WFV8S87Vkns3xD88NfPegQenvqhDi/2Cbe0
	 h2QAXd7Hgn1nQlJxV+s6gzQ2mDw0lAxGfKZfgpdBN9TLRvjpEqawHiKrSpzlLaNqPbtBx
	 jysorOdnvnuVUk2Bjn7nahNm/LvbctQzLzmPOa4Eja1cpu3Ri4a08NRtJ1JqlHv9jrNaS
	 nUJvtyvsoWGsMtdqwsK33o4py8IvrI7pFLhKGEPGsgOXMA9qQIvjPPFDXcBsInoAdk/Gb
	 Y1acTxql1LYOtKUHoatVlUzRIJPdHHk76J1Q5Qb40hjrc1iSyeutVFq24T8LslQ0ESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412920;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0SEzR/ufTmBewXqynudJstt5wvDRwVALxX8EDKc0tqg=;
	b=3C8vpEuFl1Erv7GjHI6g7Aqy0MNRZNmUC/TX/RpTMce3mNlWOAg+RVxCpU2kiG5XhbiJ
	 jTK+9LUPaKEjcXsMhn3OrQ6tow/KPWs6rF32O+OoSki2QwF6jaWuXdNYplczlHG3zi92Q
	 QEHwgsqPzqdxpg0x9pmQy0yLLcPMNRnBnEgHJkpgalVYNqPS5hudqZSyQ7Jx3C59yw76Y
	 bGvrzb2GP/14aWoshIZUApniPjQCD+3NF468XMMDtW8QB+6rDBG8o5vkP0LMo/dOtagRb
	 n2cYvuZHvrb9P244Bj2kfh6pk7Vc7RHmA+5uD0vZwpFN3TjFTescpGmQViovlbgkQrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Ffz+sS/H";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8AB606A322
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B8AB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ffz+sS/H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793412919; x=1824948919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JDGnfo9AO3La6lbmSWT/ExmOzEpPsX5TkCTGoppcGTk=;
  b=Ffz+sS/HMnP/ci3DyL8sXpvUS4MHZol414VTyrCmWEVzE3Qw1mq8Dx8P
   HotAn3CRC4EJ9HNKmRAyKHvqXFl6JOLzPH95ExNWsq6GDPNmScUBp/2cy
   dxl9ysOMwW9cR8PYfMyX6tWgwVUSng9fMAREr9E4W1aA9GVpVzSLZM2G/
   A4c8ZU7FH2yfpKT5k96/RjT/SjLRpnOk/V64wTIflcSqftPUrCL4F+IkK
   GqkSmZzizqCy3cFu3Hk0mxw4F3WYQhjxgdG7ZuYMdBRbfPcY4OmhIhO3N
   v426YhtFFkQoJxkQ4scfvnutZdYWRtFN0apUCPeq8yVmKvC0VaE9NcPH7
   A==;
X-CSE-ConnectionGUID: 455rR8t9Q7GTznaKRN5SbQ==
X-CSE-MsgGUID: L35yHWzLSRWEFm3PlEQemg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2092329"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2092329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:15:18 -0700
X-CSE-ConnectionGUID: AiHVaetHQuKJFUKKhBg86g==
X-CSE-MsgGUID: 37q5X9yRROuT9Ddl+x8oDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5467278"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2026 19:15:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMycd-00000000cSC-3G7I;
	Sat, 31 Oct 2026 02:15:07 +0000
Date: Sat, 31 Oct 2026 10:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <202610311058.zODtC2bF-lkp@intel.com>
References: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
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
In-Reply-To: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>

Hi Vladimir,

kernel test robot noticed the following build errors:

[auto build test ERROR on c03c1a14507dfaf8b856c2608f9ac216021fc222]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Kondratiev/riscv-build-kernel-atomics-from-LR-SC-when-Zaamo-is-disabled/20261026-112002
base:   c03c1a14507dfaf8b856c2608f9ac216021fc222
patch link:    https://lore.kernel.org/r/20261026-lrsc-only-v3-1-ec29c8190fb1%40mobileye.com
patch subject: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo is disabled
config: riscv-randconfig-1000-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311058.zODtC2bF-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311058.zODtC2bF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311058.zODtC2bF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: -march=rv32imc_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:290: scripts/mod/empty.o] Error 1 shuffle=1963593903
>> cc1: error: -march=rv32imc_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:185: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1963593903
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1424: prepare0] Error 2 shuffle=1963593903
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1963593903
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1963593903
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
