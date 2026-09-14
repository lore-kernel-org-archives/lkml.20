Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9AF45199D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387811; cv=none; b=aaiunLjXhMc6I6Hd9Qijh6OdeYQDd7iDkPXnVV1otrWmwsxbsUNOT9Kf1vE7PHu6icQHwf8Wo0gEYpIx78dPI5DIpRuOLBSOffuWgoFqAh8YthOSCGUyQd8qxNSLEQf+IVh+NIkZ9trVds6bOQtX4dBqJkOSBpLKhu8S4kbE2t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387811; c=relaxed/simple;
	bh=70iFBB7WzqY3q+n7ju9gH+TUJub3FQ4IsJrHRk/Q8Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMkqBxt2pRwR2V3+VQn3wzyD/4qIF38O2wxuywE0kCcW62a5Dvjy8uD+ZDDPTUGTdVk7rXBDPBscWmG5xrhm1AhsoHfyWhZmA4Gz3B2XRAdZ9QQhD0S/JWjl8UG0CDf1EIJ7nbO1Zq8w3Ya8zYWpyUbGqi9SQDP7J3vU5jOI//c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MHMG2Bzs; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MHMG2Bzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dG
	cNiBqDHphj9U/gSQgVhiqonf5XECTGFswGlNtYk3I=; b=MHMG2Bzs5PQeDkQ87o
	Y2c+jFLh/JBzTJIu9mNMY9b+PGIPx5zN5ZzQ4VYGXV7nr2vgstSbLpwO7DzWwKz5
	0spVuNiOv4g67OykRpFkdi9yueTewsLP4+iOpNk4Gxo0Sa1sjzbnTB3rkDRyqWxK
	pqKbvpFZZ6QA1i3hbeThdLrYQ=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBnUen746dq02GAQA--.31592S5;
	Mon, 14 Sep 2026 20:09:34 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Cc: Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Quchaosheng <quchaosheng000406@163.com>
Subject: [PATCH 2/2] kthread: Drop warning on cpumask allocation failure in kthread_affine_node()
Date: Mon, 14 Sep 2026 20:09:31 +0800
Message-ID: <20260914120931.63940-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBnUen746dq02GAQA--.31592S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW8Jr4kurW3urW8XF1rCrg_yoW8Cr4Upr
	W0gryUt398tr18Zw4jgan7Cry8Ca9agayxGFWxWwn5Aa17Wa1kJrZ0qFyjgw10krWqkF48
	tF4DJ34ayw4DAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zieMNUUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5B68Mmqn4-5hawAA3u

kthread_affine_node() warns when zalloc_cpumask_var() fails:

  if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
          WARN_ON_ONCE(1);
          return;
  }

The allocation uses GFP_KERNEL, so it can fail under memory pressure or
fault injection.  A failed allocation is a recoverable condition and not a
kernel bug, so the warning is noise.  syzbot reports it for a WireGuard
NAPI thread:

  WARNING: kernel/kthread.c:359 at kthread_affine_node+0x200/0x2e8
  CPU: 0 PID: 5207 Comm: napi/wg2-0
  Call Trace:
   alloc_cpumask_var_node+0xfc/0x138
   zalloc_cpumask_var
   kthread_affine_node+0x148/0x2e8
   kthread+0x29c/0x3d4
   ret_from_fork+0x10/0x20

The other two callers of zalloc_cpumask_var() in this file, in the kthread
preferred affinity and kthreads_online_cpu() paths, return -ENOMEM without
a warning.  kthread_affine_node() returns void, so it cannot report the
error either, and it only skips the affinity setup for this thread.  Return
early without warning, matching those callers.

Reported-by: syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=37ca7ae3e98cb65c3209
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 kernel/kthread.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index a3f95c904..f735a74b6 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -355,10 +355,8 @@ static void kthread_affine_node(void)
 	if (WARN_ON_ONCE(kthread_is_per_cpu(current)))
 		return;
 
-	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
-		WARN_ON_ONCE(1);
+	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
 		return;
-	}
 
 	mutex_lock(&kthread_affinity_lock);
 	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));

