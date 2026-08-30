Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E502EEE8A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066857; cv=none; b=RiZt3Rhn5oUr20UeSnlfYd2moeM1J7E4+3tPjI+3WM5i6cUTjyTi4XvbGjBbW80zViAiuViO9GnmSKxYab4ALS3y8maaJEaETJYDlaK5kkCULDLW962KOgRjvPdcnCljdxhWa1ue2CJ5dIv25gESYrZE6tLY03B/KyPmhVZoAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066857; c=relaxed/simple;
	bh=1IoYOQdQXFvwKzLHxgB+uq3xpg0ikIIhqsw4J/nkMyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIvJ262O+RtsXK+5sOQHeRTu3CWSOwNdG3d4Uv3uKxcburBLkL+xTtQgJqhzTxp/9Wm2vzqUCCu3/zO3Vstx+SUHcNAqKRxWGbwA814GlKjx+tNW49ISjBP0jhhIIiJcPXFxilWYGu7yGZ24Yzi+Cn9OMnNCmwmtPSpmNjuLq+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=D3rvEC+o; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="D3rvEC+o"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so2338860a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788066854; x=1788671654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDQFaZkSZClgPI6vQ9uvEW8golFAoyljS7GedCtCSvM=;
        b=D3rvEC+olE1+Wu1sy1lP2oKd2kkWDYpDpNSmcjmtWVGXxAhyI4V0oXi4KZtPluRIf4
         1CEpl21ZXgE6LRNjqew+KrLfvpXn8Q9i5AebP6w+/ruTU+zHPOuhjGFHHbHldXarvtiC
         ATGXmr+k+jKWIZmYBuVxnt4B4SFBa/4WkdZMsMX+wal2dA0DHObIliq5eKd4pyJ8nYc5
         akZ7HcdWNMzBIE6l9yBKVj2iyDrvXx04RYrrDUVtNh7sTRRa2WhRwEE6A5PFjrQQnvtC
         Z2AaOoEv3LezPoceSEPjvDnxhuri0s6TcM9KPse8I8+0BuGMKvNIvdHc/JukhVHr0NpH
         ovYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788066854; x=1788671654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nDQFaZkSZClgPI6vQ9uvEW8golFAoyljS7GedCtCSvM=;
        b=aRSrQmRXCLItlOswHbWF2GDo01cLEXjpjkKxibLnig4ZdB7Apm56Z5ZyYNi6C06atc
         K3byss2q7gLmwRbo/FCHsE1pf9smonFGYsqE+/sicZcux3iNwh6et2eLfwZ5hDkAOTnY
         tJLPS2JFXQBnX5RXpUb1FRIRGg+hGywn89qeF1m9mr365dOyaHluUGDHBXT/nZFjIFuZ
         JhnfgsE9YQrbfHREMXAdZN8UhWVJD2LkNbSYfyKPn8f58Nqgsvq8r1Hxo71OjPR7CnZY
         DxLgl9u37xuOsYxzQ21nZCyJEkyc+TfYZZcf9lHbxt2R0RrTdkxK98oHCe+w5yoSYtDK
         f6yA==
X-Forwarded-Encrypted: i=1; AKwUvBxxpb3pbENr6/K0Eg4JKkxQfmQLBar9Gn/l4bnLgmZu8RBFSoKBjUAGnzaTF2jE7hZlLF+o7eQ7E5zaiK0=@vger.kernel.org
X-Gm-Message-State: AFuF++lnUxYxer9XP7u8zR/NfYQRIK5BtnwosNR953E0kYqbr6rmN86V
	kH0mL/g0hqSA40a0YorSpdUGLwcoluVUDCaeueq3PYpuEiiurGenw0guC6TLeXcrX4k=
X-Gm-Gg: AYBFou0mJdXFG0OOFquDcDi80gxlvWq1GZGjfQnJVfO5FRmCMDaYYIJ9f/YPBwgJZQn
	UjBlavocgmnCBmROxV3kpLK5mnMX32233SLZeHPVMPXr+YJ9OWMFQx4o2LnEG+85rfiq0QhTs3E
	t8Jt7IsocV3n8Wt6OKQqgx/yYT6qx4wLx5hd6Bnk0Lc88fZ21xoN23pF1HHFCq8/XbfEj5wL2jq
	88kX90D9dmRYpq7ZH17BNVzszR4IPNovEvGw6wBVxGPV7rQ1mxPdC6afMc3e58RNHtXSSjjX1cK
	UQTzG40S3baZKP/tm2PepH7ZW3ah6x0gHPDT/5OwKpHXSlqgQw44SkvJGM3cEMP+lusd2Uy5phH
	8mdXMMOgQOgwOOWdki/oc/Jvi83Ml670pUfY3jspVUYrpU9aE/SyCL+oRfUoAKCCr4qec+Lvk37
	nYih+CdGguwrIZSvq/r7pzynYud6jHkEnHDT3JNZ3/FmQvtNYEI294D77JJqCjx0RpQutbXCAOo
	3GDI0DHhZryiuSC8mSfYmAsioGyMwQn0vs=
X-Received: by 2002:a17:90b:53ce:b0:398:c0a2:8f8e with SMTP id 98e67ed59e1d1-398da8b6e92mr295447a91.26.1788066854435;
        Sat, 29 Aug 2026 22:14:14 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:d101:1d:112c:715e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm22595810eec.29.2026.08.29.22.14.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 22:14:14 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH 5/6] mm/damon/sysfs: support aging_flush
Date: Sat, 29 Aug 2026 22:14:06 -0700
Message-ID: <20260830051407.50008-6-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830051407.50008-1-kiyer@crusoe.ai>
References: <20260830051407.50008-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the aging_flush monitoring context option via a DAMON sysfs
context file of the same name, next to addr_unit.  Accepts boolean
strings (kstrtobool); defaults to N (current behavior).

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 mm/damon/sysfs.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index e3858ffab4b2..c8bc9cfbe4cf 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -1403,6 +1403,7 @@ struct damon_sysfs_context {
 	struct kobject kobj;
 	enum damon_ops_id ops_id;
 	unsigned long addr_unit;
+	bool aging_flush;
 	struct damon_sysfs_attrs *attrs;
 	struct damon_sysfs_targets *targets;
 	struct damon_sysfs_schemes *schemes;
@@ -1618,6 +1619,29 @@ static ssize_t pause_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return count;
 }
 
+static ssize_t aging_flush_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct damon_sysfs_context *context = container_of(kobj,
+			struct damon_sysfs_context, kobj);
+
+	return sysfs_emit(buf, "%c\n", context->aging_flush ? 'Y' : 'N');
+}
+
+static ssize_t aging_flush_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	struct damon_sysfs_context *context = container_of(kobj,
+			struct damon_sysfs_context, kobj);
+	bool input_aging_flush;
+	int err = kstrtobool(buf, &input_aging_flush);
+
+	if (err)
+		return err;
+
+	context->aging_flush = input_aging_flush;
+	return count;
+}
 
 static void damon_sysfs_context_release(struct kobject *kobj)
 {
@@ -1636,11 +1660,15 @@ static struct kobj_attribute damon_sysfs_context_addr_unit_attr =
 static struct kobj_attribute damon_sysfs_context_pause_attr =
 		__ATTR_RW_MODE(pause, 0600);
 
+static struct kobj_attribute damon_sysfs_context_aging_flush_attr =
+		__ATTR_RW_MODE(aging_flush, 0600);
+
 static struct attribute *damon_sysfs_context_attrs[] = {
 	&damon_sysfs_context_avail_operations_attr.attr,
 	&damon_sysfs_context_operations_attr.attr,
 	&damon_sysfs_context_addr_unit_attr.attr,
 	&damon_sysfs_context_pause_attr.attr,
+	&damon_sysfs_context_aging_flush_attr.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(damon_sysfs_context);
@@ -2102,6 +2130,7 @@ static int damon_sysfs_apply_inputs(struct damon_ctx *ctx,
 	if (err)
 		return err;
 	ctx->addr_unit = READ_ONCE(sys_ctx->addr_unit);
+	ctx->aging_flush = READ_ONCE(sys_ctx->aging_flush);
 	/* addr_unit is respected by only DAMON_OPS_PADDR */
 	if (ops_id == DAMON_OPS_PADDR)
 		ctx->min_region_sz = max(
-- 
2.54.0

