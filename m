Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E147254C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145294; cv=none; b=Qx+Z6FHGIzm5PmihG6PxS0yNDuZ6RggdahkX/VEJTMfGPNCI/wJXEgzXOJoxVDF7D2AzvG+t318fqXJmRSywas1N1HJA+H/drBH4n9oqWgcqe09QksAEL3QganehlAiotHH80OxLnvxMGESXyCmyPsaPuzURhetpW9jLiNoMpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145294; c=relaxed/simple;
	bh=zWmMzkJXbq05ST8YsgpruScX1WCy110Uh4KRGzMR+c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrGHripKGyDts26ckJqQRwE0BYCGJ+wRY83UGBh1hHqNlUAUOZ3t1EWNHISgKj/oQvE3f/NYu4ynE300FF6B5js6dPwprniaTgPohzRaWav4bLv1lniP8ULbqMguHRjWb6/MuWj3Itip5OyuaHrKCwlfov27PYaw2QF8Qpjyn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NhIIpwsk; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NhIIpwsk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zWmMzkJXbq05ST8YsgpruScX1WCy110Uh4KRGzMR+c8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792145289; v=1; x=1792750089;
 b=NhIIpwskqSrQgAD2Bml5u+VTKEadhf8jqaIIlxOw8xln0pXXqCHQYYgiN/f/1qeQ7zUbfYjv
 ixnhM3xv4Ric13V1kHjnceP6mJGMIfuTob0h9UxzsKEC3n6HFdOYzgjapC9ktv2iDC7gW1KHdvR
 nideshuLlUDLNG0YQ6Nm6bQw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 203aed561e3bbeda;
	Fri, 16 Oct 2026 10:08:09 +0000
X-Mizu-Trace-ID: 203aed561e3bbeda
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 1/5] mm: hugetlb: add explicit page size to hugetlb_cma
Date: Fri, 16 Oct 2026 18:07:32 +0800
Message-ID: <fd905db7e48354ad139cc68b66fe776cd7f2dd8c.1792136742.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1792136742.git.zhengqi.arch@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

Accept an optional @<page-size> suffix for hugetlb_cma. Initially accept
only the architecture's existing CMA page size. Preserve the behavior of
unsuffixed arguments and the existing hugepagesz/hugepages options.

Validate the suffix before applying the existing capacity, percentage and
node-list parser.

Save the arguments during early parsing and process them at reservation
time, after architecture-specific page-size information has been
initialized.

Assisted-by: LLM
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/hugetlb_cma.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb_cma.c b/mm/hugetlb_cma.c
index 95fd2d190f0d2..a17d32fa5ebb3 100644
--- a/mm/hugetlb_cma.c
+++ b/mm/hugetlb_cma.c
@@ -25,6 +25,9 @@ static unsigned long hugetlb_cma_size __ro_after_init;
 static unsigned int hugetlb_cma_percent __initdata;
 static unsigned int hugetlb_cma_percent_in_node[MAX_NUMNODES] __initdata;
 
+static char hugetlb_cma_cmdline[COMMAND_LINE_SIZE] __initdata;
+static unsigned int hugetlb_cma_cmdline_len __initdata;
+
 #ifdef CONFIG_NUMA
 static phys_addr_t __init memblock_node_memory_size(int nid)
 {
@@ -119,11 +122,29 @@ void * __init hugetlb_cma_alloc_bootmem(struct hstate *h, int nid, bool node_exa
 	return NULL;
 }
 
-static int __init cmdline_parse_hugetlb_cma(char *p)
+static int __init hugetlb_cma_parse(char *p)
 {
 	int nid, count = 0;
 	unsigned long tmp;
 	char *s = p;
+	char *suffix = strchr(p, '@');
+
+	if (suffix) {
+		unsigned int order = arch_hugetlb_cma_order();
+		unsigned long long page_size;
+		char *end;
+
+		page_size = memparse(suffix + 1, &end);
+		if (suffix == p || !page_size || *end) {
+			pr_warn("hugetlb_cma: invalid parameter %s\n", p);
+			return -EINVAL;
+		}
+		if (!order || page_size != (PAGE_SIZE << order) ||
+		    !arch_hugetlb_valid_size(page_size)) {
+			pr_warn("hugetlb_cma: unsupported page size in %s\n", p);
+			return -EINVAL;
+		}
+	}
 
 	while (*s) {
 		if (sscanf(s, "%lu%n", &tmp, &count) != 1)
@@ -194,6 +215,20 @@ static int __init cmdline_parse_hugetlb_cma(char *p)
 	return 0;
 }
 
+static int __init cmdline_parse_hugetlb_cma(char *p)
+{
+	size_t len;
+
+	if (!p)
+		return -EINVAL;
+	len = strlen(p) + 1;
+	if (len > sizeof(hugetlb_cma_cmdline) - hugetlb_cma_cmdline_len)
+		return -EINVAL;
+	memcpy(hugetlb_cma_cmdline + hugetlb_cma_cmdline_len, p, len);
+	hugetlb_cma_cmdline_len += len;
+
+	return 0;
+}
 early_param("hugetlb_cma", cmdline_parse_hugetlb_cma);
 
 static int __init cmdline_parse_hugetlb_cma_only(char *p)
@@ -214,6 +249,12 @@ void __init hugetlb_cma_reserve(void)
 	bool node_specific_cma_alloc = false;
 	bool has_node_specific_param = false;
 	int nid;
+	char *p;
+
+	for (p = hugetlb_cma_cmdline;
+	     p < hugetlb_cma_cmdline + hugetlb_cma_cmdline_len;
+	     p += strlen(p) + 1)
+		hugetlb_cma_parse(p);
 
 	for (nid = 0; nid < MAX_NUMNODES; nid++) {
 		if (hugetlb_cma_size_in_node[nid] || hugetlb_cma_percent_in_node[nid]) {
-- 
2.54.0

