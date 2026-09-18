Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10573EEADE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703949; cv=none; b=JpIJJo8OsQLT26535tInBXHYJkP40EgpUly1I7sA45NGEi2ciX6uzh5yclIK8c14pPqMt5iBHCQe4VmFa/AXIW1mXL2hnzoKZ6EUGZOnzaGlmwpV90gJ79boP1GbhyJw0R3bdnjmf+FrCqv0GiZbfl2aN90gU22XPUbbLhP1BXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703949; c=relaxed/simple;
	bh=QhM6UnmsOFyjjE8oQemprMSibMedycjjOOzuFtMylzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bs9XiDlWTxe9e0/WCzh7oWbwhN0DsGq98CHJmOsfhXh1o/Z/wYN1qtPe9hqBML8k240xEqh1IjS323E9RnkcBYP2bLRVqU9sHjmbmh/0vTMAv/gOVyi4V/uPoHiXtWI+ZopMnDhr0bsdSDFN+Qln36DvLnwu6psQrNsNbwy6X7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=MhLMeKEF; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="MhLMeKEF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703940; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=JGEA7g9C3seBG7Njk9iXotctiOXVjOvcLMoVwj7oXRY=;
	b=MhLMeKEF5yMWeEhOck6msS9p83WCIbZV4pcX2juF98eqyxwrZM5KdDFRMqMtuIVHii04ci9l3w/7aQZSwDas6Ig39wfnht7wh5LrknYx4MKfUu1ctIgXA15Cdr1AghctT9lilweBaWXxXiHd6v1rjwudCtID+ycOYv7ayxy78cc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9uK6u_1789703936;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9uK6u_1789703936 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:57 +0800
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
Subject: [PATCH 12/12] selftests: mm: add shmem mTHP collapse test cases
Date: Fri, 18 Sep 2026 11:58:43 +0800
Message-ID: <5f0b54de46dfe0dabaeb78e8a68bbe828ffce9ca.1789701677.git.baolin.wang@linux.alibaba.com>
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

Add shmem mTHP collapse test cases for 'collapse_full', and 'collapse_single_mthp'
for shmem. All khugepaged test cases passed.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 tools/testing/selftests/mm/khugepaged.c   | 7 +++++--
 tools/testing/selftests/mm/run_vmtests.sh | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index f82673f5f6b4..a205b7afbc85 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -627,6 +627,9 @@ static void mthp_khugepaged_collapse(const char *msg, char *p, int nr_hpages,
 	if (ops == &__anon_ops) {
 		settings.thp_enabled = THP_NEVER;
 		settings.hugepages[collapse_order].enabled = THP_MADVISE;
+	} else if (ops == &__shmem_ops) {
+		settings.shmem_enabled = SHMEM_NEVER;
+		settings.shmem_hugepages[collapse_order].enabled = SHMEM_ADVISE;
 	}
 
 	thp_push_settings(&settings);
@@ -1260,8 +1263,6 @@ static void parse_test_type(int argc, char **argv)
 			usage();
 	} else if (!strcmp(buf, "shmem")) {
 		shmem_ops = &__shmem_ops;
-		if (mthp_khugepaged_context)
-			usage();
 	} else {
 		usage();
 	}
@@ -1358,6 +1359,7 @@ int main(int argc, char **argv)
 	TEST(collapse_full, khugepaged_context, read_write_file_write_ops);
 	TEST(collapse_full, khugepaged_context, shmem_ops);
 	TEST(collapse_full, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_full, mthp_khugepaged_context, shmem_ops);
 	TEST(collapse_full, madvise_context, anon_ops);
 	TEST(collapse_full, madvise_context, read_only_file_ops);
 	TEST(collapse_full, madvise_context, read_write_file_read_ops);
@@ -1369,6 +1371,7 @@ int main(int argc, char **argv)
 	TEST(collapse_empty, madvise_context, anon_ops);
 
 	TEST(collapse_single_mthp, mthp_khugepaged_context, anon_ops);
+	TEST(collapse_single_mthp, mthp_khugepaged_context, shmem_ops);
 
 	TEST(collapse_single_pte_entry, khugepaged_context, anon_ops);
 	TEST(collapse_single_pte_entry, khugepaged_context, read_only_file_ops);
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 19755fb4edb9..e1e404a612cc 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -427,6 +427,8 @@ CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
 
 CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
 
+CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:shmem
+
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-- 
2.47.3

