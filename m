Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A536A2264A3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790041950; cv=none; b=p6qlk58cnn7sg5FCnzFzrbxgojXhsiYXZQwv6vhZdXm+osmSquKK9tN4fDEGkljGKa6HKO4EZxOF2LLtiXmZZjDLMUmy6EyNDxYuy3l3jjED9mVddBy8A148P8US2enYBwwPOzZm0QYcboSM/bZKHSq+wboA6JfQd3yiD1u6Lrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790041950; c=relaxed/simple;
	bh=OqF9kei5qlJSCHIPkD+YpMEInt/xj3tmUHukrVzxAyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tq3Tt6Ui0uxcbUCPclJ+NnbgsMWOu3wj/f4oU0OiPOGT37EtzAiSOkthU0KURNB9G9+lqHrowVHWMdwPqAQCxVD7+8oz69H7pmXdABTShEJlO6M4EqEeR1FqdxR3Ip0ae9OZo5SZQB7w99QJkv5iBOrKrxaxWaK+VN7V7cjxBSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j/CNfqX6; arc=none smtp.client-ip=91.218.175.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j/CNfqX6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OqF9kei5qlJSCHIPkD+YpMEInt/xj3tmUHukrVzxAyg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790041945; v=1; x=1790646745;
 b=j/CNfqX6WGtjEqH6GjAWAmTbRIqv2KdqKGO4WPfyQ/9ySTWn8MadgAyI9NEsK/J0xCfsSJX+
 Eod2dcWo+gzQgpGsn59d4Rs396UbDt7UwEum/YL/VCr44xSp1FeO+w4OYk38UpulJZWPYlo7PFq
 gQW7xlADLKvO07vQXIRuXf1M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b67e6e7cac50933a;
	Tue, 22 Sep 2026 01:52:15 +0000
X-Mizu-Trace-ID: b67e6e7cac50933a
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Qingfang Deng <qingfang.deng@linux.dev>
Subject: [PATCH v2] ARM: errata: document Cortex-A9 from r2 as affected by erratum 754322
Date: Tue, 22 Sep 2026 09:52:03 +0800
Message-ID: <20260922015205.253872-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cortex-A9 r4 Software Developers Errata Notice (ARM UAN 0009D),
section 2.3.3, lists erratum 754322 as open (unresolved) and affecting
all r2, r3 and r4 revisions. The Kconfig help text currently mentions
only r2 and r3.

Update the help text to include all revisions from r2p0 so that users
configuring Cortex-A9 r4 systems know that the workaround also applies
to them.

Link: https://documentation-service.arm.com/static/608118675e70d934bc69f143
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v2:
 Drop fixes tag, and mention that it affects all revisions from r2.

v1: https://lore.kernel.org/linux-arm-kernel/20260920032926.452884-1-qingfang.deng@linux.dev/
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184a..ec0c6191161f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -707,8 +707,8 @@ config ARM_ERRATA_754322
 	bool "ARM errata: possible faulty MMU translations following an ASID switch"
 	depends on CPU_V7
 	help
-	  This option enables the workaround for the 754322 Cortex-A9 (r2p*,
-	  r3p*) erratum. A speculative memory access may cause a page table walk
+	  This option enables the workaround for the 754322 Cortex-A9 (r2p* and
+	  later) erratum. A speculative memory access may cause a page table walk
 	  which starts prior to an ASID switch but completes afterwards. This
 	  can populate the micro-TLB with a stale entry which may be hit with
 	  the new ASID. This workaround places two dsb instructions in the mm
-- 
2.43.0

