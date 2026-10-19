Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447683;
	b=vyJZUKyddGCuNki6uL5GrBMZQoxdQ4o2WJay6M7lKMFhZfSyyevTrmQKKlT91KZXNmlh
	 o2Mbf4Fa8Ij1JGhRB+fyDxVzgv/PWrXqlDtHjgsnGMskgUF4w+RKJ+Xm9xBKD0Tk2ce6o
	 AJD/Swgz0QKOE0aG856nUhWaRRAjk5+uEHD2Vm9TjIpC1gbdctkpDjt+Sl4Yrlnc1rYkD
	 OExPPnt8UdCwEZTjo7zs/MLcqrER4k3wUTmtEYsAHnJ1bbFV+uS54JFFzrj3l+YnF6WHN
	 xyCGKWxsCNU71yaSgFgM7KFWsfFfPL5vR2aQ80MViedFZqxp1y+qP3gZ/Jpx3raS68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447683;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YeZNYunybcxy/NfWb6jCfz+TaK9LyyfOatz74eHc0KM=;
	b=w9ZE3rxDk8S9L27yJ6+Wc2fWDGo2VM9S9xIP8XV9hVRbGMchjQciqfEJx5alD86KGXCy
	 3K4N9N7L75871LgzPmPLmiMHS7JQ9FvZZq18bf6jeUyLreMeCVdoqx0vK7I1/jyvwlKtb
	 /nzvsSPRM5XybsuX2+1A2oXYRmH9rEOpa227SHxeS/ByYHvoNNRzdOK7AeJNflnffqmvb
	 FKKCFSM0wSW+0ilCStP7/zMiRqnwEq9TTrca8aK6G43bvd8+uw14bGP2h2LFiXwJ4VPfX
	 GjR4hrjlyy+Lm3xpPHUkd4Qse0DephLt/q/XyS0GEVJJtQzN7pGOGHl2DEiXPWK5FNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ns9WH8e+;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DF360A2606
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DF360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ns9WH8e+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447682; x=1823983682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9RK0cTSErpvZvdFlmTLHSVOodu/G/WUGFbYDPDtGi7Y=;
  b=Ns9WH8e+DW9yrnHkeKinqelToZMBCeRCMELnReiVFr51DsE/I5ArPdK9
   bxRrK/CylQXGghSc+HrPMbbjpM3dnQgZgQr9pSDcjGabCUOMF+x5cqcP6
   dQK1wv87dUpNjLYtUh/dtJM/K2tFyRDgoF0Nnhxu/y8WS4axe3sEffPwm
   3gw5sBJyPsIxZSkbEAFOf7kjahEN6vAA5LrcthLROj/L+MIaN7Nd1dM6o
   ZbW8bUtLLOHnKOCcZjduKaiGzGGdl2P0q7cTDDpui/rj1VxY5Q94GgDh4
   uRh6Od0zSHPcJPUo8fdvpZAGiqtlZKopB+P7PlslM+mCrob5XG9Qceb4g
   w==;
X-CSE-ConnectionGUID: waoR8kG5Q5+oaKy5CPVZ5A==
X-CSE-MsgGUID: +xYrlyUpTZ+F+vrTZF2hAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1144217"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1144217"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:08:00 -0700
X-CSE-ConnectionGUID: Jy1DBh7uTJOEd+iqTAl12Q==
X-CSE-MsgGUID: QVEI9MElQH+S/ejUvlxmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2708346"
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
Subject: [RFC PATCH v2 07/10] arm_mpam: resctrl: Warn when no monitoring component is found for a CPU
Date: Mon, 19 Oct 2026 15:07:41 -0700
Message-ID: <1c68a6ae981095ec93250cf0e394bb4df15c7e66.1792443633.git.reinette.chatre@intel.com>
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

Setting up a monitoring domain fails if no monitoring class has a
component that contains the CPU. This is not expected to happen: a
resource only supports monitoring when at least one monitoring class
was picked, and only classes that cover all possible CPUs are picked
for monitoring.

The failure path calls WARN_ON_ONCE(0), which never warns. The
unexpected failure is thus silent and the CPU is left without a
monitoring domain with nothing reporting why.

Warn when no monitoring component is found for the CPU, as is already
done when setting up a control domain finds no component in the
resource's class.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 drivers/resctrl/mpam_resctrl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 022920be1862..63c5bf45856d 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1665,10 +1665,8 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
 		if (mon_comp)
 			any_mon_comp = mon_comp;
 	}
-	if (!any_mon_comp) {
-		WARN_ON_ONCE(0);
+	if (WARN_ON_ONCE(!any_mon_comp))
 		return -EFAULT;
-	}
 
 	mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
 	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
-- 
2.55.0

