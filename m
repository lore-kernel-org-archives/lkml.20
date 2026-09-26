Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3637F395AF0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790413250; cv=none; b=G5Wa1Liq1VwKl39dtYxue9U4tsjlLY/IPCV+76E2pnXGaA3FyGFr0mBCFp/iLZWUPtxtIbiNNB7D8HPkoiDVpbhJtDtax04wGcOPHL7TFY+V9SRxUPrO1kLQscHOIIg51t+tetjL5tHK3YYb9KyCaSnIUHPrydJVUXjzQLEWn5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790413250; c=relaxed/simple;
	bh=4cRsFsDt6Up/vvP7T3bPTI/3VbP0v8lPFsiVG9KdPO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrBkZwFMMygmVAdKmVnC932LPksdCJknHtixgOpDYefYZtpk60KQFcNLzj6kJF40hPCs6v8sLuzkwRUBC4X85dEGhOUwzjpe3LisfQxwr5syQOi6X7SO0AxCb2prakV2AOoudOeHpG8CKhU2OC8x+Dwpil1yoJXemtT4vF27laA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao9tJSUY; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao9tJSUY"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso2065757eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790413248; x=1791018048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=quXvg9Bk9ON8ryc8ejCwrUBsOB74NdxZSH8xzj0H2yc=;
        b=Ao9tJSUY5UWrChQkjecfKzAHceCqAJqcHPHnVptM5/oPo7hZx/440Ym5dcchkSBIgd
         uEadDVepBbWQqRbGlqnydQanPqmDLG/7U126orBGJVJ2wSz9waxfUUho31eoA0wmi/Ns
         pXDb0L7hNzKh0GyhkbITJ68T+Zn7QnU7JvfmDJZztxoxjmFbhd2CkIhSK2xOmWXiYAm7
         QL8MxdK7vP23DAeuTSRBf2jJEljVtWj3z0Yih6o/gb7MDQogrkQlBeQCOzUDAJQzZCYd
         UpawKeDsMwYMkfQY73FXhPXsUweKZZbrngrFmvzlnLp2vju+gom7EArcQu8+Vl33ztpu
         sj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790413248; x=1791018048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quXvg9Bk9ON8ryc8ejCwrUBsOB74NdxZSH8xzj0H2yc=;
        b=rfJpMdwtBsG2e+S+BlX7BLOGtkuwnSw5xGdO9du4LBcRx+y4nTIMFRSxGOhVtMMVLu
         KkxHhCr7ONOf91fcCRypWawAPaYZHHqekTATt4PZd4OLhUlQGRjVfZEsQ+Xz/KJnwR7L
         jLtWFogZBJ9Vhvv16DpQ7ZmXdoHLX8xwe0VWnVO8MqP/kRZXSQuOGaas2yyTg4BIdksG
         8za60OWnK8m4py5ZaCbSWkp9AiqkgEs9lAtMFJRLwqBHMeffaX+swFGuo3XKpE7Qhelc
         TwellTp70zp9aP3HzAZR2eE2QS7FD3m9xXx7cCoKmQndxPUvimM1HooqtrieS8DGFFxE
         2BTA==
X-Forwarded-Encrypted: i=1; AKwUvBwdImr/a36W7cI0ArxfOPV1zNJVK5Wz3eqcZPoWLPh85LA4Peaur/AU7dW64IndbsjjEo8vd7yvfVpcfwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6MIZxJ/e8+X8G8Za6qSQL/t5jnwR03cqn7Y00JtdyCshN5Ts9
	8cpzlZBtvyAKiXxFmDa4Er4JDR/zPEGp4QMHAlX7ZdcOzBaq813hqT4o
X-Gm-Gg: AYBFou2ZFB523xVFpErFTukjaV+bxhv+Sj7prnuGnhci7cbUc+YNbbZdeCk6anzwQjk
	qVmTDPg4d7817xYe8PWyFvwUJZk2e3qmd0JvNJS6EtHZrE/UxEiy+ypS6pjo/3VJepPFp5LcKs3
	BRg4ex6mkEY3qjwMokv5GAfSBDFyvt/WK4NoDY/Lz/2LsStsAZBmwBt9T46f1Hs4lJKg4QE4HQn
	YuUZNFOITjVtIPprPtgyPioMloHOykIoOwd6Fig1ziPMj5WT8EcZa4Gnrwnpy0ue39Gcvj7LrcU
	ZcBOTtQo2PzVbTBwDxKekPfwFTb7RSmcP0ADIYjc2DRr2vEAOfUKqVomOuchxCUMnbJY1Kv7Ui/
	fdXJ31vdel1Wn8ffpzMOeLFH/hJ/c0DgWq6aldf2aU6jjjJpx9gHatbEnZaSWaj+olXc95B17P2
	rViZPHAauDIBkbVh9GAOCsAj9Dgt1Nd9z/Mw/IDExYLnwPvqb23CDmaByRBAJTPLYj8rIPpmCOe
	SGFyLDT8zamvXkPF002+rNIl3eV7XL6
X-Received: by 2002:a05:7301:152a:b0:339:7c91:21f4 with SMTP id 5a478bee46e88-34273252770mr2697961eec.34.1790413247517;
        Sat, 26 Sep 2026 02:00:47 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144173a2asm13336250eec.6.2026.09.26.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:00:45 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	co+2cf741c3005abc20@bugs.sh,
	stable@vger.kernel.org
Subject: [PATCH net] net: team: stop reusing skb after queue override
Date: Sat, 26 Sep 2026 17:00:39 +0800
Message-ID: <20260926090039.1714460-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_queue_xmit() consumes the skb regardless of its return value, but
team_queue_override_transmit() treats a non-zero result as if no handoff
occurred.  An AF_PACKET sendto() can therefore make team_xmit() pass a
freed skb to another override port or the mode fallback when the port qdisc
drops the packet.

Report the handoff decision separately from transmit success and stop after
the first override port.  This preserves the existing success and drop
accounting.

  BUG: KASAN: slab-use-after-free in sk_skb_reason_drop
  Read of size 4 at addr ffff88800d5e979c by task poc/131
  Call Trace:
  ...
  sk_skb_reason_drop (net/core/skbuff.c:1220 net/core/skbuff.c:1249)
  team_dummy_transmit (drivers/net/team/team_core.c:502)
  team_xmit (drivers/net/team/team_core.c:1869)
  __dev_direct_xmit (net/core/dev.c:4990)
  packet_xmit (net/packet/af_packet.c:286)
  packet_sendmsg (net/packet/af_packet.c:3140,3172)
  __sys_sendto (net/socket.c:800,815,2281)
  __x64_sys_sendto (net/socket.c:2288,2284)
  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
  Freed by task 131:
  ...
  __tcf_kfree_skb_list (net/sched/sch_generic.c:59)
  __dev_queue_xmit (net/core/dev.c:4353,4884)
  team_xmit (drivers/net/team/team_core.c:832,1867)
  __dev_direct_xmit (net/core/dev.c:4990)
  packet_xmit (net/packet/af_packet.c:286)
  packet_sendmsg (net/packet/af_packet.c:3140,3172)
  __sys_sendto (net/socket.c:800,815,2281)
  __x64_sys_sendto (net/socket.c:2288,2284)
  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
  Kernel panic - not syncing: KASAN: panic_on_warn set ...

Fixes: 8ff5105a2b9d ("team: add support for queue override by setting queue_id for port")
Reported-by: <co+2cf741c3005abc20@bugs.sh>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 drivers/net/team/team_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index beffbe450612..59dd94271ff1 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -820,7 +820,8 @@ static struct list_head *__team_get_qom_list(struct team *team, u16 queue_id)
 /*
  * note: already called with rcu_read_lock
  */
-static bool team_queue_override_transmit(struct team *team, struct sk_buff *skb)
+static bool team_queue_override_transmit(struct team *team, struct sk_buff *skb,
+					 bool *tx_success)
 {
 	struct list_head *qom_list;
 	struct team_port *port;
@@ -829,8 +830,8 @@ static bool team_queue_override_transmit(struct team *team, struct sk_buff *skb)
 		return false;
 	qom_list = __team_get_qom_list(team, skb->queue_mapping);
 	list_for_each_entry_rcu(port, qom_list, qom_list) {
-		if (!team_dev_queue_xmit(team, port, skb))
-			return true;
+		*tx_success = !team_dev_queue_xmit(team, port, skb);
+		return true;
 	}
 	return false;
 }
@@ -1864,8 +1865,7 @@ static netdev_tx_t team_xmit(struct sk_buff *skb, struct net_device *dev)
 	bool tx_success;
 	unsigned int len = skb->len;
 
-	tx_success = team_queue_override_transmit(team, skb);
-	if (!tx_success)
+	if (!team_queue_override_transmit(team, skb, &tx_success))
 		tx_success = READ_ONCE(team->ops.transmit)(team, skb);
 	if (tx_success) {
 		struct team_pcpu_stats *pcpu_stats;
-- 
2.55.0

