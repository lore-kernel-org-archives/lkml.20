Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E543BB687
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131180; cv=none; b=EGzORolzqoBOcpit5SZVuu1c6/YGWii9vVAiCkvCq7kGm0YU6stybm9AtbkOvyCfanzvuS02jnDPnLNcHO0uLAI1TiVXMqEm23Sar2KE0lfl49H04UzzotAR2xTpcQ4Hlky77JYNVIwgP+kNSfKeK6KZiqVK8N8/pKpyKVQzHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131180; c=relaxed/simple;
	bh=Rj63DgR20oiwFDDc12/4Ve6f46BYY+nTaOfWOvX5CNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfCNS1oclld2KwRBrs73dqzCVcGfrFXie05/2EK3CZqrKeFg44Eqa+T2lHq/23t4FhksDVsHGe/VHJe07aHywBajcKEMQ+9RVIIqX+bMQ+rkiqs+mIJIASAu4P5NgaukwAAkMIGHntDt7CyAgRVL3nLUdDSQwG1uYzRXvQkfe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qvk0aRfI; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qvk0aRfI"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-15602439e3bso6975c88.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131178; x=1791735978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yikDAY6J+GlEGObfqqnaCvM3+Krl2SbWGorcnJKWLX8=;
        b=Qvk0aRfI4PS08pt2e3It3JwW7TiU0iMUNWzS377Mu/KEYZV9SMV4l71WT/RgjPR1pQ
         cp7ubkA4aUGQoZbK2ZaKqjVIzLXkEaao0NpxuoViDazWZUCms/r2y6+jYMsS+/rMdEgS
         WXs6Umj0r8GsAjWETon/uol3URFCG/q/HYNhESfkxZ6Am/GW+ZLp8nmT5UvhQUfWbO4j
         XuTdgKrNmdmG1kMWLasUtS83TtdHI5IKJKeIcVAxPlITmyDdJvqxAOKf9shQVty7skdq
         ixak08g3IwEHpRX6iZb9Juzjz2XEipv23z9G9RsrRM3zzACu3TtqoIhef8oNVb+ZNOpQ
         I/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131178; x=1791735978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yikDAY6J+GlEGObfqqnaCvM3+Krl2SbWGorcnJKWLX8=;
        b=qj/7Idfe7wDmxS+MU0DWtQUiyMiQ6b/mrZDFT3vQRHBNO/hEbojI+TuKKIA0R7L06q
         ca5I9nF7wRRBP7/xw428irzgpVC6JT7T0QxLQkAsAgpYUhjW5Ig5u17D9gn67Jn/vJFg
         7dbs3LMduIbIMOOMb6BHOsBwcPOOu7rRD1b+ocqqXhejkKMmyjTKhMMeZqoGu0RrGx1g
         /gmeYeZ9MTnqMdsyHFTzccyGL5rV1NuncG/zLNQCWHl2bmik6OZJVcijLQB+WRDrM2n2
         MTFRR4Pxqq+wFUogJ8uuzyl5sW0Et6HXQCQpTPfpSaip/RCoaYhb6qN/PWUP8oK27dMv
         m/CA==
X-Forwarded-Encrypted: i=1; AKwUvBxygoEKGC81I8WHHfJAYb+Q9INgUutJcTUWzPMFw6U24OaL3hjZA1hJGd7SI+uVuoIhPAY0Uz0X1sDFlzY=@vger.kernel.org
X-Gm-Message-State: AFuF++lr3XFJsnKVrNwRMUugsZWPcsp8/C76dTP7dDeF4gVKU+Jo0UND
	q5sFJgmbySkxRsup6JH4vsIbvB7+DugfVQqpd1guELKCx3ixlvmOmNFJ
X-Gm-Gg: AYBFou3p+E/4flsdQSBeHQMdu9keUc+oaS+8Nh8A+hS0BxMuTPi/nrQKrFTGj2Ch4Yq
	/4Hon8/rKz34qmqhRN5+xOQWON05PKlLTRdqNhe5eGobOiEaZOuxj9582Ni+LtnTscPhWoswuMv
	jwekOXGTQmCcOpMw/uJYlX+svE06qN9tYyQhPo5G7AteGhGpsh2CqI6K912UKxFI5S5MmlzGmEI
	fMH6uMp/UvIkCICzQVExgsx6MvU5OrnsDjzjycTahefV5JtEirnd+Lb0et0sJdcoJS5cPIkp0AB
	T/R4Hekih3PGdcnYrVEVUvRt2g22PuKvcxp341klvD7tB7TYRr5E1WRJP2FD5UOzC83PrP//eO0
	4szQQREwIbmLvqKQsJldGTle8eX7yXce/eGP3+uT4TWfFZs2QGHyxbP91596boq2h4k8mPZ6m1+
	9zrkUVVpVFFGSUlHbqZ397nJJ6bHHv7j052Yoxsm1mjHznrIgGiIQ/MDF+PgQMP2iLIgj0rovbh
	7MBTvOTz71I3a5xiqRXwpz1eCGDBsCVaYjZ2rNQOnOLoDbsgUVl483jsIwEPI1Zs3PqLQ==
X-Received: by 2002:a05:7022:b047:20b0:14b:edb2:c3bc with SMTP id a92af1059eb24-14f5625d203mr17992869c88.0.1791131177596;
        Sun, 04 Oct 2026 09:26:17 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9f1dsm15511885c88.16.2026.10.04.09.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:26:17 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_sync: Fix command skb lifetime during scan setup
Date: Mon,  5 Oct 2026 00:26:12 +0800
Message-ID: <20261004162612.3968831-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During PA sync scan setup, hci_le_set_ext_scan_param_sync() gets the
address used for the PA_LINK lookup from hci_sent_cmd_data(). The
returned pointer borrows storage from sent_cmd or req_skb, without
holding a reference to either skb.

The scan worker runs on req_workqueue while hci_cmd_work() runs on the
separate device workqueue. After the scan worker loads sent_cmd, the
command worker can free and replace it before hci_sent_cmd_data()
dereferences the skb. The command payload can also be freed between
returning from the helper and comparing the address. The connection
lookup's RCU critical section does not protect the command skb.

KASAN reported:

  BUG: KASAN: slab-use-after-free in hci_sent_cmd_data+0x27c/0x2f0
  Workqueue: hci0 hci_cmd_sync_work
  Call Trace:
   hci_sent_cmd_data+0x27c/0x2f0
   hci_le_set_scan_param_sync+0x43a/0x850
   hci_passive_scan_sync+0xb09/0x1460
   hci_update_passive_scan_sync+0x47c/0x6e0
   hci_le_pa_create_sync+0x200/0xa70
   hci_cmd_sync_work+0x13c/0x290

  Allocated by task 95:
   skb_clone+0x13f/0x340
   hci_cmd_work+0x2a9/0x7e0

  Freed by task 95:
   kmem_cache_free+0xba/0x3a0
   hci_cmd_work+0x29c/0x7e0

Use hdev->lock to serialize the address snapshot with sent_cmd
replacement. Protect req_skb replacement and completion cleanup with
the same lock because the helper falls back to that skb. Copy the
address before releasing the lock and use the copy for the existing
RCU-protected connection lookup. Release the mutex before sending or
waiting for commands, preserving the lookup and completion ordering.

Fixes: 22cbf4f84c00 ("Bluetooth: hci_sync: Use QoS to determine which PHY to scan")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6 Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/bluetooth/hci_core.c |  4 ++++
 net/bluetooth/hci_sync.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 2076689eb302..74d9865e08c2 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4115,9 +4115,11 @@ static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
 
 	bt_dev_dbg(hdev, "skb %p", skb);
 
+	hci_dev_lock(hdev);
 	kfree_skb(hdev->sent_cmd);
 
 	hdev->sent_cmd = skb_clone(skb, GFP_KERNEL);
+	hci_dev_unlock(hdev);
 	if (!hdev->sent_cmd) {
 		skb_queue_head(&hdev->cmd_q, skb);
 		queue_work(hdev->workqueue, &hdev->cmd_work);
@@ -4138,8 +4140,10 @@ static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
 
 	if (READ_ONCE(hdev->req_status) == HCI_REQ_PEND &&
 	    !hci_dev_test_and_set_flag(hdev, HCI_CMD_PENDING)) {
+		hci_dev_lock(hdev);
 		kfree_skb(hdev->req_skb);
 		hdev->req_skb = skb_get(hdev->sent_cmd);
+		hci_dev_unlock(hdev);
 	}
 
 	return err;
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index c01c8b58d9e8..a92a81846e9d 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -32,8 +32,10 @@ static void hci_cmd_sync_complete(struct hci_dev *hdev, u8 result, u16 opcode,
 	WRITE_ONCE(hdev->req_status, HCI_REQ_DONE);
 
 	/* Free the request command so it is not used as response */
+	hci_dev_lock(hdev);
 	kfree_skb(hdev->req_skb);
 	hdev->req_skb = NULL;
+	hci_dev_unlock(hdev);
 
 	if (skb) {
 		struct sock *sk = hci_skb_sk(skb);
@@ -3064,15 +3066,21 @@ static int hci_le_set_ext_scan_param_sync(struct hci_dev *hdev, u8 type,
 	 */
 	if (hci_dev_test_flag(hdev, HCI_PA_SYNC)) {
 		struct hci_cp_le_add_to_accept_list *sent;
+		bdaddr_t bdaddr;
 
+		hci_dev_lock(hdev);
 		sent = hci_sent_cmd_data(hdev, HCI_OP_LE_ADD_TO_ACCEPT_LIST);
+		if (sent)
+			bacpy(&bdaddr, &sent->bdaddr);
+		hci_dev_unlock(hdev);
+
 		if (sent) {
 			struct hci_conn *conn;
 
 			rcu_read_lock();
 
 			conn = hci_conn_hash_lookup_ba(hdev, PA_LINK,
-						       &sent->bdaddr);
+						       &bdaddr);
 			if (conn) {
 				struct bt_iso_qos *qos = &conn->iso_qos;
 
-- 
2.43.0

