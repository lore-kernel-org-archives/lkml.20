Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127838B149
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436582; cv=none; b=SUkBLB7+AQvRGoa64yvdNuPUlQUS3pkdc/1vZyhMU73kz+Vtj/0024ZBprGlix8UKZ/kwPIOEWAxznUb53Q/PY8mXeRN5uS+v44firBAuf9P8VJU7qP48WbyljlIkk2bMwhzkQyQI75sjKhKfbCpoS6LjB9lbbhcOUqOiCDg7ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436582; c=relaxed/simple;
	bh=fikEazmguTbAicAHceifue/ALKdEO7W8Ge1KUVOgKWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=URDHCuxMpUStEIrryBW+DBUj/NkMlALUaiWYYLQuQrTqnKNJKNurzRKkt0k8cu602HQbmSeVZqVHImxdDA2aV8lQCrjlWsZMVFGjBk4t7Qh4stS08EhjeifD6JXQ5GDfgQ3NMThRGISo3TBCR86s5t+sciquJazGOoURkvOwtLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VthrEd9k; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VthrEd9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u/
	alqvnh/GxeOXpAtYi6Dr7LBQxiHFfAGn9Z5zuX5Bg=; b=VthrEd9kPGEyCSoemw
	7EJBhPWvh7AGUoJFWv/2gfIqhqRBUZ6aBMljbz+TMnm19NbS6lOTrw7OAuDk+R8L
	ej8wBjbrkl1Ci2dA5qmhzKfL0rzeEsvJlyCNczX1Ycn93XcPnZ8gS4GQIc/u5nyS
	QoipC1Lwb9tYVy986NXtBT+Ck=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCHz_V+oqhqt_DUQA--.36984S5;
	Tue, 15 Sep 2026 09:42:24 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Cc: Waiman Long <longman@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Quchaosheng <quchaosheng000406@163.com>
Subject: [PATCH v2 2/2] kthread: Report cpumask allocation failure without warning
Date: Tue, 15 Sep 2026 09:42:22 +0800
Message-ID: <20260915014222.13423-2-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCHz_V+oqhqt_DUQA--.36984S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW8Jr4kurW3urW8XF1rCrg_yoW8tryfpF
	WUKryjk398Ar4j9w40g3WvkryrGa95Way7GFW7Wwn3Za9xWan5JrWDtFyUWrWjkrZ8Ga1U
	Xrs8Z342yw4kAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zN2NtUUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-wCNA2qoooDmvQAA3K

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

The failure is not silent though: the early return also skips
list_add_tail() of kthread::affinity_node, so the thread never joins
kthread_affinity_list and kthreads_online_cpu() will not fix up its
affinity on a later CPU hotplug.  Keep the failure visible with
pr_warn_once() instead of dropping the message.

Reported-by: syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=37ca7ae3e98cb65c3209
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
v2:
 - Keep the failure visible instead of dropping the message silently
   (Valentine Schneider, Waiman Long).  A WARN is not appropriate for a
   recoverable GFP_KERNEL allocation failure, but the early return also
   keeps the thread out of kthread_affinity_list, so report it with
   pr_warn_once().

 kernel/kthread.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index a3f95c904..b59fa7c7e 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -356,7 +356,14 @@ static void kthread_affine_node(void)
 		return;
 
 	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
-		WARN_ON_ONCE(1);
+		/*
+		 * The thread stays out of kthread_affinity_list, so a later
+		 * CPU hotplug will not fix up its affinity. Report it, but do
+		 * not warn: the allocation can fail under memory pressure or
+		 * fault injection, and that is not a kernel bug.
+		 */
+		pr_warn_once("kthread: %s: no cpumask, node affinity not set\n",
+			     current->comm);
 		return;
 	}
 

