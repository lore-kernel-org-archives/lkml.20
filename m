Received: from mail-m15592.qiye.163.com (mail-m15592.qiye.163.com [101.71.155.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F243F0B9;
	Mon,  7 Sep 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769932; cv=none; b=CrzFyWBe2S+r4dKGc9sRohwPswtV+qdh5sY7Kb/NDc2K6wOcun+W49ynpLWxtuew5fCOp5Zne8WTDPq2pSWoS5lvZjPb+IU9CfqJJBnAHvKtVbFoFQC/ICp9mVVQeyjNg+vbS2Uh7B4FQHP4esh2vCAplskkUXqCOTwLNszFgpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769932; c=relaxed/simple;
	bh=aWnIf2I2cq5kOVBa43sgWoDNexgBJwDofrFewGx+0dA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pt/ARKtuR2t/pGXrMutwGNxk8IkWDOUaoS0gRTeAo8089t+u+36vzQIKgSgMevRhe6XjCAD1fqAdLn3ix7Ajby24RwGcBtLIHXL2ZhF/djnofA3Yq/X9FMInTveZQHVoqe7Yzf9hwIY0oCpnaUspxMprT9tRViBMyET8Ko0bTBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=101.71.155.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ec6fa0a3;
	Mon, 7 Sep 2026 16:26:49 +0800 (GMT+08:00)
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
Subject: [PATCH v3 7/8] tools/mm: Add memory cgroup filtering support to page_owner_filter
Date: Mon,  7 Sep 2026 16:26:19 +0800
Message-Id: <20260907082620.2083838-8-zhen.ni@easystack.cn>
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
X-HM-Tid: 0aa07afa263d0229kunm225d16da162d22
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS05CVh4fThkeT0IZSUNCTFYVFA
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
Changes in v3:
- Replace the v1/v2 classification.

Changes in v2:
- Print an error message for an empty -g argument.

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-8-zhen.ni@easystack.cn/
v2: https://lore.kernel.org/linux-mm/20260903041819.1776630-8-zhen.ni@easystack.cn/
---
 tools/mm/page_owner_filter.c | 52 +++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/tools/mm/page_owner_filter.c b/tools/mm/page_owner_filter.c
index 516c2d109a6a..ede39a1704de 100644
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
@@ -225,6 +226,34 @@ static int validate_comm_list(const char *comm_list)
 	return 0;
 }
 
+static int validate_cgroup_path(const char *path)
+{
+	char cgroup_path[512];
+	const char *input_path = path;
+
+	if (!path || strlen(path) == 0) {
+		fprintf(stderr, "Error: Empty cgroup path\n");
+		return -1;
+	}
+
+	if (path[0] == '/')
+		input_path++;
+
+	snprintf(cgroup_path, sizeof(cgroup_path),
+		"/sys/fs/cgroup/%s/memory.stat", input_path);
+	if (access(cgroup_path, F_OK) == 0)
+		return 0;
+
+	snprintf(cgroup_path, sizeof(cgroup_path),
+		"/sys/fs/cgroup/memory/%s/memory.stat", input_path);
+	if (access(cgroup_path, F_OK) == 0)
+		return 0;
+
+	fprintf(stderr, "Error: Cgroup path '%s': "
+		"not found or no memory controller\n", path);
+	return -1;
+}
+
 int main(int argc, char *argv[])
 {
 	const char *output_file = NULL;
@@ -244,6 +273,7 @@ int main(int argc, char *argv[])
 		{"pid",		required_argument, 0, 'p'},
 		{"tgid",	required_argument, 0, 't'},
 		{"comm",	required_argument, 0, 'c'},
+		{"cgroup",	required_argument, 0, 'g'},
 		{"output",	required_argument, 0, 'o'},
 		{"help",	no_argument,	   0, 'h'},
 		{0, 0, 0, 0}
@@ -270,7 +300,7 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	while ((opt = getopt_long(argc, argv, "m:n:p:t:c:o:h", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "m:n:p:t:c:g:o:h", long_options, NULL)) != -1) {
 		int len;
 
 		switch (opt) {
@@ -344,6 +374,22 @@ int main(int argc, char *argv[])
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

