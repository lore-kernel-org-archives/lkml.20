Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447680;
	b=VYhrjICO22N31NfIgCjkjvs2vpR4nWJToZ+6q/v3453hueMoOwVZcoc3bRf0gzvDvCFO
	 mBSptwyM/gc65FweTEend8BLTsheaCMTord+jL+q94QYu3PDx6k2jXMlaI2bnd52u+1RZ
	 yasikYPI2mNRnhGihJgWLRvg8LJIDFxJw3dfXpofX9QtRUWkRw422P73nlnziqPByy4/l
	 0PrKZjLEchehqiOS+2EGu8KEF2YslAjFd8Ts4rgA46qnTNpN8CPDB/87Znil18Dvjwnbg
	 eu8gftqSORnMe12aV23O3FIrw7mdkaReFWM6pwJL0vetyF5yPzeIAFGUcbqdyD7rOpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yJfu+2Iib6dT3fsdnF/B/ETaJ/4ay7oZ9VYZjnnN23c=;
	b=zYLyIbKQeSodckl0LPmxOEIXUxnUWWrEppqPIUNb58TH857RxCDTqFoPX1OiZdnJwXgD
	 AsbapHKixM/y6eZrt+5AXesMZnKRYpfHZwsL1M7x+vMQZJGsEh29MhIc8Y5Oxsxhq0+4f
	 ca5CnNnXTTSLSgPHQgLNDcwjvq2FECGNPzsYxWqzlXcy8gxLu3RzxfKCTeRg8Ekaf0+wB
	 641uPyrwRd+HU7IK3U/2A+KC1nsbYIYpQBJgnHaXauFuNuWOBsICx8YR96Y7ijwCvF4aw
	 6JAp3rzENlrTt6RdHnHf7Zs0lY3nrJSX4E10Hw4f3jBhueDkT3+k0RyUSuME/Nrx++w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iDZGEbLe;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0030E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iDZGEbLe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447680; x=1823983680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CNkmXAHL2R10yvJMmAd0mxESBPC+RFtt/SPUU/bW604=;
  b=iDZGEbLeu8cwfAEwhvHlziuIWA0BVKC4U54OTqdF2+eXhpONUO4GJeL+
   Ps1jehcnFDUdlisjYSMix8jumc0EHTF6Fe35YuquRsmPkuUGxE12XUrVy
   7yBME0KZ1FrRDvF4lqE8qxTNP+hCskmf94D9WPFLFCukhNITzFVU8aB5Z
   CemNxnHhI/AKQb0T1nhZhaU+Ac8K0IeYyMiUgfByMR0SoF/OXz07U/Hc1
   YTnEMO+9XliASz/jUaQGwlK1RncYp63aNYXv59B9BIBa6NApnGdJacuyF
   sOPhHQejN11axK6xObZy/rDWkowmRuhf7ujbzHIS/CFJhD6dXbLwVnaEQ
   A==;
X-CSE-ConnectionGUID: fxsv0C1wSWOnqMubOwbXEw==
X-CSE-MsgGUID: wpfcvl2PQNecFM0TEU6A9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144174"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144174"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:58 -0700
X-CSE-ConnectionGUID: l53lEktkQGa8P8j5EAg/gA==
X-CSE-MsgGUID: CNu/UWcXTOuo3/1xrXtKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708327"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:57 -0700
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
Subject: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when allocating a domain
Date: Mon, 19 Oct 2026 15:07:35 -0700
Message-ID: <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
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

mpam_resctrl_alloc_domain() starts by checking that the resource's
class has a component whose CPU affinity includes the CPU, and fails the
domain allocation otherwise. When the resource supports allocation, that
component also backs the control domain. The check uses an open-coded
walk of the class's component list, while the same function uses
find_component() to find the component backing each monitoring event.

The open-coded walk duplicates find_component(). It also holds the SRCU
read lock until mpam_resctrl_alloc_domain() returns, which suggests that
the component needs this protection while the domain is set up.

The component does not need it. Components are freed only when an MSC
fails to probe, in which case MPAM is never enabled and no resctrl
domain is created, or by mpam_disable(), which first removes the CPU
hotplug callbacks and thereby tears down all resctrl domains. A component
therefore outlives every domain that refers to it. The SRCU read lock is
only needed while walking the component list, and find_component() holds
it for that walk. In addition, mpam_resctrl_alloc_domain() only runs
from MPAM's CPU hotplug startup callback, which already holds the SRCU
read lock throughout.

Replace the open-coded walk with find_component().

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9cec5843e8fa..3d5f90f9f1f3 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1623,21 +1623,12 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	struct rdt_l3_mon_domain *mon_d;
 	struct rdt_ctrl_domain *ctrl_d;
 	struct mpam_class *class = res->class;
-	struct mpam_component *comp_iter, *ctrl_comp;
+	struct mpam_component *ctrl_comp;
 	struct rdt_resource *r = &res->resctrl_res;
 
 	lockdep_assert_held(&domain_list_lock);
 
-	ctrl_comp = NULL;
-	guard(srcu)(&mpam_srcu);
-	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu)) {
-		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
-			ctrl_comp = comp_iter;
-			break;
-		}
-	}
-
+	ctrl_comp = find_component(class, cpu);
 	/* class has no component for this CPU */
 	if (WARN_ON_ONCE(!ctrl_comp))
 		return ERR_PTR(-EINVAL);
-- 
2.55.0

