Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231F27057D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100501; cv=none; b=bteNU7iSFAC87OXg5wG00ku0EeqV1Q4niyfboTPkB1QkYWPZ4Pcc0aCewS3MNEk/zr3OHNFHQ9ZNa6LhgGyk91XgqIHXVYp1AxIGlWOxRFXdqiBPFomhdUKMw/l7hXrpKPN3bODUY0BKbl6Dvt9cJBtzy1iiVsQBWhDacnXyg6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100501; c=relaxed/simple;
	bh=EH+YW4yVUGVC7Gm8MWPew6OlYDNDHDM/sWd0yCJvsWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QReN3sOLHiGjRHdJc/yjyxCBiUGLShpw20AQFu2Y+S8ZBsyWxP3FhNmVxY7xh/6rcqjci4wXkGMSH1O05DMeSAqvyKVIEkCto8e87/s7oeVhEpBlge9iKgskHVM3lggK606agA/JpYEnjoiiJeFZ/3RelA9bWFL3h/tWpzr7L7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3yLaJnr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3yLaJnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100500; x=1823636500;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EH+YW4yVUGVC7Gm8MWPew6OlYDNDHDM/sWd0yCJvsWY=;
  b=k3yLaJnrIfFYtB19lbm5RkG0ZHOyTRXF7Cg7l9rSZKdlNvm0N2kzsAmC
   o91dUnREAMkSL5x+/1pW4jP+7rwVVkACUlppXF98Q3tAKPr7ss2Jx0Mj0
   7bvVQuGWbLViJDiL6RlcfF14sxfjyZ3CpLshiCkV7tM6xbp8CylXHGtGz
   rKXAGiEfKMvR5EDOuR5y7uetrI4BePwprZrtpZHCGYmGd75s0Yaaj7E0e
   92ofY345dDapJmwmnq7QAnJUlpHHx3YGASHpydlFDme2/Tg+VYigBy07m
   N2r+BYAy6mdCw6GK622eMnRMEjh4PpiPhVM3myGeYJL2SPpaMLdkdq5y3
   w==;
X-CSE-ConnectionGUID: noM3aiBvRAe6JaukwqBt9A==
X-CSE-MsgGUID: IW4z9YeiSB6/jxEj462X5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902103"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902103"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:36 -0700
X-CSE-ConnectionGUID: WP52e7nMSZ2etsU4cbC6Gg==
X-CSE-MsgGUID: 5dlsOqAfTgSWoHzhbFynDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104357"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:36 -0700
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
Subject: [PATCH v3 0/9] x86/microcode: Refactor NMI-based rendezvous mechanism to stop-machine
Date: Thu, 15 Oct 2026 21:14:17 +0000
Message-ID: <20261015211426.49114-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

First of all, apologies for such a long delay in posting the revision.
This series has almost fallen through the cracks unless Boris chimed in.
Even then, it took me a bit to revisit the series and post this.

Let me summarize the change since V2 [1]. Most of the changes are in the
stop-machine facility itself, addressing feedback from Sashiko, both from
the public [2] and from internal runs:

 * Simplify NMI handling to avoid false handling (patch2).
 * Use internal functions to avoid instrumentable functions (patch2).
 * Prevent use during boot (patch3).
 * Tighten to online CPUs only (patch3).

Each patch includes more detail (patch2-5). I've also noted some thoughts
on the Sashiko feedback where the concern looks less practical (patch5).

The patch set is available in this repository:
 git://github.com/intel-staging/microcode.git nmi-stop-machine_v3

Note this cover highlights a summary of changes only. Instead, V2 [1] has
lengthy cover letter that provides more background and design summary.

Thanks,
Chang

[1] V2: https://lore.kernel.org/20260331014251.86353-12-chang.seok.bae@intel.com
[2] https://sashiko.dev/#/patchset/20260331014251.86353-1-chang.seok.bae%40intel.com

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
 arch/x86/kernel/nmi.c                |   7 +-
 include/linux/stop_machine.h         |  43 +++++++
 kernel/stop_machine.c                | 180 ++++++++++++++++++++++++---
 8 files changed, 232 insertions(+), 58 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.53.0

