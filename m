Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3738734D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 02:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082114; cv=none; b=GkHxeTzqM4swEbenwSpEsjifWuncd/mE1trndEIwWIzAklujzHFbv1QgLrwo4igodwpf4+kWE/j1tykabHOCjV8Nn5zVRXEho1V7xQLAcrEbjAvdDnZryeK3y6t73OGq48gZk6TJxOw/hF7p2E5fyKUdbkciaNbZJbpSdVHZew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082114; c=relaxed/simple;
	bh=DqdLgIYBfwwC8e7XxmTt5+ilGV7JaQJbpWXvJVY1fpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jsUjwVMYNFOsulHiaE9EgzA4a/r4FR5/56jYtyTYB9tas/zoPp7nkEngdfT3hvO/FyOShnMk8cf/LqiQjZUPhVe5eEziWNziRn23z8qD7ccS0dPcJn0eh4b0boKGxlsmH06pzLmK2zYYHuYD78yTPI9i7jPyn8C1AsgSi4vNT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 126fc170bf9e11f19a56ed5b684f684d-20261004
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:acdd7188-f02f-413d-81a9-1517923d659a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:3daf8573afda5cdad642f5db12af63a2,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99|100|
	102|158,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 126fc170bf9e11f19a56ed5b684f684d-20261004
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1936685982; Sun, 04 Oct 2026 10:48:26 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH] ntfs: handle a failed size rollback in the write error path
Date: Sun,  4 Oct 2026 10:48:22 +0800
Message-Id: <20261004024822.640574-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_file_write_iter() extends the data and initialized sizes before
it copies the user data and restores them when the write then fails.
The restoration is best-effort: both results are discarded, even
though the extension is already recorded in the dirty MFT record.
When the restoration fails too, the extended sizes reach the disk
while the VFS inode keeps reporting the old ones: after a remount the
file appears grown again, with an uninitialized tail where the failed
write never put any data, and nothing records the failure.

Keep both undo results: on failure, set NVolSetErrors(), which the next
persistence point persists as VOLUME_IS_DIRTY, and log a message for
the errors= policy.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/file.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3ec82715a588..b5b30e44ac51 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -678,14 +678,39 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 				&ntfs_iomap_folio_ops, NULL);
 out:
 	if (ret < 0 && ret != -EIOCBQUEUED) {
+		int undo_err = 0;
+
 		if (ni->initialized_size != old_init_size) {
+			int init_err;
+
 			mutex_lock(&ni->mrec_lock);
-			ntfs_attr_set_initialized_size(ni, old_init_size);
+			init_err = ntfs_attr_set_initialized_size(ni,
+					old_init_size);
 			mutex_unlock(&ni->mrec_lock);
+			if (init_err && !undo_err)
+				undo_err = init_err;
 		}
 		if (ni->data_size != old_data_size) {
+			int data_err;
+
 			truncate_setsize(vi, old_data_size);
-			ntfs_attr_truncate(ni, old_data_size);
+			data_err = ntfs_attr_truncate(ni, old_data_size);
+			if (data_err && !undo_err)
+				undo_err = data_err;
+		}
+		if (undo_err) {
+			/*
+			 * The extension is recorded in the dirty MFT
+			 * record already, so a failed rollback leaves the
+			 * new sizes on disk while the VFS inode keeps
+			 * reporting the old ones.  Record the error: the
+			 * next persistence point persists it as
+			 * VOLUME_IS_DIRTY.  Run chkdsk.
+			 */
+			NVolSetErrors(vol);
+			ntfs_error(vi->i_sb,
+				   "Failed to roll back the size update: %d",
+				   undo_err);
 		}
 	}
 out_lock:
-- 
2.25.1

