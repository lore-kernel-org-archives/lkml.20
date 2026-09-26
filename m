Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1E374E5A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442261; cv=none; b=AheOyFF9OVdff79JOJFyizNx6oRQHucsIC4ZkrRzacxZN7RXxj9gdq7HUEbbCLqFkBnE7ZCPnsYAftgSyBCFLXCsl3F01/Hb2A15wrYwvMH5KmR1uqe6dN0nJAKYssRo7zUOpbC1nL21u2aYeMjAQX0DpGOVjUhudq/h5Drr9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442261; c=relaxed/simple;
	bh=FOTy/TBPMa65c0zW+/hXfcPf2be11FeCATWE+c9E1vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpQdsDp4bH79Pna/1jnPtenI1CVVPm6iObi3BDZRtqyVfgsPLWLaRrXhE4ET+17PwV2GbPlfde38oz7GwS39zUBWbHxMTa+6GAhKajP5Aj8koEppOBAsCCrdd7i7gu8DRCUaVUOMuXZtaBFs50owVV4s917fLU9+s/DI1aI+mEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihr3FdRI; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihr3FdRI"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-14373bcbfe5so64468c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442259; x=1791047059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lW9B3RFKax9dJ+z9f2YCeF20/rKA4gk2jBKeDVcp2oU=;
        b=ihr3FdRIjVBHgpuxiYnjnz42PDw9n/ehAAun1V0NVDmVXvZti5XlOeoi0O34yCOMDf
         EPROAX125ewX28PX2lGsZ9GglvMKyouM8VpnULj8LUH9ggDNHTxxc5lMGVazVm6sJYYb
         NUm3bQyowbNQ9SarBZWvYSe/K5wkCRHQmrynIfoY9WjVDopuqFjaZ0CifjvLSmgVfWAL
         dIKctOb9Qd7xKnpsBldok9nvW9JvRjajfs4bQWlVVLohvp2LM6N6tJi5ugD/rAo/dcr3
         qAhRIvJzeKpyuV+4zB4qZLk+bWo3mnQ2mu21dwnNUARAQxEzziF053UzBskA2CnD/mDO
         eZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442259; x=1791047059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW9B3RFKax9dJ+z9f2YCeF20/rKA4gk2jBKeDVcp2oU=;
        b=nGhAIoWC0OZQvTnx0KH8NqoigSmZBh5On/JZvQ1bf1wZB2p+jwlKcvxxt8vclqLzGd
         PV+2iNHXqdZdCsURMfWfRBuOr+Ik3DB3I4Cz4Vqu7vU1PC5eyH3gxBdVY8OJusEIRfnT
         qokI0CH+lqLWBWqzzHkAMmiCIBBrlDKNLGNyZZTokynOF8NmZrlxdOV49le0NUiYY0+m
         upaEvcdJhwZCQ4I4P++zxr7Y5kNrwthyB0rfi9ZCjhFZvTnkhvgrwa4eA4j1G3w8Um1a
         ZLQMzWWDUeiJ3nBQZ4/Hmdiw8MUYvNxFftRUmv6EwSgmJ5oYAijQcqSevRdjyc3AocWG
         WPTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+q5lwNAM5XuxvwlpC7bDT8iNIRwlCifDqOUmsb4jBCRLu91J+/2GSb9kEh9JoOy71PdvwqgzjvB+H060=@vger.kernel.org
X-Gm-Message-State: AFuF++la9jM3/DQHmxiqz4zei0Rde2LNwTZkSvKYOUKrUBEGVTL7FA8+
	se7BjUcBnIbdyWvGX5u7wBQelo9yICTigA5fBmDDoyX3CSFv+FEKjRC+
X-Gm-Gg: AYBFou3kkGtzGumZf6GRvemBUUw3uf1WsJYMynmBh7hdhdPfi7YlaM51WHBNzsCK7Sp
	+/5SfBcAYR+j8sLeTCrnrgboAebUAWZwXPQYlzZA5wekzRfmSIQkB0McIhYdNWfOd7unliIBpQM
	zRgkF3eIPvSWyV5J2AvzYHm+pTqSGM/VTJDt6elWfF0XeOfO+vb3LXoldAqwHwtzY5KP+7GU2Sw
	lpb5JbgAUtID0grQ7Bj9wG1licbozKS70MbqTre7nQuYQ/HhhN/fN/rFNh4uwQmXJBBEWQ3J4sm
	EOEW16cYDw5hxYRDLDRVGlbtXgQyLpks08e8lfI3ncNZimerkYjwnlQhAx63wuYJz/9ZtZdWlYx
	gBkBWLUMlKqBCuupv36oYpbRWPemadkaUjNxoJTZ0JjmlVsr3Jj/QoKuSldMSykn2t73BzqrGEI
	mV+BOEYI/soot0s/KvQyy9gvbaSxd/+9OX6ttrIdFEuKeIDFGF8ms6ApDRv7juhl2cvHGC24nEq
	sRzGiln3wEVrhwpEd2dzDy6ibh0Eoev99q8bewK/qNS2WAZaMqJvPFhp/yaAixeQVTysg==
X-Received: by 2002:a05:7022:5f11:b0:127:def:dd72 with SMTP id a92af1059eb24-146cfdcf467mr4623512c88.2.1790442258542;
        Sat, 26 Sep 2026 10:04:18 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm13343905c88.0.2026.09.26.10.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:04:17 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Gustavo Padovan <padovan@profusion.mobi>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 2/2] Bluetooth: hci_core: Serialize SCO and ISO scheduling with teardown
Date: Sun, 27 Sep 2026 01:04:03 +0800
Message-ID: <410c2b78a2bdab548f1794cae2a131ad32f23b6b.1790407061.git.nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790407061.git.nicoyip.dev@gmail.com>
References: <cover.1790407061.git.nicoyip.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hci_low_sent() selects a connection under RCU but drops the read lock
before calculating its quota and returning it to the scheduler. The
connection is then used without lifetime protection by hci_sched_iso()
and hci_sched_sco().

After the TX worker drops the RCU read lock, hci_abort_conn_sync() on
hdev->req_workqueue can remove the connection from the hash, complete
synchronize_rcu(), purge its queues and release it. The TX worker on
hdev->workqueue can then access the freed connection in hci_quote_sent()
or while dequeuing packets and updating conn->sent.

KASAN reported:

  BUG: KASAN: slab-use-after-free in hci_low_sent+0x730/0x840
  Workqueue: hci0 hci_tx_work
  Call Trace:
   hci_low_sent+0x730/0x840
   hci_sched_iso+0x25e/0x4d0
   hci_tx_work+0x239/0xcb0

  Allocated by task 93:
   __hci_conn_add+0x16f/0x1b40
   hci_bind_bis+0x782/0x17b0
   hci_connect_bis+0xa0/0x510
   iso_sock_connect+0x589/0x1050

  Freed by task 88:
   kfree+0x131/0x3c0
   device_release+0xc8/0x240
   kobject_put+0x14d/0x280
   hci_conn_del+0x55a/0xe80
   hci_disconnect_sync+0x156/0x180
   hci_abort_conn_sync+0x3e7/0x940
   hci_cmd_sync_work+0x13c/0x290

Hold hci_dev_lock() across connection selection and transmission in both
SCO and ISO scheduling, serializing them with connection teardown. This
also prevents queuing completion timestamps after the connection queues
have been purged. Extending RCU across transmission would be unsafe
because the transmit path can sleep. Keep the ISO timeout check outside
the mutex since hci_link_tx_to() takes it itself.

The preceding channel fix already holds this mutex in the ACL and LE
schedulers, which call the SCO scheduler between packets. Move the SCO
body to __hci_sched_sco(), assert that its caller holds the mutex, and
use it directly from these locked paths. Keep a locking hci_sched_sco()
wrapper for the direct calls from hci_tx_work(). This avoids recursively
acquiring the device mutex while preserving the scheduling order.

Remove the obsolete claim that connection removal disables TX.

Fixes: bf4c63252490 ("Bluetooth: convert conn hash to RCU")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/bluetooth/hci_core.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 24b46ccd4da2..985c58dc6da8 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3402,9 +3402,6 @@ static struct hci_conn *hci_low_sent(struct hci_dev *hdev, __u8 type,
 	struct hci_conn *conn = NULL, *c;
 	unsigned int num = 0, min = ~0;
 
-	/* We don't have to lock device here. Connections are always
-	 * added and removed with TX task disabled. */
-
 	rcu_read_lock();
 
 	list_for_each_entry_rcu(c, &h->list, list) {
@@ -3609,13 +3606,15 @@ static void __check_timeout(struct hci_dev *hdev, unsigned int cnt, u8 type)
 }
 
 /* Schedule SCO */
-static void hci_sched_sco(struct hci_dev *hdev, __u8 type)
+static void __hci_sched_sco(struct hci_dev *hdev, __u8 type)
 {
 	struct hci_conn *conn;
 	struct sk_buff *skb;
 	int quote, *cnt;
 	unsigned int pkts = hdev->sco_pkts;
 
+	lockdep_assert_held(&hdev->lock);
+
 	bt_dev_dbg(hdev, "type %u", type);
 
 	if (!hci_conn_num(hdev, type) || !pkts)
@@ -3650,6 +3649,13 @@ static void hci_sched_sco(struct hci_dev *hdev, __u8 type)
 		queue_work(hdev->workqueue, &hdev->tx_work);
 }
 
+static void hci_sched_sco(struct hci_dev *hdev, __u8 type)
+{
+	hci_dev_lock(hdev);
+	__hci_sched_sco(hdev, type);
+	hci_dev_unlock(hdev);
+}
+
 static void hci_sched_acl_pkt(struct hci_dev *hdev)
 {
 	unsigned int cnt = hdev->acl_cnt;
@@ -3685,8 +3691,8 @@ static void hci_sched_acl_pkt(struct hci_dev *hdev)
 			chan->conn->sent++;
 
 			/* Send pending SCO packets right away */
-			hci_sched_sco(hdev, SCO_LINK);
-			hci_sched_sco(hdev, ESCO_LINK);
+			__hci_sched_sco(hdev, SCO_LINK);
+			__hci_sched_sco(hdev, ESCO_LINK);
 		}
 	}
 
@@ -3745,8 +3751,8 @@ static void hci_sched_le(struct hci_dev *hdev)
 			chan->conn->sent++;
 
 			/* Send pending SCO packets right away */
-			hci_sched_sco(hdev, SCO_LINK);
-			hci_sched_sco(hdev, ESCO_LINK);
+			__hci_sched_sco(hdev, SCO_LINK);
+			__hci_sched_sco(hdev, ESCO_LINK);
 		}
 	}
 
@@ -3772,6 +3778,8 @@ static void hci_sched_iso(struct hci_dev *hdev, __u8 type)
 
 	__check_timeout(hdev, *cnt, type);
 
+	hci_dev_lock(hdev);
+
 	while (*cnt && (conn = hci_low_sent(hdev, type, &quote))) {
 		while (quote-- && (skb = skb_dequeue(&conn->data_q))) {
 			BT_DBG("skb %p len %d", skb, skb->len);
@@ -3785,6 +3793,8 @@ static void hci_sched_iso(struct hci_dev *hdev, __u8 type)
 			(*cnt)--;
 		}
 	}
+
+	hci_dev_unlock(hdev);
 }
 
 static void hci_tx_work(struct work_struct *work)
-- 
2.43.0

