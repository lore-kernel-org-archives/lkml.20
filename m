Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849207;
	b=sHWZMAmmejxXPQN5s+K9FDcwDJY5RVlr9HLYkNTZTd5gAa/FxuJ+uztZCmFaLF7+j/t3
	 Sn3yyxlzVOLU+NrKQvB3dHtv//3imlI9NgwEu9c3xpaySifcWom+Vn5d2VtGzWmL/fl3z
	 CBnEBIVZLn33mdCqA1CuB+pj9qZDlkGkRn3ieRbCX/UHX9uDrtLghJxlerKKa6ZLgXeDl
	 nvL4aObeE7RAtrSVGe4RazlqlQCWQ9n9YSPGhOOxNuO3+GwzCDkvTE6V9y+ea1isvuLf2
	 94iOqdEl2VYgrAsbo4G2JwY9RIobWvlOZqClWWToNdmH3Q36hBf/qp/yzbswC4qmnyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=li79xPcgc4MHN4k2Cx3mrfHBgTOjsGQCNtP6KxVsdB8=;
	b=dPWFkugSPbjsoeVJwRlwKTBV9BOsWlRHVlvvsa3UMZZwt82rI1HOECJTkIqwvrkmVkJA
	 HAGvQes5U5Qxa8JS51VOiqcFz90r8M6ISz4TJuDTzLQdwV+ojaRzjt94Ev+92ZTccKGcw
	 CtvbD/0njX/6c+Ortn8/30HcZrkD4WDZqQVHK5677T0CRakzPomiTBrj9tpcxDc0dSPiu
	 7ZXh58oXQEQROkzGZCLxKhciTz+nZt2CvgmUR2l4JQFqky4Z2r5emkhLIJHZjfQps8lUb
	 2gDc058S/LPDqO4oEKIqxizO4a6athwui0Wx/3YPVEYR/OjUFiAYO1XJozy+R72qFcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="WCZ/QQ6Z";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33237606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33237606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WCZ/QQ6Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794849208; x=1826385208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kyl9h0+pSAZsZXBPZmOA0Ouninh5cmHwYUrBFiq63S0=;
  b=WCZ/QQ6Z9a/0UNvO4Nz7Gne1azXBNxtm5WRpScZzmR/rSW3S7xrMpyV/
   Q3AYqKfOuq1ZkZ/jSzboeMZdKhfWoG8RIuz8quFRUtnJvwxpCQXI1809e
   3XltTjwcEHWxlUisFf8ReJujTFK38makwCb/Mx6Xxq/92o77tfhkRi+2F
   Q/6cbIcYHaQ1bM29lp+nEDTMtDCxjpGBWKOZa1zPRXNrt9N2z3QLU5eLV
   nJn4Cpq7CUtz/TFsvRy/Wxr90ZitrozGvef8py1HeUnWJFMxCBKBsNTsN
   jpFclkBb3aXSBlXfX+rWn02mOptnI/0RZuzesaB5zIDOJuHjtFqOyCfA8
   A==;
X-CSE-ConnectionGUID: j/bbHakpQk6msS9JKyXSIg==
X-CSE-MsgGUID: 5Db9j/buQmyN90AnBshCxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627206"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627206"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:13:25 -0800
X-CSE-ConnectionGUID: 7woONt31Qnu+vG05wZ8ipw==
X-CSE-MsgGUID: jvGGr6F0SpS6N9+tAYnGrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9491526"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 09:13:24 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	andrew.cooper3@citrix.com,
	arjan.van.de.ven@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v2 3/7] x86/microcode: Mark early_data __initdata
Date: Mon, 16 Nov 2026 16:45:44 +0000
Message-ID: <20261116164548.900486-4-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116164548.900486-1-chang.seok.bae@intel.com>
References: <20261116164548.900486-1-chang.seok.bae@intel.com>
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

early_data records the revisions seen during early loading, and
microcode_init() is its last reader.

Mark the storage reclaimable afterwards.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index af7196d94540..ed1eb6b753d6 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -83,7 +83,7 @@ static u32 final_levels[] = {
 	0, /* T-101 terminator */
 };
 
-struct early_load_data early_data;
+struct early_load_data early_data __initdata;
 
 /*
  * Check the current patch level on this CPU.
-- 
2.53.0

