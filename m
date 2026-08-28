Received: from mail-m12739.qiye.163.com (mail-m12739.qiye.163.com [115.236.127.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1DD39BFF2;
	Fri, 28 Aug 2026 03:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887165; cv=none; b=BrdzcvcTqq2OEJha1kyY573lxoSxe0z6QNHIeu67s8n+MmbD2vbDkSspGzO7eW+MxqueNgOpIGrL5EWvNGgXXuRVIb+jXhTQgrabGQWQgSSBpdCo6LBAN6ezgUign+CpRTCEe4k99rfZiUOMchkdCBnBUYyszQGwiP8+izQNgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887165; c=relaxed/simple;
	bh=3/vUaMKK3pIlYXKxw06c1SsYKUK53h42nctrWLZR4kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kpwnkytCSW8koXPBJQ6OsV9GDMcLWcfj0lvFcRzS88pu66p34mtX75ck7AATX9EHveyBdS1kLU0BH4sBpw3wJuVOEFDs+LDZ8d0ebqWfS7DnYrrnWaW1CIynWVTEXYMMGzZNYRk70YKgJc9DdDwNnFhTaGUXTN98W1ceDsnroXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=115.236.127.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1e6a20db8;
	Fri, 28 Aug 2026 11:14:00 +0800 (GMT+08:00)
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
Subject: [PATCH 7/8] tools/mm: Add memory cgroup filtering support to page_owner_filter
Date: Fri, 28 Aug 2026 11:13:38 +0800
Message-Id: <20260828031339.1270699-8-zhen.ni@easystack.cn>
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
X-HM-Tid: 0aa0465c2c190229kunma81ef96712a35a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR8eVkxNHh8YHR5IQkxKGlYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Add filtering capability for page_owner to allow filtering by
memory cgroup path.

Filter page_owner output by cgroup path:
./page_owner_filter -g /
./page_owner_filter -g /user.slice
./page_owner_filter -g /user.slice -c systemd

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 tools/mm/page_owner_filter.c | 56 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/tools/mm/page_owner_filter.c b/tools/mm/page_owner_filter.c
index 9256ffad4939..1ffbe4387854 100644
--- a/tools/mm/page_owner_filter.c
+++ b/tools/mm/page_owner_filter.c
@@ -20,7 +20,7 @@
 #include <getopt.h>
 #include <signal.h>
 
-#define MAX_CMD_LEN	512
+#define MAX_CMD_LEN	2048
 #define TASK_COMM_LEN	16
 
 static void usage(const char *prog)
@@ -33,12 +33,13 @@ static void usage(const char *prog)
 	fprintf(stderr, "  -t, --tgid TGID_LIST  : Thread Group IDs (comma-separated, max 16)\n");
 	fprintf(stderr, "  -c, --comm COMM_LIST  : Process names (comma-separated, max 8)\n");
 	fprintf(stderr, "                          Supports wildcards: * ? [a-z]\n");
+	fprintf(stderr, "  -g, --cgroup PATH     : Memory cgroup path\n");
 	fprintf(stderr, "  -o, --output FILE     : output file (default: stdout)\n");
 	fprintf(stderr, "  -h, --help            : show this help message\n");
 	fprintf(stderr, "\nExamples:\n");
 	fprintf(stderr, "  %s -m handle -o output.txt\n", prog);
 	fprintf(stderr, "  %s -n 0,1 -c bash\n", prog);
-	fprintf(stderr, "  %s -c \"python*\" -t 1\n", prog);
+	fprintf(stderr, "  %s -c \"python*\" -g user.slice\n", prog);
 }
 
 static int validate_mode(const char *mode)
@@ -221,6 +222,38 @@ static int validate_comm_list(const char *comm_list)
 	return 0;
 }
 
+static int validate_cgroup_path(const char *path)
+{
+	char cgroup_path[512];
+	const char *input_path = path;
+	int is_cgroup_v2 = 0;
+
+	if (!path || strlen(path) == 0)
+		return -1;
+
+	if (path[0] == '/')
+		input_path++;
+
+	/* Check if v1 memory controller exists */
+	if (access("/sys/fs/cgroup/memory", F_OK) != 0)
+		is_cgroup_v2 = 1;
+
+	if (is_cgroup_v2)
+		snprintf(cgroup_path, sizeof(cgroup_path),
+			"/sys/fs/cgroup/%s/memory.stat", input_path);
+	else
+		snprintf(cgroup_path, sizeof(cgroup_path),
+			"/sys/fs/cgroup/memory/%s/memory.stat", input_path);
+
+	if (access(cgroup_path, F_OK) != 0) {
+		fprintf(stderr, "Error: Cgroup path '%s': not found or no memory controller\n",
+			path);
+		return -1;
+	}
+
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	const char *output_file = NULL;
@@ -240,6 +273,7 @@ int main(int argc, char *argv[])
 		{"pid",		required_argument, 0, 'p'},
 		{"tgid",	required_argument, 0, 't'},
 		{"comm",	required_argument, 0, 'c'},
+		{"cgroup",	required_argument, 0, 'g'},
 		{"output",	required_argument, 0, 'o'},
 		{"help",	no_argument,	   0, 'h'},
 		{0, 0, 0, 0}
@@ -266,7 +300,7 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	while ((opt = getopt_long(argc, argv, "m:n:p:t:c:o:h", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "m:n:p:t:c:g:o:h", long_options, NULL)) != -1) {
 		int len;
 
 		switch (opt) {
@@ -340,6 +374,22 @@ int main(int argc, char *argv[])
 			cmd_len += len;
 			break;
 		}
+		case 'g': {
+			const char *cgroup_path = optarg;
+
+			if (validate_cgroup_path(cgroup_path) < 0)
+				return 1;
+			const char *path = (cgroup_path[0] == '/') ? cgroup_path + 1 : cgroup_path;
+
+			len = snprintf(filter_cmd + cmd_len, MAX_CMD_LEN - cmd_len,
+				       "%smemcg=/%s", cmd_len > 0 ? " " : "", path);
+			if (len < 0 || cmd_len + len >= MAX_CMD_LEN) {
+				fprintf(stderr, "Error: Command too long\n");
+				return 1;
+			}
+			cmd_len += len;
+			break;
+		}
 		case 'o':
 			output_file = optarg;
 			break;
-- 
2.20.1

