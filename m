Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872196;
	b=1Ajt+QkZDC1JFfuHa/YkOez922kMtFj+iQTx3ZX807Ek2ZVVr9mrBPK8hgASjRW02AZ7
	 E2KY6jB8kmuzB5+64x30aa51VOR6pPs5a7S4ywNq9YEM1QqdvBz5CwaRdXEw6oI4DwVp9
	 ixTHduObOm3v0JcJgcCh6OujEueTuCNLscSmsokASkkkF/jMoPVWCF/MlACk9qBPaJjTJ
	 0NIBmzc0zcz3H/QXCPA3m+cd+1dXnLP71YfLTn0OZMYHrTaG/i8rhXRrGk0PK0t3Q35CT
	 twjo+qj8MtuKk2OoNBynrfP/biKSIIc+Iy/3vaWdMKVGGOiwGQpCpHz/hrb/QAiqsKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872196;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RfjfsCK6IWV+WCYBmKbo2cPF50vqUZysaqx59K7C+6s=;
	b=IiKY6DOGE7FkjtwReknt5TgiJa3dIP7rKTe/T7/zusOF9UaChhDC8NbtrTqhUYdgs0rU
	 RuEIirMIbW6J3CPqdjVdAPvjbgmseX0Cmi/2hXZAFewHOGfuLKEjlfTbVwI+LWgAjkYKi
	 ZUa9sDEk8rzbE9P9y9nOKhKdWhIuTTfoGJOJ2gKaN+dYCW0Rdm5K2ROMype5rut7aS9YD
	 PnQnGgjDjddLpbjsWkvXz16b2giwhGlvviA8LwEJs7ZffTQh+1C1GvYATD0Wi/9wzgP+m
	 yYmK96ljkn2DhRQpyPTTgqeCI9UjK1tCv9gm/QLtMKQr/dsMk8rllXvGh15LDLYGCuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QmucArjR;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52F60A3829
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE52F60A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QmucArjR
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872193; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=RfjfsCK6IWV+WCYBmKbo2cPF50vqUZysaqx59K7C+6s=;
	b=QmucArjRerJj6AJ7Yd64jF9Wm+L8hTW7qxWex3CRGAZ/pBz/dWOoys9UwTmR3GUZyUhFztyPB/J7UPXjAXuORUzVfuDznC8bOpCtB8qXT4WvfRue8HvduY1LfGg3sVhnxOYyi/faJdLIhdliIr0Yr6u17N0xR3L5i1AQLc+RSM4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZgO_1793872192;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZgO_1793872192 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:53 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 27/30] ocfs2: check fast symlink dinodes in online filecheck
Date: Thu,  5 Nov 2026 17:49:23 +0800
Message-Id: <20261105094926.3203416-28-joseph.qi@linux.alibaba.com>
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

Wire the fast symlink guard and its two sub-checks into the filecheck
validator: an i_size beyond the space available for id2.i_symlink, and a
target that is not NUL-terminated at i_size.

ocfs2_dinode_has_unterminated_fast_symlink() bounds its own strnlen()
against ocfs2_fast_symlink_chars(), so this caller does not have to rely
on the size check having run first to stay inside the inode block.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 06b190b00590..81f1f511d448 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2130,6 +2130,30 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		}
 	}
 
+	if (ocfs2_dinode_is_fast_symlink(di)) {
+		int max_inline = ocfs2_fast_symlink_chars(sb);
+		u64 i_size = le64_to_cpu(di->i_size);
+
+		if (ocfs2_dinode_has_oversized_fast_symlink(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: fast symlink i_size %llu exceeds max %d\n",
+			     (unsigned long long)bh->b_blocknr,
+			     (unsigned long long)i_size,
+			     max_inline - 1);
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_unterminated_fast_symlink(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: fast symlink is not NUL-terminated at i_size %llu\n",
+			     (unsigned long long)bh->b_blocknr,
+			     (unsigned long long)i_size);
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+	}
+
 bail:
 	return rc;
 }
-- 
2.39.3

