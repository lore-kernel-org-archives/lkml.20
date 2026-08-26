Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C51B4223
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761410; cv=none; b=XYz2DjGeECP38CS7s5MVczm3aB1zgVDflzxmHbgfxXJ4vf/9sSsnwdOK3gC8dz4bDTdKdgDTT5qbp7L3qwk7jQuSGlbNRSk2AEP279DFqCXhfLS3Ixb5OupGB4hpHKb6tC6oyunsHz2c8j18zvrzorJ1TVjnoew6zhkF2Dtw6jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761410; c=relaxed/simple;
	bh=6kzQ95U1YQGNGVH/1wyaYETJmIZw4uwWKvlsrvcnlv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJKRObU+RfCBEvu9jK2qhGpcfs3FWho2TYWb13Mu08XWg2wUPjiw53qW3xVuDdroRrrWwYmUTx9jNIoYVYTiJMtzWrJNSa9XO7ZhVOkhadYcb1eCmT1c9OwDQYq4mCc0L3sTw0ht+mk5ynsCyb/e78uA8xxF4Fv8ZyYQ0Vu/yFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nih8bIuM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nih8bIuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787761408; x=1819297408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6kzQ95U1YQGNGVH/1wyaYETJmIZw4uwWKvlsrvcnlv8=;
  b=Nih8bIuMicgdw6fsMYgnaUW6XkkwwOvLuMUJ3yF7Jqit98sI6BqrgVh9
   KlQBfaETlrrT0rto9DWDebpAUGjXzDPm7y8BdkWZYbzYa8ai965/cDx88
   vEMggOUIqrLJvvCOmrpRC2xIt1MvQO0ctAp3pHDUyDpWmpz5MSL8+PLNE
   inQ7TLYZ+onKPl5BktjReU2+0Lz9dY0+nf7iewaRxUMIf1mXZzG27f1N5
   jwExSjns0K+KbOCaCqGZJCmOiM6ZMn87F0Ypm0egR8o37ILTmw6+0euG1
   h9NRN70XChRP5TW9Az/Wo0JqiMqox+MLtOmM5Dt3s/h8wBoCr34SfXIAP
   Q==;
X-CSE-ConnectionGUID: PAlQ5U10Qg6mQnYt5kU20Q==
X-CSE-MsgGUID: IkzNkp2/T4GcrjVhUTdwOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87378553"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="87378553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 09:23:26 -0700
X-CSE-ConnectionGUID: lR7Q+sj3S6C+exrR/EcD1g==
X-CSE-MsgGUID: sTlQIIJsTYG1G5BfCPibWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="291144168"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2026 09:23:23 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzGPH-00000000837-3X1S;
	Wed, 26 Aug 2026 16:23:19 +0000
Date: Thu, 27 Aug 2026 00:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH] mm: workingset: judge cross-memcg refaults by generation
 age
Message-ID: <202608270037.JUsg3wm5-lkp@intel.com>
References: <20260826075133.751049-1-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826075133.751049-1-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-workingset-judge-cross-memcg-refaults-by-generation-age/20260826-155133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260826075133.751049-1-zhaoyang.huang%40unisoc.com
patch subject: [PATCH] mm: workingset: judge cross-memcg refaults by generation age
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260827/202608270037.JUsg3wm5-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270037.JUsg3wm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270037.JUsg3wm5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'lru_gen_eviction',
       inlined from 'workingset_eviction' at mm/workingset.c:459:10:
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_649' declared with attribute error: BUILD_BUG_ON failed: EVICT_TS_WIDTH <= 0
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/workingset.c:275:9: note: in expansion of macro 'BUILD_BUG_ON'
     275 |         BUILD_BUG_ON(EVICT_TS_WIDTH <= 0);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_649 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
