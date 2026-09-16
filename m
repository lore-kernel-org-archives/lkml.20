Received: from mail-pj2-f28.google.com (mail-pj2-f28.google.com [74.125.227.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F70595740
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573109; cv=none; b=B1U46pJ3bU9SaWgJETj2RfrELb3qYYbLiLiewf8jmuRuqCXPtnFWwuOMc3gFLUmYTTUNxTgJrWeW3Xw4Slfki2bhDd7/4/yfNHlaeWXtQTzV41NIfGvbR7/4Sb8GNhi17+N32qVxhpkvguQAdH/sUBKBhwPER1nc7GCsyQYmpPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573109; c=relaxed/simple;
	bh=ISZJEItVJiQgJGUVeLdNnUbRuSbsORhE8CJvEj0f84o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bp9DO8fuQ9AZMuJK6x0LMFXoYYkZKtzs5hM/B6F7b9208NmSMedlMqXHKFLF3jxf5Uw9e80QdwWlWvtGDnPy5+8oz1IRKF2nvr1cNW9WT0KdpcRperY7+ZtbtdNtuoBQo247BEPX9/W+c5JHeOicQHIlciL49Xce++fK1uefCi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UduM5mIb; arc=none smtp.client-ip=74.125.227.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UduM5mIb"
Received: by mail-pj2-f28.google.com with SMTP id d9443c01a7336-2d91c22d27dso6498495ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573104; x=1790177904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TK4VaypLoqebFwLJd9cSb/TomPtSwVWfslqfBcVdmSs=;
        b=UduM5mIbVv6x2cZNSn4WjB2+JeO3Ots/73Zvlb7EPUVFYm2X87FG2SK2BlUywZEwvi
         JgCU2sfwi8IqYSlTe34y1nLwTj29RBPjSVk2Xv5T/t7cXeHTVq6yu5vPPZ9VdtWz8xaL
         Ko3DVaCzgFXo3An6E+rfA+BvD+sYkX2fRFnD2807xOv6PCIoTHiO7SwWBkA8JXLvMg9P
         JcW1JFiuACD9r9Ehelbb1vFm1pRO8bqyRD26S0vsK61SJebKKehSqyE0hQo84aDTAFXx
         zURBDBpjOeyAUjR8H7K8bgnvmAWiRF0kegkWYryplcVVjmO3pF0LdgzoNvXq/+Oyr3U0
         abeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573104; x=1790177904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TK4VaypLoqebFwLJd9cSb/TomPtSwVWfslqfBcVdmSs=;
        b=Ubur1ESDXCTlcSn0PHxgn+f51VOsL2upGxSuB1sAkomrEbS8q36RmWGMcuNT8ty9sG
         RNXhBEfJGmWjOjZfZa+AZTXL8SDFrWyoqfV8dlcfABFXceG7JpV1u7arqHOZxkdj61v9
         e+uyYUN652hjGhqyz7G/WTJUmKC9WsjexZ1f+cjWtEUaPfIrGE9Kta32eT3g1fmxfGcy
         xGI8xLspo1w0YnsWFiQkd/bplobx1VUjYoEvi7SAYWUSEnfyDFr5A1dE0Esn8bm+ksca
         SKB8FCTbYEZIgIESjgS8OyD8KaPma1+XovfS1iUIEw3z/yt+OFhqK98G8T9zF1Rw51aU
         uQaA==
X-Forwarded-Encrypted: i=1; AKwUvBxoNnN+Esu+mBTDfvk2+5iuQPaKXp9O5gHwPoRAxGXMnc+W211j4ZBrpqfwnrmTkklN1CKGHCbVM9r4D08=@vger.kernel.org
X-Gm-Message-State: AFuF++krKioZNeETxeD7xsOiAKo8BnCw+h0qCb++N2iyMTssihuvUc/n
	CUyJZE2KaXynLDfwX8La9X3jgiauOp0plXLHytd0wwOpnRivG89aVjIU
X-Gm-Gg: AYBFou2jzbTI70V72ndAcP7z1oUJz4AQ5tzpOQa7+LRSTkTbPQhyomTcfIQQsftH0Cq
	6nlhQNotPWca/QL6Gv4mufDi5gSzJwjaVgdXAX4IecyrbtQcAnTCaWJo/5eOrROT8GZJjGOmB3L
	w5RoSqmHOS5JQmJMJuXxecEULub3hsrSniSJLay0pPmuBkqNKOuAVDG64340wuqNYjX+cH5uU/z
	1sxPp7uWhp+4At/tp2h0TaMTItyWYtLw07KNdP/OpOl6rPo1Ive6p6nIlNGzP+E1IkdTNM32JXh
	Uwggyp8kk7nZ734VYIZCYbtgIoMPsOlcQ2PT5ZdO2yGv5fDcbA+Hhbc4nc2ILNIPFHtzl+4/Pfv
	KM2jBs4u51fHZQSksslowzL2dafTE24wcobuhTgwot+2Ze8imODC3VE/2KbjeZYmJG1nQqo4AWv
	DgZfrWbNuLlLTC8DqqattnMnvdewta9qhoWgfhgw2cgiVTNve17e6J+NCHBKH0bEFIZChgCrzQg
	ziOlkzqddf6TaMVMg==
X-Received: by 2002:a17:902:c94a:b0:2da:e634:370e with SMTP id d9443c01a7336-2dd8e40cfbdmr61697765ad.14.1789573103430;
        Wed, 16 Sep 2026 08:38:23 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3d29:e4bc:c9af:a918])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebc548sm13965735ad.37.2026.09.16.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:38:23 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-kernel@vger.kernel.org,
	syzbot+534002670dd34a114fdc@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] Bluetooth: af_bluetooth: hold a reference on parent in accept_q
Date: Wed, 16 Sep 2026 22:38:17 +0700
Message-ID: <20260916153818.24916-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bt_sk(sk)->parent is a raw pointer with no refcount backing it, so a
child sitting in the listening socket's accept_q can outlive it. When
the child's channel is torn down independently (e.g. hci_error_reset()
-> l2cap_conn_del() -> l2cap_sock_teardown_cb()), bt_accept_unlink()
dereferences the freed parent, corrupting its accept_q_lock and list.

Take a reference on parent in bt_accept_enqueue() and drop it in
bt_accept_unlink() to keep it alive for as long as a child points to
it.

Reported-by: syzbot+534002670dd34a114fdc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=534002670dd34a114fdc
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 net/bluetooth/af_bluetooth.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/af_bluetooth.c b/net/bluetooth/af_bluetooth.c
index 411d66f24393..f9aae18c6733 100644
--- a/net/bluetooth/af_bluetooth.c
+++ b/net/bluetooth/af_bluetooth.c
@@ -224,6 +224,10 @@ void bt_accept_enqueue(struct sock *parent, struct sock *sk, bool bh)
 	else
 		lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
 
+	/* Hold a reference on parent so it cannot be freed while sk keeps
+	 * a raw pointer to it via bt_sk(sk)->parent.
+	 */
+	sock_hold(parent);
 	bt_sk(sk)->parent = parent;
 
 	spin_lock_bh(&par->accept_q_lock);
@@ -265,6 +269,7 @@ void bt_accept_unlink(struct sock *sk)
 	sk_acceptq_removed(parent);
 	spin_unlock_bh(&bt_sk(parent)->accept_q_lock);
 	bt_sk(sk)->parent = NULL;
+	sock_put(parent);
 	sock_put(sk);
 }
 EXPORT_SYMBOL(bt_accept_unlink);
-- 
2.43.0

