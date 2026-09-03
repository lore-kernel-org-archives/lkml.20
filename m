Received: from mail-m49222.qiye.163.com (mail-m49222.qiye.163.com [45.254.49.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F52F12AB;
	Thu,  3 Sep 2026 04:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411251; cv=none; b=n2NXaCUyzBT/KjFkObWba4+tvtwxYE7cBN2ATZrPcug4vDTuU+rIUIEgSaRNIZXiWx+73kGQqrRlzlLQz3Mm1oIt0D+TyZTB/E1lOj61rXW1cLkI0FRjfXi7m3XEQ6bv/jMUiD5ySmPPkGwNR4ZPG/Vn545Aq6SPuBvmc4AuYwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411251; c=relaxed/simple;
	bh=qsUiLptmguihPzrubbX2s/IxMHBUPJXt1P1mqviGJ9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b/Hc4EqMU5TAi+TSGD6I/i0//uAb9GzyA+ZlTozDlzEGMgmDU5dkysMfCyH46YnKmKqBbE3WMd+SvQGPfgTka9SzSJefB3+QiyNyUX+HvhejczlJSWGphcY81Y8GjBNfqcXeBPYDrE+MO20YUCQNogEZRdUCJq4u7CRlqrMPzKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.254.49.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ea3ea3af;
	Thu, 3 Sep 2026 12:18:32 +0800 (GMT+08:00)
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
Subject: [PATCH v2 2/8] mm/page_owner: Add TGID filtering support
Date: Thu,  3 Sep 2026 12:18:13 +0800
Message-Id: <20260903041819.1776630-3-zhen.ni@easystack.cn>
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
X-HM-Tid: 0aa0657d69820229kunm7336907a330a6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSE0ZVkoaSUpNSUtOGkNOGVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Extend filter to support thread group ID (TGID) filtering alongside
PID filtering. Reuses existing PID parsing and binary search
infrastructure with separate TGID list and count fields.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- No change.

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-3-zhen.ni@easystack.cn/
---
 mm/page_owner.c | 43 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index 0ef081e443f9..e046e61eb98a 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -71,6 +71,7 @@ static const char * const page_owner_print_mode_strings[] = {
 /* PID_MAX_LIMIT = 4,194,304 (7 decimal digits) */
 #define PID_MAX_DIGITS  	7
 #define MAX_FILTER_PIDS 	16
+#define MAX_FILTER_TGIDS	16
 
 struct page_owner_filter_state {
 	enum page_owner_print_mode print_mode;
@@ -78,7 +79,9 @@ struct page_owner_filter_state {
 	bool proc_filter_enabled;
 	nodemask_t nid_filter;
 	int pid_count;
+	int tgid_count;
 	pid_t pid_list[MAX_FILTER_PIDS];
+	pid_t tgid_list[MAX_FILTER_TGIDS];
 };
 
 static int cmp_pid_t(const void *a, const void *b)
@@ -837,11 +840,19 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		if (state->proc_filter_enabled) {
 			bool proc_match = false;
 
-			proc_match = bsearch(&page_owner->pid,
-					    state->pid_list,
-					    state->pid_count,
-					    sizeof(pid_t),
-					    cmp_pid_t) != NULL;
+			if (state->pid_count > 0)
+				proc_match = bsearch(&page_owner->pid,
+						    state->pid_list,
+						    state->pid_count,
+						    sizeof(pid_t),
+						    cmp_pid_t) != NULL;
+
+			if (!proc_match && state->tgid_count > 0)
+				proc_match = bsearch(&page_owner->tgid,
+						    state->tgid_list,
+						    state->tgid_count,
+						    sizeof(pid_t),
+						    cmp_pid_t) != NULL;
 
 			if (!proc_match)
 				goto ext_put_continue;
@@ -1000,7 +1011,9 @@ static ssize_t page_owner_write(struct file *file,
 	bool new_nid_filter_enabled;
 	bool new_proc_filter_enabled;
 	pid_t new_pid_list[MAX_FILTER_PIDS];
+	pid_t new_tgid_list[MAX_FILTER_TGIDS];
 	int new_pid_count = 0;
+	int new_tgid_count = 0;
 
 	/*
 	 * Maximum input length for filter commands:
@@ -1011,7 +1024,8 @@ static ssize_t page_owner_write(struct file *file,
 	 * - For list filters: (digit+comma) * count + prefix
 	 */
 	if (count > 32 + 6 * MAX_NUMNODES +
-			(PID_MAX_DIGITS + 1) * MAX_FILTER_PIDS + 4)
+			(PID_MAX_DIGITS + 1) * MAX_FILTER_PIDS + 4 +
+			(PID_MAX_DIGITS + 1) * MAX_FILTER_TGIDS + 5)
 		return -EINVAL;
 
 	kbuf = memdup_user_nul(buf, count);
@@ -1028,6 +1042,10 @@ static ssize_t page_owner_write(struct file *file,
 		memcpy(new_pid_list, state->pid_list, sizeof(state->pid_list));
 		new_pid_count = state->pid_count;
 	}
+	if (state->tgid_count > 0) {
+		memcpy(new_tgid_list, state->tgid_list, sizeof(state->tgid_list));
+		new_tgid_count = state->tgid_count;
+	}
 
 	while ((token = strsep(&kbuf, " \t\n")) != NULL) {
 		if (*token == '\0')
@@ -1063,6 +1081,10 @@ static ssize_t page_owner_write(struct file *file,
 			ret = parse_pid_t_list(token + 4, new_pid_list, &new_pid_count);
 			if (ret < 0)
 				goto out_free;
+		} else if (!strncmp(token, "tgid=", 5)) {
+			ret = parse_pid_t_list(token + 5, new_tgid_list, &new_tgid_count);
+			if (ret < 0)
+				goto out_free;
 		} else {
 			ret = -EINVAL;
 			goto out_free;
@@ -1073,7 +1095,7 @@ static ssize_t page_owner_write(struct file *file,
 	state->print_mode = new_print_mode;
 	state->nid_filter = new_nid_filter;
 	state->nid_filter_enabled = new_nid_filter_enabled;
-	state->proc_filter_enabled = new_pid_count > 0;
+	state->proc_filter_enabled = new_pid_count > 0 || new_tgid_count > 0;
 	if (new_pid_count > 0) {
 		memcpy(state->pid_list, new_pid_list, sizeof(state->pid_list));
 		state->pid_count = new_pid_count;
@@ -1081,6 +1103,13 @@ static ssize_t page_owner_write(struct file *file,
 	if (state->pid_count > 1)
 		sort(state->pid_list, state->pid_count, sizeof(pid_t),
 		     cmp_pid_t, NULL);
+	if (new_tgid_count > 0) {
+		memcpy(state->tgid_list, new_tgid_list, sizeof(state->tgid_list));
+		state->tgid_count = new_tgid_count;
+	}
+	if (state->tgid_count > 1)
+		sort(state->tgid_list, state->tgid_count, sizeof(pid_t),
+		     cmp_pid_t, NULL);
 
 	ret = count;
 
-- 
2.20.1

