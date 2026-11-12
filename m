Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527062;
	b=PfgQzCvTThUGQ0XZLfxJbRzq2Xh66IWoTWTnHofZNg5rVHhE3AF4ybdu6aXocZcV+SQD
	 68uYIrz3hzG/q9BR8QeTzsB2GI/O3D6zhJImbGq4R2gdsAR5pi+/wc5D43EcekpHnxPfv
	 c0hfkQIbTLzNvqBvpiJ36DSOsXBf4R3Y8nkL5+e4lzbGn7PwpTRVBxUCn0d3+sZ0K4ble
	 eBmJ8IrXY8U9DzZEb63+SstxVtZGJAjkz2rpUGzX+8SJr2eXoO3Y2c5XEymqBOgILTqXT
	 yw7rF36iIZpGvOkzLnpxAQSdrZ1HfXwiXfc4i45/PUL86mPK4vMftVt8msJll+gfbhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527062;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WQBWlxm2m3Z0HVEoNDC0kmJAsoemLXXFW9gm9GIPPMI=;
	b=5aCrXzyo8kTjp79TAmZT0ZLPzgINmD8t0JWgSHWe051Xm3ztm5YfKKDKWw0ZpFR4FfyF
	 10uwVNpeoHlV/YYjVwwoMBv6zz5ZJ7bVGHAcIBjRxRmWLfAYzLv4DqL0MT0noaOVKkWQx
	 hv/f7JmeBA25VJMjCmFePhm5PYdxHo4b2A5JtbxoJ5lzQJ/wXKyEtocYjJj/HF+Eo51jS
	 fgQpmLtOeOXFtWI0+FgBPLvU1XE27eZ6+c30hyrt/FucNECyEeJVSUmjcuH+PZZW6QWZi
	 YIlLmoOFqmB+n2Vt8Sipjekf1DHP6bQSRomDaUZwSrApvUilpyQAo0K8N38vqAsHwKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IZDVBzdu;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B543606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B543606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IZDVBzdu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794527056; x=1826063056;
  h=date:from:to:cc:subject:message-id;
  bh=Ch9c4qaaeoOd+I/PcGaIistAE994Ps2D639xkTo0Kxw=;
  b=IZDVBzdumD4cb6DjRPmohxiuHmFfr4Jfbp5GosOsYFpOz4f1/+h1BVNO
   XzNDI45Sz8O2fRzxr3ytOrlB3qUqspWboaMAbUphV61O9HDCLWYDE6Knq
   UgEaUxU0LzAlL244nuXYI6LchP2mJG4rSU1bx+83ykwCHYQeUW8RZdGrK
   mKv5JnK7KjJpE1uwv1XpUWM/J4S9HMEwjPheUF/aRq1jY5nUPH6QUg+s5
   xUJ2/JJ0ZRbS3fNclWzG0pz7gZgCSI49uoME38dLoNwoGMXAjuzRDyiDZ
   Xadnoja+wSuDqjohIhtTsKkVwWDzYPtquzEBfDmEihdk9a+W7lSZQrj4p
   Q==;
X-CSE-ConnectionGUID: R5Cjc02STWS0EN/GGTxNyw==
X-CSE-MsgGUID: 361fEEA/QPGxaPTuIQCA2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3247540"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3247540"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:44:15 -0800
X-CSE-ConnectionGUID: Hile1Z2jSAuEtf1vCc+xtg==
X-CSE-MsgGUID: 1CvBzMIpTbm5607dFE73Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="10686871"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 12 Nov 2026 15:44:13 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xReSg-0000000129f-3IAm;
	Thu, 12 Nov 2026 23:44:10 +0000
Date: Fri, 13 Nov 2026 07:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Ray Wu <ray.wu@amd.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 _sub_I_00100_0+0x10 (section: .text.startup) -> .LVL3212 (section:
 .init.text)
Message-ID: <202611130748.TnRIrrjo-lkp@intel.com>
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
head:   9d66f26fefacebfeed15de31c1123451a17ff119
commit: 0412b1064a3bd4189eb88d7128ef65b3de9e11d7 drm/amd/display: Cover EDID CEA parsing helpers
date:   9 weeks ago
config: loongarch-randconfig-1001-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130748.TnRIrrjo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130748.TnRIrrjo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0412b1064a3b ("drm/amd/display: Cover EDID CEA parsing helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130748.TnRIrrjo-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1d08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d10 (section: __ex_table) -> .LASF8183 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d14 (section: __ex_table) -> .LASF8184 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d1c (section: __ex_table) -> .LASF4229 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d20 (section: __ex_table) -> .LASF4230 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> .LASF4231 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> .LASF4232 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d34 (section: __ex_table) -> .LASF4233 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d38 (section: __ex_table) -> .LASF4234 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> .LASF4235 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> .LASF4236 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> .LASF4237 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> .LASF4238 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> .LASF4239 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> .LASF4240 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .LLST39 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> .LVUS39 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .LASF9238 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> .LASF9237 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> .LLST40 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .LVUS40 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> .LLST41 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd0 (section: __ex_table) -> .LVUS41 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1dd0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .LASF7333 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> .LASF7334 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .LASF7365 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .LASF7366 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .LASF7367 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LASF7368 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .LASF7369 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .LASF7370 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .LASF7371 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .LASF7372 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .LASF6630 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> .LASF6631 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .LASF6632 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e40 (section: __ex_table) -> .LASF6633 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e48 (section: __ex_table) -> .LASF6634 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e4c (section: __ex_table) -> .LASF6635 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .LASF6636 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e58 (section: __ex_table) -> .LASF6637 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e60 (section: __ex_table) -> .LASF6638 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e64 (section: __ex_table) -> .LASF6639 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e6c (section: __ex_table) -> .LASF7729 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e70 (section: __ex_table) -> .LASF7730 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e78 (section: __ex_table) -> .LASF7745 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e7c (section: __ex_table) -> .LASF7746 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e84 (section: __ex_table) -> .LASF7747 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e88 (section: __ex_table) -> .LASF7746 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: raid_exit+0x14 (section: .exit.text) -> __xbc_parse_value (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dw_i2c_exit_driver+0x14 (section: .exit.text) -> __setup_str_pnp_setup_reserve_mem (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: emc2103_driver_exit+0x14 (section: .exit.text) -> .LVL215 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x10 (section: .text.startup) -> .LVL3212 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x14 (section: .text.startup) -> .LVL3213 (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
