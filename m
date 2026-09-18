Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA25B4CCDEB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728497; cv=none; b=D79ZlOP2DC7LHX7hzzGaCRvG/rgpL8R81pq7Q+sG4gDlAxjmzEEhFfhIlRUw+w2E6+iM7hIptRSPGXorWVk78X4PYa2YKv3uHba8qObCY6TBNDixvTGWF9r99+0wqFt4pI3WaJx9LvXzpXTFqa0hZS/5sdagsaP3fRmYa3zK7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728497; c=relaxed/simple;
	bh=GUoNXGoRu/YXogOq9X/rgu4d8MQqhVuvIq9UPe1IZDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gUHblZ+6jG/9jhG4jVRVr52rDPn3h7+jlE7Ab4zCjzxYkYQt9D4p3oVIMHG1jB8Kw7fRnt2QcrEgFI8ZDgTMO+8eKAaR7muNVG+gCYyrqKqLIZbSQWiXVhfB3bcF6PwnVMbbkwn/Ysk2z/j/SHtfzosQctwn/dZlunciqCTmgLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ue0vSpnM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue0vSpnM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso429480a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728494; x=1790333294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwK7hDaTxVvRj/kN5UmwJrv3y8N+AsYHVz6dYPsaA6Y=;
        b=Ue0vSpnM/eNgywHjWRcnJb8fS+J5eC9h1EOhCvMjPxddPdbeWVGmXAqNad7ILHi0OY
         vrJEbN1IhwYsZD4NoCxj0eNmbQZyAeZliuXFlRIVyeww+gCJRe8/5azssph+J7yW3HE+
         8dyGVdmtWw/zXm97VcOEk8aXwVlULlhngeEmOjJu7lOBb/JjJD7pksM5h5NwkQsH64o1
         gIRAyPDNbeoj5rz3scRaMkEd+jGqX8IYUF38D6LrYqrsvaE5sEBrCSY10TKs+u5ACsAc
         BQLnY/OEi/P6FV/I5ZMSEhPQP248kLK6sZatbwdwFDkbx88robT/12X0N8exJ1l4pslE
         Swwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728494; x=1790333294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwK7hDaTxVvRj/kN5UmwJrv3y8N+AsYHVz6dYPsaA6Y=;
        b=NMdyb9TwxALW32l+MR7JjlX/2DioPP3zRZ2VHXW+mSJkz5YVMUJR+xgx/scvos8sp9
         ikO0m3tWJ6KOYivqrltwA97PAulhO7qNxF76mVnO2BXEJuXi+vA3yihlp75o2+alF5GQ
         1q3xV/yoBdjXcMwVV8Z+EfuM7wkCmSoTLJP8sYBm/sVRc8ffUbRAO4V6PKT8/r/EYnSN
         ks0QhzwgFF3KllpBOJ8P/v8m3uxq0eG9j7q0FAyasiBz8A8E8rmkzJ0WTbjSxJKRSI2i
         i9gfCEyqYbzlJ3FxiXRFSLRm7b+3dVERiOScCuVhIyoO9wvjEAFyUHWO1RgrNZNZ7A0j
         1nSQ==
X-Gm-Message-State: AFuF++m5c2C+LNXJIqdI0nk9TusYSR0i5EzD47uQ3XdALCoxC9en8ugw
	9uhL8fh2NcLLCVB86YPTP/yTo0JplIJvbwvzo3vqcjFOABVd7UpshWeb
X-Gm-Gg: AYBFou0EovQdZqbIruMBtJTU9sbi5S6WqiWThfFzhm9Z1P1iYzFSHAdKxxli3zykFYW
	enTjSWbYH0Rx39LAeqC3qzt0Ujl5aB6QWcg29R3b0ZVaDtyoh9y39uvDHc2BdtfZCz3+LH2wIYJ
	7+KJ1amRz0vD4FHuw7wpbkDelpReyIhrS9M/YnecNysM/3dOOA4CYuYVrjAX27Kb5PZpUv5znof
	35ZCVJLxNbNTulfqAbnfMZFrVAhJcuAWgqNanfz8xITNiVVOrz3lijNdMglhAA9d/fdDJnuVGCf
	LlGh7Woi5U/hAJQ4locMsu4iwxEYEwR6pXLF7ya9sensQchYjed5UgJyGRl+5+9wNIzGuw5omm+
	4tpHoYeoUQtYpjy8lZQ5levKSdLeMcPfycz2YTVvIgegpeLhGxGPCnZdomZpwJAdckpqZoAP2il
	0xrXV6BVMNlvBe/y6aeLzWxFbDu/g+jkup/QglvBhGcRT27PgrUqwVK8gKZf0a7yIphqzueUVJY
	FeOGKN/XDaFIaUpbrZTCNIm76X90kyU
X-Received: by 2002:a17:90b:2d8a:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-39e54d38b59mr5317868a91.6.1789728493789;
        Fri, 18 Sep 2026 03:48:13 -0700 (PDT)
Received: from thangnn-Dell.vingroup.local ([202.60.105.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50d332sm2659573a91.9.2026.09.18.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:48:13 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	syzbot+534002670dd34a114fdc@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v3] Bluetooth: af_bluetooth: Fix double list_del and UAF in accept_q
Date: Fri, 18 Sep 2026 17:47:36 +0700
Message-ID: <20260918104736.958613-1-ngocthang2710.1999@gmail.com>
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

Additionally, if multiple threads concurrently tear down the child
socket, bt_accept_unlink() can be called multiple times. Without
checking if the socket is still in the list, the second thread will
perform a double list_del_init(), causing list_del corruption (kernel BUG).

Fix this by:
1. Taking a reference on parent in bt_accept_enqueue() and dropping it
   only when actually unlinked in bt_accept_unlink().
2. Checking !list_empty(&bt_sk(sk)->accept_q) inside the accept_q_lock
   to prevent double unlinking.
3. Moving sock_put() outside of the spinlock to avoid sleeping in an
   atomic context.

Reported-by: syzbot+534002670dd34a114fdc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=534002670dd34a114fdc
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 net/bluetooth/af_bluetooth.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/af_bluetooth.c b/net/bluetooth/af_bluetooth.c
index 411d66f24393..7797b1052808 100644
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
@@ -257,15 +261,24 @@ EXPORT_SYMBOL(bt_accept_enqueue);
 void bt_accept_unlink(struct sock *sk)
 {
 	struct sock *parent = bt_sk(sk)->parent;
+	bool unlinked = false;
 
-	BT_DBG("sk %p state %d", sk, sk->sk_state);
+	if (!parent)
+		return;
 
 	spin_lock_bh(&bt_sk(parent)->accept_q_lock);
-	list_del_init(&bt_sk(sk)->accept_q);
-	sk_acceptq_removed(parent);
+	if (!list_empty(&bt_sk(sk)->accept_q)) {
+		list_del_init(&bt_sk(sk)->accept_q);
+		sk_acceptq_removed(parent);
+		unlinked = true;
+	}
 	spin_unlock_bh(&bt_sk(parent)->accept_q_lock);
-	bt_sk(sk)->parent = NULL;
-	sock_put(sk);
+
+	if (unlinked) {
+		bt_sk(sk)->parent = NULL;
+		sock_put(parent);
+		sock_put(sk);
+	}
 }
 EXPORT_SYMBOL(bt_accept_unlink);
 
-- 
2.43.0

