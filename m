Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75389346E6D;
	Sat, 12 Sep 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789246895; cv=none; b=Yctgp2XTE60Q0q7hGyCntOLTwCx2OqozOW5jUD04zMgrl724nONbE1H6LCJpSj95kMcA4ffiExGKNm6sbOV3NVihOOzI1B04WvfY25Pq9KffwsRZ/+5UuC96uHMCVyFoOrPiX+Ted9NjImSDmUlrmIORYCkihsnFbzGBdIRf1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789246895; c=relaxed/simple;
	bh=7ZQN5wP2Tr32dcu0+4sTe/s8OVZZ03PGEAKVgDQMBHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHhaUKQUNojDdBnVpdF3RDewnNlRCARAP9pxx6x7VZ0xvGK5XiGiuWCy+fyGaoDGpPuigWyyFPPKyWWYmW0G3nJpHuTSe7WbMUyjOShTbX2Dfgt10PYU0ZrkutrdNUjycWpjVllHVCh1XOtOrUTE67cjBblBEMZme7G9Ojoc5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSp9KBjx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSp9KBjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789246893; x=1820782893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ZQN5wP2Tr32dcu0+4sTe/s8OVZZ03PGEAKVgDQMBHA=;
  b=JSp9KBjxv++tgVFm24EQEqp8I0dGrh1gnIXPVhHeY0ZLiBrs3624NzU6
   53tPSZMtGoV9aVc+HVT6p6hqh6ebdLKKfEWwMmX8jsofjJDw+aQoHDdiL
   4+M8A/CfulDS1ss59OvLDerWjmTtla/0b8z6DYOGjtQ6+8JWaiaofaQZd
   Dz35bummjhFxeWgbJOszdIvfUkkbkQ72c2ur0RJtMi7LRcB5ta+G1lgfO
   +eXJxpzoaPLpcHycfbWkevX3qj7uuxVSne/hlUwWnyFFsd+scGGJqxUH7
   mYs0TytTf+nDpdd/dlOmgOmibBzuOP5Qm5SMcGQsNfpqp8NZvR8UiSgQf
   A==;
X-CSE-ConnectionGUID: i7LYo1+xQQyDzRLyjCjgvQ==
X-CSE-MsgGUID: vRN2spgQRxOgE356FA04Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="99999221"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="99999221"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 14:01:32 -0700
X-CSE-ConnectionGUID: y1H8xjhfSQSHK8+6BQQbZg==
X-CSE-MsgGUID: CsWxyjvLSNu+9+6D8lV6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="489175"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa012.fm.intel.com with ESMTP; 12 Sep 2026 14:01:29 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5UqA-000000003Ff-3jZR;
	Sat, 12 Sep 2026 21:00:55 +0000
Date: Sun, 13 Sep 2026 05:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v3] drm/msm: default separate_gpu_kms to auto
 selection
Message-ID: <202609130459.lk2sYtiT-lkp@intel.com>
References: <20260909-separate_gpu_kms-v3-1-eae64dfbb635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-separate_gpu_kms-v3-1-eae64dfbb635@oss.qualcomm.com>

Hi Mahadevan,

kernel test robot noticed the following build errors:

[auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahadevan-P/drm-msm-default-separate_gpu_kms-to-auto-selection/20260909-191834
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260909-separate_gpu_kms-v3-1-eae64dfbb635%40oss.qualcomm.com
patch subject: [PATCH RESEND v3] drm/msm: default separate_gpu_kms to auto selection
config: powerpc-randconfig-001-20260912 (https://download.01.org/0day-ci/archive/20260913/202609130459.lk2sYtiT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130459.lk2sYtiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130459.lk2sYtiT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "msm_count_mdp5" [drivers/gpu/drm/msm/msm.ko] undefined!
>> ERROR: modpost: "msm_count_mdss" [drivers/gpu/drm/msm/msm.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
