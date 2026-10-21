Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572405;
	b=RhMl6KMknUZsJay+ZeHdfvYsaCaoB/ikCLwYiJo35GSZvRMOC0CbLKosPRW/VSJsZi0z
	 VWt9gpwDagq7qjdVChdRXdUA3mVw2BpQEkFMMkKQ2tN94q1RoPhIXkKcOM0VLTIjsb3Dc
	 oU3fI1z8+ig++ruZY2iQBniyryO6W9uJ6BysoPScZTog80IGqHKLmQSKwaYeWUfY3RQPR
	 adTjW57hiIC2gkA4BqGifgFRQ9mkv9WOUSZXMviPz8OgR3p9zW2ocesxubNvac6jFYDp+
	 8Jy4Ow9K78oF3nexe5ViygL3yJ7KlkVsLwv6e/9//YZL9fb/n/xZTGuf6g6J+rbPmTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572405;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xl8/MTzN2+I/MVnHgcoN8EUCTEKjttRF+oiHNcSuKJs=;
	b=AVhqLyhjbrwPaAlemdCpb3U8Td3NIinTQjSuyFBsJfLwEWk7+oMtEwu0th7jUMTowvEI
	 1cAQ/Q4NxGeqLPSSJhh+y7QtSb5vkCARcVy6ivJ/b6KagYVv3jJsQ+nAzNWChcdBa8v0O
	 Nari7TCpPskfsNt5dYB/o3kSu+5i3ikIJCglT2ZWJNFB7FeTXrdRUbRCRs5JWbvYn/uxK
	 lm8u8jQmveBfKDtvIjGeiD5qdWJL7hSRQ1IUB6vXmqaEgNWXftyCMyiA141rnALk6XFSt
	 MmAYy9SPtrldqSO/eNjNCF2kLNiQysnXIldgMCcCDZPqrBbbnvfn3Kf0cdyzj+YR5TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mf2yPZx+;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C0606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85C0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mf2yPZx+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792572405; x=1824108405;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jjuwx9ARMFdR4PdJdOhnBCXsug8WT423elVugN7nRJw=;
  b=mf2yPZx+wLErxJDm0heGe6KbYj1q1Gr+sehNLQYI2BYZVYxA4yYw12Ot
   Ly2ur7W/NWVyluGGR8b6MiRH9Pb/MM6meDDeHEuCNuruSdltjXPaIFOub
   dH3v/4xgMODd5X8ZW+mMrDstOkawL3whWi4TJQWy1R2vF9E5WuLMFQci9
   hLzgIodjVnndTzZ2ei7m0nHTyTPxlV+3iFDNGIjqGbWPB7jySQoOLa5Tk
   r9noxIsIhRhLz9jlOKP/Fz0nfusmya4/zK13IwIg6gJJGME78O8aUTFaa
   Eq1F49McEWw5FsmblQSRU/tzAtneEbAxUxiFXX6l1p9xPswLimiKZLWlb
   A==;
X-CSE-ConnectionGUID: vhznhMZoROKRf88BEqU38w==
X-CSE-MsgGUID: nCz5ttYuQN+teysimH6Njw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1179538"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1179538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 01:46:44 -0700
X-CSE-ConnectionGUID: +6taVgm4Q72o2/VoXIX2LA==
X-CSE-MsgGUID: UCK8kT6BRz+H0i9o3WwDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3352944"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2026 01:46:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 452CA99; Wed, 21 Oct 2026 10:46:41 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] drm/amdkfd: Do not use internal implementation of tolower()
Date: Wed, 21 Oct 2026 10:46:39 +0200
Message-ID: <20261021084639.251366-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

ctype.h provides tolower() macro specifically for the cases
that might be architecture-optimised. Using __tolower(),
which is internal implementation, needs a good justification,
as this driver is the only user of that and there is no evidence
it's required.

Note, currently it's no difference as the macro always defined
to the internal implementation, but it might change in the future.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 35b3abe57b80..1ef4d26a0ac6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -2091,7 +2091,7 @@ int kfd_topology_add_device(struct kfd_node *gpu)
 	 * needed for the topology
 	 */
 	for (i = 0; i < KFD_TOPOLOGY_PUBLIC_NAME_SIZE-1; i++) {
-		dev->node_props.name[i] = __tolower(asic_name[i]);
+		dev->node_props.name[i] = tolower(asic_name[i]);
 		if (asic_name[i] == '\0')
 			break;
 	}
-- 
2.50.1

