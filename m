Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D6568FA8;
	Thu, 15 Oct 2026 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090546; cv=none; b=bYL8p3qdFqBzytWqg9lh/on/uIpUyemhpkwtJTqECdirXPZUP30CxWL3E8s7lRbZ+jKCU1dv6O3VKKgAr3roBm55kUOfhpQtjaX4T11wTCcnXPVRvlHEw6MDIzEpkYglpoVfSX/s2umbJfW7Ud1UNsRz1bt/gAA68DRkHGpAT6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090546; c=relaxed/simple;
	bh=pqrJIUBpl5mAuKbRO7+hTZQ1iqORTIG4pfl/Yx+rYbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GWMi1F80CN97icRnkbwZ4howYx8owKP+9w5xzwI2WUzNl3CiYOvDH1tRoW3HcMVHAnyXvXQDKUDeE4qdKf89YUaTgRnxpKdwWHQPMBCQ3r0oAL1ozwKS8A1VsIGUF9embJX3Tz1yl9APa4020pL4NJuatTwht5vbnU+4afzSFBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2BA7Lv4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2BA7Lv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792090541; x=1823626541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pqrJIUBpl5mAuKbRO7+hTZQ1iqORTIG4pfl/Yx+rYbo=;
  b=C2BA7Lv4M7ONkZBcDwqlC4UcePJl455v91kYtPlDMVnAEGTMsUBX0pXn
   GMKkhUI09RWViRcaBB+ih8eYHNV7ChVQK3WYti0L1LhfZ71OXr7T1Dw1Z
   5cx6RqMO5myThFVlWcRaMHmr00yvvy1NB4e44Qd4hxVtjpwIlo1XSFvw5
   KBWBa0ZyfSjM1W9WLQgqdLt32C2C5740hmUzAd93zQNXqXqMGTrLRclH5
   jJazSjFkA2M/LPFlguYFoYjUM9KDXEfhIJBls/ldY+3Blxu/QHZvYPny2
   wQcieQKIlKFeP7BgqFVl5GGDxUtpjj8kdIzSogY3EzC1Xk180m4fsQ7DI
   w==;
X-CSE-ConnectionGUID: pO0KRYgIQ2+DEmFqIaQUwg==
X-CSE-MsgGUID: n4zwU+wAS56+knc5IUYLmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="764325"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="764325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 11:55:40 -0700
X-CSE-ConnectionGUID: Ba45tiOnSvSwPkoqeXdMeQ==
X-CSE-MsgGUID: 3EmYBhwZRGejLuZUEkv7bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1742217"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2026 11:55:39 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/3] ASoC: Intel: avs: Prevent module info underflow
Date: Thu, 15 Oct 2026 21:02:40 +0200
Message-Id: <20261015190240.729793-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015190240.729793-1-cezary.rojewski@intel.com>
References: <20261015190240.729793-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Typically modules information is first initialized when loading the base
AudioDSP base firmware and then expanded when loadable DSP modules are
requested by platform-components, see avs_component_load_libraries().

While theoretically not possible in a production scenario, there is no
reason to continue the IDAs preparation if an event caused the newly
obtained module information to be smaller or equal than the existing
information.

Fixes: c1a427e8da93 ("ASoC: Intel: avs: Firmware resources management utilities")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index ea14ec173855..f19a62e7e8b5 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -116,9 +116,11 @@ avs_module_ida_alloc(struct avs_dev *adev, struct avs_mods_info *newinfo, bool p
 	int i;
 
 	if (!purge && oldinfo) {
-		if (oldinfo->count >= newinfo->count)
-			dev_warn(adev->dev, "refreshing %d modules info with %d\n",
+		if (oldinfo->count >= newinfo->count) {
+			dev_warn(adev->dev, "modules info underflow, old: %d, new: %d\n",
 				 oldinfo->count, newinfo->count);
+			return -EPROTO;
+		}
 		tocopy_count = oldinfo->count;
 	}
 
-- 
2.34.1

