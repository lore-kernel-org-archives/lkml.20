Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226925;
	b=ABki/KrgcYKz4X0SsebuAslFVDdTClzcSKDMLg/juf0eBk9dQNcS8WJPzqjQOGfC3L0f
	 eoTgxx11D3DMofar2dPNLaVNcnFyU49H+wkhT7h2koQmAYtq0DNZhfzNsrlwu4kzW84/Y
	 o+ULK7pOc6X9s2qJdPuYUJmhFfQIc1oSicEIi6yf0fvmpyAHiJ2La9DHS1ysbooncJFn4
	 l9L71Zt3o1CWzv2UcHbmk6jk4KQtk3hCmCIHhi1mHBP7Jx0tp+g/1DJ0iqRNUCjPwEmM6
	 BuIJZdB528W9DQZ8cYCzhKR0HxI6G0QgQa/AbzLMTJabkR+8PQzD0PsdNq/UK4ja/TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226925;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uIrrmAqeFkXmdArDrckr4XQGdXW7TtcrWwvKk/frjms=;
	b=k/8SoWvSMVdyjN0/LAFxXcY1tS/4kloxb9BWlMQfxwikwZKadohxOI/suUb/TGHh8Hg4
	 9wPJuKP1ZuSpUObBW3I8V/7nKPCmGST+DDuHYkhIA30IjFTe+Mr/ZRtgh0pKT7wUBhPXZ
	 Vp42AmVjIAyO+fu1+IRbPzuwNtc4aTcuaZL/BeChhjGR6Ll8pxKfVJCxs5J1dFKTIB/Js
	 9Zr/zUWanrskY9X5ojz+SGOyTKQPNx70ySbb/cjyW8MY4I9jubQj6my8YJeRlIV0TwSmI
	 2wgdIqBZ7J3YXK8HlIIiWSJD64v8cjunUZ8F1ZdvQmYAkAaJabpzUBiDCOyu/s1e2vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hU8bMDZ5;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695E606D81D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6695E606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hU8bMDZ5
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226922; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=uIrrmAqeFkXmdArDrckr4XQGdXW7TtcrWwvKk/frjms=;
	b=hU8bMDZ5kNDTwvb6e3eJBa7r8UKcpKMrgLHBLiaPbmLVqdIE6qGeDHXRjcfc3VgkWxvnGczamUXy/ag6UzWethlcFSTihpvuuu3GRRWVKWJcoBPVt2I1zm0nj4VLyD5im1P6UTHXZcNLP2L7AgXedPOncJwSMxkOxRe9usXi8Ic=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEP8asa_1794226921;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEP8asa_1794226921 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:22:01 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 15/31] ocfs2: abstract the chain list dinode guard and count check
Date: Mon,  9 Nov 2026 20:21:05 +0800
Message-Id: <20261109122121.21473-16-joseph.qi@linux.alibaba.com>
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
index dbb4563dbc70..71aded2c88f7 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -226,6 +226,18 @@ static bool ocfs2_dinode_has_unterminated_fast_symlink(struct super_block *sb,
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
@@ -1840,12 +1852,12 @@ int ocfs2_validate_inode_block(struct super_block *sb,
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

