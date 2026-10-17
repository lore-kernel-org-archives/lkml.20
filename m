Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798F746AA73
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792227838; cv=none; b=pu2hLmoToKokxG/AniIqPCny6tUgwwZairY0MFz8wzGmvXam6UX/Oh+mLkYKYE282jWtqNqHS976FVa92L5Z8mKkdl+JNRnkMYEFoyC2aciWdzklEEK82thifZR6TasEQyS/2EWvHWb7P+1bjB11z3OZOC5DJsQVEou0OaKVn5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792227838; c=relaxed/simple;
	bh=ez5W3Tiudeu7DKRDSxt0ElxQRTPeopy/n2r2FQTfeZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GXTyl/p/RTK1aWUAoBKDUTzhkMD4CbPbivABRXikk5GbyhQuI9QIoSJkGc2K6kkvTLii5F4/sG3O1Bl6B9IC4Nph9vKpdvs+Q10FkqSHe1zrQayKpXLyq7U+IYMNB3B++IMk00S69PgWv+c292kc495GjRV9y+hAz4sRSREKlL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=BrwiRFUI; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="BrwiRFUI"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1792227834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xDtFfkl20RYcNy8cmYwdbGMoG2wivzzVXEPHVURNyqQ=;
	b=BrwiRFUIXxVPcSwxbbc/efMOK8LjBxgiXAXhEEYUIFZQYVe9aJkLrJqhY9dW9ZYbo7zJqv
	9ZxxLustF9AT2wR4yWTSoWmmsQVLrDN8hKUIjorSaZSL628HAzmGUQ38Mi7ZaGsL+91nP4
	mCLZPtIPjKzoUh/7i3tuUkqO3u1OomARLMymtdK/3nUixzbi0zMDmqO2C0weQL3cGvJ/yS
	d3C4gkl6Z46h2gIbu20o4XtYJm8mvMBEYwvnx0EgcBfqRNqZAKLp/bMB25+ypuYMy1pkRz
	3y9dEPAk/xDhhCPDs9ATpqpCtCLdw6ALpBmLaHz48qmn8FbjZLgZ3aQW22tylg==
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Yidi Lin <yidilin@google.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH] firmware: coreboot: Don't skip CBMEM entries outside of known memory
Date: Sat, 17 Oct 2026 11:03:51 +0200
Message-ID: <20261017090351.1266064-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

coreboot leaves CBMEM out of the /memory node of the device tree that it
passes to FIT payloads, e.g. LinuxBoot on arm64 Chromebooks, and only
lists it in the memory reservation block. The kernel has no resource for
that memory, so region_intersects() reports it as neither System RAM nor
Reserved memory, and since commit e31ecda9e3af ("firmware: coreboot:
Skip no-map CBMEM entries") all CBMEM entries are skipped on such boards.
That loses the coreboot log, the TPM event log and everything else that
CBMEM devices expose.

Also accept entries that don't intersect any memory resource. No-map
regions are still skipped, as they are IORESOURCE_MEM resources, as are
device regions.

Fixes: e31ecda9e3af ("firmware: coreboot: Skip no-map CBMEM entries")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 drivers/firmware/coreboot/coreboot_table.c | 42 +++++++++++++---------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/coreboot/coreboot_table.c b/drivers/firmware/coreboot/coreboot_table.c
index 2c8c928fbb33e..5980dcc00e07e 100644
--- a/drivers/firmware/coreboot/coreboot_table.c
+++ b/drivers/firmware/coreboot/coreboot_table.c
@@ -114,6 +114,30 @@ void coreboot_driver_unregister(struct coreboot_driver *driver)
 }
 EXPORT_SYMBOL(coreboot_driver_unregister);
 
+/*
+ * Whether the memory of a CBMEM entry may be mapped: it must be exclusively
+ * System RAM, or exclusively Reserved memory, as CBMEM often is on x86, or
+ * memory that the kernel doesn't know about at all. coreboot leaves CBMEM out
+ * of the /memory node of the device tree that it passes to FIT payloads, e.g.
+ * on arm64, and only lists it in the memory reservation block.
+ *
+ * Anything else, such as no-map regions on arm64, which are IORESOURCE_MEM
+ * (see request_standard_resources() in arch/arm64/kernel/setup.c), must not
+ * be mapped.
+ */
+static bool cbmem_entry_is_mappable(const struct lb_cbmem_entry *entry)
+{
+	resource_size_t start = entry->address;
+	size_t size = entry->entry_size;
+
+	return region_intersects(start, size, IORESOURCE_SYSTEM_RAM,
+				 IORES_DESC_NONE) == REGION_INTERSECTS ||
+	       region_intersects(start, size, IORESOURCE_MEM,
+				 IORES_DESC_RESERVED) == REGION_INTERSECTS ||
+	       region_intersects(start, size, IORESOURCE_MEM,
+				 IORES_DESC_NONE) == REGION_DISJOINT;
+}
+
 static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_t len)
 {
 	int i, ret;
@@ -149,23 +173,7 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
 
 		switch (device->entry.tag) {
 		case LB_TAG_CBMEM_ENTRY:
-			/*
-			 * Skip entries that are not exclusively System RAM or
-			 * Reserved memory.
-			 * On ARM64, no-map regions are filtered out as they are
-			 * IORESOURCE_MEM (see request_standard_resources() in
-			 * arch/arm64/kernel/setup.c).
-			 * On x86, CBMEM often resides in standard reserved regions
-			 * (IORES_DESC_RESERVED).
-			 */
-			if (region_intersects(device->cbmem_entry.address,
-					      device->cbmem_entry.entry_size,
-					      IORESOURCE_SYSTEM_RAM,
-					      IORES_DESC_NONE) != REGION_INTERSECTS &&
-			    region_intersects(device->cbmem_entry.address,
-					      device->cbmem_entry.entry_size,
-					      IORESOURCE_MEM,
-					      IORES_DESC_RESERVED) != REGION_INTERSECTS) {
+			if (!cbmem_entry_is_mappable(&device->cbmem_entry)) {
 				kfree(device);
 				continue;
 			}
-- 
2.56.0

