Received: from mail-m49203.qiye.163.com (mail-m49203.qiye.163.com [45.254.49.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8908535C1AD;
	Thu,  3 Sep 2026 05:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413660; cv=none; b=A+xyoPrYQdeXRc2cc23OjP4Z4AdvBAccxH1PYletl2zKeS0tMRyNfgs2OAH1+6/O6S9p7o7G4UQnenroxDB83JS8cbGhlbcEe6sVNQ8FKYBGNuE9nsb8R6ZY2icVObXV/g7MUPnICJ3Ymp1DUH631sCgY6SMn5D7DK/E2anIQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413660; c=relaxed/simple;
	bh=LeiPATpjFrX3EIJtNBbVKnmZVUV9NZ+o+mG4SDeKh7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=puDHfCXRNSl3ecmgjLUGvrjTLeeHxg9csro6mNhi/G6VaHDcSwvtFlgntjeO/V6Oc/oque1ODSd4TpQWcW1CE1QJAy3tTvYTBMcE4XaEAILE3YUWCeQbFvQxA0g5syI8rLjsjyyYWdIcc/U5KWiy+qquV7VRi43zkJJxIOoc+k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.254.49.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ea3ea3ac;
	Thu, 3 Sep 2026 12:18:31 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [PATCH v2 1/8] mm/page_owner: Add PID filtering support
Date: Thu,  3 Sep 2026 12:18:12 +0800
Message-Id: <20260903041819.1776630-2-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260903041819.1776630-1-zhen.ni@easystack.cn>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0657d642c0229kunm7336907a330a0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU1IVkgZSRpNSEMYSEIYTFYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Add PID filtering support. Users can filter page_owner output by process
IDs using the "pid=<pid_list>" command format. The filter supports up to
16 PIDs specified as a comma-separated list. PIDs are stored in sorted
order for efficient binary search matching during page owner iteration.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- Drop the kstrdup() copy in parse_pid_t_list(); parse the token in
  place. This also fixes a leak on success and a kfree() of an advanced
  pointer on error in v1.
- Use cmp_int() in cmp_pid_t() to avoid overflow on subtraction.
- Reject pids exceeding PID_MAX_LIMIT.

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-2-zhen.ni@easystack.cn/
---
 mm/page_owner.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index fbbda7ba914b..0ef081e443f9 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -12,6 +12,8 @@
 #include <linux/seq_file.h>
 #include <linux/memcontrol.h>
 #include <linux/sched/clock.h>
+#include <linux/bsearch.h>
+#include <linux/sort.h>
 
 #include "page_alloc.h"
 
@@ -66,12 +68,24 @@ static const char * const page_owner_print_mode_strings[] = {
 	[PAGE_OWNER_PRINT_STACK_HANDLE]	= "stack_handle",
 };
 
+/* PID_MAX_LIMIT = 4,194,304 (7 decimal digits) */
+#define PID_MAX_DIGITS  	7
+#define MAX_FILTER_PIDS 	16
+
 struct page_owner_filter_state {
 	enum page_owner_print_mode print_mode;
-	nodemask_t nid_filter;
 	bool nid_filter_enabled;
+	bool proc_filter_enabled;
+	nodemask_t nid_filter;
+	int pid_count;
+	pid_t pid_list[MAX_FILTER_PIDS];
 };
 
+static int cmp_pid_t(const void *a, const void *b)
+{
+	return cmp_int(*(pid_t *)a, *(pid_t *)b);
+}
+
 static bool page_owner_enabled __initdata;
 DEFINE_STATIC_KEY_FALSE(page_owner_inited);
 
@@ -820,6 +834,19 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 				goto ext_put_continue;
 		}
 
+		if (state->proc_filter_enabled) {
+			bool proc_match = false;
+
+			proc_match = bsearch(&page_owner->pid,
+					    state->pid_list,
+					    state->pid_count,
+					    sizeof(pid_t),
+					    cmp_pid_t) != NULL;
+
+			if (!proc_match)
+				goto ext_put_continue;
+		}
+
 		/* Record the next PFN to read in the file offset */
 		*ppos = pfn + 1;
 
@@ -927,6 +954,7 @@ static int page_owner_open(struct inode *inode, struct file *file)
 	state->print_mode = PAGE_OWNER_PRINT_STACK;
 	nodes_clear(state->nid_filter);
 	state->nid_filter_enabled = false;
+	state->proc_filter_enabled = false;
 	file->private_data = state;
 	return 0;
 }
@@ -937,6 +965,27 @@ static int page_owner_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int parse_pid_t_list(char *str, pid_t *list, int *count)
+{
+	char *token;
+	int i = 0;
+
+	while ((token = strsep(&str, ",")) != NULL) {
+		unsigned int pid;
+
+		if (*token == '\0')
+			continue;
+		if (i >= MAX_FILTER_PIDS)
+			return -E2BIG;
+		if (kstrtouint(token, 10, &pid) != 0 || pid > PID_MAX_LIMIT)
+			return -EINVAL;
+		list[i++] = (pid_t)pid;
+	}
+
+	*count = i;
+	return 0;
+}
+
 static ssize_t page_owner_write(struct file *file,
 				 const char __user *buf,
 				 size_t count, loff_t *ppos)
@@ -949,6 +998,9 @@ static ssize_t page_owner_write(struct file *file,
 	enum page_owner_print_mode new_print_mode;
 	nodemask_t new_nid_filter;
 	bool new_nid_filter_enabled;
+	bool new_proc_filter_enabled;
+	pid_t new_pid_list[MAX_FILTER_PIDS];
+	int new_pid_count = 0;
 
 	/*
 	 * Maximum input length for filter commands:
@@ -956,8 +1008,10 @@ static ssize_t page_owner_write(struct file *file,
 	 *        with sufficient buffer
 	 * - 6 * MAX_NUMNODES: worst case for nid list
 	 *   Worst case per node: ",NNNNN" (comma + 5-digit node number) = 6 bytes
+	 * - For list filters: (digit+comma) * count + prefix
 	 */
-	if (count > 32 + 6 * MAX_NUMNODES)
+	if (count > 32 + 6 * MAX_NUMNODES +
+			(PID_MAX_DIGITS + 1) * MAX_FILTER_PIDS + 4)
 		return -EINVAL;
 
 	kbuf = memdup_user_nul(buf, count);
@@ -969,6 +1023,11 @@ static ssize_t page_owner_write(struct file *file,
 	new_print_mode = state->print_mode;
 	new_nid_filter = state->nid_filter;
 	new_nid_filter_enabled = state->nid_filter_enabled;
+	new_proc_filter_enabled = state->proc_filter_enabled;
+	if (state->pid_count > 0) {
+		memcpy(new_pid_list, state->pid_list, sizeof(state->pid_list));
+		new_pid_count = state->pid_count;
+	}
 
 	while ((token = strsep(&kbuf, " \t\n")) != NULL) {
 		if (*token == '\0')
@@ -1000,6 +1059,10 @@ static ssize_t page_owner_write(struct file *file,
 			}
 
 			new_nid_filter_enabled = true;
+		} else if (!strncmp(token, "pid=", 4)) {
+			ret = parse_pid_t_list(token + 4, new_pid_list, &new_pid_count);
+			if (ret < 0)
+				goto out_free;
 		} else {
 			ret = -EINVAL;
 			goto out_free;
@@ -1010,6 +1073,14 @@ static ssize_t page_owner_write(struct file *file,
 	state->print_mode = new_print_mode;
 	state->nid_filter = new_nid_filter;
 	state->nid_filter_enabled = new_nid_filter_enabled;
+	state->proc_filter_enabled = new_pid_count > 0;
+	if (new_pid_count > 0) {
+		memcpy(state->pid_list, new_pid_list, sizeof(state->pid_list));
+		state->pid_count = new_pid_count;
+	}
+	if (state->pid_count > 1)
+		sort(state->pid_list, state->pid_count, sizeof(pid_t),
+		     cmp_pid_t, NULL);
 
 	ret = count;
 
-- 
2.20.1

