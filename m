Received: from mail-m21468.qiye.163.com (mail-m21468.qiye.163.com [117.135.214.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C7838736C;
	Thu,  3 Sep 2026 05:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413661; cv=none; b=mzuuiXORcmuRUHLHs8OzzB+/AQrx5O5MbMgUiLegZX8GCNQsu26FelWZWn3EDwHL0RlwFTpZua4QR8gqUa8OGBh1vAdpJzIec2lz/UPszTpO1KCE66T7jh/abzyLZYdOcRyEkyDlfbHm13GCkqJhxG0/uq4Z+U5MP64QBI2suaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413661; c=relaxed/simple;
	bh=WLNzVmdGlWS1EyTY3T/1TGMb4/U1UTX517iKtHp+vl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cNr23EtFGh452evyhzsx4XryMa4Nm0NCwAOr99pHefTr61tExf7wNA9kPDKGlsl6sUHxvjrwqJKv1KxEjzenxB3ysB1IuwSEtkKOX6k3fx3da0PqNNP7dTeaM+LecxNrP6qisdkRpkBjIyVTxeup5i+K3WHhohpXpmHfyMbX/ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=117.135.214.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ea3ea3b7;
	Thu, 3 Sep 2026 12:18:38 +0800 (GMT+08:00)
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
Subject: [PATCH v2 6/8] tools/mm: Add PID/TGID/COMM filtering support to page_owner_filter
Date: Thu,  3 Sep 2026 12:18:17 +0800
Message-Id: <20260903041819.1776630-7-zhen.ni@easystack.cn>
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
X-HM-Tid: 0aa0657d7fa00229kunm7336907a330c0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkIdVhhMTBhPGUlLS0pNTVYVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+

Add command-line options for filtering by process ID (PID), thread group
ID (TGID), and process name (COMM) to the page_owner_filter userspace tool.

New options:
  -p, --pid PID_LIST    : Process IDs (comma-separated, max 16)
  -t, --tgid TGID_LIST  : Thread Group IDs (comma-separated, max 16)
  -c, --comm COMM_LIST  : Process names (comma-separated, max 8)
                         Supports wildcards: * ? [a-z]

Usage examples:
  page_owner_filter -p 1234,5678
  page_owner_filter -c "python*"
  page_owner_filter -n 0 -c kworker* -o output.txt

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
Changes in v2:
- Print error messages for empty -p/-t and -c arguments.

v1: https://lore.kernel.org/linux-mm/20260828031339.1270699-7-zhen.ni@easystack.cn/
---
 tools/mm/page_owner_filter.c | 172 ++++++++++++++++++++++++++++++-----
 1 file changed, 151 insertions(+), 21 deletions(-)

diff --git a/tools/mm/page_owner_filter.c b/tools/mm/page_owner_filter.c
index 1d1f0a38678a..516c2d109a6a 100644
--- a/tools/mm/page_owner_filter.c
+++ b/tools/mm/page_owner_filter.c
@@ -21,22 +21,24 @@
 #include <signal.h>
 
 #define MAX_CMD_LEN	512
+#define TASK_COMM_LEN	16
 
 static void usage(const char *prog)
 {
 	fprintf(stderr, "Usage: %s [OPTIONS]\n", prog);
 	fprintf(stderr, "\nOptions:\n");
-	fprintf(stderr, "  -m, --mode MODE      : print_mode (stack, handle, or stack_handle)\n");
-	fprintf(stderr, "  -n, --nid NID_LIST   : NUMA node IDs (comma-separated or ranges)\n");
-	fprintf(stderr, "  -o, --output FILE    : output file (default: stdout)\n");
-	fprintf(stderr, "  -h, --help           : show this help message\n");
+	fprintf(stderr, "  -m, --mode MODE       : print_mode (stack, handle, stack_handle)\n");
+	fprintf(stderr, "  -n, --nid NID_LIST    : NUMA nodes (comma-separated or ranges)\n");
+	fprintf(stderr, "  -p, --pid PID_LIST    : Process IDs (comma-separated, max 16)\n");
+	fprintf(stderr, "  -t, --tgid TGID_LIST  : Thread Group IDs (comma-separated, max 16)\n");
+	fprintf(stderr, "  -c, --comm COMM_LIST  : Process names (comma-separated, max 8)\n");
+	fprintf(stderr, "                          Supports wildcards: * ? [a-z]\n");
+	fprintf(stderr, "  -o, --output FILE     : output file (default: stdout)\n");
+	fprintf(stderr, "  -h, --help            : show this help message\n");
 	fprintf(stderr, "\nExamples:\n");
-	fprintf(stderr, "  %s -m stack\n", prog);
-	fprintf(stderr, "  %s -m handle\n", prog);
-	fprintf(stderr, "  %s -m stack_handle\n", prog);
-	fprintf(stderr, "  %s -m stack -o output.txt\n", prog);
-	fprintf(stderr, "  %s -n 0,1,2\n", prog);
-	fprintf(stderr, "  %s -m stack -n 0\n", prog);
+	fprintf(stderr, "  %s -m handle -o output.txt\n", prog);
+	fprintf(stderr, "  %s -n 0,1 -c bash\n", prog);
+	fprintf(stderr, "  %s -c \"python*\" -t 1\n", prog);
 }
 
 static int validate_mode(const char *mode)
@@ -132,6 +134,97 @@ static int validate_nid_list(const char *nid_list)
 	return 0;
 }
 
+static int validate_pid_list(const char *pid_list)
+{
+	const char *p;
+	int count = 0;
+
+	if (!pid_list || strlen(pid_list) == 0) {
+		fprintf(stderr, "Error: Empty pid/tgid list\n");
+		return -1;
+	}
+
+	for (p = pid_list; *p; p++) {
+		if (*p == ',') {
+			count++;
+			continue;
+		}
+		if (!isdigit((unsigned char)*p)) {
+			fprintf(stderr,
+				"Error: Invalid character '%c' in pid_list (only digits allowed)\n",
+				*p);
+			return -1;
+		}
+	}
+
+	if (++count > 16) {
+		fprintf(stderr, "Error: Too many PIDs (max 16)\n");
+		return -1;
+	}
+
+	return 0;
+}
+
+static int validate_tgid_list(const char *tgid_list)
+{
+	return validate_pid_list(tgid_list);
+}
+
+static int validate_comm_list(const char *comm_list)
+{
+	const char *p;
+	const char *comm_start;
+	int count = 0;
+	int comm_len = 0;
+
+	if (!comm_list || strlen(comm_list) == 0) {
+		fprintf(stderr, "Error: Empty comm list\n");
+		return -1;
+	}
+
+	comm_start = comm_list;
+	for (p = comm_list; *p; p++) {
+		if (*p == ',') {
+			/* Check COMM length before separator */
+			if (comm_len == 0) {
+				fprintf(stderr, "Error: Empty COMM in list\n");
+				return -1;
+			}
+			if (comm_len >= TASK_COMM_LEN) {
+				fprintf(stderr,
+					"Error: COMM too long (max %d chars)\n",
+					TASK_COMM_LEN - 1);
+				fprintf(stderr, "  Near: %.15s...\n", comm_start);
+				return -1;
+			}
+			count++;
+			comm_len = 0;
+			comm_start = p + 1;
+			continue;
+		}
+		comm_len++;
+	}
+
+	/* Check last COMM */
+	if (comm_len == 0) {
+		fprintf(stderr, "Error: Empty COMM at end of list\n");
+		return -1;
+	}
+	if (comm_len >= TASK_COMM_LEN) {
+		fprintf(stderr, "Error: COMM too long (max %d chars)\n",
+			TASK_COMM_LEN - 1);
+		fprintf(stderr, "  Near: %.15s...\n", comm_start);
+		return -1;
+	}
+
+	if (++count > 8) {
+		fprintf(stderr, "Error: Too many COMMs (max 8)\n");
+		return -1;
+	}
+
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	const char *output_file = NULL;
@@ -148,6 +241,9 @@ int main(int argc, char *argv[])
 	static struct option long_options[] = {
 		{"mode",	required_argument, 0, 'm'},
 		{"nid",		required_argument, 0, 'n'},
+		{"pid",		required_argument, 0, 'p'},
+		{"tgid",	required_argument, 0, 't'},
+		{"comm",	required_argument, 0, 'c'},
 		{"output",	required_argument, 0, 'o'},
 		{"help",	no_argument,	   0, 'h'},
 		{0, 0, 0, 0}
@@ -174,7 +270,7 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	while ((opt = getopt_long(argc, argv, "m:n:o:h", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "m:n:p:t:c:o:h", long_options, NULL)) != -1) {
 		int len;
 
 		switch (opt) {
@@ -206,6 +302,48 @@ int main(int argc, char *argv[])
 			cmd_len += len;
 			break;
 		}
+		case 'p': {
+			const char *pid_list = optarg;
+
+			if (validate_pid_list(pid_list) < 0)
+				return 1;
+			len = snprintf(filter_cmd + cmd_len, MAX_CMD_LEN - cmd_len,
+				       "%spid=%s", cmd_len > 0 ? " " : "", pid_list);
+			if (len < 0 || cmd_len + len >= MAX_CMD_LEN) {
+				fprintf(stderr, "Error: Command too long\n");
+				return 1;
+			}
+			cmd_len += len;
+			break;
+		}
+		case 't': {
+			const char *tgid_list = optarg;
+
+			if (validate_tgid_list(tgid_list) < 0)
+				return 1;
+			len = snprintf(filter_cmd + cmd_len, MAX_CMD_LEN - cmd_len,
+				       "%stgid=%s", cmd_len > 0 ? " " : "", tgid_list);
+			if (len < 0 || cmd_len + len >= MAX_CMD_LEN) {
+				fprintf(stderr, "Error: Command too long\n");
+				return 1;
+			}
+			cmd_len += len;
+			break;
+		}
+		case 'c': {
+			const char *comm_list = optarg;
+
+			if (validate_comm_list(comm_list) < 0)
+				return 1;
+			len = snprintf(filter_cmd + cmd_len, MAX_CMD_LEN - cmd_len,
+				       "%scomm=%s", cmd_len > 0 ? " " : "", comm_list);
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
@@ -220,7 +358,7 @@ int main(int argc, char *argv[])
 
 	/* At least one filter must be specified */
 	if (cmd_len == 0) {
-		fprintf(stderr, "Error: At least one filter (-m or -n) must be specified\n\n");
+		fprintf(stderr, "Error: At least one filter must be specified\n\n");
 		usage(argv[0]);
 		return 1;
 	}
@@ -255,15 +393,7 @@ int main(int argc, char *argv[])
 	ret = write(fd, filter_cmd, strlen(filter_cmd));
 
 	if (ret < 0) {
-		if (errno == EINVAL) {
-			fprintf(stderr, "Error: Kernel rejected the filter command.\n");
-			fprintf(stderr, "Possible causes:\n");
-			fprintf(stderr, "  - Kernel does not support per-fd filtering\n");
-			fprintf(stderr, "  - NUMA node has no memory\n");
-			fprintf(stderr, "  - Unknown reason\n");
-		} else {
-			perror("write filter command");
-		}
+		perror("write filter command");
 		goto out;
 	}
 
-- 
2.20.1

