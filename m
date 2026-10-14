Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE313C2774;
	Wed, 14 Oct 2026 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971602; cv=none; b=VQgTyxS0GbuscKmOh5f/ht9gT8m6g32S0eQssz5tJto9skoJNWwundKYxFNWaP4nfoOg9WSuVI0Gq3iwyfN0reG5y2stnc2HsPoThfFz7BU+Gze7sn7HZgG+ugawMSfbc8/DpreCMN8EiVQtiSDhADGiQJcfDymMqrInbooigPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971602; c=relaxed/simple;
	bh=71Nb/diD0RFkIlqGupsPVxEdRSByfY6gUGToH1EH1XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eb26lFsb1RIUaFuohgbfjjrnvEtntCHtzFHfokHBV5yRuWLOwjAxbvndTY9v5e25B5qORCPDPbXSVi/A1HAtkjrzskZ6Hlj5t9G/yhNCP3wDr0a4hmNUpXcfNrFirlcb7r9ouzkuSuEH7nTPuYthwLHbP5Y0t2Xa/fV3+ymTeWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=THlFOC+8; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="THlFOC+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=20
	/IVJDdeostxRbcAR4r2TFhHfef4iPbpNq8zOKeLNQ=; b=THlFOC+8TygI4enULa
	5S0Cqho3L8vkADWlx3D8kSIs3c4LaHeyZqYrhJhIEaoQWCKCfkg0lOj7kxxa0BAX
	DgqIzuOtUWiDgOI2k+VMx4hJrzdi/A8YuxkfEhQKxKuYRajZXWf7LbtI+zi/a6pe
	lS4A9mUzfeR7z/EOGAmgigNkU=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnT1LpUM9qHgaBEg--.10621S2;
	Wed, 14 Oct 2026 17:52:41 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: elver@google.com,
	dvyukov@google.com
Cc: kasan-dev@googlegroups.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/4] kcsan: add targeted watchpoint selftest
Date: Wed, 14 Oct 2026 18:52:37 +0900
Message-ID: <20261014095238.2132580-4-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT1LpUM9qHgaBEg--.10621S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF4DJr4DKF43ZF45uryxuFg_yoW8trykpr
	4qkr45tw4FyrZaqF4fCFy8ZF1rJrs7Cry7t34Igr4kZ34agrs5K3s2kr4qkFnIgFZ0gr1Y
	yasrJF1UCay5XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjv38UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QncPGrPUOnUIgAA3q

Test targeted address matching for exact and containing access ranges,
adjacent ranges, zero-sized accesses, and boundary addresses at ULONG_MAX.
These cases cover subtraction-based matching without runtime debugfs setup.

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/kcsan/selftest.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/kernel/kcsan/selftest.c b/kernel/kcsan/selftest.c
index 84a1200271af..8da1ba2ba25a 100644
--- a/kernel/kcsan/selftest.c
+++ b/kernel/kcsan/selftest.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/kcsan-checks.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/printk.h>
 #include <linux/random.h>
 #include <linux/sched.h>
@@ -101,6 +102,33 @@ static bool __init test_matching_access(void)
 	return true;
 }
 
+/* Test whether an access contains the selected target byte. */
+static bool __init test_target_matching(void)
+{
+	const unsigned long target = 0x1004;
+
+	if (WARN_ON(!kcsan_target_matches(target, 0x1004, 1)))
+		return false;
+	if (WARN_ON(!kcsan_target_matches(target, 0x1000, 8)))
+		return false;
+	if (WARN_ON(kcsan_target_matches(target, 0x1000, 4)))
+		return false;
+	if (WARN_ON(kcsan_target_matches(target, 0x1005, 1)))
+		return false;
+	if (WARN_ON(kcsan_target_matches(target, 0x1004, 0)))
+		return false;
+	if (WARN_ON(!kcsan_target_matches(ULONG_MAX, ULONG_MAX, 1)))
+		return false;
+	if (WARN_ON(!kcsan_target_matches(ULONG_MAX, ULONG_MAX - 3, 4)))
+		return false;
+	if (WARN_ON(kcsan_target_matches(ULONG_MAX, ULONG_MAX - 1, 1)))
+		return false;
+	if (WARN_ON(kcsan_target_matches(0, ULONG_MAX - 1, 4)))
+		return false;
+
+	return true;
+}
+
 /*
  * Correct memory barrier instrumentation is critical to avoiding false
  * positives: simple test to check at boot certain barriers are always properly
@@ -251,6 +279,7 @@ static int __init kcsan_selftest(void)
 
 	RUN_TEST(test_encode_decode);
 	RUN_TEST(test_matching_access);
+	RUN_TEST(test_target_matching);
 	RUN_TEST(test_barrier);
 
 	pr_info("selftest: %d/%d tests passed\n", passed, total);
-- 
2.55.0

