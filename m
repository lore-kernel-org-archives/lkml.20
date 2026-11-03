Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740998;
	b=KhaOEhvrUUym+kTbZCTXdu0wf3jxzuZeDAggEMUOnRLi2pAe/5nsDotqSalduOqdJ6fF
	 seUNSnie/IJLalIByh6G9bUXye7Oui+trxu4COJoCcdq/rMAHu8Yhimg/XSKSTejwcIdp
	 aXgT8HfIg5UIcjhR7kAWa+TA6yMXb/HUDyvJY/iuS3oBljkoEq8NKD1tujxB1hmFHfwoy
	 8aPfW123Py+bkb6cBiN3k2KHDg67+ZXzJgY4+qaIAStRCIq9GEJjS3uhkyCeyOD7olghW
	 Hc95bGaUN9XPTra/IGGzP81EfJBACHyMqDw3UWxIHCOlvhN2q/w0u+HAzBNuwC7LS3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740998;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3oGDVZCbhDYSAm8svmjDBj8www6GvSfpJIKzPDKRcqA=;
	b=MxDuYzQiMkvv8Jg/g+IrLrkO+VJSdJAUE6OPSu7zPOk66csU8VvHurEWsi3bBGthLTCY
	 cDHxWb/SiEjsVDfM7VQZNzWZ3AtTqaAWZsgGc8kFFdG+1LsAPejSd8U0OFVeUcejzXkTW
	 qDsqF8WMFqydoxrelNWMW4aKmZfNXwsEcsGHt60yxOyrNANImbn85cY1wdLrsPgy+7uFP
	 Aavq9N2NC8R0/vosRlnBP5zzuLW3ZScKZrd9DMohkiAUT9IFiK0zkJ4iPs2Tas4P3fO0V
	 4q8j6iphPLHMJXVVL3PSNyR2hnCcpMbBSbtdN6ldHAPkAOgHhJDWwMgAVOepOVBehWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ICkp2c8W;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB03606D829
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB03606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ICkp2c8W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793740998; x=1825276998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MW56v4zMC4f37LZGqlv+/gFWWRjTDR661pjk1iSp824=;
  b=ICkp2c8Wd/dUGTyhjtnuVJPeHKoKzobmMD749USoeqXqE+wymC71f1PZ
   vP4XTlzHQEob5s8C8VYaAZah/0Hmr7Cx8stKJB9qpV1qp3kLt1ertm0y3
   MnLQNlE/Ta0hz7OQBon2dubHOBEhRrY0rYhSSh820VjpcamynxA6FmQ6e
   XQkucyeay/rIHq6O1vdZ3lDfyFMLqHFaMP7QvMrwY8vwOJxgOFSFewiNm
   eUQZrXGbZacKDed4Z17tV7qOkKcx3Z0UWVdbK5OJSL3Ftiz8S1Snml76T
   HeNCDQC9xJjejDGPm56jPdHDR7eTB9Sw3AA3E/aMM/CToysSyo1zWJYdN
   g==;
X-CSE-ConnectionGUID: tc11yG7UQtGCKvnGu/4grQ==
X-CSE-MsgGUID: jzdrB4ZPQnez2+3P6vrusA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2393543"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2393543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:12 -0800
X-CSE-ConnectionGUID: cmbyD4tfQ9upZJfM21RFBg==
X-CSE-MsgGUID: WakLz13mQza9jxSML+2SoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6624599"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.223.124])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:23:11 -0800
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
Subject: [RFC PATCH v2 11/11] fs/resctrl: Document asymmetric L2 allocation options
Date: Tue,  3 Nov 2026 13:22:54 -0800
Message-ID: <20261103212254.18314-12-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103212254.18314-1-tony.luck@intel.com>
References: <20261103212254.18314-1-tony.luck@intel.com>
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

The rdt= kernel parameter accepts separate options for asymmetric L2 CAT and
CDP. On asymmetric systems, info/L2/cbm_mask represents the minimum cache
bitmask across domains.

Document the l2cat_asym and l2cdp_asym options and clarify the meaning of
cbm_mask.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ++-
 Documentation/filesystems/resctrl.rst           | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..a16f84bed8f9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6460,7 +6460,8 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec, abmc, sdciae, energy[:guid],
+			l2cat_asym, l2cdp_asym, mba, smba, bmec, abmc, sdciae,
+			energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 524ad062a6d9..241461e0612b 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -91,6 +91,9 @@ related to allocation:
 "cbm_mask":
 		The bitmask which is valid for this resource.
 		This mask is equivalent to 100%.
+		On systems that support asymmetric, per-domain,
+		cache allocation bitmasks this is the minimum
+		mask across all domains.
 "min_cbm_bits":
 		The minimum number of consecutive bits which
 		must be set when writing a mask.
-- 
2.56.0

