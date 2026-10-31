Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420112;
	b=FOVk/vW5YSM+CN58OkgI/aBFiRRcf/a75JkWER6iCf2pEbpr2kzKB+lKVCzUh4hOFVjy
	 jZhJ5qgDQRKHjrM5BmDqzNepTsbHcXH5S43xDcF3D4jtbWNZJDWqW712oZECwgqNirTR+
	 hPZY0XoSR+pmVdUlz0uimJpyiVCzznVFGtQb15cEXYNuSkd2fCuk5xHzhiwTxTiXucyAg
	 aJ864hwTBPaaZBXduvCACgURXD3GiyjBFRWGBbGe0h8ZWB1bH4vR200k/C27pZTWybJTG
	 7bj22foD9VDsKYn3D4TKXUbM5T+JbghfqYPv8rSl0THsZb0AYmCZbtqpLeraBeQi6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Vfz1DbncV56dq7v1HZ9cnjldjr/F1zhzitP90vTq5E=;
	b=jKdsy8jtDaBJ5U070nfJO/wMUdV6ISELn+btx43iThBLBdzsQRku+U+5bib1+3HvecrI
	 AeBdmL3fEcWo9OOzmce+Z7+8dnW/6OIts4DeXCKgPHQF21sH62UCmund8WVHGlDGEo+KE
	 739vWEcVKxC3hDFSvdNRPmSbE81yPhjmzV/VzAkMLqOVvrZOfuClwekcwDE/kOEp/yYQl
	 Jq9kst6TLs2RSm4u6jTo2GMBpMFrQCNTpXOj7u9MRNBjpW0J90LmtY1VSJBSdWAf3nrQh
	 H9YnhfzU7RKCfzqy8Qc7ao939apPlZfNkmv/e1dBMnkKq6u6nVOBivea8PgNGFIjkcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtuNSwpR;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA48606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA48606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtuNSwpR
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2eac4877accso4930395ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793420112; x=1794024912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vfz1DbncV56dq7v1HZ9cnjldjr/F1zhzitP90vTq5E=;
        b=PtuNSwpR3ysNvmiW+q/tlsTu4jOW75gUujD8UbzX1v7pUhK+RSfzJMQBhtE6J5na9c
         mcNffw61u1pcSIW/IxLmxN6pSmT5B8ejj/5iq8fSnal/6UFByzGPLZ/3mRamIhvoFf4G
         mpCYVhu7kKTOAfJiFhRwJi8MwX+8ECyBVLXnbmIohocckP7YsqGl1l/0SRNWoqIVeYXw
         Ay/djVDy+4lYU62+TcAxbyE9Yy9MTSwa7wVjleUjCavFeHK4islIn/knOstApN9JKUWs
         IRaml2IZ5ytz2qOoIi7/MazAhCnMt+35ETTioiVGoYurhDX1ooHM9giwZTV9bY3QfuBN
         hnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420112; x=1794024912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Vfz1DbncV56dq7v1HZ9cnjldjr/F1zhzitP90vTq5E=;
        b=pJHdcSzicLv0R4pYzN9GDvnFwpMLuuoT8ihpHMeAn0UUsPvzYeX67KxSk3Bomyn8jN
         z7gKe7FSyq4kgB8U9c/lnFJBte8VImrPgFLxWz8cB3eHFIqS8Bf/0x3G4eCLo5G/tlez
         u02yW4Y/yLXkTKIDV1O13mPAbeDD/x8PfgKVdvoC1l8J8TxPn3YXiM/Ega59D4zw1n3I
         JIw+F9CLiaPSGp8V0KZk5r7xcWJyadPnnb96xcmAY88NKConLW1i7juNeq3DkmC7Db+g
         1NEnPuKE8qRWHU5orHzT29a+kBo+FkYKd84fpo9fxJ+4lXe4bXm0UIDKdMaejCd3y1Yv
         ADtw==
X-Forwarded-Encrypted: i=1; AKwUvBy4MVAd9KV2q1oXJxbZ+zu+Z4J0P45eWefO0RkqtyTd9+MaUD3v4ZU+FhZX/XOp4t+pyUgMr7pSB69tAaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5PQ+BnPL7buAae1QZiH7BPnrLwVUJmF9GwWaxnM2ICgptOeIF
	XSf9w+bMABTNYRC/bmxvhg1K2GshszrJs0KZ/GWPPUc3ZIsqpAGkBCSZ
X-Gm-Gg: AYBFou3pypHyW+FpFK15AmSrBaHpeKmAFA/NIqASuNcojqN1MxvrOjxFAgxSaj7mljs
	ZP2M6l8g2GoIYgY0EyxpPci4pOyWejWgVbJB8XfFqr8RNDrCiwIQ6zFk9wT/eLKGJB9LtZTRXJz
	Wim4FK0Wp6fhn11c6GgZYbNbvg2zbS0ofsR9qKeSMEp84oohYaKUIMyTDZJape92lVsb5+Uicsz
	GcRHX8j2B+BQil/O7SXRQK3w6vmgY5Q+pKgAz+Qw/Tj3guKhQaqUZC2cywzlw1a1yPXkwUyc0wu
	a2Ajy5fJ3wGEHfcw5Fdg9kuvBZTNo4Cil1i3uufBZYS6A19+igDGBCj9Eefh4KdK9YaDEtzUu/c
	zaCLdsVnJs7NWMYNe534UMktvIZWgUubIk8gCOYlFPP1X04eTeQRQrR38bjUblu5XvO9bBdCD/z
	FC8RCpfMaSbNXUyzO7AiJ1rDvN3ItP9WdTXohVX1i/WZlHUaH8AkUUu59JHZ5zxYXr8xLjmrHsk
	WivGLl790omacEAf9Tay5U6oL8NvSW8puFwbBaCNdRf8bROnFL2YR05FxehOsAB2ioBpguyZCBJ
	31z+Y1ffziHCkk6ySHwrRLa+
X-Received: by 2002:a17:90b:580d:b0:3ac:7378:be04 with SMTP id 98e67ed59e1d1-3ae891717d5mr3495257a91.0.1793420111634;
        Fri, 30 Oct 2026 21:15:11 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845d5e62sm6384937a91.13.2026.10.30.21.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:15:11 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH ipsec 2/2] xfrm: hold migrated states through rollback
Date: Sat, 31 Oct 2026 12:14:55 +0800
Message-Id: <pm-xfrm-core-objects-candidate-0027-v3-cb1e033bff1976f510c9-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-xfrm-core-objects-candidate-0027-v3-cb1e033bff1976f510c9-0@gmail.com>
References: <pm-xfrm-core-objects-candidate-0027-v3-cb1e033bff1976f510c9-0@gmail.com>
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

xfrm_migrate() needs to keep each new state alive until it either commits
or rolls back the migration. xfrm_state_migrate() publishes the successor
using its initial reference as SAD ownership, then returns it without a
caller reference. The pointer saved in x_new[] can therefore outlive the
state.

A legacy migration can find an existing policy with no matching templates,
install a successor and then fail xfrm_policy_migrate() with -ENODATA. If
the successor inherits a finite hard lifetime and the migration task is
delayed before rollback, expiry and GC can finish first:

  Migration task                  Timer / GC
  xfrm_state_migrate()
    publish xc, arm mtimer
  save xc in x_new[]
  xfrm_policy_migrate()
    return -ENODATA
  <task delayed>                  xfrm_timer_handler(xc)
                                    __xfrm_state_delete(xc)
                                    drop SAD reference
                                  xfrm_state_gc_task()
                                    synchronize_rcu()
                                    free xc
  xfrm_states_delete(x_new)
    xfrm_state_delete(xc)
      spin_lock_bh(&xc->lock)

The control mutex does not serialize the timer or GC, and migration holds
no RCU read lock across this interval. Rollback consequently accesses the
freed state's lock. This also affects the PF_KEY migration entry, which
uses the same helpers.

Take a caller reference before installing the successor, and release it
on installation failure or after the transaction succeeds. On rollback,
delete the successors before dropping their caller references. This keeps
each allocation alive even if its timer has already removed it from the
SAD.

The reported execution used trace probes and paused the netlink migration
before the rollback lock access while the normal timer and GC ran. The
userspace setup installed an SA with a five-second hard lifetime and a
policy without templates using ordinary XFRM requests.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in _raw_spin_lock_bh+0x38/0x50
    Read of size 1 at addr ffff8881076d6248 by task python3/417

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     __kasan_check_byte+0x36/0x50
     lock_acquire+0x113/0x2f0
     _raw_spin_lock_bh+0x38/0x50
     xfrm_state_delete+0x26/0x60
     xfrm_migrate+0x11af/0x18a0
     xfrm_do_migrate+0x797/0xad0
     xfrm_user_rcv_msg+0x3b3/0xc20
     netlink_rcv_skb+0x133/0x390
     xfrm_netlink_rcv+0x76/0x90
     netlink_unicast+0x504/0x840
     netlink_sendmsg+0x7f7/0xcf0
     __sys_sendto+0x425/0x470
     __x64_sys_sendto+0xe5/0x1c0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
     </TASK>

    Allocated by task 417:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_slab_alloc+0x89/0x90
     kmem_cache_alloc_noprof+0x20b/0x5f0
     xfrm_state_alloc+0x28/0x5d0
     xfrm_state_migrate_create+0x55/0x2470
     xfrm_state_migrate+0x37/0x450
     xfrm_migrate+0x80b/0x18a0
     xfrm_do_migrate+0x797/0xad0
     xfrm_user_rcv_msg+0x3b3/0xc20
     netlink_rcv_skb+0x133/0x390
     xfrm_netlink_rcv+0x76/0x90
     netlink_unicast+0x504/0x840
     netlink_sendmsg+0x7f7/0xcf0
     __sys_sendto+0x425/0x470
     __x64_sys_sendto+0xe5/0x1c0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 11:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kmem_cache_free+0x242/0x580
     xfrm_state_gc_task+0x533/0x730
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff8881076d61c0
     which belongs to the cache xfrm_state of size 936
    The buggy address is located 136 bytes inside of
     freed 936-byte region [ffff8881076d61c0, ffff8881076d6568)
    ==================================================================

Fixes: 80c9abaabf42 ("[XFRM]: Extension for dynamic update of endpoint address(es)")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Assisted-by: LLM

 net/xfrm/xfrm_policy.c | 5 ++++-
 net/xfrm/xfrm_state.c  | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 55f6bacc4e51..cced7928e980 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -4733,6 +4733,7 @@ int xfrm_migrate(const struct xfrm_selector *sel, u8 dir, u8 type,
 	/* Stage 5 - announce */
 	km_migrate(sel, dir, type, m, num_migrate, k, net, encap);
 
+	xfrm_states_put(x_new, nx_new);
 	xfrm_pol_put(pol);
 
 	return 0;
@@ -4744,8 +4745,10 @@ int xfrm_migrate(const struct xfrm_selector *sel, u8 dir, u8 type,
 		xfrm_pol_put(pol);
 	if (nx_cur)
 		xfrm_states_put(x_cur, nx_cur);
-	if (nx_new)
+	if (nx_new) {
 		xfrm_states_delete(x_new, nx_new);
+		xfrm_states_put(x_new, nx_new);
+	}
 
 	return err;
 }
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 0555e5d796ed..b9db6e903292 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2238,8 +2238,12 @@ struct xfrm_state *xfrm_state_migrate(struct xfrm_state *x,
 
 	xfrm_migrate_sync(xc, x);
 
-	if (xfrm_state_migrate_install(x, xc, m, extack) < 0)
+	/* Hold a reference for the caller before publishing the state. */
+	xfrm_state_hold(xc);
+	if (xfrm_state_migrate_install(x, xc, m, extack) < 0) {
+		xfrm_state_put(xc);
 		return NULL;
+	}
 
 	return xc;
 }
