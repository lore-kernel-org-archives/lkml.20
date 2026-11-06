Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963717;
	b=LTRclsEuntmJ0lEBoadDTwjwXnLWDTtWTJ7m+Njky8BOBGKL4OD8fbaouMB6vm7ITctz
	 k7i3W9PdeooGKln5RG3qh/VZ/VVfxaGIwqOc6LLK1PPpvpd+f1qMP+EPcpmJAm2f43YkF
	 YwRRcES8fknxy8hK1HFXiPB7gE3aqi2VIkQDZYXttJHgumao4QSNTjV3ikI9DMz4X8AOP
	 Nho51nxMb/zaMwqTI41B6M6KOulJZ8zaaF4YuXO8oaErdGNW1cV+YJemhZMDiZTwUSFos
	 GC9Q+vP111K7ZCyJ4ieBgQpuNoEy7e2rAfp2fp7UO/E+7pmAMozxpWuMgx0nv9pL0gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963717;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9lW0G/siDmQa58oRaiQcTBrX8im6OkfGUEyhuDd7WEc=;
	b=Y/hW5FQFZywnYlpcSofbcsPHNxYLHG2FqrsYBoZ33O0a5erhlHzmNADbVuwB9Ra2TqMx
	 VKQpcRBunxFv257VscGb2I8oqbJ1UhujcGw0XTJElA9TEqSAs2uyB/z9BFxgoaF1E+0d2
	 3Z4meg76cRkd+PywoppiqH38sHNMZxRPtCc6Z+qTr+LFEJNvMipEdVs524C2Z3z3TsyBK
	 wb8Amq6gG/xUaJEEMPQ7iayFJ6OgGmpLIHma1P/Nqvk++3u1MGeAX6+2x0fB/99H2IIUh
	 jl3aNAk8+CE7OWx19F8Afp9nv/OsQbGUEV6nWwYWu5+UwpjGbOL6I/dF36Zdsxgvyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="QB/adzcW";
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636156082BDA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636156082BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QB/adzcW
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963712; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9lW0G/siDmQa58oRaiQcTBrX8im6OkfGUEyhuDd7WEc=;
	b=QB/adzcWSHW7tvHpewKoUHBIeBTQr8vUUQegfuMPBKrLQIfDHXlcifaAX+jiIjTJgzP6gZH2Kq8Pnid6UwWiZjGKDzuP9wVwUDWbUUoNla1LiPfRfwFhrh1/JF/R9muEp7B8CGZCypcoV8LSDGlRRHmdTb2YSZFrQviqRGcmA/0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBf727_1793963711;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBf727_1793963711 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:12 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 14/31] ocfs2: abstract the fast symlink NUL-termination check
Date: Fri,  6 Nov 2026 19:14:41 +0800
Message-Id: <20261106111458.1467464-15-joseph.qi@linux.alibaba.com>
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

Fold the strnlen() test into a predicate that bounds the read itself
against ocfs2_fast_symlink_chars(), which is exactly the space available
for id2.i_symlink in the inode block.

The open-coded version was only safe because the preceding i_size check
had already bailed: i_size comes from disk, so an unbounded strnlen() on
i_size + 1 bytes can run past the end of the buffer.  Keeping that
ordering dependency implicit in a helper would be fragile, especially
once the filecheck variant starts calling it, so the predicate returns
false for an oversized i_size and leaves that case to
ocfs2_dinode_has_oversized_fast_symlink().

At the existing call site the size check still runs first, so behaviour
is unchanged.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index bf27925dd5c8..dbb4563dbc70 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -207,6 +207,25 @@ static bool ocfs2_dinode_has_oversized_fast_symlink(struct super_block *sb,
 	return le64_to_cpu(di->i_size) >= ocfs2_fast_symlink_chars(sb);
 }
 
+static bool ocfs2_dinode_has_unterminated_fast_symlink(struct super_block *sb,
+						       struct ocfs2_dinode *di)
+{
+	u64 i_size = le64_to_cpu(di->i_size);
+
+	/*
+	 * Bound the strnlen() here rather than relying on the caller having
+	 * rejected an oversized i_size first.  i_size comes from disk, and
+	 * ocfs2_fast_symlink_chars() is exactly the space available in the
+	 * inode block, so without this bound the read can run past it.
+	 * An oversized i_size is reported by
+	 * ocfs2_dinode_has_oversized_fast_symlink() instead.
+	 */
+	if (i_size >= ocfs2_fast_symlink_chars(sb))
+		return false;
+
+	return strnlen((char *)di->id2.i_symlink, i_size + 1) != i_size;
+}
+
 void ocfs2_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = OCFS2_I(inode)->ip_attr;
@@ -1812,7 +1831,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 			goto bail;
 		}
 
-		if (strnlen((char *)di->id2.i_symlink, i_size + 1) != i_size) {
+		if (ocfs2_dinode_has_unterminated_fast_symlink(sb, di)) {
 			rc = ocfs2_error(sb,
 					 "Invalid dinode #%llu: fast symlink is not NUL-terminated at i_size %llu\n",
 					 (unsigned long long)bh->b_blocknr,
-- 
2.39.3

