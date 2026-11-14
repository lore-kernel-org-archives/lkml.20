Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677154;
	b=r3Iyh8eZ5m/liCS31kQGYO2s5W1GBoOEd6VhnCkitXU9wU3+7QwZGokRN2OyfAkOkL2f
	 olLjK5WO87bBO0zCc6TtYkGl262Mv+y764f5VQi85vyYPShmVeCVZRsbfeGBf8GRr3qAk
	 DzWWcNe7GaVIgrErTfHtDK/zBcQyDloY3hkf3Bw/2mRoqF1W3db7Z1sKxP2X3neLkH/i+
	 miEJoo3tQGlTAVaKo+YlcbPgnogP6CThlhwJ+nKkJ59p9dWG0b1aLT9pwXo8YrMc3JtRe
	 t6obipC4t9H0yimse8XlIzZBK07BVVf1Xly7ejKCwWd56379MNPY9+BlXRwK8pXkENw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677154;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Content-Type:Cc:From:X-Mailer:
	 Subject:X-Lms-Return-Path:Content-Transfer-Encoding:To:Date:
	 Mime-Version:X-Original-From;
	bh=ika/s2IZ0MDDdlw4N+hH85S56WdHQrX+7y2SBeLVfP0=;
	b=ICoFfWl85HEhgwMxKeAO0xQ3xq6UWYSGMp3jSTCRgFm0s5gUYhJCHZUifrQJMLezz4KS
	 ehHQErl//4fUvHv5vIb7fAbfNHRaFDE7uLkil/qOciNXDw/LwcZIqp7bgpLCMTpG4DZm0
	 2QCd8RByX719q4UIIjhHW7audDNY11QJPLik5ZLtCUQkDXGO3vCYwC/tmDFMJaigNmrtw
	 ybj1yGAeqCib4aa7n114gwYHzwPCtqFp4C4glxeUbaxjRBrJCKX/iV4FhsQHNzucTKSwC
	 N+x3zH/3/ja2G39X8U9mD4gWQsxoLPk2sv6HaXpbM1BFBod4skafQ56IUTV7NsHRGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Hw374MmR;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63B5606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B63B5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Hw374MmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794677148; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ika/s2IZ0MDDdlw4N+hH85S56WdHQrX+7y2SBeLVfP0=;
 b=Hw374MmR4S1jEyY+QEanExWginJS/5KEai4ONXQCJmWEZCJj6WEaNOjBDftY+jCYZpgiSM
 Z3BIHtRTvC/lLjKrTPseZZ4OBw08DCSv4byLMFS8nN8sqDmxL/2oqVhQ9XRBovdPYze1QH
 M8/OgZTQ0omdXlUM/1IayFtnSo28ZY0lX9OrMI/3PH9bT+JXiQbJPYnCtwmsXP/Apk/q/v
 IbPeOmrTQ8TeEBL0abaIR7ZpmyOAOkttgl/bnN7aBcr9kxk0oveAS+xbsmyNP6IEJrrpmZ
 Sy23yaV0Yn+K8SLFK9fhWy75uyK2uOoJc6gfu0pOgJnbqsWZvLvfRbXUKqUlzg==
Message-Id: <20261114172523.5888-1-zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-ext4@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<adilger.kernel@dilger.ca>, <libaokun@linux.alibaba.com>, <jack@suse.cz>, 
	<ojaswin@linux.ibm.com>, <ritesh.list@gmail.com>, <yi.zhang@huawei.com>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Subject: [PATCH] ext4: use a stable source for the kmmpd thread name
X-Lms-Return-Path: <lba+26af89999+9ab7f2+vger.kernel.org+zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <tytso@mit.edu>
Date: Sun, 15 Nov 2026 01:25:23 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>

A concurrent MMP mount can make kvasprintf() warn about different
vsnprintf() return values while creating kmmpd. The call chain is
ext4_multi_mount_protect() -> kthread_run() -> kvasprintf(): the name
comes from mmp_bdevname in the MMP block buffer, which may change
between the two formatting passes.

Format the device name into a local buffer and use it for the thread
name while retaining it in the MMP information field.

Fixes: d6986ce24fc0 ("kthread: dynamically allocate memory to store kthread's full name")
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Validation: An x86 QEMU A/B run with the same test-only 1s delay in
kvasprintf() observed the target warning 201 times without this
patch. With the fix, no target warning appeared during a 600s
run. Standalone replay without the delay was not reliably
reproducible.

 fs/ext4/mmp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
index 4b18ddef468d7..09622862598b3 100644
--- a/fs/ext4/mmp.c
+++ b/fs/ext4/mmp.c
@@ -4,6 +4,7 @@
 #include <linux/buffer_head.h>
 #include <linux/utsname.h>
 #include <linux/kthread.h>
+#include <linux/string.h>
 
 #include "ext4.h"
 
@@ -277,6 +278,7 @@ int ext4_multi_mount_protect(struct super_block *sb,
 	struct ext4_super_block *es = EXT4_SB(sb)->s_es;
 	struct buffer_head *bh = NULL;
 	struct mmp_struct *mmp = NULL;
+	char bdevname[BDEVNAME_SIZE];
 	u32 seq;
 	unsigned int mmp_check_interval = le16_to_cpu(es->s_mmp_update_interval);
 	unsigned int wait_time = 0;
@@ -378,15 +380,16 @@ int ext4_multi_mount_protect(struct super_block *sb,
 	EXT4_SB(sb)->s_mmp_bh = bh;
 
 	BUILD_BUG_ON(sizeof(mmp->mmp_bdevname) < BDEVNAME_SIZE);
-	snprintf(mmp->mmp_bdevname, sizeof(mmp->mmp_bdevname),
-		 "%pg", bh->b_bdev);
+	snprintf(bdevname, sizeof(bdevname), "%pg", bh->b_bdev);
+	strscpy_pad(mmp->mmp_bdevname, bdevname);
 
 	/*
-	 * Start a kernel thread to update the MMP block periodically.
+	 * Start a kernel thread to update the MMP block periodically.  Keep
+	 * the name source on the stack so kvasprintf() observes the same
+	 * string in both of its formatting passes.
 	 */
-	EXT4_SB(sb)->s_mmp_tsk = kthread_run(kmmpd, sb, "kmmpd-%.*s",
-					     (int)sizeof(mmp->mmp_bdevname),
-					     mmp->mmp_bdevname);
+	EXT4_SB(sb)->s_mmp_tsk = kthread_run(kmmpd, sb, "kmmpd-%s",
+					     bdevname);
 	if (IS_ERR(EXT4_SB(sb)->s_mmp_tsk)) {
 		EXT4_SB(sb)->s_mmp_tsk = NULL;
 		ext4_warning(sb, "Unable to create kmmpd thread for %s.",

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.39.5 (Apple Git-154)
