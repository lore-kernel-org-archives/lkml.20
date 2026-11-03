Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696727;
	b=0MfVzTCaZbqrveU4AUGn2EpyXucg00iwyAMFzPzAM6lU1di2WtycCt1wCojcjyC/fNEB
	 x7gJ6zuu7SHvhWWl74hCk0ztPoF8qNV9Uf7pGQ6kl6qiPtmGLbVO/NuuY1rCexFybQ5NG
	 N7oQxHFz5rJPEK4cBtA14yjGpQc7Y7rmgubd6YEV1iw7uwSAyD1H1nD8B8UOyw9hrQhg+
	 q3VQ2KVfimBk+IDzCzRZD5M/ZzICWjHIM5ZMVtP8lGt7H8mJ+o10XNdP4M1a9paeB31aq
	 4E7D9yOHGkZQr9uIAHtf84waN0leDaktctnO9m7gB2ClLoDnaOPXxBXKRqjXILDhRMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696727;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SNt5jVDoloT6S+1L8WM/wooWYPjtY2QT2yGTLf38yws=;
	b=ZeTxuZRcRSAcBTw42yAeADjTjCMtx6x/Q5rFTcAaKqkErcbxpHIGW1P+MplVWZi85Mh3
	 DCZB9c/tvRLG7gVQ3zZ+FlEljt/kzQSCINGw7m61FpuRYVKEZgjVjisdiwo5n+rlSaaiH
	 c/vkkAa90Ds23XRC85H9Q9ByjSv4M7cxD35GkUwWgPjgFXzwBqst4To5JAagoS5PN75SH
	 on117QyatFcST3zjKWm5/8oLymjR9LqT4KnCDlwSpsnp3Ze9oRkGDRdqggujMf4nGVVbY
	 dqHAgyq5imhyyvxDk9xkfVxDGRmpZKu7iK/d0wIDyNd7NPhtUNS9acTZeyz3FsOyohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="J/npBvQq";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D020606A327;
	Tue,  3 Nov 2026 09:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D020606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J/npBvQq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793696725; x=1825232725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S/I52vOt0Nmtf1C9ytaONT53Lc9TMYu+QUcuReQGEEM=;
  b=J/npBvQq7JWl6/ExXodRFU7f/00/qgbPRso22MUoLwmaepLLQSuuDl3m
   Lebd2UApZWF7JEV/cmqSUA8bDht+t0ygtQoW1yF7Ncc4UROz3q2e4i7AU
   yytruMqP/abrmZ+VzXILEBl9en5Pa3oLjRv2u1nD4i7VMwlHnMNbV9PKS
   k/UjKNuzyNL8uyHc5+IpwH9z9gNpfuCq7+hhPKmool+5aR87qLXcVohK2
   BBdN+LR5kJ/0PtmXZP4T1a4Z+3V3QSmwT4+JKt7OJYYIvFQSV4Wi9/6m4
   LJxwVyaIK0+SlzQJkj7A6xGdEpHLnwyFDca3BlYmVYiptwWOpxr8VKCOG
   A==;
X-CSE-ConnectionGUID: SxLZnQg6SeG5Efl25bpKFw==
X-CSE-MsgGUID: W0iXkVM/Rw2LWngcLvZyNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2424639"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2424639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 01:05:25 -0800
X-CSE-ConnectionGUID: nAdBXIixQ5WpGI2iZytl4Q==
X-CSE-MsgGUID: w3nhhq5WTO6LlWf2/191OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6216725"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Nov 2026 01:05:22 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOASF-00000000iWe-1tKA;
	Tue, 03 Nov 2026 09:05:19 +0000
Date: Tue, 3 Nov 2026 17:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, linux-kernel@vger.kernel.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	vkoul@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 2/7] soundwire: intel: Allow for dynamic assignment of
 PDIs
Message-ID: <202611031645.nTKIP8TA-lkp@intel.com>
References: <20261102181042.1922005-3-cezary.rojewski@intel.com>
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
In-Reply-To: <20261102181042.1922005-3-cezary.rojewski@intel.com>

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/soundwire-intel-Define-stubs-when-library-is-disabled/20261102-191036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261102181042.1922005-3-cezary.rojewski%40intel.com
patch subject: [PATCH 2/7] soundwire: intel: Allow for dynamic assignment of PDIs
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261103/202611031645.nTKIP8TA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611031645.nTKIP8TA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611031645.nTKIP8TA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/soundwire/cadence_master.c:2049 function parameter 'bus' not described in 'sdw_cdns_release_pdi'
>> Warning: drivers/soundwire/cadence_master.c:2049 function parameter 'bus' not described in 'sdw_cdns_release_pdi'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
