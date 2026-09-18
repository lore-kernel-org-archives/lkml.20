Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9765440315F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774664; cv=none; b=TqsdCBt8r/3bbM/7Va/+dFmzQgEZ9whfkz4j4zZ19xX4ffqUW30sW3NkWDe+xJAeE0vTjbxvYvYy3KtkYO3mlCktCFIbGqwjo9hEVSFTU0+/E83IQZFCgF3VB/sPXWBGqEdr+u/wX0iRVTyV/c1d3KXdPxWwjYpAN5i43wP/ulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774664; c=relaxed/simple;
	bh=ZoklB980vZ7foyZA1dTW0PqAb+8ol1YDfz+U1MRTHfo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=elxyoNR8iwfseASVqVMgSRR6BNkggz+Jybpxb54c69OzUDe+0rUnJUuJgQXzbnCAwIzrvNaCy6FcKYCjgUf1jOQtVBSOkinluvYE/S0LhW1ADGA9Hb0JgH0ZwVfbFTlYlLBNxR0u6ZV6sTv2U5hh2EfZ581OmNUhghhVzqXfTms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfN7C8yt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfN7C8yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789774658; x=1821310658;
  h=date:from:to:cc:subject:message-id;
  bh=ZoklB980vZ7foyZA1dTW0PqAb+8ol1YDfz+U1MRTHfo=;
  b=TfN7C8ytp8b4QwVDgiAvwNZidjbYJZ4lExqkyDVjxAz1rAO9ShjOHXtd
   +wuN1YFIezhxXJ32NoY231RkkgZ03k7RwR9G5PbwGIkamsjNG+6VLLT/Y
   d0r8fSbyALHz+PGA2Ww06OID0dPPUzUdXoV9b4rDNmKd0KyTSJJvG9mMT
   XM9avWl7WRzC5C9ZKp/o7k8fiidDAX3VRoWJvXGetKYWImKej1sUTjxe9
   DWh+m3HHtRnJuk5I5Ypn8hJ7aXpUKbqvw8lc1Yfu6JVWFeZ5go5uySqFf
   rcsqjGbxLWeeaqFQSsil9/j5K59Tk4QW25JIyPSUcWxgk4g2SKqDvbYRz
   Q==;
X-CSE-ConnectionGUID: pM3dtI4TRBGW0PwVS7MtRg==
X-CSE-MsgGUID: I83lGIb8SJyaQgFnwSFYdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90325745"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90325745"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 16:37:37 -0700
X-CSE-ConnectionGUID: AWpbISqjS7yEjCKo2WitoQ==
X-CSE-MsgGUID: kS3E+whcSguV/lguHsuy0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270337842"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2026 16:37:35 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7i95-000000001Ei-2Fb2;
	Fri, 18 Sep 2026 23:37:31 +0000
Date: Sat, 19 Sep 2026 01:37:18 +0200
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: 
 drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c:694:3-4:
 Unneeded semicolon
Message-ID: <202609190106.nposS6Wk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17e7b8eacf4cac800a4fc89a28729df72a2dabda
commit: cbb8e2044b9e936dfa66f1d4a2f835316c741a67 drm/amd/display: Add DC link support for FRL
date:   4 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260919/202609190106.nposS6Wk-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cbb8e2044b9e ("drm/amd/display: Add DC link support for FRL")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190106.nposS6Wk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c:694:3-4: Unneeded semicolon

vim +694 drivers/gpu/drm/amd/display/dc/link/protocols/link_hdmi_frl.c

   669	
   670	enum link_result hdmi_frl_perform_link_training_with_retries(
   671		struct dc_link *link)
   672	{
   673		enum link_result status = LINK_RESULT_UNKNOWN;
   674		unsigned int retry_count = 0;
   675		unsigned int max_retries = 3;
   676	
   677		DC_LOGGER_INIT(link->ctx->logger);
   678	
   679		if (link->preferred_hdmi_frl_settings.valid)
   680			max_retries = link->preferred_hdmi_frl_settings.max_retries;
   681	
   682		/* FRL Link Training */
   683		while (status != LINK_RESULT_FALLBACK) {
   684			if (status == LINK_RESULT_SUCCESS) {
   685				break;
   686			} else if (status == LINK_RESULT_LOWER_LINKRATE) {
   687				FRL_INFO("FRL LINK TRAINING:  Sink requested lower link rate during link enable. \n");
   688				break;
   689			} else {
   690				if (retry_count > 0)
   691					msleep(200);
   692				status = hdmi_frl_perform_link_training(link->ddc,
   693						&link->frl_link_settings);
 > 694			};
   695			retry_count++;
   696			FRL_INFO("FRL LINK TRAINING: Retry count = %u out of %u\n", retry_count, max_retries);
   697			if (retry_count > max_retries) {
   698				status = LINK_RESULT_FALLBACK;
   699				break;
   700			}
   701		}
   702	
   703		return status;
   704	}
   705	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
