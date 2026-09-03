Received: from mail-m1973175.qiye.163.com (mail-m1973175.qiye.163.com [220.197.31.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A78361945;
	Thu,  3 Sep 2026 04:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411259; cv=none; b=oc1aH+p2f7eCeg9Y+MPKkbX1mGSNBiBAMCzmOHfSIGlztJVn9zJxp4Dtv+ZBbNLJfGC2Ar4q9IvEBaxwv2WjwMbbWcw1YJmIASV91rNsUTh6oXL7PdrlC1zn2Z7rq5AJJUGacTzF/vLfb0eZNtBmGKMqK38yDfP7l0IKw9yhMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411259; c=relaxed/simple;
	bh=cZf8FZ+AueieYQogELQLZnlY12nvrvqvcR3NqKSOI94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kg+74oA3VhTWUKfpvAY68dRmEGLoPp6caQ91AyKbDej6/TgMRiFR/MdWJb4xY5TN9hYmKCH8J23bFL1YzLCGaxt3kMzFH5ZN2ZQrKQdgc08LJgU3bvvPe3eGpIZlVKkOefC2yJ85fpXfbExI07XImQxoa7RIdfC5dI/f4ezeshQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ea3ea3b6;
	Thu, 3 Sep 2026 12:18:37 +0800 (GMT+08:00)
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
Subject: [PATCH v2 5/8] mm/page_owner: Add memcg filter support
Date: Thu,  3 Sep 2026 12:18:16 +0800
Message-Id: <20260903041819.1776630-6-zhen.ni@easystack.cn>
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
X-HM-Tid: 0aa0657d7a3f0229kunm7336907a330bb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSxhCVk5KTRkeGkpCHhhPGVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Add memory cgroup filtering to page_owner to allow filtering pages by
their memcg path. This helps debug memory usage patterns for specific
cgroups. Users can now filter page_owner output to show only pages
belonging to a particular memory cgroup.

Collect cgroup path in memcg_info using cgroup_path() and store the
filter state in page_owner_filter_state. When the user sets memcg filter
via "memcg=<path>" command, compare each page's cgroup path against
the specified path and skip non-matching pages using strcmp.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- Allocate the cgroup path buffer once per read() outside the loop
  instead of per page inside get_page_memcg_info(); a GFP_KERNEL
  allocation must not sleep inside the page_ext RCU read-side critical
  section.
- Guard the memcg= parsing branch with CONFIG_MEMCG

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-6-zhen.ni@easystack.cn/
---
 mm/page_owner.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 5 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index ca9dd8ed9f77..0915bcf46963 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -71,6 +71,7 @@ static const char * const page_owner_print_mode_strings[] = {
 
 struct memcg_info {
 	char name[80];
+	char *path;
 	bool is_slab;
 	bool is_objcg;
 	bool is_online;
@@ -86,6 +87,7 @@ struct page_owner_filter_state {
 	enum page_owner_print_mode print_mode;
 	bool nid_filter_enabled;
 	bool proc_filter_enabled;
+	bool memcg_filter_enabled;
 	nodemask_t nid_filter;
 	int pid_count;
 	int tgid_count;
@@ -93,6 +95,7 @@ struct page_owner_filter_state {
 	pid_t pid_list[MAX_FILTER_PIDS];
 	pid_t tgid_list[MAX_FILTER_TGIDS];
 	char comm_list[MAX_FILTER_COMMS][TASK_COMM_LEN];
+	char *memcg_path;
 };
 
 static int cmp_pid_t(const void *a, const void *b)
@@ -582,7 +585,8 @@ void pagetypeinfo_showmixedcount_print(struct seq_file *m,
 /*
  * Get memcg information from page
  */
-static void get_page_memcg_info(struct page *page, struct memcg_info *info)
+static void get_page_memcg_info(struct page *page, struct memcg_info *info,
+				 char *path_buf)
 {
 	unsigned long memcg_data;
 	struct obj_cgroup *objcg;
@@ -606,6 +610,10 @@ static void get_page_memcg_info(struct page *page, struct memcg_info *info)
 	info->is_objcg = (memcg_data & MEMCG_DATA_KMEM) != 0;
 	info->is_online = css_is_online(&memcg->css);
 	cgroup_name(memcg->css.cgroup, info->name, sizeof(info->name));
+	if (path_buf) {
+		info->path = path_buf;
+		cgroup_path(memcg->css.cgroup, info->path, PATH_MAX);
+	}
 out_unlock:
 	rcu_read_unlock();
 }
@@ -775,11 +783,23 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	struct page_ext *page_ext;
 	struct page_owner *page_owner;
 	depot_stack_handle_t handle;
+	char *memcg_path_buf = NULL;
 	struct page_owner_filter_state *state = file->private_data;
+	ssize_t ret;
 
 	if (!static_branch_unlikely(&page_owner_inited))
 		return -EINVAL;
 
+	/*
+	 * Allocate outside the loop, as GFP_KERNEL allocations may not
+	 * sleep inside the page_ext RCU read-side critical section.
+	 */
+	if (state->memcg_filter_enabled) {
+		memcg_path_buf = kmalloc(PATH_MAX, GFP_KERNEL);
+		if (!memcg_path_buf)
+			return -ENOMEM;
+	}
+
 	page = NULL;
 	if (*ppos == 0)
 		pfn = min_low_pfn;
@@ -899,7 +919,11 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		}
 
 #ifdef CONFIG_MEMCG
-		get_page_memcg_info(page, &memcg_info);
+		get_page_memcg_info(page, &memcg_info, memcg_path_buf);
+		if (state->memcg_filter_enabled)
+			if (!memcg_info.path ||
+			    strcmp(memcg_info.path, state->memcg_path) != 0)
+				goto ext_put_continue;
 #endif
 
 		/* Record the next PFN to read in the file offset */
@@ -907,13 +931,16 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 
 		page_owner_tmp = *page_owner;
 		page_ext_put(page_ext);
-		return print_page_owner(buf, count, pfn, page,
+		ret = print_page_owner(buf, count, pfn, page,
 				&page_owner_tmp, handle, state, &memcg_info);
+		kfree(memcg_path_buf);
+		return ret;
 ext_put_continue:
 		page_ext_put(page_ext);
 		cond_resched();
 	}
 
+	kfree(memcg_path_buf);
 	return 0;
 }
 
@@ -1016,7 +1043,10 @@ static int page_owner_open(struct inode *inode, struct file *file)
 
 static int page_owner_release(struct inode *inode, struct file *file)
 {
-	kfree(file->private_data);
+	struct page_owner_filter_state *state = file->private_data;
+
+	kfree(state->memcg_path);
+	kfree(state);
 	return 0;
 }
 
@@ -1075,9 +1105,11 @@ static ssize_t page_owner_write(struct file *file,
 	nodemask_t new_nid_filter;
 	bool new_nid_filter_enabled;
 	bool new_proc_filter_enabled;
+	bool new_memcg_filter_enabled;
 	pid_t new_pid_list[MAX_FILTER_PIDS];
 	pid_t new_tgid_list[MAX_FILTER_TGIDS];
 	char (*new_comm_list)[TASK_COMM_LEN] = NULL;
+	char *new_memcg_path;
 	int new_pid_count = 0;
 	int new_tgid_count = 0;
 	int new_comm_count = 0;
@@ -1093,16 +1125,24 @@ static ssize_t page_owner_write(struct file *file,
 	if (count > 32 + 6 * MAX_NUMNODES +
 			(PID_MAX_DIGITS + 1) * MAX_FILTER_PIDS + 4 +
 			(PID_MAX_DIGITS + 1) * MAX_FILTER_TGIDS + 5 +
-			TASK_COMM_LEN * MAX_FILTER_COMMS + 5)
+			TASK_COMM_LEN * MAX_FILTER_COMMS + 5 +
+			PATH_MAX + 6)
 		return -EINVAL;
 
 	new_comm_list = kmalloc_array(MAX_FILTER_COMMS, TASK_COMM_LEN, GFP_KERNEL);
 	if (!new_comm_list)
 		return -ENOMEM;
 
+	new_memcg_path = kmalloc(PATH_MAX, GFP_KERNEL);
+	if (!new_memcg_path) {
+		kfree(new_comm_list);
+		return -ENOMEM;
+	}
+
 	kbuf = memdup_user_nul(buf, count);
 	if (IS_ERR(kbuf)) {
 		kfree(new_comm_list);
+		kfree(new_memcg_path);
 		return PTR_ERR(kbuf);
 	}
 
@@ -1125,6 +1165,9 @@ static ssize_t page_owner_write(struct file *file,
 				state->comm_count * TASK_COMM_LEN);
 		new_comm_count = state->comm_count;
 	}
+	new_memcg_filter_enabled = state->memcg_filter_enabled;
+	if (state->memcg_filter_enabled && state->memcg_path)
+		strscpy(new_memcg_path, state->memcg_path, PATH_MAX);
 
 	while ((token = strsep(&kbuf, " \t\n")) != NULL) {
 		if (*token == '\0')
@@ -1168,12 +1211,35 @@ static ssize_t page_owner_write(struct file *file,
 			ret = parse_comm_list(token + 5, new_comm_list, &new_comm_count);
 			if (ret < 0)
 				goto out_free;
+#ifdef CONFIG_MEMCG
+		} else if (!strncmp(token, "memcg=", 6)) {
+			if (token[6] == '\0') {
+				ret = -EINVAL;
+				goto out_free;
+			}
+			ret = strscpy(new_memcg_path, token + 6, PATH_MAX);
+			if (ret < 0)
+				goto out_free;
+			new_memcg_filter_enabled = true;
+#endif
 		} else {
 			ret = -EINVAL;
 			goto out_free;
 		}
 	}
 
+	if (new_memcg_filter_enabled) {
+		if (!state->memcg_path) {
+			state->memcg_path = kzalloc(PATH_MAX, GFP_KERNEL);
+			if (!state->memcg_path) {
+				ret = -ENOMEM;
+				goto out_free;
+			}
+		} else {
+			memset(state->memcg_path, 0, PATH_MAX);
+		}
+	}
+
 	/* Commit all filter changes */
 	state->print_mode = new_print_mode;
 	state->nid_filter = new_nid_filter;
@@ -1200,11 +1266,16 @@ static ssize_t page_owner_write(struct file *file,
 				new_comm_count * TASK_COMM_LEN);
 		state->comm_count = new_comm_count;
 	}
+	if (new_memcg_filter_enabled) {
+		strscpy(state->memcg_path, new_memcg_path, PATH_MAX);
+		state->memcg_filter_enabled = true;
+	}
 
 	ret = count;
 
 out_free:
 	kfree(new_comm_list);
+	kfree(new_memcg_path);
 	kfree(orig);
 	return ret;
 }
-- 
2.20.1

