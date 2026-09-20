Received: from mta1.migadu.com (out-11.mta1.migadu.com [95.215.58.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA31799F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789874979; cv=none; b=hJHANnjC3oTYyp+KIjtVlZU2my7dYhqRsplOaAIihrTD6s25wfq5uFEc8iHTMQd1DgaK4U6asUTYuP5qOQBiUS8IJshQdXtNpMFzc28kHtVe2zOj6WERuY1ALzgnQ4zurgvDVRtElX46G3vPlwfrWOsSoAAxpNlSXLe4zQDm8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789874979; c=relaxed/simple;
	bh=V4Vz6gidKP+9XlJ5npYvmEGbYAGJM9YPmsRmNHIjUZU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Op7xKDr9tDgvoFmgmeQf6AnlSfOCMf+hGsLQ2Tloojx1SAStqQ/5f5dKO5Yc3l7DhcwraE/LYUfXE76BbZj4ypyg1xuqW5edL3XtDLe727LZGUgvC3dfZgjifE57nKlzfIcfZKzrIePdKtsyyM/RH1+x5w4HrOHEmkJJ8by/eJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s4+s26is; arc=none smtp.client-ip=95.215.58.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s4+s26is"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V4Vz6gidKP+9XlJ5npYvmEGbYAGJM9YPmsRmNHIjUZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874975; v=1; x=1790479775;
 b=s4+s26iskR4xXj+2JCWRYfYHQ6DBP+/JkIYWvDm3QM+oiw9NNm2DNS2kFAu65OgkTfsi/WMI
 azBq+vRlo8i+FUJukbE6Yk9VPijHiw+2x0yUXGVYg/0zHZisuOo8Rj0wqJPOT0JTNbcW8yW1bMr
 51T/L0o/2N49FPH8CK7MOvjw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1de7dad217777a35;
	Sun, 20 Sep 2026 03:29:35 +0000
X-Mizu-Trace-ID: 1de7dad217777a35
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: errata: document Cortex-A9 r4 as affected by erratum 754322
Date: Sun, 20 Sep 2026 11:29:23 +0800
Message-ID: <20260920032926.452884-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D),
section 2.3.3, lists erratum 754322 as affecting all r2, r3 and r4
revisions. The Kconfig help text currently mentions only r2 and r3.

Add r4p* to the affected revisions so that users configuring Cortex-A9
r4 systems know that the workaround also applies to them.

Link: https://documentation-service.arm.com/static/608118675e70d934bc69f143
Fixes: fcbdc5fe6ebe ("ARM: 6772/1: errata: possible fault MMU translations following an ASID switch")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 arch/arm/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184a..c7d631d5242b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -708,11 +708,12 @@ config ARM_ERRATA_754322
 	depends on CPU_V7
 	help
 	  This option enables the workaround for the 754322 Cortex-A9 (r2p*,
-	  r3p*) erratum. A speculative memory access may cause a page table walk
-	  which starts prior to an ASID switch but completes afterwards. This
-	  can populate the micro-TLB with a stale entry which may be hit with
-	  the new ASID. This workaround places two dsb instructions in the mm
-	  switching code so that no page table walks can cross the ASID switch.
+	  r3p*,r4p*) erratum. A speculative memory access may cause a page table
+	  walk which starts prior to an ASID switch but completes afterwards.
+	  This can populate the micro-TLB with a stale entry which may be hit
+	  with the new ASID. This workaround places two dsb instructions in the
+	  mm switching code so that no page table walks can cross the ASID
+	  switch.
 
 config ARM_ERRATA_754327
 	bool "ARM errata: no automatic Store Buffer drain"
-- 
2.43.0

