Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727E637E5F5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324226; cv=none; b=oRwr8qIQAalL3D7xiaaqZWV/2ehIetctaYEygLQclGwnXVQbnoeCOTSMvNNGLCd10gM7ExI6TAvQXh7QGFwdSAYteBvOHi+x0j57703eAs9XvS3FreW1sHBtrunDYQ7a9WwAGbrblitvlnDi2SxOy96YRvYGBIkBHdwjTV9t+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324226; c=relaxed/simple;
	bh=b0xYSXdxjn8cht2LcxFs4YgAHQOn+ZWb843TF0pAv9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NceHgvQ3vgZcMpEw5HkdxgmJwLiWLsyraes00ei5AScVFRy8e54hNCDABJR0qiNcmT64iOxTc4xPUKp1sLJxejzTzUO5uAZxXuUimVtf3YMNHOUOMFBBkFeRJgZbMeOLuBzMYSpagMjZiKBiGOoEw0+tC/L0W64B5Knq+LnPN0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXZzF3U7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXZzF3U7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791324225; x=1822860225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b0xYSXdxjn8cht2LcxFs4YgAHQOn+ZWb843TF0pAv9Y=;
  b=PXZzF3U7Xd1++T9TZr5IDrCrfiVUDYUSdyRkCg7gvsPSXLDzPITrHM3f
   C7n8hcnYv+AG4yAnZHY2f22ekISJ98dwWi/rpamsC5JRBof/SDEs4OyBH
   dVuitTgC4Gw7MVO1YZtvhuYBr0UMU6xw+clSRHfp//rG2q5kd84M0W5A1
   Asm+kwO76O1g6vv1pO8S+WQzIVTQA0HoPyDKbdSb3mxSoA8YjB6nHSlDX
   mWHLJ8RGVR1B0QclhEZ16lMe4/Jpq4N1xwbclcUGXFRcSWe+tknjymmLE
   VPhsWK9jBHYtVsggK60vt9UfOn8eWNCFbfYm4bAtz5Utz7tlpMsHkVUu2
   Q==;
X-CSE-ConnectionGUID: 8ZHLW0xTTcyqigpoPPBlBQ==
X-CSE-MsgGUID: WK72Diu6Sv+VrnhobKbTRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102607754"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102607754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:03:44 -0700
X-CSE-ConnectionGUID: IB54p718QoOH8dBcteF66g==
X-CSE-MsgGUID: LXczDONCRAG0XflhB8pCzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="315294818"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:03:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com
Subject: [PATCH] Makefile: update the kernel name
Date: Wed,  7 Oct 2026 01:03:38 +0300
Message-ID: <20261006220338.2264612-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

I note that it's been a long time since the kernel name was last
changed. I think it's time.

Nearly ten years ago, on a social medial platform long gone, I suggested
the name "Roaring Lionus", which was in effect for v4.9. I'll be so bold
to suggest a name again.

I've been told I should try LLM for kernel development, so I think this
is the perfect opportunity to submit my first ever patch assisted by
LLM. I asked it to generate names that follow the established style, and
among the candidates, I hand-picked "Free-Range Attack Penguin".

Assisted-by: LLM
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7c855e6fe544..b27b6ff776d1 100644
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@ VERSION = 7
 PATCHLEVEL = 3
 SUBLEVEL = 0
 EXTRAVERSION = -rc6
-NAME = Baby Opossum Posse
+NAME = Free-Range Attack Penguin
 
 # *DOCUMENTATION*
 # To see a list of typical targets execute "make help"
-- 
2.47.3

