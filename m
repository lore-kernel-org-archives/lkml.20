Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051851;
	b=S6kKJU6gOTgxRNK08rEIVtsqcex7BImjBibbNjM+82Rp4sohaGajjSkZaV39RejEFywX
	 qD7pskRt/8Ds2puFa3Ku71FnkgVPNQY3mbwHl7O13JjzhR4hj7bF2AMjzS6FQCTC6L3b6
	 lbviYa2QarcMsGMcVBbyC71ZRMf03sTpLWKcB58+mNtxjp4jYPrbHQ39EC4gt0x/N2P1Y
	 rKErnun3TjO3O9wG0XqeRO/bU2fJxenNTQcmTOCwYx/omZ9+sM80YiKCV7uBjtT9qKv9g
	 uNjKeNxzcYwm0RXJZOTY5ZLGAir/tmd8IcVxIlFmv+CR/eR6vSwiF6lxY7prOUMgIog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051851;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cfsbNZH8dxqbw6ZIqSUSYszTlHdENBNZz+ePXNzsHEQ=;
	b=y0wNOnZboNQ3Mbro0YIRB16t3GBF89zF35tcDK5m2qkOfu/aRFh9/0z4XlcHxa1Frzav
	 No8D4mgS2q4XAgyDmyA8g0WZe0WJPWmhKRE+f+7C+le5DV+KBtSTLMQDsnpzYwD7UHvjr
	 HH5kcnM/fZtUTYyE69Lb1cew5K7iZrftn07M0kR0QAqFIARd2BqmeO0dvipcyrEF7VJPL
	 QILyouUt4j0pimBnNwQ2e/Hi8wcHV5KH/sTc+cu6C4X62rDRC/qnqien0+Vn8Mwl430RJ
	 jkmBjt+qPuIcUUkzV95k9NPvjG3Gj5Tl1UVqFwJ6h1bsm67Mja+BOzl3W4pivqkMd2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AEPGHsOR;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38645606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38645606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AEPGHsOR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793051851; x=1824587851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Bla+IdO8QMVJJhHlQiWFw7MSz3t+j7wrvVW49vh0tY=;
  b=AEPGHsORuQvzgV87wlUMFVoU1uNPJC++txIf4Q8jxgh4nW0ozCrOdqvV
   181RJCFYSGE6a4XrcqCXBwNyJEOTx7YTfBDRSWY6dVe+SOMR/LeDG4ghQ
   3XKbehdSieq+qzbpT+v1ZWtpFgLTGnzufL4BfHyxD7sCkv0YX8FIDIJrZ
   B29hElJkc1GNSe8S+dNrE3VFLqJIdMVlICTYysfnysykuXetCcdyBuJl8
   Tuxd/7ki87rRaqKbMy9mKXtUriMOgS0aP2AEP/CVMwqe72TtPYVFEiUF+
   8hDQyIkkiK3Cs8tnVcHx9RBfx72h8qzEhHiu2HMR22CIdfqw8sGHvF2fJ
   A==;
X-CSE-ConnectionGUID: fHHTZdaTT5O76+W6SGuSRw==
X-CSE-MsgGUID: uWLxMwwnS+CVpsEBVV9SIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1766382"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1766382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:28 -0700
X-CSE-ConnectionGUID: qtwsauRlQzSDmFSlLCwFRA==
X-CSE-MsgGUID: +VrZkh01SfKu3oqMW6SAow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4240258"
Received: from khuang2-desk.gar.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.221.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:57:27 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Peter Newman <peternewman@google.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [RFC PATCH 2/8] x86/resctrl: Add L2CAT quirk for Intel Panther Lake
Date: Mon, 26 Oct 2026 14:57:12 -0700
Message-ID: <20261026215718.16810-3-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026215718.16810-1-tony.luck@intel.com>
References: <20261026215718.16810-1-tony.luck@intel.com>
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

Intel CPUs enumerate Resource Director Technology (RDT) allocation
features in CPUID leaf 0x10 if the feature is symmetric across all CPUs
and in CPUID leaf 0x28 if the feature is asymmetric.

But the P-core on Panther Lake enumerates L2 cache allocation in leaf
0x10, even though the feature is asymmetric between P-core and E-core.

Use set_rdt_options() to disable the symmetric enumeration.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7951cfd20da4..709075ffc706 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1128,6 +1128,9 @@ static __init void __check_quirks_intel(void)
 	case INTEL_BROADWELL_X:
 		intel_rdt_mbm_apply_quirk();
 		break;
+	case INTEL_PANTHERLAKE_L:
+		set_rdt_options("!l2cat");
+		break;
 	}
 }
 
-- 
2.56.0

