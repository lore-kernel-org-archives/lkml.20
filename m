Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1842C15A9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173308; cv=none; b=UIAVBBo8AsNlmhxH6UFNzPHncSZjW8rkdtGdA94YZJDYioH/oBsuE/PlYcUKJA3SeBaEsqdSLptf+vEF1Os1+bjG0sE0wY3W0RM+blUOJnkrtsMSYl2ICZKg6km9sHM9hXiWqyGudj3q5FPnsdkSH0kqj9RoRvTY3BhMAClZq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173308; c=relaxed/simple;
	bh=ehTJT34x1/pVjPr0qCrycXzF3V5ZsU1NGkIp4eVinhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCpTRTsCXvb7nQeF4rikNllHOw5Du6E2ApPY6JfN1RD8l3yrPheSsw1+t/QyK3iYtzi+qzccifEUf4pPul/WgVbK6cZwiifc8+iMgHuxrX28F3KGbmlIWlNCP5Mm3hEdXLl7yr99IBwC9tn2RnTiSG+UtYdefpxKgpW+4wER4BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oH150HE/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH150HE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173307; x=1820709307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ehTJT34x1/pVjPr0qCrycXzF3V5ZsU1NGkIp4eVinhg=;
  b=oH150HE/dJ8N4coHLA+O5PZGFJ0+sW0dXoaZIwF+QQ/I8b8bYUV7sA39
   UTtHioUwBO85nAgAk2xcbUoXMcS0/XkdipBIPW9Y0neM1/MB3VjXArZVs
   0lC8OYU6BZhx5TS+aMw6PITBI+SgLKQFLc7xdHTrooIdwYNL59fPEITIR
   NNmSfmH9PBt8Yqj8zXao4iNjeOeZNuLQRuCWuuUsAbk/yTftmj2cxI3Jn
   X2AHUuBrtbqug57fZtV+v+pQ6nqKid2pQylDO9LPpUejV260/FtBdl8p/
   X/ZM+wowFmdDYqzbNiMK2z2y8gGmEeA0qx9Gmxa18qxJxF/putsL3OVBJ
   Q==;
X-CSE-ConnectionGUID: QykqZWs6RR2puOkBTEu7JA==
X-CSE-MsgGUID: sPydq6WwSxaGMa1wZWUtrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174974"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174974"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:35:07 -0700
X-CSE-ConnectionGUID: +Ggx/10iSB6o/rT/zENWQQ==
X-CSE-MsgGUID: 7/P339MVTEeTdEp7TORK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217642"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:35:07 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 5/8] x86/microcode: Clarify online enforcement with uniform loading
Date: Sat, 12 Sep 2026 00:08:11 +0000
Message-ID: <20260912000815.997720-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912000815.997720-1-chang.seok.bae@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode update process requires at least one primary thread to
oversee the update for each defined scope. Currently, the kernel mandates
that all SMT primary threads remain online, assuming a core scope.

When the loading scope is extended to cover a package or the entire
system, this enforcement may be seen as unnecessary because offlining
more CPUs is affordable as long as at least one CPU remains to
participate in the microcode loading.

The nosmt option can be considered for practical reasons. But it is
impractical to aggressively switch off cores during such system-critical
updates. So, the current online enforcement isn't expected to be too
excessive even with the uniform loading.

Clarify this consideration in code comments.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 36f08e2c99fb..8f617745d4d0 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -719,6 +719,12 @@ static bool setup_cpus(void)
 		 *
 		 * Ensure that the primary thread is online so that it is
 		 * guaranteed that all cores are updated.
+		 *
+		 * When the loading scope is extended beyond each core, it is
+		 * not strictly required to have primary threads online.
+		 * However, during such system-critical updates, offlining CPUs
+		 * besides the nosmt case isn't a sensible measure either. So,
+		 * this mandate remains considerably benign.
 		 */
 		if (!cpu_online(cpu)) {
 			if (topology_is_primary_thread(cpu) || !allow_smt_offline) {
-- 
2.53.0

