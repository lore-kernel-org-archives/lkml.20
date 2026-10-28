Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175005;
	b=fkzSD78pKwiyVuF8f1mt9O6HBh7ebK0k9fLxEDOVbLyFIAp+LWK7TMLLEhtrs1XH0ODt
	 0OuFdzsq67Ms3CjVKxSAHF+3OsM536s39WYlPMbPhrXcELxnjcbAcx12OeFqdXaIa9GyS
	 OB6Pi8F4HOx2UAmxoqHMgPUR7Fn68KeixePxu1BHO0gsOHG/FIEULlDoRyEzYq1lUQvHh
	 0yaW1IJfD2LyQ7QiYe2bPs+ce6q7ifi7KWAVUq/U1uQ2Y+J+HfJu5VDdIvSgrRif6JSmC
	 W8BSWGVBJrCoZamL5RbfLEJkJRfzYbQhoyR5iwhCqOowIKU+NCLMQpLCvVas1uOSgVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175005;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Wrm5PeUcFMThrBa2sMYsth3j2Dv4nZ2meAKqS7dCpg=;
	b=jZ2OPlp6nS7oQIBxXi5mTzdipkY8GSMZw/iOjSyCSniNjooldTbjfs3xkp50H9cwRmC4
	 hXHnRol9lBmyeRb7AvB8BAOBW+oR/Mz9WhlYrwrhkZnCye1w9Z5X1by6rmaAkvsBM5AFe
	 tmeUWhHoeUoeBDJASoHleleaXQltWsxeQCbEUVNSnJTtUATGtmySMDOv1f8jq5g6EU0yn
	 NoYad7i7fs549vkS2INe3yDmHcAzRPAeKQWMXqyZgas+PnH37/Rgck0cnByUsQawf7vsw
	 ItkAys88uhliJ0cyD+yToKwNHG1UQacuKJo7V2gwdIg55J+n1bipsbiR9usGxqRvqSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliyun.com;
	spf=pass smtp.mailfrom=aliyun.com;
	dkim=pass header.d=aliyun.com header.i=@aliyun.com header.a=rsa-sha256 header.s=s1024 header.b=dqWthZse;
	arc=none smtp.remote-ip=115.124.30.75
Received: from out30-75.freemail.mail.aliyun.com (out30-75.freemail.mail.aliyun.com [115.124.30.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A5FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aliyun.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliyun.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aliyun.com header.i=@aliyun.com header.a=rsa-sha256 header.s=s1024 header.b=dqWthZse
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aliyun.com; s=s1024;
	t=1793175000; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7Wrm5PeUcFMThrBa2sMYsth3j2Dv4nZ2meAKqS7dCpg=;
	b=dqWthZseTUy3xdI7u8MrQzEhYLuho2A05tYx/E4B5SKqlaoJ4wQVMUHQRE4sb6+o5NZHqKrnVJQCzwOQVz+xlwbg9UkXGsAVB67XYdA282LPqR9cTNdnPvx6wt+D5N6J/2A+QOpcietMutyKTUBGc17gWGeF47ir1f71HNAVs0w=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07830165|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0857968-0.000773195-0.91343;FP=4050552545492954866|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=wdhh6@aliyun.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---0XDg8MZN_1793174997;
Received: from localhost.localdomain(mailfrom:wdhh6@aliyun.com fp:SMTPD_---0XDg8MZN_1793174997 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 16:09:59 +0800
From: Chaohai Chen <wdhh6@aliyun.com>
To: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com
Cc: dwmw2@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	syzkaller-bugs@googlegroups.com,
	wdhh6@aliyun.com
Subject: [PATCH] jffs2: don't start the GC thread on a read-only superblock
Date: Wed, 28 Oct 2026 16:09:55 +0800
Message-ID: <20261028080955.290774-1-wdhh6@aliyun.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <6adfffa9.6200f071.51519.0f0e.GAE@google.com>
References: <6adfffa9.6200f071.51519.0f0e.GAE@google.com>
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

jffs2_do_remount_fs() derives the read-write state from fc->sb_flags,
but fc->sb_flags is only meaningful for the bits selected by
fc->sb_flags_mask.

fspick() builds its fs_context with sb_flags=0 and sb_flags_mask=0,
which means "leave every superblock flag alone"; JFFS2 misreads that
as "the filesystem is becoming read-write" and starts jffs2_gcd_mtdX
although the superblock stays read-only, and reconfigure_super()
then leaves sb->s_flags untouched.

The thread then outlives its superblock: jffs2_kill_sb() stops the
garbage collect thread only when !sb_rdonly(sb), so kfree(c) runs
while the thread is still alive and the next GC pass dereferences
freed memory.

Compute the resulting read-only state from fc->sb_flags only when
SB_RDONLY is part of fc->sb_flags_mask, falling back to the current
state otherwise, and stop any running thread unconditionally before
deciding whether to restart it.

Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
Reported-by: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=49c659b5564b2a44083c
Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
---
 fs/jffs2/fs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 05cf860307c7..6d04dfa7b910 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -396,6 +396,15 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
 int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	/*
+	 * fc->sb_flags is only meaningful for the bits selected by
+	 * fc->sb_flags_mask.  fspick() passes a mask of 0, which leaves the
+	 * read-only state untouched - that must not be read as "becoming
+	 * read-write", or we would spawn a GC thread on a superblock that
+	 * stays read-only (and which jffs2_kill_sb() would then not stop).
+	 */
+	bool will_be_ro = (fc->sb_flags_mask & SB_RDONLY) ?
+		!!(fc->sb_flags & SB_RDONLY) : sb_rdonly(sb);
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !sb_rdonly(sb))
 		return -EROFS;
@@ -404,14 +413,14 @@ int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 	   This also catches the case where it was stopped and this
 	   is just a remount to restart it.
 	   Flush the writebuffer, if necessary, else we loose it */
+	jffs2_stop_garbage_collect_thread(c);
 	if (!sb_rdonly(sb)) {
-		jffs2_stop_garbage_collect_thread(c);
 		mutex_lock(&c->alloc_sem);
 		jffs2_flush_wbuf_pad(c);
 		mutex_unlock(&c->alloc_sem);
 	}
 
-	if (!(fc->sb_flags & SB_RDONLY))
+	if (!will_be_ro)
 		jffs2_start_garbage_collect_thread(c);
 
 	fc->sb_flags |= SB_NOATIME;
-- 
2.43.7

