Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872175;
	b=Vrw+N6IKDlt265IUoNSeGnfOPtJpshTDELW5wIZm4ZK4q3jM4byJSmjyKr+Wv2KTSn8J
	 BMVKOmbirynCJLqZ69FaFDotJbT5CqLWTZ41BxiNf2LzQTALvtwFZUx1aK0nd4b3o6LAk
	 4jDhM2wjStZy6m3Gmg+7e9+JTlqfu/nHb4fkwOwTT5AWt/6QCx6DDfhvppSucN+RaIu40
	 Xczg8iA6BneRhCZ+Jjal4b4Irwyl4Fgbyu+5M+NmOYBak6EN94HhBsdts5HqZoWeq4WqL
	 Dbhf7Bb7zpq8stkghogjcOZba4t/6keyEOzHdcJIt9CxSNPwAtlaEAnPZBiSzhM8TRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872175;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4bZVfnr5pIyqJUbcycpRE5SIUWyrZwynqk4ckwwwzjA=;
	b=RLvVS9C5bCFA+3BXvO9e8Yyj/+RDTHQisKyFf107C9GBeB3bsuDsKg/E/S6kNZyVMNSY
	 AY1nUpi0r/ZjnnqUjm3ptCabPpadhjdcTwhVgyT6O3SAWqZNsi4Vp79ImBRJzrjyTteYH
	 WwlPwzkQZxMhiNflV4LR82fGB9g4XNCTAe9wWnCAVfUj6N47RaltKqyGo7rgsco/GfgU9
	 YPgDhkyWVwCO/R7paOG+HWSTA3V3y9TLlLhDlpzifHv0x5oxTXSY5LqnTPFtHRkx0rZKS
	 CEfRP1IEXY9vqOb3Pck8uQgdb1AUUnhz74yHMxT35rA3OI+YByvNpVBYI3qXdEhaxYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R9MzEVw9;
	arc=none smtp.remote-ip=115.124.30.112
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2746606D816
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2746606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R9MzEVw9
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872172; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=4bZVfnr5pIyqJUbcycpRE5SIUWyrZwynqk4ckwwwzjA=;
	b=R9MzEVw9OGHAQjoWwsmZYO5imxTxz4DYB2blBZIITpUqB97p2KsOUzNSlT17TzcjmjbcqWIkHD1OaCQ/4lEEAy0dmci2JccJHYFEY+QRPfFs3tcasxRaPuZmXcTWCoByQGo4qftA0U1PdOqfh9h50smNVGRLkEKF1ptwSj/9JQc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8K7.3_1793872170;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8K7.3_1793872170 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:31 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 04/30] ocfs2: abstract the dinode fs_generation mismatch check
Date: Thu,  5 Nov 2026 17:49:00 +0800
Message-Id: <20261105094926.3203416-5-joseph.qi@linux.alibaba.com>
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

The comparison against OCFS2_SB(sb)->fs_generation is open-coded in the
normal validator, the filecheck validator and the repair path.  Fold it
into a shared predicate.

Each call site keeps its own log message and return code: the normal
validator escalates through ocfs2_error(), filecheck reports
OCFS2_FILECHECK_ERR_GENERATION, and repair rewrites the field.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 9f6808cec22a..8eefda8fe4a6 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -82,6 +82,12 @@ static bool ocfs2_dinode_has_no_valid_flag(struct ocfs2_dinode *di)
 	return !(le32_to_cpu(di->i_flags) & OCFS2_VALID_FL);
 }
 
+static bool ocfs2_dinode_has_wrong_fs_generation(struct super_block *sb,
+						 struct ocfs2_dinode *di)
+{
+	return le32_to_cpu(di->i_fs_generation) != OCFS2_SB(sb)->fs_generation;
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1531,8 +1537,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (le32_to_cpu(di->i_fs_generation) !=
-	    OCFS2_SB(sb)->fs_generation) {
+	if (ocfs2_dinode_has_wrong_fs_generation(sb, di)) {
 		rc = ocfs2_error(sb,
 				 "Invalid dinode #%llu: fs_generation is %u\n",
 				 (unsigned long long)bh->b_blocknr,
@@ -1857,8 +1862,7 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (le32_to_cpu(di->i_fs_generation) !=
-	    OCFS2_SB(sb)->fs_generation) {
+	if (ocfs2_dinode_has_wrong_fs_generation(sb, di)) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: fs_generation is %u\n",
 		     (unsigned long long)bh->b_blocknr,
@@ -1953,8 +1957,7 @@ static int ocfs2_filecheck_repair_inode_block(struct super_block *sb,
 		     (unsigned long long)le64_to_cpu(di->i_blkno));
 	}
 
-	if (le32_to_cpu(di->i_fs_generation) !=
-	    OCFS2_SB(sb)->fs_generation) {
+	if (ocfs2_dinode_has_wrong_fs_generation(sb, di)) {
 		di->i_fs_generation = cpu_to_le32(OCFS2_SB(sb)->fs_generation);
 		changed = 1;
 		mlog(ML_ERROR,
-- 
2.39.3

