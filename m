Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818252;
	b=j/QZAuJsloM6b35h0oliIOupe0Uq9o61joBfpDQJhePSv/4yvlnK5JwljXMKEadZm5Ew
	 wSo0ximpEyaD4kn6Qyn68G1jFnLlMY++9GcZkmb8VzYac6qee5NyJ2Ekw4UB4/HSK2kx9
	 PFlXuUqRLo1BGei1z7q5laCFl3d/u0VW0eBjH9GszxGVAsd08ny/HuOUz2dhvL8H4XyEv
	 XQXcnpQDd8/Gn3b9Q+0fw7/Hm/AMFuaCghOb1vxNdA8jQ9ZfDW4Mfe9lp8xMzA8vwcTZ1
	 ZTQ4GE7vQ6MY8eEtHdSYfMFXdWrJ8z5bR31fNGPjd7+5lxsZBhT1QrxZKythE0FcmZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818252;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2C1T18cLayh6MkUq4urEFqvGOruStImJc3zJPEGMROE=;
	b=h4+OqDuGlXRXuGRapaKF5aI8wYG7jqcJWymxZbzH+JdPKPHJDChLBqEMA6hO9Sdul9La
	 mre9tiD80oMXl86lV0Ep4dZm2JU0uvvEFJGaZJPrKXHH3j4SxLEFhG6d3JmY4dSwGMaF+
	 2W/MX5X3WSQOD9y3NW6ixSKtRuXvf9a9EkMphOR0/AF2bpjcPtF9cJ7GF/QBr5AyYPQtC
	 +iB0orSwfPPtvPO6wP3OCbKR6pM0UnQb0wBntGsYWVzomgBwfeASqJ6afwtxDCuSiBVIf
	 9a8iy//VGjutUegEbV3yDs1K3yJEc1evMnNRKIEy2no2gEsNy2tG6mLXaOwFJ2JWDLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9LglIkV;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4AE60A3816
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4AE60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9LglIkV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818251; x=1825354251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6oZQq8996xljqWZUlK8oc4H+5r8Y/uidc7WKYKuDj14=;
  b=K9LglIkVHooEaLAGnA4G+f2KyedY1CVtKdqH7qA2z7TQS6UrNSXNU4sy
   ODEtpV4BFUV8CHDfRERAY6gLiSdDQ9jkqs4Kqx0mdPlGq6xQYf6qI2Ail
   OxsgszUKzgFgBh3O0/6tQjSOEBCvCKAUMk+f0h44RD9Vylzx+VLlKEsVC
   OYMLX2mbTlCSlNTMFa/igp/3P1xrx6g+tvAgnKDAdBpNQGoiyExejND2k
   b/BetghZb1HXJQ8YIyBKXARC/2SA9iuW/Ow5cwCQD7s41+fUYczdSudtN
   RKRH+rarpwXnIAuabPjmN43HfCeQh50TozGV5XYFDIjd0e6oNSHaUhJ0/
   A==;
X-CSE-ConnectionGUID: t+c0wCy8RKWCcXa4DrZGgg==
X-CSE-MsgGUID: jiNousw2TdqmggWtH511Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485034"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485034"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:49 -0800
X-CSE-ConnectionGUID: 3pSH8W6tRVanfPU2uFeQ6w==
X-CSE-MsgGUID: fz3rmjzOTuiCfPHOuUCfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336777"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:50 -0800
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
Subject: [PATCH v4 4/9] x86/apic: Implement self-NMI support
Date: Wed,  4 Nov 2026 18:23:17 +0000
Message-ID: <20261104182322.578066-5-chang.seok.bae@intel.com>
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

Add a function to send an NMI-to-self which is needed for stop-machine
NMI facility. Note that __apic_send_IPI_self() cannot be used to send an
NMI so __apic_send_IPI() is used.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
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

