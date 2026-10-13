Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD33BE642
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882979; cv=none; b=XKdZBJ+2dXoOD9zAXjpnBsQp69cNy9hktaptF1rlNESLxU8uSjJlD2/ptfiIDfRPlq5PVIvPfXcmIPrgzJUV/dwU+gX1pEhJe+8PeScS7jinBEDrH0kbAH8pz0ueFHv/EO0PA9WPw/EfTLfoA09keufuM9y/pm4UxSnvGlhlaf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882979; c=relaxed/simple;
	bh=7FQOSKy81cSwa5eUjkRAvJzUepz9/q3vaiiTIid3R/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J25TaVw/nX7MV3bfJtO+WaQZbiTIyU0GoO6qZBtmfX+RI+gjFyzYposrAgorucFEh3Y7bVYax5xiQBksjbuNOus1bnCpPFb8AyxF/bjOJhC/zGv6GclwRWgmDS/sZcmD/FeFYFZSJZ3BBTHG57xm89jycVkWFyyKPiT8BdlnqfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA4OKLmr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA4OKLmr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso24574835e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882976; x=1792487776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Cl/x/bWFHmHIbiDXaQNoYo7rF5+4fBsKHe3jBSrce4=;
        b=NA4OKLmrUS+OUUiYbyCu63HuXHz3AqgdtahSXkMfnWI4oKLp+HEEU4+ol6LGjOT0Af
         4SChsIQJE24Y5rMZLMlYddaIQ9NcregPTSv9lDClFhtsB/bmuIXTTgiN0kC51DY+xweL
         1CVvTOEHerFBFoaJDjhZEA6u64cX5xpirp6vcB8RKGRh+4OEdDf3ZMZLbSpbBWERiAku
         hzgi4mKS2V/LgmEkirhoR7wEecX7usKugC8NhQabj0vdvHzYvFF91/vqz3Cjui+4WJKR
         E1XInwOQJflA4Vcg+NzAoiG/Ocr+yVQ20T4C7CYcmKZxztCx1MEILmmexMFxoqZAF/PW
         +GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882976; x=1792487776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cl/x/bWFHmHIbiDXaQNoYo7rF5+4fBsKHe3jBSrce4=;
        b=yOYklnereYaHmHj21k4gEahkydUCjmOikamoZ0q/Bzaio5DuHtEkXleW8yTS1ZzSjc
         y/c2F+dAjnS7u0RIaq5ApTweoW7ucsWABBWI0mmexv/SvKiU2zFxY5Qj3PgTXXbMcjEN
         hz7PX9xWIRsh+DnKVZJnzaIzhstd6wPGL5lhB2Cw3LDlhfV+mjy1boUMbnVuepWk9N28
         mK4mwKfLArtLvtUa1LEY19QToHMnPeo6iDHpl5nizBohhCLVBjh8AbxHwKcrvftHC4o6
         OdkUtVpXzr5oU+ASgd1Yvd5+egCViEIBsrFjddBKKmoHNW0kkSVOhct2FfJlDIkJuci2
         BE6g==
X-Forwarded-Encrypted: i=1; AKwUvByw1e0wbDkPASnxwpOZuK7u8PKBVcy25RgQAgY43zKtmvvR9e61giGnyRwtC/mMqcNJfDK3IKeEQJQxdDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6z+01aRsmsyDRkcNCTuA8h2cX9d3nwwDvM7W0dTs9WQ3bH6fa
	i5Tj0vGX61cXwLhQL646Do6VG8fAIFi3gdVmyBL1Baj9qHXE+6C66JA3
X-Gm-Gg: AYBFou1maHZaeJT+Ak3qPN2FHLuc1bhrcaXwKptByJGCR2SkldwwkcGXXe+z6e71z4c
	XdN+csU+9hiYTyn4j0I+U8SWHJNZx96aI0gFIoNzpaAgisBH3hTRThs4D8iQC0XvhthCxUTTgH0
	FQZKJg9pne3DFLzfo/vzi/X51yNAYsBmGkBSy3KlpkOB1MZi4bcspdh12XEJ9lLfLwmSAT37sEi
	8PFOQgKaJ7TnM4yXBIZAZ1p8BYGwhJpFs4BjyFfwMyXG3KbdhpVm1+RKRYNjrCGNKv9sPVMBWGu
	hMjl6iEZtQhGCS9QltbXpJYh/kyOQ5R/zEc6cOX6XI8yf9ooWAPvvHLMlpfcNo/4UNpqOATtAYX
	imiHiaucfCDA/EbTOcXO0AdIKpGyMNIZCVvdaLOHmKKX9w5m8Y5ltj/JQdEnkJMjz9aAjT3aaWn
	pzeJeMlJ3HTneZM8Sa8glzmvoH+x3r5JpdxL+ikKQx1xOH02wWeofqVMn6qErwZz89kBhKj8OfX
	w==
X-Received: by 2002:a05:600c:8b74:b0:4a0:2847:b6ee with SMTP id 5b1f17b1804b1-4a18e4fb8c1mr230881505e9.35.1791882976135;
        Tue, 13 Oct 2026 02:16:16 -0700 (PDT)
Received: from Huaiwei2200.nb.int ([92.43.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967c03sm4103499f8f.6.2026.10.13.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:16:15 -0700 (PDT)
From: Oleksandr Suvorov <cryosay@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksandr Suvorov <cryosay@gmail.com>
Subject: [PATCH] soc: qcom: cmd-db: bound database walks to the mapped region
Date: Tue, 13 Oct 2026 12:16:08 +0300
Message-ID: <20261013091611.2592612-1-cryosay@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The command DB is read from a reserved memory region mapped with the
size given in the device tree. The per-slave entry count and header
offset, and each entry's data offset and length, are taken from the
blob and used without checking them against the size of that mapping.

cmd_db_get_header() walks rsc_hdr->cnt entries for every slave when an
ID is not found, and cmd_db_read_aux_data() and the debugfs dump return
or print len bytes at a blob-supplied offset. A count or offset that
reaches beyond the mapping makes these read outside it.

Keep the mapped size from probe and add cmd_db_in_bounds() to check a
range against it. Skip a slave whose entry array is out of range,
return -EINVAL from cmd_db_read_aux_data() for out-of-range data, and
mark such entries in the debugfs dump. Warn once for the first two.

Also set the size before cmd_db_header becomes visible to callers, so
a lookup never sees a header with a zero size.

Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>

---

 drivers/soc/qcom/cmd-db.c | 80 ++++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..e7be4d040c83 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#define pr_fmt(fmt) "cmd-db: " fmt
+
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/kernel.h>
@@ -108,6 +110,24 @@ static bool cmd_db_magic_matches(const struct cmd_db_header *header)
 }
 
 static struct cmd_db_header *cmd_db_header;
+static size_t cmd_db_size;
+
+/*
+ * Check that a [addr, addr + len) range lies entirely within the mapped
+ * command DB region. The slave and entry headers carry offsets and counts
+ * supplied by firmware, so a walk derived from them has to be validated
+ * before it is dereferenced.
+ */
+static bool cmd_db_in_bounds(const void *addr, size_t len)
+{
+	const void *start = cmd_db_header;
+	const void *end = start + cmd_db_size;
+
+	if (addr < start || addr > end)
+		return false;
+
+	return len <= (size_t)(end - addr);
+}
 
 static inline const void *rsc_to_entry_header(const struct rsc_hdr *hdr)
 {
@@ -147,6 +167,7 @@ static int cmd_db_get_header(const char *id, const struct entry_header **eh,
 	const struct rsc_hdr *rsc_hdr;
 	const struct entry_header *ent;
 	int ret, i, j;
+	u16 cnt;
 	u8 query[sizeof(ent->id)] __nonstring;
 
 	ret = cmd_db_ready();
@@ -161,7 +182,13 @@ static int cmd_db_get_header(const char *id, const struct entry_header **eh,
 			break;
 
 		ent = rsc_to_entry_header(rsc_hdr);
-		for (j = 0; j < le16_to_cpu(rsc_hdr->cnt); j++, ent++) {
+		cnt = le16_to_cpu(rsc_hdr->cnt);
+		if (!cmd_db_in_bounds(ent, (size_t)cnt * sizeof(*ent))) {
+			pr_warn_once("slave %d entries are outside the database\n", i);
+			continue;
+		}
+
+		for (j = 0; j < cnt; j++, ent++) {
 			if (memcmp(ent->id, query, sizeof(ent->id)) == 0) {
 				if (eh)
 					*eh = ent;
@@ -209,15 +236,24 @@ const void *cmd_db_read_aux_data(const char *id, size_t *len)
 	int ret;
 	const struct entry_header *ent;
 	const struct rsc_hdr *rsc_hdr;
+	const void *data;
+	u16 ent_len;
 
 	ret = cmd_db_get_header(id, &ent, &rsc_hdr);
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (len)
-		*len = le16_to_cpu(ent->len);
+	ent_len = le16_to_cpu(ent->len);
+	data = rsc_offset(rsc_hdr, ent);
+	if (!cmd_db_in_bounds(data, ent_len)) {
+		pr_warn_once("aux data of %s is outside the database\n", id);
+		return ERR_PTR(-EINVAL);
+	}
 
-	return rsc_offset(rsc_hdr, ent);
+	if (len)
+		*len = ent_len;
+
+	return data;
 }
 EXPORT_SYMBOL_GPL(cmd_db_read_aux_data);
 
@@ -273,8 +309,9 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 	int i, j;
 	const struct rsc_hdr *rsc;
 	const struct entry_header *ent;
+	const void *data;
 	const char *name;
-	u16 len, version;
+	u16 cnt, len, version;
 	u8 major, minor;
 
 	seq_puts(seq, "Command DB DUMP\n");
@@ -307,14 +344,23 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
 		seq_puts(seq, "-------------------------\n");
 
 		ent = rsc_to_entry_header(rsc);
-		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
+		cnt = le16_to_cpu(rsc->cnt);
+		if (!cmd_db_in_bounds(ent, (size_t)cnt * sizeof(*ent))) {
+			seq_puts(seq, "(entries out of range)\n");
+			continue;
+		}
+
+		for (j = 0; j < cnt; j++, ent++) {
 			seq_printf(seq, "0x%05x: %*pEp", le32_to_cpu(ent->addr),
 				   (int)strnlen(ent->id, sizeof(ent->id)), ent->id);
 
 			len = le16_to_cpu(ent->len);
+			data = rsc_offset(rsc, ent);
 			if (len) {
-				seq_printf(seq, " [%*ph]",
-					   len, rsc_offset(rsc, ent));
+				if (cmd_db_in_bounds(data, len))
+					seq_printf(seq, " [%*ph]", len, data);
+				else
+					seq_puts(seq, " [out of range]");
 			}
 			seq_putc(seq, '\n');
 		}
@@ -340,8 +386,8 @@ static const struct file_operations cmd_db_debugfs_ops = {
 
 static int cmd_db_dev_probe(struct platform_device *pdev)
 {
+	struct cmd_db_header *header;
 	struct reserved_mem *rmem;
-	int ret = 0;
 
 	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
 	if (!rmem) {
@@ -349,19 +395,19 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cmd_db_header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
-	if (IS_ERR(cmd_db_header)) {
-		ret = PTR_ERR(cmd_db_header);
-		cmd_db_header = NULL;
-		return ret;
-	}
+	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
+	if (IS_ERR(header))
+		return PTR_ERR(header);
 
-	if (!cmd_db_magic_matches(cmd_db_header)) {
+	if (!cmd_db_magic_matches(header)) {
 		dev_err(&pdev->dev, "Invalid Command DB Magic\n");
-		cmd_db_header = NULL;
 		return -EINVAL;
 	}
 
+	/* The size must be valid before callers can see the header */
+	cmd_db_size = rmem->size;
+	cmd_db_header = header;
+
 	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
 
 	device_set_pm_not_required(&pdev->dev);
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
branch: 20261013-fix-cmd-db

-- 
2.53.0

