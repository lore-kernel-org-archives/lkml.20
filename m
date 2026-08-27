Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109B46D2AC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843684; cv=none; b=Xa0Qnm+SU4TOfKs5jvZLc2hG9uyTlDhhPE6h5zDeivi9RrckDo5u+4Sl2xoM3G2uzs4GSx3Xm3/1ORUPwu4s1e3nJ79nzOGk827AYVpLzx0QTDKDHf5M1/4LstihISre6tS9tVAF9IKP2GrPhUAXmxaof6iIc/lNR5FWRnBuUls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843684; c=relaxed/simple;
	bh=aHSSegnmtSvQYqja5X4Tk/wi5mZfwqv/wRrFJFYjdTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HKFeqgeHbgzu5QYx9mWyEyk0EvWwHNThZPPqgcEKy13xkWrc4VIdC3LC0eaTjCzq1UkU0RRR6tptcskWc5IGQohXu0LKE6Q7TwlAXwl5rJXoNCpxPjgU99OXY0kcODeQdZt+R1QC+dQ2T3+AnuyRhGE563xy3gO7wEIBVgN3ZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3ouDj4m; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3ouDj4m"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso56266a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843683; x=1788448483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOj72xyYrh/M1wL/Vv/7ESh6wi5lka6M7SFQ9Hx1r3E=;
        b=i3ouDj4mLl9w/I53+zGOtDBI8n7mi6CRVl5PYrJ+vQ4g3t0ZmlPbHBd23w5DoBw4kB
         wZsVOf/o5e1iOofVZmVfQjODx8f6b9+c9T+K6CMTg/HZ1qYBTa4CQHs/HjR0geGVMqxG
         5QQEbI5zda9dWFxABYOjzxaVz6mEIEmA54BL2yvqpov7QLfLf5xS6Pk28+lEq+saMgQF
         o3SaiOgtCprfYRynn38wpU0IAokEue2SiZPDklVCJJIQ8z74Nle+bO7FAvJuvraaK6E5
         uwikjsLDxiWQFCshOl8sQTj/lE+YxOa5SQraaIY+qW986fHQlckVTzCufpZOij0NjPZb
         ULFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843683; x=1788448483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOj72xyYrh/M1wL/Vv/7ESh6wi5lka6M7SFQ9Hx1r3E=;
        b=Pqz2A2415qM6vHx0LhuO3d31MFUjYRGUFs7yCXJDaFoyA79c2qSvvXTKFjMdNQk315
         Bdad/qzI3ZxJSoi587doswAveyNN3vZ9R/8b84HJGu5gM+LalbExebjfFxeJuRjYlN4S
         3jNW3TZ08Q9nNzZT4ShEL53kgmT4pXaeYUNCKesfupmaz78pLqdEwKQc6Djl25F8NJeG
         Q7DwUzOw8ezyVuYc5D8qGVmcnS+xsQFA6aNvZ7bGlP9St5MNZvYsljizJ8bj3ti+L0Ak
         n3alGudKt16XmRmB/G1FgvAfHZPUWQXyv7VcxKWNTS2EoLMeln/+Z1UHk7L4XB9oF1aW
         IRMg==
X-Forwarded-Encrypted: i=1; AHgh+RqAu3xU92FYIp/LXz6WvFydhVsIP80PEW9HBa1tD0fiSZ2NnLXp6hUXsZ0w91J6FhpnyT+fcYginhuH4xg=@vger.kernel.org
X-Gm-Message-State: AFuF++nVjwsExz1quPTcpOzLYPWPDdT8XfL77q8Thb7+GWl7yJVeRcPY
	biKhrD4EcZIS1dvi1mgsUXHWfsl9ztX2pKSQ59AoyoSJ/ej0Vp51exMZ
X-Gm-Gg: AR+sD12m9+QflAtXUu2RwjP3H8z/OGDOPgJ9A9uGq1IFjg6G90somsC+dEHAVSdCxZM
	2++vBCeuu+8qXbEcXnPofbEj1sTeUsuxi7jdVtXClqDgYUGIUXKq5P6tB7VqOg65KIUD660gyTg
	b8JIxh+vxBBpN9s8dgdEke1pquqNaLlnQsr5gsO1G8n0ND6Tsu2OFso6Np6xPhqAcMHltqYqunp
	ISKsOzBrGCyEwq24ZQXlHyT5cGqWDSoI/GvCL2UdMft/BOqAU0qdxQJAab83H5B7lfgqAV7H7+c
	elKkScdxOKW0XuiXVsHZNeeDRedOc9FU7VNWhDuQQcGjFsKd362JJe32IvC4VaBjSGRhWPlVs+H
	QPv/pgc7/my94nLAQ4e0q4jUncLMFAVlqi2e+C3IpufLuAyCWxXgPxc6BH+aciQlLQGL6Ww8Vw+
	gUd/zDQwiF3u0pw13VyJu9DGYjUxKd0Qo/+2WvB18ZhQjukoHgglxmN+z2ODo1qYVRAvrFsLUlg
	6giMEBIa0jxsfvUQkLzSKweclSdCM//YGnz5hSsUJw=
X-Received: by 2002:a17:90b:380b:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3966d13a242mr30232908a91.1.1787843682593;
        Thu, 27 Aug 2026 08:14:42 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186803asm3118453a91.11.2026.08.27.08.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:14:42 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: hughd@google.com
Cc: baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>
Subject: [PATCH] tmpfs: fix unicode_map leaks in casefold option handling
Date: Fri, 28 Aug 2026 00:14:26 +0900
Message-ID: <20260827151426.796843-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shmem_parse_opt_casefold() stores the unicode_map returned by
utf8_load() in ctx->encoding. The casefold parameter can be supplied
more than once for the same filesystem context, but replacing the
stored map does not release the previous reference.

The final reference is also leaked when an unmounted filesystem
context is freed.

Release the previous map before replacing it, clear ctx->encoding
after transferring ownership to the superblock, and release any
remaining reference from shmem_free_fc().

An unprivileged user can repeatedly set the casefold parameter on a
tmpfs filesystem context from a user namespace. This causes
unbounded kernel memory consumption and can result in a local denial
of service.

Fixes: 58e55efd6c72 ("tmpfs: Add casefold lookup support")
Cc: stable@vger.kernel.org

Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 mm/shmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 89a1495e55f7..62440caf2df5 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4508,6 +4508,7 @@ static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *
 	pr_info("tmpfs: Using encoding : utf8-%u.%u.%u\n",
 		unicode_major(version), unicode_minor(version), unicode_rev(version));
 
+	utf8_unload(ctx->encoding);
 	ctx->encoding = encoding;
 
 	return 0;
@@ -4976,6 +4977,7 @@ static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	if (ctx->encoding) {
 		sb->s_encoding = ctx->encoding;
+		ctx->encoding = NULL;
 		set_default_d_op(sb, &shmem_ci_dentry_ops);
 		if (ctx->strict_encoding)
 			sb->s_encoding_flags = SB_ENC_STRICT_MODE_FL;
@@ -5073,6 +5075,9 @@ static void shmem_free_fc(struct fs_context *fc)
 	struct shmem_options *ctx = fc->fs_private;
 
 	if (ctx) {
+#if IS_ENABLED(CONFIG_UNICODE)
+		utf8_unload(ctx->encoding);
+#endif
 		mpol_put(ctx->mpol);
 		kfree(ctx);
 	}
-- 
2.53.0

