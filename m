Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805063D34B1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902411; cv=none; b=qZGnjwc9E6kPkTvoJYU7DeZ0Cf/MHM1lIsKiyQNnbjXJJ5puZt278mKjN+LqMaMNC/HWCMDzU0uI8Ln1QW5Phu5DfSYtVIx7LXX8Jc2SNvLmBbpgjfCe1aQAZsBogPXBXy6hI60JbB2tmPKtlJhWDEW9FJojjJnq/MoqvMTDBfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902411; c=relaxed/simple;
	bh=E6NxuX36PZt+f3zeLBQxG7MMWIUdS98u+723kv1k99g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WeBvim4kawMfX5Zj6QpW9J8n/o0LGRDf58JBNb/VAXuYsjiAd8wPCpje9oiahBsENazSTCvSX39P4jLlnHTDKtlMfeE1oZcefCVQXn3YpGmE/xApByiCBmHClw5MSC4X8LKzXv75hrxEfTnVzr+u7kNnFlCcftCGRgd2WWpdkLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr7+5aEZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr7+5aEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788902409; x=1820438409;
  h=date:from:to:cc:subject:message-id;
  bh=E6NxuX36PZt+f3zeLBQxG7MMWIUdS98u+723kv1k99g=;
  b=Gr7+5aEZngp/pIpwpQuLUZWvNW/YzM8s4PsC10STogFRsNgG/j8Jbszq
   JYCrlHYU4UfmT96CM6YHp0GOXwc3ITPAUJCZwxnf9AupPUTQwL/M60Rtc
   32Au3atlRSgFORdGBkiwm1PHL9Qj4Ot18iJGXystI8diP62HllbEjkGyN
   WBKX0Nqp+rqaLO3CNl5QiLpfJU1utzNVzEMPXx943QzXA8Wo5fHSaJvtz
   /YvG1uBgur65MsuAwaOt+H32i/nLl/nQ/82AIqop59xfMVeB8j/3dXwPC
   65ChN0RYnE8MFq2MaJ5KLPskKLx8F8tvuYblyA7u3MwNgsspwlpgGjbFr
   w==;
X-CSE-ConnectionGUID: EV3T7zLnQoO3mFHPB79u5w==
X-CSE-MsgGUID: movOI490Q2KA+QHokhuRGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114857452"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="114857452"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 14:20:09 -0700
X-CSE-ConnectionGUID: bn+gNUI+Q7SfQC7QTKAx0Q==
X-CSE-MsgGUID: TgUEMCn7T8qIrmed1E1P7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="270627866"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2026 14:20:08 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x43Eb-000000000uF-2T85;
	Tue, 08 Sep 2026 21:20:05 +0000
Date: Wed, 09 Sep 2026 05:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:irq:drivers] BUILD REGRESSION
 0c65a1331928d0207c385f03fb5eba0cfecce0e6
Message-ID: <202609090551.zKv5KUlC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
branch HEAD: 0c65a1331928d0207c385f03fb5eba0cfecce0e6  irqchip/gic-v3: Add Altera SoCFPGA Agilex5 GIC600 DMA32 erratum workaround

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609080548.LJVHAwpC-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609080837.vE9lfq1K-lkp@intel.com

    drivers/media/platform/mediatek/vcodec/common/../decoder/../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
    drivers/media/platform/mediatek/vcodec/decoder/../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
    drivers/media/platform/mediatek/vcodec/decoder/vdec/../../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
    drivers/media/platform/mediatek/vcodec/encoder/../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
    drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
    drivers/media/platform/mediatek/vpu/mtk_vpu.c:299:9: warning: comparison of different enumeration types ('enum ipi_id' and 'enum ipi_message_type') [-Wenum-compare]
    drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- riscv-allyesconfig
|   `-- drivers-media-platform-mediatek-vpu-mtk_vpu.c:warning:comparison-of-different-enumeration-types-(-enum-ipi_id-and-enum-ipi_message_type-)
`-- riscv-randconfig-r111-20260908
    |-- drivers-media-platform-mediatek-vcodec-common-..-decoder-..-common-..-..-vpu-mtk_vpu.h:error:redeclaration-of-enumerator-IPI_MAX
    |-- drivers-media-platform-mediatek-vcodec-decoder-..-common-..-..-vpu-mtk_vpu.h:error:redeclaration-of-enumerator-IPI_MAX
    |-- drivers-media-platform-mediatek-vcodec-decoder-vdec-..-..-common-..-..-vpu-mtk_vpu.h:error:redeclaration-of-enumerator-IPI_MAX
    |-- drivers-media-platform-mediatek-vcodec-encoder-..-common-..-..-vpu-mtk_vpu.h:error:redeclaration-of-enumerator-IPI_MAX
    |-- drivers-media-platform-mediatek-vcodec-encoder-venc-..-..-common-..-..-vpu-mtk_vpu.h:error:redeclaration-of-enumerator-IPI_MAX
    `-- drivers-media-platform-mediatek-vpu-mtk_vpu.h:error:redeclaration-of-enumerator-IPI_MAX

elapsed time: 1498m

configs tested: 49
configs skipped: 0

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm          allyesconfig    gcc-16.1.0
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon       allnoconfig    clang-24
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch     allnoconfig    clang-20
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    gcc-16.1.0
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
