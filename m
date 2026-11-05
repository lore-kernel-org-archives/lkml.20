Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872184;
	b=F/qHt8c7vb5m5HLL5lhQ42zu71g4+GEVLIcQT5w/TmFQ/SuUPAMUYOXGX+Ydw21kPhYc
	 gaJCeoyML4fw/O6CtYsWOlUTy/AwNQZcf5OFYqyGgWOglZmb3nbsFDJmLAMEE10BZx6i7
	 JSHiuE3j892q0mQh5+nYuZ8S2PoMlll8QmlnWz0isdY0eiRn601+0rzNessTIcjCfQAps
	 khdt5mryZ7FZmHiJVc3B0SKUuND2lbo+tAfZ4leFGShB/vF/Dd/H1CYHo+acH1yQCJKKO
	 CKoQsESyVZIRW4GtlGT/6hJQBS67OmFeugvy1cd791MoppOUvS/1ftlAaoUzrrICw5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872184;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/ZeHM0chuv9S117dNjVNn2ovfXmc6zT5DV2Y27f1CDU=;
	b=HGruER1lwQpsYU8kG0Q6ABg1GgTDIyKBHkaQJYI0Cl+LWQAO4UjtZOod+PVXCXUqn1Dk
	 WvH10aE+hfE4FdtbdW+oVO7luNLMCeBUTr2LeOnKTTqN6TLZT/0DLd1Ex8ZJkVMZg1C9C
	 anpCiSObNWQr83F3EkG1L7uVa8nbs8wHtjkFwnoTag/NjzK5p+Bacu0NMfkB1VJLnpSUQ
	 M/u+rONqxf2zAQHfxIf64f71ztFVeHz9wOloj7zP0AQKLgDt/cVT7qSrZ87DoOpi+u/MX
	 N7o1rSxQa0WT2qpsD7aYopMWOuj+DP/UDVhnIYdfhO7TyfJe5hV3Sr0+vgTzLawYuaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MfI8bWvE;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619916082BCB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619916082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MfI8bWvE
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872181; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=/ZeHM0chuv9S117dNjVNn2ovfXmc6zT5DV2Y27f1CDU=;
	b=MfI8bWvEBnseo9UWXl4YtmYKNGY8A6KiRaCR9tudzf/Z3RXK5k+iAP+bx7lsKdvTpP+x6q4qDyKEFQqfXBE490YiGPVtIlse3ScDBTeHn72UcnY0zrSJQLziHA6POpZP3oUDM4BKuRPVilaAO6yhmjJuUQjp5sJuTcqHoI5mb44=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZbj_1793872180;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZbj_1793872180 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:40 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 14/30] ocfs2: abstract the chain list dinode guard and count check
Date: Thu,  5 Nov 2026 17:49:10 +0800
Message-Id: <20261105094926.3203416-15-joseph.qi@linux.alibaba.com>
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

Introduce ocfs2_dinode_has_chain_list() for the OCFS2_CHAIN_FL test that
selects the id2.i_chain union arm, and ocfs2_dinode_has_bad_chain_count()
for the cl_count against ocfs2_chain_recs_per_inode() test.

This mirrors the guard predicates already used for the inline-data and
fast symlink groups, and ocfs2_dinode_has_extents() for the extent list
group.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 9cf2541b82ba..f3ee6491c141 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -216,6 +216,18 @@ static bool ocfs2_dinode_has_unterminated_fast_symlink(struct super_block *sb,
 	return strnlen((char *)di->id2.i_symlink, i_size + 1) != i_size;
 }
 
+static bool ocfs2_dinode_has_chain_list(struct ocfs2_dinode *di)
+{
+	return le32_to_cpu(di->i_flags) & OCFS2_CHAIN_FL;
+}
+
+static bool ocfs2_dinode_has_bad_chain_count(struct super_block *sb,
+					     struct ocfs2_dinode *di)
+{
+	return le16_to_cpu(di->id2.i_chain.cl_count) !=
+		ocfs2_chain_recs_per_inode(sb);
+}
+
 void ocfs2_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = OCFS2_I(inode)->ip_attr;
@@ -1829,12 +1841,12 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		}
 	}
 
-	if (le32_to_cpu(di->i_flags) & OCFS2_CHAIN_FL) {
+	if (ocfs2_dinode_has_chain_list(di)) {
 		struct ocfs2_chain_list *cl = &di->id2.i_chain;
 		u16 bpc = 1 << (OCFS2_SB(sb)->s_clustersize_bits -
 				sb->s_blocksize_bits);
 
-		if (le16_to_cpu(cl->cl_count) != ocfs2_chain_recs_per_inode(sb)) {
+		if (ocfs2_dinode_has_bad_chain_count(sb, di)) {
 			rc = ocfs2_error(sb, "Invalid dinode %llu: chain list count %u\n",
 					 (unsigned long long)bh->b_blocknr,
 					 le16_to_cpu(cl->cl_count));
-- 
2.39.3

