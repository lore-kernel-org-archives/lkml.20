Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578748;
	b=VVJix+KULXflrQXKXAOkn4uJ/NgzE5cQvVY469iv1Eh/mw+cGeNdRhgPYtbzGZBLr5TW
	 IP1MgrBwtaKhpNdXaYO7bPxaC6Gpu7K7ngi2OVOAl7eAYqDqbccmGVjKw5DMo5REU/qmf
	 AL0ZQEE5GfdppJR7YOUDqzo5glAXjemP3xqw6iQvf9+BsPS+dQuSnbtRW0gkr6cZkYFvU
	 Js//Rbftk/d8Y8pkpYqPDgMABIbDvnYuKOE8f/urW/l3QT4l+Ji3rM5QAIpz534ZnphW9
	 yCYHqrZpdSBiQ0NVX144HTx+8kVcnNNAq025f6bfKVOz3iM+SwCjNtp1KptKcpLOQzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578748;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=jAHAPfUhlZudSrtXQUG8Xz47klJad1nKdH3wyvQmdDU=;
	b=kGZPkUGYrcJx28+zW61nm6+G9+LC49BpHFCdtl4r4br/cLsB9EtbCyWAEhhWjRdBMncX
	 cPEimCql6MjPuFEJt4e6NrrNlYg/WUIBM3Wr4femAzDUCptQPY3+BMJVxp+YSbkdLhE59
	 UNur4hHSWt8KBzLeO97veA7x79cS0G0TLT+Wzb+6eY/4xq9Cs15/ODZZj0LlsG1lFQbSk
	 tBDFFYssL+QG90sHdhe1AKdvwyGcj/ZOiwbsaIpCOUEXzrLu896fDJy3nGOWRbGjPaul1
	 U1H7x46MhBjsiy6Y5lqtVfsQEFUWlxmSjn7aKAGgbBCtGS/RDjNY/JKQi3AfTBh2HMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QhhyqtXC;
	arc=none smtp.remote-ip=91.218.175.222
Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85712606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85712606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QhhyqtXC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v7ifUx3zw968wVTV7DjirhM59hb0uWjfSr9Qa2JlfLc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794578745; v=1; x=1795183545;
 b=QhhyqtXCD+oX99CSOd6YWrOeYAIiO2ihx4SlEoxesBRkUSAQaBerDy0StRkh9xIemtHOP/5q
 LcW1p6Kci2sTck+godlWYKxAX24XxaxHKz6pB+GU1BISykBseR/12V1vlS+8Lpbt3oHanzmEzQq
 aLZzdw8eN0s6cG0t0V+/BJcs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 64e8af105d184030;
	Fri, 13 Nov 2026 14:05:29 +0000
X-Mizu-Trace-ID: 64e8af105d184030
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Fri, 13 Nov 2026 22:04:18 +0800
Subject: [PATCH net-next 3/6] bonding: complete rollback of bond_enslave()
 error paths
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-bond_enslave_restruct-v1-3-364c549e78db@kylinos.cn>
References: <20261113-bond_enslave_restruct-v1-0-364c549e78db@kylinos.cn>
In-Reply-To: <20261113-bond_enslave_restruct-v1-0-364c549e78db@kylinos.cn>
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

The bond_enslave() undo labels are missing three cleanups that the
release path (__bond_release_one) already performs:

- If bond_alb_init_slave() succeeds but a later step fails, the
  slave is never passed to bond_alb_deinit_slave(), leaving TLB/RLB
  state and a possibly borrowed MAC address behind.

- If the slave is bound into 802.3ad (bond_3ad_bind_slave()) and a
  later step fails, bond_3ad_unbind_slave() is never called, so the
  port stays attached to its aggregator.

- When fail_over_mac is automatically set to "active" because the
  first slave cannot change its MAC address, a subsequent failure
  leaves the modified parameter on the bond.

Add undo steps for these 3 cleanups when error out.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 drivers/net/bonding/bond_main.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 80b6c18ee9c2..f696a0d15034 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1890,7 +1890,9 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 {
 	struct bonding *bond = netdev_priv(bond_dev);
 	const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
+	int orig_fail_over_mac = bond->params.fail_over_mac;
 	struct slave *new_slave = NULL, *prev_slave;
+	bool alb_initialized = false;
 	struct sockaddr_storage ss;
 	int res = 0, i;
 
@@ -2120,6 +2122,7 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 		res = bond_alb_init_slave(bond, new_slave);
 		if (res)
 			goto err_close;
+		alb_initialized = true;
 	}
 
 	res = vlan_vids_add_by_dev(slave_dev, bond_dev);
@@ -2388,6 +2391,8 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	netdev_rx_handler_unregister(slave_dev);
 
 err_detach:
+	if (BOND_MODE(bond) == BOND_MODE_8023AD)
+		bond_3ad_unbind_slave(new_slave);
 	vlan_vids_del_by_dev(slave_dev, bond_dev);
 	if (rcu_access_pointer(bond->primary_slave) == new_slave)
 		RCU_INIT_POINTER(bond->primary_slave, NULL);
@@ -2402,6 +2407,8 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	slave_disable_netpoll(new_slave);
 
 err_close:
+	if (alb_initialized)
+		bond_alb_deinit_slave(bond, new_slave);
 	if (!netif_is_bond_master(slave_dev))
 		slave_dev->priv_flags &= ~IFF_BONDING;
 	dev_close(slave_dev);
@@ -2427,6 +2434,11 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	kobject_put(&new_slave->kobj);
 
 err_undo_flags:
+	/* Restore fail_over_mac in case the automatic "active" setting
+	 * above was applied and a later step failed.
+	 */
+	bond->params.fail_over_mac = orig_fail_over_mac;
+
 	/* Enslave of first slave has failed and we need to fix master's mac */
 	if (!bond_has_slaves(bond)) {
 		if (ether_addr_equal_64bits(bond_dev->dev_addr,

-- 
2.56.0

