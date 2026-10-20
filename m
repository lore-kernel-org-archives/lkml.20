Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464801;
	b=vu98logSwLwO8HRKhG46hb2MVt5kYn9G7Eyc3zpMXxBJbRzOGs86226rz33Vwa9WMgWD
	 OUIwaMOmCkFYXYgq0/hYjZTYsLpodnHytogn2ItihocvL0qoBBfe3wiSwcAdHEcUSHajW
	 w6vpJVMel18l93OWz95i3NBT1Hgj5Q68km2XHVYYtn/v8sCHIzKUIMc5bHbVn5fXaLhQK
	 N491hrjhcmswRoFGRAROTRwpDHFXtyuTiXdhz8KjjUtHrdOtxDJLTSK35wQAehkvydzCF
	 7IlCSYIEaJkjRXMl83hSxFmorF83TP6FvoR/lhsPXvrjid0h3ChsjtZ8Rh33R/4LBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464801;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cbv6/xqF0y1tqpovj3pgoKgCHdKboVOC8kilnGDdCk4=;
	b=nTZWdOhD+jLs5xouHZlA5FMHVrHyg/33PWRwNXvEvRuP+7hlzO7my/Kdr/TXUdqPZH19
	 CxZcE+QH28frDzTQmufk0KK6dDKx7d1/pFXLNFvYMVVLdMGi+Q9cp1DLL73lcS+lF9Xkx
	 Z6cBcNGt0olH2dyTLxJxPd3AIRm1dOqgRYMbQIMvQMmA/9kRAImOv+ZncyoUoh8CZvzn9
	 c73Iif7B3uLkq6WPDipn+VinJwR//NgSs02r1Cr6fNxa3dwBZKecTYBl/mk2+HA5MgBX8
	 o3S0PNN22/e6cPbkh9Bs1dof68Rkoii+5UrhU0OvT2YX1QbiQL/MT2ztTzWqDkElfvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E84D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 63e45224cc3111f19a56ed5b684f684d-20261020
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:eb72053e-1b74-4aa1-8a7d-fb698bba45f0,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:c04fe1dbfda81541598a5a288292b987,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 63e45224cc3111f19a56ed5b684f684d-20261020
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 204011034; Tue, 20 Oct 2026 10:53:12 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v3] ntfs: handle a failed size rollback in the write error path
Date: Tue, 20 Oct 2026 10:53:08 +0800
Message-Id: <20261020025308.664764-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

ntfs_file_write_iter() extends the data and initialized sizes before
it copies the user data and restores them when the write then fails.
The restoration is best-effort: both results are discarded, even
though the extension is already recorded in the dirty MFT record.
When the restoration fails too, the extended sizes reach the disk
while the VFS inode keeps reporting the old ones: after a remount the
file appears grown again, with an uninitialized tail where the failed
write never put any data, and nothing records the failure.

Keep both undo results: roll the data size back through the same
VFS-facing truncate ntfs_setattr_size() uses, which also supports
compressed attributes, and on failure keep the VFS size on the
durable data size.  On an undo failure, set NVolSetErrors(), which
the next persistence point persists as VOLUME_IS_DIRTY, and log a
message for the errors= policy.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Changes in v3:
- skip the initialized size rollback on a resident attribute;
- roll the data size back through __ntfs_attr_truncate_vfs(), which
  ntfs_setattr_size() uses, so compressed attributes roll back too;
- keep the VFS size on the durable data size if the rollback fails.
---
 fs/ntfs/file.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index d810ca5904bd..e66814d08f59 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -934,22 +934,42 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 				&ntfs_iomap_folio_ops, NULL);
 out:
 	if (ret < 0 && ret != -EIOCBQUEUED) {
-		if (ni->initialized_size != old_init_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+		int init_err = 0;
+		int data_err = 0;
+
+		/* ntfs_attr_set_initialized_size() rejects a resident one. */
+		if (ni->initialized_size != old_init_size &&
+		    NInoNonResident(ni)) {
+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_set_initialized_size(ni, old_init_size);
+			init_err = ntfs_attr_set_initialized_size(ni,
+					old_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		if (ni->data_size != old_data_size) {
-			struct ntfs_inode *mrec_ni =
-				ntfs_base_inode(ni);
+			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
 			truncate_setsize(vi, old_data_size);
+			/*
+			 * ntfs_attr_truncate() would reject a compressed
+			 * attribute; the shrink path also clamps the
+			 * initialized size down.
+			 */
 			mutex_lock(&mrec_ni->mrec_lock);
-			ntfs_attr_truncate(ni, old_data_size);
+			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
+					old_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
+			/* Like ntfs_setattr_size(): stay on the durable size. */
+			if (data_err)
+				i_size_write(vi, ni->data_size);
+		}
+		if (init_err || data_err) {
+			/* The failed sizes stay in the dirty MFT record. */
+			NVolSetErrors(vol);
+			ntfs_error(vi->i_sb,
+				   "Failed to roll back the size update: %d",
+				   init_err ?: data_err);
 		}
 	}
 out_lock:
-- 
2.25.1

