Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0EC478E36
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349749; cv=none; b=SNjNcucaOPSObhjOn6GPTLOMsi/NfsBASvp7+gb4r1RqZqEQAZ+bWgNF9QTKU5YBAyLMMLQ4reeZchdD8s+8VwZ6jND31snS+s5sWMtXy3n+BQgrU9OUU/PDlJ+BIj/B/n0kfkNTY+drBNl+2Hy5Iy4k/8rrNuiT46kZVSyyaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349749; c=relaxed/simple;
	bh=TDAFSqoSbHFh95rB0LIgsJ48uWR8PAhA/zJZQBPAR/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ly0JfSNZzQgkjoBCA1h5O4KvUlDPPKBiiidI8nYZZdrBNtr5o31u5zs0H7fNt57H+EJZmiMsW5t3FtuFgNv5rzJsh/ghfkFC9yC10bXco5h4JTkmGWm72+177ByudUqq8DK/XLZoP3Xb6GiHGB6Y9dKCdnkJnusPJDV9DImJPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JwkBxjhd; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JwkBxjhd"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788349733; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=WJl9QsNMfRn7b+wE7EAl9209u1Mo9T068wWotLj8qpc=;
	b=JwkBxjhdz4YjapW9j/blkbixFH30aKpUxdrhS8RYFEx+Grr/cwPKbi7D2wA8BODwNs/qFsKW3EFfub0ON2pqb1SG5pVIycnu0AhJ+FDU+g9pjia1VO22LSgYGy2jf7BCeCSVJ70IiUwtd70PLsISzOAfSC2+S4DU2MVxrs/d5AI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XACTT4X_1788349732;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0XACTT4X_1788349732 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 19:48:52 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH] panic: remove the unneeded panic_print_get()
Date: Wed,  2 Sep 2026 19:48:51 +0800
Message-Id: <20260902114851.77062-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

panic_print_get() was introduced in commit 2683df6539cb ("panic: add
note that 'panic_print' parameter is deprecated") to print out warning
message of the deprecation of 'panic_print' on read access.

Since commit 90f3c123247e ("panic: only warn about deprecated panic_print
on write access"), panic_print_get() wrapper is not needed anymore for
read access, so remove it and use param_get_ulong() instead.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 kernel/panic.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 7dda841c16f9..50715f14cf04 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -1216,14 +1216,9 @@ static int panic_print_set(const char *val, const struct kernel_param *kp)
 	return  param_set_ulong(val, kp);
 }
 
-static int panic_print_get(char *val, const struct kernel_param *kp)
-{
-	return  param_get_ulong(val, kp);
-}
-
 static const struct kernel_param_ops panic_print_ops = {
 	.set	= panic_print_set,
-	.get	= panic_print_get,
+	.get	= param_get_ulong,
 };
 __core_param_cb(panic_print, &panic_print_ops, &panic_print, 0644);
 
-- 
2.43.5

