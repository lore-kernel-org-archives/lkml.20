Received: from mail-m1973182.qiye.163.com (mail-m1973182.qiye.163.com [220.197.31.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445013E8357;
	Thu,  3 Sep 2026 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417672; cv=none; b=rX5q4tgr4sIMTlR/bTepv9Orc1PUWgOesJjdxcVX5K42az5l4vWGrWBR62RARsH9efvVLOfIs1JCyHAhrLymO2TAJ128cOXUMaoItpoS+LlsCaXyhABrYmR+upCs+qdPjWrkrYjMS2YmzkjlKEjdSnYXm3d1rc2PPfiTIN5FoFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417672; c=relaxed/simple;
	bh=vWpOAIIHlVVP2/TQZ3O+zuDEMXP6aVJbAIhcQvhTW74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvpoRvnWewTzAKG9Saoe8agJk1/Z7efwPSl7VIh8v43aeg3iNCkmJvnx6e4fypQKtYmRDgtNbA+7iQbGFN1sBo5AQwkupm4CkM4YN6JNzSNzFi1Jp6LiG4XK/Naz4UTmgt6ph9ZdPpHY2ImasTkuirbbsP38BmIcI2NrmSIv+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ea3ea3b4;
	Thu, 3 Sep 2026 12:18:35 +0800 (GMT+08:00)
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
Subject: [PATCH v2 4/8] mm/page_owner: Refactor memcg handling for cgroup filter support
Date: Thu,  3 Sep 2026 12:18:15 +0800
Message-Id: <20260903041819.1776630-5-zhen.ni@easystack.cn>
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
X-HM-Tid: 0aa0657d74aa0229kunm7336907a330b5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTENKVkpCQ0JIQk9DGkwYGVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Extract memcg information retrieval from printing logic to prepare for
cgroup filtering support. Introduce struct memcg_info to hold cgroup
data that can be reused for both display output and filtering
decisions.

No functional change - output behavior unchanged.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- No change.

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-5-zhen.ni@easystack.cn/
---
 mm/page_owner.c | 62 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index b8319bc3a368..ca9dd8ed9f77 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -69,6 +69,13 @@ static const char * const page_owner_print_mode_strings[] = {
 	[PAGE_OWNER_PRINT_STACK_HANDLE]	= "stack_handle",
 };
 
+struct memcg_info {
+	char name[80];
+	bool is_slab;
+	bool is_objcg;
+	bool is_online;
+};
+
 /* PID_MAX_LIMIT = 4,194,304 (7 decimal digits) */
 #define PID_MAX_DIGITS  	7
 #define MAX_FILTER_PIDS 	16
@@ -573,16 +580,13 @@ void pagetypeinfo_showmixedcount_print(struct seq_file *m,
 
 #ifdef CONFIG_MEMCG
 /*
- * Looking for memcg information and print it out
+ * Get memcg information from page
  */
-static inline int print_page_owner_memcg(char *kbuf, size_t count, int ret,
-					 struct page *page)
+static void get_page_memcg_info(struct page *page, struct memcg_info *info)
 {
 	unsigned long memcg_data;
 	struct obj_cgroup *objcg;
 	struct mem_cgroup *memcg;
-	bool online;
-	char name[80];
 
 	rcu_read_lock();
 	memcg_data = READ_ONCE(page->memcg_data);
@@ -590,8 +594,7 @@ static inline int print_page_owner_memcg(char *kbuf, size_t count, int ret,
 		goto out_unlock;
 
 	if (memcg_data & MEMCG_DATA_OBJEXTS) {
-		ret += scnprintf(kbuf + ret, count - ret,
-				"Slab cache page\n");
+		info->is_slab = true;
 		goto out_unlock;
 	}
 
@@ -600,21 +603,38 @@ static inline int print_page_owner_memcg(char *kbuf, size_t count, int ret,
 	if (!memcg)
 		goto out_unlock;
 
-	online = css_is_online(&memcg->css);
-	cgroup_name(memcg->css.cgroup, name, sizeof(name));
-	ret += scnprintf(kbuf + ret, count - ret,
-			"Charged %sto %smemcg %s\n",
-			(memcg_data & MEMCG_DATA_KMEM) ? "(via objcg) " : "",
-			online ? "" : "offline ",
-			name);
+	info->is_objcg = (memcg_data & MEMCG_DATA_KMEM) != 0;
+	info->is_online = css_is_online(&memcg->css);
+	cgroup_name(memcg->css.cgroup, info->name, sizeof(info->name));
 out_unlock:
 	rcu_read_unlock();
+}
+
+/*
+ * Print memcg information from memcg_info
+ */
+static inline int print_page_owner_memcg(char *kbuf, size_t count, int ret,
+					 const struct memcg_info *info)
+{
+	if (!info)
+		return ret;
+
+	if (info->is_slab)
+		ret += scnprintf(kbuf + ret, count - ret,
+				"Slab cache page\n");
+
+	if (info->name[0])
+		ret += scnprintf(kbuf + ret, count - ret,
+				"Charged %sto %smemcg %s\n",
+				info->is_objcg ? "(via objcg) " : "",
+				info->is_online ? "" : "offline ",
+				info->name);
 
 	return ret;
 }
 #else
 static inline int print_page_owner_memcg(char *kbuf, size_t count, int ret,
-					 struct page *page)
+					 const struct memcg_info *info)
 {
 	return ret;
 }
@@ -624,7 +644,8 @@ static ssize_t
 print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 		struct page *page, struct page_owner *page_owner,
 		depot_stack_handle_t handle,
-		struct page_owner_filter_state *state)
+		struct page_owner_filter_state *state,
+		const struct memcg_info *memcg_info)
 {
 	int ret, pageblock_mt, page_mt;
 	char *kbuf;
@@ -674,7 +695,7 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 			migrate_reason_names[page_owner->last_migrate_reason]);
 	}
 
-	ret = print_page_owner_memcg(kbuf, count, ret, page);
+	ret = print_page_owner_memcg(kbuf, count, ret, memcg_info);
 
 	ret += snprintf(kbuf + ret, count - ret, "\n");
 	if (ret >= count)
@@ -777,6 +798,7 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		 * user through copy_to_user() or GFP_KERNEL allocations.
 		 */
 		struct page_owner page_owner_tmp;
+		struct memcg_info memcg_info = {};
 
 		/*
 		 * If the new page is in a new MAX_ORDER_NR_PAGES area,
@@ -876,13 +898,17 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 				goto ext_put_continue;
 		}
 
+#ifdef CONFIG_MEMCG
+		get_page_memcg_info(page, &memcg_info);
+#endif
+
 		/* Record the next PFN to read in the file offset */
 		*ppos = pfn + 1;
 
 		page_owner_tmp = *page_owner;
 		page_ext_put(page_ext);
 		return print_page_owner(buf, count, pfn, page,
-				&page_owner_tmp, handle, state);
+				&page_owner_tmp, handle, state, &memcg_info);
 ext_put_continue:
 		page_ext_put(page_ext);
 		cond_resched();
-- 
2.20.1

