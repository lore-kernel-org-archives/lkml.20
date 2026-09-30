Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E023E4DEC09
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777734; cv=none; b=QyE1W/tk1ClTLKgYp0M7KGBs/28tQKBFySiUihftwXjX0MJWZy1txmm2LZyg3mscB0U3R/Emq6HQKa2VjQqonyG5bVkJ3jZS/awpx16Q6FJDue89LvJO1F0iCAIphy2K5c2/BGc7S7rLKDtlTyhgRrRMv3NljcRFQPVvy3unZQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777734; c=relaxed/simple;
	bh=Uh9gom39WzbNzzzBwCXu/2laBjXWC998zi1qTL8D4Ls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dryW67qBd8FlxqOFbpyRF6VThZzMMfHHj2wFvlYmZiSk/DhLaI2VIBB7rp1eGGe6npWVAmRKJnF9LVBRmSnoR2AO2fpshpqAdRH5vPg7zc0soHtLSdjALNi/MbLZVjxOjYWVIQMctP7xs2HcvcsaQ9mokRb9a7FbKlhnUNThV/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYi8DyDJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYi8DyDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790777724; x=1822313724;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Uh9gom39WzbNzzzBwCXu/2laBjXWC998zi1qTL8D4Ls=;
  b=FYi8DyDJFiknFR30OVfkHG5dFtuHgwCQp/TjEgimEv73+6oROV1dwYq+
   DYuXWvV5KwfkXQRPkvOmmXYvnfuB5+0fIsze99D2qj3N6n7p5nAFYe6q2
   BzumEvCRLPuBzIkMPVnCJrnvZe4rH4jFvQrM7E+eaNkl6A+RKPh6aVEEP
   4HKTYCSJzlm6EjeBN288ZoeNwvRii0sJS7cQV+5/7sJSYB2G1+4jdmEDs
   yioXuGGSkFKWOZ42TdI/qDObayHSNXtkU3ceVvDp0ixUlM6FFwdvwnhfo
   Kl8MbNMg7DTW0RhEHAkh6b0ep25z18AW+3DZ7QD+KWiV8Si2SmLi3HYb+
   A==;
X-CSE-ConnectionGUID: THCTDRFXQAOt9Q3AGbjF3g==
X-CSE-MsgGUID: yPo2IL9iQC2C43289FB9UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90469983"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90469983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:14:58 -0700
X-CSE-ConnectionGUID: N6VUx1vnRFiESVz3cBge7g==
X-CSE-MsgGUID: SMr/RS35T/a+Qv+s2gvgyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279499579"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:14:55 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v3 0/2] drm/xe/nvm: add survivabilty partiton
Date: Wed, 30 Sep 2026 17:14:45 +0300
Message-Id: <20260930-cri_surviv-v3-0-357aeed5fc60@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQrCMBCF4auUWRvJpCaprryHiNR2Ygc0laQGp
 fTupt2o4PI9+L8RIgWmCLtihECJI/c+j3JVQNPV/kKC27xBSWWkRS2awKf4CImT0LVxtbO6Mg4
 hB/dAjp8Ldjjm3XEc+vBa7ITz+5dJKKQwaE2ZPZTW7NkPdF03/Q1mJqlPukXzk6qc2pbwrEtVK
 bn5TqdpegP9w/yR3wAAAA==
X-Change-ID: 20260715-cri_surviv-5a6faf7586f1
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790777694; l=1591;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=Uh9gom39WzbNzzzBwCXu/2laBjXWC998zi1qTL8D4Ls=;
 b=qBMmZUBGx+CVmIcdAn6rHqQ4J0RItiVqFUJpuPni8jRorjvz6LqJ5T2Meo/Z5UuItQjzkBZV2
 U0vFZKZWPQBA5QOftkP1QoF70wWfmLiVKClQx2EumAWRIl8J3JTcoHF
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

One of the reasons for the CRI to enter survivability mode
is corrupted storage.
A corrupted storage partition table can make recovery impossible.
A new partition with a pre-defined size, covering the entire storage,
should replace partitions detected from the storage when the card is
in survivability mode to allow a full memory update.

This series intended to be merged via drm tree for consistency
and requires ack from MTD maintainer.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
Changes in v3:
- Fix minor checkpatch complain
- Add Miquel ack
- Link to v2: https://lore.kernel.org/r/20260916-cri_surviv-v2-0-7de1b5328204@intel.com

Changes in v2:
- Replace usual partitions with survivability one instead of adding
  addition partition to avoid problems with two partitons pointing to
  the same memory area.
- The change is in the mtd part; Miquel, I feel that this requires
  re-review/ack from your side.
- Link to v1: https://lore.kernel.org/r/20260715-cri_surviv-v1-0-61763a6f1076@intel.com

---
Alexander Usyskin (2):
      mtd: mtd_intel_dg: add survivability partition
      drm/xe/nvm: define survivabilty partition

 drivers/gpu/drm/xe/xe_nvm.c        | 13 ++++++--
 drivers/mtd/devices/mtd_intel_dg.c | 65 ++++++++++++++++++++++++++++----------
 include/linux/intel_dg_nvm_aux.h   |  1 +
 3 files changed, 60 insertions(+), 19 deletions(-)
---
base-commit: 3fc93d311249d5ad969a520dd3aae73bc007d431
change-id: 20260715-cri_surviv-5a6faf7586f1

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

