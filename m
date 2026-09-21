Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9234C9E13
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005169; cv=none; b=glDspN0IU9f1AQnS+Gex5WNwbwf41YLpibhD7u+LjAkjfJ6KSXN1U8LDJl/6B6foaUWAb3lvbDzDI8fCoKw4ffgb2y1rOOTI+fdJfagu4yJsIB86bBhkEyIHkwRpSh7zS8oYr7TJkfdl9iXQK0KF8ZjgbbBxmzlztBwJQ/78h1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005169; c=relaxed/simple;
	bh=tK/DOiKTS9+8p6418bETPstSP0bDfPyum5QKnVTwCQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SFzpo9lPN6udE2tECeawie/CwDUJD1YOyey+OzCvT5fL+c7JhB0LejFGMpj0xbdknIj6MzK7wpd9Z3T2B5ABbVE8Vx5/Xe8YEV3j/7DSYhsG98pSsU9ldQAjn2SZL+1BLeVYWse0CzhypX2/rEFmkUcIZ11kxYqzo/CznStJeYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFZWYHfe; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFZWYHfe"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25187so1776110b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005166; x=1790609966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLGIKtekCp4Iv+F6FSHNltwIt7TcrRN5peUWusm9SWk=;
        b=IFZWYHfeYxiuJDvpIp2lKYUueQ4Uv/GyEM8X/JXmrNWIHmDnVZIvvxofGK20KLcNM3
         df/zA8GC4UDgifIrhFH0AYIzxTCVWEs5fxHz+7E/mruz3AfHpAr4hzmSdoK2uvM/WeL7
         q0WahKIuTTncQiH4Sy1wWpIF2426W13LYrnnn/QR4i/W5AiFi1518DPkgIpdAYKIgLrA
         V+J7vfczRyX21R6kY/ImaSTXrG6ORUw3DVAi40FHOBv9JypnnBQlSj6otSCIi2AdQHb0
         zgN0y7IrUavW89zb2XIkOyyXyeYC7FchQNtU6tqxC1vUBBG56KAcIOHE/BFYaWIW2cei
         BidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005166; x=1790609966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLGIKtekCp4Iv+F6FSHNltwIt7TcrRN5peUWusm9SWk=;
        b=Hfy5ptRK0iqN0j6RzozKVevhY7rLKtHd34qiR1gYwfpGCvbeXdFFkSAIw5ld9kVBqh
         uQpa48dzoGxos91FNmPb8+nrOVLPww4M6V1n13HirTBscEZi5mRFogXi2ZEPGgydgn62
         C9dF1Upel8CITQz1SlNDL7UxiTAzg9ZABBmk3xxpBTx4ZvRYkuf9Co8n2eE9N7ik3lkX
         CJD2VH+2vMrA4H3yZ+cZietVm8gvGIsfU/Rt0LAvKygI7mJ9juY2/s3usJ4PzY0F6GEI
         ZJ2m3oyYFjKRpenU3AUgCbl0ZHn7OAUTy84jdbDB1p8WAyyl62R+8DO8iBdZ3j8sNF3b
         9g9g==
X-Gm-Message-State: AFuF++l4Ue/ifnXJGEmNSiOx8q1uKbWCZ/qE/VsBsqURLe+sEM2Tc8wX
	ilWlnjVjl4cZKDb38QcqIDO6JXI5ClmDGUmfBeyWsLtAnDYwYWmqqMNK
X-Gm-Gg: AYBFou1AJpHhCHX16SeZTPNT/wck8Xwzz0+UEYQajhMNzwKsSjwLMVyZKM+hwvR+fPG
	4MBYJdrxn+/7BYtWdNfutwuX2PHntpavwhXIg+fpXiZOyVEDl9y94mMyUM/D2ghLYCFz+xbEnJT
	iB8xg5U1wjRzQjHjXElF7J8bvy6U9Ei4abyNKlMMtH7uv5UL3XHEKyK/h11ea41/Lj+8s9z5+fa
	/EpceckeuDq47xa8s396IeS7Bu0MdwAxLlBpklIMrC03R1Ow16zZXgXUnJn76Lbxv1STD+w5PjW
	TkxTrT1r9oC0pjJ/u07CXQqLGBTMLGg1AUurXvFG/L2srqXzT4pBD5AouB35herWTSUBNbGRXRa
	ypbrsYDtarNfFYYLYJ42Vf7BSKzr2dir8j8rF+PpsTiwPtpVhn6dCaHv8Cnzq9ADgQAIBUangwo
	SqsSlEwZVVcjQu6WuIFWTj4FPrCjyIEGfuI/nAm7IprpS4JPDOpx8nIDpM/PwvdKfBqw==
X-Received: by 2002:a05:6a00:288a:b0:87b:784b:455c with SMTP id d2e1a72fcca58-87b784b5205mr1078518b3a.56.1790005165964;
        Mon, 21 Sep 2026 08:39:25 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6ae7d71sm3448186b3a.2.2026.09.21.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:39:25 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marco Elver <elver@google.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 3/5] Bluetooth: L2CAP: drain channel timers on connection teardown
Date: Mon, 21 Sep 2026 23:39:00 +0800
Message-Id: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
References: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

L2CAP channel timers run on system_percpu_wq. Connection deletion cancels
them without waiting because callbacks may need conn->lock, but HCI
unregister does not drain that workqueue after releasing the lock. A
running callback can therefore outlive HCI-driver unregister. If it drops
the last channel reference and releases a protocol module, it still has
to return through Bluetooth code after those dependencies are gone.

Individual channel deletion has another cancellation race. It cancels
timers before calling the socket teardown callback, which can wait for
sk lock. A concurrent recvmsg holding that lock can clear local busy and
rearm the monitor timer. Deletion then unlinks the channel, so connection
teardown can no longer find that delayed work through the channel list.

Give each connection an ordered timer workqueue. Serialize timer queueing
with channel and connection stop flags, and stop each channel before
canceling its timers or calling teardown. At connection deletion, stop
queueing for the connection, cancel all four timer types, then drop
conn->lock and drain running callbacks before releasing the connection.
This lets callbacks acquire their locks, observe FLAG_DEL and return
before HCI unregister completes.

The channel stop flag also ensures that no unlinked channel can leave
delayed work behind on the new queue. The queue remains allocated until
the drained connection is freed. This adds one workqueue per connection
and serializes that connection's channel timers.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/net/bluetooth/l2cap.h | 23 ++++++++++++++++++++++-
 net/bluetooth/l2cap_core.c    | 34 ++++++++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index efb9b7f422d1..b4af087a0a81 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -611,6 +611,7 @@ struct l2cap_chan {
 
 	void			*data;
 	const struct l2cap_ops	*ops;
+	bool			timers_stopped; /* protected by conn->timer_lock */
 	struct mutex		lock;
 };
 
@@ -636,6 +637,10 @@ struct l2cap_conn {
 
 	struct sk_buff_head	pending_rx;
 	struct work_struct	pending_rx_work;
+	struct workqueue_struct	*timer_workqueue;
+	spinlock_t		timer_lock; /* protects timer scheduling */
+
+	bool			timers_stopped __guarded_by(&timer_lock);
 
 	struct delayed_work	id_addr_timer;
 
@@ -856,13 +861,29 @@ static inline void l2cap_chan_unlock(struct l2cap_chan *chan)
 static inline void l2cap_set_timer(struct l2cap_chan *chan,
 				   struct delayed_work *work, long timeout)
 {
+	struct l2cap_conn *conn = chan->conn;
+	unsigned long flags;
+	bool pending;
+
 	BT_DBG("chan %p state %s timeout %ld", chan,
 	       state_to_string(chan->state), timeout);
 
+	if (WARN_ON_ONCE(!conn))
+		return;
+
+	spin_lock_irqsave(&conn->timer_lock, flags);
+	if (conn->timers_stopped || chan->timers_stopped) {
+		spin_unlock_irqrestore(&conn->timer_lock, flags);
+		return;
+	}
+
 	l2cap_chan_hold(chan);
 
 	/* put(chan) if timer was already queued so it already has a ref */
-	if (mod_delayed_work(system_percpu_wq, work, timeout))
+	pending = mod_delayed_work(conn->timer_workqueue, work, timeout);
+	spin_unlock_irqrestore(&conn->timer_lock, flags);
+
+	if (pending)
 		l2cap_chan_put(chan);
 }
 
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 65e957fdc7ae..0df7bda54473 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -686,9 +686,21 @@ void l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan)
 
 void l2cap_chan_del(struct l2cap_chan *chan, int err)
 {
+	struct l2cap_conn *conn = chan->conn;
+	unsigned long flags;
+
 	lockdep_assert(!chan->conn || lockdep_is_held(&chan->conn->lock));
 
+	if (conn) {
+		spin_lock_irqsave(&conn->timer_lock, flags);
+		chan->timers_stopped = true;
+		spin_unlock_irqrestore(&conn->timer_lock, flags);
+	}
+
 	__clear_chan_timer(chan);
+	__clear_retrans_timer(chan);
+	__clear_monitor_timer(chan);
+	__clear_ack_timer(chan);
 
 	BT_DBG("chan %p, err %d, state %s", chan, err,
 	       state_to_string(chan->state));
@@ -723,10 +735,6 @@ void l2cap_chan_del(struct l2cap_chan *chan, int err)
 		break;
 
 	case L2CAP_MODE_ERTM:
-		__clear_retrans_timer(chan);
-		__clear_monitor_timer(chan);
-		__clear_ack_timer(chan);
-
 		skb_queue_purge(&chan->srej_q);
 
 		l2cap_seq_list_free(&chan->srej_list);
@@ -1879,6 +1887,7 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 {
 	struct l2cap_conn *conn = hcon->l2cap_data;
 	struct l2cap_chan *chan, *l;
+	unsigned long flags;
 
 	if (!conn)
 		return;
@@ -1891,6 +1900,9 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 	cancel_work_sync(&conn->pending_rx_work);
 
 	mutex_lock(&conn->lock);
+	spin_lock_irqsave(&conn->timer_lock, flags);
+	conn->timers_stopped = true;
+	spin_unlock_irqrestore(&conn->timer_lock, flags);
 
 	kfree_skb(conn->rx_skb);
 
@@ -1925,6 +1937,11 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 	spin_unlock(&hcon->proto_lock);
 
 	mutex_unlock(&conn->lock);
+
+	/* Channel deletion canceled pending timers. Drop conn->lock before
+	 * waiting for running callbacks so they can acquire it and return.
+	 */
+	drain_workqueue(conn->timer_workqueue);
 	l2cap_conn_put(conn);
 }
 
@@ -1932,6 +1949,7 @@ static void l2cap_conn_free(struct kref *ref)
 {
 	struct l2cap_conn *conn = container_of(ref, struct l2cap_conn, ref);
 
+	destroy_workqueue(conn->timer_workqueue);
 	hci_conn_put(conn->hcon);
 	kfree(conn);
 }
@@ -7416,6 +7434,14 @@ static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
 		return NULL;
 	}
 
+	conn->timer_workqueue = alloc_ordered_workqueue("l2cap", WQ_MEM_RECLAIM);
+	if (!conn->timer_workqueue) {
+		kfree(conn);
+		hci_chan_del(hchan);
+		return NULL;
+	}
+	spin_lock_init(&conn->timer_lock);
+
 	kref_init(&conn->ref);
 	conn->hchan = hchan;
 
-- 
2.43.0

