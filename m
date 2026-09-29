Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7050EBEF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684849; cv=none; b=ikKrx78dbcQ3S7nwE/hUIwaXXdReb/wjyEWbRXi7WzP8Ctrb6r9txKBMcCL/c3SRw/8bF7GmeBiYdO9fLmdOaBYNzvONMI7s0O2BT7nGd7IxTrfL0Z1DXv52FVeA2eWdaHnHW8fGFdhAo6gJvYclFbM+re2eYVwMwqU4mcXeccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684849; c=relaxed/simple;
	bh=/KtnBFmDTL40qZlciB0ej448hHsFTaerw9rQXD5K2n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgheI/gxxi1LvRSDk2xmQM339sf/lQHSveGJMeDZBnPR1Ny0mRI6hTk/yy4zdHCeoTVllTBFA6DVBC3xD5Hy1Ruk/bzxtS7EM10MLVYVYGI0fmUrOma8Ufm8m7ZF+Aiocn65sRCZDXLcB12eRRp/oFhWZfOa/nXgAk+iREt5Yqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PpEY3WCP; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PpEY3WCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=41
	JWrsYh/cspRpIQjNgHRcF6wjTsc90EPIdTG13fYCs=; b=PpEY3WCPN/6jr+fzyj
	pUOeO/wDQS6BcaeI3Odio9jJcH+R+QrFsJI3cKbPkEEqkB9x5mhoyx0LXOIFmLOw
	HEHIOeix5+U4SdmaECuKtnKUtxTlbUsQUkWxqScPG5EAKo3NvrV2kzk/PPllAYvQ
	cL75xXsRyWmE78KxAur8/cSms=
Received: from colol4bi5.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_7WPrrtqNUX9BQ--.13990S2;
	Tue, 29 Sep 2026 20:26:57 +0800 (CST)
From: Binbin Deng <18983559317@163.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	brian.gix@gmail.com,
	patchwork-bot@kernel.org,
	tedd.an@intel.com,
	kuba+nipa@kernel.org
Cc: linux-bluetooth@vger.kernel.orgg,
	linux-kernel@vger.kernel.org,
	Binbin Deng <18983559317@163.com>
Subject: [PATCH net v1] Bluetooth: 6lowpan: add the device to the list after
Date: Tue, 29 Sep 2026 20:26:52 +0800
Message-ID: <20260929122652.138886-1-18983559317@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_7WPrrtqNUX9BQ--.13990S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4fGrWUGry3WFyrXF1DZFb_yoW5tw4kpr
	y5KFWrCrW8Ar4jvFsFyr18WFWUtw4j9w47Gr92kryakr45ArW3uFWak3429ryrC3yFya45
	uFyUtryYq34kCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U01v-UUUUU=
X-CM-SenderInfo: jprymmytvvmjmrxbiqqrwthudrp/xtbC-BFZPWq7rpHK8AAA3d

KASAN reports a maybe wild-memory-access in chan_ready_cb() while it
walks bt_6lowpan_devices via lookup_dev(). setup_netdev() publishes the
new lowpan_btle_dev to bt_6lowpan_devices with list_add_rcu() before
calling lowpan_register_netdev(), and when registration fails the entry
is removed from the list without waiting for a grace period: during the
rollback of register_netdevice() the NETDEV_UNREGISTER handler
device_event() removes it with list_del(), the error path of
setup_netdev() removes it again with list_del_rcu(), and free_netdev()
frees the net_device immediately because registration never completed. A
reader inside rcu_read_lock() that already holds a pointer to the entry
keeps walking the list through the removed node and dereferences

Oops: general protection fault, probably for non-canonical address 0xfbd59c0000000021: 0000 [#1] SMP KASAN NOPTI
KASAN: maybe wild-memory-access in range [0xdead000000000108-0xdead00000000010f]
Call Trace:
 <TASK>
 ? __pfx_chan_ready_cb+0x10/0x10
 l2cap_recv_frame+0x5f4e/0x83c0
 ? _raw_spin_lock+0x7f/0xd0
 ? __pfx_l2cap_recv_frame+0x10/0x10
 ? __mutex_unlock_slowpath.isra.0+0x259/0x500
 ? __pfx___mutex_unlock_slowpath.isra.0+0x10/0x10
 ? kasan_save_track+0x14/0x30
 ? mutex_lock+0x81/0xe0
 ? __pfx_mutex_lock+0x10/0x10
 ? hci_event_packet+0x518/0xb20
 l2cap_recv_acldata+0xa64/0xd40
 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
 ? __pfx_l2cap_recv_acldata+0x10/0x10
 hci_rx_work+0x4ca/0x730
 process_one_work+0x633/0x1030
 ? assign_work+0x11d/0x370
 worker_thread+0x45b/0xd10
 ? __pfx_worker_thread+0x10/0x10
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x2c6/0x3b0
 ? recalc_sigpending+0x15c/0x1e0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x36e/0x5a0
 ? __pfx_ret_from_fork+0x10/0x10
 ? __switch_to+0x572/0xdd0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>

Fix by adding the device to bt_6lowpan_devices only after registration
succeeded, so an entry whose netdev is about to be freed is never
visible to the lockless readers.

Fixes: 90305829635d ("Bluetooth: 6lowpan: Converting rwlocks to use RCU")
Signed-off-by: Binbin Deng <18983559317@163.com>
---
 net/bluetooth/6lowpan.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index 30f4afa18bc8..1668fce253d9 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -695,21 +695,18 @@ static int setup_netdev(struct l2cap_chan *chan, struct lowpan_btle_dev **dev)
 	(*dev)->hdev = chan->conn->hcon->hdev;
 	INIT_LIST_HEAD(&(*dev)->peers);
 
-	spin_lock(&devices_lock);
-	INIT_LIST_HEAD(&(*dev)->list);
-	list_add_rcu(&(*dev)->list, &bt_6lowpan_devices);
-	spin_unlock(&devices_lock);
-
 	err = lowpan_register_netdev(netdev, LOWPAN_LLTYPE_BTLE);
 	if (err < 0) {
 		BT_INFO("register_netdev failed %d", err);
-		spin_lock(&devices_lock);
-		list_del_rcu(&(*dev)->list);
-		spin_unlock(&devices_lock);
 		free_netdev(netdev);
 		goto out;
 	}
 
+	spin_lock(&devices_lock);
+	INIT_LIST_HEAD(&(*dev)->list);
+	list_add_rcu(&(*dev)->list, &bt_6lowpan_devices);
+	spin_unlock(&devices_lock);
+
 	BT_DBG("ifindex %d peer bdaddr %pMR type %d my addr %pMR type %d",
 	       netdev->ifindex, &chan->dst, chan->dst_type,
 	       &chan->src, chan->src_type);
-- 
2.43.0

