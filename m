Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818243;
	b=hlaVNM3TqzqczCW6LQksYNXR0lDfh6lSinJzXzuIkEfvyC/ygwPLCsMaW9Wxq9q69BDA
	 1knKATcvRWPYmOB212FoNtrT/BkQ5790LOay4+Vb5Z4pYMhNAewSjVFEyOWaBpzdpFsC8
	 cakMyODH1qrqBBC//F2pK/zgkGDh4csOefgZrXnCiJdDUc8hulI81Dptv63EVI6FNV/Tv
	 oD4eAAtvhb1Geb45+lN47jS1tjkd+UoapdkGKbQ34TL9JswuHPQkdJbTd9UNO2IC2bCLM
	 ohAQm+2qlRH6yPuw3BBPfUyY5n0g6d4IiXTcEgDVVUQcndPwa5crd3NwV/5lVrasi8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818243;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=L6T8gW3S1f4R0Pw7poTzXFjgIl4BGxazz/oeL+D2GqA=;
	b=0cbkP1BHZ+5UT3L6uprwpn/uGoeh58TC90hxjQ05IX2mfOzYoi1oAhltbMH14gs6W3XQ
	 4fvKc37qRO0j0U6pRSBDA39WcJ2uK2Nl4GqlRL6H2i4Z4l5iUlMYH5QPcECO208mN5h13
	 YfSeOLe4IDP5a0OUHZY8I4Qv5p+ZsivROqjpnqmAQKiUE3n0UkIuv58R9EN4TD8OieyHA
	 MP5DQM3eCgE7tQE9uWv2oMf+fAg4L/2rOBQyg8NEnkLqSC0sbJGk3U2ei8GhA0Zv6h/j6
	 lL6hOgCDp1mzH8dbD2UlGJTzdsH2aOPIDoTP0tG6/VYQy2ZokXIwnDqZUiiJB4Vrc3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LQFsPaaX;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EA86082BD9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7EA86082BD9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LQFsPaaX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818241; x=1825354241;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j9s160lteFL8TkoUy0Rh4lmzZFIMrSBAOhWCacdaC2M=;
  b=LQFsPaaXhB7NodO/487LDXiaQCcupB2oEl+b2POgdAJ3blATJuaN3ack
   ZyNflqpBk/4cXbzgY+qZLqcIKTdgYp3ZoqKfiO1oe/HdNLvFLRhDXU3sm
   X6d8POM5EJhLUjBoJpTe1TW8dzp1c8p3X7y4OyIvPA7VjXTlj6Rj1u0mn
   LbBbOqihQlaS67VTKvIbsHoXuwbP+v4YUW8KjLaUFyFVdwmadfn3nZ9BE
   vthtnuYQVE0T3fKc6kkBVbYg8v3yphkCafXmt4x0EV0CFBSr+rmH4ZGpx
   anDD0oLpTm1QxZliECjGtaWS/N99skxJsu32vdtc9oca5pF2s63hz7/oS
   w==;
X-CSE-ConnectionGUID: Itv2yMhhQSSedYpdVOduvg==
X-CSE-MsgGUID: XXcGzH4EQ0yxVgx+5XD5dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2484990"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2484990"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:41 -0800
X-CSE-ConnectionGUID: 2RemUg4cTd+2I849qIdUYg==
X-CSE-MsgGUID: SI+XQp4cRJeQgYSCsKxmpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336712"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:41 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: [PATCH v4 0/9] x86/microcode: Refactor NMI-based rendezvous mechanism to stop-machine
Date: Wed,  4 Nov 2026 18:23:13 +0000
Message-ID: <20261104182322.578066-1-chang.seok.bae@intel.com>
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

This revision has a couple of minor changes on top of 7.4-rc1:

 * Remove the fallback prototype (patch3)
 * Add a comment at the stop-machine's NMI handler call site (patch5)

V3 previously included several changes addressing Sashiko's feedback. For
the background and overall design, please refer to the more detailed V2
cover [*].

I'll first wait to see whether there is any further feedback from
Sashiko. Otherwise, I think this series is getting close to being ready.

The series is also available in this repository:
 git://github.com/intel-staging/microcode.git nmi-stop-machine_v4

Thanks,
Chang

[*] https://lore.kernel.org/20260331014251.86353-12-chang.seok.bae@intel.com

Chang S. Bae (7):
  stop_machine: Refactor multi-CPU stop glue code
  stop_machine: Add NMI-based execution path
  stop_machine: Introduce stop_machine_nmi_cpuslocked()
  x86/microcode: Distinguish NMI control path on stop-machine callback
  x86/microcode: Use stop-machine NMI facility
  x86/nmi: Simplify offline microcode handler invocation
  x86/microcode: Remove microcode_nmi_handler_enable

David Kaplan (2):
  x86/apic: Implement self-NMI support
  x86/nmi: Support NMI stop-machine handler

 arch/Kconfig                         |   3 +
 arch/x86/Kconfig                     |   1 +
 arch/x86/include/asm/microcode.h     |  11 --
 arch/x86/kernel/apic/ipi.c           |  10 ++
 arch/x86/kernel/cpu/microcode/core.c |  35 ++----
 arch/x86/kernel/nmi.c                |  12 +-
 include/linux/stop_machine.h         |  38 ++++++
 kernel/stop_machine.c                | 180 ++++++++++++++++++++++++---
 8 files changed, 232 insertions(+), 58 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

