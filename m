Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284360;
	b=owGsRCu5yo2yZ7TIzdWrpR+I0mEnmYvzFmrs+NOEPZx3meN9w6zdcc/is+XHkpnnIMoq
	 mf2dAGW4nb5Qo3CRF387TQIISwGFseEdNXV+dxpbHUAYFYYzW2WQaLVFzA/xMReeGjrsK
	 5EVfVGgTJQVGAXF6iIFmEojrILLF55OEQdYXCkquS3u22K5v2CzBtiJ8arh94YJ0yKp09
	 A7VPJjjrLy71zPViKZOgp1Wh03E4K2FBSRfFmnHGej88ECNtUKbJsDoHKZxa58wtpGDas
	 8WRv6yc7VVj2hVh/pMc03fP8/yM7Xh8PXVdIwfyItgSiqanalL8p5o0PaffhGxyJNrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gG0BIsp3F32RveUGW6ul6/4p/lJVSGAIllfHJfCYFVQ=;
	b=wDdKFmxPoW8fM4CUrQXUSxxyNk0nXIBxKObbarJ4ehLUM4PVqlDG4C5ZJsy8yl/B3hSE
	 dzPyBRIpIkTBi1A9liTO9PRCGE39N7xTHpBXm2xo6HjoGs0jBgiymLKCMx27/+ko6ms16
	 K5kAedjq3P5D3LJByg1Ueypb2L2UgjgIr1gwY5RXnpknU2L8cgV5lnX+0Y1Mw7rB2d2hi
	 BZ9eh17vb6s9ted/H+08gcH38IQNNezsvRy5BCQSKOqr70rH3WhifTguBvHgSEgomRwO4
	 /jRpwS6oi/uQLtqWU6b0KgDkZMWwJF/qVLgvIWYNxKxcqpww3IPZu3vNSWRxLwp9d+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eHmQP8E5;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989260A2612
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6989260A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eHmQP8E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794284359; x=1825820359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OtdIqlJCzePoc/YWZ7W8qi5SoWYQ8adAJ9eFkSM+jz0=;
  b=eHmQP8E5fxu9qAv98Gl5I6g5eFVMsRtTmXj+aEqLegazSOOs6dl1++Dl
   zUuxHMmRX6hmMlJb4RINRS3c0407f+bfm/s2KnF6nAJSE6MBpZudPoiwL
   1WoKgsdy9ubIt4Krzva4tGT005om7uYwiCwmgfzdt6jr2ES/Qcp5evFwo
   MzGwaYuC8En/jDp3PFqi4ThnARkj4DyusjVdVVEq2nLDD+LFm9Cw2WN8Q
   bUW/dHHBLpqhrDgxMpnzxi0sc+ZXTHDXq5xbp04afIq1j9T4rOMxoBUIe
   SsEHTgTJP130E8Xhcs3NKHjCqfnXBgXGaAQSpslqhG07PUALjPYiCawYs
   A==;
X-CSE-ConnectionGUID: zzi4lqw8R4eeCAhL2YsIsw==
X-CSE-MsgGUID: MSS5DeeTTHiQOUxU7dycbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2901296"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2901296"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:14 -0800
X-CSE-ConnectionGUID: bSY4sNg1QIyG4blghiHrWg==
X-CSE-MsgGUID: jk+useGmQSm7G6c8Wi35wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7856912"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 20:19:15 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: ben.horgan@arm.com,
	james.morse@arm.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	ruanjinjie@huawei.com
Cc: tony.luck@intel.com,
	yu.c.chen@intel.com,
	babu.moger@amd.com,
	fustini@kernel.org,
	tan.shaopeng@fujitsu.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	reinette.chatre@intel.com
Subject: [PATCH v3 2/8] arm_mpam: resctrl: Use find_component() when allocating a domain
Date: Mon,  9 Nov 2026 20:19:02 -0800
Message-ID: <c79ae06f66ab31db3425c537e765813711f3ceaa.1794283825.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794283825.git.reinette.chatre@intel.com>
References: <cover.1794283825.git.reinette.chatre@intel.com>
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
read lock until mpam_resctrl_alloc_domain() returns. However, the SRCU
read lock is only needed while walking the component list, and
find_component() holds it for that walk.

Replace the open-coded walk with find_component().

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
Changes since RFC v2:
- Add Jinjie's Reviewed-by tag.
- Add Jinjie's Tested-by tag.
- Shorten changelog. (Ben)
---
 drivers/resctrl/mpam_resctrl.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 1b1e724ae040..a75f653031fd 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1648,21 +1648,12 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
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
2.56.0

