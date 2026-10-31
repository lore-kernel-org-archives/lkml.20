Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417343;
	b=q3Z/xHfvv6N4gdZypr9XmeHpW+cieyrPKhOXN/FIquE8UP/tgsrAlPZM8+kxLfdRIkyY
	 qWc5DFxz9VA5+omekD9871piXf6tUT/yBrAGiUd1zaS3NZOqdeqG92YDjwy1YVY/4vK3E
	 qLkVwCiFSs7u9ucofLfBo6DgzynEWiGGxtud6vyM9wUQvoxNG9E8BfQcG2WQw8uCnH3Bc
	 ym7zcWRVyM6bS+LtgK4B3Y4kVfj33M6r8P3BNp6P5U6v56zoy+VXmBKFoGlVp9/WdmtoP
	 N6odRit/mP1Y7QlDzGNcFROgEgihra30cY+Zrf4s9rJAvjt03IUZGj/k1spCMXoSv1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1N2EKxe4+D8kbS8GIyKffFYzwAu5vWlJZDnR/Bowz7k=;
	b=CvQFmJyN+toHJ1j8CoKVab38xCG1zDSlfv+9ccyN1WkcF5g/9jq0JMGHooP/89Sx3vj6
	 q6I6m0Ic1lethBqLsPaOnigF3jiRBmM8S+LEqfGM8uBjKvc4vnfrNvgakCGBocTrcVp26
	 ePWCikrmSWsg5iXyeyMx5kW3z624Eq0ghRmBzgSvBwLF0eeWIq7Okbh4p630wdRlinb+a
	 RRhhL+VBbFLF/oSErVkz1I2xdNpkGSTgXqJwVKiGQSNxMCzQa7/I+Sx6csiaCm5qp3t1y
	 qF+xEilYan4Yuu6BzRmlc69yRoAq2v76Fjelth7vYK59/53npTHhvXW/O4F4rgemLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B866/7E6";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E8606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B866/7E6
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2010034a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417341; x=1794022141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1N2EKxe4+D8kbS8GIyKffFYzwAu5vWlJZDnR/Bowz7k=;
        b=B866/7E6LhW9/o2mvXurj/6USSVl4HqQuX5SPr0eX1t9NLuZu5Q+O1BvoUkKx2rBwx
         oTtw/GOVwtSdK13++1h22K8z1hbdvP/CQwU/JmMXbPKOPTL9BA5MvfeldUrLO8X8VN7X
         mJCCJmdZ3DxQHmBlYp/HKIgYvnIigJClrrY3hPIGvszTnkYsGzMdZuTGbEiNMOpOR9bn
         NKfn5gDc1KOnk0Ms5JqZeWZL43fUQT7RmVBP9U1XqThuEnGfMwcO/FATlIjCQIH8Bi3k
         0fDUzA+WucqMVdTWNHXXxJ0OQ9NZxyEjgIb1g0jmBLQRE0jpquec4PmyUBob81H+Wl3R
         Sb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417341; x=1794022141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1N2EKxe4+D8kbS8GIyKffFYzwAu5vWlJZDnR/Bowz7k=;
        b=QaVXayNm0J4grr8xZuRAwhvCDiPWjg+tVNNDYir08M/XtzJMDh/YABRB7d1mY8KGc+
         0TCSKigYmgz+ZasMdg4Fs3Rvd9t/f86RFF9uB5iFi79wXtJndA/fRnNBw0pfimaqcIKF
         QJTD5SMcNpGfIe6K6O1Nik7UMcjDIw/1UK/pK6m19RoFidtDKlxlPwo8K4YgJ57fwL2J
         vwfsigRfYucjx9bLlQaQUfLRj9Veq52u+DpO17KjsreXdsTr69wHp5norqOspkT9vu9F
         nkSjyR7fiN6HU7q/MBhPx7/Kpjg3lhM0b2NIvALhwHzDDdqwxu7YlfDgXqD6s4lDy55B
         Vatg==
X-Forwarded-Encrypted: i=1; AKwUvBzoTA3v+pShnEBvnq9bfEZTzMt0hOD/nJBsNG20cj4u5hukGFJ7mwuKHbomAZ+G2evyh5emI22ZYQPQ22s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsTB3+eITAA1BPid0/HtGI/CkeCajg2eaMd10MkNQxL4t8InqU
	qpFoZ3Qf8snulIphqV33F/Lv+VvuXQ2AB00iQZN9Pgt7EWtRbbRxWz2DJbg2evK7pprqEQ==
X-Gm-Gg: AYBFou0dNCNiWf7GtZfwnc/NLXGssMveckMV7p3M4xsp/5UeJr3srn571sCIyZZoNQG
	aovR+qcjTEoQixJipAovGtqOSK9GYG/j97mCHh4/Ljug5gubGjwaOvr7t67W8g2zHcerN25irlP
	+s5yPczHxTHBzZA8CYmIT0ax6KsHERGUQUzwOhi9HRAJL8lpigDJEENQdoa3aeeprZH2hkBx8aR
	UXqiJyfxf+sKe6mSy8Xyqz5Yu9ZG7eyI4UauM9rCLE4764fzIReMg0zzdGt6fkfRnnkBBhQk8Gf
	bKtM115WpuzlFs4LUPcc8AVh9smVIwZfgP6j0S2vfpp4Yn2uLMp3r1VIuA8wZDxBLZoFilitXDZ
	yW3j+DhemF0TRVaUiY9cdAIiRfLJ8ehsQn+wXwrl7F0iPyT9GYpRn6YP4y32Il5M41ik9CsBKr7
	AF0bSOvCV6IF4R21IbXYXYzlDoT0xE3PttpzjCf0269gvDNa/Ub5t80DeO4/weXF6v878r+2uK4
	RE74A4ajPe4A401ysTG1cr4uwUV4jSA4FkN5TsEtI1NY+zfedX4IwWVwY4FU7zCc03yxMYRlXcj
	y9ukwtI/si7ZsNYQcIehui39
X-Received: by 2002:a17:90b:2805:b0:3ad:adfe:5854 with SMTP id 98e67ed59e1d1-3ae89817e7amr3599239a91.40.1793417341427;
        Fri, 30 Oct 2026 20:29:01 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87ee7765sm3212773a91.2.2026.10.30.20.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:29:01 -0700 (PDT)
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
	antony.antony@secunet.com,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH ipsec v2 1/2] xfrm: protect offload statistics updates from device teardown
Date: Sat, 31 Oct 2026 11:28:48 +0800
Message-Id: <pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-0@gmail.com>
References: <pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-0@gmail.com>
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

copy_to_user_state() refreshes the statistics of an offloaded SA through
the driver's xdo_dev_state_update_stats() callback. GETSA and SA
notifications run it with only a reference to the xfrm_state, which does
not keep the offload binding alive, and the netlink configuration mutex
does not serialize them with the netdevice notifier.

NETDEV_DOWN and NETDEV_UNREGISTER flush the device's states with
xfrm_dev_state_flush(). It deletes each state under x->lock and then
calls xfrm_dev_state_free() without that lock, which lets the driver
free its offload state, clears xso.dev and drops the device reference.
A refresh that has already seen xso.dev set can then run the driver
callback on freed offload state or after xso.dev became NULL, and can
read the net_device after unregistration has freed it:

  GETSA                              Device teardown (RTNL)
  -----                              ----------------------
  look up and reference x
  copy_to_user_state(x)
    x->xso.dev is set
                                     xfrm_dev_state_flush()
                                       xfrm_state_delete(x)
                                       xfrm_dev_state_free(x)
                                         xdo_dev_state_free()
                                         clear x->xso.dev
                                         netdev_put(dev)
                                     unregister frees dev
    xfrm_dev_state_update_stats(x)
      reads dev->xfrmdev_ops

The expiry timer has the same problem. It refreshes the statistics
before it checks for a dead state, and it can still fire after the
flush has deleted the state.

Every path that frees the offload state of a reachable SA marks the SA
dead under x->lock first. Refresh the statistics only for SAs that are
not dead, with x->lock held, so a refresh either completes before the
teardown or sees the dead state. GETSA, ALLOCSPI replies and SA
notifications now take x->lock around the copy. Expire notifications
already run under x->lock. Dumps run under xfrm_state_lock while the SA
is still linked, and deletion needs that lock before the offload state
can be freed. The timer now checks for a dead state before the refresh.
A dead SA keeps the counters from its last refresh.

The report below was collected on an earlier kernel with a built-in test
device that supplies no-op offload add and delete callbacks. Scheduling
probes paused GETSA after it sampled the device, then ran normal
link-down and link-delete requests before resuming the read.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in copy_to_user_state+0x6ce/0x6e0
    Read of size 8 at addr ffff888104be0308 by task ip/446

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     kasan_report+0xe0/0x110
     copy_to_user_state+0x6ce/0x6e0
     copy_to_user_state_extra+0x8a/0x1450
     dump_one_state+0x1fd/0x440
     xfrm_state_netlink+0xda/0x150
     xfrm_get_sa+0x12d/0x320
     xfrm_user_rcv_msg+0x3b3/0xc20
     netlink_rcv_skb+0x133/0x390
     xfrm_netlink_rcv+0x76/0x90
     netlink_unicast+0x504/0x840
     netlink_sendmsg+0x7f7/0xcf0
     ____sys_sendmsg+0x88b/0x9d0
     ___sys_sendmsg+0x125/0x1d0
     __sys_sendmsg+0x13e/0x1e0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
     </TASK>

    Allocated by task 420:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kvmalloc_node_noprof+0x353/0x930
     alloc_netdev_mqs+0xa0/0x1250
     rtnl_create_link+0xb8e/0xeb0
     rtnl_newlink+0xb7b/0x1f40
     rtnetlink_rcv_msg+0x7b9/0xce0
     netlink_rcv_skb+0x133/0x390
     netlink_unicast+0x504/0x840
     netlink_sendmsg+0x7f7/0xcf0
     ____sys_sendmsg+0x88b/0x9d0
     ___sys_sendmsg+0x125/0x1d0
     __sys_sendmsg+0x13e/0x1e0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 451:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     device_release+0xd7/0x280
     kobject_put+0x1ad/0x610
     netdev_run_todo+0x927/0x13d0
     rtnl_dellink+0x3aa/0xa30
     rtnetlink_rcv_msg+0x7b9/0xce0
     netlink_rcv_skb+0x133/0x390
     netlink_unicast+0x504/0x840
     netlink_sendmsg+0x7f7/0xcf0
     ____sys_sendmsg+0x88b/0x9d0
     ___sys_sendmsg+0x125/0x1d0
     __sys_sendmsg+0x13e/0x1e0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888104be0000
     which belongs to the cache kmalloc-4k of size 4096
    The buggy address is located 776 bytes inside of
     freed 4096-byte region [ffff888104be0000, ffff888104be1000)
    ==================================================================

Fixes: 07b87f9eea0c ("xfrm: Fix unregister netdevice hang on hardware offload.")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Assisted-by: LLM

 net/xfrm/xfrm_state.c |  4 ++--
 net/xfrm/xfrm_user.c  | 10 +++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 0555e5d796ed..1aeb6208ea8f 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -649,10 +649,10 @@ static enum hrtimer_restart xfrm_timer_handler(struct hrtimer *me)
 	int err = 0;
 
 	spin_lock(&x->lock);
-	xfrm_dev_state_update_stats(x);
-
 	if (x->km.state == XFRM_STATE_DEAD)
 		goto out;
+
+	xfrm_dev_state_update_stats(x);
 	if (x->km.state == XFRM_STATE_EXPIRED)
 		goto expired;
 	if (x->lft.hard_add_expires_seconds) {
diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a5fbe38839c4..781d4ec565aa 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -1179,7 +1179,11 @@ static void copy_to_user_state(struct xfrm_state *x, struct xfrm_usersa_info *p)
 	memcpy(&p->id, &x->id, sizeof(p->id));
 	memcpy(&p->sel, &x->sel, sizeof(p->sel));
 	memcpy(&p->lft, &x->lft, sizeof(p->lft));
-	if (x->xso.dev)
+	/* Device teardown marks the state dead under x->lock before it frees
+	 * the offload state. Callers hold x->lock, or xfrm_state_lock while
+	 * the state is still linked.
+	 */
+	if (x->xso.dev && x->km.state != XFRM_STATE_DEAD)
 		xfrm_dev_state_update_stats(x);
 	memcpy(&p->curlft, &x->curlft, sizeof(p->curlft));
 	put_unaligned(x->stats.replay_window, &p->stats.replay_window);
@@ -1633,7 +1637,9 @@ static struct sk_buff *xfrm_state_netlink(struct sk_buff *in_skb,
 	info.nlmsg_seq = seq;
 	info.nlmsg_flags = 0;
 
+	spin_lock_bh(&x->lock);
 	err = dump_one_state(x, 0, &info);
+	spin_unlock_bh(&x->lock);
 	if (err) {
 		kfree_skb(skb);
 		return ERR_PTR(err);
@@ -4167,7 +4173,9 @@ static int xfrm_notify_sa(struct xfrm_state *x, const struct km_event *c)
 
 		p = nla_data(attr);
 	}
+	spin_lock_bh(&x->lock);
 	err = copy_to_user_state_extra(x, p, skb);
+	spin_unlock_bh(&x->lock);
 	if (err)
 		goto out_free_skb;
 
