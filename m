Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B51F469857
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391919; cv=none; b=ovKic30T1kL8+1B4Ampj9zUERRveZQdMivfG7jdVgY9/L8Ef6eA0YQlSOeoDogdB98hIkQzjlYC1Pl6b85u8zBfyjY12eVrLQR2BmTfMX8YbaWwyC3rxBhWajhJBuFHJggPPuK7rFTMFmHO+wsOKOzwNrIykHkq2+DT1LGwSCeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391919; c=relaxed/simple;
	bh=li3QXltipxKEHiQpkDyZl5H8yuTNVO70BZpcI0h4e1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o194cCNyVJbbOzKY82ICLWr9rEvQsGAxRg166cWtr4Yt0vLoSsRARn1qsujZJXQDjLc6w1MGfmHyMJrqv4mRPm9DEC0QEtiUu90zzXD6zxm9u2mrdIcpPsR54oENuz8snGXbwh1NY4Cjk5KT/Y/SD4X+8L2tPWERgcpZlAktVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IR5QfglT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR5QfglT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789391918; x=1820927918;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=li3QXltipxKEHiQpkDyZl5H8yuTNVO70BZpcI0h4e1Y=;
  b=IR5QfglTVtwvU8PTYTrRSKDgdr0rL77j5lh6mNUI5FclUAmqGpK1fTi3
   VYuJbMsv42tTT2DZUGo/5LcWnUh4xri5kF2rmL7YaNO9LYH4Gg32NIpZb
   p7LmrcPBcfNqz62N+fHxt9ONY3AwEBITyaNZw/Hn5O3G7jMgN589kDNCN
   ntPxsLKqkL/4hYNzOaCficFZL8fz2BLUGqBN3UDhbxMqVG1zGIie7nH5u
   ctEQt67iy2T6hC1e8mf1XK7RlODhUkQcmB345WWp9pghomYYz07fMEFGN
   JR8491S72kgt6S/dhDt7sNAxUeCL/Odc8cmJ2cIg+v6n5g0We6Sy+sByK
   g==;
X-CSE-ConnectionGUID: u2GHe043Qjm2Y/WYBWyE/A==
X-CSE-MsgGUID: cSoAFOq1SsOYRggUHlFKnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89768226"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89768226"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:18:38 -0700
X-CSE-ConnectionGUID: gLmUT0d9SWGeZhp5c2DZ4g==
X-CSE-MsgGUID: xBWAYN1BQ6uYAsUSlwfxbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276171115"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:18:36 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Mon, 14 Sep 2026 16:18:02 +0300
Subject: [PATCH] drm/xe/nvm: add system controller region
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-nvm_add_sysctl_region-v1-1-75d710daf5d0@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M0QpAMBSA4VfRubaaxRqvIq2xg1OMdiSSd7dc/
 hff/wBjJGRosgcinsS0hRRFnsEwuzChIJ8alFRa1kUpwrla573lm4djsRGnJISujHKmN1pLBcn
 uEUe6/m/bve8Hruo4IGcAAAA=
X-Change-ID: 20260914-nvm_add_sysctl_region-6582a8b86602
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789391915; l=884;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=li3QXltipxKEHiQpkDyZl5H8yuTNVO70BZpcI0h4e1Y=;
 b=TMrp+TtcG+Wocd0zT0UJHADOd9VE0Lf3JgUDiOSUmxfoTFR2hYr7CjRrAaPLu9mNFbItcAWL2
 Na2NEGXtfMvA2mugLPvwwcu6iVBR29aF2P4uN+h7NGIuL54T+YaAxtW
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Add region 5 (System Controller) to the list of regions
available on device.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 1ea67eaeae24..51a1a431ad85 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -28,6 +28,7 @@
 static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
 	[0] = { .name = "DESCRIPTOR", },
 	[2] = { .name = "GSC", },
+	[5] = { .name = "SYSCTL", },
 	[9] = { .name = "PADDING", },
 	[11] = { .name = "OptionROM", },
 	[12] = { .name = "DAM", },

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260914-nvm_add_sysctl_region-6582a8b86602

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

