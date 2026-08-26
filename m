Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2743BDB3
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751707; cv=none; b=nqoqga6n2K3yrjUhK4aNO/CeSXSBaxYoK8Sa23FDg2NCs1gYkaiNMmSRfP9N7u9mRSBVJDww0TmmeF2CotytFCS1gFOplA5EFb0VOL2l5yMrnidR49bPmzcLGBsoIz2KkgaqWy9q6E/FCnoRGlEJUXRN7iooXDq1gQ9YiC9lUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751707; c=relaxed/simple;
	bh=Wl5ibRlmj3ktLmW2m6ymNlb9ssCdD8WqkDnfT3Y1Xjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=To0kv5RwjSvRGPKSkroZbyOYAOHyetBGnXdfFHnDWcMU3EWX7cTHyYVx54K/xYFedDtsjQOH2paxoRd5HKvpLBSiiwUFu2uSfiHpj6vTvX49IolPnQRg/CTltKTQxP5dud/LeR1EprUISKN5o8SHMUNIFgmOsS4TZjuYyuCVJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJxbBAMZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJxbBAMZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39682983a0fso616089a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787751702; x=1788356502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNt0yaNbWkmDvlN5726CptDGSbQ5oBacQBTHAIzZvf4=;
        b=jJxbBAMZZU1EWJR98lW/Qd+xPtmzU4mcaVB97p0ccESL3wJx0LITfLvDtw71nz1W0W
         ZtMeVWJ3SCpq25tDElJFfJXOaUn1M+fprLzOxQpy9Ht/zl95rS8FcdLyYbVRegKHq4Tj
         KHVNZoDoOkP9eUci4Kh72Wa2T6oc6odPMQlLI3juG1QQBbCDQpDZvkxrCZ4cU3I71rWy
         CRs6YG5WwydBiMovbT7svBE/xBA5aGwXZhX4yQyyMzOuzDltg8ff5Z8mlLi9szar7p72
         TVHHqOT8KX+eHjtpavYBHuOEseHK7mDqoOdkrLJck7sSgyxlmTlfuD7cOOVwSs2RnFy8
         Z4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751702; x=1788356502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNt0yaNbWkmDvlN5726CptDGSbQ5oBacQBTHAIzZvf4=;
        b=fFEn+JPLmSWAU8ZEYtiklPUQIsAiP9KGgshBQNet+86Ho96Q5Io3PiJKJTuIr1+NQ0
         ItcVsux/pAyChZtgj1hk49yoj2aLVLn3mR2qt+tnphGwK8T5CrLDHK05umhCOyoIQEUV
         mn+G+lpUmzcSkCvw/6VWIwBU6Q/yInCC5DQ/VZZEDConoqIYOIYfCxmpiztruD2P0xQw
         TfgMZtnw5dme0JVT+Scb2L+5znD38u4/RuW3g6jJtjbnQEOQu6A4rYmwYIfGngygWCga
         xiAQcX6DX2Y55leox4kmk5Wa4wYNS6kat2/QkrE+kTHTmMC6PA5TJx4Ha4hessDSXu+X
         JiuA==
X-Forwarded-Encrypted: i=1; AHgh+RpLN76OtPYZCcXW/b4Ts1WxX4UrBIojZNVEMAyx/51z2YRbmhty8nKytJJZ3XDhSA/h12kbzJk1OUJgGkk=@vger.kernel.org
X-Gm-Message-State: AFuF++miiuBY3jGtKe2ZUTrLM98pr9TI4pUekErNbxXZmjDppI5RyRic
	IND9fxKuALXI8VJOLxjASnDdJRgan2RN/lm24lnDcg8CRoDTz75IiBli
X-Gm-Gg: AR+sD13LOqciSTLASbVWJSKqiSioo7QxMYUmBodzUPRVYHc8hwjf1LMbrR6YXKG6acI
	uy7ydHgZh1wWiCSrjd1GQrcRzjqLZ396n8E74lv+ugTeEBcaKSgzGWEU1q47QEltrhhYvY30eoU
	mxlwOhzGqH5XqkHj242UJ3ebUAT333EWwl5yXQDLped9+a2qZgehfsNDFUMOP2YGNib3Pjr8+iO
	M8Vb8a8uegtdr0NretgBbpBrLXXrOwY0gKpV5tYAVpMldKRK54dCUxKUWuTlG3HYNRSZwqsc1z0
	XnFMm8bQ4ArYglXPxYDwcNSxuBs96lftH/vmNxhGBIeMtdPepcLRe/vX3Bu7K1emFx/s2PL3+yI
	+vzjo0LO8P2tXOOTWskVvsjMdvzzJSWLN/CjdK5O5GFvcsE/XFXhngUZ5nfLDduqezbSLE6OeeD
	AhgH9fO8g1s5iEMKWrgUz5GjtDAccX109GpHaK4AGoyHR9Qev7TccrQvY4XdTQFUDMrr6sxGtz5
	EulvMkQmjtFVKwNsylQJVxqAQ==
X-Received: by 2002:a17:90b:390e:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-3966d5d9a71mr12882557a91.11.1787751702056;
        Wed, 26 Aug 2026 06:41:42 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d69065sm8906472a91.13.2026.08.26.06.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:41:41 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	daehojeong@google.com
Subject: [PATCH 2/2] f2fs: keep released alias devices out of pinned allocation
Date: Wed, 26 Aug 2026 21:41:26 +0800
Message-ID: <20260826134126.3729507-3-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826134126.3729507-1-qiwenjie@xiaomi.com>
References: <20260826134126.3729507-1-qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release makes a device alias range free, but a custom alias name prevents
the basename lookup from setting has_alias again after remount. Pinned
allocation can then place immovable blocks on the released device and
prevent a later reserve.

Set has_alias after the persistent inode mapping is committed and before
release frees the range. At mount, restore it from the recorded mapping
and validate the alias inode and any live reserved extent. Keep devices
with suspect mappings blocked from pinned allocation.

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/file.c  |  4 ++++
 fs/f2fs/super.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7f1dc00031ba..10dadde70a13 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3988,6 +3988,10 @@ static int f2fs_ioc_release_dev_alias(struct file *filp)
 	if (err)
 		goto out_inode_unlock;
 
+	spin_lock(&FREE_I(sbi)->segmap_lock);
+	FDEV(devi).has_alias = true;
+	spin_unlock(&FREE_I(sbi)->segmap_lock);
+
 	f2fs_down_write_trace(&sbi->gc_lock, &glc);
 	f2fs_lock_op(sbi, &lc);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c1e315282ec6..3a07d91b41ce 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5035,6 +5035,21 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	sbi->readdir_ra = true;
 }
 
+static bool f2fs_valid_dev_alias_mapping(struct f2fs_sb_info *sbi,
+					 struct inode *inode, int devi)
+{
+	struct extent_info ei;
+
+	if (!IS_DEVICE_ALIASING(inode))
+		return false;
+	if (!F2FS_HAS_BLOCKS(inode))
+		return true;
+	if (!f2fs_lookup_read_extent_cache(inode, 0, &ei))
+		return false;
+	return !ei.fofs && ei.blk == FDEV(devi).start_blk &&
+		ei.len == FDEV(devi).total_segments << sbi->log_blocks_per_seg;
+}
+
 static void f2fs_restore_device_alias(struct f2fs_sb_info *sbi)
 {
 	struct inode *root = d_inode(sbi->sb->s_root);
@@ -5045,6 +5060,39 @@ static void f2fs_restore_device_alias(struct f2fs_sb_info *sbi)
 	if (!f2fs_sb_has_device_alias(sbi))
 		return;
 
+	for (i = 1; i < sbi->s_ndevs; i++) {
+		nid_t ino = le32_to_cpu(sbi->raw_super->dev_alias_ino[i]);
+		struct inode *inode;
+		int j;
+
+		if (!ino)
+			continue;
+		FDEV(i).has_alias = true;
+
+		for (j = 0; j < MAX_DEVICES; j++)
+			if (j != i &&
+			    le32_to_cpu(sbi->raw_super->dev_alias_ino[j]) == ino)
+				break;
+		if (j < MAX_DEVICES)
+			goto invalid_mapping;
+
+		inode = f2fs_iget(sbi->sb, ino);
+		if (IS_ERR(inode))
+			goto invalid_mapping;
+		if (!f2fs_valid_dev_alias_mapping(sbi, inode, i)) {
+			iput(inode);
+			goto invalid_mapping;
+		}
+		iput(inode);
+		continue;
+
+invalid_mapping:
+		f2fs_warn(sbi,
+			  "invalid device alias inode mapping: device=%d, ino=%u",
+			  i, ino);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+	}
+
 	for (i = 1; i < sbi->s_ndevs; i++) {
 		char *name = strrchr(FDEV(i).path, '/');
 		struct inode *inode;
-- 
2.43.0

