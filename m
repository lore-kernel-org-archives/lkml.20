Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83828392C48
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116656; cv=none; b=V/qXsaeIRYaoSKsI2HQVJPKdmQu+siR6/FxacN2Z9c7IM8xFnutztcuCtqN5ZIz1L6EI6gck2HcDNv6mT86yelbzNj2qKAFZPaAeLfJDvIfplxpktWXZOIN0E1YRo37PniA1V7K/bUys6azZbOdhBQdYfa4DM1j9A0Mx4SgmKoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116656; c=relaxed/simple;
	bh=OpdjBYgaTWyOr126Ga4B3w/I1luszmhGmLKIvIHtxBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rD8JZ/etCEyTMs+4cy3XfxtRGPql+MgZY7YI8CGV61P+e4s9iqvrzQtr3EytrD8aOUjfxIVNiADxBLBQJMshKtKLo8XkcsIg7khoe1/JO3J52HiU/ypCUpAgSKWOl5DvPy5gXewTkiKvXxM8MV0xuL+CWpWc7LoleNTPYrxYVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=cTg6gD4k; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="cTg6gD4k"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so1329332eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792116655; x=1792721455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOyMu6hv8/hpYKWZjXm3BxqRnHG/BQ5MHKEieuUFu7c=;
        b=cTg6gD4k6SbUAHktHcmfKyv0t1xyzs0yw1C6pM9vy/RU2YcN7KCJOuvoR4MVNIu9aP
         5LvztFrztINpmphqhG2zjtzuU/Z1HqkyVbFYREJU6Fjf60snf3SyZfcep+iUgTli8iLn
         lW2pp4ZqGsp9hq+zh/tAn/RKsnkkM/TEHoDL9TsSy3YyUPvEwhGVBlXUQQh0tUfNCeD4
         2CcyKh7DjNPwKhsOJUkAhYUSOoKu9dEfA9p/SMRaYjHBYS+w25n0lea9OHCMGdwAJv2L
         twNUKK9c+sgViKrHwiYW1Iz92le7z72xmh9czpZmy9iqc6AfzZonZ/c7SvSZ9la1HonZ
         4P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116655; x=1792721455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOyMu6hv8/hpYKWZjXm3BxqRnHG/BQ5MHKEieuUFu7c=;
        b=j8Q6j6QQxe/34DIExPUwpVBsNzIEmif9Cksokyo2d3Wqd020FBk8Na5dAyBqAsitwh
         hMohGzmX48MzsLFG1caB/AhIjrufc27SU7sNkVFHRXmci3X0XJcwYGtLaJY/aOzGn2o9
         QADlmBOjUu/NWyyL/M7oTKy3sDYeA+guXKNj7+VYmA3OEhMSqavDh7nByCf2QOh/hO3O
         1/aeQVB1cTJVR2glkFMjEhyWxY+OPc+0Vsy/RB4fMDo0b+QW2EQHwVS5bwoT7182t3VM
         cSf3SRVrea1GNn5Tid8ANdRwKBMfYlobkrq8iGz9vlFjAukB7bFbrkpz8qC/UGe4k911
         lWgQ==
X-Forwarded-Encrypted: i=1; AKwUvBypRthCDaBkr04ShibdUXovNwVilbiig5IBlaogSgHeJpPJU4oyheKtUFWjvkCYwxIPw+OLNcOUU34Qvs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy/JEY4kWkVS0NlkVuS3jLFGda/HdVeWK+ZmF60IHx/5wIiSgE
	3apd/mB28P9fOPXYf3OWxI3IAU+/AsT0UbuMX0wruoRJ8g+bNqKAazsIBKD/pGithLM=
X-Gm-Gg: AYBFou1ahN+GeazNII0Af1GMIRSW7DCQJwu8H+x7ubWs6SNEUDO6GLB7SxqCKKmJUo5
	2jPEjoxbk/0HiQynT4woMGIO551qxzPyST8iIzn8OoYc1eFrY1KqweGFNd4vPJ2nR4KzqvnkjSC
	UV22wtnhnBM0IBtiKuGAhIJ8IMwblcj/j4DiKOH40KmbklU4AEyw/ikA5cCYcofiJrHxJXdqQ6/
	1EzZV3/goGXQgVyFoWA4a4K//kUAgfAQLzNKQSngZJh1udQuhxlH0f6ekLBNop9YnA0r4I4tYEa
	gA4rH7UO/T0rPlyYTyuUjJPtun3squ71D+/MJ5rLxG83KaV4a9nsm+V/m8uM+VpM2vIbpI5/l1L
	2T9oyJsV8m4GwQ4b1r1OsEcO3dFo6lXeu7nfrRa2I8GXYL7+gg0iM7/bULH+a+nte+h28LZKEDg
	eGrm1x6A1YCkuS5yf0Ff0hAydSkbfcAcrdh+Q+Ds04nE+iyb4fhFIS7xHPkfBmtb5D302+vfHmA
	vOcMwI7uUg17Z7y1vBePr1jXytE5IeXS/OGvY/Z/1F/xqMvzkIQ5RZa62L0qjYAlt3C/GARpRuw
	ACbS
X-Received: by 2002:a05:7301:1987:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-35df3cb100cmr14091442eec.5.1792116654532;
        Thu, 15 Oct 2026 19:10:54 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:d66:d0e8:dae3:3257])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm2638280eec.28.2026.10.15.19.10.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 19:10:54 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luiz.dentz@gmail.com,
	luiz.von.dentz@intel.com,
	marcel@holtmann.org,
	ngocthang2710.1999@gmail.com
Subject: [PATCH 6.6.y 2/2] Bluetooth: hci_core: Fix queuing tx_work after workqueue is drained
Date: Thu, 15 Oct 2026 22:10:47 -0400
Message-ID: <20261016021047.16461-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016021047.16461-1-artem@trailofbits.com>
References: <20261016021047.16461-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ThangNN99 <ngocthang2710.1999@gmail.com>

[ Upstream commit 6610c6fe4b8936c232048e6049bf77c70a6f759c ]

hci_send_acl(), hci_send_sco() and hci_send_iso() queue hdev->tx_work
unconditionally. They can run from the L2CAP/SCO/ISO socket send path
while hci_dev_close_sync() is draining hdev->workqueue (HCIDEVDOWN
racing with a socket write). Since that queue_work() is not chained
work from the tx_work worker itself, __queue_work() sees the queue
marked __WQ_DRAINING, warns "cannot queue %ps on wq %s", and drops
the work:

  WARNING: CPU: 1 PID: 5985 at kernel/workqueue.c:2352 __queue_work
  Call Trace:
   queue_work_on
   l2cap_chan_send
   l2cap_sock_sendmsg
   ...

hci_dev_close_sync() already sets HCI_CMD_DRAIN_WORKQUEUE before
draining, but only hci_cmd_work() and handle_cmd_cnt_and_timer()
check it before queuing. Route the tx_work producers through the
same guard via a shared hci_sched_tx() helper.

Fixes: 525daaea459f ("Bluetooth: hci_sync: Set HCI_CMD_DRAIN_WORKQUEUE during device close")
Reported-by: syzbot+b6919040d9958e2fc1ae@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b6919040d9958e2fc1ae
Signed-off-by: ThangNN99 <ngocthang2710.1999@gmail.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-98297 to 6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series on x86_64
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 net/bluetooth/hci_core.c |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index d4fac0987dd8e6e03aa756788c80dc78bc9d8a86..3dcd8dff594603fc989182319fb84df97cc1c709 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -3233,6 +3233,17 @@ static void hci_queue_acl(struct hci_chan *chan, struct sk_buff_head *queue,
 	}
 }
 
+/* Queue hdev->tx_work, unless hdev->workqueue is being drained by
+ * hci_dev_close_sync(), which would otherwise WARN and drop the work.
+ */
+static void hci_sched_tx(struct hci_dev *hdev)
+{
+	rcu_read_lock();
+	if (!hci_dev_test_flag(hdev, HCI_CMD_DRAIN_WORKQUEUE))
+		queue_work(hdev->workqueue, &hdev->tx_work);
+	rcu_read_unlock();
+}
+
 void hci_send_acl(struct hci_chan *chan, struct sk_buff *skb, __u16 flags)
 {
 	struct hci_dev *hdev = chan->conn->hdev;
@@ -3241,7 +3252,7 @@ void hci_send_acl(struct hci_chan *chan, struct sk_buff *skb, __u16 flags)
 
 	hci_queue_acl(chan, &chan->data_q, skb, flags);
 
-	queue_work(hdev->workqueue, &hdev->tx_work);
+	hci_sched_tx(hdev);
 }
 
 /* Send SCO data */
@@ -3262,7 +3273,7 @@ void hci_send_sco(struct hci_conn *conn, struct sk_buff *skb)
 	hci_skb_pkt_type(skb) = HCI_SCODATA_PKT;
 
 	skb_queue_tail(&conn->data_q, skb);
-	queue_work(hdev->workqueue, &hdev->tx_work);
+	hci_sched_tx(hdev);
 }
 
 /* Send ISO data */
@@ -3335,7 +3346,7 @@ void hci_send_iso(struct hci_conn *conn, struct sk_buff *skb)
 
 	hci_queue_iso(conn, &conn->data_q, skb);
 
-	queue_work(hdev->workqueue, &hdev->tx_work);
+	hci_sched_tx(hdev);
 }
 
 /* ---- HCI TX task (outgoing data) ---- */
