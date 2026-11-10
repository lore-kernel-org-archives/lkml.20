Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323930;
	b=Av7U0HEeMwVjPqGSfLppHXuhcFPCbgovrorrID05NS7sW6DlAtooyZ5NEB5L10cZlkg4
	 gBaeV6CDaUbsvigyBZoSl9Cr/M9S6UyLUwKPTdeVhbOAuW0zONtouqEfSKb2UBMk3pjsy
	 P3N4e6cqRk1geqfsKsMuezGAIK/U1BD/8bxSp+JFcDvRianDzlQ7TWgJlJ4xj3TCCAxtY
	 OQrxwwG4YTVmeANDzH5WuqCB6wavvn8c1ZYSCPZEx9Hx3UdmyqGDJZ+SO+z2K5ig07Jfl
	 v2wrjRVO7BvdjElZ0tQatwBdlSBRnIUieuvESLNrDGZpOVN9TvfpUNJWuV+E0V95wBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323930;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UtTsEOehZWzXX9jHg3ZJ2Q/XwMZXfo3Zzj8SutS32y4=;
	b=ejYOftg6unUq1MNzRbnXcFNTFJwi7OZjPAq2rjur0Kj4xfe6KHCp6UHUWfCGhYPb9Mpv
	 MUqcUVEdl/BvwrwOdlZnBsrjfL5bX7qlEH2uxOKRQyhXH6cuARNsFR1TmZbGeL5A5Lwdk
	 6N6F7jaZm45aMAuLSz5qHZ8VUzZpif9pZY1J5lImw+rB0qo1qEqx4aokDUpwTVtnemw0M
	 TF5cawX3Suy7pK1MfdwmGRmscsetnuinxKtY+ECRjatZ87Lm56P0fIyGTCLI8FowCFWoB
	 Hw+ueu5oiwTRtaykpARyhxKetGlbpT/r7y7wZbi7kTkukEk/pws+xoM7q42e5YZyp+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I5D87ncb;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I5D87ncb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794323929; x=1825859929;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=958ihYDe0QInunnhc/WOUh9gbKt7TWUipRjV+q/UDBA=;
  b=I5D87ncbG9qwYF+9deKBi5TJo5Vmb8LOMxMzyJN8Sq1aaJOcGR/jrd7O
   MeOaElzJCa1Ide/r/2O/YKealthwB6rQ1F2KBUUCCL/dv39JnScMVwPDR
   6su3pYq+E126mCVGVyB2gZBFCgBu45Fy8QcS4v+PW3UX/V61fab9urLYz
   gITFpggt536t7CF2sPPEHSslZutVvkC42/XbprEa5lMemya6nQ2dZcwZq
   YdZjsUpGOBrjFK5BKdtkUamWs6AZKjlFiWiAidMcuI6TVTgTi5BPLSix9
   OE034BQtV+Sigr6CsHJwmdudprmw5TXziSEhYFVTSR0ZzMu1sIjyHMq1p
   Q==;
X-CSE-ConnectionGUID: yFLZBh28QamGiTCVkAYlIw==
X-CSE-MsgGUID: pepyCDMBQmqwdGYSTYEOqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3072847"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3072847"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 07:18:49 -0800
X-CSE-ConnectionGUID: ke1MEca3S8aRbPeLaCw6qg==
X-CSE-MsgGUID: 3u6jBIDZR0Gqirq+GmJLBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8177852"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2026 07:18:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BD41E99; Tue, 10 Nov 2026 16:18:45 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pstore: Use match_string() helper to simplify the code
Date: Tue, 10 Nov 2026 16:18:44 +0100
Message-ID: <20261110151844.661926-1-andriy.shevchenko@linux.intel.com>
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

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 fs/pstore/platform.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 1ad6e40f4952..4c0943a8e15e 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -17,9 +17,9 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/pstore.h>
-#include <linux/string.h>
 #include <linux/timer.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 #include <linux/uaccess.h>
 #include <linux/jiffies.h>
 #include <linux/vmalloc.h>
@@ -130,10 +130,9 @@ enum pstore_type_id pstore_name_to_type(const char *name)
 {
 	int i;
 
-	for (i = 0; i < PSTORE_TYPE_MAX; i++) {
-		if (!strcmp(pstore_type_names[i], name))
-			return i;
-	}
+	i = match_string(pstore_type_names, PSTORE_TYPE_MAX, name);
+	if (i >= 0);
+		return i;
 
 	return PSTORE_TYPE_MAX;
 }
-- 
2.50.1

