Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654332;
	b=qx10nHz1/TAJe1ujhJ8dnNvDMEJi8JQ76YcIe1hLWZlp37QF7RYfhXrRPedV7h3EKttB
	 WuaTEB5THiNIwXv8kDG/bEqsgxTfzRwVWJXZiV7VYcrcKyRFUe+hUdrh6nDRVM7NpANir
	 70psyzDfQ5WaZOnTWt3j84b3ZuabfGbSpf3q+aFdD5loumDOuh9To9Hp76OuEzFu54m4h
	 6UkMKhUwPYWPIYJ638xyqtzqMRA0kbf+ZFB+9rFbnWDlcv4OvhghZQloOllpLcIf2gXld
	 I8Q554odayXwByUDVfH6m5hYLFVoyAPo6dQqbURPbWwoiXsM196JyctXhYXdROuDmwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654332;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xMytu2C8Nmogy0+bbYi+5i1MnS/d18m1VfDgn4wFW34=;
	b=YP1e3uyWWimezqau7IV3RZgN1QGkdDPGRRAPWZxpEEGnp/gfBIGg+7U/CZCSrBb/w/3k
	 GfeGTkh20/Qgpt24reXhpLCMfUOcvuzakmn4U7JIyncAfvaXY25g3d20J+7BIdib301ed
	 D2r799PTkk4lOET93A6s/EK6PX5T05TS0dKdmhPCyR8l08NO3lUenHgR/81eGfNQ8os1r
	 LoaEEIEn9U+67PupGdKTt/0Tlut8ZItwVhGqskIPPF+XLn1/kTzlV4Q8H8IiaZ1f8tqfd
	 bfR5Ie9x6L0PtNFGCzcxjuja5HYmK9bx75sn0KeVld5qIezUUB+LkD9gZ1rUbsFPPFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iMLr+OMH;
	arc=none smtp.remote-ip=95.215.58.156
Received: from mta1.migadu.com (out-156.mta1.migadu.com [95.215.58.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5AA606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5AA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iMLr+OMH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R8xkncJ40MF0d8T0H0YefAgqykP6x4q9Gd1PMHfaYuc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792654329; v=1; x=1793259129;
 b=iMLr+OMHlbMUIb5CEVDc+UvMRUkOJswCJbbdLyAZQBgWvtINFMkn0YbNiNcCYSCbyaRuXif8
 hq3Dk+A3DuxsEf245nTh4+pytpVH8T7jQf4cNiN9Xzr9EWfm6mg1rFGC3tHOmOpsBVcevkuHquj
 3YlZH0NOqhZTxwc6ZrORs6Oo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ef916778793ef3a7;
	Thu, 22 Oct 2026 07:32:09 +0000
X-Mizu-Trace-ID: ef916778793ef3a7
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: muchun.song@linux.dev,
	david@kernel.org,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	azpijr@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 1/5] mm: hugetlb: add explicit page size to hugetlb_cma
Date: Thu, 22 Oct 2026 15:31:45 +0800
Message-ID: <1fd7ad70d80ed0da82b90ad5d86de90499a49a54.1792651104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1792651104.git.zhengqi.arch@bytedance.com>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
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

