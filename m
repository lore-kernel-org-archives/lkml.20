Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485288;
	b=5DobeSpDCHM8Ro/WDYZtta6frYi1gumjV84MnibPH5Ij19lpW9jXXkDRtX37k8lSvamn
	 vD6w7tTcMSLe/PYa3swuGo92ZbZVsILFHoW1i0vnB4l48N1QPBZjB+M33c/A/imtGL4Q0
	 vhbiqLShhlf+I9Yv7IVg3YncBafYR5tyehuCvI43QsnsL7SSYV3tAm/1XqyvVf+br+LVg
	 rRMgMPFIdRo1ZNqDvZhQzSKXNXWpe8iRoqGF7bEQOs7/l1dEMbGU3oFZx8iGo+YJe7w3o
	 pNF+4JUy6EaaqOr0KLc/2j04S8zqnJUo7T7iOosJY/aEvF9t76JSDLMwNPRztd1jkiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485288;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/hA34P15q1oxVHRSjXvNvkQ68TJynXGDuNUUxf5uJkc=;
	b=pg1wZ8jPsJTzkGMy022DeTFiWWoxMjHNSQma5KZN1ZzJHph1Rz9vIZ/USoWcDECHzfa6
	 JHHcp+GkW8rUIoC/BWfjvz2DFG6TaQYtVmWnuOqRdj20rVionwD/nSU6hlUnJhZYVz26I
	 YCMVZPRl1kg29Ro5MdOxhLa2VLOryJOcTQofnRFW/AcTzjr425AOWJLlxMcKjWOc6Y55T
	 HnZ/7KlZsZirIpB5tPdTp7dxF/t1vPbRPhlzmb5o3qDvKJCTjxEkHleW1xdOhn+nUy+ig
	 YpvyDtHZxTbRE5fjx9QDM2jVuiAsmOQHSrB/hJIDUiJ6QBJjAl+NGJlKK6z75Cg4Osg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nMsrc75s;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E2A606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E2A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nMsrc75s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792485287; x=1824021287;
  h=date:from:to:cc:subject:message-id;
  bh=ZUKD6ieSECuV+YPGYjPpaEVpyTy1JTloXqOkVi7zdro=;
  b=nMsrc75sto/8Tb97uJy7uIOpuMmU/b7nBeMZeMHd9cSXsmtAARSLsS6I
   cZTTuvx+1Xg3cquvRSKIhSq+pnO7nzfYCNnztJhVEVcBFrmyd8456+gpn
   7hVHxcQ9RShW4HNopZ007nJ08q+x/R+F4l2siaBGCp/75JkaNNwx8wpWj
   sJWYhSIBcts/hssBLYym7Lq/yksYAV3Sa27d3p0ZFmtLtFH3CwBkRqIxr
   JztrJRl00uuV8hC7/BpzeiI6tYZEAGGSkBzydCFnbpR5iAJSZNoDCXnmh
   T17mq8cWV7nx4Y4rpiFxYwG8hs2DrBX32+2YC4ADykyhTl2iXYea4a/Ar
   Q==;
X-CSE-ConnectionGUID: vpYJd3+tS6SkDi9Ke66ahw==
X-CSE-MsgGUID: pLB36rIJRf6wgmKubfRqmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1083720"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1083720"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:32:45 -0700
X-CSE-ConnectionGUID: zN4InyR+RaCRJUI7yf2uUA==
X-CSE-MsgGUID: bLNKlF4PQFmFlX7TWP6P1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2652947"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 01:32:45 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ5H0-000000006Bp-02Pf;
	Tue, 20 Oct 2026 08:32:42 +0000
Date: Tue, 20 Oct 2026 10:32:38 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/aes.c:12:1: sparse: sparse: static assertion failed:
 "__alignof__(struct aes_key) <= CRYPTO_MINALIGN"
Message-ID: <202610201027.iEuDB4e6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f47d223627f80cb7a1eb14c585fe6cb35de5e984
commit: 0892c91b81cc889c95dc03b095b9f4a6fdf93106 lib/crypto: powerpc/aes: Migrate SPE optimized code into library
date:   9 months ago
config: powerpc-randconfig-r2310-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201027.iEuDB4e6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201027.iEuDB4e6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0892c91b81cc ("lib/crypto: powerpc/aes: Migrate SPE optimized code into library")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201027.iEuDB4e6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/aes.c:12:1: sparse: sparse: static assertion failed: "__alignof__(struct aes_key) <= CRYPTO_MINALIGN"

vim +12 crypto/aes.c

a2484474272ef9 Eric Biggers 2026-01-12  11  
a2484474272ef9 Eric Biggers 2026-01-12 @12  static_assert(__alignof__(struct aes_key) <= CRYPTO_MINALIGN);
a2484474272ef9 Eric Biggers 2026-01-12  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2484474272ef98d9580d8c610b0f7c6ed2f146c crypto: aes - Replace aes-generic with wrapper around lib

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
