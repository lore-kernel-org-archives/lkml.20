Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676861;
	b=WE1VB9Z14RPJjMFYqrsCJ9HCrZ82RuMXjsYbXRsn2YI/1oP2bTkMQjz21LPjTSFmCYLo
	 7UC9yj1BFvRSsdLNSoD98KzSXNmpjMYqjLQj9dPdUmcP49/1ISHVglPv2f7fEffr1pfI0
	 ffsm5kOR+WDUNa7quOVN0pFD/uJjDDj85OZrntshXXEMCt4jUnrAl7TydXxbfLH3dRUBo
	 hA643fXkB1tvYKAEJjz1BsHUSIBIjOjMdOTusO4Ku+oCoCkoOUyWpu2XrQRhLXHrewKZl
	 JNF/5f8P9blayFiF4rA9eS1jUCPLfEIzxiKaU6iqtbLpEWaZ9sf2UIk1ND65s1C/aTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676861;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kireDHxyweKagKwzOxdkpPVbsTt42E+2DcQX3rMknUY=;
	b=wsas5bDmVZZy6WQ5oKWC5eq5bC6cc635eFtkc0cYc+n9cS24O1jjSWwA8vNZAVox4wFw
	 ICiyALo+Ot4VgHfMtLTZ3kDHPXYtV2iu9VD03dWTjwCSVNRFiTdijWePKwyiQ9UwORF+T
	 B2iZS/EBEFt9Bkg0xtOBxzbBh6FaoUI/yxwSG5WWfmIWvYGr3Vrd+HX7dFohX5UlZvKz5
	 gX2UKQ/ZGmiqq+K3WXIAlNZMT30MX7JU09ub9Szfz0QlIAAehB3aGuCMvcwjjGc5+G5KP
	 TbkHYQG88GudsaG/OGhf0ymOBlEbhENBg7YRlMen0fE4wpX9elOHdhCXQ2lJ/poliwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GmV5es4F;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443F9606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443F9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GmV5es4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793676860; x=1825212860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tPEb9o4uooly0P6Vn6Zb4V3J2QjIghdBAo+Njsa2fTY=;
  b=GmV5es4F6xPRxFNEal8pjCUz8elhNnC26BgbTXNb6NZoxlNo4fpfxswi
   9Ep0BCjg+rXhCT+f/7ZelFqH5+H4KiPD0KqHKkEf5l5+5Xk36wFaYelh5
   RvVRfNNcfBKYzsa78Dbc+sm+SSvcbqrliSEbnSv04MmzM7YtpJ+EIVXyn
   I0dC3wX09I44mTJLuIVSz9uzqUC0K+0aUwT8EPGOX6idnXGbldxBo6TJI
   cvJvHnF4R+hrYQ49tTGlbPU/t1WLxiTPym3eil6QqBI9pTr625Hx+e4u6
   VwTYWeuwwVlz/cU7ByK2r3Dlm0WbAvBQewRkcsVnhAShSxkxvBfCYj5RZ
   g==;
X-CSE-ConnectionGUID: YEkdKEbIQFCOFW2dopA1Bw==
X-CSE-MsgGUID: zpzBzX39S22Z50cidBgALw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2380787"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2380787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 19:34:20 -0800
X-CSE-ConnectionGUID: SjVktQ/8Q2qhttV3t15hww==
X-CSE-MsgGUID: DV4tbILtRKuKe4Cme2ectg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6159845"
Received: from junxiao.bj.intel.com ([10.238.152.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 19:34:16 -0800
From: Junxiao Chang <junxiao.chang@intel.com>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: dev@lankhorst.se,
	junxiao.chang@intel.com
Subject: [PATCH 1/2] drm/xe/display: Skip initial plane allocation from stolen memory on RT
Date: Wed,  4 Nov 2026 11:27:31 +0800
Message-ID: <20261104032732.30681-2-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104032732.30681-1-junxiao.chang@intel.com>
References: <20261104032732.30681-1-junxiao.chang@intel.com>
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

CPU access to stolen memory ranges can introduce latency spikes that
compromise real-time (RT) guarantees on PREEMPT_RT kernels.

On PREEMPT_RT configurations, bypass retrieving the initial plane's
framebuffer from stolen memory. This forces the driver to fall back to
standard allocations, preventing RT latency degradation at the expense
of seamless boot display takeover.

Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d03..fd0e2962412dd 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -87,6 +87,12 @@ initial_plane_bo(struct xe_device *xe,
 		struct ttm_resource_manager *stolen;
 		u64 pte;
 
+		if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
+			drm_dbg_kms(&xe->drm,
+				    "Skipping FB allocation from stolen mem due to PREEMPT_RT\n");
+			return NULL;
+		}
+
 		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 		if (!stolen) {
 			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");
-- 
2.43.0

