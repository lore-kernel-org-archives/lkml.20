Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174832;
	b=dZ1SQev883k3IhNZAxTPLxO1VMiwJhBc2cRTbda5lWkr3TovLSvKk+IFVA4iwyJpk7xQ
	 COwOie73aW16dRDUutlLchA1kJxwsIw9eV7jif6A8BXc4CqU+iXtP7p+3scfm+FKuEMzd
	 xxmFGw3A6+tcSijUnV5EIERP5ehOkM/0K0ECgN18j/BS0Mtlmss1MDoT5kWuuFA2IX7w6
	 ZWHJJkiHoi7wir6q3YQ7z5n4F8aA9Nw6cNoE/tanNybNtCupzeL4U7JIdFAT8qJq5rxpl
	 idfhiGZuooqehU/zO+t7FjcW9bw9STJb6FZJK9t7Js4uQg1ek4CMvpr3vP3h6AIp8Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174832;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+JZxgZQgCYIH/VVjsQTJR3iY9xuiD8itpxnupP/HyRM=;
	b=O60bN55rOv8hzjd/WFa9irjT7/7qBdk0sjjQHGZcaZuq+mAt74d7y9k8jUr03Mqi2K20
	 I07NgqiaG2yzPRJDeA+K6Av4yksTk8K6j91FG74+aFGS2EkpWYMAn11ugUnsH7H8vHG/6
	 2YsSM/feoiafDZldZSLsEKDEhf5xWkry7NgSVzbRcOO5b00wcLbij8/oLaQwh8eb00kcY
	 5jACAin52JlHjB+k3+AqQZMbql6G8McETnxupa2ge0ZykQUQKvP3PvzOtOn6cyMMz0OuL
	 xCT8PhjcMhA7rIzzBu9KC9qjspA8VSwKDmUobmNdZHtBlRstqu3B/ejD2xZ4X/UPOMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B2606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D1B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8d8fa9fed2a611f19a56ed5b684f684d-20261028
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:19115af9-bb84-490d-b7e0-2bc6a83eae0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:06c29b367f372062bd5edc28b85d7db4,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d8fa9fed2a611f19a56ed5b684f684d-20261028
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1769422921; Wed, 28 Oct 2026 16:07:00 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH 2/2] ntfs: fix a self-deadlock on writes to non-resident named streams
Date: Wed, 28 Oct 2026 16:06:56 +0800
Message-Id: <20261028080656.1027283-2-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261028080656.1027283-1-zenghongling@kylinos.cn>
References: <20261028080656.1027283-1-zenghongling@kylinos.cn>
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

The stream write ioctl holds the stream mapping's invalidate lock
across ntfs_inode_attr_pwrite(), which calls
ntfs_extend_initialized_size() for named streams, and that function
takes the same lock again, before the check that could skip the
extension.  A write to a non-resident named stream through
NTFS_IOC_STREAM_WRITE deadlocks on itself.

The ioctl is the only caller that reaches the named stream branch of
ntfs_inode_attr_pwrite(), and it always holds the lock there, so
split off __ntfs_extend_initialized_size(), which expects the caller
to hold the invalidate lock, and call it from that branch.  The write
and mmap paths keep taking the lock themselves.

Fixes: 3f11c48d4f94 ("ntfs: add pathname access for named streams")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/inode.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index ac13e8776909..9275ebfebe3d 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2554,8 +2554,12 @@ int ntfs_show_options(struct seq_file *sf, struct dentry *root)
 	return 0;
 }
 
-int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
-				 const loff_t new_size)
+/*
+ * The caller must hold @vi's mapping invalidate lock.
+ */
+static int __ntfs_extend_initialized_size(struct inode *vi,
+					  const loff_t offset,
+					  const loff_t new_size)
 {
 	struct ntfs_inode *ni = NTFS_I(vi);
 	struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
@@ -2563,10 +2567,11 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
 	unsigned long flags;
 	int err = 0;
 
+	lockdep_assert_held_write(&vi->i_mapping->invalidate_lock);
+
 	if (!NInoNonResident(ni))
 		return -EINVAL;
 
-	filemap_invalidate_lock(vi->i_mapping);
 	read_lock_irqsave(&ni->size_lock, flags);
 	old_init_size = ni->initialized_size;
 	read_unlock_irqrestore(&ni->size_lock, flags);
@@ -2600,6 +2605,16 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
 	err = ntfs_attr_set_initialized_size(ni, new_size);
 	mutex_unlock(&mrec_ni->mrec_lock);
 out:
+	return err;
+}
+
+int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
+				 const loff_t new_size)
+{
+	int err;
+
+	filemap_invalidate_lock(vi->i_mapping);
+	err = __ntfs_extend_initialized_size(vi, offset, new_size);
 	filemap_invalidate_unlock(vi->i_mapping);
 	return err;
 }
@@ -4085,8 +4100,13 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 	mutex_unlock(&mrec_ni->mrec_lock);
 	/* Attribute writes bypass iomap's delayed-allocation preparation. */
 	if (ntfs_inode_is_named_stream(ni)) {
-		/* A failed write must not expose any newly initialized data. */
-		ret = ntfs_extend_initialized_size(vi, pos + count, pos + count);
+		/*
+		 * A failed write must not expose any newly initialized
+		 * data.  The stream ioctl caller holds the mapping
+		 * invalidate lock.
+		 */
+		ret = __ntfs_extend_initialized_size(vi, pos + count,
+				pos + count);
 		modified |= ni->initialized_size != old_init_size;
 		if (!ret)
 			ret = ntfs_attr_fallocate(ni, pos, count, true);
-- 
2.25.1

