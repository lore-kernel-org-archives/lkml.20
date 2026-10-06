Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985A3033CB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256301; cv=none; b=FTcYwZ/7lFGf0HeXIQoZ57mKwTD/nKIlUWuAJeS3baCLxeflW1oU7b93mSqBv696aGzy708xtQqHWPKI3nOus6v84IogcZ09MpzyWwiaIAMX708H/vToZ0LjwYESjII19Yfu5Pi9LTxPbBOVeqlmC+OLz7RD26VUd+o9wn2G0ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256301; c=relaxed/simple;
	bh=LZsUupJMUfWATvLnwGtWVoUs/NZjFGFZViYkn3Z08YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ems/Lmq8RWRGd1ydAZCyvODDjfq+o9yjIjC1B/POl17lzzLmsyUDOwRiBf4YO50+AzyTDrNIgF/W7naRJ1QNBR5Dt/8N2BI/7TRsgbbUKkP5W6D/hEmwsQccEB6mbp+oKdyUCmhjT8SG4xxHY/0tT6bcoN4kd3UOYoQPbFjl9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C36Dxm0k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C36Dxm0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791256299; x=1822792299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LZsUupJMUfWATvLnwGtWVoUs/NZjFGFZViYkn3Z08YU=;
  b=C36Dxm0k2l01AAM7GYgPxZewLDXyh0FROrjPOKHeW8f5Fx6P+3iJ63Fv
   tP2ZLGec2051f6HSFjKmeg+JuPL4/jZgrEcyVwTbsxLRUN78A6IsEEKaH
   t2ZxON3/f/wFXcMRSF3g9Tkk1ztNdzKu5QrP7Ibl7zDNPy1EXPBttM9pO
   1AUhBehME3XxS2so6OXrLLQAtds+lPUQ6fnGIuilYQ3dEzizMvAHYRNGl
   78gpoxWAhZ5iX4xWczxU/YTOgukNPKwrR5XgXw1RlHShTeiFPTikG+aFv
   G5CVl7WjrwG+0nKU1xLCcsDe/ivsK8sw/U81k7QpciwL5zr8+ENk+Za/t
   Q==;
X-CSE-ConnectionGUID: UFBYL99vTFiPTQRiVOPWkA==
X-CSE-MsgGUID: 6oHObUJMQ/mlzrANsAg/RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="79496963"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="79496963"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 20:11:38 -0700
X-CSE-ConnectionGUID: 6D0m6cTLSq6JZKj4am9poA==
X-CSE-MsgGUID: FHQRB34UTPuqXcszu+9AqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="315026619"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2026 20:11:37 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDvaX-0000000016a-3Htv;
	Tue, 06 Oct 2026 03:11:33 +0000
Date: Tue, 6 Oct 2026 11:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Habil Eren =?iso-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Habil Eren =?iso-8859-1?Q?T=FCrker?= <habilerenturker@hotmail.com>
Subject: Re: [PATCH v2 2/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() in x86_fwspec_is_hpet()
Message-ID: <202610061159.7E9WkD7I-lkp@intel.com>
References: <20261005163213.6515-3-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005163213.6515-3-habilerenturker@hotmail.com>

Hi Habil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v7.3-rc6 next-20261005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Habil-Eren-T-rker/x86-apic-Replace-deprecated-simple_strtol-with-sscanf-for-robust-parsing/20261005-163219
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20261005163213.6515-3-habilerenturker%40hotmail.com
patch subject: [PATCH v2 2/2] x86/apic: Replace deprecated simple_strtol() with sscanf() in x86_fwspec_is_hpet()
config: x86_64-buildonly-randconfig-1004-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061159.7E9WkD7I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061159.7E9WkD7I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061159.7E9WkD7I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/apic/vector.c: In function 'x86_fwspec_is_hpet':
>> arch/x86/kernel/apic/vector.c:700:17: warning: comparison between pointer and integer
     700 |             val == fwspec->param)
         |                 ^~


vim +700 arch/x86/kernel/apic/vector.c

   685	
   686	int x86_fwspec_is_hpet(struct irq_fwspec *fwspec)
   687	{
   688		const char *fwname;
   689		unsigned int val;
   690	
   691		if (fwspec->param_count != 1)
   692			return 0;
   693	
   694		if (!is_fwnode_irqchip(fwspec->fwnode))
   695			return 0;
   696	
   697		fwname = fwnode_get_name(fwspec->fwnode);
   698	
   699		if (fwname && sscanf(fwname, "HPET-MSI-%u", &val) == 1 &&
 > 700		    val == fwspec->param)
   701			return 1;
   702	
   703		return 0;
   704	}
   705	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
