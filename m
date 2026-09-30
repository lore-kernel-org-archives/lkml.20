Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1338F515884
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777749; cv=none; b=dyaujv7c60/GuDRleBEhALyoopWkpx8oXmFBYx1MHNx0RcaiR+haS3+KMOkumm52c+5hOo7ljI9bpU4toE8A7MOy33W+YmOQUwer1JaI3jI4iA5Qj9iRTOUBFLC8h1TX9qjpPLg9sgJkFC2Yv39sTUUxOIuwLI8JKCZmri9QBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777749; c=relaxed/simple;
	bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjiO/D9MkVRUooURZLz3yUrRIisTvu5xjDEDU2TpJwkAJRIrHj+49LCw+9QExAB2RE5fsj6/6nqmkZ9xa4njbfnt9/XTBWNjholHgPJaF/r+VlLf9oq7AOOw7vKOXtezo5E3QIyPaGymweR5O0n1OopFj9FIB3IQnW1xcT2FmtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hN+X74ZZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hN+X74ZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790777739; x=1822313739;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
  b=hN+X74ZZwZtX59E3c81ryjQ5mRZ50Xu1rcs2GULPejjztLxRWwrC7nW1
   Zf9vfgK7EPluWcYPpSajYfvPBR6xs1FAka03A1nZIOg0DUV39b4+dVfUS
   r7QDTi9Mbu5ZiOQkD5VdbR6GeOXaVBL8Uy73f5Kl3CAfH9x7jN8nAI1dU
   yu/mzeV3XnwlqaOP5J0JINYyAwPnMSEMZjIJ3aIl9CjswAIF4NzTzXDse
   Osky3PH1jfjCvY1Z/O88WY1mNYbyYyinyOZndRqMlxzoat2MIntKn7LV8
   ZT1F88QBKSMMrtcrMVuHfPKMmogIcqBWJMQ4gGsOgF7ITYGrPv/Tsjr/a
   g==;
X-CSE-ConnectionGUID: AdVWtVzCReqKK98RD7wIPA==
X-CSE-MsgGUID: Fpy0b2XUQjKQtDwQ+dDi2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90470008"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90470008"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:15:06 -0700
X-CSE-ConnectionGUID: fOVCP+umQgCtQQCqJjmfTA==
X-CSE-MsgGUID: TdFU7jRiTDiSb5/IIIHGYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279499634"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:15:02 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 30 Sep 2026 17:14:47 +0300
Subject: [PATCH v3 2/2] drm/xe/nvm: define survivabilty partition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-cri_surviv-v3-2-357aeed5fc60@intel.com>
References: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
In-Reply-To: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790777694; l=2014;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
 b=JvPy//bs0zDBw4pGxJbZY8ZpVFjuqHVy5C93fVA5jAW0TcsKYD53soRLZiE2I2Whnjms8mPR/
 uRjQj4eFtBEDKgxP8+WyvXmH3/7GS/0yzpArkMTk8wh9rdsIdxPSzOK
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Define 8M survivability partition for CRI when
storage is open for write override.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 51a1a431ad85..783c3103a8a4 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -56,10 +56,11 @@ static bool xe_nvm_non_posted_erase(struct xe_device *xe)
 	}
 }
 
-static bool xe_nvm_writable_override(struct xe_device *xe)
+static bool xe_nvm_writable_override(struct xe_device *xe, size_t *survivability_size)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	bool writable_override;
+	size_t s_size = 0;
 	struct xe_reg reg;
 	u32 test_bit, test_val;
 
@@ -68,6 +69,7 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 		reg = PCODE_SCRATCH(0);
 		test_bit = FDO_MODE;
 		test_val = FDO_MODE;
+		s_size = SZ_8M;
 		break;
 	case XE_BATTLEMAGE:
 		reg = HECI_FWSTS2(DG2_GSC_HECI2_BASE);
@@ -91,12 +93,17 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 		break;
 	default:
 		drm_err(&xe->drm, "Unknown platform\n");
+		*survivability_size = 0;
 		return true;
 	}
 
 	writable_override = (xe_mmio_read32(mmio, reg) & test_bit) == test_val;
-	if (writable_override)
+	if (writable_override) {
 		drm_info(&xe->drm, "NVM access overridden by jumper\n");
+		*survivability_size = s_size;
+	} else {
+		*survivability_size = 0;
+	}
 	return writable_override;
 }
 
@@ -143,7 +150,7 @@ int xe_nvm_init(struct xe_device *xe)
 	if (!nvm)
 		return -ENOMEM;
 
-	nvm->writable_override = xe_nvm_writable_override(xe);
+	nvm->writable_override = xe_nvm_writable_override(xe, &nvm->survivability_size);
 	nvm->non_posted_erase = xe_nvm_non_posted_erase(xe);
 	nvm->bar.parent = &pdev->resource[0];
 	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;

-- 
2.53.0

