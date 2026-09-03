Received: from mail-m49209.qiye.163.com (mail-m49209.qiye.163.com [45.254.49.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CE71B808;
	Thu,  3 Sep 2026 05:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413672; cv=none; b=fdFatE4P6imUQ555yZA6iPYPa59hEDmR3uPvRbkfiH37nu/3aonf0Hb63bP1dlwS6m1tcoWGvhhjaKp5KO7DIpiyO2Jhf9Q7cF7PKOwZLMVwQfLhKRT8sdu9jEgMBr7RcO3XF9rOyOf7sjG8hT6ul87/EdGZHm2tDavLS/gCilM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413672; c=relaxed/simple;
	bh=rmGIhigzrlOWQsmygbThXi9mt10gWyoLH3kisENdYEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hatyzydFXagV/2KXsYSjhTRkzFJxTDzNKCl3ojGZG0thqa2rkPH6mnUlztkp397g+0tMvR0/3cxhhmOI9JZmkCE6Zh9FlrvhbenWL0+pJcDBOKhEvv/vbItpuJ3bHiTnAuMRgUofYcYQBQATwuJw/tUqEsWqhokIH81vFCaamXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=45.254.49.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ea3ea3bc;
	Thu, 3 Sep 2026 12:18:41 +0800 (GMT+08:00)
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
Subject: [PATCH v2 8/8] Documentation: page_owner: Document PID/TGID/COMM and cgroup filters
Date: Thu,  3 Sep 2026 12:18:19 +0800
Message-Id: <20260903041819.1776630-9-zhen.ni@easystack.cn>
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
X-HM-Tid: 0aa0657d8ab40229kunm7336907a330cc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkpPVkwaGE9NSx8dTUpISVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Update page_owner.rst to document process and cgroup filtering
support in page_owner_filter tool. Add usage examples for PID, TGID,
COMM (with wildcard support), and cgroup filters along with their
respective limits.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- Quote the wildcard pattern in the -c example.

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-9-zhen.ni@easystack.cn/
---
 Documentation/mm/page_owner.rst | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/mm/page_owner.rst b/Documentation/mm/page_owner.rst
index a6bd3fe6423a..493f38db0677 100644
--- a/Documentation/mm/page_owner.rst
+++ b/Documentation/mm/page_owner.rst
@@ -283,7 +283,7 @@ page_owner supports filtering output at the kernel level before reading,
 which reduces the amount of data that needs to be processed in userspace.
 
 The page_owner_filter tool provides a convenient interface for this filtering
-capability. It supports two types of filters:
+capability. It supports the following types of filters:
 
 1. **print_mode filter**: Control what information is printed for each page
 	- ``stack``: Print full stack traces (default, compatible with existing usage)
@@ -300,6 +300,16 @@ capability. It supports two types of filters:
 	- Ranges: ``-n 0-3``
 	- Mixed format: ``-n 0,2-3,5``
 
+3. **Process filters**: Filter pages by process identifiers
+	- Filter by process ID: ``-p PID_LIST`` (comma-separated, max 16)
+	- Filter by thread group ID: ``-t TGID_LIST`` (comma-separated, max 16)
+	- Filter by task command name: ``-c COMM_LIST`` (comma-separated, max 8)
+	- Name matching supports wildcards: ``*``, ``?``, ``[a-z]``
+
+4. **Cgroup (memcg) filter**: Filter pages by memory cgroup
+	- Filter by cgroup path: ``-g CGROUP``
+	- Useful for containerized environments and multi-tenant systems
+
 Usage examples::
 
 	# Filter by print mode
@@ -310,9 +320,19 @@ Usage examples::
 	./page_owner_filter -n 0
 	./page_owner_filter -n 0-3
 
+	# Filter by process
+	./page_owner_filter -p 1234
+	./page_owner_filter -t 1,2,3
+	./page_owner_filter -c 'python*'
+
+	# Filter by cgroup
+	./page_owner_filter -g system.slice
+	./page_owner_filter -g kubepods/besteffort/pod123
+
 	# Combined filters
 	./page_owner_filter -m stack -n 0,1,2
 	./page_owner_filter -m handle -n 0,2-3
+	./page_owner_filter -g user.slice -c bash -n 0
 
 	# Save to file
 	./page_owner_filter -m handle -o filtered_output.txt
@@ -323,6 +343,9 @@ reduce output size by ~66% (84MB vs 244MB) and improve read performance by ~4.4x
 compared to full stack output.
 
 The NUMA node filter is useful for NUMA-aware memory allocation analysis and debugging.
+Process filters help isolate memory allocations for specific processes or tasks.
+The cgroup filter is essential for containerized environments where you need to
+analyze memory usage per container or service.
 
 Behind the scenes, page_owner_filter opens /sys/kernel/debug/page_owner and
 writes filter commands before reading the filtered output. The filtering uses
-- 
2.20.1

