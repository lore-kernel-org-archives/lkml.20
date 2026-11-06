Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963717;
	b=mhwGJyAFCkcyqodTkFQ1+KQSqjynm7jcEoyGn2qmzmLQ26EZGm0CuvBqTwb8QD8gpt7v
	 VCogYD75HQXTwjTBKalI1FYv+68eKPCNJzKq493PIHaIpQPTzSZYX06uMPnY9KZ690thV
	 AeIE4w1hPG1DKFdP25Hp+MBXi4JXcwRLwqWRDZ9Hv1j4Q6gZA9XbIahu7wnA4Gv+gfAGH
	 aENukoPjnKK1v4NKlpPQcPxTUu0o2AcC9CMqfhGSsMUUD1vslhY9S0a3l2WYnPbsFwLa0
	 zF9JmR23MDVSeYAMTT0Mx6gX1Xx2Hod3ztysUCiGEkr2pn6xWs9N93rYqp9dllhz8oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963717;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uIrrmAqeFkXmdArDrckr4XQGdXW7TtcrWwvKk/frjms=;
	b=elalTgTiPKyjO+flkP4/52K4C/2dnUQt/fQk3BFlBcakh2krZReuLn0Cy+qSMGp8ziEU
	 ZglOMEC2UjPdQpjzXlv2qr0dxwygIMv+QYaupuJ3ua03+A4+Ikm+4tYscyAuPNqqLpTT5
	 BNiZRIUHrhSnY451kF89f7FncJ6fR9yh0BAQxLI86t9cc4LINfHpJte/Qm2X6UqGQVR13
	 D2yURuJmixDCr4O08agAs+Gir3O4KKhUa3PbmEj8cgugABUEFrOBbAQvLY58SvKt6CQir
	 jslrXrAi0fKDBRRixz1scSv5sda+40UPHY8WWPDdAJPDEbtJBXzM957uIU8/mcsXgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uw4mi1KB;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32418606D81C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32418606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uw4mi1KB
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963714; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=uIrrmAqeFkXmdArDrckr4XQGdXW7TtcrWwvKk/frjms=;
	b=uw4mi1KBbWbdCu2pIO4pRznLFeuZoYjEaZXRix9tYWv9dD5oo/qUxEsFaS3x8K7d8sY+CAGtRlip/Ed16p5FiLW9NW5CJRE0PQm6J0rDoGp7O2nb04lxA5aPUvNNcSodobwqxJGp8cNs/kHVoEQ+exTIit0Pdn14WnW/BPCMoXs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBf72M_1793963712;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBf72M_1793963712 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:13 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 15/31] ocfs2: abstract the chain list dinode guard and count check
Date: Fri,  6 Nov 2026 19:14:42 +0800
Message-Id: <20261106111458.1467464-16-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261106111458.1467464-1-joseph.qi@linux.alibaba.com>
References: <20261106111458.1467464-1-joseph.qi@linux.alibaba.com>
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

