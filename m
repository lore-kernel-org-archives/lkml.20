Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371507;
	b=gVHjkCzcX8JcUC1A0pFxuRhVjUDzpwLWa0UANDqAfzrkF0DE6Ulaivs5RAp2HaMwNdYw
	 G0GapqSrLWtys1SYxFPOYCU3uK8vP1Q/Lf5pCkeDi0HAJcTrF4dqzbHihuoNt6pW54jtO
	 g/YWIJVLXKVqkaMFOED7fcRcs64wdnmoUv3i+Mgf4w5D4+8gS2rrnlNVW91NyaLhzePMg
	 DhMHDuzupyZK+nEBVOpUEryboPAjhqGY0WFNjoBc79MnqPuq0X6DIuwI8Dqtw0UUTNgry
	 gAtbMKog5bZZVBaHXMnsJIyVrfRp9v4fQbfgFo8I+KhND38ktVlV32o3UemW/Tg4UTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Y+iIg1pXUD42WQF9JALOzbFDdcxViOQceIlrVTJLhKY=;
	b=Vlj/QpIPgVAQnfIK0QTSlhWaHQeG9VDUicwyn0ZOfYEtoSHZnFcrBWOMIT0Tv1xe/Sme
	 A9ETMHAv4yyqs5EzKR5Cl/eDvLWvgWBFcovsgOWInYQxKSk38N8CeT6UBCMMWF+/djco/
	 auDFLsv4WfcstCLXBfW92wNFKRU9DigVZygMgq/JzomR3qnpTCmc0Uq/kfTPgsh2dcX6l
	 TSxpmAsbDKjuioK9KQT6o6EY5xpI4nEiLVINlQzN8gQvCZjdtihbfN3RU1FG0F3xkbv4/
	 F/qA31PvaaDtdVztXTjcV/pTo9XQTJH+J/JWcsPRdw1Ca5kib+0b7RYROY01GFFaS2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkuNCwr3;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15BF606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkuNCwr3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794371506; x=1825907506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5/MyIjpzQZ0pBKb/iFF80cArFt9LPEZbOSC7vbHdfBI=;
  b=mkuNCwr3oPr9qDPo6vtArw427j2tA7/s3955cC9ouMcX32cUmqh5KzHO
   SMqWzy2lx6TeMdgSz24zqHhlfwI242ws8QwAfJ5V3nL5oEJpqX4A++jTM
   S2Lmjepj/xmQQ+IcP4Np9qUohK5Vj5ZpaVzFrUZa8zrGk5aN2k/RrCoVi
   epctUWsmsSXY44VMByqYRu7kFqeddFyOSPpxA24ShIpAjE9ejrFMHM1vB
   NlQdwdBCcsLfw5GR1F+eRxjkr+O7+8ktLkMi8Mb/ARIn6bVTleIpEmy7c
   b3JB6eQHt5IGNKYgGRbcMSq2pk9fAxIQRkpBC7szyt4m3O8EM1JlGfrtJ
   w==;
X-CSE-ConnectionGUID: UDujcoeCQb6hlHKu+gM7IQ==
X-CSE-MsgGUID: t5V5kGjyTE+NsVoewZf4YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3141366"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3141366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 20:31:45 -0800
X-CSE-ConnectionGUID: R5NBuziaSrqXHmQE8TkCQw==
X-CSE-MsgGUID: +ih3ISCdR+C9uOiKErMugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8418569"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2026 20:31:43 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQzzo-00000000y55-09L7;
	Wed, 11 Nov 2026 04:31:40 +0000
Date: Wed, 11 Nov 2026 12:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pstore: Use match_string() helper to simplify the
 code
Message-ID: <202611111158.Qtw7vGo7-lkp@intel.com>
References: <20261110151844.661926-1-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20261110151844.661926-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp aegl/next linus/master v7.4-rc2 next-20261110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pstore-Use-match_string-helper-to-simplify-the-code/20261110-161844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20261110151844.661926-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] pstore: Use match_string() helper to simplify the code
config: arm-randconfig-1002-20261111 (https://download.01.org/0day-ci/archive/20261111/202611111158.Qtw7vGo7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111158.Qtw7vGo7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111158.Qtw7vGo7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/pstore/platform.c: In function 'pstore_name_to_type':
>> fs/pstore/platform.c:134:20: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     134 |         if (i >= 0);
         |                    ^
>> fs/pstore/platform.c:134:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     134 |         if (i >= 0);
         |         ^~
   fs/pstore/platform.c:135:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     135 |                 return i;
         |                 ^~~~~~


vim +/if +134 fs/pstore/platform.c

   128	
   129	enum pstore_type_id pstore_name_to_type(const char *name)
   130	{
   131		int i;
   132	
   133		i = match_string(pstore_type_names, PSTORE_TYPE_MAX, name);
 > 134		if (i >= 0);
   135			return i;
   136	
   137		return PSTORE_TYPE_MAX;
   138	}
   139	EXPORT_SYMBOL_GPL(pstore_name_to_type);
   140	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
