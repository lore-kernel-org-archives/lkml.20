Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73444C10E3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100504; cv=none; b=Wl5O0AfRvsdh7xpGGcRB2X/KfYAaX+5EdwlvMptk9iNJxKfHfOwSaOj3QHzNFNsDoKuD+rSzKsgzn7mqJbYZAUj1fN1rlCGkrgsTdYGQmaYcKlQNNd5V+pcadHH3Oa6xF2ZE3FGdt3TIzeEBHeQIIGx8x4TL6h2A3W0zDm1Huw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100504; c=relaxed/simple;
	bh=OyCvodZEiLCE6GpSDADrAQ+xhLnZhGBgjBskBTmKLog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPMOyFvy98SDrvZlyT051ZkGc/n6mC9sskBwYYcqyXvTT0uZCMdBFiGv1M+3wulWL9nhHpN6LCPpsWFNy1wUfqHFdg50H8XlXXRDtlRLlkmd7JQ2FxGN/Kc/NnrZkHWSmGWRDCJwn1vW1XNSNS5HG/WyK1lrlsIZQ7Fg8wkLVzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3KcVRhw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3KcVRhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100503; x=1823636503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OyCvodZEiLCE6GpSDADrAQ+xhLnZhGBgjBskBTmKLog=;
  b=A3KcVRhwbFtXr0+GROWkUux86TEd1ftYKiVrgefEsvQ/pRmkINzzyZMn
   YNA9R5/+LubdEnjPqWVoKhXypaNpxL0AaVXht3XlkXO0bShIY9v/OJ8Sf
   kWTG958LHMy59Ull0zPY4u4IhwPDP+DI6D167sMuLGbacbcCijQTficKc
   mS/58HGUVW97ZEYyaHrsR4XsRUiuWEPFhH0TzSLqyZqU8tvFrRaVyAl6v
   BBabMFUs7brf3JMywPazBD65Zed7MVdBKmdK68mTQJ/zVF0o/lu0fCRc6
   AcxldfmOAizpeaTlRDYnE3nmXRSd4xkDnv518EmGkKYZIaM97cNXZY5wL
   w==;
X-CSE-ConnectionGUID: dXSjTXDxTKyJ9SsUt6GAhA==
X-CSE-MsgGUID: tnryR+qvRJCmAGHkYQfQmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902143"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902143"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:40 -0700
X-CSE-ConnectionGUID: blEGxSyoQG6yPjSRB7HLhA==
X-CSE-MsgGUID: +BtkBYV3SVy8C++9p3dAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104377"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:41 -0700
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
Subject: [PATCH v3 4/9] x86/apic: Implement self-NMI support
Date: Thu, 15 Oct 2026 21:14:21 +0000
Message-ID: <20261015211426.49114-5-chang.seok.bae@intel.com>
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

Add a function to send an NMI-to-self which is needed for stop-machine
NMI facility. Note that send_IPI_self() cannot be used to send an NMI so
send_IPI() is used.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V2 -> V3: Use __apic_send_IPI() (Sashiko)
---
 arch/x86/kernel/apic/ipi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/kernel/apic/ipi.c b/arch/x86/kernel/apic/ipi.c
index c627bee3b14f..2bb70db5ee27 100644
--- a/arch/x86/kernel/apic/ipi.c
+++ b/arch/x86/kernel/apic/ipi.c
@@ -4,6 +4,7 @@
 #include <linux/delay.h>
 #include <linux/smp.h>
 #include <linux/string_choices.h>
+#include <linux/stop_machine.h>
 
 #include <asm/io_apic.h>
 
@@ -248,6 +249,15 @@ void default_send_IPI_self(int vector)
 	__default_send_IPI_shortcut(APIC_DEST_SELF, vector);
 }
 
+#ifdef CONFIG_STOP_MACHINE_NMI
+
+void arch_send_self_nmi(void)
+{
+	__apic_send_IPI(smp_processor_id(), NMI_VECTOR);
+}
+
+#endif
+
 #ifdef CONFIG_X86_32
 void default_send_IPI_mask_sequence_logical(const struct cpumask *mask, int vector)
 {
-- 
2.53.0

