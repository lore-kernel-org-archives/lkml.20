Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569553;
	b=g0lx7vvtolBNwG5aGYc0BAWn6V8LmwT9WBQyZr50ITq3M3yKs9TRHez2a41cBkQhhmId
	 PmQknb1DNNdeslo5ay2tol/v6FRcgy3/e0fH1fmsH13Nhb9UI/9F03Dj0EoA5DKE67pM/
	 8ByLXWfd04fXPzYai+c62mpeSTfVFScw1blqNyf6EkULymFCvHqEIn3kl4musNsZ4pe8x
	 O9V/MvLPa+f3jkDNzlhZwmZ8SFpS01SGDgYk+tJ0aUZnDLhTllNfqccBIpiElpkflVCjI
	 T2Rxu2JCcHJQHEmraJg0hPlwlDqCjkJEbtM2sVqcAMjWNMkKGptXgrrrTX/ZIhM5LVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569553;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aSFaJ/JMK8O0Xg8jKsgz2XVIn+aZ9j9cGk4zxALEaeU=;
	b=s9mRuVsPKxyyxzXdnmeHKL5hmd8ytSzuBf/Z/CPTc7yVn8d78I6HBnzwknX+nr/t6IfM
	 X5YqBJXT0eibvhY188jKjQh+fczIyJnyaHKiVoBkHeRwkzC//JdKsLuYYdHEC+EQW4st7
	 0dxVQA7JA5/20LnAcZM/ymGWLCdaM6b9PQEaA9DZlivTvc6V33Wm+yzeWUVi07NXuvskE
	 OBoCZjlLxlvxOgwaw48dQEAaMcg7iIGWAjOt4jR7+HhlrXLmPm52UFYgp7Ho4akbJFlBq
	 itEzYlHoprBmvOwumGQQSqANclhTiyXma3W7KW3nePEN1+efwIbaiLa0QH7ej2D1Jag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9GA4EcZ;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39460A3801;
	Fri, 13 Nov 2026 11:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF39460A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9GA4EcZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569553; x=1826105553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ktmPW69JebuZqb59MUhahvshf+2PLnvpHnoOYUXft9g=;
  b=I9GA4EcZuH/ZtrcHpa5PAcqVWPB7xoBxV0Q1UxwWb1uedSCh4/iuMrPe
   knJkupmZmXceSDdL44AIKNeTABFwFzED9ErHKRP1Zm9/dwLNE5u9FZ5x0
   NdcgaUDAcArVLxwjmqW5mm3t0U+2Djp1szd46OwvDG8Ip6rRPhBqcvkyN
   lKmM0Oj+nfoVFLTMulXd74vuiLMCrmsUV5nHdhxnUj9WYICYjWHLkv7jb
   76XmSWO5qPF6JfDwpFkIqRxtFvF6O+AiEz6hWHNKYH0uhif3ipW/f8rpQ
   XbmSCwWPsvDBCYfp/bMpRhqFn+GfnGm+BCVaxqGljH5PKLgaFSbNuG+VG
   g==;
X-CSE-ConnectionGUID: 2cbRUgxMSz2l8um7Rpx3Mw==
X-CSE-MsgGUID: RFYkwqYRSOWiahB4Bzducw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246969"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:44 -0800
X-CSE-ConnectionGUID: VDecVWgUSWGz+FDo3/KjWw==
X-CSE-MsgGUID: 8Ys1nellSZ6Lg5ztmTJBWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235636"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:43 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 11/11] ASoC: Intel: avs: Remove soc-acpi-intel-match include
Date: Fri, 13 Nov 2026 12:38:40 +0100
Message-Id: <20261113113840.3067489-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113113840.3067489-1-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
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

The avs-driver does not use any of the tables declared in the header.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index b1a8e8b20cc8..1e6f27679811 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -13,7 +13,6 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-acpi.h>
-#include <sound/soc-acpi-intel-match.h>
 #include <sound/soc-component.h>
 #include "avs.h"
 #include "path.h"
-- 
2.34.1

