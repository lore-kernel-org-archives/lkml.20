Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340023;
	b=b5q3xBbw8GALjP+Il233AbdAb5bmAb6LLbU/sZawp1deR7fasr4nl8gf2u4Ghy7RrbJW
	 n7BFCRipyydMJFVo/qjonPTYA7xVTk603xxF0ySVq/TDYZhNpNZl/BxNQOlvJkB7JfoOn
	 oBTbDJYA3YHo1VZw7fCs50Cf+GoNRLlYh8ffS+0v1q0p+F/RSwL9ZZwCPbuhZrFs+PcbK
	 cqaIwgh+F3AYWoAG+0mgz8+LgFxeqerC3jEe+h0mnR24k+UkA4iGenaSAL2cwwYqAUox+
	 xNa1ivQ2UIyvbxIIvAWNDWXqNb74oWjd+RtB694lF1LZv46kRMF1d3rORIe+rhVjInA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/6bqAv1/Jm5xeOExYjkOudRYuHmH74jNAMEu3UFrpqM=;
	b=pE073A0XB2Ivslf/tXvDYwP/ygJlxHysZwcO1gyize6K1Dccvcw+IsOSf8goJIATxi0U
	 3ezHWc9tY/cdlHcuL64cczJUPokPA8xzUDiCJvzWfjoMs0sDXAzNHMyUHSKPwGBW1W+6C
	 2xfZtF0rW6F+5XV45tkYHdqBHQb1SaKFPuw2gMCvzz85ll/aXqiYt4k8yY+n5hkGYZxsw
	 xRKWuQi4aBLAwLJCbCVF0D+YzyATnCMtMi60dThT97Lnv8Ie6BKlLYWKMEXRdORUelvEj
	 txWVRB8t0B6z3e9EwCoOHZ75H+Fut4LkB9sq7O1U2FGIwm5PS9lRS9/k6Uv99CwMMvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfiuqSdg;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E358606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E358606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfiuqSdg
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so571319eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793340022; x=1793944822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6bqAv1/Jm5xeOExYjkOudRYuHmH74jNAMEu3UFrpqM=;
        b=hfiuqSdgGTyi3DgDanEABTUkeTWUf9tE0vV1yMhwhlDpkwVFWU7y0V8y80TLGzKTQi
         p9Z7zIgcyDWyHKCgcl4Wf/UqvNquZcX+2FS1WruyZyY4bEfsSi82bGHVrmNv5C9fZC/p
         h5K0zy2lJLwfTQBhvQ2NGnQ9MFJaR8LMsV+3E2qefIx8deA4LBAnSdWQC/Vxpr/x59nt
         I5o6LpJLGPc9n+MQnr3RP3XCdaay8q0WgJ2w3F8xWXKbm9718GJk4tZx7WikAG/ccMJk
         KQigOP0f4mRJvNJ+3W8bHqocfcxuatZd8V6q4AsOO4ckf0V4YWttLVg+HgUoebfjkU/C
         Qr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340022; x=1793944822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6bqAv1/Jm5xeOExYjkOudRYuHmH74jNAMEu3UFrpqM=;
        b=Sr5nOha8zxN+MPzJcTolz4gvM1U39GsexmahGuFWVOEAltu+bj/p7q8YRbcQ1qAXNt
         N3XmlgPJnYuGP5jOFg9VwJj1IMVjBeGURz37k7VVoBgGagHEiJGz1pE69JNF2UaY9sj5
         Ihx6jNNturl4Brz8e6hTizTVESRzqcLMgR13rd7kJSUDZDGsqqGa28fbH8Moajh7JvQD
         gZ1cEsyjMBZgPNuYw+Vz+u+roVDJkVlnvEW88v2vYeAOa1HimpE5sSeB8cjMR0PfDQqV
         ykdbxgGhRm5s5eieSQgDRoCinshvEKY3oXWVpZDdHNfwYi3cXzPTHkHcLfTD6LFT8EGl
         9dNA==
X-Forwarded-Encrypted: i=1; AKwUvBz4pfEUiwgmkTM2ir6+4OzV4v2nzgnP79udxww1OlFEOJ33Dg6CVEPq1wtLIAZuABX1cmcYj5qb0Fuvpgk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO18kmP9OFMqONTxc9+R0XN86+IxV4d3Ufwq83yHue6IXYuW6U
	ny83cXINzcBjTvmj+PGtxqLEAKUDwGFWG0sXXjitY48Xx0V/qCR96cBa
X-Gm-Gg: AYBFou1iq/eqxy3OB5+vYLsuP6Ofh9DEKT4w+ZLRcEXvAYo+UfkmHv0fDhAS5z9+Jv/
	tqBAl8vqInsJ/Grv5Sn+EER3p3/fCvCk1Krrwa9NGwTI/fJFD3ykK3teG1tuYeI8OHUbyTuuOee
	l7NIEfsj22w+bF5Z1m3SK4J1Q9bjnqv1UFZb8JWuV3yjbQqdP3D3sLZPjiLeaMGVg5+FZO8r+WC
	7JlnKeiy0s5b9Fei1dyBvQKPsxl2uevy1DJupZCUynlC8UBLKZfPgY7hF0J7Ys+SCMp35hbCtZm
	HVxumxvSPXMbcXp9wR+VvJHIwoquBH31Fl2IqXCkbUHguHnMP222YPv8otgoNjBPSrXgvdpwykI
	sH4dPAkay4FeKPY71nEMYoMIcTUGhJLeqCQQEDki5OBZcOAN1jY5AZ0hc7g7iWi5shq8LgnA9o7
	yErkczURLCLew8GDtkV78pDZPN3J/ZC74IZiuLBaLxawAeq03z9+cPGg/CtQcdG7Cp4c1Mwy1Um
	l4Cqs3nOzBUr64DWOJbGqc8549+NT40LQaByl4kUuNs++kvkq8GjEg1h7AOGQA0ge2l2DlpYAHG
	2Qeh3AIMi7xYwfVaAYdcPDlsVfcB80bWKPOMzTHQCHsCWpNiIYk+WojB
X-Received: by 2002:a05:693c:69c9:b0:36a:13df:749d with SMTP id 5a478bee46e88-36a423b3dffmr1914478eec.24.1793340022086;
        Thu, 29 Oct 2026 23:00:22 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a96172sm3833306eec.27.2026.10.29.23.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:00:21 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: akpm@linux-foundation.org,
	brauner@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v3] fat: fix parent link count when replacing a sibling directory
Date: Fri, 30 Oct 2026 06:00:11 +0000
Message-ID: <20261030060011.70237-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

vfat_rename() and do_msdos_rename() adjust parent link counts only when
updating the dotdot entry for a move between different parents. Replacing
an existing empty directory in the same parent also removes a
subdirectory, but leaves the parent's link count unchanged.

For example, renaming one of two sibling directories over the other
leaves the parent with four links instead of three. stat and ls report
the stale count, and find -links 3 does not match the parent.

Drop the parent's link count for this case after the source entry has
been removed successfully. Leave cross-parent renames, regular files
and the existing error paths unchanged.

Share the parent link count check with rmdir through fat_dir_drop_nlink().
Only decrement counts of at least three and report a filesystem error
otherwise, rather than reducing a corrupted directory's count below two.
Export the helper for the VFAT and MSDOS modules.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v3:
- Move the parent link count check into fat_dir_drop_nlink() in the FAT
  module and export it with EXPORT_SYMBOL_GPL(), as requested by
  OGAWA Hirofumi.
- Use the helper in all four places: the VFAT and MSDOS rmdir paths and
  the two sibling-directory replacement paths.
- Retain Hirofumi's Acked-by from v1.

Changes in v2:
- Check the parent link count before decrementing it and report low
  counts with fat_fs_error(), matching rmdir(), as noted by Sashiko.

v1: https://lore.kernel.org/r/20261028211626.26103-1-dennylin0707@gmail.com

 fs/fat/dir.c         | 10 ++++++++++
 fs/fat/fat.h         |  1 +
 fs/fat/namei_msdos.c |  9 +++------
 fs/fat/namei_vfat.c  |  9 +++------
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index 35bdb62944a2..0cebcaf82426 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -963,6 +963,16 @@ int fat_dir_empty(struct inode *dir)
 }
 EXPORT_SYMBOL_GPL(fat_dir_empty);
 
+void fat_dir_drop_nlink(struct inode *dir)
+{
+	if (dir->i_nlink >= 3)
+		drop_nlink(dir);
+	else
+		fat_fs_error(dir->i_sb, "parent dir link count too low (%u)",
+			     dir->i_nlink);
+}
+EXPORT_SYMBOL_GPL(fat_dir_drop_nlink);
+
 /*
  * fat_subdirs counts the number of sub-directories of dir. It can be run
  * on directories being created.
diff --git a/fs/fat/fat.h b/fs/fat/fat.h
index 76978a268410..a8a3ca4f465b 100644
--- a/fs/fat/fat.h
+++ b/fs/fat/fat.h
@@ -332,6 +332,7 @@ extern const struct file_operations fat_dir_operations;
 extern int fat_search_long(struct inode *inode, const unsigned char *name,
 			   int name_len, struct fat_slot_info *sinfo);
 extern int fat_dir_empty(struct inode *dir);
+void fat_dir_drop_nlink(struct inode *dir);
 extern int fat_subdirs(struct inode *dir);
 extern int fat_scan(struct inode *dir, const unsigned char *name,
 		    struct fat_slot_info *sinfo);
diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index c7500c2859e0..5a43d042eb01 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -333,12 +333,7 @@ static int msdos_rmdir(struct inode *dir, struct dentry *dentry)
 	err = fat_remove_entries(dir, &sinfo);	/* and releases bh */
 	if (err)
 		goto out;
-	if (dir->i_nlink >= 3)
-		drop_nlink(dir);
-	else {
-		fat_fs_error(sb, "parent dir link count too low (%u)",
-			dir->i_nlink);
-	}
+	fat_dir_drop_nlink(dir);
 
 	clear_nlink(inode);
 	fat_detach(inode);
@@ -565,6 +560,8 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 		(void)sync_inode_metadata(old_dir, 1);
 
 	if (new_inode) {
+		if (is_dir && old_dir == new_dir)
+			fat_dir_drop_nlink(old_dir);
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index ff7652bf0410..791f2d7b8509 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -809,12 +809,7 @@ static int vfat_rmdir(struct inode *dir, struct dentry *dentry)
 	err = fat_remove_entries(dir, &sinfo);	/* and releases bh */
 	if (err)
 		goto out;
-	if (dir->i_nlink >= 3)
-		drop_nlink(dir);
-	else {
-		fat_fs_error(sb, "parent dir link count too low (%u)",
-			dir->i_nlink);
-	}
+	fat_dir_drop_nlink(dir);
 
 	clear_nlink(inode);
 	fat_truncate_time(inode, NULL, FAT_UPDATE_ATIME | FAT_UPDATE_CMTIME);
@@ -1011,6 +1006,8 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 	vfat_update_dir_metadata(old_dir, &ts);
 
 	if (new_inode) {
+		if (is_dir && old_dir == new_dir)
+			fat_dir_drop_nlink(old_dir);
 		drop_nlink(new_inode);
 		if (is_dir)
 			drop_nlink(new_inode);

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

