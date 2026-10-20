Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458375;
	b=rOWn+1z/7OKL5Q2yp5Z0ZLNDP+DSE0AOz4ke2n0xKFakE5BVHJv0QjO7J+GWI/VXWvjJ
	 wIB5DXCO4lYBJUMbnMnp0vHsPf3o65XElBA2emSR3XSjj/oKwfN5Ilh5kPH1DaIkcUHrx
	 qd+YGC93Av1S9lsmBghy7YSvOq738V5r0TOgim4rNQsOwADMAOnTU0YBqGfyZg0POedEo
	 n0icJO/nIs8W0wDKLqiIeVBoTgtjD2Us6iEzEz35F3U4jO+vaHI9mngTbPTkcfKbqidfQ
	 Vu1M1MNBmkvvi6sTmD2wjYm8RBGwQXamcEGr4mnxLqh1tgetQPu4Pl7EEvE7GbyuGWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458375;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RQHHeILqXjmX+mfW1A9yvucAhqq7v1ohWGWk5W4nLY0=;
	b=LuwJod6eOvsbwuWKsZ/adRbdGeRHxUqj9zzsNYHI/pVpOVghw/wnYP9zZR/6kldC8g6V
	 z9BXEW5K68cMrif1s1J7Vm2cmcFckzPLN0Hk6nQlXlbcCtkYNgaDBdE7ROVD7ZSwxDtXF
	 kmaXQGanmhE46j1hxiScBR3wk47JuuE34rCTlZt/T/9bXs6hF1sigQYpZa9Jw4YhBNWba
	 fv0lSLgUd/HxzzpIRpeuX+JGVdNpwgwDHJq+eIec6BqKSRfvGntc/258qppmeP8J12cUT
	 GU2nRJ6o2Ai+auCJLJF8uy0kiehT2ssXb3IP1U03jY1y/mjEmrUyUTi0jxr+Ezf+r5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=wjjEEMjf;
	arc=none smtp.remote-ip=202.108.3.25
Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B356606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B356606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=wjjEEMjf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792458373;
	bh=RQHHeILqXjmX+mfW1A9yvucAhqq7v1ohWGWk5W4nLY0=;
	h=From:Subject:Date:Message-ID;
	b=wjjEEMjfByclvBmcHAQkzGeuduxeq/L+SbdQP1htObmajzjqoboLR2FuE4JqnNEG3
	 SiIZ5tV7Oe9YzRJYKLcxa7BAALOBkXa8YN8PoeDTMO3gmcryW2L7PQmxnYRUdlqY+C
	 YQzZIXA/FvCeBUASaBTvp2xJImxeifUXiFTZzSDI=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AD6BE7800000895; Tue, 20 Oct 2026 09:06:02 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8500326816451
X-SMAIL-UIID: 9968DE8ACB764C1CA8CA68D509F5A2EC-20261020-090602-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	kernelfans@gmail.com
Subject: [PATCH] kernel/reboot: Avoid potential deadlocks during suspension
Date: Tue, 20 Oct 2026 09:05:59 +0800
Message-ID: <20261020010559.23031-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ad65cac.5a04d468.191e0a.001d.GAE@google.com>
References: <6ad65cac.5a04d468.191e0a.001d.GAE@google.com>
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

Invoking reboot with LINUX_REBOOT_CMD_SW_SUSPEND causes kernel/reboot.c
to acquire system_transition_mutex and invoke hibernate(). hibernate()
calls lock_system_sleep(), which sets PF_NOFREEZE on current and attempts
to acquire system_transition_mutex again, potentially hitting:

WARNING: possible recursive locking detected
--------------------------------------------
syz.3.5755/5950 is trying to acquire lock:
ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: lock_system_sleep+0x49/0x70 kernel/power/main.c:71

but task is already holding lock:
ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot kernel/reboot.c:774 [inline]
ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __se_sys_reboot+0x223/0x460 kernel/reboot.c:738

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(system_transition_mutex);
  lock(system_transition_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.3.5755/5950: 1, last CPU#0:
 #0: ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot kernel/reboot.c:774 [inline]
 #0: ffffffff8fc04760 (system_transition_mutex){+.+.}-{4:4}, at: __se_sys_reboot+0x223/0x460 kernel/reboot.c:738

Call Trace:
 lock_system_sleep+0x49/0x70 kernel/power/main.c:71
 hibernate+0x162/0x680 kernel/power/hibernate.c:784
 __do_sys_reboot kernel/reboot.c:816 [inline]

Move the suspension operation outside the scope protected by lock
system_transition_mutex.

Fixes: 55f2503c3b69 ("PM / reboot: Eliminate race between reboot and suspend")
Reported-by: syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1f0fbc2561b3e5d51b91
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 kernel/reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 5b9691f45f5f..bc2716677a6c 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -813,8 +813,8 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 
 #ifdef CONFIG_HIBERNATION
 	case LINUX_REBOOT_CMD_SW_SUSPEND:
-		ret = hibernate();
-		break;
+		mutex_unlock(&system_transition_mutex);
+		return hibernate();
 #endif
 
 	default:
-- 
2.43.0

