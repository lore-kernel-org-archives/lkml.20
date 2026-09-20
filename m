Received: from mta1.migadu.com (out-233.mta1.migadu.com [95.215.58.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF51891A9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877273; cv=none; b=e4Z5KvUGgbsDsc4FZgx1ZoC46qculnDp1Kx9ilRJMo8+Twp3hHTrGKh01tevC1op2Rfp1lBRkhOztpL2MlwO/sarf1JFUisq01gWUg8kEHxl0IlhItj6Ii6D7i7e/eQwcYy5qVbAzdfQNSgUyAAhJBIhw31T5M6uunpWgzwUjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877273; c=relaxed/simple;
	bh=9X3Bhso6oyEXBNzc++2m2lbiMUmTnbOGNs5Z6OlLWX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdijJZW8uPV/Or8FAhcf9rr+0fkbMvYcUfZi8eUsBZVrb6fK00otcSthL6OhbRffMHgXwXWWgFVLMvL6MZjUgW9J/bRLqVkwBotWP6J8bgkeb96TQkP+cZr8rQZO9NbzfZkh2ydxMbOCd6Yosw+cSijgT9h/4LuSYNCEZrHYh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iSYbZxna; arc=none smtp.client-ip=95.215.58.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iSYbZxna"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9X3Bhso6oyEXBNzc++2m2lbiMUmTnbOGNs5Z6OlLWX4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789877267; v=1; x=1790482067;
 b=iSYbZxnaWcQm7+3NtaWHfclN2h1wPSVIxL7hjSxxTrSlH41ICEgzZinFAEWFAzgQoOWYXs6z
 fBXVMnooeBE0watSJPWgHD+65BZVefmRF6X7k4wafKsXGxGWXrmQhTyKQi53uBoWrcwhc7xD0j+
 nWDvsE/vy/9hB8pd/fbM01cc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 420bf5996cf0c15b;
	Sun, 20 Sep 2026 04:07:46 +0000
X-Mizu-Trace-ID: 420bf5996cf0c15b
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jason Cooper <jason@lakedaemon.net>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Gabriel Rodriguez <lifehacksback@gmail.com>,
	Qingfang Deng <qingfang.deng@linux.dev>
Subject: [PATCH] ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x
Date: Sun, 20 Sep 2026 12:07:37 +0800
Message-ID: <20260920040738.466563-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Armada 38x uses Cortex-A9 r4p1, but MACH_ARMADA_38X selects the
workaround for erratum 720789, which was fixed in r2p0, and omits
workarounds for errata that still affect r4p1.

Drop ARM_ERRATA_720789 and select ARM_ERRATA_754322 for faulty MMU
translations following an ASID switch and ARM_ERRATA_764319 for
unexpected undefined instruction exceptions when reading debug
registers. Also select ARM_ERRATA_764369 when SMP is enabled to work
around cache maintenance by MVA failing to reach other agents.

The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D)
lists these errata in sections 2.3.3, 2.5.10 and 2.3.4, respectively.

Link: https://documentation-service.arm.com/static/608118675e70d934bc69f143
Fixes: 9aa30f1c13d1 ("ARM: mvebu: add initial support for the Armada 380/385 SOCs")
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 arch/arm/mach-mvebu/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
index 9f60a6fe0eaf..5203b5cfa457 100644
--- a/arch/arm/mach-mvebu/Kconfig
+++ b/arch/arm/mach-mvebu/Kconfig
@@ -55,7 +55,9 @@ config MACH_ARMADA_375
 config MACH_ARMADA_38X
 	bool "Marvell Armada 380/385 boards"
 	depends on ARCH_MULTI_V7
-	select ARM_ERRATA_720789
+	select ARM_ERRATA_754322
+	select ARM_ERRATA_764319
+	select ARM_ERRATA_764369 if SMP
 	select PL310_ERRATA_753970
 	select ARM_GIC
 	select ARM_GLOBAL_TIMER
-- 
2.43.0

