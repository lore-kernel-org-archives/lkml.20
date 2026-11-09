Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226917;
	b=lQisWz/QoP1m7LZtOBFa3F7+7DGbt1HJyAl1yfflLIEJZSAkmvUpfbX9nrZNcQATevEi
	 5NH9kZuWmmhn6MgiVXa2YQvf2l2RO8/hzLZI5RPfAFJtfX08i838H7hL8rQuLXN0HGFPY
	 jUniPUxxjXP4zD5913P9laRz/DlQXJTnHjpaqwX3FN5OAFbzyKdB7nU2NnZ6CSqVAaJeM
	 BaGYS2By5YzjMmorpSxPg6O8UOqEeuzPfiYsmFzPzFWLpeDW3B5XPwQe4PoDEqE6ajy5x
	 5YRGj12BV41ccOsDGO8BByAtlbvNKF9P78z5jxT2QxFuQ1iyCoNgtshJ4Qz1UpKKVNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226917;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7eutQ+YAugIK3ZO4F19YZ1QUaoTdV7knKC5HCz1LcuI=;
	b=PqP29flBOxxmRYyQc+KcgHvHM8zBuOJIlzVHc/WLFko1Wn4govSLP1pq4sqRPoCZkWSv
	 +N7uaU2/1vLOJYXr0GS00PYdf3kTx7NKCQwGo8PT4OtoBRAuECn1i5bDvNMl3R3cz7yHm
	 pHr1KfAzGQzZcWxbrG1akgWV98w99CprjenJ+pKWsEg40W2O+EPim2ZeAuMB1YbNOGv52
	 7kIApWO7rvQnbcQ3kEIMHGUdtPsfNDHZqg90/2p3MEell5TJhYa0tf0Vbp/FZGxB+t3Ig
	 47nGXh03U9Nnkzj3JdQLKmjfF6Ww0nksgVAvBAEq8JJZl5X7xH007KFFOgLNQ5quQvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=GGLIwH4T;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F6F606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F6F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=GGLIwH4T
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226913; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7eutQ+YAugIK3ZO4F19YZ1QUaoTdV7knKC5HCz1LcuI=;
	b=GGLIwH4TRfVJNMr6/5bXfa5sIAqanujsupJgwBN//BsRz/ELtrSyMyGU49kMDcFPBMK6EKNViW+KM3JfDb4nrIY+UsQeYo6wbb69tWlY2xT1/atdzdt+fK/YE7cJQqnFMmtru+K2QbRjznuSJx+mb7fQ7NBu2wphJLhJg30uvbw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEP8aqe_1794226912;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEP8aqe_1794226912 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:21:53 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 06/31] ocfs2: abstract the dinode suballoc slot checks
Date: Mon,  9 Nov 2026 20:20:56 +0800
Message-Id: <20261109122121.21473-7-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261109122121.21473-1-joseph.qi@linux.alibaba.com>
References: <20261109122121.21473-1-joseph.qi@linux.alibaba.com>
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

The suballoc slot validation is a nested if/else-if whose two arms carry
different error messages.  Split it into two predicates so each message
stays at its own call site without having to re-test the slot value to
work out which arm fired.

The arms were already mutually exclusive, so two sequential tests are
equivalent to the if/else-if.

Keep the OCFS2_INVALID_SLOT exclusion in the range predicate.
OCFS2_INVALID_SLOT is 65535, which is greater than max_slots - 1, so
without it every system inode mkfs.ocfs2 creates from the global
allocator would be rejected.

ocfs2_get_suballoc_slot_bit() in suballoc.c open-codes an identical range
test, and is deliberately not converted.  The dinode validator pairs the
range predicate with ocfs2_dinode_has_invalid_suballoc_slot(), which also
rejects OCFS2_INVALID_SLOT on a non-system inode, so that pair is stricter
than what ocfs2_get_suballoc_slot_bit() accepts.  The range predicate on
its own is not stricter, it is the same test.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 6b78b3f3c5fa..0929deb3e4b4 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -98,6 +98,19 @@ static bool ocfs2_dinode_has_wrong_fs_generation(struct super_block *sb,
 	return le32_to_cpu(di->i_fs_generation) != OCFS2_SB(sb)->fs_generation;
 }
 
+static bool ocfs2_dinode_has_invalid_suballoc_slot(struct ocfs2_dinode *di)
+{
+	return le16_to_cpu(di->i_suballoc_slot) == (u16)OCFS2_INVALID_SLOT &&
+		!(le32_to_cpu(di->i_flags) & OCFS2_SYSTEM_FL);
+}
+
+static bool ocfs2_dinode_has_out_of_range_suballoc_slot(struct super_block *sb,
+							struct ocfs2_dinode *di)
+{
+	return le16_to_cpu(di->i_suballoc_slot) != (u16)OCFS2_INVALID_SLOT &&
+		(u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1;
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1564,15 +1577,15 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 	 * deleting it would pass the slot to get_local_system_inode() via
 	 * ocfs2_remove_inode() and trigger BUG_ON(slot == OCFS2_INVALID_SLOT).
 	 */
-	if (le16_to_cpu(di->i_suballoc_slot) == (u16)OCFS2_INVALID_SLOT) {
-		if (!(le32_to_cpu(di->i_flags) & OCFS2_SYSTEM_FL)) {
-			rc = ocfs2_error(sb,
-					 "Invalid dinode %llu: suballoc slot %u for non-system inode\n",
-					 (unsigned long long)bh->b_blocknr,
-					 le16_to_cpu(di->i_suballoc_slot));
-			goto bail;
-		}
-	} else if ((u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
+	if (ocfs2_dinode_has_invalid_suballoc_slot(di)) {
+		rc = ocfs2_error(sb,
+				 "Invalid dinode %llu: suballoc slot %u for non-system inode\n",
+				 (unsigned long long)bh->b_blocknr,
+				 le16_to_cpu(di->i_suballoc_slot));
+		goto bail;
+	}
+
+	if (ocfs2_dinode_has_out_of_range_suballoc_slot(sb, di)) {
 		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc slot %u\n",
 				 (unsigned long long)bh->b_blocknr,
 				 le16_to_cpu(di->i_suballoc_slot));
-- 
2.39.3

