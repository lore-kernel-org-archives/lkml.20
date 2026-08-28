Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27221448B8A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921537; cv=none; b=CYeqNtpOdQQR9v2I/LORdQxw4eJYWAwBOVgnLQ3nD9WTFFAUcc8O196Wo2qPJ439JujxlvoKvSP4AGjQlOpbLkv6hP1Jx0Qj14hb1a6t83OAPPE3DiNMG+zXNCUYJ7bj8uW4G8/5Etrur42t12xsX3yQ8aV3JEOUbuk32E7B/Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921537; c=relaxed/simple;
	bh=Lr/J4nGhI9HZ4GSCYB+anX3yEcdzujAGysyvFKQ/4YM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Euz+nOVm6PxLFjOn/sm1mS/IbNW/CtzH7B9HzaqGNtAxmyEY5pRvYclnkjbwvdXiAlNpAwGjLbZKI1M2pkhFEFFP4FozFyTdoav5xlYvfx8nseJI5qbp2gt+vwpnBmS5ahJiN7LiKVDUDW6WgbfERNkeKKcIKFsoY/14kKEQrWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+CXwYrq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+CXwYrq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d72ae08fa1so8369445ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787921533; x=1788526333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6Y49Yh/U2ojB/h29Am3d6mLztrp1swbHOleDiTE2qg=;
        b=B+CXwYrqSzl3j0N6RpWx+0nMzKXAlp2T5akUBiPnilWXBqQtYKyOAWpftPGwe3jaUI
         uh/jXl/Ny36Ai7p+9DsAu+WQu8Z39HCokOofHMq6Ytus0zKcdFnC22HNRrUcs2C1L8bx
         ZxYvVsPvG6L9+Phcnwd1IlWZbXx2f7Qlx1qrbiXUunh2qUuEM4HRxKx8nH3rwhw0W4mo
         y3V+xBClbxeAaiv/c6ClGAj/MtrYlDQgLfQG+/zfGxhMQJH5R11VpHEBQmCcu86F/i9W
         qr3zWNvGThyk9Cos2MKeKailuG4YosNY5b4qMJ22J2a2IyAv5DUCz+Cdm5MgkWWZclkj
         Dpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921533; x=1788526333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6Y49Yh/U2ojB/h29Am3d6mLztrp1swbHOleDiTE2qg=;
        b=DQqAdA8l+BSuP7E5SlhVQTCChSkIKxnzC4ZogpV7tGNVHEBtHCe5jwLzzImzQ0eNtt
         tAabXE0vZnLHKNSsz7RzRZXd8CB7PXtrTZooPaP0AneM3AA04Y9YsnN2yRY0IXRtIU9Y
         /Rdc5pLcfAhYUv0N8B3Z2eIBNK7I6d9rjuN1daUcN6m0VMsg8x2jpySG52mKt7aavf9I
         VQUcmBwbrfRH7QdCd8nWlkYHZsGdJUL1KoQXTmgFWxJaMCZuZwBJTx/Z8dsVtFGexWOf
         UC9njxBI2X4fkOBvGSSkWSwWzCmsNbhFUbY7iLSbp90H59h+ZxriT2UNHQ47pHaz3dNW
         r8jA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+WymbUs3Vo1Gp3aa1HH6prE2N9npLBM32ei3s3KqKiHH2CJjiBbMJxqpxYIULK8/U+jmWRu1qhExlXrU=@vger.kernel.org
X-Gm-Message-State: AFuF++kVrEh+Ov2w93jyUZF3bkUKudSaSt6SNcgKbZ6Ue1/jyYFLgWbz
	HwyTiQL22Ff3955jHS5+jxumFzrL/YtLA0i4hD32guj2tSapLJUseslQ2VJSoFpM/Kc=
X-Gm-Gg: AR+sD13QDbRHJ/rTBhrGjZMM8wAMpXihaDj+psBqewq3IBHUClyxfFMl6ONesg1f5ho
	Y1olsnaMwrM4UJh17t/b+acGSYy8th+AJok+tYnux1Rt2DXNreaqiYs6dEl2l9o1LnL3oWC3ztU
	fIkENfbpu3O2hUE0LT4AtQjzGofwB0DIv/2+Jc8/H1x8JoHwbjT0QgVZKB8G6k7xNN4v8b6kQXA
	u12IKqQ3qDIXXPQu/w+IPsJ1i/w3GlJKQVW6+fq37FiSlUD4PCky8Q4hT/2mBSScQuIXatatkid
	i6jVYTipNhpdsR4Lfd3JI7aq1V2NE+glnS8vGsVUhj1uKpkudM+krvP/a0I67J6q8QfWQYn3xZY
	09ca5rAj5khoQjQkwg40570AEYRFOj6QNzl0h1G7B2W3dVSVIDpxYczgQdsu8KfBBbZm4ykcDPU
	NYurHzM9bptyo5RfpYZc7nRb3+K28W3P16BGoISA+Ky/D1zuu5UjyFdg02mgWitvnxUqFsWHGyu
	A==
X-Received: by 2002:a17:903:2385:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2d74deec50bmr145248605ad.10.1787921532632;
        Fri, 28 Aug 2026 05:52:12 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fbb27sm4761385ad.9.2026.08.28.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:52:12 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v2] exfat: validate vendor allocation directory entries
Date: Fri, 28 Aug 2026 20:51:54 +0800
Message-Id: <20260828125154.1104851-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exfat entry validator checks the type and ordering of benign secondary
entries, but does not validate Vendor Allocation entry fields. In addition,
exfat_find() reads only the first two entries, allowing malformed trailing
Vendor Allocation entries to bypass validation.

Validate the allocation flags, VendorGuid, FirstCluster, DataLength, and
NoFatChain extent. Read the complete entry set during lookup so malformed
Vendor Allocation entries are rejected.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c   | 49 +++++++++++++++++++++++++++++++++++++++++++++---
 fs/exfat/namei.c |  3 ++-
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fe73b1380c5d..fa9abedf4d84 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -678,11 +678,54 @@ enum exfat_validate_dentry_mode {
 	ES_MODE_GET_BENIGN_SEC_ENTRY,
 };
 
-static bool exfat_validate_entry(unsigned int type,
-		enum exfat_validate_dentry_mode *mode)
+static bool exfat_validate_vendor_alloc(struct super_block *sb,
+		struct exfat_dentry *ep)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	u8 flags = ep->dentry.vendor_alloc.flags;
+	u32 start_clu = le32_to_cpu(ep->dentry.vendor_alloc.start_clu);
+	u64 size = le64_to_cpu(ep->dentry.vendor_alloc.size);
+	u64 max_size = exfat_cluster_to_bytes(sbi,
+			(u64)EXFAT_DATA_CLUSTER_COUNT(sbi));
+	u64 num_clusters;
+
+	/* AllocationPossible is required for Vendor Allocation entries. */
+	if (!(flags & ALLOC_POSSIBLE))
+		return false;
+
+	/* The null GUID does not identify a valid vendor allocation. */
+	if (!memchr_inv(ep->dentry.vendor_alloc.vendor_guid, 0,
+			sizeof(ep->dentry.vendor_alloc.vendor_guid)))
+		return false;
+
+	if (!start_clu)
+		return !size && !(flags & (ALLOC_NO_FAT_CHAIN ^ ALLOC_FAT_CHAIN));
+
+	if (!is_valid_cluster(sbi, start_clu) || size > max_size)
+		return false;
+
+	if ((flags & ALLOC_NO_FAT_CHAIN) == ALLOC_NO_FAT_CHAIN) {
+		if (!size)
+			return false;
+
+		num_clusters = DIV_ROUND_UP_ULL(size, sbi->cluster_size);
+		if (num_clusters > sbi->num_clusters - start_clu)
+			return false;
+	}
+
+	return true;
+}
+
+static bool exfat_validate_entry(struct super_block *sb,
+		struct exfat_dentry *ep, enum exfat_validate_dentry_mode *mode)
 {
+	unsigned int type = exfat_get_entry_type(ep);
+
 	if (type == TYPE_UNUSED || type == TYPE_DELETED)
 		return false;
+	if (type == TYPE_VENDOR_ALLOC &&
+	    !exfat_validate_vendor_alloc(sb, ep))
+		return false;
 
 	switch (*mode) {
 	case ES_MODE_GET_FILE_ENTRY:
@@ -836,7 +879,7 @@ int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
 	/* validate cached dentries */
 	for (i = ES_IDX_STREAM; i < es->num_entries; i++) {
 		ep = exfat_get_dentry_cached(es, i);
-		if (!exfat_validate_entry(exfat_get_entry_type(ep), &mode))
+		if (!exfat_validate_entry(sb, ep, &mode))
 			goto put_es;
 	}
 	return 0;
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index a4dc83b5949c..80f60e80786e 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -645,7 +645,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 	info->entry = dentry;
 	info->num_subdirs = 0;
 
-	if (exfat_get_dentry_set(&es, sb, &cdir, dentry, ES_2_ENTRIES))
+	/* Validate the complete set, including recognized benign entries. */
+	if (exfat_get_dentry_set(&es, sb, &cdir, dentry, ES_ALL_ENTRIES))
 		return -EIO;
 	ep = exfat_get_dentry_cached(&es, ES_IDX_FILE);
 	ep2 = exfat_get_dentry_cached(&es, ES_IDX_STREAM);
-- 
2.34.1

