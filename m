Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8B3C942C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717901; cv=none; b=Fjl7oPJMiOxvctZ4jHvFhMlx3cHyaP5qol5sd88dQaEjENMV54zk+BxZMEL8noe+qKXlQUfCtUPIoTl0+l4ED2tm+8c0FBNDlRbZ1jEgrs7pSA8nIZHcOp2snAHm7NCyoxdS6THtPb0CcGJzNWLjsuUa0Ii69Bf1qhTB61Rxzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717901; c=relaxed/simple;
	bh=KJSVqQwx8vaFc/VlLJ8ktzVwyFRQS13isuj0PmR6jCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpW+2iWK2ogBd5WDXlVxA7jL7iBoBkuMWkW9UE4b8MYgXGpmSst/OhYbTMkzEWIUHaROQUvus/8P5Ljl8jQbLQFdGZfa46e2pwMccw/XDEYFpw7rn9gDTOAA2msjC1v++o9S73UAcrH0ONbEbhwrRA4NM6Pl+2Gn3ldELskG1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv68BLAa; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv68BLAa"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso262639a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789717899; x=1790322699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWuQSIHV3WmHTRMyq/cgIVZh8edfC9vHWJ9QDa8mOlM=;
        b=bv68BLAaMKJTLnFiuuVfOd/fv3lvBc9scD8yBuhuuk+m9HAOCZj0sLKFG8DqVH7GJU
         vi5hXlJfslJnYBI4VxwbTo/LMC4LQxGho5jJCpsAYGokQJWKxGFd2cFy3JUZWf+s+LBA
         1y+jtxQrl7WStwoiaQVRnEyLLSy8s/5GKgVCqIYUSfmypLc0mniZ9Um9zV+0UiJ/OztS
         VBFRMmh770OL2Y0ZT+QrNnXJL1ucG8AkXEjZPVgmL9oO7ITOhiiQRTK7RiCksz+Sbh3M
         Ye2XQJKIT65kNn3ntfa95YkhWdPClo8xGdjOGsDYFW4UmFzOpYItEDLJm4k3zAwMvaF/
         BFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717899; x=1790322699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWuQSIHV3WmHTRMyq/cgIVZh8edfC9vHWJ9QDa8mOlM=;
        b=rzWtu//HdFssD89cU1gRXKDBCCvNzTSWi7ozHoHWeXvQvk89lWtGnQsS/epls/1Ma2
         JlZ8qdUx394B77HLkQiETN3gO31jCrI/XzVtcyh6FSXNqJ8TSZ1dCDmQdjBEo5HqHciv
         J/cTnR5gNVIfWWtBkG42lB+j6yxAjjtn+OPEvRXd66N9Ea3HLLVDuu2nWKHYh1YANxvy
         hZLRzsEVNOAFjzT2qppTVxIKBdrO8B8UFI1R8+8xUnu6MnKpUoJQilEeLGkeeUK0tZJR
         L3SbxXDy249/YUErA7P2xA3A0ggVYEi3fD6JsQvdTWoFIzjG5mdohn0QDhCnX6vCHqTm
         o0iQ==
X-Gm-Message-State: AFuF++nRrjVeYLzk9J61aera42yv8qpMYyb1o6BVrzPnVv6onkikfeA2
	u0YY3WBSlGXp6/XisACldMjb/Lh/UwjfKzf6XmlU94I84TQ875x6zUfKYgVUpA==
X-Gm-Gg: AYBFou1zonhIMIvd9Y5KlPjmYmi4N4ZrX/a7MrLjMgonyW9CQgjNLLQ+7+/+cdNheOS
	LC6A2up2f/pBxUEUT7+05H9OTodDZKfOQ+mGYJTQRF1RTTY9JYmX+OOjrcD1ejRhKl30LC8ipo5
	WdJind2itzC5iJWcBYEEbRupmiovWnRkXlDi3ViszH+QgY8pDdWetk8Hjnsm6MSWX6mp7hwEXr5
	Mm+g3h+A113NWh+4dOKe7eGcYCCz+cOg3wjgV6BCVYXKsVNQKXmVgJ9rmR4aSBoJpFFsBzCj9qY
	yspyFhtoht84zGmIBwq6vXFVyD+qr9LEFoCLV+bLprXGm9slX6rczPJChf9qYeUD34H+lsgblvv
	eSnN2whBUwnF7puRio0ikDwo+6JBd/D3qzV1NKJ1jvnIyuLKbr2qxG8Tv8ont0cPIBmdQmgcyxS
	GUgQ9CgtjgGAtUH7xxZ4nWOU6veCFEWszCiWCOxsE0d0dkJVnVm7IH7iPvMRpthMTOoeyHeRe9E
	TIy5LHO36bZ1G061WS73A==
X-Received: by 2002:a05:6a21:6083:b0:3dd:64fa:5520 with SMTP id adf61e73a8af0-3dd8c4287dbmr3710377637.9.1789717899247;
        Fri, 18 Sep 2026 00:51:39 -0700 (PDT)
Received: from thangnn-Dell.vingroup.local ([101.99.23.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bc987e59sm506559a12.4.2026.09.18.00.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:51:38 -0700 (PDT)
From: ThangNN22 <ngocthang2710.1999@gmail.com>
X-Google-Original-From: ThangNN22 <v.thangnn22@vinfast.vn>
To: linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	syzbot+534002670dd34a114fdc@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	ThangNN22 <v.thangnn22@vinfast.vn>
Subject: [PATCH v2] Bluetooth: af_bluetooth: Fix double list_del and UAF in accept_q
Date: Fri, 18 Sep 2026 14:50:20 +0700
Message-ID: <20260918075020.885434-1-v.thangnn22@vinfast.vn>
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

Signed-off-by: ThangNN22 <v.thangnn22@vinfast.vn>
---
v2:
 - Add !list_empty() check inside accept_q_lock to prevent double list_del.
 - Move sock_put() outside of the spinlock to avoid sleeping in atomic context (suggested by Paavo Helde).

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

