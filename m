Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963711;
	b=1nN5o4I7JStES2Xud6P/9/xEbKwmpEpMup1LRoTYbaHt/RpOUV9z9Z4vcgxV2C5M/BRw
	 NjJVP0llRv4Gib3UWvhZu/dtFmEBxiDe0xP/vKBUfGTAbPbqlpzWe4wMs+tfZk5J+PcD2
	 mMsRO9gdemHcreJlMsaF1bVvvBbb5W6sxa/MwtcrzzE7RWWhDsS37xudBr/ZEoqRV5nZN
	 90cODhb+slVb/N0QoLcDc5EluyNlu7G2ZMwY7NR0GiIUEaLfamJ/YfnfCFf5ByioU4mq2
	 prCDbfwRpJ2F5Soj4hPSfxIPZW0r3PSFmmKMkmg81GLpgyneLNbZPRDfTFAXYhc7B5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963711;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iQ725nX9UdgX+EvgHWCaaetNVZXMZujjh3zhcuCl3JA=;
	b=ew6dAkNPGkFvqZH27WSJznbKm3f0HMa535RigUipJBjHK893npXyi/4/NQ7YenE+AVvJ
	 s36oJWR8rtqTe3GT9Sjf8NcD3yJN44HfgMDVd6nnUH2/dnQJu2nCyyD9AJ9Ut4h8EWlrh
	 /slF9EyH5G28o+TrSCboZhF1WpeHFz6q3onscWtk9A2l+SFRGm+y4hNUE9njHqvZbb/gt
	 Pp446peLwygZXQ/ptT6cu9FXD2iQSA8r4krty8ZaFiV1Gd8E5szjmVdRkzNAPauGUyfXY
	 EJExUZImmAo9AXM/e1iKel+ElB4CATthaW5JU+JBQk7mJkXQUsRK3UZFrTBoGJiRsGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ZW66btI+;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1D606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A1D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ZW66btI+
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963706; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=iQ725nX9UdgX+EvgHWCaaetNVZXMZujjh3zhcuCl3JA=;
	b=ZW66btI+LHI3wezNifcZoq9Mez2gqMxHT0ZI6RnIUktP58Ks89P5Q1hWbTEeULT0cI6BkUru8jGkT/UIhDs7Nq6Xlp4fodD/PjXSiWmlKH4oYrfnBmnnh+HsoQUBQobF8ERk+XuB5Tf8ttLwAijxstUNKhNexPa4QpRCi+ggUEs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBSvO7_1793963705;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBSvO7_1793963705 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:05 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 07/31] ocfs2: abstract the dinode suballoc bit check
Date: Fri,  6 Nov 2026 19:14:34 +0800
Message-Id: <20261106111458.1467464-8-joseph.qi@linux.alibaba.com>
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

Fold the i_suballoc_bit against ocfs2_suballoc_bits_per_block() test into
a predicate.  The rationale comment stays at the call site, next to the
error it explains.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 0929deb3e4b4..3be98328925d 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -111,6 +111,12 @@ static bool ocfs2_dinode_has_out_of_range_suballoc_slot(struct super_block *sb,
 		(u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1;
 }
 
+static bool ocfs2_dinode_has_bad_suballoc_bit(struct super_block *sb,
+					      struct ocfs2_dinode *di)
+{
+	return le16_to_cpu(di->i_suballoc_bit) >= ocfs2_suballoc_bits_per_block(sb);
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1601,7 +1607,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 	 * BUG_ON((count + start_bit) > ocfs2_bits_per_group(cl)), since any
 	 * group holds at most ocfs2_suballoc_bits_per_block() bits.
 	 */
-	if (le16_to_cpu(di->i_suballoc_bit) >= ocfs2_suballoc_bits_per_block(sb)) {
+	if (ocfs2_dinode_has_bad_suballoc_bit(sb, di)) {
 		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc bit %u\n",
 				 (unsigned long long)bh->b_blocknr,
 				 le16_to_cpu(di->i_suballoc_bit));
-- 
2.39.3

