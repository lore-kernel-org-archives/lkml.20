Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E484B3364
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600414; cv=none; b=ppj+XtBU7Esq+ueDjCF4KPKL78tKlWBtKY6wL7+UzLKL9sVqzW/m3FAmWG3eIdf3axM4lv1/yu4MlZ1lCeX38hvje7/Xclr3tq0NtGoIy1QFFp/W1NYiq93M8aURvmg4VBAqGUDYIxsb0h93zClMBSXPKiaKoGXN+32GwWd/4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600414; c=relaxed/simple;
	bh=SJWp1RNmkTVmRTX4ajftJQ6TmgZ+7cQho1eSP7VnGvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUbDIY7hLIeCKK0Uhkbg3Iz5LVi1ghDJmvAzEJ+1NKTlmoSFxCDz4z4SazdKJ7oUJFh8ZAk8cPVEhYWVBfTYraf6oz+rKHi0SHtlB4tq5YLGiJmGmuiVFmbNRK6pO3qS/K3PaIRfgjsZ2/pZqz6w3YZ7Ej9OHqFF8dMhBnS8iRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJ7BXs0O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJ7BXs0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789600412; x=1821136412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SJWp1RNmkTVmRTX4ajftJQ6TmgZ+7cQho1eSP7VnGvs=;
  b=kJ7BXs0Oz76C7ttxMqpaXjY0oY5CkqFCuZ/LQpOOZXnFtqkxg95wKP8a
   AK/eTHh2kYz39swCbWK+8n+ek/gyZheqCIsdWHPWItLzB40DKrCYVIRDZ
   NnoNFOpPnXzv2IvmyXB3ZdOSY3K692qWYFJLkG8/y0UsUXwKmZyd3nIbs
   EQPrEjL1Fat0iGjIPwfWgeALGIaVmF6UhlcJqMj+wpz9f7D8lkx61iqhC
   LX4XZ0r0gPkCWtnXVt+CaBkayVbCrm67fsML8diCEqrduwjZZl7jk6sCh
   77AJxPs6kyKYaPhZnEIXhRktUpsoqs6uchf0TXqFLtykCdw9L9wKqIdQX
   A==;
X-CSE-ConnectionGUID: J4QFiiavSkS9rXenQVqdMg==
X-CSE-MsgGUID: YG0EommPQLWkvGDB08XKVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861325"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861325"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:31 -0700
X-CSE-ConnectionGUID: 594Vl3cFQtyRZbDeFnEcHw==
X-CSE-MsgGUID: lusfiszMQZCUjSAD4fsGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277231425"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 16:13:31 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>,
	David E Box <david.e.box@intel.com>,
	x86@kernel.org
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v12 02/25] x86/resctrl: Check if monitoring features are supported
Date: Wed, 16 Sep 2026 16:12:57 -0700
Message-ID: <20260916231320.14502-3-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916231320.14502-1-tony.luck@intel.com>
References: <20260916231320.14502-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both Intel and AMD manuals say that software must first check
CPUID(0x7,0x0).EBX[12] (Linux: X86_FEATURE_CQM) to see if any monitoring
features are supported before checking for specific features supported
in subleaves.

Each of the L3-based monitoring features is further gated by
CPUID(0xF,0x0).EDX[1] (Linux: X86_FEATURE_CQM_LLC).

Add checks for these feature bits.

Fixes: cbc82b172638 ("x86: Add support for Intel Cache QoS Monitoring (CQM) detection")
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
v12:
	Revert X86_FEATURE name changes.
	Invert the test for X86_FEATURE_CQM_LLC to avoid adding extra
	indentation churn and keep call to rdt_get_l3_mon_config in
	the X86_FEATURE_CQM_LLC code path.
---
 arch/x86/kernel/cpu/resctrl/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 55214d6fdc49..34ca3c7cc046 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -968,6 +968,14 @@ static __init bool get_rdt_mon_resources(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 	bool ret = false;
 
+	/* Any monitoring at all? */
+	if (!cpu_feature_enabled(X86_FEATURE_CQM))
+		return false;
+
+	/* Any of the L3 monitoring features? */
+	if (!cpu_feature_enabled(X86_FEATURE_CQM_LLC))
+		return false;
+
 	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
 		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
 		ret = true;
-- 
2.55.0

