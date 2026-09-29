Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E0652B1EF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687520; cv=none; b=aioHswjQA1iATWjXzA6Z+GulXtf2Vr8DBlXxZC914OgGe+NszdVh1fMlqzjTaxgNZRngPaAJrFhF18lpMJbeiK5MatJ83R5O/9rgos7hrInLajfqACjRQh+EriZYf/ho/D10me6Pg3w7rQrOwwbzdz/ma3zKYc0GBbNJMHezmqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687520; c=relaxed/simple;
	bh=ec/H0yqEMPYtNHFIq7T7/iYvQbs6Iqkz068IUnyBKXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thDSnFGpngUTXHYwwVGotvt9vkc1bwY1+25Mm3QLaie1e679+oax8RF0tzn4mPeNDYwTzircImU0qpT9G2RI/k2nwmd+fTTTXWwFWNgFMWNcMJAooTP6GkCCSodmktkMH7DJbvX43JlwCec87I1NoI6pO9EbWbhJt+/4fCVM92I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8C5+b+R; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8C5+b+R"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a0a97efe99so459875a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687517; x=1791292317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iTgAa62DcFYDyXEAH9xbF6s4onZobPTMJ7Puaf98Usw=;
        b=L8C5+b+Rwa11WWazn0EpEMvpp0JKyKZZTtJM9KBlCxJsDwDOVbY+5JM/LHE9bnHhls
         ing/mKy1vl/P7PLz3eQ696rmjnMY9tR1LW2HNqOtpKTNGHIx4zbE0+O0VZBkpqCN5coB
         vQP0LuVBKjApXo9cQUn/vvhbr8jbAoUl/vKyE9mMEEVWPguFf9HUIzelZVdCR2n3hcuj
         b61NmVu+jEDlI96YA6W8pEIT79wGMh0+qWtIXfjC2eq0ybMAhIs77sWZ9v/Ht4SOyleI
         MtSzkaukvvr5HDllFT2zKvFuxmrrmK+CAI3lvZR24NKhsO5J+44I5agMydb3htb/gZLq
         nQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687517; x=1791292317;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTgAa62DcFYDyXEAH9xbF6s4onZobPTMJ7Puaf98Usw=;
        b=WtYmTuuCnlQny9rkH06Ivy8J6IGB7OHiQAoqZ3bkLTEkKdyu0XXVBkTnCLscIYcClw
         fhgJe4ii3jGa+YZH9k40iFQfszuAo7qIJH859MeueV5Vof8UFcs49sRi5rBEPSLhLGlI
         4oqd33iwF7QUmTTmhY+Z6o9T3TMB021tmO0IOWjdbLZetcyT9OWv07RND827gEnU2MRv
         +0BdD9Y9jxxNiRZNgK0Ha+LzeoNOchyqd0UDX7IjhaXnBJP6HiFvPwqjksj23whCoYVh
         rcX5DSk/coCkYuj43GQ+5KUZ+GCeszIou+H3cEPCaAoPgz/wOETpYfGU9a9ivLZCkUuG
         JVJw==
X-Forwarded-Encrypted: i=1; AKwUvBxcTf3gmdJY16j5Rkuv5VZcT0SrNh3N0MHrXE1VVFK6CxWVJ03LObozXt0K3hT3NjMItQ5lVR38ibXowLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPjkicQ20LPDlxobQC1xtGfzRrRPUAI3l9bZW4gyrlo+Ee/Vby
	TTBFrxKtvByZFHolq3WP/gAURzcZeVJoijPldEFSfHOcjI070+xOL5tW
X-Gm-Gg: AYBFou07XPUxkCuOhQlahgSPvW7axjkMwrm9IlfK6pwSjmIh3U1IRJiQccNZPkkSAHc
	BrtD3Jln6qu59atOSySlwMdd1WO46l3g1vjZZFLO/GlQNBQBe0Pufg+/W6MeUpQcGlSoi0AIsuR
	quvRqW1Hoecc1L6NoVYJFadexCBbiqepEgHUsqzx7bsYtWXtdWl5PXFfnoFhhHZYPK/mSokxtTC
	uKnZv7c8ahQZOIXk1uw0xloMju8rFN/81QNBtsLqPlO0zSjNnPjzJduPEvvUPVb5UXT4Ct8O3eO
	W/2qO/bH8/IOnJoom/a6P5ZLtAW8zEvKxb3LNZ7Z4ufmT4g+yZlx2vzJmR27jwAfY/FxD+Hk7dq
	oSSsulEKPILqendJVJKgBPI+u2+cF4Jhp8l0nkgHVcYHkK5D/1EnH1wleuGqGZCi5+yMrEBfHYq
	7Voc/HcQRPIx9S4GOYO8T1j6nkJ4EihRtUl8q6PBiDilzphfJRITdK7wRg76YySklawOQmRBb+y
	vghgurs2CVCcNs6xGlXC8NceqWjU6nO83Le0qON9jzz9jJRG6WbNUuwVg==
X-Received: by 2002:a17:90b:3889:b0:39e:55ce:af15 with SMTP id 98e67ed59e1d1-3a0b28344abmr19900783a91.5.1790687516828;
        Tue, 29 Sep 2026 06:11:56 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fed22sm5582137a91.9.2026.09.29.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:56 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 2/3] docs/zh_TW: mark translations outside the maintained set
Date: Tue, 29 Sep 2026 21:11:39 +0800
Message-ID: <20260929131142.266819-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131142.266819-1-chenyou910331@gmail.com>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As agreed in the zh_TW scope discussion, include the notice added in the
previous patch in every translation that nobody keeps in sync.

The rule is per file rather than per directory: a translation carries
the notice unless it is looked after.  Today the looked-after set is
process/, which the recent process series brought up to date, less the
two files that have moved into process/ since and are already
marked.  Everything else is marked, index pages included: they carry
translated prose and fall behind like any other page, and a notice on an
area's index tells readers what to expect of the whole area.  A file
drops the notice once someone brings it up to date and takes it on.

Left alone are index.rst, disclaimer-zh_TW.rst and glossary.rst, which
do not translate an English document, and the notice itself.

arch/index.rst and dev-tools/sparse.rst have no disclaimer include to
sit next to -- the former never had one, the latter still uses the old
plain-text header -- so the notice goes at the top of those two files.
filesystems/sysfs.txt is not touched: Sphinx does not read .txt sources,
so an include there would never be processed.

Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
Link: https://lore.kernel.org/linux-doc/aqFPBQxq5asHzvtn@wyuan.org/
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/admin-guide/README.rst       | 1 +
 Documentation/translations/zh_TW/admin-guide/bootconfig.rst   | 1 +
 Documentation/translations/zh_TW/admin-guide/bug-bisect.rst   | 1 +
 Documentation/translations/zh_TW/admin-guide/bug-hunting.rst  | 1 +
 .../translations/zh_TW/admin-guide/clearing-warn-once.rst     | 1 +
 Documentation/translations/zh_TW/admin-guide/cpu-load.rst     | 1 +
 Documentation/translations/zh_TW/admin-guide/cputopology.rst  | 1 +
 Documentation/translations/zh_TW/admin-guide/index.rst        | 1 +
 Documentation/translations/zh_TW/admin-guide/init.rst         | 1 +
 .../translations/zh_TW/admin-guide/lockup-watchdogs.rst       | 1 +
 .../translations/zh_TW/admin-guide/mm/damon/index.rst         | 1 +
 .../translations/zh_TW/admin-guide/mm/damon/lru_sort.rst      | 1 +
 .../translations/zh_TW/admin-guide/mm/damon/reclaim.rst       | 1 +
 .../translations/zh_TW/admin-guide/mm/damon/start.rst         | 1 +
 .../translations/zh_TW/admin-guide/mm/damon/usage.rst         | 1 +
 Documentation/translations/zh_TW/admin-guide/mm/index.rst     | 1 +
 Documentation/translations/zh_TW/admin-guide/mm/ksm.rst       | 1 +
 .../translations/zh_TW/admin-guide/reporting-issues.rst       | 1 +
 .../translations/zh_TW/admin-guide/reporting-regressions.rst  | 1 +
 Documentation/translations/zh_TW/admin-guide/sysrq.rst        | 1 +
 .../translations/zh_TW/admin-guide/tainted-kernels.rst        | 1 +
 Documentation/translations/zh_TW/admin-guide/unicode.rst      | 1 +
 Documentation/translations/zh_TW/arch/arm64/amu.rst           | 1 +
 Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst    | 1 +
 Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst   | 1 +
 Documentation/translations/zh_TW/arch/arm64/index.rst         | 1 +
 Documentation/translations/zh_TW/arch/arm64/perf.rst          | 1 +
 Documentation/translations/zh_TW/arch/index.rst               | 2 ++
 Documentation/translations/zh_TW/arch/loongarch/booting.rst   | 1 +
 Documentation/translations/zh_TW/arch/loongarch/features.rst  | 1 +
 Documentation/translations/zh_TW/arch/loongarch/index.rst     | 1 +
 .../translations/zh_TW/arch/loongarch/introduction.rst        | 1 +
 .../translations/zh_TW/arch/loongarch/irq-chip-model.rst      | 1 +
 Documentation/translations/zh_TW/arch/mips/booting.rst        | 1 +
 Documentation/translations/zh_TW/arch/mips/features.rst       | 1 +
 Documentation/translations/zh_TW/arch/mips/index.rst          | 1 +
 Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst    | 1 +
 Documentation/translations/zh_TW/arch/openrisc/index.rst      | 1 +
 .../translations/zh_TW/arch/openrisc/openrisc_port.rst        | 1 +
 Documentation/translations/zh_TW/arch/openrisc/todo.rst       | 1 +
 Documentation/translations/zh_TW/arch/parisc/debugging.rst    | 1 +
 Documentation/translations/zh_TW/arch/parisc/index.rst        | 1 +
 Documentation/translations/zh_TW/arch/parisc/registers.rst    | 1 +
 Documentation/translations/zh_TW/cpu-freq/core.rst            | 1 +
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst     | 1 +
 Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst   | 1 +
 Documentation/translations/zh_TW/cpu-freq/index.rst           | 1 +
 Documentation/translations/zh_TW/dev-tools/gcov.rst           | 1 +
 Documentation/translations/zh_TW/dev-tools/index.rst          | 1 +
 Documentation/translations/zh_TW/dev-tools/kasan.rst          | 1 +
 Documentation/translations/zh_TW/dev-tools/sparse.rst         | 4 +++-
 .../translations/zh_TW/dev-tools/testing-overview.rst         | 1 +
 Documentation/translations/zh_TW/filesystems/debugfs.rst      | 1 +
 Documentation/translations/zh_TW/filesystems/index.rst        | 1 +
 Documentation/translations/zh_TW/filesystems/tmpfs.rst        | 1 +
 Documentation/translations/zh_TW/filesystems/virtiofs.rst     | 1 +
 Documentation/translations/zh_TW/staging/index.rst            | 1 +
 Documentation/translations/zh_TW/staging/magic-number.rst     | 1 +
 58 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index bf692cc7b867..5b513d5fd97a 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/README.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/bootconfig.rst b/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
index e033c5bdd1eb..02a35b08d540 100644
--- a/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/bootconfig.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
index 3cec29682ce0..7fd0de63a382 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :doc:`../../../admin-guide/bug-bisect`
 
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
index f85baa0e97a8..e9ca0816ca70 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :doc:`../../../admin-guide/bug-hunting`
 
diff --git a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
index 15d54440d224..82a483980516 100644
--- a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
+++ b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/clearing-warn-once.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
index 13f03195ac7e..1e8da15a4f92 100644
--- a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/cpu-load.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/cputopology.rst b/Documentation/translations/zh_TW/admin-guide/cputopology.rst
index 7da38b685ae3..daa2c46835ea 100644
--- a/Documentation/translations/zh_TW/admin-guide/cputopology.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cputopology.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/cputopology.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/index.rst b/Documentation/translations/zh_TW/admin-guide/index.rst
index 937f84c69ce9..e396c4eeb04d 100644
--- a/Documentation/translations/zh_TW/admin-guide/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :doc:`../../../admin-guide/index`
 
diff --git a/Documentation/translations/zh_TW/admin-guide/init.rst b/Documentation/translations/zh_TW/admin-guide/init.rst
index b68a5f58ce78..a16390c07f02 100644
--- a/Documentation/translations/zh_TW/admin-guide/init.rst
+++ b/Documentation/translations/zh_TW/admin-guide/init.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :doc:`../../../admin-guide/init`
 
diff --git a/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst b/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
index 6c5282c62461..d5423de1c2d5 100644
--- a/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
+++ b/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
@@ -1,4 +1,5 @@
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/lockup-watchdogs.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
index ed6eaca13ce1..fcdda7ee50c8 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../../../disclaimer-zh_TW.rst
+.. include:: ../../../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/mm/damon/index.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
index 2a5b87f1e4f6..f90bad6484fe 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../../../disclaimer-zh_TW.rst
+.. include:: ../../../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/mm/damon/lru_sort.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
index 36145acdf9aa..fb7bbd030684 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../../../disclaimer-zh_TW.rst
+.. include:: ../../../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/mm/damon/reclaim.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
index af16b730d13b..14504d0f5dce 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../../../disclaimer-zh_TW.rst
+.. include:: ../../../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/mm/damon/start.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
index 82633ec7d15f..f7b267c9173b 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../../../disclaimer-zh_TW.rst
+.. include:: ../../../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/mm/damon/usage.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/index.rst b/Documentation/translations/zh_TW/admin-guide/mm/index.rst
index 969780c9936a..21b61b9ce477 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/index.rst
@@ -1,4 +1,5 @@
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original:   Documentation/admin-guide/mm/index.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst b/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
index 697545ae0fcd..e1a250d0f034 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
@@ -1,4 +1,5 @@
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/mm/ksm.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
index dc2903570705..a23b31884cd8 100644
--- a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
+++ b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
@@ -3,6 +3,7 @@
 
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/reporting-issues.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst b/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
index e85baccdb53b..f03570d61895 100644
--- a/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
+++ b/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
@@ -2,6 +2,7 @@
 .. 【重分發信息參見本文件結尾】
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/reporting-regressions.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/sysrq.rst b/Documentation/translations/zh_TW/admin-guide/sysrq.rst
index 221f05807730..003742c62d85 100644
--- a/Documentation/translations/zh_TW/admin-guide/sysrq.rst
+++ b/Documentation/translations/zh_TW/admin-guide/sysrq.rst
@@ -1,4 +1,5 @@
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/sysrq.rst
 
diff --git a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
index cdfaccfbb4ae..0a351aff5e98 100644
--- a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
+++ b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :doc:`../../../admin-guide/tainted-kernels`
 
diff --git a/Documentation/translations/zh_TW/admin-guide/unicode.rst b/Documentation/translations/zh_TW/admin-guide/unicode.rst
index b9b57cc76d61..85fb4ca90936 100644
--- a/Documentation/translations/zh_TW/admin-guide/unicode.rst
+++ b/Documentation/translations/zh_TW/admin-guide/unicode.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/admin-guide/unicode.rst
 
diff --git a/Documentation/translations/zh_TW/arch/arm64/amu.rst b/Documentation/translations/zh_TW/arch/arm64/amu.rst
index edea336b323d..9e5048aa39c1 100644
--- a/Documentation/translations/zh_TW/arch/arm64/amu.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/amu.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/arch/arm64/amu.rst <amu_index>`
 
diff --git a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
index 66b7c6f8ef39..d46934c2c4e1 100644
--- a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/arch/arm64/elf_hwcaps.rst <elf_hwcaps_index>`
 
diff --git a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
index ad747f9e1916..b613e434d6e5 100644
--- a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/arch/arm64/hugetlbpage.rst <hugetlbpage_index>`
 
diff --git a/Documentation/translations/zh_TW/arch/arm64/index.rst b/Documentation/translations/zh_TW/arch/arm64/index.rst
index 279873b25a25..0e3495411469 100644
--- a/Documentation/translations/zh_TW/arch/arm64/index.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/arch/arm64/index.rst <arm64_index>`
 
diff --git a/Documentation/translations/zh_TW/arch/arm64/perf.rst b/Documentation/translations/zh_TW/arch/arm64/perf.rst
index a91d43e69b49..da1736068365 100644
--- a/Documentation/translations/zh_TW/arch/arm64/perf.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/perf.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/arch/arm64/perf.rst <perf_index>`
 
diff --git a/Documentation/translations/zh_TW/arch/index.rst b/Documentation/translations/zh_TW/arch/index.rst
index 724468687c20..6b7235fd8612 100644
--- a/Documentation/translations/zh_TW/arch/index.rst
+++ b/Documentation/translations/zh_TW/arch/index.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. include:: ../unmaintained-zh_TW.rst
+
 :Original: Documentation/arch/index.rst
 
 處理器體系結構
diff --git a/Documentation/translations/zh_TW/arch/loongarch/booting.rst b/Documentation/translations/zh_TW/arch/loongarch/booting.rst
index cc9610322742..e26654f84ce2 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/booting.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/booting.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/booting.rst
 
diff --git a/Documentation/translations/zh_TW/arch/loongarch/features.rst b/Documentation/translations/zh_TW/arch/loongarch/features.rst
index 667f33030430..843a40553def 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/features.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/features.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/features.rst
 
diff --git a/Documentation/translations/zh_TW/arch/loongarch/index.rst b/Documentation/translations/zh_TW/arch/loongarch/index.rst
index 7371f35326c1..ddec7144a488 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/index.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/index.rst
 
diff --git a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
index 1184bae117d7..0e28afcca695 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/introduction.rst
 
diff --git a/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
index 89f4facc1a12..4cd53dd20401 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/irq-chip-model.rst
 
diff --git a/Documentation/translations/zh_TW/arch/mips/booting.rst b/Documentation/translations/zh_TW/arch/mips/booting.rst
index 43958df77efe..b79e33cf4026 100644
--- a/Documentation/translations/zh_TW/arch/mips/booting.rst
+++ b/Documentation/translations/zh_TW/arch/mips/booting.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/mips/booting.rst
 
diff --git a/Documentation/translations/zh_TW/arch/mips/features.rst b/Documentation/translations/zh_TW/arch/mips/features.rst
index d5f2d3129614..6588fe3a7529 100644
--- a/Documentation/translations/zh_TW/arch/mips/features.rst
+++ b/Documentation/translations/zh_TW/arch/mips/features.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/mips/features.rst
 
diff --git a/Documentation/translations/zh_TW/arch/mips/index.rst b/Documentation/translations/zh_TW/arch/mips/index.rst
index 832a5e9ee413..15df9ac33988 100644
--- a/Documentation/translations/zh_TW/arch/mips/index.rst
+++ b/Documentation/translations/zh_TW/arch/mips/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/mips/index.rst
 
diff --git a/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst b/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
index fc74f474593d..98dc62884644 100644
--- a/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
+++ b/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/mips/ingenic-tcu.rst
 
diff --git a/Documentation/translations/zh_TW/arch/openrisc/index.rst b/Documentation/translations/zh_TW/arch/openrisc/index.rst
index 7d852d37cc4e..5c6aa94794ad 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/openrisc/index.rst
 
diff --git a/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst b/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
index 7d6dcf29eb7d..33d3f5eb74eb 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
@@ -1,4 +1,5 @@
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/openrisc/openrisc_port.rst
 
diff --git a/Documentation/translations/zh_TW/arch/openrisc/todo.rst b/Documentation/translations/zh_TW/arch/openrisc/todo.rst
index 89bb852c5d00..870faeca72ef 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/todo.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/todo.rst
@@ -1,4 +1,5 @@
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/openrisc/todo.rst
 
diff --git a/Documentation/translations/zh_TW/arch/parisc/debugging.rst b/Documentation/translations/zh_TW/arch/parisc/debugging.rst
index a58cf3aa534a..2fb32a102c9f 100644
--- a/Documentation/translations/zh_TW/arch/parisc/debugging.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/debugging.rst
@@ -1,4 +1,5 @@
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/parisc/debugging.rst
 
diff --git a/Documentation/translations/zh_TW/arch/parisc/index.rst b/Documentation/translations/zh_TW/arch/parisc/index.rst
index a08e0329383d..727a396ecf4a 100644
--- a/Documentation/translations/zh_TW/arch/parisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/index.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/parisc/index.rst
 
diff --git a/Documentation/translations/zh_TW/arch/parisc/registers.rst b/Documentation/translations/zh_TW/arch/parisc/registers.rst
index ea9b8df9314d..acc512ce6b05 100644
--- a/Documentation/translations/zh_TW/arch/parisc/registers.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/registers.rst
@@ -1,4 +1,5 @@
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/arch/parisc/registers.rst
 
diff --git a/Documentation/translations/zh_TW/cpu-freq/core.rst b/Documentation/translations/zh_TW/cpu-freq/core.rst
index 8a2c835b5c50..ba7e6f84fd27 100644
--- a/Documentation/translations/zh_TW/cpu-freq/core.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/core.rst
@@ -1,5 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/cpu-freq/core.rst
 
diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 0e4ae51916d3..f02c1d2d1b54 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/cpu-freq/cpu-drivers.rst
 
diff --git a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
index dbaa9df781e3..fbc2f9b9bd8c 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/cpu-freq/cpufreq-stats.rst
 
diff --git a/Documentation/translations/zh_TW/cpu-freq/index.rst b/Documentation/translations/zh_TW/cpu-freq/index.rst
index c32c618dd972..041ad0f299bc 100644
--- a/Documentation/translations/zh_TW/cpu-freq/index.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/cpu-freq/index.rst
 
diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
index 69965427a51a..da5d09dde7eb 100644
--- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst
@@ -1,4 +1,5 @@
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/dev-tools/gcov.rst
 
diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
index fafebd092a3d..0d5671af2b41 100644
--- a/Documentation/translations/zh_TW/dev-tools/index.rst
+++ b/Documentation/translations/zh_TW/dev-tools/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/dev-tools/index.rst
 
diff --git a/Documentation/translations/zh_TW/dev-tools/kasan.rst b/Documentation/translations/zh_TW/dev-tools/kasan.rst
index 7728b50aa4b6..fd5a77d53211 100644
--- a/Documentation/translations/zh_TW/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_TW/dev-tools/kasan.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/dev-tools/kasan.rst
 
diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Documentation/translations/zh_TW/dev-tools/sparse.rst
index 7ca7fdf6e1e6..c81440f85765 100644
--- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
@@ -1,4 +1,6 @@
-﻿:Original: Documentation/dev-tools/sparse.rst
+﻿.. include:: ../unmaintained-zh_TW.rst
+
+:Original: Documentation/dev-tools/sparse.rst
 
 Chinese translated version of Documentation/dev-tools/sparse.rst
 
diff --git a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
index 140f4f946833..447a93774d53 100644
--- a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/dev-tools/testing-overview.rst
 
diff --git a/Documentation/translations/zh_TW/filesystems/debugfs.rst b/Documentation/translations/zh_TW/filesystems/debugfs.rst
index 17e12fc57400..6b9536f58a7a 100644
--- a/Documentation/translations/zh_TW/filesystems/debugfs.rst
+++ b/Documentation/translations/zh_TW/filesystems/debugfs.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/filesystems/debugfs.rst
 
diff --git a/Documentation/translations/zh_TW/filesystems/index.rst b/Documentation/translations/zh_TW/filesystems/index.rst
index 87307a291c8e..9dfcdc66ecce 100644
--- a/Documentation/translations/zh_TW/filesystems/index.rst
+++ b/Documentation/translations/zh_TW/filesystems/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
 
diff --git a/Documentation/translations/zh_TW/filesystems/tmpfs.rst b/Documentation/translations/zh_TW/filesystems/tmpfs.rst
index aed61cc3064d..b479700c8c86 100644
--- a/Documentation/translations/zh_TW/filesystems/tmpfs.rst
+++ b/Documentation/translations/zh_TW/filesystems/tmpfs.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/filesystems/tmpfs.rst
 
diff --git a/Documentation/translations/zh_TW/filesystems/virtiofs.rst b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
index f3a682094266..7efca193b49a 100644
--- a/Documentation/translations/zh_TW/filesystems/virtiofs.rst
+++ b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/filesystems/virtiofs.rst <virtiofs_index>`
 
diff --git a/Documentation/translations/zh_TW/staging/index.rst b/Documentation/translations/zh_TW/staging/index.rst
index 556c63a17f9c..b82de8291543 100644
--- a/Documentation/translations/zh_TW/staging/index.rst
+++ b/Documentation/translations/zh_TW/staging/index.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: Documentation/staging/index.rst
 
diff --git a/Documentation/translations/zh_TW/staging/magic-number.rst b/Documentation/translations/zh_TW/staging/magic-number.rst
index af1b2d05942a..a5c19d1e698b 100644
--- a/Documentation/translations/zh_TW/staging/magic-number.rst
+++ b/Documentation/translations/zh_TW/staging/magic-number.rst
@@ -3,6 +3,7 @@
 .. _tw_magicnumbers:
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :ref:`Documentation/staging/magic-number.rst <magicnumbers>`
 
-- 
2.43.0

