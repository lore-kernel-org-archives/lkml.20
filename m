Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452902;
	b=zHAdai2E3s/y+6VXV41FMvyUY8KI1+fad9u1gQ4pGAprm18ZbUNI3BR1tpV9KzAbuchy
	 4qsYKuIgII9UvE/m2gGhwOR4Q4ApHi3F30xfSvu5y5dMpHHcoD9PYmw1kAFIH5fBnbLfA
	 sEv+iGOARBaPYLJ5dqcwUDQN0ScF5zvnIZ//OVHGM3r4rPjY0LvuFkv57+wq0l6EoPfcC
	 5z/WGF08mxKDmqgAAW/Qgfc1YWWMXBEFmq/ZZIdH74HJT53ZJoC72/F/XM2hPBvHvr85G
	 GVMyuM1Y2fO2hnKe0zUH+VLbXZbRBxmxe3Pgz3eQ7B6/TZIaWecOBK66BUPyF7gLO+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeXaSvr4SrCTOf1iO2sie7UdIT4yjGWoYerMUs70xPo=;
	b=2EkDIde1CE29HmzevxSv9JIzppgilaJDDuCBJrhuL6fGAaoDk+HyTegGpEha79/crF6P
	 NLC5eTv9Q9mWiZevlUGjglPD3k0b0cqhUXa5m872tGKckPez70aTIvAJtqBTSNK2oYBPd
	 iJ35aUxC+ZG6HqTsMvs6aq6lBRu/vzTKDpqjEu6HgpxM/Rcxb7XHj0V2ozGVYNMEBgYw/
	 xyP5LmgnYMrMEn3QGuy4gS2Qly0dMfl4pe7/ydNMDkY0oMsLPdR1B2vynMEp9wEHsdO+4
	 RDs+HvhB0YDYA6WNoeq+ILZZUVqiYoFwmS00dvQSCcCEGPPFXH7p1EVoikRvaSa8Zqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdpjTSsd;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdpjTSsd
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so7656200eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794452901; x=1795057701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeXaSvr4SrCTOf1iO2sie7UdIT4yjGWoYerMUs70xPo=;
        b=vdpjTSsdvfq0rjq3o32YqhchwDrQfUeCgA3g/VNqySe5KDnAFreNsIcdqOJpTogRZi
         PtXQimxXqJpjJzolRRmrW0AGtrxeWj4cpWBAmcmEwp59qoWHtFbUtXyo6+CS3PoRt+CK
         PQ1IED9andLLO9c6xRInaU47xKN+8CEY1Q0SoJ90cngYFEUZlvaVXXm1Z9RE59kI4vox
         amu9A2THiD/UO+CwKIPmhsq9Z/nT7bRmk9piwzUScRWXVvCdW1K58Z7NM4R2k0jSM2pn
         YmlmukTdCxrMjqkZV94GPO4c5TCFzCQcSiKdjOTpqVBaKzS62rQzMZc/OACLobQW6HnD
         dkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452901; x=1795057701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeXaSvr4SrCTOf1iO2sie7UdIT4yjGWoYerMUs70xPo=;
        b=n7HMvOLzCXrCbQSP/vouRIy+xJpbfeFezYiV5tUzZ6cU0Jks1Wk4UV8lVCu1mossdy
         whOTmzxZlS0kPK88ytvo39beh8+IAjaBTTf2U4IgYknZzrGBimyyulWP4GSh64wNSa16
         g57kdJISUvdNV4zpCKAWp+lpZWkN9TURpTX1hJKNtYCXSDRjzLHUdLth3/62sZMEtMVu
         P6RpfU2+ccrj6Qllqer1iaEZ7Tssihf+hczfU7CAVvfbEXe6Gsq66XkvAVAcLqWkXEx9
         MLdl7uL7mNTXfZUpgo3/aHiYrx3ng4oyIiWhYoSY2rOFGW0oVCxijbSwVuGo//Jt393h
         fIDw==
X-Forwarded-Encrypted: i=1; AL+hErG6yNC7wik7F1dZrBPXxxAMitjZP/IW1hkxti2p9JsLXn9gIFz9ISeoYyOkI0KgwhcwqQQJLJ3qZnZcN08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5+L/ImJOx2N1hf4isZ/7VoilEvsDvqEk5/G1hmyLoUClu04Dg
	8Um9mdx1ZbGfVeW444DSEXudyouZS73S1WaPYKBSYI7IuvpCfKQq7ljZ
X-Gm-Gg: AYBFou1OIOCCWcCbdrbcLe1i2N+Ve+4Azx9jPm7fy2apJoBncfdnFaZBH4+m7JvsRn9
	zDDvZfyJPKoU6oU3GL3J8quirWBG7X6aBE46H1aqph1Hqg/1YEUjjYWbynpXsfX/ZxbEyiCckQ0
	3IQ0CowWVfrIo70TcoHin6RJSpMFTV3NUVgLMbbPEd/wd8LFRh/g4J4lLmoplVzt1yICCHzpwE+
	UQwORjm50t/EG5MC/PNym5v/R67LskS0KQTjAIh8VQFy0upaNX7+o1BwK8iCddzl1bvrqQf3ast
	1xq2rRAiDCh5KS7nTUJ6AsvGVNAHzU3kJmMW+JVkT2bZj8jrr0eH3xqq7+cqMMF390owcFCLzXK
	ixedZ/UpTGy9wgVDs/ROHpcdbA/ySAYkyzm2AGerS6djg6vm9GIkP94TOyf6V7dfsHQEX9GPivd
	Bx5zbfogobcJEQuJ1NZQGuTUM6+3YavDs9mxV6n6tNZTOkL75rqnblxzpsUZXDTBSm9CRZeNqTX
	eDuweUZ8smsXYdex5alFtkaLFA+rzFhl+59TWXXlmPLQ4ybs5hL6ELYP+pemx+WFCimiX7YL46L
	VuPfUL2KGsXofcsW8WMlcfA8R+NwutTO4OfJ+kmQrms26w==
X-Received: by 2002:a05:7300:6dac:b0:369:f9da:a70f with SMTP id 5a478bee46e88-37685b7f916mr6937512eec.17.1794452900796;
        Wed, 11 Nov 2026 19:08:20 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm20406158eec.11.2026.11.11.19.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:08:20 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v2] ntfs: trim the sizes after a short write
Date: Thu, 12 Nov 2026 11:08:15 +0800
Message-ID: <20261112030815.982026-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_write_iter() moves the data size and, for a non-resident
uncompressed file, the initialized size to pos + count before the copy.
__ntfs_extend_initialized_size() only zeroes [old initialized size, pos),
so the range [pos, pos + count) is initialized only by the copy itself.
When iomap_file_buffered_write() copies less than count, it returns a
positive short count and the error rollback at out: does not run.  The
file keeps the size pos + count, and [pos + ret, pos + count) reads back
whatever the freed clusters held before, also after a remount.  A local
user can read the old contents of freed clusters this way.

Run the existing rollback for a short write as well, and roll the two
sizes back to the end of what was written instead of to the old sizes.
A short copy that ends inside a block can also leave the rest of that
block cached as read from disk, so clear the page cache beyond the new
initialized size before shrinking it.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v2: also clear the cached tail of the last block, which v1 left in
place when the write stayed inside the old data size (Baolin).

v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/

Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
with a known pattern first.  Short buffered writes of 4M, old data
readable after drop_caches and after remount, 3 runs each:

                                    unfixed    v1     v2
  fallocated, ends block-aligned    3137536    0      0
  fallocated, ends inside a block   3141332    212    0
  fallocated, unaligned start       3137536    412    0
  append                            3137536    0      0

A short write 1M past EOF, O_DIRECT, resident and compressed files and
full writes give the same results with v2 as with v1.
---
 fs/ntfs/file.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..1779110a0c4f 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -928,10 +928,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret = iomap_file_buffered_write(iocb, from, &ntfs_write_iomap_ops,
 				&ntfs_iomap_folio_ops, NULL);
 out:
-	if (ret < 0 && ret != -EIOCBQUEUED) {
+	/*
+	 * Both sizes were moved to end before the copy, so a short write,
+	 * like a failed one, must take back what it did not write.
+	 */
+	if (ret < count && ret != -EIOCBQUEUED) {
+		loff_t new_init_size = old_init_size;
+		loff_t new_data_size = old_data_size;
 		int init_err = 0;
 		int data_err = 0;
 
+		if (ret > 0) {
+			new_init_size = max(old_init_size, pos + ret);
+			new_data_size = max(old_data_size, pos + ret);
+		}
+
 		/*
 		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
 		 * expects the invalidate lock held across the size
@@ -940,13 +951,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		filemap_invalidate_lock(vi->i_mapping);
 
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
+			/*
+			 * A short copy can leave the rest of the last block
+			 * cached as read from disk.  Clear what is no longer
+			 * initialized before shrinking the initialized size.
+			 */
+			if (ni->initialized_size > new_init_size)
+				truncate_pagecache_range(vi, new_init_size,
+						ni->initialized_size - 1);
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +974,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * the uninitialized tail, so skip it unless the rollback
 		 * above restored that size.
 		 */
-		if (ni->data_size != old_data_size && !init_err) {
+		if (ni->data_size != new_data_size && !init_err) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
-			truncate_setsize(vi, old_data_size);
+			truncate_setsize(vi, new_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
-					old_data_size);
+			data_err = __ntfs_attr_truncate_vfs(ni, new_data_size,
+					new_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 			/* Like ntfs_setattr_size(): stay on the durable size. */
 			if (data_err)

base-commit: b025f526c5d04929212c9d5fb7ffc96608f3eacc
-- 
2.43.0

