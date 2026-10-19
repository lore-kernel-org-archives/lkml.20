Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447686;
	b=Jr5inzNWDvNgjJprWjlpzpqVuyQDNIfpDN3LpNvZp2aYgA14VPhdgHycZCHi6DQNz+Mq
	 ox1s7hOjclujXizWYXVp1dJpEi14TuenpYcoUAkeeHY17JCOrzISSVZ0+q9pTNLIJwxj/
	 9nVbNjhvejQTJJgVxuLZxHAzMGO5VJJbyp4LUQBISY1t0BUPWg3lV9pbeHXVyRpMb5c2v
	 qcPrkUD6Gfrtvf4PgstmdnSIS4VxTo1/ZsfRaqNxvCbQ3HvteTR5a9Tqls+kGLl72G64x
	 +Li8+04gwjJjGzXhcri7nY3Jfc/hBa2LBdyj9XFS2FgH7jj9nf/KM1synUZD2HG0zcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447686;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VEnfh9dB8CZN9wOKO/BO/QyAEitVOeSygcI3jJ2ugug=;
	b=1X3uRzcXRM89fRcSjpR8WN3ylUwn77mXPbife/WE2g4mfdsHyscedVzJng8oZECDPKM9
	 ZQtyQ3Nq64ZAkmv46ijwxm0bzaAPhUSmS/+UXAW5M1Vb0Dz01tOPwJqZksaU3JM17k3Tm
	 2wx1AGsYNJvHpWpSlUlglchQyhJH3K9wh+Q5vbDz8n4vtlcFlMHMJourG0kmqk5qnGEE6
	 wWUBO+NtLOzwsb98yhEUGaZFC1OQ3cVLA5+3a0Sp2kv7TOWu2S98Q7Pj89xhS+86Fc4mT
	 +A2UN6KuOIi0gSXdR4LrKWsoNUwkE2t7Ec91yz1F8eI/aqfkiKo0qaM/zlRay/rlAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bH1s1a7A;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD960A2620
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFD960A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bH1s1a7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447685; x=1823983685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K158NP7KXwoHv/mYHuzVJWjCNSLVTUMArbIKw0y5PfE=;
  b=bH1s1a7AnWiI+FLuBca+xK1cDAC2WvOmBxxaQJcSotdm013ekclBNhg/
   4dxiTaFe7wWTTJpln/J8tjnQUFdqPPvW/oqPWCfrTovUsqhEUGZqIYRFV
   Z3X0LjDAZUt/L0Q3icFwBwYu2UF8aSmeF3PpjwfMqKfOakCpsAACaaTUG
   CgueAtIijzqdAXkeGPZ7MVJFn11puLJInWm1fpwfT4dzphctC75MmQfKZ
   l/W8crSPMHVbS/mtBrZoVai63/cOJyh6VeanT9ObjKjAmE/HD8H9w/INU
   sryk9lrDRnhuIzhrleQMoud+PVem2qKxw2Z7fJXryv8R0KNPWEGE+wphi
   w==;
X-CSE-ConnectionGUID: X/TGR2NOQgiMQLTnde31Yw==
X-CSE-MsgGUID: Yi49zq55QGqzb6oV5V6Hug==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144239"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
X-CSE-ConnectionGUID: fM/1IehZSeqREYasocEd7Q==
X-CSE-MsgGUID: 12qscziNQXSJyRoDpGDg1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708355"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [RFC PATCH v2 10/10] arm_mpam: resctrl: Update the comment on monitoring domain setup
Date: Mon, 19 Oct 2026 15:07:44 -0700
Message-ID: <f6080eca2696f4a06777725854447a563aa29696.1792443633.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792443633.git.reinette.chatre@intel.com>
References: <cover.1792443633.git.reinette.chatre@intel.com>
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

The comment in mpam_resctrl_setup_mon_domain() explains that the L3
component IDs need to be used for a monitoring domain because there may
be no control component for the L3. It also describes searching each
event's class for a component with overlapping CPUs.

Neither matches the code. The monitoring domain has its own structure
and is set up independently of the control domain, so whether a control
component exists has no bearing on it. Each event's class must have a
component that contains the CPU, and all components of the domain must
cover the same CPUs, which is stricter than overlapping.

Rewrite the comment to say where the domain's ID comes from and what is
required of the components that back the domain's events.

No functional change.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
Note to maintainers: This comment update is kept as a separate patch to
make it easy to review. It can be folded into "arm_mpam: resctrl: Give
the monitoring domain its own structure" and "arm_mpam: resctrl: Require
monitoring components to cover the same CPUs" if preferred.
---
 drivers/resctrl/mpam_resctrl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index c3ea61a40bb2..61fbde9c0960 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1647,11 +1647,12 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 	int err;
 
 	/*
-	 * Even if the monitor domain is backed by a different
-	 * component, the L3 component IDs need to be used... only
-	 * there may be no ctrl_comp for the L3.
-	 * Search each event's class list for a component with
-	 * overlapping CPUs and set up the dom->mon_comp array.
+	 * The monitoring domain takes the L3 cache ID as its ID even when its
+	 * events are backed by components of other classes, see
+	 * mpam_resctrl_pick_domain_id().
+	 * Find the component of each event's class that contains the CPU and
+	 * set up the dom->mon_comp array. All these components must cover the
+	 * same CPUs.
 	 */
 
 	for_each_mpam_resctrl_mon(mon, eventid) {
-- 
2.55.0

