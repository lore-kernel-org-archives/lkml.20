Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8184C9E01
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002101; cv=none; b=F8HCpLVCmboq8DVhmLseft2cpTHA65c3fRHA+eXlCoP38z2QIuYCm6V+cO7ulfnhCjiklVJtm79mGcLqvUPvK9rITZpAiRM8rfMgu916TRCZM6U8bBVqQTenCcIgc57CFYG1Yup1VLVK04OwTErxv9uYgYmMxrvz0o6xqemzOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002101; c=relaxed/simple;
	bh=duRXU1e3xEsOIbmXxoz71kRuUhOpCKkqzA1WNFsYDCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LybUd6ohADqAA9vfNMMEA45j4GG4kWu4SeWnPd826qsY1CrE5FwXE459pkH2DuSAFZ62UsHebFelOwylVNwhq89PcnpcFitLAbJ7MMZY+uZvaUpFKKRgxK8+DTLU/c+aiS3uuqEKZQHe3YbNe5Id/gO6V4qIpLyu2tiWSmmoeRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNIR9du4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNIR9du4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso3266246f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792002097; x=1792606897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xRifw5Znr1rS1Ach/CyZd8ItZHTFRvDxHBIuSRskJ0=;
        b=WNIR9du4F/0d0FKKhM563ZLvT9rVhELL7vMhw68RoSXD10EhZaKgyn1EKDTplcfgqW
         J8pP4gVB8UjOJR2zzpTLBpwgAbnbxiqPF189fFIeai+ZtRA2TNZSH1Y5Gzkx7yNrbvWT
         WdqkE5MnD5+QTMH3oMc+7iwtSZuN9EGiSWBNCsnxQ4mcTUvhy0loGL7V19b6yJICYOgS
         Kxn8uODnj6rcFi4YFWvo/n28/cbOhVqjvnQ6eiYws3Z0CzfMdjBkHongsF2Vpe4NqHUj
         tmt/OEpNcYDYUR7fbwSPQC6hJnlRcKmefDmgikjYBUqh3joHHguTAIWORN2YtX6/lZUs
         aHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002097; x=1792606897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xRifw5Znr1rS1Ach/CyZd8ItZHTFRvDxHBIuSRskJ0=;
        b=zYt9x1QxcfDMb+LPKlfgoEfR6tzeSpREuc2+VpR7UoqGHwhHpN/svjAGt37iweR7A9
         FQHBINlqFXpDi5Adt0FCGWevDXUvDmAAf/kftoMrigtjwH4TA3bgAc/HpVEmhAPXvuh4
         j/17oQz3it79zjFqqnn+xyoqfoChr0Khco7xm7O/jAfYhbxslBUs2Deu7/fsjRQ4P3pb
         iXtRM7QR+t+MDdGNrJzCMSm0qZ+SafXDcqMPlCKBRUPIp92DSvN+XBtRm6phVhkBmTnr
         Z9NMxfUMdx62q/LB1wCVYEzoI0SqxXsOeFpXzL0g/MhSa2C8aYpM5jv88S6xU2tMjmgn
         aeTw==
X-Gm-Message-State: AFq9FYIgV/SWRpiiY0FTsdx9NY74X91YD3Yli6X98y027AqrA5SRNVk1
	s3ol1599z8pvzBBXOuuvR9R0pVRUNd7/rINyIg/8OaJUH/WYRye42WuH
X-Gm-Gg: AYBFou1QSNRJZlibVq1zusapNSEwt7eT+YJX6VvUHXZ2RS43gy5bUsAPFQkyVSS0PDA
	zOe097VNyaOdEvo70yzjy0MsPId38AzBoLCxVSHkuNtigIUvLJ6cjT0Li+fHpE+M4/O4ya6PmIc
	9cdJt1VcXcWsVJsKxWVJzMtulZtoWEadRQGnSICRj4E9Rn9ZsWXGDNpke1RjJSF5vvZGPthyetk
	xsar42emrBZMELwiuCXoIxna3pI12fFf1fv8bBZFwXUj41f6N0bJCrZVAkD5DXtp286Xm1xLhuI
	jEcLkdjhaIBUMACCp8GoG0vWMau9lmodMNORlMzvscAY6T4hS3L+8cmr4uy8OiPejFvC3o+9Tqt
	XIuYyDMgdf3nq6rL6JFzFn/ThpZ3w0qVKdhr2QZNXLDWAFK/oIhq8o4LwICXQwaDfp3NGWu9NM7
	zfVm6sNmx6rNPssceig9DsOlD1hYqcwxonOsFJTSBC8Fudiyw0h5KcYhu19YX35ToPugf3EPEb/
	w==
X-Received: by 2002:a05:6000:2912:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48dbace9d5cmr30844029f8f.11.1792002097068;
        Wed, 14 Oct 2026 11:21:37 -0700 (PDT)
Received: from Huaiwei2200.nb.int ([92.43.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6ddcsm13082271f8f.52.2026.10.14.11.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:21:36 -0700 (PDT)
From: Oleksandr Suvorov <cryosay@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Oleksandr Suvorov <cryosay@gmail.com>
Subject: [PATCH v2] soc: qcom: cmd-db: bound database walks to the mapped region
Date: Wed, 14 Oct 2026 21:21:16 +0300
Message-ID: <20261014182121.3624604-1-cryosay@gmail.com>
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

Also reject a region smaller than struct cmd_db_header, since the magic
and the slave headers are read from it, and set the size before
cmd_db_header becomes visible to callers, so a lookup never sees a
header with a zero size.

Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>

---

Changes in v2:
- Reject a region smaller than struct cmd_db_header in probe, as
  suggested in review

 drivers/soc/qcom/cmd-db.c | 89 ++++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 3f1eee784387..84ef7c166d93 100644
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
@@ -349,19 +395,24 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	cmd_db_header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
-	if (IS_ERR(cmd_db_header)) {
-		ret = PTR_ERR(cmd_db_header);
-		cmd_db_header = NULL;
-		return ret;
-	}
-
-	if (!cmd_db_magic_matches(cmd_db_header)) {
-		dev_err(&pdev->dev, "Invalid Command DB Magic\n");
-		cmd_db_header = NULL;
+	if (rmem->size < sizeof(*header)) {
+		dev_err(&pdev->dev, "Command DB region is too small\n");
 		return -EINVAL;
 	}
 
+	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
+	if (IS_ERR(header))
+		return PTR_ERR(header);
+
+	if (!cmd_db_magic_matches(header)) {
+		dev_err(&pdev->dev, "Invalid Command DB Magic\n");
+		return -EINVAL;
+	}
+
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

