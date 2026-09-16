Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11C3412BF7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567121; cv=none; b=ti6d0AswhxRMuvtsykJHci1V88dnZ/5o//swFO5w+gRCQw5i52t6PqvM3IsPu90l9fUKt5QXr/8SnN50y4dRCQgTyTCBFH28xMcBDODBB8Z4zNHdc4SzdPJqiejTbDSy56j0eSr4kXQ6OLmeiBmV/+GPZX9Epx3sSCTByT3+/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567121; c=relaxed/simple;
	bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cvg3nKFQdu3r5odOqCSF8tgAvWJUEhPzasflH6p0FFcuGjJ/2xDnohukh79RDZzjsV2OyxdVf7cRCpGf27RPF7W9wlvgDVDQybKax08jNDKSlXH5wdLlPVAdwdzpmedh2HtAOa6mhld9fbN+I5Jq6geXVnguvvDj/er85aEJa6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTyXJF2y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTyXJF2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789567120; x=1821103120;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
  b=LTyXJF2yNTh3JtwE92u9Ov80KA6V57p7HAyju8++lwNIrgaeexGes+Bg
   5QoTzXHjYNLs8Kh4ITLKvncx3SWg5kkk3OefKfISR/mhkIjAA9tUjX0Gz
   n6S6gzB2GJDfavtTAiUHhhKKhfpXLizL/BCBZp2WLfUV7jm9hA1ijGKIT
   Szmuot7dTkpYgtCHTjWcP5WEM6DqFkcPCsmABg2vRa7LNIYfbLwOo5n/L
   V5MHz4U0u47E6ybaHVFeUGLJgcXGRAmJulB9Hd16IfXUrWbxZBw3ITSH7
   iI3v+wkeO+b7eJbv56ahAqbXBuv6AAWQztKVxA1nV4zZtno/VDeufiEeC
   A==;
X-CSE-ConnectionGUID: q415/b9/S3mVW2rTGySmGA==
X-CSE-MsgGUID: /lHzTsGgQWqptWXudW2cdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89881957"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89881957"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:58:39 -0700
X-CSE-ConnectionGUID: y+1ySo3ATyiH3qc3EjZNlg==
X-CSE-MsgGUID: /8tjTf7vQxSpqBxablUU0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277475774"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:58:36 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 16 Sep 2026 16:58:16 +0300
Subject: [PATCH v2 2/2] drm/xe/nvm: define survivabilty partition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-cri_surviv-v2-2-7de1b5328204@intel.com>
References: <20260916-cri_surviv-v2-0-7de1b5328204@intel.com>
In-Reply-To: <20260916-cri_surviv-v2-0-7de1b5328204@intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789567108; l=2014;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=r6J6OMUuexc90xruyZevzc+hksoDZaaD+TsUNdnaTAg=;
 b=Am8KStxYAynVDvH7dT+OdnRw/Ic6z/7dUnqsjX3cp/VW5kJv55QASSXI+waec1DbMiJwR2w1g
 yfhsqlTE/qIAdqi8Y5Sh8/Wdv1VocbAeLjl7CKsBbvOIjv9FNnmWwWw
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

