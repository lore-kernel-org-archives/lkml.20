Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F066539A7E1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703940; cv=none; b=GcN0PJlHV7TRgGHF9GbS1pvFvuP4+/FVNita8b3GNukLdDTXwMt24pL/ms2jbESENkn2Vuho0WLTQ139jb4qMriuyVWN9RoT3lIoJDQ7j02TFZQenr+ojS/DSRQRvBu2oIm3abqdbq/4MLPPCCt4HpnExPcbU9Z0nQwskkh4clc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703940; c=relaxed/simple;
	bh=fSWqPj39BvU99lm30j0V+57ezq9vrTzpuqO1OwTYwxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ki8q4/o1pw6hLVvWzSt3L+SJxXWu1dkKc907PUJ2Kw3aV2w1urngGsqUw6ZimCdxaEJJ+Excc6ppq/HCmn/R4pafHRKMc8crwaqXBlBBrgTKjecGnSg9LuMiFhPW4ghRrMfkQ7ucKbeLKmVD4/sULuYJmpIIiWt3jpggo87wrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=MEP8E3wW; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="MEP8E3wW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703930; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=aUu5Mif0L8trLz2WDJF44yPBNDrTZZYsfYbfGjVTknY=;
	b=MEP8E3wWlXjztLtPIsl8JbxvyhNLtI+V/cxef83JweS8ksnVbSZxIQAV+5VbAjVgGYlfkO4WMknhKiOLON00xPR5+YGMVhXyMtXqokOKfaZe5tvU/7VQGWAGXqscuEy+hHfMJWYGJ5oTE0PXLbdAE56as2N93Cy5ppF+7l+r/x4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9uK4l_1789703929;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9uK4l_1789703929 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:50 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@kernel.org
Cc: ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] mm: shmem: don't expose 'deny' and 'force' via the kernel command line
Date: Fri, 18 Sep 2026 11:58:34 +0800
Message-ID: <eeb806b057f2097a4d8d2edcb9ccf850aad8f38d.1789701677.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on the previous discussion with Lorenzo[1], the 'deny' and 'force'
options are testing-only configurations and shouldn't be exposed via the
shmem kernel command line.

So drop these debug options from the shmem kernel command line and update
the documentation to make this clear.

[1] https://lore.kernel.org/all/6e4aae7b-2c71-4109-945c-6481efde3636@linux.alibaba.com/
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 Documentation/admin-guide/mm/transhuge.rst |  4 ++--
 mm/shmem.c                                 | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index b187d618452f..0a8265d1cb55 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -389,8 +389,8 @@ is not defined within a valid ``thp_anon``, its policy will default to
 Similarly to ``transparent_hugepage``, you can control the hugepage
 allocation policy for the internal shmem mount by using the kernel parameter
 ``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
-seven valid policies for shmem (``always``, ``within_size``, ``advise``,
-``never``, ``deny``, and ``force``).
+four valid policies for shmem (``always``, ``within_size``, ``advise``,
+``never``).
 
 Similarly to ``transparent_hugepage_shmem``, you can control the default
 hugepage allocation policy for the tmpfs mount by using the kernel parameter
diff --git a/mm/shmem.c b/mm/shmem.c
index b572c60f2af8..951e922091fe 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -668,7 +668,7 @@ static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index
 	}
 }
 
-static int shmem_parse_huge(const char *str)
+static int shmem_parse_huge(const char *str, bool skip_deny_force)
 {
 	int huge;
 
@@ -683,9 +683,9 @@ static int shmem_parse_huge(const char *str)
 		huge = SHMEM_HUGE_WITHIN_SIZE;
 	else if (!strcmp(str, "advise"))
 		huge = SHMEM_HUGE_ADVISE;
-	else if (!strcmp(str, "deny"))
+	else if (!strcmp(str, "deny") && !skip_deny_force)
 		huge = SHMEM_HUGE_DENY;
-	else if (!strcmp(str, "force"))
+	else if (!strcmp(str, "force") && !skip_deny_force)
 		huge = SHMEM_HUGE_FORCE;
 	else
 		return -EINVAL;
@@ -5680,7 +5680,7 @@ static ssize_t shmem_enabled_store(struct kobject *kobj,
 	if (count && tmp[count - 1] == '\n')
 		tmp[count - 1] = '\0';
 
-	huge = shmem_parse_huge(tmp);
+	huge = shmem_parse_huge(tmp, /*skip_deny_force=*/false);
 	if (huge == -EINVAL)
 		return huge;
 
@@ -5807,7 +5807,7 @@ static int __init setup_transparent_hugepage_shmem(char *str)
 {
 	int huge;
 
-	huge = shmem_parse_huge(str);
+	huge = shmem_parse_huge(str, /*skip_deny_force=*/true);
 	if (huge == -EINVAL) {
 		pr_warn("transparent_hugepage_shmem= cannot parse, ignored\n");
 		return huge;
@@ -5822,7 +5822,7 @@ static int __init setup_transparent_hugepage_tmpfs(char *str)
 {
 	int huge;
 
-	huge = shmem_parse_huge(str);
+	huge = shmem_parse_huge(str, /*skip_deny_force=*/true);
 	if (huge < 0) {
 		pr_warn("transparent_hugepage_tmpfs= cannot parse, ignored\n");
 		return huge;
-- 
2.47.3

