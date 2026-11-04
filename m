Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818253;
	b=hKjzYfz9ujOYBO5PwlrQb9c5nQIqjb8k6M//7bIbW/50Fh12OC/Mo8qTV5+yHipISPgb
	 3C4V13LxY+mUNpJ+W0RkjjSBsgrAWCUx6tPEeRUwAc0VOFBp+k9vR/Zi6Un2qJU5NtH8U
	 loMS3KF5AxfnuwT8nGwbtPQPnrrb2VtgTSlprRuxqRMc4LQ2SXksfQh+ol9ROW+W7anzD
	 8cJ+B0C+sgPwUT+5+Cx8w4UuCrDb9TvfscZqcVcTRD+/luz3/HwDPblL/5TIUsjQSR/51
	 35AldQhiQ0tmPWC2zWi0WxMkpjLwk1ZyDEjU7CSi/YGYK2M6bDTX0+6QiZFOOvcg/kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818253;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UkeLMSo25VY+4J2c9VJFyAXF9qvq7LvPhEyElBCoGEw=;
	b=EES3jn9ZOlZd7mTOvZGrjI5tp+h+q2+EctXbsnbgpTEi9Tle+2+378LyYvlumS9/h5yh
	 tEjTEuAtHGo5vAm600VUHzv072K99JJV87eYLDk1L/6dt4VGpu/bT8qJ/dlizkNC2Hdpn
	 DNZKV9jxMIpIWSvxV4InWcd3lY5LIWilW/5+GBymhxrdUKUIEbl10OU6VG6GC3x8hZz5A
	 4cXPu+ld1op8i7SGxG91rR8ny80JfgX4eA7LwIkO2T6ruNIVgvE3j3FKrddjv3J2sS4hu
	 hIQkK74uUDH4QhZ7uKIlU3lz/hXLTPjt/7NgidU8pZFLcCVRLBMXP72d5XDR7hbcc5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Klxghepy;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED060A381C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ED060A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Klxghepy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818252; x=1825354252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i1kp7Mad316tBIJkDkrpboArVTGFiUvDG07Iot+CwhI=;
  b=KlxghepyK0ePDG2sseWp4KoQentzJnArYmOv1LhSQrXCBNpmksU1SYcX
   FBu7z9WZuGowjHYgFsybzHaYuZD+xq8EhsqVcS0UPsDeLNbh5241WUfSe
   qbyHrL13XmmKxM88CO2/PSGQVJkUgTpe3zBtJPp3E4HxVEm56UNlXWzWF
   o+4iOSqAaHDbTGsIdlSqffoIy9Ht8B/JQMcz+oGA92D9+ZOc3GXibd/3Q
   FICPUEMPrAHi3lDDTx/P6t2IM3b8cm9PIuwM5KRF3ODvliTLnoyV8BkA8
   u4vQya0zDsQnJcQaQQ13122JpKykdRJQ7Br/8TcVO6v045ipubfcUfUJ8
   g==;
X-CSE-ConnectionGUID: 1yHtiqkeQmSFI/W21SyQfQ==
X-CSE-MsgGUID: 8m/iAG1iTnmsNCjrPw5SNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485048"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:51 -0800
X-CSE-ConnectionGUID: 9myAU4V1SUmRhfdgTcIIFw==
X-CSE-MsgGUID: lUOCitNKRHeT7Fg7GE6Iiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336797"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:52 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: [PATCH v4 5/9] x86/nmi: Support NMI stop-machine handler
Date: Wed,  4 Nov 2026 18:23:18 +0000
Message-ID: <20261104182322.578066-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104182322.578066-1-chang.seok.bae@intel.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
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

From: David Kaplan <david.kaplan@amd.com>

Call the stop-machine handler from the NMI path in order to support the
NMI stop-machine.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V3 -> V4: Leave a note against coalesced NMI events in theory (Sashiko).
---
 arch/x86/kernel/nmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 3c9f60d6ca5a..0d426e5e74ee 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/atomic.h>
 #include <linux/sched/clock.h>
+#include <linux/stop_machine.h>
 #include <linux/kvm_types.h>
 
 #include <asm/cpu_entry_area.h>
@@ -382,6 +383,14 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 
 	instrumentation_begin();
 
+	/*
+	 * When an NMI stop-machine runs, the rest of the system should be idle,
+	 * so handle the stop-machine NMI first even if other NMIs might get
+	 * coalesced with it.
+	 */
+	if (stop_machine_nmi_handler())
+		goto out;
+
 	if (microcode_nmi_handler_enabled() && microcode_nmi_handler())
 		goto out;
 
-- 
2.53.0

