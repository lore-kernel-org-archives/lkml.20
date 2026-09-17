Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12473B8111
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617619; cv=none; b=iRcAuhWEZQqR7qiLQ7V6mMqYDUL1gWCnZyeHj8X/GIlO5JZQc4Il3twb60TPxxZXMbUj38XFIU+iQrhJvLLqlvRPJfkfnPoSxzltb9JkepSlXPt6roZbG+zV/S61F8Pbi/SuaF9MkW4raa/eAd03uXhFLz1U+vNvGbj/kIbM9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617619; c=relaxed/simple;
	bh=t6kqad3R5WgeKWtDof9fjSN4rKNL6g8fBl1fgnljyQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dLlo2jZ6sW/kHjICHAhlz7oj7lhNpgvwuWgpeo3+56yjln70J6PeJRR43QKkRW963fplTKpmyWorF8PGSAEEi+IaXFg6AcwxlTkgmBHpsQP4/mT2JphjPb/JVTxvaVttfI3po9A8jGyNGLeRAjvTBuFWwVOtfFJWdsQXclLq6Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRWCu49k; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRWCu49k"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so3341165e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789617615; x=1790222415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBijyL0HZR3/5g7v7DmejWL3K0668IdfViWW12KzHHg=;
        b=KRWCu49kYszdxlHpATD5vkmIMj2m8Kip6NJW/tt5iDBcrV/mep4+DF9I4W2VDvb8h9
         ILHMmk21bIooIfHTXBz1Bb0xqQ700Fu20BGvp3ouDBSdHijiXkhhJzocpnM7ln3nSpr2
         x1a1n68/0oqhei9FtT+kVAjxDMx8FuV1n15jsPw5iYCkCoa1d/MeagS1gTUTf/Td/zBc
         fR+pDGybqD19mbkla1VMryN7fsbV12WqJoPCPEFKsNg6KEoh8WbWNf4tFuKNrkP3IyBd
         +XvxiX/9D2QPrbMTI9bjdIp1y3k8xkC6bz7TX9AFon1zUedDHya+wDhYOAx1vB8eDJJk
         4vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617615; x=1790222415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBijyL0HZR3/5g7v7DmejWL3K0668IdfViWW12KzHHg=;
        b=PMI9HWJ1mTMjVz84/dzkWjWU5HNtxg5+zEM5FuyX8Jblp4qJj1I4M8GFpqi1ojknLA
         BJ6EJH5CD5/+0DrDDIg4VL/IED9Ak5Ta8Fct5idaCO1Rw3hxkm94ZVzNy4ge3XUydFzz
         dqDnpKLJ4ZKlzmANjbMIWVRTpZQ+HM7ls/Fp8sMGy+JTMGssHmzbU3uU2/S16fpaJOwR
         Uu/D+9XbeLQ32tzLrDOyLVTi/wGUbzAkJRZ2N0tsmcwMYIuVBsNFPXCJJaKXDhHpoqfQ
         eeWY3rBwvN2Xpd7f2gED/IMHR2uO7rUYqd27Z9iyYO7MWISytfAtLlkoWz47KO+wz1cA
         z2YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbc7f27MHqbHw1NlkYkw190eOhXuKD6BseGuyPTlvgJxhBkMozYN544mT8UA7760QZrJ4diMwM0FDVCvI=@vger.kernel.org
X-Gm-Message-State: AFuF++mA9s1GWhX0eKgp6sdVtgxox6+VwCRXPFDhaLXujfKHjM4GyYQo
	0iy1f6aqR6UqOGE7vGqIwloMOOfZXZYjoUV29SYlT5OkqG1wDzcoN8gQssSNtR1m
X-Gm-Gg: AYBFou2qpmZZAo1TgaHQofu/+wYqkxztrj4d61XDUg5oenAqOQWH3Cof1ujG1Fg9FZh
	Xpswk7/V0zA4z0hQDX3QeztxWXjy4nHj9PgrkfDl2d9X5+HCG1TB5NmK1k9fpTt5pzACtlish/b
	+PxWr4FxQsEU23ONuDthxW3uuA4n9PhIDqyhgBaTYY2jd0goArneUaBe7cEX/tdPEA83E462vgw
	jCUH+/R7pAuP0T4ZxPWZSiq9zZRIRJAsk6wtpUGja1E0MBeL1AqdDIJGGNiKOX7vkAO6cQ6NWTd
	g/it9aZp7ZQ0/KuvqaO+ZhpIrhDckxFDsU0qeOYcV4dluFvPJ6b/GnnhSlPaT3wJVK02K0P2KM8
	hOSnX/SUAg3z+iQxiC5Hwdo5Z67CtSKVgAyPnIk9aEhbqNxuKfjA6imI9SnejypnzIdnVmmNM8X
	T4lhq/pxRv/DBEJXU7SKU0Rv6njF0jEcPG7AN4lDUYbutsVxN5lqjh9P7roN8MIDoEDDmvy9IWM
	S+p3Uu1u3pi2TfYiCSdBuONyFbcRJr1ZisZrURAorr1DtO72Pfa8+4yrZ4sXHnUyVwuQzfR9rBq
	JEjrpZSkd7nsIhZAUHpw44Mf7fy8x84967qWNhiaC+1eLewLH/aG+pV68k4shcUdX92HzzZ+XN4
	S
X-Received: by 2002:a05:600c:3e0a:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-49eac4638femr61582055e9.5.1789617614946;
        Wed, 16 Sep 2026 21:00:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm6880015e9.0.2026.09.16.21.00.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 21:00:13 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	luiz.dentz@gmail.com,
	luiz.von.dentz@intel.com,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	eadavis@qq.com,
	davem@davemloft.net,
	kuba@kernel.org,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	pav@iki.fi,
	syzbot+b7f6f8c9303466e16c8a@syzkaller.appspotmail.com
Subject: [PATCH 5.15.y 1/2] Bluetooth: L2CAP: Fix deadlock
Date: Thu, 17 Sep 2026 06:00:03 +0200
Message-Id: <20260917040004.21041-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917040004.21041-1-kmehltretter@gmail.com>
References: <20260912065526.833703348@linuxfoundation.org> <20260912065546.976652519@linuxfoundation.org> <20260913202907.3100-1-kmehltretter@gmail.com>
 <20260917040004.21041-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

[ Upstream commit f1a8f402f13f94263cf349216c257b2985100927 ]

This fixes the following deadlock introduced by 39a92a55be13
("bluetooth/l2cap: sync sock recv cb and release")

============================================
WARNING: possible recursive locking detected
6.10.0-rc3-g4029dba6b6f1 #6823 Not tainted
--------------------------------------------
kworker/u5:0/35 is trying to acquire lock:
ffff888002ec2510 (&chan->lock#2/1){+.+.}-{3:3}, at:
l2cap_sock_recv_cb+0x44/0x1e0

but task is already holding lock:
ffff888002ec2510 (&chan->lock#2/1){+.+.}-{3:3}, at:
l2cap_get_chan_by_scid+0xaf/0xd0

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&chan->lock#2/1);
  lock(&chan->lock#2/1);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

3 locks held by kworker/u5:0/35:
 #0: ffff888002b8a940 ((wq_completion)hci0#2){+.+.}-{0:0}, at:
process_one_work+0x750/0x930
 #1: ffff888002c67dd0 ((work_completion)(&hdev->rx_work)){+.+.}-{0:0},
at: process_one_work+0x44e/0x930
 #2: ffff888002ec2510 (&chan->lock#2/1){+.+.}-{3:3}, at:
l2cap_get_chan_by_scid+0xaf/0xd0

To fix the original problem this introduces l2cap_chan_lock at
l2cap_conless_channel to ensure that l2cap_sock_recv_cb is called with
chan->lock held.

Fixes: 89e856e124f9 ("bluetooth/l2cap: sync sock recv cb and release")
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
[ Karl Mehltretter: backport only the l2cap_core.c changes. The HCI
  changes are from an unrelated patch accidentally squashed into this
  commit. The l2cap_sock.c change removes locking added by 89e856e124f9,
  which is absent from 5.15.y, so the quoted deadlock cannot occur. The
  core changes are needed because c531e63871c0 was backported without
  the matching lock. ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 34f89f7f993b..f1d7a6cdd8aa 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7992,6 +7992,8 @@ static void l2cap_conless_channel(struct l2cap_conn *conn, __le16 psm,
 
 	BT_DBG("chan %p, len %d", chan, skb->len);
 
+	l2cap_chan_lock(chan);
+
 	if (chan->state != BT_BOUND && chan->state != BT_CONNECTED)
 		goto drop;
 
@@ -8009,6 +8011,7 @@ static void l2cap_conless_channel(struct l2cap_conn *conn, __le16 psm,
 	}
 
 drop:
+	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
 free_skb:
 	kfree_skb(skb);
-- 
2.51.0
