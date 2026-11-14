Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794695771;
	b=Pt+rHYuW/NdFW9UyeTpNRXgQRhb2NJ2k6S8WFzArmx6+zxH7YA/gAul4nk19XvPyn1FU
	 cXydKXpon5US91TVRcfP5cUaZVnB+2jC/vNF4C25tZrhe1V99CoH4hp0abRHZO2Z1YKyg
	 mE9N9HnuBJJhSmUFww22m2QDvoLl825eCHYFYvFABqFO2aArrrzHbv4cVmgLBagpiFEFi
	 PqPRMkh/6oDUFox58HHarnfnN95rCcJADOr+RnZ67kVVm/ThTUeN4UZ7q56RGQGQA4BKF
	 xVO/bj8PiQzUO2R5Ev6hVu80+pId4yF7ncrxagFmRwEpNN+0g7dUbW+tPpVZ0dKfFkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794695771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
	b=BfVwPNZcNEDzA0GAGAib32WRPTqVYA+93oQFOyJrhfHImm9jcj2PfdkZN2VvNsaaIDzu
	 OBpTYJGjt3b84EWZ3RzlfQL7YVFzlaqT5l4lV+REXikh19oX3C8zyv4pZnURVdMY9hL8z
	 PgSXSmHWDp+sRVPESC9v7FIWxYRHfqMCl3TrgKKKOxqszgLlQKfCLsVGpPLUruSODe4Ep
	 a7KK8ShvO6kbjTXgWRXuERudF8Np1qB0riJ+i3c41TKBXbv7JnkooFIrx2jI1B/iCoCjp
	 S6oVh1Ddj40U8Ns2bSTlGa4TfDHnjXXSnBs4cc30OTN/4Xchue+iiBFNiJg+HKOnoow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQQo9+7b;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F15606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F15606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQQo9+7b
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1174748a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794695770; x=1795300570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
        b=LQQo9+7bAW11Hyfc8tgSBdoqnd2WgSJK81r2jvcKAUaN1XOZFBey+pcLWaRg4ne8H0
         mmn5ta7i3j20yF4rwzdoa0wO1EBXZkvAghQ9wqX5mbqdEHY6Qrx+h665mAwK4cvTh18m
         mQWcIq/H1AO3N1exTE3wsZSv0PiHOaEgMKw85LxSIYQTTxN5ILze8B51RteHnTtrkcbu
         W5gDnkwvQ1B/D2xduIwLIZkVcsJ0+B92fNiyblXyhlV7KgBD+ygEsnNzhR5ULjP+MvSW
         xSxuhrsyqiv5hXXJBMyUIKQc/n6S5ArHbZwKIFxlZGm1Q7hos1HJwU5u0x0HRh8rpMJH
         /WiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794695770; x=1795300570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
        b=F1eBFIHpL/SCAVNqvp29I/31G1LrgMz4ZLXkpeiY1FIe40f4aBq9NTqQZF0BN38Q0V
         GzEdhqbGREllvl8tDm3/WXF20jhjWvjXSHQ9aBYSboCxDjBHVXT/DlMqY4bJInmTJ88S
         T3IId2tZ4GUrpQhLrUIxMr0YGzG/0tkki62SqtUNSfI3aP/MGReSbBzlSYO88MVqZLJV
         LzVGEiY4DWWJj8RWh204apRAg72OM9zi6GHlWgBLPvEiM8+3iyTjEn6DlgBNjRXdci9p
         yk4FfwsW5im8NcjXbRn51v7BxI42UbcEVYZEtzSJhnDcbJwLKDZP5B29MQkmHYD6T589
         SJgQ==
X-Forwarded-Encrypted: i=1; AL+hErGnfxYExJacgaxBPOaYi4V8/qdKLxb8sHzuB32EKVqxFcFGuEwghbPVpLq/wf8+CK0+rFSqS6z+2UBCPmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wzm1nbpyFrUVpipSbx3ptbCWKFKUPGFMW+Cfn6mnH3i+f/mbF
	4HSb/PiUS9/kZ57iHieP+sZFbiSS2OVmVRRcKxENzO5YyGm+aXk4AnoZ
X-Gm-Gg: AYBFou33dYYdDI05oR5exhLCERenWOQxJchQFgEkaOktd5DDkhlxvXBGb7fNic2lbnC
	weWvM5JIlD9BOrjbqlauFXGHFlUXUc2eiO0oqigc4HKCiLYRrjnBXBpwotJL/7n/w0s3NoZIjGJ
	gLCO9Rq38IfmtB9682BlET8s8gSRBjHofhfG8jIZJQ7eRfjrC6G+ISQPsn8K4zk/N/Tr9m69WWi
	G14T2RAgKfXajOJfDNDbcDpg47gP1rUQ/VRgQjxMhzVc8muCSs+4WdEU2ollBZiiq/xJSxHLte7
	zL/HA6bAPbL6Cx6JbDAQsGqSE2rjLUQuKbfpyajsxxc0P/5KN1ya9yLxqChJJ3sGzY2U0UX2gqt
	y++B7011VMgXAJnmmRvuYKbP1yZBp2SYrwUL8sR6A6aCvg0PcZz7pX2S/jFlLPA5Ic2yKxEL+jD
	IEvwa3DVT6JQTl9b9CWRVoT5XO1vWTkHQjSJoyG+rwP5DByi71ixBtqs+3ROPAtf4cx7YVcnRin
	JKAv7QWNYxO7UiKgM8T97tzYgO5m00MfU0yV8fg72YSlGQgjtiuBcnQcuQk5+tgOVLC1RQq9edX
	7zJ9z3pTl5lYj6rtqDnzTOHtRaE74xhKX5utnevTrsDpfEJa/yDa6Sg3lT2GxyaLo1pmnmqUwNV
	PQZemCITNgtXCxlp0zSPGhbJtGRLhN/9mvdWzF7Ln0Kq6pK9WvpdUm6KdnWlGWpjLxR8U7+e5e+
	0rly5KHPj4XLzin1zjJTh0Uvx6FldCY1yfqP0pCGOPL2Cp7JJLcQv0SChSPJqbifZTTgaCYuQj7
	VStlQYa4dM4MOdqywBFj2QU8sORLWJ/EmjxuZb43dT2BXfRXQZhi+IfVNv0pNvG
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr5915116a91.49.1794695769893;
        Sat, 14 Nov 2026 14:36:09 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed74024sm10234804a91.15.2026.11.14.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:36:09 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: af_key: fix use-after-free in dump_sp() on policy migrate
Date: Sun, 15 Nov 2026 09:05:29 +1030
Message-Id: <20261114223529.1791-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

pfkey_xfrm_policy2msg_size() derives an exported policy's message length
from xfrm_vec[].encap_family. dump_sp() derives it twice: once through
pfkey_xfrm_policy2msg_prep(), which allocates the skb, and again in
pfkey_xfrm_policy2msg(), which fills it in.

dump_sp() holds net->xfrm.xfrm_policy_lock rather than pol->lock, so
xfrm_policy_migrate() can rewrite encap_family between the two
derivations. The second length is then up to 24 bytes per template
larger than the first, and pfkey_xfrm_policy2msg() opens with
memset(hdr, 0, size), clearing the difference into the skb's shared
info. Four BEET templates put 80 bytes there, which reaches dataref:
alloc_skb() had set it to 1, the memset makes it 0, and the skb_clone()
in pfkey_broadcast_one() leaves two skbs sharing one head with a dataref
of 1. Freeing the original releases a head the queued clone still points
at, so recvmsg() copies freed memory to user space and consume_skb()
frees it a second time. The CAP_NET_ADMIN that pfkey_create() and the
xfrm netlink receive path check is namespace-relative, so an
unprivileged user can reach this. SLUB's double-free check fires within
a second of starting the reproducer; the oops kills a task, or panics
the machine when the corruption lands in softirq context.

Racing SADB_X_SPDDUMP against XFRM_MSG_MIGRATE as an ordinary user gave
4585 use-after-free reports and 765 double-frees in 300s on mainline
with KASAN and 8 CPUs. The reads reach user space (addresses trimmed):

  BUG: KASAN: slab-use-after-free in _copy_to_iter+0x1d8/0x1430
  Read of size 240 at addr ffff88810f98d140 by task pfkey_dataref_o/433
  CPU: 3 UID: 65534 PID: 433 Comm: pfkey_dataref_o Not tainted 7.4.0-rc2
  Call Trace:
   <TASK>
   dump_stack_lvl+0x66/0xa0
   print_report+0xd0/0x600
   kasan_report+0xc6/0x100
   kasan_check_range+0x105/0x1b0
   _copy_to_iter+0x1d8/0x1430
   __skb_datagram_iter+0xf8/0x820
   skb_copy_datagram_iter+0x6c/0x1a0
   pfkey_recvmsg+0x1ff/0x500
   sock_recvmsg+0x15e/0x1a0
   __sys_recvfrom+0x182/0x260
   do_syscall_64+0x10b/0x5f0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  Allocated by task 433:
   kmalloc_reserve+0x108/0x2b0
   __alloc_skb+0x123/0x5b0
   dump_sp+0xdf/0x490
   xfrm_policy_walk+0x1d9/0x6c0
   pfkey_do_dump+0x61/0x420
   pfkey_recvmsg+0x358/0x500

Take xp->lock for reading across both calls, so both derivations see the
same encap_family. xfrm_policy_walk() already calls dump_sp() under
spin_lock_bh(), so the plain reader suffices, as in xfrm_policy_timer().
The other callers of this pair are already serialized against migrate by
net->xfrm.xfrm_cfg_mutex.

Fixes: 80c9abaabf42 ("[XFRM]: Extension for dynamic update of endpoint address(es)")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---

 net/key/af_key.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/key/af_key.c b/net/key/af_key.c
index d215b33..ab4aaca 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -2712,11 +2712,18 @@ static int dump_sp(struct xfrm_policy *xp, int dir, int count, void *ptr)
 	if (!pfkey_can_dump(&pfk->sk))
 		return -ENOBUFS;
 
+	/* Both halves derive the size from xfrm_vec[].encap_family, so
+	 * hold xp->lock against a concurrent xfrm_policy_migrate().
+	 */
+	read_lock(&xp->lock);
 	out_skb = pfkey_xfrm_policy2msg_prep(xp);
-	if (IS_ERR(out_skb))
+	if (IS_ERR(out_skb)) {
+		read_unlock(&xp->lock);
 		return PTR_ERR(out_skb);
+	}
 
 	err = pfkey_xfrm_policy2msg(out_skb, xp, dir);
+	read_unlock(&xp->lock);
 	if (err < 0) {
 		kfree_skb(out_skb);
 		return err;
