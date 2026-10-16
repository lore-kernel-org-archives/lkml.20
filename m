Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258144EB862
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160099; cv=none; b=UrhlH+hdjM2mx5JIGUfhl43nciWoJ59RSb/JO8CTxck7o6G/49e7bFgWeukL34B+m1qtNZ88ZFztQJ2I8Q1bMAWu1ldpYnGyTOTdOvceuyRoS8Qk6TXNNzjX7rOkQ3eeoT2KDpnHilby6dMTF8EoS4CruEUWZSzBozUqaccRn8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160099; c=relaxed/simple;
	bh=Nz0N0ZPWAe77xJozIcdH0jKwSXv+sDAKyMDGYscNFcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QhJtD6bE4ZYB4IgTCO+xSRwWuz5Xo2wCPTcdub9v7I8fgzhMOUh5FWrXYk/wDh1okc3ux6+CZJtqRsuJc9KWOdrvb9I+ACwqCJGKYknhjdjUDzaYhNnXG6rLZUaMILTUbUjz6QNY1Ej5kL2W3y9x2/QO+qy/9rBEQDgMwHcKpEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=atP/F5NT; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="atP/F5NT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=LO
	T2Z8jiCDygq9wy3lNmBD3OJ7/M4p6jYZV0Ih21sj0=; b=atP/F5NTkXAbsrUmVw
	tZgQuqGkBxIoClhMgfhFLxJriGOl85Ffshq7lwpcs2H0N+Q5dqn28mpvrHV8m1aq
	N5CjcVIbSaaeCFF+RbVG6vHDy7iqssKB4ejbSoPBgueNKSTg3dyexs/C7sEA9FVW
	X9peexn3ohb2yMPvZozaTvsHU=
Received: from pc.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3lRxCMdJqBejPAA--.25305S2;
	Fri, 16 Oct 2026 22:14:26 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] x86/boot: validate SRAT subtables before parsing
Date: Fri, 16 Oct 2026 22:14:24 +0800
Message-Id: <20261016141424.2793636-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3lRxCMdJqBejPAA--.25305S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4kCrWfXw1DWryruFWUtwb_yoW8Zw1kpF
	45K3s8KrW5WrW2qr1xJr4F9w43G3yfu3W7GrW7G34jgw1DWFyfWFWxKry2gFW8CF43Wan3
	Aw4qgFy5Cr4vyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUb6pPUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wOr5WrSMUOkJQAA3p

The compressed boot SRAT walker only rejects zero-length subtables. It
can advance beyond the table or read memory-affinity fields from a
truncated record when firmware supplies an invalid length.

Validate the SRAT header, each generic subtable range, and the fixed
memory-affinity record before accessing typed fields.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 arch/x86/boot/compressed/acpi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/x86/boot/compressed/acpi.c b/arch/x86/boot/compressed/acpi.c
index aed27604c11f..310ddb9243b8 100644
--- a/arch/x86/boot/compressed/acpi.c
+++ b/arch/x86/boot/compressed/acpi.c
@@ -289,14 +289,22 @@ int count_immovable_mem_regions(void)
 		return 0;
 
 	table_header = (struct acpi_table_header *)table_addr;
+	if (table_header->length < sizeof(struct acpi_table_srat))
+		return 0;
+
 	table_end = table_addr + table_header->length;
 	table = table_addr + sizeof(struct acpi_table_srat);
 
-	while (table + sizeof(struct acpi_subtable_header) < table_end) {
+	while (table < table_end) {
+		if (table_end - table < sizeof(struct acpi_subtable_header)) {
+			debug_putstr("Invalid truncated SRAT subtable header.\n");
+			return 0;
+		}
 
 		sub_table = (struct acpi_subtable_header *)table;
-		if (!sub_table->length) {
-			debug_putstr("Invalid zero length SRAT subtable.\n");
+		if (sub_table->length < sizeof(*sub_table) ||
+		    sub_table->length > table_end - table) {
+			debug_putstr("Invalid SRAT subtable length.\n");
 			return 0;
 		}
 
@@ -304,6 +312,11 @@ int count_immovable_mem_regions(void)
 			struct acpi_srat_mem_affinity *ma;
 
 			ma = (struct acpi_srat_mem_affinity *)sub_table;
+			if (sub_table->length < sizeof(*ma)) {
+				debug_putstr("Invalid memory affinity subtable.\n");
+				return 0;
+			}
+
 			if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) && ma->length) {
 				immovable_mem[num].start = ma->base_address;
 				immovable_mem[num].size = ma->length;
-- 
2.34.1

