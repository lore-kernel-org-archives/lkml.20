Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849207;
	b=xwVI3cUIHz8638fB+tuPnDiHlpmdLaR4wvEmGH7KhIN4faoWz+KPfAkSKSoOJlzZdAaK
	 +jwelXTKhntU0LWUNwcTHI9ryAZpNHTSSA1IhjquwFBFuCvSIm+mRskRnKQx7R1ckRBvk
	 LVXYSr51l96MPcIcCm4PdAhTu1+ji8UCFRFINAraerooQ5FHX9XkjmfnOxPOA8vS1xvm0
	 VgR3WYMGTXHYs+JmDyN/Aiads10YHphfM1I30lYcu3TrSXbgFjsQ0eikNL0mgZsfb5HRr
	 lv6Oki1PMjEG1hMLAsZF7LAeuNL4YyPos0cV37/qwSLfHjW7NniwAnILOJwpB2Q8eiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/NOW/qXs95aRKsjKsjGgrNYNVbcGBHC8mynXw6ID350=;
	b=DpxDfn6NhBZGqca0usnqIzQEEv4BcrUhrcRYFHGNjQj7kgnN117oVcCg9y5S1C9Z5XC4
	 Md9N9Vdp43B6or6q/wPK3JAkUhmnvD10mOlK69T9RCnRImMz0n9ha8V+qbfQRpo+gfA5L
	 YBwJbhSJGEcXoXnOJ7JEtNVv1jEvFoxmnuo2iWp/zWqpbWgGebZiKzym/HgULKpgZY5Gg
	 FpbvBvhzT4pGrVTzTs2hwHm0WhnTxHaT3+bmiEGN5T/4U9y5P6nViL/ZVF/ym11a51xUA
	 h6MBz+dcCT0U05XQKGEzyWA0lmUefYZqSXgbJ3W0QqDljMAVSYQ2ExxrUePe0jrRxHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DE4spnhI;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C92606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C92606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DE4spnhI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794849205; x=1826385205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t3WoINdaVyKlum55zxH92IwhkKaLneB3e7GIknMKzGs=;
  b=DE4spnhIiqW1HRwW2sQlQWesTXv4cRuCbYLNNhkSFcyWGmpe+VYCFmCC
   Tkh9gmdItNj93OC6Eq1bjyoEYvH2gavdzAe57LOdIMmaLpXdcCHpygm8l
   5I3D12wksLWyMcIz9vVJst/RF5zAswfzO1w0nGSL/LLYZe/+NSdoQkTJ7
   N2xAgkng4P2BK51dEuE/acJFNxZ6n983H1Oz9Yc33aVKLwawIvkJInOJQ
   BRhEyAI3JrsPfnyCOEKInITy6qeHG9U1BvRK9TLH+YhXo+Sw9UmIrqUAK
   PhUnTOmg05Jlbk/AmPx4gWkAme27Tt2zHJXVs9OEKYHa1NPwKeVoPWGpW
   g==;
X-CSE-ConnectionGUID: Q8xDoYagQgyuE/dGsnHtPQ==
X-CSE-MsgGUID: gdAjC58iS52XZsfBZIpKqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627173"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627173"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:13:17 -0800
X-CSE-ConnectionGUID: hO7CjiKqRn2dTA9E2x0/qw==
X-CSE-MsgGUID: Pl7OGYVGRWi+WK/Hj0MoAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9491496"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 09:13:17 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	andrew.cooper3@citrix.com,
	arjan.van.de.ven@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v2 0/7] x86/microcode: Incremental Loading and Early Minimum Revision Check
Date: Mon, 16 Nov 2026 16:45:41 +0000
Message-ID: <20261116164548.900486-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
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

Hi all,

This series came up with the microcode loading issues [1] previously. The
immediate fix, which prevents problematic blobs from being loaded, has
been merged to the mainline and backported to stable trees. This revision
follows up with two longer-term solutions addressing the underlying
issues.

First, let me summarize the changes since the previous posting [2] in
parts:

  Part 1, patch 1-3: Preparatory fixes
   * Only minor updates to changelogs and patch subjects.

  Part 2, patch 4-5: Late-loading - incremental Loading
   * Rename the approach to "incremental loading" to better describe
     the intention of advancing revisions through multiple updates.
   * Move this part ahead of the early minimum revision check, since
     the check now recommends incremental loading when fails.

  Part 3, patch 6-7: Early-loading - early minimum revision check
   * Keep this part in RFC status for now, as the resulting tainting
     behavior wants more reviews
   * Do not extend force_minrev to early loading, since doing so would
     reject all early loadings on AMD systems.

Below is more detail about the longer-term solutions, largely carried
from the previous posting [2].

1. Incremental Late Loading

  Looking at Intel microcode releases [3], the repository traditionally 
  provides the latest blob. When updating from an older revision, admins 
  may need to retrieve prerequisite older revisions from the git history. 
  This can be inefficient and error-prone.

  Intel will now concatenate prerequisite older blobs with the latest 
  blob together into a multi-blob image. The kernel, however, currently 
  selects the highest loadable revision, or at best one prerequisite when 
  the minimum revision check is enforced. Admins may need to trigger 
  multiple loads manually.

  Instead the kernel loader can facilitate iterative loading to apply the 
  available blobs incrementally. There are some possible ways to 
  implement this:

    (1) One is to rely on the minimum revision check and select the 
        highest revision whose prerequisite has been loaded already. 
    (2) Another is to load the blobs sequentially according to the order 
        in the image.

  Both approaches have drawbacks: (1) depends on the minimum revision 
  information being correct, while (2) is sensitive to blob ordering.

  The approach here selects the lowest loadable revision on each 
  iteration, so that the blobs to be applied incrementally (patch 4-5).

2. Early Minimum Revision Check

  The minimum revision information can serve as a more general revision
  dependency check, rather than being limited to runtime changes. This
  part extends the minimum revision check to early loading (patch 6-7).

  Although the implementation itself isn't complex, there are some 
  user-visible consequences:

    * For Intel, early loading of older patches without minimum revision
      information would result in kernel tainting. 

    * For AMD, the absence of the field could result in tainting _every_ 
      successful update unless explicitly treating AMD patches as safe. 
      To me, it is unclear whether the absence of this field reflects a 
      lack of such dependencies or simply a difference in the vendor's 
      microcode format.

    * Another consideration is force_minrev. Extending it to early 
      loading would reject all early loading on AMD systems, equivalent
      to disabling the loader entirely. Since the existing build-time and 
      command-line option descriptions are specific to late loading, I 
      have kept its semantics unchanged.

  For now, I'm keeping this part as RFC material. Depending on the
  feedback, the series could move forward with a smaller series, leaving 
  this part to follow after landing part1/2.

The patch set is available in this repository:
  git://github.com/intel-staging/microcode.git incr-loading-and-early-minrev-v2

Thanks,
Chang

[1] GNR98. MCE When Early OS Microcode Update to MCU 0x1000405 Release or Later
[2] https://lore.kernel.org/lkml/20260901231634.714144-1-chang.seok.bae@intel.com
[3] https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files.git

Chang S. Bae (7):
  x86/microcode: Avoid spurious base_rev= match
  x86/microcode: Accept a boolean for force_minrev parameter
  x86/microcode: Mark early_data __initdata
  x86/microcode: Introduce incremental late loading
  x86/microcode/intel: Select the lowest revision for incremental
    loading
  x86/microcode: Decouple minimum revision check from late loading
  x86/microcode/intel: Apply minimum revision check to early loading

 .../admin-guide/kernel-parameters.txt         | 11 ++-
 arch/x86/Kconfig                              | 13 +++
 arch/x86/kernel/cpu/microcode/core.c          | 91 ++++++++++++++++---
 arch/x86/kernel/cpu/microcode/intel.c         | 63 ++++++++-----
 arch/x86/kernel/cpu/microcode/internal.h      |  9 +-
 5 files changed, 147 insertions(+), 40 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

