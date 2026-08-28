Received: from mail-m12766.qiye.163.com (mail-m12766.qiye.163.com [115.236.127.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD630FC0F;
	Fri, 28 Aug 2026 03:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887761; cv=none; b=Sz0eZ9YhhcA67T27gWRJpTFlTPjr0NT+eOySiYDeFbWIPThjzVmfSYdHNzmuxG2xgQGvjI3oaDogD1Qj+2cpW1xzjV0UOTCAbja59hPXShqinqaaAl3/uHgHPI5XrYh3TkkZv2Nvf2xN63Xcw9cVYY2TArvKpKK0uQ4yY25+jtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887761; c=relaxed/simple;
	bh=KmGCl8M6y4QiHYVSPZJfZzZRpwmqrCFnQIvcBARhz3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9sTmgnkOrn3qSKlCPofEHQxdv6Jw2l71BTwNufESwGW/13myTggH/4cOG76Ls2T/9V9k12WI42dpTH51V1f5yTiF1M8qxsiLOWjehwz/VwEa444D6AAJOd6f9y3Rqt/dH08In8M6L1CmASnnxCY2asM27kEDEr5U6g2nOF0m5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=115.236.127.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1e6a20da3;
	Fri, 28 Aug 2026 11:13:55 +0800 (GMT+08:00)
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
Subject: [PATCH 3/8] mm/page_owner: Add COMM filtering with wildcard support
Date: Fri, 28 Aug 2026 11:13:34 +0800
Message-Id: <20260828031339.1270699-4-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260828031339.1270699-1-zhen.ni@easystack.cn>
References: <20260828031339.1270699-1-zhen.ni@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0465c18480229kunma81ef96712a33b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZT0JOVkJMSRkeH04dTENPGVYVFA
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
  comm=python*  : matches python, python3, python3.9, etc.
  comm=*sh      : matches bash, zsh, dash, etc.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 mm/page_owner.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index 077867e9e572..7cd533682054 100644
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
@@ -1007,6 +1025,38 @@ static int parse_pid_t_list(const char *str, pid_t *list, int *count)
 	return ret;
 }
 
+static int parse_comm_list(const char *str, char (*list)[TASK_COMM_LEN], int *count)
+{
+	char *str_copy, *token;
+	int i = 0;
+	int ret = 0;
+
+	str_copy = kstrdup(str, GFP_KERNEL);
+	if (!str_copy)
+		return -ENOMEM;
+
+	while ((token = strsep(&str_copy, ",")) != NULL) {
+		token = strstrip(token);
+		if (*token == '\0')
+			continue;
+		if (i >= MAX_FILTER_COMMS) {
+			ret = -E2BIG;
+			goto out_free;
+		}
+		strscpy(list[i], token, TASK_COMM_LEN);
+		i++;
+	}
+
+	*count = i;
+
+	if (i == 0)
+		ret = -EINVAL;
+
+out_free:
+	kfree(str_copy);
+	return ret;
+}
+
 static ssize_t page_owner_write(struct file *file,
 				 const char __user *buf,
 				 size_t count, loff_t *ppos)
@@ -1022,8 +1072,10 @@ static ssize_t page_owner_write(struct file *file,
 	bool new_proc_filter_enabled;
 	pid_t new_pid_list[MAX_FILTER_PIDS];
 	pid_t new_tgid_list[MAX_FILTER_TGIDS];
+	char (*new_comm_list)[TASK_COMM_LEN] = NULL;
 	int new_pid_count = 0;
 	int new_tgid_count = 0;
+	int new_comm_count = 0;
 
 	/*
 	 * Maximum input length for filter commands:
@@ -1035,12 +1087,19 @@ static ssize_t page_owner_write(struct file *file,
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
 
@@ -1056,6 +1115,11 @@ static ssize_t page_owner_write(struct file *file,
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
@@ -1095,6 +1159,10 @@ static ssize_t page_owner_write(struct file *file,
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
@@ -1105,7 +1173,9 @@ static ssize_t page_owner_write(struct file *file,
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
@@ -1120,10 +1190,16 @@ static ssize_t page_owner_write(struct file *file,
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

