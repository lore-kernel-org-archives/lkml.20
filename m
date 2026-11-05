Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872188;
	b=qMN9pZArF9RJbEMK9bkuMXqH8oJ+LmXgdrCvXM7srbwClWIp7RzsNRBwv91i5NRGucE3
	 JhylaAQ5uLXoRHnmmXtG0pUt54ROiYWaOAR6yT46C8dpgk3XeigekiNCX3hPo5f3/xmjC
	 iFr3o8PuIMCtfaN7bl/KG5l0xH1DRHdR57CssKNAR7XRRAWjoAvwFirM3q8ee0SSn2KXe
	 xe6t53Rpoz2UfqV1XOPa7hGXdcKC8Qqu1nMKKTc883R22ITN3ByXCytKsRzet3B2uHSR0
	 iK167rS5+ld0QntHFrCqfE327QxNbt+dMA5S43IjX/fI+NJIkV9sG/8VT6AK8xzK/+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872188;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ibe5T46xW1VwslkNTya4/ZV1I+Avt0y6E2gB3FP94qs=;
	b=cMNIE/btKnz3tseZGRsA4ocDqfR9gEUn6XAnIrsvDGJPSWPBwbGOq55pO97ImMt8qcSe
	 DEtAIT+wIzglDUb5l/rzqWZUkDsWw4lY2TeIoRhilNKRaTRp9ytQD2EuTQzNbCkssCg3b
	 RdUNyJ3awweIA4v4M0Rfkgh7lc4O/TiX49tLLe7knd1pDGy+pk06kKu+uHVqfV4WaSfvh
	 90SNEKI5S/LKbhjpwQ6J0lQCZXGdG9n3Lt+yQHnoRgRqlQegbN0aWVAZCYZwtz3Bt0JOq
	 yCe+xA2HBhgSJMJN8kP2I8/BDBEqav7KcYi6ODkMGqhUTM2ZRSZ4uPS3+0pXiyTljrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ORYDj9uo;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5BA608361E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5BA608361E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ORYDj9uo
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872185; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ibe5T46xW1VwslkNTya4/ZV1I+Avt0y6E2gB3FP94qs=;
	b=ORYDj9uouCPR0pQjvtxKQuW2sKi/D0zx/Q2kjFZ7Avlj5a78ciVVcDghuElegYXzXNJtkdKBgYFar6ZJKHoOUVFmrSwx/3la/dBxdr7An6BppaBFNINYA82b2fVoWiYBRKkh0p48zKTJa3XUBQIsgENtPAMQDZe3qUsgd1UB5lw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8K74X_1793872184;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8K74X_1793872184 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:44 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 18/30] ocfs2: abstract the zero extent list count check
Date: Thu,  5 Nov 2026 17:49:14 +0800
Message-Id: <20261105094926.3203416-19-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261105094926.3203416-1-joseph.qi@linux.alibaba.com>
References: <20261105094926.3203416-1-joseph.qi@linux.alibaba.com>
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

Fold the l_count == 0 test into a predicate, the first of the extent list
group guarded by ocfs2_dinode_has_extents().

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index b4ef4077e09c..70fb032ce891 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -250,6 +250,11 @@ static bool ocfs2_dinode_has_refcount_without_loc(struct ocfs2_dinode *di)
 		!di->i_refcount_loc;
 }
 
+static bool ocfs2_dinode_has_zero_extent_count(struct ocfs2_dinode *di)
+{
+	return le16_to_cpu(di->id2.i_list.l_count) == 0;
+}
+
 void ocfs2_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = OCFS2_I(inode)->ip_attr;
@@ -1897,7 +1902,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		u16 count = le16_to_cpu(el->l_count);
 		u16 next_free = le16_to_cpu(el->l_next_free_rec);
 
-		if (count == 0) {
+		if (ocfs2_dinode_has_zero_extent_count(di)) {
 			rc = ocfs2_error(sb,
 					 "Invalid dinode %llu: extent list l_count is zero\n",
 					 (unsigned long long)bh->b_blocknr);
-- 
2.39.3

