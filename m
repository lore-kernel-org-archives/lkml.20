Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422427;
	b=z030ANQm3zYDBeeWQFv/vVsktfxZFhnnkQzdgHINSpb6dLQFoKdLuD0JiY+euOwYOLw6
	 /AEz/iPvgL5YLjFASa1ELlvI2V2Aw6N11jOSdSZLKzU/IwBxcajZ9r8hqo1CkhUAcLZcr
	 Y56aNj+kFojqMYG3vkL9ImUOfQTrgCe4FJwTPLd/gLzOjVw/14Ez3MqjE5Czx1/aOZ/8Z
	 Azym8+WcVMT89h4gkHJ5fdVV7PfHTjaIDHpQQntQj7YI8PO/mC9ACoaoc2+oZFDmag/SC
	 tB51GEN8yyImSaVDbXOzz6Q7Vt8FP9AIRQBz9ILFgXcS1nH6vg1ur0EuGYbyfBtyZDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422427;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P7x5f5MlO7pba1PkgVjtCCEjTromF+t2NioPL+wznnM=;
	b=uH1OHhu4Ki2N8CatHa2jHsVzzqJOGM5emTZDJvIJDQJXg9rwWM+yFCp38NNLTTbJ21Dg
	 l9Quljbt1DbThcprNGJFlOr6NWCeqoWBYUz+w7iL9adIT3QhHIB+ZLGQc7bsrUamh3YBm
	 /Kx2kW2RiOP1JGkLYCqm74FKJDnjfxbGkzhLQ9OGTvoJjBdsSUekkTBw3v1PwM4ccYCoO
	 fu+d6d09FVcHXTo5OaYmYh5tsZsNqizgaI3VjWLE3JD6BE6csNJY9o6vdvsanqWsnsICH
	 0FGZStyZsvdUpKyRuj/nJ3OTmd0QueTD2RJUSbNHw/2rd/K/IUvaiHMMgfU7crZwUFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X2h2adA1;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE3608340D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BE3608340D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X2h2adA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422428; x=1823958428;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wcn49Qo1huNeK3nocXip69Rn3nQwCMlycN0qZ53oVfM=;
  b=X2h2adA1dibYV9zIwcnAtXxkoe60RjqDf9rONinC94Wn5KMak+WAiRc9
   xMb+qTh7lZl9eCjkO0a2CwYkZEBuGOhEr9Kg7pRdq/fPHDblrM0DXV0zl
   75TOOBqSDc0vHsfC3Q52KLf5BiAjZEbrpK7G+mqtCYBUEvWlNpGXCurJn
   0dBXyeClF0IqeK1f+AsphrDtwTaB9rC5B68lV3pIEO/mZO/OEILO0BK3D
   PS2vwvLjLBBJrBPPNkBASilW1OAS6PhuEjXQ0HPMTFaaJ9nfvuhE4Zah3
   HwvS58aIsP9Du00UwReT43/rmpvW7apNINfCIAzFWTYie+5m0OfoYU/X5
   Q==;
X-CSE-ConnectionGUID: UUAXTDLSRoeRyi3ORr1HdQ==
X-CSE-MsgGUID: xp0+mcxkQyKxm85+g8gh0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1013310"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1013310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:07:07 -0700
X-CSE-ConnectionGUID: 7QshJPX4TQ+/vfdFA9TCPA==
X-CSE-MsgGUID: vL7ITANxQqy4m9A5Ho5JbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2437052"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:07:06 -0700
Received: from ray2.intel.com (unknown [10.125.111.15])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 5AEEB6393;
	Mon, 19 Oct 2026 08:07:06 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/kdump for 7.4-rc1
Date: Mon, 19 Oct 2026 08:07:04 -0700
Message-ID: <20261019150704.1851215-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull some x86/kdump changes for 7.4-rc1. Some kdump code is
using NR_CPUS_DEFAULT as if it were the actual, in-use max number of
CPUs. Move it over to use NR_CPUS instead.

I suspect this one being in-tree for a few years means that the vast
majority of kdump users are on distro kernels that don't drop NR_CPUS
below the defaults.

--

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_kdump_for_7.4-rc1

for you to fetch changes up to d949fa7b1ec54c626b656f873b95d76b8ab0d143:

  crash: Update stale NR_CPUS_DEFAULT references in elfcorehdr sizing docs (2026-09-02 14:25:16 -0700)

----------------------------------------------------------------
 - Resolve NR_CPUS versus NR_CPUS_DEFAULT confusion

----------------------------------------------------------------
Ionut Nechita (2):
      x86/crash: Reserve elfcorehdr for CONFIG_NR_CPUS, not CONFIG_NR_CPUS_DEFAULT
      crash: Update stale NR_CPUS_DEFAULT references in elfcorehdr sizing docs

 arch/x86/kernel/crash.c | 6 +++---
 kernel/Kconfig.kexec    | 2 +-
 kernel/crash_core.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
