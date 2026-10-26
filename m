Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052791;
	b=aXW1ltBPa0BVCmaDvcl7HaEAnoEFJvihh8eZLtkoILY2Rb+2w6cbGOsVPF4Szlj8z6Ih
	 7lcgjU1fp3WzaCwLFrNncaG36hIR76j1cJmEVQTC8Y4zE4FGvf/2VMx38lJva1cAubtuK
	 zv0g1LHO639LpHAQ7bBl69YCzjI0CbAc+XQEM3nTk3bweA0JWKAK4gtP1K7Xh4Kfw7U5D
	 HIbLRCdJnrVCaD4ERjjgoeD7jwDag3S1OLhq7RnKGbeMnwpXW3ogP5UOP4m/qJNbflHFI
	 m8VcAENfrAcheJ1kyPCXHKcd7cMXcpbdsrPJbsvKL0BgTdmWwUmrlvcBawZshLFmVEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=amqcoblHVnLhVb7i5K+CjSR7EzPX+kUGwE3sOAk8Cjk=;
	b=USVDUmGAbJuD58Z19uOebQlqVpr2QkbHrjWsJ3hnarmhzZhyW4Xk3LUi/cLyavJDnAFv
	 yOzZagtnDl84WM5wQrDdjqerVfT2b9wF5z23J197t3qcIvDY8EO+loO6k/Bm2gg3sk2eJ
	 JKgvazsolnMOTEIq9om+xYQGlvXQfZQWN4I3Ab8wsra/sUwLQ07W9Vfq4R7zifPofgq7f
	 22Cr26m2pz35T1f+NpdNFjfh6YgS7m+NWeqkw87xBGqCVoBqjhGpy3Wx5w6U5kdSKTfEC
	 2NW2Nwv8wipTx/1jq9b6+w8qydHJbpzA/f77xuBwa6sKipoC8Qg7ACdF52LgldIbqHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--namangulati.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TmHFXYXU;
	arc=none smtp.remote-ip=209.85.222.198
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922DC606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922DC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--namangulati.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TmHFXYXU
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so630940685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793052789; x=1793657589; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amqcoblHVnLhVb7i5K+CjSR7EzPX+kUGwE3sOAk8Cjk=;
        b=TmHFXYXUt4uxebvr/3/ar/BD0zhEL0AS8P/iyDm9oE7lZ+/nbav0iHfqtuh/84QN3u
         AU33icALZl/UphC04FJ9MH6EGqB1zvOObG/6nQ7QXSuFrO2hD4Pdh+9pAjaVppz0zNuP
         qeuyeRwwwao65Ysany6YgfjE+V/hdJTOLYSVDmPcDx9hmG5S3WeEKJuHQsbXcrmO2CLq
         J3ceCyMy1g5XqPUWI6PBnd58CnCQG1rcszP0WU3xYYgyK0wF/4I2Dw3XeqGQn45u5gVr
         7xfoCRYb82iU8E9R+5ECUbieTkPQiJxCiKG28vrl3/nyM8tfp1g+QorTKJfqQrd9dcFP
         XRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052789; x=1793657589;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amqcoblHVnLhVb7i5K+CjSR7EzPX+kUGwE3sOAk8Cjk=;
        b=Zzu5uQrHc5d3uXhhj9uckHfnWfOBTEK5/o0Jmzp8cYcRC5iZ8/9R7gdeWoAn3I1T4J
         kqr+Ci6a3hR2/C9BGddtjdVeJq0UGmPKlpxJm+7TFWdNgtiijRD3L+1AvLaE7HBC5u2X
         F+L+8Wcd980lSJGBZ2Saybi27Kpzgv+xRncBz9KtJH8hxknFINy0QoHgeeRux7S8xrcG
         yyBNsPH2hQRPqPjOlGVqTYQl//90uNlnW9l/j7RALqlHse2vP/0k4s3WIeWmF0PFbmOe
         ls+ivo9dowQYtRDar9e8nBucqcgqm850Tuhvg3mvTVmjorjfBsYYOQ5FjAk1b0RTgXMG
         hnZg==
X-Forwarded-Encrypted: i=1; AKwUvBwgtzhUz84FNWK4aDLswnYQU3/1hOeqYDVxxoLZoL+JsAvZgGPnZdcOnD9Nu3w0bS+20n9HKDRsxPZJkv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnanu99doWeoWPBRU7CLr50yC1ZG5R1vC4nwHpiUkIpP1J3IEB
	Ue9HDt9TZZWKRg9MaTt2uRImRu4uhDXPoq4/sDx9a3mrNy0gc8j+MjchPdOoytk1n316uOexgbv
	Vm1Ugr406Pmb3kI7DJN6nUB5V3w==
X-Received: from qknoq22.prod.google.com ([2002:a05:620a:6116:b0:93f:d748:291d])
 (user=namangulati job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2b4b:b0:93f:26e7:844 with SMTP id af79cd13be357-940ef96bb85mr1233859085a.55.1793052789253;
 Mon, 26 Oct 2026 15:13:09 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:13:06 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261026221306.3151025-1-namangulati@google.com>
Subject: [PATCH net] netdev-genl: ignore NETDEV_UNREGISTER rebroadcasts
From: Naman Gulati <namangulati@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+1269fe6cc2016008124e@syzkaller.appspotmail.com, 
	Naman Gulati <namangulati@google.com>
Content-Type: text/plain; charset="UTF-8"

netdev_wait_allrefs_any() re-sends NETDEV_UNREGISTER every second while
it waits for the last references on a device to be dropped. By then
netdev_run_todo() has already marked the device NETREG_UNREGISTERED and
RTNL has been dropped at least once since the initial notification sent
by unregister_netdevice_many_notify().

netdev_genl_netdevice_event() does not tell these rebroadcasts apart
from the initial notification and sends a NETDEV_CMD_DEV_DEL_NTF
multicast for each of them. At best this spams NETDEV_NLGRP_MGMT
listeners with duplicate notifications; at worst the pernet state of
the netns the device belongs to is already gone and the handler
dereferences a NULL pointer.

default_device_exit_batch() only unregisters the devices still listed
in the exiting netns; it does not wait for in-flight unregistrations of
devices that were already unlisted (the barrier doing that was removed
by commit 8a4fc54b07d7 ("net: get rid of rtnl_lock_unregistering()")).
So when a device is unregistered by something other than the
cleanup_net() of its own netns while references on it are still held,
e.g. a veth whose peer in another netns gets deleted, and that netns
exits while the device is stuck in netdev_wait_allrefs_any(), the
remaining pernet exit handlers run and genl_pernet_exit() sets
net->genl_sock to NULL. The next rebroadcast then crashes in
genl_has_listeners():

  BUG: KASAN: null-ptr-deref in netlink_has_listeners+0x3d/0x3f0 net/netlink/af_netlink.c:1388
  Read of size 8 at addr 0000000000000578 by task syz.0.0/5325
  Call Trace:
   <TASK>
   netlink_has_listeners+0x3d/0x3f0 net/netlink/af_netlink.c:1388
   genl_has_listeners include/net/genetlink.h:644 [inline]
   netdev_genl_dev_notify+0x161/0x450 net/core/netdev-genl.c:93
   netdev_genl_netdevice_event+0x98/0x3c0 net/core/netdev-genl.c:1491
   notifier_call_chain+0x1a5/0x3d0 kernel/notifier.c:85
   netdev_wait_allrefs_any net/core/dev.c:11690 [inline]
   netdev_run_todo+0x731/0x1060 net/core/dev.c:11808
   rtnl_unlock net/core/rtnetlink.c:157 [inline]
   rtnl_dellink+0x68f/0x810 net/core/rtnetlink.c:3707

syzbot hit this by moving one end of a veth pair into a short-lived
netns while netdevsim's deferred FIB event processing still held a
reference on it, and then deleting the other end (repro [1]). While the
source of this bug is netdevsim deferring FIB processing for and holding
onto the device reference for O(seconds) which is being fixed
separately [2], any driver may introduce such a delay and trigger the
null-ptr-deref.

Skip the rebroadcasts, which are the only NETDEV_UNREGISTER events
delivered with reg_state == NETREG_UNREGISTERED. The notifications sent
by unregister_netdevice_many_notify() and, for a device leaving a netns,
by __dev_change_net_namespace() are issued under RTNL in the same
critical section that unlists the device, before its netns can be torn
down, and keep being handled. This mirrors what ip6_route_dev_notify()
already does to cope with the rebroadcasts.

This change should not break the UAPI spec as it defines dev-del-ntf as
a "Notification about device disappearing." which is a single event. The
rebroadcast in netdev_wait_allrefs_any() exists to re-kick in-kernel
subsystems holding references; netdev-genl happens to be on the notifier
chain and forwards it.

[1] https://gist.github.com/NamanGulati/2d1b49b8757f9a88b0bd6e55018c02ae
[2] https://lore.kernel.org/r/20261023191517.607834-1-kuniyu@google.com

Fixes: d3d854fd6a1d ("netdev-genl: create a simple family for netdev stuff")
Reported-by: syzbot+1269fe6cc2016008124e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/6adf9f64.6200f071.51519.0ed1.GAE@google.com/
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Naman Gulati <namangulati@google.com>
---
Note that the reproducer attached to the syzbot bug targets a different
bug (via devlink_port_notify() on netns teardown) that happens to share
the same crash title, not the one in the original reported crash report.
---
 net/core/netdev-genl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 33b9f4eb9565a..2032ab9a864c2 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1487,6 +1487,12 @@ static int netdev_genl_netdevice_event(struct notifier_block *nb,
 		netdev_unlock_full_to_ops(netdev);
 		break;
 	case NETDEV_UNREGISTER:
+		/* netdev_wait_allrefs_any() rebroadcasts NETDEV_UNREGISTER
+		 * while waiting for the last references to be dropped; the
+		 * netns may already be torn down by then. Notify only once.
+		 */
+		if (READ_ONCE(netdev->reg_state) == NETREG_UNREGISTERED)
+			break;
 		netdev_lock(netdev);
 		netdev_genl_dev_notify(netdev, NETDEV_CMD_DEV_DEL_NTF);
 		netdev_unlock(netdev);
-- 
2.56.0.307.g5fe7bd680c-goog

