Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898291;
	b=mW9bpyLfQwHr5mFw7fWqtKs7k68qbDqM3GOHQHSTt2bVET4uhm5tbo7pmMXsguRBD+hr
	 pLsUzPFfRWhHEA6SmB+BFwwlip3Q436XsfHnMyMn3IoI2hgG0asurZ/kN7x4MJ4YONcz6
	 hHROjNew9UrPK51WdzbavMaMOVwuyyZdLaegSbWKr3tTYgfCKsTr2i3g5791Y8oADfTPa
	 T7nMzIZKsdeoVW4Op0ad9OhK4mVQtUdlH+KcfSbroO9yJ2bZd42X2wTrPgOiTJl8kgb6e
	 Q9+LS1Pf4LBMOiy0RkBKDwkNT67nP43q0AuRh9GORsheFzZHGtiqhq2QEqlwJocV/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H7rBBGAWYyx/YFYo/54ustyS3rwja5fxSbKif0iz4Xg=;
	b=R6VM5nfipYiq1WDxUVC1/ripPPdtYpzaqpQDVC42lFEUnMFVDuQ6ZEn2xMa+yHDU2yCW
	 WIOJfLOnz6kc9/glKCRcA/2/YTSk5URcZ4pBeD1VGpQ/93dqClS79J4HftaeOkXQ2Xkl1
	 M5WlqYpjXcRuPU9KG6ht66YjoVdLsztB92hluVV+SPX5YQ2mB5mrtSn/D/tL4DWN0XYvN
	 pWAK7j21uHMthnICPsUKxTvVprJzTgYW84gcM1JwgWVvUMFCz3tAoZJ+ID2d+wRRTy/+U
	 PPj2DctUSbmtRlWQ87p9PSqpoDOGFNRu8hrzkTXfFZ7mCHEjA8r/fqCJYjvXGhQbf6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laLPAhJj;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E8606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laLPAhJj
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so6305107eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898289; x=1795503089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7rBBGAWYyx/YFYo/54ustyS3rwja5fxSbKif0iz4Xg=;
        b=laLPAhJj/HJqN+aoxjqsUhoEII4ZKM6F/f4iNTCjaDSi+LXBcv9tFE+le3r0s5q4xx
         99Cy1/KxBEGyyXKvLpA4X1eo+COL67UcS2dXkfn0UZ3VMQkN6hz0Uc3fAlidr4lefm+2
         f11MvjJiqXWL/TPTE6iMjSDOfOC9bcE9YRDZa1Q+/bPpKLvpupDD7pduNWoudVrGTQRf
         6UiNbgM03/+vcyVlIjF5F+ExVjjckoVHBzaZ60APBGKopdsYGGU8vONoMCQ22Ctej+gM
         gZo+ReNjWXYHDlFd3/CafjFWE8AWTd+ro13nCRJhfIysCtNi9N4HtQCHW2zjbvife2ss
         kZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898289; x=1795503089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H7rBBGAWYyx/YFYo/54ustyS3rwja5fxSbKif0iz4Xg=;
        b=m/8f+RInJw9dEp7/SzkpJqTzwcbRQAJlHBxW+VaiejohYr2DLivy7nd5tCUoztVjr6
         E5RIq1avbwyPHuetuxSPu0btJThxYg3O6GI+aU0GgxaLDnjBykzKZmATTPrMfG+Sl8qs
         sxNlXcKvcTYA7BRbqe2CfRU4FPiblL5qjmBkQmLnlyC8uZ+vvry2otCh0nkHX9iFUz8k
         o64cNCZEUZ3Sm4V9aUZb7eSQya/VkCYska1usVAJCEJOaBRwdTlPu6ioofVxF1HbUM5f
         PEMUzzYaI94l0SEM4u2GqNdM0f4kgVBR+vCthPKC+rTrKdcHaqVZXDmbAtkZVJNYdPgb
         8JhA==
X-Forwarded-Encrypted: i=1; AL+hErHmp4fSqo2k4U3hGk0i1OmMB8vJRQO2YWRqDeRVmsrQJTvtZcJOyklvWFyQpvgszw+XFWWDWdLl70X9QJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3VAELkLfBwgQP7O2RURIyGhgMZmAfcWb1MtZHNKFm/swctodH
	asMcSF5FHjkAQWAi3kGTDdYCBGNkMOtffZtA4988wPZEKeFdkSLF3LbD
X-Gm-Gg: AZFdTZcbf5XRvy7LDjdgv0yDqvW5YmhjFS5++JLi3BNjBgaiTwtOV3s8d56pYKgGBLd
	AMtTNbMLatmGhC9j5ePZfUfGxQx8pUmIiMmBbv1/s88xqCeweRnwRK2JAkPx0zhdAEUMfjIO0jO
	WsQA9cFpR3Rmr+naaYVtOLUFmED0I+OcSJOfaeKP1rN0iQbBg6Zlshtz/t/z3dxdTTAJKvQ2r49
	W+sw1VxCHJDkb2odkqf6SBBJwtW0dRLWmsCbaRAumBZAz9OJxB0IlrOtTN9J/SzZ5fc+w6TYb6c
	1d4ePTQmVNQyBhZob0LMZsOVqzDCHtRMz9RwGV/+RR+eSWigGd1PcsqO8bDI5NFJLEa1WHDWDkR
	rrBdr9M+vQ/yBzi2QQ/3pVbMaR/+Z+v7vNqdUCsUaVMWKQzuddI6rWwQFu5yurPs/epzYMrK7st
	XQCRBnYWQIEBHu77sZm1nmIDsaSPWjbBIQz0BJXyzGc1FkxzpJIOqJtp82hbQsaBWCdIlubZHh4
	R2/h1aM7IyM7NV3L2j070eKDBV1kVw0AiW+/CT6nitFEpBPxzWwjmfn/y+a0XgrafQTxVNBxMuq
	1yNLuLBK7SyUfRLU1TtwzrS7KCxuoM9iMT7yfUkqLYU74q7wDDeXI00fKnLLPR4=
X-Received: by 2002:a05:7300:6027:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-37966e3b6c9mr13703517eec.28.1794898289262;
        Mon, 16 Nov 2026 22:51:29 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm44099255eec.23.2026.11.16.22.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:51:27 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian0@foxmail.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] nilfs2: add atime compat_ro feature
Date: Tue, 17 Nov 2026 15:47:47 +0900
Message-ID: <20261117065122.41553-2-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117065122.41553-1-konishi.ryusuke@gmail.com>
References: <20261117065122.41553-1-konishi.ryusuke@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Jianjian <wangjianjian0@foxmail.com>

To prepare following atime support:
1. add read-only compat feature NILFS_FEATURE_COMPAT_RO_ATIME.
2. add the_nilfs.ns_feature_compat/compat_ro/incompat.

[ryusuke: added missing kernel-doc comments]

Signed-off-by: Wang Jianjian <wangjianjian0@foxmail.com>
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/super.c                  | 3 +++
 fs/nilfs2/the_nilfs.h              | 6 ++++++
 include/uapi/linux/nilfs2_ondisk.h | 4 +++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 2e3b591c117c..f92bcf1a9544 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -872,6 +872,9 @@ int nilfs_store_magic(struct super_block *sb,
 	nilfs->ns_resgid = le16_to_cpu(sbp->s_def_resgid);
 	nilfs->ns_interval = le32_to_cpu(sbp->s_c_interval);
 	nilfs->ns_watermark = le32_to_cpu(sbp->s_c_block_max);
+	nilfs->ns_feature_compat = le64_to_cpu(sbp->s_feature_compat);
+	nilfs->ns_feature_compat_ro = le64_to_cpu(sbp->s_feature_compat_ro);
+	nilfs->ns_feature_incompat = le64_to_cpu(sbp->s_feature_incompat);
 
 	return 0;
 }
diff --git a/fs/nilfs2/the_nilfs.h b/fs/nilfs2/the_nilfs.h
index 4776a70f01ae..5143dbae5788 100644
--- a/fs/nilfs2/the_nilfs.h
+++ b/fs/nilfs2/the_nilfs.h
@@ -86,6 +86,9 @@ enum {
  * @ns_inode_size: size of on-disk inode
  * @ns_first_ino: first not-special inode number
  * @ns_crc_seed: seed value of CRC32 calculation
+ * @ns_feature_compat: compat feature flags
+ * @ns_feature_compat_ro: read-only compat feature flags
+ * @ns_feature_incompat: incompat feature flags
  * @ns_dev_kobj: /sys/fs/<nilfs>/<device>
  * @ns_dev_kobj_unregister: completion state
  * @ns_dev_subgroups: <device> subgroups pointer
@@ -178,6 +181,9 @@ struct the_nilfs {
 	int			ns_inode_size;
 	unsigned int		ns_first_ino;
 	u32			ns_crc_seed;
+	__u64			ns_feature_compat;
+	__u64			ns_feature_compat_ro;
+	__u64			ns_feature_incompat;
 
 	/* /sys/fs/<nilfs>/<device> */
 	struct kobject ns_dev_kobj;
diff --git a/include/uapi/linux/nilfs2_ondisk.h b/include/uapi/linux/nilfs2_ondisk.h
index b3442b16ff6a..19587700c92c 100644
--- a/include/uapi/linux/nilfs2_ondisk.h
+++ b/include/uapi/linux/nilfs2_ondisk.h
@@ -253,9 +253,11 @@ struct nilfs_super_block {
  * doesn't know about, it should refuse to mount the filesystem.
  */
 #define NILFS_FEATURE_COMPAT_RO_BLOCK_COUNT	0x00000001ULL
+#define NILFS_FEATURE_COMPAT_RO_ATIME		0x00000002ULL
 
 #define NILFS_FEATURE_COMPAT_SUPP	0ULL
-#define NILFS_FEATURE_COMPAT_RO_SUPP	NILFS_FEATURE_COMPAT_RO_BLOCK_COUNT
+#define NILFS_FEATURE_COMPAT_RO_SUPP	(NILFS_FEATURE_COMPAT_RO_BLOCK_COUNT |\
+					 NILFS_FEATURE_COMPAT_RO_ATIME)
 #define NILFS_FEATURE_INCOMPAT_SUPP	0ULL
 
 /*
-- 
2.53.0

