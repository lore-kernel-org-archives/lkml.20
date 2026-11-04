Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818269;
	b=jPTMXBs+NWjrLqvMnZNj+Llw3zBRSsSM55XBSLyPWxJzOJHoi6ub9P76p00PxoKlhC0v
	 Ax+qXpb3H64DvNtsMa8VhlPYSI8cYpBkbL31NmIEFT+lAmrszu5wUeKmg0UkTc1jo9DIx
	 0xHOOlFHEwucQ2EfPSaPLpXHL0nLfSTF3c5x/gQrOJcULLEEMbqLuwvnFqZjz92HeCvjQ
	 OvFYvSgOzaCYSV3TmHqA6qnr4ttyN6lGbRZaZ/5ohnwckmZu9Ck0yzC9j9mEYbFbIc8V9
	 WUXUsNxzwTDJDAUeexgb8V12BzORYzlvMeWpDbvR63LKUfTjqXmK4hgydgrUo7cMcLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/4cAdjhJ5ziYfojLwWjxoShpT2PFrhIuz2koL1okuLg=;
	b=u9IIvI9WiIN5OLhx1qzxhGBo302nld2gWY2r6X0ju/Xd1g4yk5fFciZS7WyBwW1JNW+z
	 Tblg9KDuapzDmdep11X8hpLk80gv19S5Kp+rW9he5aNgJ4dJ1G3FbDKOTE0hJGOxdfSc7
	 Av8lZdg2TKx80l64RhUk1jR3ygPxKZnSEQG9XgtqKSqSxzqG36xdday1eNDcABR1NApTC
	 h3nCihG6ThcbvfTzY9Rk769yYqUtSvwb1a0PMH6ANv0blZ2QuxzwcfZogutGY+o75JZMa
	 bXRIswcY8nupt5/2K1LA9ahIkQuNZnV9pzBHNAKjU2ADusB170DME/zUjP5/m2YbOcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cnMvd3z6;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F6B606D82D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34F6B606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cnMvd3z6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818269; x=1825354269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FzwbThUHiPixMrUYQwwXHx90odvwWYSfDleapC/xuNU=;
  b=cnMvd3z6TfxBfckI99yVD7JiQtffRQcvgTdt/LKPp0bnv/Nj2W+VepGU
   xQR+vkYydbf2qTVhkv5swh8CTUXENM5ryzf+/sCPN5tWlJ1NWEFTts0na
   hcUITXWCc88wFrV3GJWV7IFO13kmRIvzGabptcBCrb44sa+o8EDSF5mT0
   jR8Fq7odkE0ge1xOv6Nb/tBZfh2zCVMpZHdBbPxJj09qjkzl79MId9977
   xxkwRbX9RdS5+GNz93qpsXwhovzyOkkcNvPGL2Mm6P0K5jsE/FsC9QMfs
   kzktSvibWxmi9scN8Tpiz4TJylg7EohfTgngVf7+I7VoSBkA9Lp82UBBe
   A==;
X-CSE-ConnectionGUID: zjreGVj5TueHlpKSwTb8kQ==
X-CSE-MsgGUID: xpTBIwlzRaO0oCQb+hpNUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485083"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:58 -0800
X-CSE-ConnectionGUID: IgOnguxIQ1G18OPVf5kWKg==
X-CSE-MsgGUID: NEXUPpWIQnOAZMGrnKMOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336847"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:57 -0800
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
Subject: [PATCH v4 8/9] x86/nmi: Simplify offline microcode handler invocation
Date: Wed,  4 Nov 2026 18:23:21 +0000
Message-ID: <20261104182322.578066-9-chang.seok.bae@intel.com>
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

The microcode loader now uses the stop-machine facility for NMI-based
loading. The offline handler is the only remaining user of the microcode
NMI static key.

The handler already checks whether it is enabled, and how fast an offline
CPU handles the NMI does not matter. Instead of the static key, check the
build option.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/nmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index e3660b8b8f38..11c965445bdc 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -553,7 +553,7 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 		raw_atomic_long_inc(&nsp->idt_calls);
 
 	if (arch_cpu_is_offline(smp_processor_id())) {
-		if (microcode_nmi_handler_enabled())
+		if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
 			microcode_offline_nmi_handler();
 		return;
 	}
@@ -715,7 +715,7 @@ DEFINE_FREDENTRY_NMI(exc_nmi)
 	irqentry_state_t irq_state;
 
 	if (arch_cpu_is_offline(smp_processor_id())) {
-		if (microcode_nmi_handler_enabled())
+		if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
 			microcode_offline_nmi_handler();
 		return;
 	}
-- 
2.53.0

