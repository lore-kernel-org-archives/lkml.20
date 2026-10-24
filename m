Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852749;
	b=CJ+vVpf+HZ1YDELfbwEdk8SCdMHzv562uW/CW2koK7ETArwhzZHXxV5/w+IzgRUlylbh
	 i5nmX6iGT5UCqmmlRIH6OOLhxFgWck88vrVgCwsXlU9hRLTQvZ7V5WRkczmUSUnRUhUGM
	 bdVF9M867GH/fsZVJJnddQA1cqnolWcy+l/LyV2x/5EZXqyQ3JXBu7BnamrnT/Hw2ehG+
	 q8WsK81g9Ovs5gynOqxttzDzRmXOqwipnphXU3bnvzcjM2I33XB3YFv4znr2iNh/fhfrD
	 uCry2IUp8Vz+0SIWMvuSzTM2wAXdFZXNuCWbXrxk98DGUerd3Jittf33MPsMYWkwS9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zjXifzsuYpS0FQruVBIsTQMHaxQeJksSexJHZzpqVro=;
	b=x9+BOFL2EG1xtSLtA0kuun1JyrsOiUCKwh3bhuVruK29N6v5rREbLPHhU8ruzbkWZD3n
	 vqI8cj8FDKdD2xQejKXGvONfjo5gS+630hysdbmmDDChizeblIpBauEMsZjUYc5E1xhOY
	 BGvW3/hD602u303sins+kQ01AkEOHoUBAS9EGwIXOtcHvfjjC7VexKDbMmX7MH7zaWwDj
	 4uBBwOhJtq99OWofEomDa3xWA8xOhYMuh2rx2cS26711vU7WcjgzeFMu48gyDMEvGYlZs
	 ls68leoGlMV3E/eFgM4bYC33i05OTfvz79RBXM2ZHGuJKKQ6YSC+KUgkNxAiBaS106g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sZQCj41k;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C4606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 696C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sZQCj41k
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso977000f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792852747; x=1793457547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjXifzsuYpS0FQruVBIsTQMHaxQeJksSexJHZzpqVro=;
        b=sZQCj41k767rX6Ga5oQaHrf80CdrLuhs50LN8sctOyTArONZ1XmyK+8SPG9oEmiHFA
         Ir3Wi9sruGtPWEL8IRs5qx/i+8wsOnGZFtjUKwy4HhUiUjHgIADtOLI0adl14CxoOPdY
         vlxJRbD+s5K3OxhhDo/YqHYwJixTw6kKy4KOtp8F9QPH10XDgsjNqVnTFXi+ZV095UYa
         J8sSPfd9Gt1oSd5pWklimpOW4xKK7jmqAsKAe8Nt3r8gtx3BdlhogeahWzcBFUSvnCXi
         0AWS/UVfwpSwhg9ASnrVK75uOKh/qMaGP4yh3A3Zr70N9dtjG661I++loJhVi+w1Tixg
         k6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792852747; x=1793457547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjXifzsuYpS0FQruVBIsTQMHaxQeJksSexJHZzpqVro=;
        b=vKge0z4LKBIE/PZ8+iRvmK8AlywL5pt7tfqi82L8cb7xYn3df5jI7PvPL9LnFt+s/D
         BB7U+JJROJYsRnypLPp7Cs19cT0WQ7t84f0MLeElFxTcfjBSA4lqPvb10V5PY9UzpZyt
         iCicy4BQaav9zSfTIzTO7AwdC4RHeoxBjZKiPib6XSaS8lrVtKuzKG3nsO1cCu5Ox4me
         SqH2tyVbJ/ifao4tmlFFQFSsWXUe03fATeCuc/gPldGVJiRFxWIejYpConyCh7q0lN9f
         NhjGTuZp9JAFAedc++b60WvBvG6L3wWnSi4Rt+5cSb6KIs2wqs/RKEdx71S7biWWBS8r
         ssXA==
X-Forwarded-Encrypted: i=1; AKwUvByvAdwDqXl2yu5Lx1QHPNUfHR5/6kGI+6OrfrY86+s4zHo5+rhVsNRGusZ9wPJ92sccvTD0z6a5PFGZ6XY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3igmICZCmVE7U5qsV9iTVvqXbZ2E9jYs//pUXy0ri/dIpE+9u
	C9E2Bu5XKU/5NfLpLiN2r8mos81t1CPg6yWteEcnR0ZkLdMjP5IySqyR
X-Gm-Gg: AYBFou2kqP1bciUCeL6xO0K8o6uCNA8eGbpfKMgLnavCxW1R8unsUqJLu2BPABMEq8v
	cI4eOWsqoB2SdAUmYc8SMevASjXO5TJCTdEI5g1qw8YNvbcSkdO1rPBsob/UkMQWOJNPyKAvF3i
	hyNaAB+2XnTO1w+wsR1ImDuq4CbPSEGoWdyNyhnpF1Gp8ky7aneCXgAEiENL75Wvw4HRwnyL84X
	bPEAw9YGZbYRiinZyeu7B+sNhwcsQ3ASg5E6WdGp6ByT4IjTGF3NH29snSNqZVHbRufiANvoIB4
	rqRv3G7HmHnKubJkJblUbbHi0mRy1i/DMnq8bDHeh7t7MTCT04oYnkkSnRsj26Ml5EO1Xlpyjhk
	oYu9yxLn4/Bm8+WQcNoUP7PFENNgvbWyJTed1TKYWCCTOeCrTtzLy3V7fDFihcSFEG6/g+IItJi
	hzg0VSI8QEKnoqnPsxnAslcY279oiFmJOCDnQM4m1Lm1p1PRO6nhh73b1ObDOJaqODV/Sxh0Cqk
	1TTA2sfDld5TkwrD8tsv34lrigbCEhqsYKyminlDLA97T2oB1KXno3ou4Lo4fd+fW2D5xyIZlRI
	VmCQ8ARHUc3j4kK0hm0BOrcuRFKFSgm3LQtosTwmpey/e4MGh0za4A==
X-Received: by 2002:a5d:6246:0:b0:487:40d:af33 with SMTP id ffacd0b85a97d-48e3eb834d0mr2415372f8f.13.1792852746535;
        Sat, 24 Oct 2026 07:39:06 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.102.66.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm4466723f8f.42.2026.10.24.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:39:06 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: trondmy@kernel.org,
	anna@kernel.org,
	cel@kernel.org,
	jlayton@kernel.org
Cc: neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	syzbot+ae55a0fac80c73c938ac@syzkaller.appspotmail.com
Subject: [PATCH] sunrpc: fix null-ptr-deref Read in xprt_reserve
Date: Sat, 24 Oct 2026 15:39:02 +0100
Message-ID: <20261024143902.341-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
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

syzbot reported:

BUG: KASAN: null-ptr-deref in instrument_atomic_read
     include/linux/instrumented.h:82 [inline]
BUG: KASAN: null-ptr-deref in _test_bit
     include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: null-ptr-deref in xprt_throttle_congested
     net/sunrpc/xprt.c:1708 [inline]
BUG: KASAN: null-ptr-deref in xprt_reserve+0xe2/0x2c0 net/sunrpc/xprt.c:1948
Read of size 8 at addr 0000000000000628 by task syz.8.3118/20390

Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 xprt_throttle_congested net/sunrpc/xprt.c:1708 [inline]
 xprt_reserve+0xe2/0x2c0 net/sunrpc/xprt.c:1948
 __rpc_execute+0x526/0x1280 net/sunrpc/sched.c:947
 rpc_execute+0x1c1/0x390 net/sunrpc/sched.c:1023
 rpc_run_task+0x4a6/0x660 net/sunrpc/clnt.c:1269
 rpc_ping_noreply net/sunrpc/clnt.c:2944 [inline]
 rpc_create_xprt+0x452/0xa90 net/sunrpc/clnt.c:494
 rpc_create+0x649/0x900 net/sunrpc/clnt.c:619
 gssp_rpc_create net/sunrpc/auth_gss/gss_rpc_upcall.c:107 [inline]
 set_gssp_clnt+0x188/0x2d0 net/sunrpc/auth_gss/gss_rpc_upcall.c:131
 write_gssp+0x21e/0x310 net/sunrpc/auth_gss/svcauth_gss.c:1423
 pde_write fs/proc/inode.c:330 [inline]
 proc_reg_write+0x1e9/0x2e0 fs/proc/inode.c:342
 vfs_write+0x296/0xba0 fs/read_write.c:685
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The GSS proxy client setup races with sysfs. xprt_switch_alloc() publishes
the transport in sysfs before rpc_new_client() sets xprt->main = true. The
sysfs offline handler rejects writes when main is already true, so
userspace can set XPRT_OFFLINE in that window.

The initial RPC then runs with the only transport offline.
xprt_is_active() only rejects a transport whose refcount is zero
or whose XPRT_OFFLINE bit is set, and a transport that is still on the switch's
list always holds a reference.

xprt_switch_find_first_entry() returns NULL, rpc_task_get_next_xprt()
returns NULL with it, and since rpc_task_set_transport() returns void,
the task continues with tk_xprt == NULL until xprt_reserve() dereferences it.

Mark the first transport as main in xprt_switch_alloc() before creating the
sysfs entries, and drop the assignment from rpc_new_client().

Fixes: e091853ebdb4 ("SUNRPC mark the first transport")
Reported-by: syzbot+ae55a0fac80c73c938ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae55a0fac80c73c938ac
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 net/sunrpc/clnt.c          | 1 -
 net/sunrpc/xprtmultipath.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index 6cedc824cf82..aa9f9c185c02 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -419,7 +419,6 @@ static struct rpc_clnt * rpc_new_client(const struct rpc_create_args *args,
 	}
 
 	rpc_clnt_set_transport(clnt, xprt, timeout);
-	xprt->main = true;
 	xprt_iter_init(&clnt->cl_xpi, xps);
 	xprt_switch_put(xps);
 
diff --git a/net/sunrpc/xprtmultipath.c b/net/sunrpc/xprtmultipath.c
index 3ba818d637be..5e2d43d6c643 100644
--- a/net/sunrpc/xprtmultipath.c
+++ b/net/sunrpc/xprtmultipath.c
@@ -159,6 +159,7 @@ struct rpc_xprt_switch *xprt_switch_alloc(struct rpc_xprt *xprt,
 		atomic_long_set(&xps->xps_queuelen, 0);
 		xps->xps_net = NULL;
 		INIT_LIST_HEAD(&xps->xps_xprt_list);
+		xprt->main = true;
 		xps->xps_iter_ops = &rpc_xprt_iter_singular;
 		rpc_sysfs_xprt_switch_setup(xps, xprt, gfp_flags);
 		xprt_switch_add_xprt_locked(xps, xprt);
-- 
2.43.0

