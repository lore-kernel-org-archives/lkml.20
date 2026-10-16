Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADB4D957E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160043; cv=none; b=LeFmNbFR6aQbTEzskUkYOwNACZbeC1D94DNR2Ig7lqXZ+RoeYNKgsaRRt8OwwDr3NYgqOmEBZlNk5GghkMVSJ1QrkNMus2A5U/9iHGYmXhKq3q+6WmJ+joKfpCkLlSoM5dP8PIYEHVO/FLqFPV1rs0hQgltRRW99811l7eI0Qrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160043; c=relaxed/simple;
	bh=I00c2fIrzGu/CezJtg/4uWQXOhWHroZKyYANghNapmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AXJakYWw1p6bM0Es8cjX/+81C/ek7ls224TK/tAjqom5OdnyVIxaWHhrye2bjtlE3u5i4gHqUGSP3Am5Q81H5IxHkGzYFu7EYRi3UZ0LefG8YKv8gi+o7BNlfr8TX5aXzpLILylDj2ljp2jGQ/5lmruUiLMcfKKy8W/GQlt/D2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pR9pOXNl; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pR9pOXNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+L
	zUBOKkn8lISsRKm3JBUHS+G+X3VkNgk7YqK6ls+Ac=; b=pR9pOXNlLfOilxJYdw
	+RFXkYgY2jYpMHWl7maAjcjjoqWA4o7KHqUuXjJCCEhVV+5is8Dp+pUBD6GnpG2h
	2Ms3rog4kZoEyRFMMw7EShkNsRi9rs1PuRiv7psNy1Pcc+WcnakQUwwneXgeEFob
	htmjlJn4OSV868bs2/vl/PKAs=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCX5Hj5MNJqeorFAA--.36405S3;
	Fri, 16 Oct 2026 22:13:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] riscv: validate RINTC entries before use
Date: Fri, 16 Oct 2026 22:12:47 +0800
Message-Id: <20261016141249.2791819-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141249.2791819-1-yaojiale02@163.com>
References: <20261016141249.2791819-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgCX5Hj5MNJqeorFAA--.36405S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43Zr4fWFWfCFW3urW7urg_yoW8GF1UpF
	4kK3s8WFs5GanFg343tr4kuay5JrsrGa12qFWjka4UtF47Wr1UJa9ak3WY9F98tF109ay0
	9F1Fv3W09a4UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR189tUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xuZ02rSMPueugAA3p

The RINTC parser reads the flags field before checking that the MADT
entry contains a complete RINTC structure. A truncated firmware record
can therefore trigger an out-of-bounds read during early CPU discovery.

Move the existing BAD_MADT_ENTRY() check ahead of the first typed field
access.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 arch/riscv/kernel/smpboot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a9de2dae804c..9c341398058c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -76,6 +76,9 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
 	static bool found_boot_cpu;
 	struct acpi_madt_rintc *processor = (struct acpi_madt_rintc *)header;
 
+	if (BAD_MADT_ENTRY(processor, end))
+		return -EINVAL;
+
 	/*
 	 * Each RINTC structure in MADT will have a flag. If ACPI_MADT_ENABLED
 	 * bit in the flag is not enabled, it means OS should not try to enable
@@ -84,9 +87,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
 	if (!(processor->flags & ACPI_MADT_ENABLED))
 		return 0;
 
-	if (BAD_MADT_ENTRY(processor, end))
-		return -EINVAL;
-
 	acpi_table_print_madt_entry(&header->common);
 
 	hart = processor->hart_id;
-- 
2.34.1

