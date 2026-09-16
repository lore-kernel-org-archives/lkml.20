Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FA5396560
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524011; cv=none; b=ScOdUWYRCPIoTicIm/84llyQR8nkJ+K8CIuP1BxXty0bj78AzNItMDlW/B+RUL44lbgviTnQQlJfNrg4mA1PwCEi7DmYa9toY2IGn7HuDpK/63Jc5b97qMhvqXjAlqnDi8jCS02t7pzQlTbtSkf7W1juJQ9/tI1YjyNBLfBF3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524011; c=relaxed/simple;
	bh=qe6gT/B8AdJ9GEI27yKuk4pEuLTp+qaz0YZDv0PhRCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QCMU2K4b53JFDIKdBM2SO7X2FWNAkogv8Obb/943KbpjOC11aL0uXuiUT4njks//uLyVbSFQx+fLmaHJah1WT/tcDVXV5s6e8BnGihTbjDhSzIVx4n1iH2I4mmcGYCFy3W9mS81oBEF2+0c//Tr706QcZZ2xduzXSTdkQmj145I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KAq1ThIi; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KAq1ThIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ts
	ffOyJsTCa2PCrNPQWUKA+BUZNCXXfh10o+70DPD60=; b=KAq1ThIiysshK3/RN2
	OiNct9EZhhhUUXem7FM1gqXjSIdPMLDkqJJ1KpPMpw+b6bzWJkxDvNOzMqop2bHO
	2LRSKGJX9VWCFlpeqzC94FWMBPc2aFqndYRJSL71P4sClUl8/wsnbgotXV4zVl3V
	rZJosrdtCW5vNQ/xxhDX+361s=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgB3WgIV+Klqz9C6Sw--.65184S2;
	Wed, 16 Sep 2026 09:59:49 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: linux-kernel@vger.kernel.org
Cc: quchaosheng000406@163.com,
	syzbot+37ca7ae3e98cb65c3209@syzkaller.appspotmail.com
Subject: [PATCH] kthread: Report cpumask allocation failure without warning
Date: Wed, 16 Sep 2026 09:59:48 +0800
Message-ID: <20260916015948.113062-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgB3WgIV+Klqz9C6Sw--.65184S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFW8Jr4kurW3urW8XF1rCrg_yoW8Cw1DpF
	WUKryUK398Ar4j9w40g3WvkryrGa95Way7GFW7Xwn3Za9rWan5JrZ8tFyUWr1jkrWDKF48
	Xr4DX34ayws5AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUU3ktUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-xZIvWqp+BbbiAAA3i

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
 
-- 
2.43.0

