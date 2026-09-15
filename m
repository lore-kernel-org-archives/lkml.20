Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7A4C4F5E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499086; cv=none; b=nPx4/OcmtQHQ2elBTIo5rDJovnSvSF8paACA0NghjmVzXbEiP1kD2lkL1+duXp0EsUzqZBALi6i1OlyZr52HL4d03b8ee5O6lb+KEsMHRcjNMz6prULmIR1FH0y8X1j2NwyHQFN08In/u1EPKYnuCFTon5igeMZdEP4mJxnXGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499086; c=relaxed/simple;
	bh=W4myXwi3Uo0D8lzKQ8b7XEK1UwW10RC7hmlCiRHtoyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NwP3eCBuKx0q6dwuz41wqB34K93yNsjWxcmjN98rjC3tyu4gB6sNMJwJ5Oakeum3RnczaEY0UmLBcOpvX22OLkAH1KafWBWA2+ncxWbeqszQK0O/87ZHkI+uHZdKffkyDnSydj3KEiLdzfGrMJP4J4RzR/zAb/h1SUNlYBveh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBR+X9i7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBR+X9i7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789499084; x=1821035084;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W4myXwi3Uo0D8lzKQ8b7XEK1UwW10RC7hmlCiRHtoyU=;
  b=YBR+X9i7nKHOOekndgtSWpyU/G07dk8IHQFLre2Mzh9nfXRthBORj94D
   GDE+NvicSX4+Zi9scoPYJ1gdJlm6IfI2oGJUgn/9UCZjCbKal10AVy+pJ
   VsXDs07P1ARvuHawv2GqHq1U+kTpCqsVip3cMWbyuA729hro0EHpfC7Vw
   8SjjFsXhwkivb2YH7CfI7jrtkgxi5rf3DM4wnae+pwkEk8wxAqtey767i
   siJEp+dInhMQOX/ehT0B06SQ7sPouGwt7ddb8bLznoIniX7twgCVIXFqY
   mgtRg/E6+vFGJrgGzOrakfcLIPYHPcYopK+5DQNaTPayXd3cJlUC44lD5
   Q==;
X-CSE-ConnectionGUID: ZsiuLcHFSpi69u0uX73N2A==
X-CSE-MsgGUID: pfe7olbeRmKkaWeoIvmpHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89813853"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89813853"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 12:04:44 -0700
X-CSE-ConnectionGUID: pMs3VOOySZiXHRNI4eU6OA==
X-CSE-MsgGUID: LABAPI2gSJydRC4SZRDWLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="302983480"
Received: from spandruv-desk1.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.143])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 12:04:43 -0700
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
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH] x86/resctrl: Update documented unit for the "activity" event
Date: Tue, 15 Sep 2026 12:04:31 -0700
Message-ID: <20260915190431.18189-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The unit for the AET (Application Energy Telemetry) activity event[1] is nF, not F.

Fixes: a8848c4b43ad ("x86,fs/resctrl: Update documentation for telemetry events")
Signed-off-by: Tony Luck <tony.luck@intel.com>
Link: https://github.com/intel/Intel-PMT/blob/main/xml/CWF/OOBMSM/RMID-ENERGY/cwf_common.xml#L9 # [1]
---
 Documentation/filesystems/resctrl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..a52cd812c261 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -643,7 +643,7 @@ When monitoring is enabled all MON groups will also contain:
 	during execution of instructions summed across all logical CPUs on a
 	package for the current monitoring group.
 
-	"activity" also reports a floating point value (in Farads).  This provides
+	"activity" also reports a floating point value (in nanofarads).  This provides
 	an estimate of work done independent of the frequency that the CPUs used
 	for execution.
 
-- 
2.55.0

