Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F94EBAD9;
	Wed, 14 Oct 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971617; cv=none; b=nFfq98HfN8ylEn1TPRF6PGkp14twzrPAJq5P9PMHJKFHg/gwBHuaedJu+/e/HJpptc4ugw9y4jBvysVvebHz+uf3qF/20CaeM5BX34DnZa8smfnzBO1SzrNdVbwomepmKx2b8RWZdBcQbfcjGqwjHCjyKRjwV18sgGXEJ0VWSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971617; c=relaxed/simple;
	bh=+SGUHeXJ57F2Mpv+qNpgElt5SAUUVs5Q6souLnxLtT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n63wE2Oj5u2ODE6OSiDYMD4dTTup+2qAkYDYfIQ8+ddO3DYtx6HUwniODJfBrWhnErSvDqBPC8gemjFE7iD07iQn3o9zrmBi5VxV7s4W4759h0rJeo5wQpXFjkupQNres09QgUz/NCneFIuPrlyUBBEtdItQ6LLEcTvhDHvIjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I0Fju+P7; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I0Fju+P7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qY
	rqh86X0eiu0m0F1zP9zRf5veeygFRMYWUgJ9Tnu0Y=; b=I0Fju+P7TMZehKQDwE
	OfjoM6RN31CTbsg1tFvd7ICPEnorwRW9wha4zM7F6bblkOeZT5/b2U6OOImvZGLG
	q5EhLEs3UCQ4E+VsxzrCNN/PUg7FthdutSX0/eSFIu0j/D3IwIkqk+C9xDwN4s6v
	ZX2oQ20uky6cs4znM3G+L4dpM=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnL1_qUM9qXUxbEQ--.1163S2;
	Wed, 14 Oct 2026 17:52:42 +0800 (CST)
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
Subject: [RFC PATCH 4/4] docs: kcsan: document targeted watchpoint sampling
Date: Wed, 14 Oct 2026 18:52:38 +0900
Message-ID: <20261014095238.2132580-5-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnL1_qUM9qXUxbEQ--.1163S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1kJrW5Aw4UtF4kXw1kZrb_yoW8try8p3
	y0krWYqFWkJrW3Kw4rXa1UGry5ZF95Wa12kF1xJa1xZwn0gryIvr4Svr17CayUCFZ2kFy5
	tF1IyFyUArWDAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjT5LUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6grcPGrPUOq3nAAA30

Describe the KCSAN debugfs target interface, including address and kallsyms
symbol forms, module symbols, disabling the target, and how it relates to
report filters. Clarify CONFIG_KALLSYMS_ALL requirements and that a
symbol target selects only the symbol start address. Warn about
hot-target overhead and clear the target before unloading a module that
owns the address.

Signed-off-by: Hui Su <sh_def@163.com>
---
 Documentation/dev-tools/kcsan.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
index 8575178aa87f..53cc3e5bc1f0 100644
--- a/Documentation/dev-tools/kcsan.rst
+++ b/Documentation/dev-tools/kcsan.rst
@@ -169,6 +169,23 @@ The file ``/sys/kernel/debug/kcsan`` provides the following interface:
   can be used to silence frequently occurring data races; the whitelist feature
   can help with reproduction and testing of fixes.
 
+* Writing ``target=<address>`` or ``target=<symbol>`` to
+  ``/sys/kernel/debug/kcsan`` enables targeted watchpoint sampling for one
+  address. An instrumented access is eligible for watchpoint setup when its
+  byte range contains the selected address. While targeted sampling is active,
+  non-target accesses do not consume the per-CPU ``kcsan.skip_watch`` interval.
+  Symbol targets are resolved using kallsyms. Naming vmlinux data symbols
+  requires ``CONFIG_KALLSYMS_ALL``, and module symbols use ``module:symbol``.
+  A symbol target selects the symbol's start address, not the full object.
+  Marked atomic accesses remain ineligible for watchpoint setup. This controls
+  watchpoint setup and is independent of report whitelist/blacklist filtering.
+  Write ``target=off`` to restore normal sampling.
+  Matching accesses bypass the normal skip interval, so targeting a hot
+  address can significantly increase KCSAN overhead. Use targeted sampling to
+  focus debugging on a known suspicious location.
+  The target does not hold a module reference; clear it before unloading a
+  module that owns the selected address.
+
 Tuning performance
 ~~~~~~~~~~~~~~~~~~
 
-- 
2.55.0

