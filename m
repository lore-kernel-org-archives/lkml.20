Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427630;
	b=FNbKE9uVhBmrWVQN9Qzg+HCKJwy+G++W4a+o5uq7ZDaw71arCDzLc1QNnNfDUJs3Gcmm
	 QKo3/nsWSf9Mk9iw90VIyk6L/y7t/Vsn7mco2MXeSarbdFyRYCyw58IkKOXsh+9YnTR3M
	 GChmJuP6NPK9dcaRvX9l+fS0wVGPDrJq3r5RNwgPe9uNoALy1k1vKtagAEka6q96C/dzb
	 7dF/ze9Corp0mDKCaFMpHyYRRblWOtht9ncNor0Yp7VOVJcgY08DR4jwidgyHZRNDB5MP
	 kiAjdaYxu96bqOco4oF/f7gUuEwEbeVJw6owW5+lmJgfAEUdJo2t3LmnMsXTqIGdxJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427630;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FCM1K1Lzt3D0zmsTCHUcpO8MNxqeg9mYA4gQx+9SCgQ=;
	b=ll02Cj0Q6h4Q5kVISKAIEgrauvTXppTdCwIx9TREP6jMsE2uJxU5cToW8w/YHvqsWFAY
	 S1EdbQ3/RPXwGPKRnwsoyuH56tqjiE9tggjPd/ogkv+Jc2QS9ZrsMfb5ysroldXw2j2H8
	 xK21nDAv5C2Yg8kKRV/HH0T/pGEC5OxdqaWJpWwcL+8cwBanqn90rLEB8xp71BhupY78k
	 6wfX/f1DoB/JZTjhIE6nhXKx/25EjjpTwRAxNbQWbXbMV3SJgCzcaLSIRttt20FMaUTM3
	 eAXS/2v7Qa30bOgA3ovK3GZJCJAf30lKB1zBiQIDRCfxTYg+akbcJZPn8ofB/tOmUNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gplWS6Al;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7A4606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gplWS6Al
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792427629; x=1823963629;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OjN9Wt06p2DsSreJuBDjG7n5naGN4wBAOpAlfbkRAgg=;
  b=gplWS6Al78dbQpc1nQfqoRkSrIeDLCfp1dWPZ7RsZUPqgyQ9svpNgQ2z
   iTZzreldTqc3GHJtnU35rWthY+07QIeC/WorxE3LfFHU9weUtVnsBOeEm
   MMkmhxF28G7PyY9/oXnmrld2vp0Z27nQ4fWWZbqLqkaBa25CvX8M3zwle
   ubqxe0OhdldkqnbpwEnkaGF+0LCEFhLSSaGS1ykeEdIulzLOOacyNFW7N
   HM9rohJ/LA1TG/vYuQaCqaILlELMvyXm4H2TuiLUuhnh/Y0qfc2rNywEM
   U6b2Di454+SFEvPO5DHX13LapFuITx2MH3zRcT6NjLiIoOQ8Ama5S/Tv7
   Q==;
X-CSE-ConnectionGUID: CGSX6gmmRhKJ+ypMKSUcDg==
X-CSE-MsgGUID: tRiOPShnRVCv/95g99xVDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1117629"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1117629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 09:33:49 -0700
X-CSE-ConnectionGUID: gKDlUNUMToS5+3UKjSMYEg==
X-CSE-MsgGUID: QzeggrYuSWaIUzPWJjTMUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2521866"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 09:33:49 -0700
Received: from ray2.intel.com (unknown [10.125.111.15])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 3D35A6393;
	Mon, 19 Oct 2026 09:33:49 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/tdx for 7.4-rc1
Date: Mon, 19 Oct 2026 09:33:47 -0700
Message-ID: <20261019163347.1916031-1-dave.hansen@linux.intel.com>
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

Please pull some x86/tdx changes for 7.4-rc1. There are two high-level
things going on here.

First, TDX host systems currently consume ~0.4% of physical memory for
their own memory metadata.  This is all-or-nothing; you either pay the
0.4% or can not use TDX. A new TDX module feature (Dynamic PAMT)
allows this metadata to be allocated for 2MB of host memory at a time.
This, of course, saves precious DRAM when TDX utilization is low on a
host.

Second, the TDX ABI has fixed-size "quotes" that are passed around
during attestation operations. These 128k buffers are far too small
for post-quantum cryptography where the quotes grow substantially.
The TDX module now has the ability to enumerate the sizes of the
quote buffers. Plumb the new size enumeration into the kernel.

--

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_tdx_for_7.4-rc1

for you to fetch changes up to 5b8212d45d99b77c84e3ad305a295e9e65d5ef20:

  virt: tdx-guest: Make the Quote buffer size dynamic (2026-10-02 09:04:01 -0700)

----------------------------------------------------------------
 - Enable dynamic TDX memory metadata allocation (DPAMT)
 - Allow more flexible quote buffer sizes

----------------------------------------------------------------
Dave Hansen (1):
      virt: tdx-guest: Remove unused and confusing function argument

Kiryl Shutsemau (2):
      KVM/TDX: Allocate PAMT memory for TD and vCPU control structures
      KVM/TDX: Get/put PAMT pages when (un)mapping private memory

Nikolay Borisov (1):
      x86/tdx: Restrict attestation exports to the tdx-guest driver

Peter Fang (6):
      x86/tdx: Take the Quote buffer as a generic pointer
      virt: tdx-guest: Give the Quote buffer an explicit type
      virt: tdx-guest: Calculate the Quote buffer size safely
      virt: tdx-guest: Add a helper for the Quote buffer size
      x86/tdx: Add a helper to query maximum Quote size
      virt: tdx-guest: Make the Quote buffer size dynamic

Rick Edgecombe (8):
      x86/virt/tdx: Simplify PAMT layout calculation
      x86/virt/tdx: Allocate page bitmap for Dynamic PAMT
      x86/virt/tdx: Add __tdx_pamt_get/put() helpers
      x86/virt/tdx: Allocate refcounts for Dynamic PAMT memory
      x86/virt/tdx: Handle multiple callers in tdx_pamt_get/put()
      x86/virt/tdx: Add APIs to support Dynamic PAMT ops from KVM's fault path
      x86/virt/tdx: Enable Dynamic PAMT
      Documentation/x86: Add documentation for TDX's Dynamic PAMT

Xu Yilun (1):
      x86/virt/tdx: Formalize SEAMCALL leaf version encoding support

 Documentation/arch/x86/tdx.rst              |  21 ++
 arch/x86/coco/tdx/tdx.c                     |  25 +-
 arch/x86/include/asm/kvm-x86-ops.h          |   1 +
 arch/x86/include/asm/kvm_host.h             |   1 +
 arch/x86/include/asm/shared/tdx.h           |   6 +
 arch/x86/include/asm/tdx.h                  |  27 +-
 arch/x86/include/asm/tdx_global_metadata.h  |   9 +-
 arch/x86/kernel/asm-offsets.c               |   1 +
 arch/x86/kvm/mmu/mmu.c                      |   4 +
 arch/x86/kvm/vmx/tdx.c                      |  99 +++++--
 arch/x86/kvm/vmx/tdx.h                      |   2 +
 arch/x86/virt/vmx/tdx/seamcall_internal.h   |  19 ++
 arch/x86/virt/vmx/tdx/tdx.c                 | 437 ++++++++++++++++++++++++----
 arch/x86/virt/vmx/tdx/tdx.h                 |  10 +-
 arch/x86/virt/vmx/tdx/tdx_global_metadata.c |  23 +-
 arch/x86/virt/vmx/tdx/tdxcall.S             |  10 +-
 drivers/virt/coco/tdx-guest/tdx-guest.c     |  82 ++++--
 17 files changed, 635 insertions(+), 142 deletions(-)
