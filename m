Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A34FDE41
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100509; cv=none; b=O1EiBAx4wWa1miB2D7WeOMP+6w4huWIGWHE7t/EGLT9ACIyNONzasji4m+t1q+OqcAPSo9Ws6C5blRT1ez6GO8T+cpxYC2Mr88WKDnjRkau68/cHUleS/nATGGYjmOpluaHFg3tkLtRnCLBg3cqFz/Qx6fH7jqtqP0vWsDkJ+g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100509; c=relaxed/simple;
	bh=Im/eS7pxNVq4MA8KXq7HvaC2lUip6AjcKp6f1nPngeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnFTVcyWi5mkpITOnHn12TGp02bBIDTVB5xGgdfsv7dTxHX+XyHDfqdw3beuHhHb3jcHLsolTvbKSUKdB4fkqNz0euTT7Aekw769Esd4UTbLq4uJXcZv257BTZ/2SrYsyKkgGWRsfyQ//VFxZibkehh7aTKQV9J69DMpazbB8Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEn9BnEH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEn9BnEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100504; x=1823636504;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Im/eS7pxNVq4MA8KXq7HvaC2lUip6AjcKp6f1nPngeo=;
  b=UEn9BnEHDeRMURdJJJ46AL1FOxBkM55kT/597wi4CwpxXqbZNzyI3bsd
   JM3G4msJe3cGKt2s6kDOAF2hu2drf9C/ddTTMcvAyRYqcK7aAKRjAYqGT
   x0UjmhIVn9XPwmxQHNrQSsW7cDBYdk1pR2svV332Hj/rGbaUi9AtBjglK
   ljLnzRkcEnXnQuJFR9esopcZN6gah+PQYJS4WGqTTFcorz/OhFIOeuYkD
   S8Dma/QvzR/sBTG9VdLqmMZ4yMRXpr0PN3bPWTsi6yy5RLQkHAbj7eqoR
   Sf7+p4b7pdDedYBDL8ASKLjsnPiFFi+OpTgewEgiOWRp1ZiI+rXDTGQqT
   g==;
X-CSE-ConnectionGUID: 7auaKkahSYWqPqqkdAqQjA==
X-CSE-MsgGUID: fUWs4iK4Qaq1DzZBr7ephw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902149"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902149"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:41 -0700
X-CSE-ConnectionGUID: asB++BenSXigxysQmfwRdA==
X-CSE-MsgGUID: iae31fO5SSOmf0It5QNB6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104410"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:42 -0700
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
Subject: [PATCH v3 5/9] x86/nmi: Support NMI stop-machine handler
Date: Thu, 15 Oct 2026 21:14:22 +0000
Message-ID: <20261015211426.49114-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015211426.49114-1-chang.seok.bae@intel.com>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Kaplan <david.kaplan@amd.com>

Call the stop-machine handler from the NMI path in order to support the
NMI stop-machine.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
Sashiko raises a concern about coalescing edge-triggered events, such as
PMU overflows. But, not sure whether a practical issue or not especially
with this stop-machine use.

The current use of this facility has been to the microcode loader. Then
the mentioned case sounds like somewhat careless setup. Thus, the concern
looks theoretical, leaving the handling as-is.
---
 arch/x86/kernel/nmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 3c9f60d6ca5a..26f5ca1ac8a5 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/atomic.h>
 #include <linux/sched/clock.h>
+#include <linux/stop_machine.h>
 #include <linux/kvm_types.h>
 
 #include <asm/cpu_entry_area.h>
@@ -382,6 +383,9 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 
 	instrumentation_begin();
 
+	if (stop_machine_nmi_handler())
+		goto out;
+
 	if (microcode_nmi_handler_enabled() && microcode_nmi_handler())
 		goto out;
 
-- 
2.53.0

