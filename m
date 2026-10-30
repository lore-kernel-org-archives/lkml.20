Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345626;
	b=BUCK/fg6GJTXgplr9z9RS7mI4oEklT+2TrAlcacW++oKFTDh8c55JuC9/iaNZXC4Q2Y1
	 +b2pD86Y2TBhDe0VRzF+BwOvtjf9g497ZIIs6LM88BOSy7yYvzzH7aYvLCUr+lEb7zChU
	 B0RnBXdSzsXzq5G2ZUsFVpr3Z6iSSIqm1Cs+3EPaU/peN2ExnnKfFbbhb42JId4FrRHon
	 KLyKiKENW61YHw+Cm8piHGgkvIRFi2H46KYW3s+iDnDQKcj8+zVthMQ41yOl8Cn4kkfpw
	 y3kD9GPrcTVYpFH2GvNt3M5JN2PbMJpdwSSHudM8GgAoWA43IgOeD8UveZDGYNKlIQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345626;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=l+GxroivXOXnIGiRc6t4AzQb29umfEUWlMNvPoOav9M=;
	b=wIGZ6uviKJS45K1jyAdeszNv/UFvxOUUGSm2JSYY8iIm+e3g+q0NBvaMmKiFSwEqNi7H
	 j39Y+uvPw5p7m91qxjK1CjkIB0C1J1ooJG5I0qxJ4TggzKp6DSYiXWNz7MttuEQrZRU2+
	 uBDGIDA4wgCbwaFV4Wlu/gY1HoLu6TgZAEvoR8yB3mYJyDfIYuHhep5sYqU3JYde1WK2A
	 dhtmfrRis9Grn+yFffiCevsme944gv5f4D6lEtK/pHGrQUuIzMiE3MI1bQDRhtgV7p96U
	 xfjY4yHZcA6P7wXwtaqVDvvN8C2676dE8pS45/PNxiWv/fQAsJZxW6ZAKINBCeqyHKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+Zk9CHA;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C9606A31C;
	Fri, 30 Oct 2026 07:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+Zk9CHA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793345625; x=1824881625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OvL84YuB+sd7nusZ01AizX9eVWHoZzJ3a7z3XIO0Te0=;
  b=J+Zk9CHAT7EXvzBT9XwkWwtA3C1rY7TiOvcjkEGYsx5mGf8EvlqMo6sN
   nblR7YWCB5Fqb8/9+8WVAlw8UU7UvnxcVtlGlQHnz4M+xmd2/l//1tx2d
   g4/KVH6RyVeMAFKzFruXXGZMq3mt3hhod3bAhDBDvsMWLQeLR357I3m0z
   Jz858Pd+JtfMXUXpqJne8+a195vlN+Yg4SS0oF1iFw86aq86C1jWFjXyh
   mxXuwkNH9tE5R7ST8DIRiv/idwknqYd2cR+O0N0I8FbITYlAfM+KUwvNg
   7V2SrOhxKUe1ZN5GaLy94lWKMoenAaIlwEMOY8M/4Nc2ZRc18WXmmkB0c
   Q==;
X-CSE-ConnectionGUID: 7G1VUB0NQfe6K2FGpdzAFw==
X-CSE-MsgGUID: azkmvIflRg2bg6YFsKzpSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2130588"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2130588"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 00:33:44 -0700
X-CSE-ConnectionGUID: n1B27IJ1RvWE7D3KAUe0Vw==
X-CSE-MsgGUID: 2ZzALyrXQKyc25Ph53vDLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5706029"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2026 00:33:37 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMh7F-00000000bRG-1zGx;
	Fri, 30 Oct 2026 07:33:33 +0000
Date: Fri, 30 Oct 2026 15:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: hang.suan.wang@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com, chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com, adrian.ho.yin.ng@altera.com
Subject: Re: [PATCH v8 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS
 driver with SDOS feature
Message-ID: <202610301520.wvw7Vv6S-lkp@intel.com>
References: <d2a662d1b783146e48642dc85c920008a02b433c.1793197438.git.hang.suan.wang@altera.com>
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
In-Reply-To: <d2a662d1b783146e48642dc85c920008a02b433c.1793197438.git.hang.suan.wang@altera.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master next-20261029]
[cannot apply to v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hang-suan-wang-altera-com/firmware-stratix10-svc-increase-args-array/20261028-221419
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/d2a662d1b783146e48642dc85c920008a02b433c.1793197438.git.hang.suan.wang%40altera.com
patch subject: [PATCH v8 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS feature
config: nios2-randconfig-1001-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301520.wvw7Vv6S-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301520.wvw7Vv6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301520.wvw7Vv6S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/misc/socfpga-fcs-crypto.h:43:9: error: unknown type name '__u64'
      43 |         __u64 error_code;       /* ptr to __s32 (out)              */
         |         ^~~~~
   ./usr/include/misc/socfpga-fcs-crypto.h:44:9: error: unknown type name '__u64'
      44 |         __u64 src;              /* ptr to input buffer (in)        */
         |         ^~~~~
   ./usr/include/misc/socfpga-fcs-crypto.h:45:9: error: unknown type name '__u64'
      45 |         __u64 dst;              /* ptr to output buffer (out)      */
         |         ^~~~~
   ./usr/include/misc/socfpga-fcs-crypto.h:46:9: error: unknown type name '__u64'
      46 |         __u64 dst_size;         /* ptr to __u32 capacity/len (in/out) */
         |         ^~~~~
>> ./usr/include/misc/socfpga-fcs-crypto.h:47:9: error: unknown type name '__u32'
      47 |         __u32 op_mode;          /* (in)  */
         |         ^~~~~
   ./usr/include/misc/socfpga-fcs-crypto.h:48:9: error: unknown type name '__u32'
      48 |         __u32 src_size;         /* (in)  */
         |         ^~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
