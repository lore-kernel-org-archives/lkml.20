Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808089;
	b=LZlyVBqQuG9/ds7/Yyb4+8SdVex9Rv1n+cT6x3D/H5H4Rd9ZVtzkZeIPw1aX59muay59
	 XX1hkmedjhgAXP7JS96Aa57FF0XvnmDkVntLsw79dcw3SNgAbtlcdyLhU1Qc0yqjOPcjy
	 3McCRP1uume0YQ2Ubbk6lrMMLoViWtbIAmIikiY1WsQW2UDtEIgatYH3rbYP0etgf81/U
	 rwViEOYFBIYsPvMT4gj5LuRoSPYPe3HBg4RUr2UFh1oc9h+nvtG/oE3TNoNa0GzXzEsLg
	 LKgRINf8X5hQ6zncQRncoIFW0bV+5KEX0L7+Z31mCpfOb4MkPbGmKtQy+LJ509bNtMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808089;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yAuYor1soPIZA7EX+lfFc4BA32TSGeGLXRlLw71DcRo=;
	b=5gtu2ln7PklTD0JW9MZ/vDctTKizztCk+e1mIXJvB5gQhaX9dAAF2gdYyO/lDvv6g5at
	 uw7rJiV4e/4I64c9YTTTJsgnnV99iyvkUOGthF58U+p0W9WiWzEf7cJYwOvyC9m3iqz/h
	 /MCP/IIJ+6rMryXada49dF5GTXFfd2BL1XGVacaYuZza7DpskBYktcTrLNlXIXege6kBR
	 Cd1O01aWuZ04Kj6WzUYpQEzIOdaCwosa/flRsnfFokT/94idDtUrM2HyIYoEONy8Dd+UR
	 Z35LtwIYQuV8rLdR46gzotWwxA1VKlBlqyV+jx1x18XRabwwcyVbqcpDbsOHFJUxZcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IqS9y7P3;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17637606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17637606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IqS9y7P3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792808088; x=1824344088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3vGAHWAWj47J1NUauqlbfdNw4l7B+4Puz5dEkbTphJg=;
  b=IqS9y7P3XVB416zVw/sj+1q3pJRuDIjiOlaUikMd78tD0HTfMv8JTb0x
   gf+wtKIO6RrvHTtmtjI34Z23pI5NrmCWVjrk6inkaRnao3Rf9m9p67FW+
   losQE7vr3cMZCWEA12XYFH8iZai8RAPuOntbHDhXLA0Z5OgrLaqWdrAlG
   FLiaEDPBOwwr+yOqmt//Je+bhNxt0qkfbdonzRh/C33NefFpGP5q+hON7
   DzZWpcTVY0P8wfKK3f2VtZzcntedJu9X/vOxFdUuc4bnmh0UNQXjTc2rZ
   tiM8UdYzKq1sVbtnsC/QUV33g6UEfLcrVuQiEO//pgMGKFawOKHT5sgfp
   A==;
X-CSE-ConnectionGUID: 7AKud0l7TPSbSdk7moUpbg==
X-CSE-MsgGUID: 3kyng34aQpSjy2oGAYNREQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1587782"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1587782"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 19:14:47 -0700
X-CSE-ConnectionGUID: 8mSKeHZjQkCC22iIBpRuVQ==
X-CSE-MsgGUID: meTqIDLFRqyS9kxVhu4S9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3710658"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2026 19:14:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKRHN-00000000TVO-1kwu;
	Sat, 24 Oct 2026 02:14:41 +0000
Date: Sat, 24 Oct 2026 10:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <202610241049.9evBxlP8-lkp@intel.com>
References: <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
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
In-Reply-To: <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 091b06388b117fefdcb63336ac09956a4914b961]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/vsprintf-Don-t-leak-pointers-for-ps-without-KALLSYMS-enabled/20261023-184623
base:   091b06388b117fefdcb63336ac09956a4914b961
patch link:    https://lore.kernel.org/r/20261023-vsprintf_kallsym-v5-2-57ff92187c1d%40linutronix.de
patch subject: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved symbols
config: sh-rsk7201_defconfig (https://download.01.org/0day-ci/archive/20261024/202610241049.9evBxlP8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241049.9evBxlP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241049.9evBxlP8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c: In function '__sprint_symbol':
>> kernel/kallsyms.c:486:44: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'long unsigned int' [-Wformat=]
     486 |                 return sprintf(buffer, "0x%p", address - symbol_offset);
         |                                           ~^   ~~~~~~~~~~~~~~~~~~~~~~~
         |                                            |           |
         |                                            void *      long unsigned int
         |                                           %ld


vim +486 kernel/kallsyms.c

   469	
   470	/* Look up a kernel symbol and return it in a text buffer. */
   471	static int __sprint_symbol(char *buffer, unsigned long address,
   472				   int symbol_offset, int add_offset, int add_buildid)
   473	{
   474		char *modname;
   475		const unsigned char *buildid;
   476		unsigned long offset, size;
   477		int len;
   478	
   479		/* Prevent module removal until modname and modbuildid are printed */
   480		guard(rcu)();
   481	
   482		address += symbol_offset;
   483		len = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
   484					       buffer);
   485		if (!len)
 > 486			return sprintf(buffer, "0x%p", address - symbol_offset);
   487	
   488		offset -= symbol_offset;
   489	
   490		if (add_offset)
   491			len += sprintf(buffer + len, "+%#lx/%#lx", offset, size);
   492	
   493		if (modname) {
   494			len += sprintf(buffer + len, " [%s", modname);
   495			if (add_buildid)
   496				len += append_buildid(buffer + len, modname, buildid);
   497			len += sprintf(buffer + len, "]");
   498		}
   499	
   500		return len;
   501	}
   502	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
