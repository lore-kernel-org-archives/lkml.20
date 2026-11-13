Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591715;
	b=QaKPk08l7hL/s/yOgCCb11f/xplnQgV0811ZTWq1+pu+mO95nPoorn2VVThg4f6TvE3W
	 6gqNgbrQmfDGqkI6zxcpV41LATJbbaped9DN/HT6BTSUlaCMJuFC14OoVc3TiawR33s9r
	 TyQf1IMvqUjCCziwa4FwgEI+G8hryDQuY0ipJV2aS5radYLPsGy1/nRrtGk/Mh7SPDfjc
	 2U0hBpXfCO2OpPC9zHVhhacmPykIKUXs1GgJEJc11blA8a7ThgPR1v7RLfFCJg8JdOYvU
	 KnX/XfvdAoaC/zLWzPHo5NeIlPilYkwR9lWAcIDsooVARak+GVpMp49dXwTjzmNI+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591715;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IfmSocrZvEleSEw8e1476dtq8P/mTSo2YReK7ZjdB2Q=;
	b=UCeBhdZVCcJ4cs7DXo7d+flJE6Mj4m2zb5zZzlSFjRo2dD+XB+ayE6yWpKZ9Ab4zQwi0
	 T1DiSS/jTBROgv5PwPfq48XkURGXhQlqfcuNWniYVM/vFTjlg3ZxwAz4IgDpMzx5FK8wT
	 rzoWbx//EQofCYoyLZOUYm5zkq4KEEmt4Yeltigrfmad2ND9ABErDKyM3dzVYLJ3HYWTX
	 7d+oZ2v+dqX8cbAWYM2u80ityoyjuKkVud1ZEF7XpLTtA+xS6L9urK9wWF/gF8DwFM+Sf
	 NWjBgEnN5uXMPH9G81WTcqlsbXMoMUXK8kdG6fYBPgn5SZTuzZbF9b76ae04rOHJ64A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEJHnZ01;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8D6070F16
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F8D6070F16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEJHnZ01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794591715; x=1826127715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yhhgobd8eM/gIokmkqi2ACthXUuyo2eBk292YnghZ/k=;
  b=eEJHnZ01FlWR/E3j5BaDAlFxyZsiY46LFAOzJpxfPjqEsZqeISXKrN2G
   3oMu16wGKi8j27S+rj/5vw42UdJfUXVTQMR9ah5xFl71D/NfKQp2KwTgv
   quQef0xJPndSKOak3Zet4qXdeaQ7ytm21jnDQ+OG3x5lI+ig5z3rDH4zS
   KUCFFI8IdOvqB8rKkl3JkZIHMAmuGgfIlxCBKW3soypjsQkif38aY+SJa
   t65lRSa74uZZK4jfEOR7GcTNi3ffcDSOu+bm27NNmMrguc60LJgSGQipl
   F9XU/keA5YyZOt+C1DmCijoU0c+eNXXrEK7xsQeyI+HF4S9YqGAQWK7XB
   Q==;
X-CSE-ConnectionGUID: U79lyk2lRGmjBda8B0yXig==
X-CSE-MsgGUID: nnn6Al9vQxC+z+AKEAJvFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3415604"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3415604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:41:55 -0800
X-CSE-ConnectionGUID: f8HBsq0fSe68/GlFMYl16A==
X-CSE-MsgGUID: piIFZ4jCR8mp/xSrHgi4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9290941"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO agluck-desk3.home.arpa) ([10.124.222.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:41:54 -0800
From: Tony Luck <tony.luck@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH] x86/cpu: Add Intel Coral Rapids and Razor Lake CPU models
Date: Fri, 13 Nov 2026 09:41:45 -0800
Message-ID: <20261113174145.13513-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
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

November 2026 "Intel Architecture Instruction Set Extensions and
Future Features" published the model numbers for the upcoming
Coral Rapids server and four Razor Lake (two desktops, two mobile).

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/include/asm/intel-family.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
index 66d964afe18a..2a5761d475b8 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -129,6 +129,8 @@
 
 #define INTEL_DIAMONDRAPIDS_X		IFM(19, 0x01) /* Panther Cove */
 
+#define INTEL_CORALRAPIDS_X		IFM(19, 0x08)
+
 #define INTEL_BARTLETTLAKE		IFM(6, 0xD7) /* Raptor Cove */
 
 /* "Hybrid" Processors (P-Core/E-Core) */
@@ -159,6 +161,11 @@
 #define INTEL_NOVALAKE			IFM(18, 0x01) /* Coyote Cove / Arctic Wolf */
 #define INTEL_NOVALAKE_L		IFM(18, 0x03) /* Coyote Cove / Arctic Wolf */
 
+#define INTEL_RAZORLAKE			IFM(18, 0x06)
+#define INTEL_RAZORLAKE_L		IFM(18, 0x07)
+#define INTEL_RAZORLAKE_U		IFM(18, 0x09)
+#define INTEL_RAZORLAKE_S		IFM(18, 0x0A)
+
 /* "Small Core" Processors (Atom/E-Core) */
 
 #define INTEL_ATOM_BONNELL		IFM(6, 0x1C) /* Diamondville, Pineview */
-- 
2.56.0

