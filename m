Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF0364EB8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160130; cv=none; b=PIzl6XV43M7393lLhp2hCu/egozFYqbGyw7UKulb9hbarl7PCASOBw6rIgjpDm2ikRT6ICNGpPMQ6aSrxDS9u+OUpqPbmuBIixpkhci1GBdmeAkQ4UDa6Xzhiv7ZIZEgrEgjDnNKfv20ASQeTAKJ2B5AHfKpG8FAW4+BQcMXqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160130; c=relaxed/simple;
	bh=qm7GjWN2PAhPaNz0wvYVKv4V+3UGLJ+S8CUkhF6iyZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UjNLbCwvnKJTZ8QS6HnGGFGOB0TOGNFCb7mAsB02Bzkn8nHXmlfBTE71i8JDI7bd/MtnQiifZ/fW0p11jgjcxkH711wtyQ9lwwECRkkEIvBCxmNZYR2m97KA9G8trY9gtF4H0lCN+dEBqSQYbQIYdgGDXD4a3WcUkR+I1eiGmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AQuLq5Z6; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AQuLq5Z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3j
	qL3NcIn3aGoayCUHPvZ5Eo1RhtslpZhskbD7Hw5D0=; b=AQuLq5Z6hnLBfQxSUe
	yIlFKb0ITs/cII+v8VQZF/VuQKiEVw3QZ9R4b9HO7A1J29FDT10UOahYGO4PIOqj
	/z1V+nt9+QssJd9fU1C5RcfasG1RWw4dbF3laMVxSkpIL6VnUbAtwSqVR/meknxd
	QviZcUX9KsRq/OLuVIe8uzfag=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHzXlqMdJqd8LFAA--.36231S2;
	Fri, 16 Oct 2026 22:15:07 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] drm/amdkfd: validate SRAT subtables before parsing
Date: Fri, 16 Oct 2026 22:15:04 +0800
Message-Id: <20261016141504.2794541-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDHzXlqMdJqd8LFAA--.36231S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryUJFWkKr4DZw1UWw43trb_yoW5WFW7pF
	nFga4YvrW3JFy2gw1IyFWFv345Ja1xGa42grW7Gry0qwn8uFyrXFWrC34agF98KFW8ta1a
	v34qgrnxCr4vy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU2jg7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wu172rSMWunaQAA3S

The KFD SRAT walker reads the first subtable length without checking
that a header is present and trusts subsequent lengths when accessing
CPU and generic affinity records. Invalid firmware lengths can therefore
cause out-of-bounds reads.

Validate the table header, every generic subtable range, and each
supported typed record before reading its fields.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 35 ++++++++++++++++++---------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 6e0df685503d..32d7573dffc9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -2056,27 +2056,33 @@ static void kfd_find_numa_node_in_srat(struct kfd_node *kdev)
 		return;
 	}
 
+	if (table_header->length < sizeof(struct acpi_table_srat))
+		goto invalid_srat;
+
 	table_end = (unsigned long)table_header + table_header->length;
 
 	/* Parse all entries looking for a match. */
 	sub_header = (struct acpi_subtable_header *)
 			((unsigned long)table_header +
 			sizeof(struct acpi_table_srat));
-	subtable_len = sub_header->length;
 
-	while (((unsigned long)sub_header) + subtable_len  < table_end) {
-		/*
-		 * If length is 0, break from this loop to avoid
-		 * infinite loop.
-		 */
-		if (subtable_len == 0) {
-			pr_err("SRAT invalid zero length\n");
-			break;
-		}
+	while ((unsigned long)sub_header < table_end) {
+		unsigned long start = (unsigned long)sub_header;
+
+		if (table_end - start < sizeof(*sub_header))
+			goto invalid_srat;
+
+		subtable_len = sub_header->length;
+		if (subtable_len < sizeof(*sub_header) ||
+		    subtable_len > table_end - start)
+			goto invalid_srat;
 
 		switch (sub_header->type) {
 		case ACPI_SRAT_TYPE_CPU_AFFINITY:
 			cpu = (struct acpi_srat_cpu_affinity *)sub_header;
+			if (subtable_len < sizeof(*cpu))
+				goto invalid_srat;
+
 			pxm = *((u32 *)cpu->proximity_domain_hi) << 8 |
 					cpu->proximity_domain_lo;
 			if (pxm > max_pxm)
@@ -2084,6 +2090,9 @@ static void kfd_find_numa_node_in_srat(struct kfd_node *kdev)
 			break;
 		case ACPI_SRAT_TYPE_GENERIC_AFFINITY:
 			gpu = (struct acpi_srat_generic_affinity *)sub_header;
+			if (subtable_len < sizeof(*gpu))
+				goto invalid_srat;
+
 			bdf = *((u16 *)(&gpu->device_handle[0])) << 16 |
 					*((u16 *)(&gpu->device_handle[2]));
 			if (bdf == pci_id) {
@@ -2100,9 +2109,13 @@ static void kfd_find_numa_node_in_srat(struct kfd_node *kdev)
 
 		sub_header = (struct acpi_subtable_header *)
 				((unsigned long)sub_header + subtable_len);
-		subtable_len = sub_header->length;
 	}
 
+	goto out;
+
+invalid_srat:
+	pr_err("SRAT contains an invalid subtable\n");
+out:
 	acpi_put_table(table_header);
 
 	/* Workaround bad cpu-gpu binding case */
-- 
2.34.1

