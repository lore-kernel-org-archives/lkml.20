Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5A14A441F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306205; cv=none; b=HgmowCUkIyhlNpgtQUUZGJ6hfYIcDHmsIn6beDNaVMqVUUaq3JYwateThjXKHzXsNqGHBRVEF8Zx2D3uaHExIawhbus2zWuVlMGeX86WZqkAZsoKuS5kY+IYhtH/q82TPry2V5aPMQen6N8yJid/MNPu4jtRDg7mgwSljxL80dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306205; c=relaxed/simple;
	bh=kyl9h0+pSAZsZXBPZmOA0Ouninh5cmHwYUrBFiq63S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkwMk3VLJOVWjBjiPEjYaISsQnnbX1SCHdE4QJ59sOaf1CES+hBZ2xHFNQyxJwbSPDyxzXJHBvbR/xyRG+ycCv58hUdqV6gBOoNf1XzOeOsqH3tNs859F7sRnbcqWu4cmjWPh7TcESYEbxBSuLaDLJY+In2jhm7t0Cgy5QtQPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YL+/WNO+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL+/WNO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788306204; x=1819842204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kyl9h0+pSAZsZXBPZmOA0Ouninh5cmHwYUrBFiq63S0=;
  b=YL+/WNO+FJntIqj0N5EsU6oEAb8CD3mX94ld9Ln/lxpHN2RB+uAu+mAr
   Y7YSN7VXz/uww8is1Ku3Ge3fhtf2fkVJBBXJPqYEEGXt1kHu015zmHLWD
   2uRG192kbQmMDaskN98Fii2QwI3icZk6HqueGauR+SOg+DtULp4Ne2hn+
   WZmLeMv/S+Si2WJmOJkSQj0JQ8VFJ8l9BYHeLh6H9MyrMvOtcIwYbQAoT
   QYIkJHXhLfO+AGcsKweNp5Ny8G4hmIugV1wCYkHsuHEzmz/uETnBHWngo
   iM7zKj96Knm0g1/fXJdft8OL+g9+QPimjWNgK/JYpbhHVrD0O9vIgkJdG
   w==;
X-CSE-ConnectionGUID: PC5bXYeGRRCEk55KXFBSnw==
X-CSE-MsgGUID: kRKvUiUqSDaj+35gG4kwew==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87891885"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="87891885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 16:43:22 -0700
X-CSE-ConnectionGUID: dYjgyBq6RTe1amRy06oVyA==
X-CSE-MsgGUID: saeT48teRc2+dMnLXe9Exg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267469897"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2026 16:43:22 -0700
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
Subject: [PATCH 4/8] x86/microcode: Mark early_data __initdata
Date: Tue,  1 Sep 2026 23:16:29 +0000
Message-ID: <20260901231634.714144-5-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901231634.714144-1-chang.seok.bae@intel.com>
References: <20260901231634.714144-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

