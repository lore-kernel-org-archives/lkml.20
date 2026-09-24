Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6546B40DB2E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243151; cv=none; b=fcthaEstcr/FA8k4K9QwNjOazXIrJ3ocsZlgAY5ADLww03uKtR1ilIZVD5fHtb80ipZkTYttR4HMUQZPH9nmXjjniXdeXT4VzqGeDnfE712/SqSLLV1k/+XJ+6m2UbBMEnmNkQMz364Ypmp2zba6AUJKEzL4uCJC/kLwLiFc3Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243151; c=relaxed/simple;
	bh=sfY11cdtJp865U1tC2f/dZACe/B/9CLIWV3bLlL5Bwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LOvFVcFaMyer0ho8Q26WDNGKpz45SsT6IGKaR+DrMW2sXG/Y9+xrgXP92NDGhZNArzy/wxD8eF7MpkqL7oqXCgirVzsAMWCtrhWBXrAWQtwbq+BkysZ/13KrkSXLecG/XpNbe3q9/KkNYbO1rnrsW2DYBDjb0iD664lscjYghBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDUhi32C; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDUhi32C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790243143; x=1821779143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfY11cdtJp865U1tC2f/dZACe/B/9CLIWV3bLlL5Bwk=;
  b=ZDUhi32CQTy/a7RW031hzF7/qvvtGlCLInHYbhh0Dsb8RRJmefdabi9P
   jHKUsR5xnpohUQRwvYEahz/RCC+pbcBQiGTIjIEQRdumpqWcE/gxyQOqx
   +groIa5AHCvMSNyn/Edufs3SFF5qPR8DgHV77gIamdaMa4OnHhMlfjVY0
   FDdYfSe/JRSXiwdJYP5e8vl3ZFuFWRPZdTyl16wpDAIuiN2Ga/PisA+zO
   x3yUUvZhHoiOTltgdk550HEy4F/plZK1GFqSPFR0G32X68fmy//LrwUM8
   Q0zAYgXziQFD0PW7TeP7sl2yiVvg0j8UAYZ+w/yiEJYX9fcasvzodN0Hy
   w==;
X-CSE-ConnectionGUID: fVqX3fIrR0iHyh38KejolQ==
X-CSE-MsgGUID: c89iMO75RW2Wliu2V+TCIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90048129"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="90048129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 02:45:41 -0700
X-CSE-ConnectionGUID: ON0PMdNNRzSp4iGopxx0CA==
X-CSE-MsgGUID: 4/iZC4TMQdCXozfqBD6ing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="311879535"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2026 02:45:38 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH v3 0/2] drm/i915/dp: Fix MST PBN accounting
Date: Thu, 24 Sep 2026 17:43:14 +0800
Message-ID: <20260924094316.822211-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922092647.2263962-1-xiaolu.xie@intel.com>
References: <20260922092647.2263962-1-xiaolu.xie@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the raw video PBN in ALLOCATE_PAYLOAD requests while keeping the
TU-aligned PBN for source hardware programming. Also track the PBN
actually allocated by downstream branches and use it in later bandwidth
checks.

The series was tested with a three-display PS8650 MST daisy chain.

Changes in v3:
- Preserve allocated_pbn when recalculating an active payload; clear it
  only when releasing the payload.
- Patch 1 is unchanged.

Xiao Lu (2):
  drm/i915/dp: fix PBN in ALLOCATE_PAYLOAD request to use actual video
    bandwidth
  drm/dp_mst: Track allocated_pbn from ALLOCATE_PAYLOAD down-reply

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 17 +++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 33 ++++++++++++++-----
 include/drm/display/drm_dp_mst_helper.h       | 10 ++++++
 3 files changed, 46 insertions(+), 14 deletions(-)

-- 
2.43.0

