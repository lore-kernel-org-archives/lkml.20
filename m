Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3623B42FE
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791100744; cv=none; b=oRoHkRyZ9mXu1gIQxGFhznh2iRAbFyqBm8QxEOcHY5d1NGazAGtPrhEpZdFAhAkd/yesIXHwd+c8O0x3secv1Anp5aznCsnf4aL+dOjFbRNSN3mSZ+fAWRBRmsgk43Rq9b47doumDjtIJXLVG8jCQNwNpur+VJQuMYkEeqfLKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791100744; c=relaxed/simple;
	bh=f2Fey+C1PK7Emdehb4zZxUkxvKmDRetMu/uNNJrLzrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fgzPCX8le1tcG/lF753hy24VDcNR8mEjWVFbBqFRgkfAMcBOvH92i+myYnbBJoSd69uZDFlJTnSi3hhzSdDm2nXk2zAyz2Vg1LdjVAW47mKBjKHfi7cgbUVnvsPMbhWDWUpbJh1giLdHySN+GyGbEv/LLKRATg1YL67CUQZ/tes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NDaZ905V; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NDaZ905V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=x+
	4CcQbjc5GSfjR7kAuyxIH37Pw3Rts15DYS0j73zAU=; b=NDaZ905VA+ChKGZ0HH
	PuPTkAuZ2EyQlXE0aIuuOca0fwCu9mnqSzo0YxrN9lSLLcg/rB609jVN9DGYvLPB
	hra+ZIqBRsoWTaoB4b+dz/fzkR40KxdcM4H+TLCC52d+NuAlBirHChTwdQaw3voG
	1/gQx5VjQoFA7wT8slvUgxYts=
Received: from wang-MACHR-WX9.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDXSncFB8JqFH4bCw--.28785S2;
	Sun, 04 Oct 2026 15:57:58 +0800 (CST)
From: Wang Wensheng <wsw9603@163.com>
To: pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	d-tatianin@yandex-team.ru,
	linux-kernel@vger.kernel.org
Cc: wsw9603@163.com
Subject: [PATCH] printk_ringbuffer: Fix space_used() when blk_lpos->next overflows
Date: Sun,  4 Oct 2026 15:57:55 +0800
Message-ID: <20261004075755.363989-1-wsw9603@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDXSncFB8JqFH4bCw--.28785S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1kZFy3uF43KF17uw43GFg_yoW8XF4fpa
	1FgF45ArZ2vF10qw43WrWIqw15J3ZrZa4kGr4YvrySyr1IqF1Iv34DKr10qF15Kr95J3y3
	XFZYvFWDt3WDZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRIkshUUUUU=
X-CM-SenderInfo: pzvzmliqt6il2tof0z/xtbC3QYOFmrCBwZtJgAA3h

Since commit 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data
blocks around") blk_lpos is treated as not wrapped when blk_lpos->next
overflows to the start of data_ring. We use the indices of blk_lpos->next
and blk_lpos->start to calculate the size of the data_block. This computes
zero minus a small positive value, resulting in underflow and an
unexpectedly large value. Simply using the original lpos with wrap-counts
solves the problem.

Fixes: 67e1b0052f6b ("printk_ringbuffer: don't needlessly wrap data blocks around")
Signed-off-by: Wang Wensheng <wsw9603@163.com>
---
 kernel/printk/printk_ringbuffer.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index d38e7c2f6887..46a79ec0940a 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1237,11 +1237,9 @@ static unsigned int space_used(struct prb_data_ring *data_ring,
 	if (BLK_DATALESS(blk_lpos))
 		return 0;
 
-	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next)) {
-		/* Data block does not wrap. */
-		return (DATA_INDEX(data_ring, blk_lpos->next) -
-			DATA_INDEX(data_ring, blk_lpos->begin));
-	}
+	/* Data block does not wrap. */
+	if (!is_blk_wrapped(data_ring, blk_lpos->begin, blk_lpos->next))
+		return blk_lpos->next - blk_lpos->begin;
 
 	/*
 	 * For wrapping data blocks, the trailing (wasted) space is
-- 
2.43.0

