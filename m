Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CA3290A5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787998761; cv=none; b=lvv9zV5sK4w11Kfx8+QR/i24P0fQJemdMde58Ef/N6XSdonAEK5ItmK4CeAdLtgCEkpTk1DxkA1aS4GfD21fW51LvmZ6ltmhpyYCaBdnwAqbjYlUDNDk1W2INrHBODoGhvvggcjX7bF8/K2muJY+9oEXTSUiGlkLpipQ9JkGRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787998761; c=relaxed/simple;
	bh=uWiCJRfkz+8wlvQiwRpUOg5mVsQG8h4166rBb5yTUcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBHvmgZtrzjprFLBfOrulvhrKKXm2YzUOfVQpb2tYeEoohfrSw+0orb2ifsVKxFIOF37zik4SiMbuMt0wt/mC6jJjOa5X17OWokIFqxFYfDW2B9prsZRf+wdq/9+WIq6YSFS/W3Uev+XrR5Ku6T74fl4LUvjLwma8N8XC8pnRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTNsY1op; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTNsY1op"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8534d507f59so1971486b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787998759; x=1788603559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e6pLNBZrAnN+v62n4ihU9SPJ7Z60nyT7aNzFPAXTs2g=;
        b=kTNsY1opugBXS0J9NXT+tHBE1bSmgMhe0YhV/IpnUB8lC/YpkXEPKameU9A4D7oBxK
         hE0TairZI0jUW+il7F5m1Jg2+U+kyNGQjca85CIDE6LTrhpdrPyIJKIAw8jYRC1v7YoO
         fJfDcb5FIDeCDA5P9eAbmKXfZYy4tgvI3gRjauJLxqEXjZe9N4jCZN0X73ZB8jklE0Zj
         7TdpU2jpzIHi10gqZ24Zlwsh8dQTbUUQTmUQkRaPax67UII6CdlBKlztneTm6V1JFabM
         ZygKMCFWi2V53rwNtHojaZS2lAI7imsQeDv0PGgx7t3mhE1HP0j+aj3n1AfzXHpnzQaj
         yNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787998759; x=1788603559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6pLNBZrAnN+v62n4ihU9SPJ7Z60nyT7aNzFPAXTs2g=;
        b=Y8I4e2nrf8TpRaVcNGUPUeQrd3I1hlL83FLjM6B4Sgue82EvEwFLUrZMlAuKaR3xBp
         J8u3Ky8DLeTwK/6q00dJxJRAnDWYOuJt2PrA2FyVN844eYLfjkUlqk+/j49Ng1XlwrVt
         sCz3ab08ikEszo89ZQNJ6Mg8x5hDqbnuc0HLYp/Pp6b74kDhpuwBP456LC3keEvz9W+u
         aqbIEAd1OcB71lXju0YyNjnVUHuIRE/77Cazcbm8SHgM4dYfGTOm9ThPMGFT37A7I9B+
         j2BC83qoykOnA3O6WiOBu1YoLg2NBQTjuaIphlCZab1WryBCjkqaHiOY1fM1vS1w24wL
         umJA==
X-Forwarded-Encrypted: i=1; AHgh+RpK46+Lnf34i70YoWkYJRM28/itcwu/BddKpeFV3RbyosrUUkThC3HpzBJdn9At82nc3t0S/NvwuyplCmo=@vger.kernel.org
X-Gm-Message-State: AFuF++lTCp7wyh8qxEqEAtBeaGX+TP6ICi14KmLPSctYHjHANlh6xtiv
	bGJV1qwlpzpx7TAVudsceaL0wpjsCV8jr8OopISNOeMuNH+Ag9W0Zvj3
X-Gm-Gg: AR+sD13ZxswYd3SaUQs6TnhTZ0Qbhzf+YgoXSUvcQnCYtADDl56dWNZMHJKkiWbFLxE
	XmRTRoWMX2p4sg6bj/yyhc/wF/jnksQn8TL4+dW1vXnUK59pzfikulqgoyC3nYzMojgFyYYEBpj
	JgLBZ36cfBpzNryKTge+9R1i9PcLyEL3lcWcXzbgh3o33NlY5UCMYxVTD68cttFsAooSU357DH5
	13+oDpcSOM7dWblWQlzMUD8q3IvnblaHJrjPgQncpRjtk3lno1HyshZS0uk+eQtF7RGGPoxWatX
	E3NTQm+URK0TbM3fFTfLA7uECxQdN26th2n9glnLUzIB4Et6Qf4wlKN6e0bcYuz1jtVlb5AD+EA
	CpFgxoGyqwt9fMqolSdESiyu/iP1ETSS969/36X+GOhQLQ1C2bfjvos1/GMlStEYWHCgJYY+R/7
	fQv+hNYnLglbD70gQxQlBCaoK6wbEpdcO8Ay0jsFvS8E98vxidumUKUJ5BMB83D4yvHYyXDOAAE
	g==
X-Received: by 2002:a05:6a00:a221:b0:857:7337:5db9 with SMTP id d2e1a72fcca58-85773375f9cmr7598086b3a.23.1787998759043;
        Sat, 29 Aug 2026 03:19:19 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49ed7asm1445775b3a.8.2026.08.29.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 03:19:18 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	syzbot+0aee5e8066eddbbe7397@syzkaller.appspotmail.com,
	syzbot+e8b3520b53e78e90034e@syzkaller.appspotmail.com
Subject: [PATCH] exit: hold a reference to thread_pid across proc_flush_pid
Date: Sat, 29 Aug 2026 19:19:05 +0900
Message-ID: <20260829101905.4163730-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

release_task() keeps a task's thread_pid across the point where it
drops tasklist_lock and calls proc_flush_pid().  The commit named in Fixes
removed the PID reference.  It assumed that the PID cannot go away before
this release_task() invocation calls free_pids().

That assumption does not cover references represented only by PIDTYPE
links.  Process B can still use exiting process A's PID as its session and
process group ID.  A is reaped with wait4(-1); PID-specific waits take
their own PID reference and mask the bug.  After A's reaper drops
tasklist_lock, B can call setsid(), remove the final PIDTYPE links, and
queue the PID from B's own free_pids() call.  The RCU callback can then
free the object before the reaper dereferences pid->inodes and pid->lock in
proc_flush_pid().

A timing-only diagnostic forced this legal ordering on final v7.2.  It only
gated the real setsid(), RCU callback, and proc_flush_pid() operations; it
did not change PID links or reference counts.  Three of three fresh KASAN
boots reported:

    BUG: KASAN: slab-use-after-free in
    proc_invalidate_siblings_dcache+0x3e2/0x3f0
    Read of size 8 by task h7_pid_reaper/1921
    CPU: 0 UID: 65534 PID: 1921 Comm: h7_pid_reaper

    Call Trace:
     proc_invalidate_siblings_dcache
     release_task
     wait_consider_task
     __do_wait
     do_wait
     kernel_wait4

    Freed by task 0:
     kmem_cache_free
     put_pid
     delayed_put_pid
     rcu_core

    Last potentially related work creation:
     __call_rcu_common
     free_pids
     ksys_setsid

KASAN identified a 144-byte object from the pid cache and located the bad
read 80 bytes into the freed object, matching pid->inodes.  Restoring the
balanced PID reference completed without a KASAN report on three of three
fresh boots: the concurrent RCU callback reduced the count from two to one,
proc_flush_pid() completed, and the balancing put_pid() performed the final
free.

Public syzbot reports have independently observed proc_flush_pid() reading
a freed pid-cache object, including a last reference released by a proc
inode callback.  Pin thread_pid explicitly so every last-reference path is
excluded until proc_flush_pid() completes.

A tested source reproducer is available privately on request.  No
controlled read or write, information leak, or privilege escalation is
claimed.  The mainline patch applies directly to v6.19.y and newer;
v6.16.y through v6.18.y need a context-adjusted backport.

Fixes: 0a36bad01731 ("release_task: kill the no longer needed get/put_pid(thread_pid)")
Reported-by: syzbot+0aee5e8066eddbbe7397@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0aee5e8066eddbbe7397
Reported-by: syzbot+e8b3520b53e78e90034e@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=e8b3520b53e78e90034e
Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for 6.16.y-6.18.y
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 kernel/exit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 97686af895013b..461e2834fcb45f 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -261,8 +261,8 @@ void release_task(struct task_struct *p)
 	pidfs_exit(p);
 	cgroup_task_release(p);
 
-	/* Retrieve @thread_pid before __unhash_process() may set it to NULL. */
-	thread_pid = task_pid(p);
+	/* Pin @thread_pid before __unhash_process() may set it to NULL. */
+	thread_pid = get_pid(task_pid(p));
 
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
@@ -291,8 +291,8 @@ void release_task(struct task_struct *p)
 	}
 
 	write_unlock_irq(&tasklist_lock);
-	/* @thread_pid can't go away until free_pids() below */
 	proc_flush_pid(thread_pid);
+	put_pid(thread_pid);
 	exit_cred_namespaces(p);
 	add_device_randomness(&p->se.sum_exec_runtime,
 			      sizeof(p->se.sum_exec_runtime));

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.54.0

