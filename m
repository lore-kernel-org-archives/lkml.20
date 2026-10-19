Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447685;
	b=LlaF6wpreA+A85gDgJ8V5+BgJw6tC53B3iCCXfa6c00b5HrGjuEEwXFOLT6VJJJqvr0T
	 hVYHd2d81SsYu8SUdAp5FabZVtEMOaWUj+0jnbFicbLYzDq6ZxNtwvKZVLj0/ghzwF6is
	 XdsAHHo0t4NgEmLsSUzrWCI1bbCrfh0k0Vvt+1MTsNrgIwEU8my+gHW5hILmhFU7YM2QV
	 xJXFchSPbVd9uaMcpuzl9for1k+2SQUpJPdNb7F2w4QzNe61T/Fys5D2uQNdZ99CzQAuP
	 tKEszsrR0j1oAkXCLHu+fEQ/+GIfahR1nNvEE0443uWFbPdfvMbV0kq/ddTbzRyo6gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447685;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/FPJ2/D1pxAq4Poeoujsv1hkt1afRQIoxiL4Q5tPTKs=;
	b=LU8+QM5FwHMEj4gSUjrVgR6SH7hJImuY2TPfgTuyO1i4P4UqRXBbSE635b/wngCXa2o8
	 ZpuGdOpTItNQH9BdPXBtpQ5FSFRHKyb3kaYb2Mi2bWmOnszI9ZUWUEW0ScN3pRvusvJCZ
	 fGYFaym/rLFtMlUNowUvILF+rKq61gyp+rH8eTM7fWHmRsWmpbx+GPPbxBDvPuefJxP5M
	 /V+7QlxnK8cgUwqmkbXWVAfx8M7LH6FLMrqlLCqPJC4xP2I3OOBnzuufiWdx9Spxq8LGp
	 GAKh/3uUbiADivQLiHsq71wGuSOQkNEWzckwyhpJ8zIAGw/VHGeMLabBZf+2OU0dIjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LqTbp15M;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8778C60A261B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8778C60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LqTbp15M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447684; x=1823983684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KvuwGj3mCzkgntkJ/PO10vy/kUzqNCehZSltuxALbMQ=;
  b=LqTbp15MHpEOURPIclEyjYvAsUsabI2r0y/xsUcmLLXUdOabsSMg1bwf
   AJr6deVUBTRsBO6Ur7aMQCF9Col0lU9CMJfkr5KTtR/tmIQl4pTJ9jghG
   TOfH+98jvpZkEs3vuohtwDSzMzO6GdC5/6823DEq5vkiwrKY+0sEbcgYc
   FGLiALUimlYz+8Ab/9mBY4LJshcWnMjhL+Ow5lIoRJTVAveZer68lDwpo
   244fxkojIux4csXhv2KUEV/Dw0ge3p3BaOWaZ/Jb1uJG8X6bHA9R3eCwh
   c3UftxRl/S4wsYYGGKvwYBsl3Sm9aBsd6QYHWF+BQcrV8lp70xaqfFwA9
   w==;
X-CSE-ConnectionGUID: 20MKcOKoQGGbVXHBdxZYSA==
X-CSE-MsgGUID: uGrykT6KRkSz9JhgJYr87Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144232"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
X-CSE-ConnectionGUID: 2HgFPwesQ3mnqgPk7B8PGg==
X-CSE-MsgGUID: 0pmN44VhS1WMVZx5J3l3qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708352"
Received: from rchatre-desk1.jf.intel.com ([10.165.154.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:07:59 -0700
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
Subject: [RFC PATCH v2 09/10] arm_mpam: resctrl: Require monitoring components to cover the same CPUs
Date: Mon, 19 Oct 2026 15:07:43 -0700
Message-ID: <a5509d45ef186a273dfc07fdcaae82998a5a4ce6.1792443633.git.reinette.chatre@intel.com>
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

A monitoring domain records the component that backs each of its
monitoring events and takes its ID from one of these components. The
domain represents the CPUs of one L3 cache, while each event's counters
are read from the event's own component.

If the components of a monitoring domain covered different CPUs, the
counts of an event would not belong to the CPUs that the domain
represents. This is not expected to happen: every class picked for
monitoring covers all CPUs and has components that correspond to the
L3 caches.

Fail setting up the monitoring domain, with a warning, if the components
backing its events do not all cover the same CPUs. Compare each
component with the one found before it, instead of naming the events,
so that the check applies to any monitoring event.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 36a924734484..c3ea61a40bb2 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1664,6 +1664,12 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 		if (WARN_ON_ONCE(!mon_comp))
 			return -EFAULT;
 
+		/* All components of a monitoring domain cover the same CPUs */
+		if (WARN_ON_ONCE(any_mon_comp &&
+				 !cpumask_equal(&any_mon_comp->affinity,
+						&mon_comp->affinity)))
+			return -EFAULT;
+
 		dom->mon_comp[eventid] = mon_comp;
 		any_mon_comp = mon_comp;
 	}
-- 
2.55.0

