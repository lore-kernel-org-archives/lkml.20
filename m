Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852C34DB56
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186647; cv=none; b=NR6i0pivh+Y19t4f1H9M6UNt0Uo2Mg2aF6wP5pDIr/2yTyv5CPbkSououYv68x5ywMXIli6Faba7tGEkDTAMht335C+LzsggtXe3gcBLg6bLg+g9lP8auW4viPYcA/ITgutA2RTjWLl8ZeJb4dnwQP2wObsIcncY+gxgTlBFNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186647; c=relaxed/simple;
	bh=QZ59mKj4ZUd2qpuSQoUIYpqfyRpwSaXfp4FROqH5314=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qEsSV76XTOkvUWSzx4NpnU+brISmtjKkwRl+UZ0rwoiPDGc3ZMkVBArRUQTM6qN2JZBTHaGwQWUKKw2ap4+j7rg5w0xqCbJK40zM5l6wLy5QW/VhLpWWjfY+jXzQJ6KX2LkhhR+K7jQP6X0YhPtXTvxsxK8bB8zXTa121FrKH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX3JKT/N; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX3JKT/N"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35126e73fdbso51250eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791186644; x=1791791444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8z19BP688py0czkN+LRGu7/Yeuom+ZY+Pv4eF3IVDqU=;
        b=XX3JKT/Ncl3lb5chRN1jcfSJMT1jJAKIYhRpdan3LLUyajzJsZ6RixlwP6tEO9EOdj
         gDLkHXw+WuO0q1+nNYLwP3j2aO2uDrfD8j3rcOs2DimpzTD2tv7jW200tE753yHW72ep
         6Qrfl2zCCspA7KOQonlXBPn2lGHkDsS3xfXJrogBCTwV7dSODXCxbCeVp/cCNW6646j6
         6rOb+8EzNHhfzrc2g+Sb8mWDYyej4PcLt/e+nxkgOCbjIdI6CpcRvQZzXcWyL5FvpSz3
         SSg2Hnbz2nnM6G6Jhw9A0tYQvCnQRW5DwtrcgJy2OkhruM6nK11ZRnnbrSskgTpnUHTc
         +w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791186644; x=1791791444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8z19BP688py0czkN+LRGu7/Yeuom+ZY+Pv4eF3IVDqU=;
        b=0jAvyDmQ5v7qZpw2Dq4RI9qDMez2rS4AF0D/HFRvxfLKtxLAsWK4OrxVeA0WZYxV4e
         pT2RMDOszggQqy1LOD7KNzLvlbgKPMYOhHfqQxmWScjoiouCVBSRWQeEy8X7BCa+piWt
         UplSSWRugiGPwzNqNmk1bh2CTkOAIal9hecdSTEhDuTtpW7YYi3KX2l9sGvJK+PPArAh
         8jEiGtWvJyvDaE6BiGsVVg3Q3b2SJmt8GM3TGl2HMzLG72gRlOK038XuAiQD5UD9fa8j
         iDrGjh8Ca9F6/BcOOXhFqYrhieml2L/OjSDBRno/rIX+agaudoSF2p/8NkmsZH0v2AuJ
         d2AA==
X-Forwarded-Encrypted: i=1; AKwUvBz6dD8G5DtJ0fUHfbzvPypKFR7vvm2hdtrTYpgzfp8LCOrAe7jO6WGzPJ5Sv3yER/hZP4EmwzG56XelWCE=@vger.kernel.org
X-Gm-Message-State: AFuF++kJuQ1Z+ztzlkUAq3kfXZ0WTtD+uTqqga63HAb1MZ8VYjfUJMRT
	XiQ4SNq4l/0kKLypqyNvb7D4UXpbs9u76O54Y0Aj4DJtVnEUoeMFyoSL
X-Gm-Gg: AYBFou2xlpKoQGBvCie5AEf2e1Cd56h1YejVIq6M+RUmMh7yioqVcbspj8RXZTkBfJG
	kbWos2MwYyDU+tx+SzSepiBG2QiEmNU8TTI2Bhs1lyJi0Urtxam5y1hJmWQnuRgE0WT0SyK8O3X
	D9uDS4U2nQQA6cp9fYK0FgU1b3cYBBejq3K9aeBqG7CAgNdsbaYRrvSMkGxu02RbfcPciIUQ9Jd
	Kvnva3E0FSyltkv9bRCTWo7BI7c1aE8uTpG1c9naZhKcGKCYSBKwRTsSBCLpq44uCMyyLf3pePN
	bT2i/38euEgNrrMsg5hgd3Qhcri97EHmGHmfd64mLm5Lvn2CwkRjZX3knd7PV3p7YCpF7dCUnOH
	J2HI8gi51+Dxqt8VvDfcpf3iHyTIWBf9irwPKsxzyG7mxBAqWY38Iu+07WIuBa6PtRS2BD6RFej
	K/o0zg3M6cQp5LDfsou84fn5vY8OqXrZ4WAwuifTYulLxVrQTbIGW2gdzhTHBDtKBdHOLXE8n33
	Lzk5ArxKnulzkcYAV1XpS21d8sO7xYmVaHGb81DnRRzH8aN158K7njW7tn6ifI4+0hUwg==
X-Received: by 2002:a05:7022:6896:b0:147:d430:7322 with SMTP id a92af1059eb24-14f5a646964mr26661077c88.1.1791186644196;
        Mon, 05 Oct 2026 00:50:44 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fca985c6sm28706150c88.10.2026.10.05.00.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:50:43 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Pauli Virtanen <pav@iki.fi>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] Bluetooth: ISO: Serialize concurrent connect calls
Date: Mon,  5 Oct 2026 15:50:31 +0800
Message-ID: <20261005075031.868260-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iso_sock_connect() checks the socket state before taking the socket lock
and drops the lock again before setting up a connection. Two callers can
both pass the admission check while the socket is open or bound.

Caller A can copy its destination for route selection, then caller B can
replace the socket destination before A binds or connects the CIS. A
then uses B's destination with the route selected for its own request.
B can also proceed after A attaches a connection and sets BT_CONNECT.
For deferred BIS setup, B can bind a second BIS and overwrite
iso_pi(sk)->conn, leaving the first connection's reference and conn->sk
back-pointer stranded. Concurrent CIS connects can likewise replace the
socket's connection. Later teardown only detaches the current connection,
so a callback on the old connection can race with socket release and
access a freed socket.

KASAN reported:

  BUG: KASAN: slab-use-after-free in iso_sock_hold+0xf7/0x1b0
  Call Trace:
   iso_sock_hold+0xf7/0x1b0
   iso_conn_del+0x7b/0x1d0
   iso_connect_cfm+0x186/0x16a0
   hci_conn_failed+0x154/0x280
   hci_abort_conn_sync+0x3dc/0x7d0
   hci_cmd_sync_work+0x173/0x300

  Allocated by task 121:
   sk_alloc+0x2b/0x6d0
   bt_sock_alloc+0x29/0x370
   iso_sock_alloc.constprop.0+0x19/0x300
   iso_sock_create+0x94/0x100

  Freed by task 121:
   kfree+0x121/0x3c0
   __sk_destruct+0x42b/0x540
   iso_sock_release+0x29d/0x340
   __sock_release+0xa1/0x260

Check admission under the socket lock and mark the connect operation in
progress before publishing its destination. Keep that flag set across
route lookup and connection setup, rejecting another connect with
-EBADFD before it can change the destination or attach a connection.
Clear the flag after either helper returns, including on failure, so a
failed setup can be retried.

A separate flag is needed because the socket lock must be released before
acquiring the HCI device lock, while BT_CONNECT requires an attached
connection. Keep the existing state transitions and the deferred CIS
completion through iso_sock_recvmsg().

Reject an existing socket attachment in __iso_chan_add() before taking
a new reference or publishing either pointer, so every caller preserves
the connection association. Keep the same-socket, same-connection success
case for deferred CIS setup. Reject an attached socket before BIS setup
so a reusable BIS is not claimed before the attachment is rejected.

In CIS setup, reject a different HCI connection before iso_conn_add()
and drop the per-attempt HCI hold directly. An unowned iso_conn may still
carry another reference after detachment, so its destruction cannot be
relied on to release that hold.

iso_listen_bis() creates a fresh PA HCI/ISO pair under the device lock,
so the temporary iso_conn_put() frees the ISO candidate and drops its
HCI hold on rejection. iso_conn_ready() uses a freshly allocated,
unpublished child with no connection, making the socket-side rejection
unreachable.

Fixes: ccf74f2390d6 ("Bluetooth: Add BTPROTO_ISO socket type")
Cc: stable@vger.kernel.org
Suggested-by: Pauli Virtanen <pav@iki.fi>
Assisted-by: GPT-6 Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
Changes in v2:
- Reject an existing socket attachment in __iso_chan_add(), as suggested
  by Pauli Virtanen, while retaining same-connection deferred CIS setup.
- Reject an attached socket before BIS setup can claim a reusable BIS.
- Under the socket lock, reject a different HCI connection in CIS setup
  before iso_conn_add() and release the returned HCI hold directly. This
  also handles an unowned candidate whose iso_conn has other references.
- Keep the connect admission guard to protect destination publication
  across route lookup and connection setup.
- Rebase on the current Bluetooth fixes tree.

v1: https://lore.kernel.org/r/20261004162458.3968546-1-nicoyip.dev@gmail.com
Review: https://lore.kernel.org/r/225d8d84c8e5155d5af0adfbea270eeeda326021.camel@iki.fi

 net/bluetooth/iso.c | 47 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index 7657c2a0abbf..37e5f084d9ed 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -61,6 +61,7 @@ enum {
 	BT_SK_BIG_SYNC,
 	BT_SK_PA_SYNC,
 	BT_SK_KILLED,
+	BT_SK_CONNECTING,
 };
 
 struct iso_pinfo {
@@ -350,6 +351,9 @@ static int __iso_chan_add(struct iso_conn *conn, struct sock *sk,
 		return -EBUSY;
 	}
 
+	if (iso_pi(sk)->conn)
+		return -EISCONN;
+
 	if (!conn->hcon) {
 		BT_ERR("conn->hcon missing");
 		return -EIO;
@@ -410,6 +414,11 @@ static int iso_connect_bis(struct sock *sk)
 	hci_dev_lock(hdev);
 	lock_sock(sk);
 
+	if (iso_pi(sk)->conn) {
+		err = -EISCONN;
+		goto unlock;
+	}
+
 	if (!bis_capable(hdev)) {
 		err = -EOPNOTSUPP;
 		goto unlock;
@@ -562,6 +571,13 @@ static int iso_connect_cis(struct sock *sk)
 
 	lockdep_assert_held(&hcon->hdev->lock);
 
+	/* The socket lock keeps the current attachment and its hcon stable. */
+	if (iso_pi(sk)->conn && iso_pi(sk)->conn->hcon != hcon) {
+		hci_conn_drop(hcon);
+		err = -EISCONN;
+		goto unlock;
+	}
+
 	conn = iso_conn_add(hcon);
 	if (!conn) {
 		hci_conn_drop(hcon);
@@ -1269,17 +1285,26 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 	    addr->sa_family != AF_BLUETOOTH)
 		return -EINVAL;
 
-	if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND)
-		return -EBADFD;
+	lock_sock(sk);
 
-	if (sk->sk_type != SOCK_SEQPACKET)
-		return -EINVAL;
+	if ((sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND) ||
+	    test_bit(BT_SK_CONNECTING, &iso_pi(sk)->flags)) {
+		err = -EBADFD;
+		goto done;
+	}
+
+	if (sk->sk_type != SOCK_SEQPACKET) {
+		err = -EINVAL;
+		goto done;
+	}
 
 	/* Check if the address type is of LE type */
-	if (!bdaddr_type_is_le(sa->iso_bdaddr_type))
-		return -EINVAL;
+	if (!bdaddr_type_is_le(sa->iso_bdaddr_type)) {
+		err = -EINVAL;
+		goto done;
+	}
 
-	lock_sock(sk);
+	set_bit(BT_SK_CONNECTING, &iso_pi(sk)->flags);
 
 	bacpy(&iso_pi(sk)->dst, &sa->iso_bdaddr);
 	iso_pi(sk)->dst_type = sa->iso_bdaddr_type;
@@ -1291,16 +1316,18 @@ static int iso_sock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 	else
 		err = iso_connect_bis(sk);
 
-	if (err)
-		return err;
-
 	lock_sock(sk);
 
+	clear_bit(BT_SK_CONNECTING, &iso_pi(sk)->flags);
+	if (err)
+		goto done;
+
 	if (!test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) {
 		err = bt_sock_wait_state(sk, BT_CONNECTED,
 					 sock_sndtimeo(sk, flags & O_NONBLOCK));
 	}
 
+done:
 	release_sock(sk);
 	return err;
 }

base-commit: 08e90633377f1b2567ab5ad6810b74c552246a07
-- 
2.43.0

