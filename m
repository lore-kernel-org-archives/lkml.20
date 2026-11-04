Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676865;
	b=rdNJ+rEYrTeq3+nbUYdsjoWC4FOWnU//pnCRWTtiptvZPWIJvJd9iWhR5eSkm28f8j0V
	 cdqip6YM2KwMXg0dhUQQexEI5jAdrVsuHCFIYegcR8g3zqE68piAHXdgqZ73Beo5QKm+T
	 3rMVkYsQDi2srr1ZsNS5KJCax6mSs2mVrTkqnwBJrMEEuUJhrW0G+9IqHZZ0jj2TJVnwq
	 wylxeLE3Tz0/B4xZg7aUCmTdTMeUrGxX/5wYRP3vI/gM5dGyrCxDBhFGky3cCcEvAKfd5
	 yy+KiRLcsEIHTiqUfBwFbRBGk1mcSBcs4mhzUBXL/n+K4TJ8vigJMPvmnGUes3N2rHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676865;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3PzSXFuZlMlTOfUVklWCQpzN4rvz3ZOn5hMVSUTf87Y=;
	b=TSkMfV3wzfeatajfIWcIxmyasSxNUyJoFLxbbeRO2xOUtgXpNZMUdXHFSD6OmMc3016b
	 2hCYhxiDLyFo0rBEhB6FXGJ4vOqWtBv2H8elV/1T5VNK+4/AtiO7wmv0piNwklK0EIp+t
	 QP+hlRI3cBm+bZHoxpa4+ot06ojEVb+7+pASKd5D56bWTbhSFUlKHUgavcgvn0VS0AM+Q
	 kPjXHd6RyRBNrUZl4W23aKuzpGYCKnCVcmmO03y6qsbw2Y35FLhuDY8LJqQC4+DvubZTB
	 3+AAQBPaG0mSLsJS51ATdYa4QXye5eQfdlnbsIySYY4Zt1PijODKBdCURPoMBoU0p3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cXsaPy4H;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4E606D805
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF4E606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cXsaPy4H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793676864; x=1825212864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ibaC0LwI4fMdA38nqhEQ20mlW1BgDPT1XXy0q2NaVg=;
  b=cXsaPy4HAb4g0tCwkgHdYj3Kt42tgy+Am1ertOZXy2SI84I83PosGD2m
   ov8G+xQzgC4fO44YDdoJ8E0Y2ksfQe991AgbnM/UyRnGLahzk3N9jMDQc
   OZrYjbgd4SmCW9x81c8JZ5lGpjOrbyS9OvivKFQVWVvnNzbqDgb9xGwXo
   ChG4NO3u3PMz3sYWiFQ9Ctcpabc+y08XoNJ1Xg+8PRUv25vOkEweOmq+T
   jw0vktMvBCSP+Kk+9PkXRdemdMInYQH53WETelI0ZHwkkPL5deqY22IiM
   1kDs8umUVb0M96lT/fE1q7rr3Or/AoPFnIqRjCAjFAveFBvhWDBYlZ4Uo
   Q==;
X-CSE-ConnectionGUID: x0cPM0eXT3e8SKeXsBovVA==
X-CSE-MsgGUID: /2H+7++SRUim0yoX79DNfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2380797"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2380797"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 19:34:23 -0800
X-CSE-ConnectionGUID: aUffzQs6T5y2KTInS4KtZA==
X-CSE-MsgGUID: ZSxTTBwISoCaBhdgtP3ijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6159869"
Received: from junxiao.bj.intel.com ([10.238.152.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 19:34:20 -0800
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
Subject: [PATCH 2/2] drm/xe/gsc: warn about GSC stolen memory usage on RT kernels
Date: Wed,  4 Nov 2026 11:27:32 +0800
Message-ID: <20261104032732.30681-3-junxiao.chang@intel.com>
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

The GSC microcontroller requires stolen memory, which can introduce
latency spikes and negatively impact real-time performance.

Print a warning on CONFIG_PREEMPT_RT kernels to inform the user that GSC
is active and that RT performance can be improved by disabling the GSC
firmware (e.g., by setting the module parameter xe.gsc_firmware_path="").

Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index aab59dc647fbd..3d06ab6fecbe0 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -427,6 +427,11 @@ int xe_gsc_init(struct xe_gsc *gsc)
 	else if (ret)
 		goto out;
 
+	if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
+		xe_gt_warn(gt, "RT performance might be impacted by GSC stolen memory usage\n");
+		xe_gt_warn(gt, "Consider disabling GSC (xe.gsc_firmware_path=\"\") to improve it\n");
+	}
+
 	ret = xe_gsc_proxy_init(gsc);
 	if (ret && ret != -ENODEV)
 		goto out;
-- 
2.43.0

