Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772187;
	b=tergbx3a6GdnqwMlG54XfGODwVbQsoOCdD1L/WrSI/AKSiLrsaDH2W1bbWPsGgt4JKaq
	 Ql4Iv9HYk7TJaOf8i3I2QUxdn3r6Bm1fp4XtS9De/pT8x9gryWamO7smn7aJjJkXOUfzJ
	 Bdq+/IK/dmpIt8RLMF8RYJ01kyUsxlmJbH704etvzB3uvF4/r92jZunB2wfF3jNukojkQ
	 tjPggsjCQqw+rBZ4bniK8blCBZy9ok7kwau0ryG+B0G/7OCC2x+EiNQmh3fgnNxnlS4TJ
	 sG7bUMzE9DbbuNUfDJLJU8iS2IMS2fMBMBsDhBiY3ljpDGkB3sMuc4MCrprjwevliwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VjWZk5Ysq/SQOD4Gke0N4NJOcsOb82saox1WDZ3L2Vk=;
	b=Mo/nWS0cUHCwO4NAYYZK3ZX0wo6pLiMyQUsK3GwIs9M8UBEjEP2nozybKTjSoQSuWjF/
	 bw6xUx2AyKAlzwsKNaSyAbNNq4w1MoOrefICvC/rFtUNdOrEdVlu0kFrmC/Km+tEeT7zD
	 nIlzMNGNvGF+HNzdHJZm9TN9wXAbZluVUZEaPcn4LAV9tYD+cpEGChMIfxU74fENE7mS2
	 o9cW9FnsRyIN+e483owG2gOpz5Kr6ZvMczpXI6pLg9tM/+XK5nD+dd7BWVHEh9PEoXeRO
	 9yL+AjdAXotfa8M4/yv4nOn+r4N3RjnDadtDWFDJqA3t+CkvigxUMNC5aHHYsbNHCcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KR8zFmSk;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C8606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E5C8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KR8zFmSk
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1517bda04a0so1188268c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772185; x=1793376985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjWZk5Ysq/SQOD4Gke0N4NJOcsOb82saox1WDZ3L2Vk=;
        b=KR8zFmSkeWLb10MAiGUWiJv5ajxMN77q/5X2piD0RRHHcMcDaWJnxCzI4rNDVpaPAL
         g+PgT53752oWqnahLN1MbQMhS2GxFDIXeOZSw7NWdktvpPvLCbnwd+G0eSYXt0+G676F
         Vd9szUF1QY6cZtrjaWVUA/SZ5Q7dccU+6UwHEyHwSQB1jsochijySdgLHG85lkCCCfBp
         EuWTYa5u4aREC6xQe7wXy1+6+zBS8LYMQAp1mDZX6GJLF2nIVNG99grJezgZ7XyC9Kor
         EmkYorcc9kKJfzeAelWuS+EpsvlQLyc89i5ye3DMF6Xw1xGyzcDOtRU77SLpRQOgQjev
         k0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772185; x=1793376985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjWZk5Ysq/SQOD4Gke0N4NJOcsOb82saox1WDZ3L2Vk=;
        b=RUj8x7pftDoBu7tmo3yvrKplmr0tYewILMpaJKxs4v9U9kszvFJFfaQtlTlQYdYGJY
         LN0HPr9e7YG4vmHNdJGtUkKTFUn9r7ixjjh/nxn20Vx8HkvnbT50nWWJRY/FRYdr8wDg
         4FgVl6DaChQrXdDgEg9qBlkkw6Fv0qBoPVJXrf79pPcLfbglZdhj1HZKveyHuMXaxQ4H
         vXNi5gg6RKyI0XNG7g6vUvOVnP9bNQ6smM/7qTZQxJ9TTOktdbFGXbafb+EYjxgiOgXq
         dwHYIUqA7cGb+IwaCAz/2oRHOZjpW8ANNOV1/phiykq91+zTcVVKMg2OBBOt7Uco/q4E
         TNbg==
X-Forwarded-Encrypted: i=1; AKwUvBz87XFHjS8IEgQ6gdvXl58qRKbZTfteKTaSS4+S41HW59L1EYdwKQ+4slXWUOhMWbA1a08gPgr4bt1Gyl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGS67xboYLDQfol5btH1Fu7XtrGbmu1cMaY3Inl0N2Onq6uQzu
	hGRxNiRtLqjq/erY5l6EkS38SZf1umzbsRvNIrHtiJba4mh5w/BubCG6
X-Gm-Gg: AYBFou1cxt4IM/2rW/cdQVCO84jspZLdhX4bXkIgZi3nqO7vSDOi7dyfwI+uYIPS7xq
	HbU6OJBqhusEvD+rQ8JCdTY44Q03bibAYECCCThwmc0LCgFzuGFZvRZTeBJ3DgdnYzW+bgZyi9l
	I4SR0dvVBgOlirqCwFYKB8IEFDYA9ivs4YVi1MSIHVryrNekTSOUNDfv7XJnA0DVgMyQOq1WMks
	svd53LF1eqycUCB3trMO+UvaWQUN6bQtD6K2Y2OBOfsYYXDNoXiBXlyiIdCyHy1mF8F3hFbgg2a
	BLckaG6VfRT/YwONROKJ+plLw4r/Jvl/vFvnSrPOUAwLvXx4kA6KxOJ6iOyycsh+65RHcGM+qP6
	VxZuszqpi4trNolsyfRqldOe9yBwCzKmKP4b9c22rQIZtBSnihBhqphpSMPjuDEpFnzHUzjPC9A
	I0CBSwigfjb3Ujg97slREgbeHdIPEgUu3EJkEJxujy5e1reayxx/JJAIagpHVLLKY/mRdQz1FEL
	ubG8r7mdD0cxGB6nEfEJkYvvS1FKEEQxsCVhbM7w0X1XpCBhAzpPkTrHJ1+Kw52xKi+Cocvnyvr
	z71Ys/jmxw==
X-Received: by 2002:a05:7022:7e8d:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-195c4f4f8dfmr3674258c88.16.1792772184769;
        Fri, 23 Oct 2026 09:16:24 -0700 (PDT)
Received: from akhil ([157.51.31.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197eb82311csm1189077c88.9.2026.10.23.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:16:24 -0700 (PDT)
From: Akhil Arul <akhilarul324@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Akhil Arul <akhilarul324@gmail.com>,
	syzbot+2344fb8002f3ef5b1712@syzkaller.appspotmail.com
Subject: [PATCH] Bluetooth: hci_core: Fix queuing rx_work while workqueue is drained
Date: Fri, 23 Oct 2026 21:46:09 +0530
Message-ID: <20261023161609.253097-1-akhilarul324@gmail.com>
X-Mailer: git-send-email 2.56.0
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

hci_recv_frame() drops a frame unless HCI_UP or HCI_INIT is set, but the
check is not synchronized with hci_dev_close_sync().  A driver can pass
the check, then close clears HCI_UP, flushes rx_work and starts
drain_workqueue(), and the late queue_work() of rx_work hits the
draining workqueue:

  workqueue: cannot queue hci_rx_work on wq hci0
  WARNING: kernel/workqueue.c:2352 at __queue_work+0x2c0/0x780
  Call Trace:
   queue_work_on+0xb2/0xc0
   hci_recv_frame+0x18f/0x330
   vhci_write+0x174/0x240
   vfs_write+0x271/0x680
   ksys_write+0x7c/0x110

Skipping the queue_work() while HCI_CMD_DRAIN_WORKQUEUE is set, as done
for tx_work, does not work for rx_work: the flag covers the whole close,
and events still have to be received in that window, for the commands
sent by hdev->shutdown() and for the reset done with
HCI_QUIRK_RESET_ON_CLOSE.

Run hci_recv_frame() under rcu_read_lock() and wait with
synchronize_rcu() once HCI_UP has been cleared, so that every caller
which still saw HCI_UP has queued its work before the workqueue is
drained, and later callers drop the frame.

HCI_INIT does not reopen that window.  Apart from the
HCI_QUIRK_RESET_ON_CLOSE reset, which runs after drain_workqueue() has
returned, it is only set by hci_dev_init_sync() during open, and open
and close are serialized by hci_req_sync_lock.  So once the grace period
has ended, nothing can pass the check and queue rx_work until the drain
is over.

Tested in qemu with the syzbot C reproducer, one run per boot: the
warning showed up on 12 of 30 boots before and on none of 42 boots after.
Bringing a vhci controller up and down 50 times behaves the same with
and without this change.

Fixes: 76727c02c1e1 ("Bluetooth: Call drain_workqueue() before resetting state")
Reported-by: syzbot+2344fb8002f3ef5b1712@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2344fb8002f3ef5b1712
Signed-off-by: Akhil Arul <akhilarul324@gmail.com>
---

Notes:
    Base: bluetooth-next 27731ba09195.
    
    Testing, in qemu (KVM, 2 vCPUs) with the syzbot C reproducer, one 18 s
    run per boot, counting "cannot queue hci_rx_work" in dmesg:
      before: 12 of 30 boots
      after:   0 of 42 boots
    The kernel has PROVE_LOCKING and PROVE_RCU enabled; there were no lockdep
    or RCU reports with the change.  "command tx timeout" lines from the
    reproducer's flooded controller appear at the same rate with and without
    the change (2 of 30 and 2 of 42 boots).
    
    A vhci controller that answers every command, brought up and down 50
    times with HCIDEVUP/HCIDEVDOWN, behaves the same with and without the
    change: 49/50 up (the first HCIDEVUP returns EALREADY on both kernels
    while the controller is still powering on) and 50/50 down.
    
    Cost: the extra grace period makes HCIDEVDOWN of that vhci controller
    take 7.8 ms on average instead of 3.7 ms (50 cycles on each of 3 boots
    per kernel).  hci_dev_close_sync() already waits for one grace period at
    its start; that one cannot be reused because HCI_UP has to stay set
    while hdev->shutdown() runs.
    
    Not done: no test on real hardware.
    
    hci_recv_diag() also queues rx_work unconditionally and has no HCI_UP
    check at all.  It is only called by hardware drivers (btusb,
    btintel_pcie, btmtk, btmtksdio, hci_qca) and by the coredump code, not
    by vhci, so the syzbot reproducer cannot reach it; it is not touched
    here.

 net/bluetooth/hci_core.c | 9 +++++++++
 net/bluetooth/hci_sync.c | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index d7291eca1..2a29cfdee 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3002,8 +3002,14 @@ int hci_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	u8 dev_pkt_type;
 
+	/* Pairs with synchronize_rcu() in hci_dev_close_sync(), so rx_work is
+	 * not queued once the workqueue is being drained.
+	 */
+	rcu_read_lock();
+
 	if (!hdev || (!test_bit(HCI_UP, &hdev->flags)
 		      && !test_bit(HCI_INIT, &hdev->flags))) {
+		rcu_read_unlock();
 		kfree_skb(skb);
 		return -ENXIO;
 	}
@@ -3039,6 +3045,7 @@ int hci_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
 	case HCI_DRV_PKT:
 		break;
 	default:
+		rcu_read_unlock();
 		kfree_skb(skb);
 		return -EINVAL;
 	}
@@ -3052,6 +3059,8 @@ int hci_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
 	skb_queue_tail(&hdev->rx_q, skb);
 	queue_work(hdev->workqueue, &hdev->rx_work);
 
+	rcu_read_unlock();
+
 	return 0;
 }
 EXPORT_SYMBOL(hci_recv_frame);
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index c9e80b957..93dfe2e9b 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5667,6 +5667,11 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 		return err;
 	}
 
+	/* Wait for hci_recv_frame() callers that still saw HCI_UP, so that
+	 * none of them queues rx_work while the workqueue is drained below.
+	 */
+	synchronize_rcu();
+
 	hci_leds_update_powered(hdev, false);
 
 	/* Flush RX and TX works */
-- 
2.56.0

