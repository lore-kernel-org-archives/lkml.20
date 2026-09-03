Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE740415F23
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433359; cv=none; b=Ps0EGCmmvUdE55sRug3Wjz5MwMkq53xlyTUaNemsOl2o1eoYgUfhwZPIEBc3dW5R6DCzp4e3ZoSkPzUpQq5UjX8qG0F8wRQBsD43AKIGGJRrINZj9lGDGnO9pA1Rq9wedXyRhbdSAif2CD278LUnTo+zTKb0VffDmJVouTa/0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433359; c=relaxed/simple;
	bh=QWMidPirRXa6F9fmIzFknlhgq28okBEJEXkXiaxIc28=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MMssxu/2Z0X9Mwp8GJmxzUDaj9XmBziMhFxyzJAb1oSp4sIWp1AayCO19FrNn35XJHdItsaA3S+0Fc2GVQSbN6Izi6weZVfilGxLLo3b6hidQeSBC35nElwXtFDoAju6/dDmHuqoLoCMg15nL7Xfp+CvKTr1NZ+OTJ6iuzFDcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eubt7svM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eubt7svM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788433357; x=1819969357;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QWMidPirRXa6F9fmIzFknlhgq28okBEJEXkXiaxIc28=;
  b=Eubt7svMsaN3Fx3F+jn0f6wk6a0e8DlvtHppbVTZ03+QHcGdWa9BvcHd
   M5GzPJaAIAKfUVtNOUcZecdojI5KwOUt1JZNDNs//INt9aLAea75uVvkO
   Lczs0VFIICehcGG4hk2WFTg8sJdp0SVDnkm77BrWpsf7YqIvhY9N4R1RA
   8XNYnjYfOM2YvXGEv6p0Hq6lhMm/6jREcs41DQ+6TINQrSBqTOMji3X7A
   ykoJ9KKjr+DgsXm9/PbcDfclkl2QFsXozA+peTv+G0MBSjs2iGE45bK/d
   pAP1VpTnEAZStOGw5hSfgq8PN/CM4quEw7RZ/0xY6tfC0RuaBIibpKYYG
   A==;
X-CSE-ConnectionGUID: /jYvxgECSeaizW4tf+Vlbw==
X-CSE-MsgGUID: dz0mePjGQya0BEi7daWPOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89033552"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="89033552"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:02:17 -0700
X-CSE-ConnectionGUID: ULxSbh1DSgeVIm2OtMKFVg==
X-CSE-MsgGUID: JE/+53GlQqyA4fJUOyV/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="267098636"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.119])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:02:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Sep 2026 14:02:09 +0300 (EEST)
To: kernel test robot <lkp@intel.com>, James Morse <james.morse@arm.com>
cc: Ben Horgan <ben.horgan@arm.com>, oe-kbuild-all@lists.linux.dev, 
    LKML <linux-kernel@vger.kernel.org>, Zeng Heng <zengheng4@huawei.com>, 
    Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
    Jonathan Cameron <jonathan.cameron@huawei.com>, 
    Gavin Shan <gshan@redhat.com>
Subject: Re: drivers/resctrl/mpam_devices.c:1860:35-38: WARNING: Suspicious
 code. resource_size is maybe missing with msc_res
In-Reply-To: <202609030809.ObirDhR3-lkp@intel.com>
Message-ID: <555e6b9d-cff8-ef10-42e9-5e469550292b@linux.intel.com>
References: <202609030809.ObirDhR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Sep 2026, kernel test robot wrote:

> Hi Ben,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   89a312991dc6e638a36adc43ccb91dbc25504c04
> commit: c544f00a473239835d22e7109b403314d8b85974 arm64: mpam: Drop the CONFIG_EXPERT restriction
> date:   5 months ago
> config: arm64-randconfig-r051-20260902 (https://download.01.org/0day-ci/archive/20260903/202609030809.ObirDhR3-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c2cffa015e9549aafba9e514384b08204c7cc4b)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: c544f00a4732 ("arm64: mpam: Drop the CONFIG_EXPERT restriction")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/resctrl/mpam_devices.c:1860:35-38: WARNING: Suspicious code. resource_size is maybe missing with msc_res
> 
> vim +1860 drivers/resctrl/mpam_devices.c
> 
> f04046f2577a5c James Morse 2025-11-19 @1860  		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;

> :::::: The code at line 1860 was first introduced by commit
> :::::: f04046f2577a5c76167333ca99d3903ee5331ba0 arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
> 
> :::::: TO: James Morse <james.morse@arm.com>
> :::::: CC: Catalin Marinas <catalin.marinas@arm.com>

Hi all,

This report has some validity but the code doesn't look buggy as is, just 
off-by-one errors correcting each other. The variable is called "..._sz" 
(~ size), but the resource size calculation is off-by-one because trying 
to do it by hand instead of using the resource_size() helper.

The mapped_hwpage_sz value is only used for register write offset 
sanity checks, which use > countering the off-by-one error.

IMO, it would be better to use resource_size() and change those sanity 
checks to use >= instead of > but this doesn't look a major problem by 
any means.

-- 
 i.

