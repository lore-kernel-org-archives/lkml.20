Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235D4A8A39;
	Mon,  7 Sep 2026 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785800; cv=none; b=kcZRHz2pujfsUvac05hpEX1QDtIlCRrYdU+DruzjwfLogurdVPcm9/Tw/FgDKh0/6+G6aVPOOoM1dgq0DxlHG7ze3cDtavcjHjKW7KEdY7vKbUh6eLKcurQ3/r23ZLaLNC8oKaiYDiMlW9O+boO20o6kZKk/ubTzo3ETsXs2Vgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785800; c=relaxed/simple;
	bh=xTp0ovGp9AgiCWE0K7ZaMew8XLRrc3rgjybG078vnXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij+tuWJ1xmrZX3MZXTHjBRO5QyAwpti74coYCQGtGsvphNL3A4AQa0bLx+3FhLRB6fGE5jhxCJobz+0NsBCHKQ8ni2m8rHjeaWA8qUVminyXu9kvH3xw7ucinCfBAZdSlVZXtCeSb47oA0lgDadvGk8bSHOy0JhMYdHdyrj1EP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qq5xi02Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qq5xi02Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788785795; x=1820321795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xTp0ovGp9AgiCWE0K7ZaMew8XLRrc3rgjybG078vnXI=;
  b=Qq5xi02Z7ydH33l+2S8wnFqp2MsjYciUOTfuxt5nwoDWbsDegI8eqCT+
   cF+a5ggAx6njZeIxzUQQziELFkc3WAG1lSFsW2Ow22SwqVwho8GDnEXnQ
   gB2xwdYMK2HYmpFg/pFYrLqQWw0/9UAua8X1uSjMxFITPARvFcP+YDKVg
   AzCACuAkD3YolDyh600PlHnJJtsBUgHtXXMFpuaMbRN2l/oFwoX5nqMUU
   ehyJkFMhii2VzdBoPixvIx0T9hcmy/rj99yYJm0o2jQgYyTjnHpm61IE8
   iVJ7bYxRzXaSjSv3nAmnYwHPC/p9JSnMDvPZ7rAOdpKKK2dcMV+SrjAJ8
   w==;
X-CSE-ConnectionGUID: XPYNhALBSleFIbMTPISfSA==
X-CSE-MsgGUID: PIZDhBIQSrm87QYIK74qAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106556893"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="106556893"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:56:25 -0700
X-CSE-ConnectionGUID: +OeTyeTFQrGrlp3FpHc+3g==
X-CSE-MsgGUID: i+J7wwnkTJWExrvjrCGMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="267452684"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 Sep 2026 05:56:21 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3YtX-000000000F4-0PB2;
	Mon, 07 Sep 2026 12:56:19 +0000
Date: Mon, 7 Sep 2026 14:55:37 +0200
From: kernel test robot <lkp@intel.com>
To: Akiyoshi Kurita <weibu@redadmin.org>, Akira@www.redadmin.org,
	Yokosawa@www.redadmin.org, akiyks@gmail.com,
	Jonathan@www.redadmin.org, Corbet@www.redadmin.org, corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, Shuah@www.redadmin.org,
	Khan@www.redadmin.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH] docs/ja_JP: translate submitting-patches.rst (review and
 report tags)
Message-ID: <202609071452.EmRYk0Iq-lkp@intel.com>
References: <20260903020356.1055420-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903020356.1055420-1-weibu@redadmin.org>

Hi Akiyoshi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.3-rc2 next-20260902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akiyoshi-Kurita/docs-ja_JP-translate-submitting-patches-rst-review-and-report-tags/20260903-110356
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260903020356.1055420-1-weibu%40redadmin.org
patch subject: [PATCH] docs/ja_JP: translate submitting-patches.rst (review and report tags)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260907/202609071452.EmRYk0Iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609071452.EmRYk0Iq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Relational referents
   ~~~~~~~~~~~~~~~~~~~~~ [docutils]
>> Documentation/translations/ja_JP/process/submitting-patches.rst:666: WARNING: duplicate label tagging_people, other instance in Documentation/process/submitting-patches.rst
   Documentation/userspace-api/landlock:572: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +666 Documentation/translations/ja_JP/process/submitting-patches.rst

   665	
 > 666	.. _tagging_people:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
