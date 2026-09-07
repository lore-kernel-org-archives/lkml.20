Received: from mail-m17211.xmail.ntesmail.com (mail-m17211.xmail.ntesmail.com [45.195.17.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3220443E067;
	Mon,  7 Sep 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.17.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769616; cv=none; b=Y5+eQZML5D2Pdg5+tcbgQcnrnkaJsaRMRPBTjWoMjknJFi3LoM8qBSVKFS2/ByEN9Shh0j+/Tbmnwyo88jomgFMOqE7RHTOcstXBVPhq5jkxw1UqYhPboT/K2cJr/EGSUsOcfIwtClGyHWmn0RLysg/erA2kgbibAG7HHqQf/wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769616; c=relaxed/simple;
	bh=EUYi8ru33fuHO9GMxolLZqIetyTaDaZdqRw3ojBNWEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ho9dH2UAbUFFsAKvHpR7MuEwz8OqKU/kxlRSxphHMsExDOq+3UlDBRSC3T7+XacDfnfvmWRsSfWmj3ALGDMA/X5tWfojYDWrGr0jEZv4GTh/oY/vNPid66VM/1qQXIMXX49udYcD1gcF8DA8mLcZhOJc6xY7OWh22zt4ZcKkJWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.195.17.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ec6fa08f;
	Mon, 7 Sep 2026 16:26:44 +0800 (GMT+08:00)
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
Subject: [PATCH v3 3/8] mm/page_owner: Add COMM filtering with wildcard support
Date: Mon,  7 Sep 2026 16:26:15 +0800
Message-Id: <20260907082620.2083838-4-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260907082620.2083838-1-zhen.ni@easystack.cn>
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa07afa11a70229kunm225d16da162cfb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGktMVh9OShlDSh8dT0hOHVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Add process name (COMM) filtering to page_owner with glob-style wildcard
pattern matching support. Users can now filter page_owner output by
process names using flexible patterns.

Supported wildcards:
  *    : matches any sequence of characters
  ?    : matches any single character
  [abc]: matches any character in the set
  [a-z]: matches any character in the range

Examples:
  comm="python*"  : matches python, python3, python3.9, etc.
  comm="*sh"      : matches bash, zsh, dash, etc.

Also select GLOB from PAGE_OWNER. glob_match() is provided by
lib/glob.c, which is only built when CONFIG_GLOB is set, and
CONFIG_GLOB is a hidden option without a prompt. A config that enables
PAGE_OWNER but has no other GLOB selector would fail to link with an
undefined reference to glob_match().

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v3:
- No change.

Changes in v2:
- Select GLOB from PAGE_OWNER so that glob_match() is always linked in
  when the feature is enabled.
- Drop the kstrdup() copy in parse_comm_list(); parse the token in
  place, matching patch 1.

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-4-zhen.ni@easystack.cn/
v2: https://lore.kernel.org/linux-mm/20260903041819.1776630-4-zhen.ni@easystack.cn/
---
 mm/Kconfig.debug |  1 +
 mm/page_owner.c  | 71 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 5737a504efbb..c94c30a60cd5 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -106,6 +106,7 @@ config PAGE_OWNER
 	bool "Track page owner"
 	depends on DEBUG_KERNEL && STACKTRACE_SUPPORT
 	select DEBUG_FS
+	select GLOB
 	select STACKTRACE
 	select STACKDEPOT
 	select PAGE_EXTENSION
diff --git a/mm/page_owner.c b/mm/page_owner.c
index b27a96aba482..792eefdd419d 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -14,6 +14,7 @@
 #include <linux/sched/clock.h>
 #include <linux/bsearch.h>
 #include <linux/sort.h>
+#include <linux/glob.h>
 
 #include "page_alloc.h"
 
@@ -72,6 +73,7 @@ static const char * const page_owner_print_mode_strings[] = {
 #define PID_MAX_DIGITS  	7
 #define MAX_FILTER_PIDS 	16
 #define MAX_FILTER_TGIDS	16
+#define MAX_FILTER_COMMS	8
 
 struct page_owner_filter_state {
 	enum page_owner_print_mode print_mode;
@@ -80,8 +82,10 @@ struct page_owner_filter_state {
 	nodemask_t nid_filter;
 	int pid_count;
 	int tgid_count;
+	int comm_count;
 	pid_t pid_list[MAX_FILTER_PIDS];
 	pid_t tgid_list[MAX_FILTER_TGIDS];
+	char comm_list[MAX_FILTER_COMMS][TASK_COMM_LEN];
 };
 
 static int cmp_pid_t(const void *a, const void *b)
@@ -854,6 +858,20 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 						    sizeof(pid_t),
 						    cmp_pid_t) != NULL;
 
+			if (!proc_match && state->comm_count > 0) {
+				bool comm_match = false;
+				int i;
+
+				for (i = 0; i < state->comm_count; i++) {
+					if (glob_match(state->comm_list[i],
+						       page_owner->comm)) {
+						comm_match = true;
+						break;
+					}
+				}
+				proc_match = comm_match;
+			}
+
 			if (!proc_match)
 				goto ext_put_continue;
 		}
@@ -997,6 +1015,27 @@ static int parse_pid_t_list(char *str, pid_t *list, int *count)
 	return 0;
 }
 
+static int parse_comm_list(char *str, char (*list)[TASK_COMM_LEN], int *count)
+{
+	char *token;
+	int i = 0;
+
+	while ((token = strsep(&str, ",")) != NULL) {
+		token = strstrip(token);
+		if (*token == '\0')
+			continue;
+		if (i >= MAX_FILTER_COMMS)
+			return -E2BIG;
+		strscpy(list[i++], token, TASK_COMM_LEN);
+	}
+
+	if (i == 0)
+		return -EINVAL;
+
+	*count = i;
+	return 0;
+}
+
 static ssize_t page_owner_write(struct file *file,
 				 const char __user *buf,
 				 size_t count, loff_t *ppos)
@@ -1011,8 +1050,10 @@ static ssize_t page_owner_write(struct file *file,
 	bool new_nid_filter_enabled;
 	pid_t new_pid_list[MAX_FILTER_PIDS];
 	pid_t new_tgid_list[MAX_FILTER_TGIDS];
+	char (*new_comm_list)[TASK_COMM_LEN] = NULL;
 	int new_pid_count = 0;
 	int new_tgid_count = 0;
+	int new_comm_count = 0;
 
 	/*
 	 * Maximum input length for filter commands:
@@ -1024,12 +1065,19 @@ static ssize_t page_owner_write(struct file *file,
 	 */
 	if (count > 32 + 6 * MAX_NUMNODES +
 			(PID_MAX_DIGITS + 1) * MAX_FILTER_PIDS + 4 +
-			(PID_MAX_DIGITS + 1) * MAX_FILTER_TGIDS + 5)
+			(PID_MAX_DIGITS + 1) * MAX_FILTER_TGIDS + 5 +
+			TASK_COMM_LEN * MAX_FILTER_COMMS + 5)
 		return -EINVAL;
 
+	new_comm_list = kmalloc_array(MAX_FILTER_COMMS, TASK_COMM_LEN, GFP_KERNEL);
+	if (!new_comm_list)
+		return -ENOMEM;
+
 	kbuf = memdup_user_nul(buf, count);
-	if (IS_ERR(kbuf))
+	if (IS_ERR(kbuf)) {
+		kfree(new_comm_list);
 		return PTR_ERR(kbuf);
+	}
 
 	orig = kbuf;
 
@@ -1044,6 +1092,11 @@ static ssize_t page_owner_write(struct file *file,
 		memcpy(new_tgid_list, state->tgid_list, sizeof(state->tgid_list));
 		new_tgid_count = state->tgid_count;
 	}
+	if (state->comm_count > 0) {
+		memcpy(new_comm_list, state->comm_list,
+				state->comm_count * TASK_COMM_LEN);
+		new_comm_count = state->comm_count;
+	}
 
 	while ((token = strsep(&kbuf, " \t\n")) != NULL) {
 		if (*token == '\0')
@@ -1083,6 +1136,10 @@ static ssize_t page_owner_write(struct file *file,
 			ret = parse_pid_t_list(token + 5, new_tgid_list, &new_tgid_count);
 			if (ret < 0)
 				goto out_free;
+		} else if (!strncmp(token, "comm=", 5)) {
+			ret = parse_comm_list(token + 5, new_comm_list, &new_comm_count);
+			if (ret < 0)
+				goto out_free;
 		} else {
 			ret = -EINVAL;
 			goto out_free;
@@ -1093,7 +1150,9 @@ static ssize_t page_owner_write(struct file *file,
 	state->print_mode = new_print_mode;
 	state->nid_filter = new_nid_filter;
 	state->nid_filter_enabled = new_nid_filter_enabled;
-	state->proc_filter_enabled = new_pid_count > 0 || new_tgid_count > 0;
+	state->proc_filter_enabled = new_pid_count > 0 ||
+				     new_tgid_count > 0 ||
+				     new_comm_count > 0;
 	if (new_pid_count > 0) {
 		memcpy(state->pid_list, new_pid_list, sizeof(state->pid_list));
 		state->pid_count = new_pid_count;
@@ -1108,10 +1167,16 @@ static ssize_t page_owner_write(struct file *file,
 	if (state->tgid_count > 1)
 		sort(state->tgid_list, state->tgid_count, sizeof(pid_t),
 		     cmp_pid_t, NULL);
+	if (new_comm_count > 0) {
+		memcpy(state->comm_list, new_comm_list,
+				new_comm_count * TASK_COMM_LEN);
+		state->comm_count = new_comm_count;
+	}
 
 	ret = count;
 
 out_free:
+	kfree(new_comm_list);
 	kfree(orig);
 	return ret;
 }
-- 
2.20.1

