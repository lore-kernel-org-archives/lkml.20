Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853D34E80D4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454641; cv=none; b=QmIko7FbR5uZF3EA9qxqfvfcDrPxf+cOwZRJnYZm7qz/ergAT2l3sNgTbmVGofjL6W3Hd2nLupdOJ1g6YLRTP+VFG9LqoyM6m8Q9VNDCcKohiFdpxsUDU4+HY3uHsUFuk/Q+h14arKlEXz/Vtvwkh62VRicKILgfGgboLWtFdEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454641; c=relaxed/simple;
	bh=YqDDEIlLMHfLW49hrYAJHj/JIRwZMrC9RDUIQ6NbikA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFskqhTpS6RRG73qAzKwHXkcLYCmyqlTayhCBeQw6NXE+u5V57nAcIowrP7VV3I0PA5FdwAGK/mDDiMKltzir+iQMqajEjOTPgmhX6tYNey93oZgfCGuVhsj84UhOUWgtMMTu//WPJCu8zkyF/oZlrfNm7tn0nf8zdt8ItnIS2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7d+zw5a; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7d+zw5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788454640; x=1819990640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YqDDEIlLMHfLW49hrYAJHj/JIRwZMrC9RDUIQ6NbikA=;
  b=D7d+zw5apdD+kSjX9D16kS1fuRm3FPsByuVfWKawv64Q27opgATasQuv
   XMNmDNcY2SNM28puWt5Tq0PsWNjQJmY1hTY/kbpXxRhU5H/Z0VnRLzoB0
   N1wSt4XB1XggY1v/DAYkFjLCeQX6JE+oNGO/KEPyRykJ2qfQmZwtJcli+
   kC5iBs0jYfJyQ5d2NTm5vsqPWvZV9mloSOYc52YEMrIWB2RLahGWM4Wl9
   Mswxn8LsdCjEcyp2FMIMQ69XzRXgaOcSckFXySo4pN5+W5X/pDmyH2avn
   Tj3C54xERGFuMbWOIOqvdSpqgUDGj9cKX5QuCdjYMQtrhS7b8oG4JqbO4
   Q==;
X-CSE-ConnectionGUID: ehyM4GhCQ+KBQ12A9GsoWw==
X-CSE-MsgGUID: nz3EOkP8RD+BhI9SmcGVSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100103959"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100103959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:57:13 -0700
X-CSE-ConnectionGUID: tV/rwvJQRiaAIrLT07Nczg==
X-CSE-MsgGUID: t/fTLb6RSrOWliDDV8ld7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273554211"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:57:12 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: tony.luck@intel.com,
	ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	bp@alien8.de,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	fustini@kernel.org,
	fenghuay@nvidia.com,
	peternewman@google.com,
	yu.c.chen@intel.com,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH 0/5] x86,fs/resctrl: Cleanups in preparation for multiple
Date: Thu,  3 Sep 2026 09:57:02 -0700
Message-ID: <cover.1788452481.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Everybody,

For resource allocation resctrl assumes there is only one way to allocate
portions of a resource. That is, every resource supporting allocation has
a single control in the schemata file that user space can use to allocate
portions of that resource.

All architectures supported by resctrl already or will soon support multiple
controls per resource. For example, the "memory bandwidth" resource may have
a "maximum bandwidth" as well as a "minimum bandwidth" control.

Adding support for multiple controls to resctrl is a major endeavour. [1]
provides a description of the goals with a summary available in last year's
plumbers slides [2]. The implementation is in progress with most recent
PoC at [3].

The cleanups included in this series are the preparatory patches from the PoC
that trickled to the top, thus kicking off the support for multiple controllers
to resctrl.

While this is v1 of the series these patches did make an appearance in both
RFCs of the PoC. Changes since these postings can be found in the individual
patches.

[1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/
[2] https://lpc.events/event/19/contributions/2093/attachments/1958/4172/resctrl%20Microconference%20LPC%202025%20Tokyo.pdf
[3] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/

Reinette Chatre (5):
  fs/resctrl: Drop support for different bandwidth delay mappings
  x86,fs/resctrl: Remove "arch_needs_linear"
  x86,fs/resctrl: Make MSR_IA32_L{2,3}_QOS_CFG scope architecture
    specific
  fs/resctrl: Drop unnecessary is_mba_linear() helper
  fs/resctrl: Drop unnecessary parameter from
    resctrl_io_alloc_parse_line()

 arch/x86/kernel/cpu/resctrl/core.c     | 69 +++++++-------------------
 arch/x86/kernel/cpu/resctrl/internal.h |  3 ++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  4 +-
 fs/resctrl/ctrlmondata.c               | 15 ++----
 fs/resctrl/rdtgroup.c                  |  7 +--
 include/linux/resctrl.h                |  7 ---
 6 files changed, 29 insertions(+), 76 deletions(-)

-- 
2.55.0

