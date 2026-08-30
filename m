Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAE302753
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130720; cv=none; b=I8mFWCuD32kMQ2GaN+XiwHmqaWX88N7/8yh5AQiO5Sxplel9QAcksmCPxIhRb1q7vdNv3ztExt/XAJ3wYLXRWcbjbwotyMktuI/78jHNpE3K7iGpCbzgdpvfvuwfRHo/VIYh6xU6n9+1qlu+ETIbjJUtAVtxkXkTxBxLEsnz+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130720; c=relaxed/simple;
	bh=/G3fUORFPDuiGMJ1TA1RNFwl8lVqunjxfrCc82QFs/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqNEewiQCp9VUWcXq3aUDSndEOTj2y+5PvznYzWs0oKoGBnAh/eUxC9tFn3QeXwERkF3gffbKXKVn/0a7DIFwHFn8nY6JFQiUIzvcx9e/2XG+hyGdC2NJr5R9VssPBpOfMXnfmum5unVLrKunfPZvTXHAdL55e0msLXs3Didslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=BgFFcdfP; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="BgFFcdfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788130715;
	bh=Z0H8WgXMhNVB4fhDgpKQZagQDO0oVSF5KidTwQp0HSs=;
	h=From:Subject:Date:Message-ID;
	b=BgFFcdfPymJzB0C9BGuH8hLgikf6SVh1TT5TBj9GAIw1z2aHd7kM1nMNd6gTyxoRb
	 +1qiu4FEMEw7K6LoHZmg1+xsvZ84EAVyH+eLj47IY0r3YP9DlThMLVxoaNl+tHMcYO
	 54RBL4O6rjL3F6BPRHJMEfK3dRHSmzWdo2DJZFeA=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.34) with ESMTP
	id 6A94B58E00002C32; Sun, 31 Aug 2026 06:58:25 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8650696291648
X-SMAIL-UIID: 033BBF74D3B84ACABE7EDB35C4334983-20260831-065825-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+fe5ea83cdd7fc263f452@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] kernel panic: kernel: panic_on_warn set ... (3)
Date: Mon, 31 Aug 2026 06:58:08 +0800
Message-ID: <20260830225812.1943-1-hdanton@sina.com>
In-Reply-To: <6a946a97.1d9ded08.62e62.0120.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Sun, 30 Aug 2026 10:38:31 -0700	[thread overview]
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    08dbfad3f504 Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14f47379580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
> dashboard link: https://syzkaller.appspot.com/bug?extid=fe5ea83cdd7fc263f452
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c2a379580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16181e25580000

#syz test

--- x/include/net/bluetooth/hci_core.h
+++ y/include/net/bluetooth/hci_core.h
@@ -1701,9 +1701,13 @@ static inline struct hci_conn *hci_conn_
 
 static inline void hci_conn_drop(struct hci_conn *conn)
 {
+	int cnt;
+
 	BT_DBG("hcon %p orig refcnt %d", conn, atomic_read(&conn->refcnt));
 
-	if (atomic_dec_and_test(&conn->refcnt)) {
+	cnt = atomic_dec_return(&conn->refcnt);
+	WARN_ON(cnt < 0);
+	if (cnt == 0) {
 		unsigned long timeo;
 
 		switch (conn->type) {
--
