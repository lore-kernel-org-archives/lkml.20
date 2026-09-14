Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FE45C6E6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387819; cv=none; b=qxLM9VAMaUIlXTPU4QyExwHb73hO+qUF+PfSNJHtBRIXVZ0Zj1Q+qmaQmQmH4xwpRrS89Yg8RepkjhNe+E0M6T4CBB+Vt03o5+BdQz0v64UMz1pvNtKG7ls/J8f0JdQauIyY6I6wnvQnO7lwsFU/ohTaFq2sbX6ybenNh6a4ex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387819; c=relaxed/simple;
	bh=70iFBB7WzqY3q+n7ju9gH+TUJub3FQ4IsJrHRk/Q8Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPYoJ92VCKjQ1yy2sd6wkZoO906fzfskFMN4bofr0YgMdd5UPCtyfnyPCp6AV4/7opap8eYTdqDceNaBL30FntRO0ihk9qnDuKE/dklqwuAfVuPzXd2UOzPY0sUhU1oplXamEHi/3MTBydbSH6nhazBU45P6v5Kz5wkJTJxHjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=E5B1jbMs; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="E5B1jbMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dG
	cNiBqDHphj9U/gSQgVhiqonf5XECTGFswGlNtYk3I=; b=E5B1jbMs9R4DjdvxxZ
	qjZZxmDNOQgGsxw56QSFGKGAsWqDLjyLwOeHhDNDzZwzQ/KYmIEBXZLK3uLMCFlk
	z+L6Au39W8MqVmNpzBbKgu3Lh/4svbXWrHMLFXZBaK5LJnKPsyXSmp3CG2zYRbIl
	Ps0vkYFrrdr+02+b4iQ6cCn8s=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3HzsF5Kdqp6amAg--.24394S5;
	Mon, 14 Sep 2026 20:09:43 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Cc: Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Quchaosheng <quchaosheng000406@163.com>
Subject: [PATCH 2/2] kthread: Drop warning on cpumask allocation failure in kthread_affine_node()
Date: Mon, 14 Sep 2026 20:09:41 +0800
Message-ID: <20260914120941.63968-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3HzsF5Kdqp6amAg--.24394S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW8Jr4kurW3urW8XF1rCrg_yoW8Cr4Upr
	W0gryUt398tr18Zw4jgan7Cry8Ca9agayxGFWxWwn5Aa17Wa1kJrZ0qFyjgw10krWqkF48
	tF4DJ34ayw4DAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zieMNUUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-we+NGqn5Aft9wAA3G

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

