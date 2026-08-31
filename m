Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1F14AC2B0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197005; cv=fail; b=Lu3GaWROsyEk96/RlGJVCqPaG0jSoR/EAVr8sk9fHLDVRPMpxPBGp5h3HIzg38ndHA3gdNp6MW4fl0BGtBEVH32NS3cVGYLRmaw7ENNDVt8yO7RbrXR1uRUaGXaOdrxGPinQNDphCEG5ohvrxvTl+di+oQLhvxbLkhN42k+q7Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197005; c=relaxed/simple;
	bh=Upo51H+Z+WUnRF832Nhdr599J9y2tDbCqX/XeCXxDaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hG5A9Gewzl7EgFmzAMGQVALH3MgfvkpFzNO30K4yahj5YbXRCfI0oOph9tCmtDMjB/W9UPUsDWwfh806L8tgv60Rx1jXsyaXgnlOx4aWbZj6KRtz3LlarUTT6jse/D8uuqjVhKm4gYvWX+4EyGtf2YGwHctv07v9oyAQ8lgoOu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tPXTJEiS; arc=fail smtp.client-ip=40.107.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tPXTJEiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mg1eTd41tVJA74t/xAqZGlBju/nAN7l/7pN+x3rYbhvlvvcjRvKxQxgBCmZD9HyiSPujvceIEbfebD4dtqvDMQP1bTFJnUTzclxG3qedPNziACSD+Vc3gKZnYnjgTUmR/O77KP8Joh2km3myRMRFnKC+qJzaaAjcsCGVN4dWNQFr2GfEp5flATnwLvtZVWJZvSGgGqBKh9ONOy3Q9frdeqG2QGF53FklKZ3IzzuXq5t+G0UWLZ08+cjnpx3LuE8JQWgx+wtcBoc/wJHB9MiHhoDulb36Ek/bg+2N78tooFqUX1MvbeNH8CGkVo6O2lTet9synB/YYT7Kwn50PfLd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/XogZiVF09IdQ5weUBw/k2ToHqAooppSgXleNX9tNE=;
 b=Ier/GBzgv+fJ2eOyvwzdwyTXxk1mqsdSEzeYf6PahCC4giPyWH6eHHCti6EtAEmgbf2Ig23rbb807bwTK49oInBR85nSlhR/nwdHuvuGzbTg+jxIt2d8iMv6BjvbnYRY7AWzr0nDWJM1vCYQj/ugRfgOx/WRv6HtbBeD/ilHnK0rMIDzMxlWL2VyW3W0PBmYWygn3OPj85HEQ0yARpgtNu7uv/cQ0ofOvJe3PFuy8ZwmkU6mxtw4NfnJlucQEM/Ec8dgl9lkoAPNJwen+hL+I9hiEmutMnB0MSByaoVNytulh9O+BBTwvjnfZg8qko5LM/EkcHLcVVqsHqPf0Sxy5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/XogZiVF09IdQ5weUBw/k2ToHqAooppSgXleNX9tNE=;
 b=tPXTJEiSNoVmaNPnyMWcZ8h16x9KlKAuWFLf+2OoTFYuao5MDOYLBHe7g1JuxvrUwacVLAOufaBupt0n/vLQfo9Ty6V4uPb1l/qm9mXo0GWG53ZuGjK09eFdiysrDNBegGd2nJcCUteXEL8MdpFbiiKe0XVwjVGD08gk16SGF5Bh2OuW1zXIJM+bt+gmu6sYPxsK8lmhNIhUV6d2thg+XPi3qSsd54tT4/hxt7RN1cSahH2I9OKrvQ+XWB49EOUdAYEXMaIAh5lZCS0Or+SAwGRkIdmtY1ArgeXJA6+tJ+a/A+VXewKud/VLwCKBdLTdOoCre5FuuJwcrco6GCxKpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:15 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:15 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v2 19/19] selftests/resctrl: Add MB emulation test for ARM MPAM
Date: Mon, 31 Aug 2026 10:22:45 -0700
Message-ID: <20260831172245.42253-20-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a3f298-0095-4681-bb42-08df07848a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|3023799007|22082099003|17002099007|18002099003|56012099006|10067099003|6133799003|11063799006|5023799004|921020;
X-Microsoft-Antispam-Message-Info:
	g8M628v0O+oaAUVRsg13ex4OtTUO/ip2Uf29hizamuS/6TviIniiDRaEEf7ECmCP1SC6oLiWGfbDFd0h9fpGvxFVSoRekAAUdLUY7y6/wzn6MDKvXfXIHnUOjFbwGPP0l+Pr5JuI5CSqwodMtnFIMMjCrHzJOa8T9tfuUzNIwyjZMK4S7EYo00WQI6LQoLApyIZeM+JxVMhpjd7FhT1iaY8eXAzZSoCsy7fZYhr/HJiV1qyWJsH6WO/IpO+inmcqeMBGbtP9XvPtY/yuwQLmREk8oDP3ggugCGadCxsaS0SOiMgMw8M3ifith1+vNPwBZfXG6SmVmMRtYSx8XNBjFdzD2eLwBxVoEz+ksvvPqUNJdHpgVy4arQFwhv4rTf1WsVzrlNfjn/3FN05xLgzU1kQmHtQIsayDNvMTZSUJnVSHXKnZPtvKY/fG9NT+r6VGEbwHiRh90wOj4gQPl/lJRHQnl3FrakBvhA9CVPep9/PNBVVoSPdXGb27BW92Jvm2WneeXhgNSLGOGW6VvAe2A7cQttx7lBcvShmnO49CsZJOXZLbx+QgihONM16pzMp9RxMaJazduz6DQjiKpCStymxAXnfzj3mJ1bNqLVOYnB41zIomCEv4aHteex74XenOGpic2Qf/eVtLCnY+FXUqKPYjK/UqfOaJpP+6bnDL21IPrQdMdqiR6L25APrpoPJeBzx2ZBLdIIe2hFE2tR2GWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(3023799007)(22082099003)(17002099007)(18002099003)(56012099006)(10067099003)(6133799003)(11063799006)(5023799004)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8FEq2ThsfbuF7HRI5coxa3w2lUjPdRwTh06WIOm405wXY/h5w43qnmRYEmzi?=
 =?us-ascii?Q?5R8IgtGG/thXH+jNNvCJR0aS/bOltQ2fr+VJUxF/M9i3qLNCkk1qPii6YKIN?=
 =?us-ascii?Q?/ZCdcY5nCVuSibe09mo3B6IwMXhQDEwVUqDWk66WFDuNUAWrWdjB/s+pHst/?=
 =?us-ascii?Q?ktZh1cghhNkHw4qI0eZ5nW8Sqs6Om1cdqVuOiVUrX6H7c0a8h6PtYZE6j6wf?=
 =?us-ascii?Q?wAUJffw9e0ytvm5uQyqS5vSD15F1EMoq788dyhEKKNBrQ2EN2G7tjTgsh886?=
 =?us-ascii?Q?ZR7ES/uT7S1DpFk+Yst5vO4u9hwl4mfRvwhRr+CW0R9dwifhBpVBAoWJoccQ?=
 =?us-ascii?Q?LHcg/g9yFi5edY0heKu4u8bkxnmxQwHcCqxRaJNPDwISEt2A/S7wM1HdhoZo?=
 =?us-ascii?Q?pv7CMYKeHpd+wyQioBM5h+wsc9rWJ/bBnLey5aSwGj82QSu6BBYC3Rf1jT/Z?=
 =?us-ascii?Q?AnZX6xYFmybFDP4Jv/NLacSigADJE49GqwWDIJY0fBZ0Unw6C/Vl8RSnZTtN?=
 =?us-ascii?Q?s7E4wAd3zUq0QR1YJ1yG3EJv2MtAJmKqR8iMf8SLkGECOHYrtEYIvoa9sr0X?=
 =?us-ascii?Q?7FdbhX27w3vHG47ZZPBa7Fq6ssl9krQY2zX3h2ZNTi78wh2Sik7UA+yX39o4?=
 =?us-ascii?Q?bfWMEAqWXPuG1ULvyNYa3G6yUzxVItJ5YxVGURxAsfpyvIGEakba8CQaMVNJ?=
 =?us-ascii?Q?ZDpPtmW9bk3l6/5ZRe/5WOru8t2SSOG0AMPYibUal+lIuJJNksMl0uAeieUg?=
 =?us-ascii?Q?3XJDXcK+L/xEk02qmwy/DT7DvJ+rj4clC4FQvd7g7VX6vUSovw7qriTtDno7?=
 =?us-ascii?Q?GL753Go7gv8b/mtdURUnlpZ0P6gCUDq54CjGbHs0+LqHLFBqYra8U3juIak2?=
 =?us-ascii?Q?qBi1ClYt0eYQWukejTh0TcnQbB8+rSLTTXTDW8FYfzXLQzFvKcS8cGJmL87I?=
 =?us-ascii?Q?z3oRpDUvTo3+jswuSfV04Dt+PrvFJ7kpIeAVBy82ql8wEHMgHa9ZceAwNgCn?=
 =?us-ascii?Q?OXRpHaOwh4AiBl1sWMQa9ptBA+mvYK9WgWnBr3AKA9ItdAQE0Z5toYb1qe8Y?=
 =?us-ascii?Q?f2yaJC7zlGGSZC6u08dSAaTqLjugKL+BPHuMVu+DFepODIrQ9y9UbNUQP1jV?=
 =?us-ascii?Q?mjK+tOjyvaYRPmZoJzuqg7y+I8jqmRDy6qX/a7xgnKd43sCWtOPkK7+viiAO?=
 =?us-ascii?Q?kzIUOWIt+cVgJqAal9MedJYG7vNLT9+cR7lyHFe3qVOejlPgMQDnrFUONdqJ?=
 =?us-ascii?Q?0PNinZgBCznyyvaScm4FJROdBmhJkNT0hvYlQq3JczR8lbzGOUM6S/47gZlu?=
 =?us-ascii?Q?1U9l/mkqdu709C34r6B922PQqwzA2jzXSk2EC3naei0hhgOHW+ZNfzGadDNG?=
 =?us-ascii?Q?3WophKDdJ6Wp5C4ZKI4PfpJ2SXVE3D43MQFngzU4047JlMnEDIpZCvsYzr0+?=
 =?us-ascii?Q?MAir1JzTHtugzR2T9eOY5RAVXyjGyht2+hU4GYt6w+zE3cR3z2bSJ1wLU5Ms?=
 =?us-ascii?Q?S3VyUiTsspT9W2FsDe3cmcL1H3mVog2dybU/0kPrYbm7JcTjFSZTkBjTdIIr?=
 =?us-ascii?Q?x561vHal3SiiEeGr16z7SPl78V2T5zLxgDfbtGDSyG4EYKkNoFu6HnhXxHyF?=
 =?us-ascii?Q?72X7f+IUBTmmVUYV5OX2KdYxnAboJhs1j/fqESyUMV31xGFaa7BPOeX2Nraw?=
 =?us-ascii?Q?QVVJdu7UtJ73596yh1HTg2Ykk1Rhj/1s2L1Zs91SNL/nSmPtYm682hYOsrh+?=
 =?us-ascii?Q?AHqSc5lSZg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a3f298-0095-4681-bb42-08df07848a43
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:15.1828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syzeMuGRsdh7cD8bhtuhTSH5Gyo4q2IwqMNYBV2ga7zaPr8zTYkI7igbKuhPjS7ZbNqgmjvcDlnQTMrj5zYtgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

Add a kselftest that exercises MB control emulation on ARM MPAM:
info/MB/control_mode, the nested MB_NODE control under
info/MB/schemata/MB/, and schemata visibility when switching legacy
(MB:) and native (MB_NODE:) modes. The info/ schemata tree stays nested
across the switch.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 .../selftests/resctrl/mb_emulation_test.c     | 314 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 3 files changed, 316 insertions(+)
 create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c

diff --git a/tools/testing/selftests/resctrl/mb_emulation_test.c b/tools/testing/selftests/resctrl/mb_emulation_test.c
new file mode 100644
index 000000000000..845aa46fd092
--- /dev/null
+++ b/tools/testing/selftests/resctrl/mb_emulation_test.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MB (memory bandwidth) control emulation test (ARM MPAM)
+ *
+ * Exercises info/MB/control_mode, the nested MB_NODE control under
+ * info/MB/schemata/MB/, and schemata visibility when switching between
+ * legacy (MB:) and native (MB_NODE:) modes.
+ */
+#include <fcntl.h>
+#include <limits.h>
+
+#include "resctrl.h"
+
+#define MB_INFO			INFO_PATH "/MB"
+#define MB_MODE_PATH		MB_INFO "/control_mode"
+#define MB_SCHEMATA_DIR		MB_INFO "/schemata"
+#define MB_CTRL_PATH		MB_SCHEMATA_DIR "/MB"
+#define MB_NODE_NESTED_PATH	MB_CTRL_PATH "/MB_NODE"
+#define MB_NODE_SIBLING_PATH	MB_SCHEMATA_DIR "/MB_NODE"
+#define ROOT_SCHEMATA_PATH	RESCTRL_PATH "/schemata"
+
+static int read_file(const char *path, char *buf, size_t buflen)
+{
+	ssize_t ret;
+	int fd, n;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = read(fd, buf, buflen - 1);
+	close(fd);
+	if (ret < 0)
+		return -errno;
+
+	n = (int)ret;
+	while (n > 0 && (buf[n - 1] == '\n' || buf[n - 1] == ' '))
+		n--;
+	buf[n] = '\0';
+
+	return 0;
+}
+
+static bool path_is_dir(const char *path)
+{
+	struct stat st;
+
+	if (stat(path, &st))
+		return false;
+
+	return S_ISDIR(st.st_mode);
+}
+
+static int mb_read_mode(char *buf, size_t len)
+{
+	return read_file(MB_MODE_PATH, buf, len);
+}
+
+static int mb_write_mode(const char *mode)
+{
+	char msg[32];
+	int fd, ret, len;
+
+	len = snprintf(msg, sizeof(msg), "%s\n", mode);
+	if (len < 0 || len >= (int)sizeof(msg))
+		return -EINVAL;
+
+	fd = open(MB_MODE_PATH, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = write(fd, msg, len) == len ? 0 : -errno;
+	close(fd);
+
+	return ret;
+}
+
+static bool mb_mode_active_is(const char *mode_text, const char *mode)
+{
+	char pattern[32];
+
+	snprintf(pattern, sizeof(pattern), "[%s]", mode);
+	return strstr(mode_text, pattern);
+}
+
+static int mb_read_root_schemata(char *buf, size_t len)
+{
+	return read_file(ROOT_SCHEMATA_PATH, buf, len);
+}
+
+/*
+ * resctrl right-aligns schemata names with leading whitespace, so a control
+ * line looks like "             MB:0=100...". Treat prefix as matching when it
+ * appears at the start of a line, ignoring any leading spaces or tabs.
+ */
+static const char *schemata_find_line(const char *schemata, const char *prefix)
+{
+	const char *p;
+
+	if (!schemata || !prefix)
+		return NULL;
+
+	for (p = strstr(schemata, prefix); p; p = strstr(p + 1, prefix)) {
+		const char *q = p;
+
+		while (q > schemata && (q[-1] == ' ' || q[-1] == '\t'))
+			q--;
+
+		if (q == schemata || q[-1] == '\n')
+			return p;
+	}
+
+	return NULL;
+}
+
+static bool schemata_has_prefix(const char *schemata, const char *prefix)
+{
+	return schemata_find_line(schemata, prefix);
+}
+
+static int mb_expect_nested_hierarchy(const char *why)
+{
+	if (!path_is_dir(MB_NODE_NESTED_PATH) || path_is_dir(MB_NODE_SIBLING_PATH)) {
+		ksft_print_msg("%s: MB_NODE should be nested, nested=%d sibling=%d\n",
+			       why, path_is_dir(MB_NODE_NESTED_PATH),
+			       path_is_dir(MB_NODE_SIBLING_PATH));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mb_test_mode_read(void)
+{
+	char mode[64];
+	int ret;
+
+	ret = mb_read_mode(mode, sizeof(mode));
+	if (ret)
+		return ret;
+
+	if (!mb_mode_active_is(mode, "legacy") && !mb_mode_active_is(mode, "native")) {
+		ksft_print_msg("mode file has no active mode: '%s'\n", mode);
+		return -EINVAL;
+	}
+
+	ksft_print_msg("mode file: %s\n", mode);
+	return 0;
+}
+
+static int mb_test_schemata_visibility(bool expect_mb_line, const char *mode)
+{
+	char schemata[4096];
+	bool has_mb, has_mb_node;
+	int ret;
+
+	ret = mb_read_root_schemata(schemata, sizeof(schemata));
+	if (ret)
+		return ret;
+
+	has_mb = schemata_has_prefix(schemata, "MB:");
+	has_mb_node = schemata_has_prefix(schemata, "MB_NODE:");
+
+	if (expect_mb_line) {
+		if (!has_mb) {
+			ksft_print_msg("%s: expected MB: line in schemata\n", mode);
+			return -EINVAL;
+		}
+		if (has_mb_node) {
+			ksft_print_msg("%s: MB_NODE: line should be hidden in schemata\n",
+				       mode);
+			return -EINVAL;
+		}
+	} else {
+		if (has_mb) {
+			ksft_print_msg("%s: MB: line should be hidden in schemata\n",
+				       mode);
+			return -EINVAL;
+		}
+		if (!has_mb_node) {
+			ksft_print_msg("%s: expected MB_NODE: line in schemata\n",
+				       mode);
+			return -EINVAL;
+		}
+	}
+
+	ksft_print_msg("switched to %s: schemata MB:%d MB_NODE:%d\n",
+		       mode, has_mb, has_mb_node);
+	return 0;
+}
+
+static int mb_restore_mode(const char *orig_mode)
+{
+	if (mb_mode_active_is(orig_mode, "legacy"))
+		return mb_write_mode("legacy");
+	if (mb_mode_active_is(orig_mode, "native"))
+		return mb_write_mode("native");
+
+	return 0;
+}
+
+static int mb_verify_active_mode(const char *mode)
+{
+	char buf[64];
+	int ret;
+
+	ret = mb_read_mode(buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	if (!mb_mode_active_is(buf, mode)) {
+		ksft_print_msg("mode switch to %s failed, mode file: '%s'\n",
+			       mode, buf);
+		return -EINVAL;
+	}
+
+	ksft_print_msg("switched to %s: mode file='%s'\n", mode, buf);
+	return 0;
+}
+
+/*
+ * Switch to @mode and verify the mode file, the nested info/MB/schemata
+ * layout (unchanged by the switch), and root schemata visibility.
+ */
+static int mb_switch_and_check(const char *mode)
+{
+	bool legacy = !strcmp(mode, "legacy");
+	int ret;
+
+	ksft_print_msg("--- switching to %s mode ---\n", mode);
+
+	ret = mb_write_mode(mode);
+	if (ret) {
+		ksft_print_msg("failed to write %s mode\n", mode);
+		return ret;
+	}
+
+	ret = mb_verify_active_mode(mode);
+	if (ret)
+		return ret;
+
+	ret = mb_expect_nested_hierarchy(mode);
+	if (ret)
+		return ret;
+
+	return mb_test_schemata_visibility(legacy, mode);
+}
+
+static int mb_emulation_run_test(const struct resctrl_test *test,
+				 const struct user_params *uparams)
+{
+	char orig_mode[64];
+	int ret;
+
+	(void)test;
+	(void)uparams;
+
+	ret = mb_expect_nested_hierarchy("initial");
+	if (ret)
+		return ret;
+
+	ret = mb_read_mode(orig_mode, sizeof(orig_mode));
+	if (ret) {
+		ksft_print_msg("failed to read %s\n", MB_MODE_PATH);
+		return ret;
+	}
+
+	ret = mb_test_mode_read();
+	if (ret)
+		goto out_restore;
+
+	/* Cycle legacy -> native -> legacy, checking each transition. */
+	ret = mb_switch_and_check("legacy");
+	if (ret)
+		goto out_restore;
+
+	ret = mb_switch_and_check("native");
+	if (ret)
+		goto out_restore;
+
+	ret = mb_switch_and_check("legacy");
+	if (ret)
+		goto out_restore;
+
+out_restore:
+	if (mb_restore_mode(orig_mode))
+		ksft_print_msg("warning: failed to restore original mode\n");
+
+	return ret;
+}
+
+static bool mb_emulation_feature_check(const struct resctrl_test *test)
+{
+	(void)test;
+
+	if (!resctrl_resource_exists("MB"))
+		return false;
+
+	if (!resource_info_file_exists("MB", "control_mode"))
+		return false;
+
+	if (!path_is_dir(MB_SCHEMATA_DIR) || !path_is_dir(MB_CTRL_PATH))
+		return false;
+
+	return path_is_dir(MB_NODE_NESTED_PATH);
+}
+
+struct resctrl_test mb_emulation_test = {
+	.name = "mb_emulation",
+	.group = "mb",
+	.resource = "MB",
+	.feature_check = mb_emulation_feature_check,
+	.run_test = mb_emulation_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..ad1c17c0b0bf 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -242,5 +242,6 @@ extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
+extern struct resctrl_test mb_emulation_test;
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..593f0ca5251b 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -17,6 +17,7 @@ volatile int *value_sink = &sink_target;
 static struct resctrl_test *resctrl_tests[] = {
 	&mbm_test,
 	&mba_test,
+	&mb_emulation_test,
 	&cmt_test,
 	&l3_cat_test,
 	&l3_noncont_cat_test,
-- 
2.53.0

