Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1524AEEF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498396; cv=none; b=W3s2kH96XZ+4vUuVaE+dgFw3xJ48N8roYCSnFPQBtn95mJgiKfUdkJbC0j+FmS4e127cMgaJ6vQ4+DzhBYOq3MH35U9K/iZI2AbZh74UE4IvXyfknYvlLOu3wRCD+jc94lntKO/S+gPa/54RW28J6RsyJg8khQ0MKVD6SBbs5nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498396; c=relaxed/simple;
	bh=P2AJlJENPvJS7GPy0iCZJp6A75CwIyadtSbULF4M3cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Frx4//gZGojs33Opma1Ce/J4kwBx4+zB5erT+rrtVuYXCLjrsX6XDdz2VFHQq1qp19+gKSRU+KEoIfNAVPJejgTgNPYOEopQ+ZJnndNwNKy9+7BUmDgzd8+GH7fQgqqNNfpnLNHbGY7UkKh9T3delL6ZTwWk4NUox7dPn4BAZRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8gh+hSn; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8gh+hSn"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-34e23e22666so156690eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791498394; x=1792103194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9ooXR6Y09KtjeY/pkwXIKyVeGH6jcslX5LxHatrik0=;
        b=h8gh+hSnPemb+3azxWInyw7tT3B217JlhpEFOqQ0NCsvHduJ9OnrnoHdzRJkFCeh0W
         ADfK4P1QbulqvXuFL/6eyDgHggWhsROnqfYF0x6jY8rstaolVUBZ5ycwevJTcxcOruXe
         GmHZRw60z8X+NGxPH7IKs+3PpSRh3LHTBu66mzOaRDrGYnucVyJM//5YiqiaWDgd3qpu
         L7ncDdwo0LGI1LywuwsEMUe3RdBIMOaaoV92k3aQOnJ/EFvYfv46ls6vdYJ45WmKdExy
         JgDvDfb8ztTyX/MIJTFkB+0NNkag0m5Fk49vGxcgpmjU8dj1MEBVFXtrgbNRFkhGwz2M
         2koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498394; x=1792103194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9ooXR6Y09KtjeY/pkwXIKyVeGH6jcslX5LxHatrik0=;
        b=zO/NP374ZH/1pFUwftpnTeDL/jf5d2xEup68/Bhgt8cYsIZcBdCtn9Hm/LrfIx6Ymq
         ntm/i+mDnTOux3qTadVvgUPxNX0OnjGuj80ikybftldJKUtETNCoT0gS4ix/SPTqxfY7
         TPrX1GtUkZllx5u5UBiWIFWABL2E80KZS6JaH13txRcxI5OCxuKVx3D3XLCXcZLKeAJy
         TrBunJ7zzjWlgPhPUUN+t5cr/V9W4bFU24q51nGiwMoBde9dSnnSY6Hyaxta/PmfTSgr
         1xjf7W1bqQNYix5E9toVpejxg8bqBlyfmAWEC0mW2003wRgcza032QfZwb5USZeJ1lKv
         cv1g==
X-Forwarded-Encrypted: i=1; AKwUvBwhAcTCL7tJXfmu0inrOSoBVZ/AwkQpo8HdeBhuU5BZr09xkzTDpocfFrt49ZGafSVBVx2X81GRFokE5DU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYykjkRWLdV0gBq6FJXjQvM5ogYERr3lMnDLt/IJlcXZ0RTLMb
	7rhTvejWTi6Vc6J+dA9V3vlTJvujPwkFMSJzwd4FU1pYdLXVdHZnm9My
X-Gm-Gg: AYBFou0y7Ju4eExqF9J+JLM0guSrzYb3iWWPLq2I5rj2Jve/pMHSsDHyr+hv1EkLrXC
	9irGAPmIAvPKOoyI2fXGi6BZ4Ci1oKp2I/a9PekBpIWb57MDWlcLacA3kHsRqcSdgL+I2Qs+22Q
	23aB8iJYhTEG3f//oN1vZkh/FtoPdKOgfMUeKLdTt8qGSUugyQMQZTjNXnBu46mlWSCeUY8ioWc
	/7kK4TnqtC4BzTZY0o+ulApSHHvkfbYCJjf0W+R/pqlRi1y6g+RIoAAlZkdiu0pcHRka4DkRlpr
	K5zbXlLq23mpHAtWHRCNWfsertbn31/gVrcA2orQ2lfFonkeyjr45aQPlESxdLhnsWXTH6fI+K9
	CUZkhn2KuDuYOW1zyTg247xPl59OOH993WpHAQHkL5cw5NTx2Frnr7phDbrgcCTjeB5mRP6CNGF
	/Nn3mvfnijumXYFpeNPz/oI6lGKfk1FVP1wExK714E+SNURz+BeIDzb4fsRXlqk7zLkfH3FkXv/
	Txb6bGYBRaLmMBvtsR6ZO96Gjgg1l4NRa0rZJ4o
X-Received: by 2002:a05:693c:2401:b0:351:8028:5c34 with SMTP id 5a478bee46e88-3537dfe2401mr490076eec.1.1791498394266;
        Thu, 08 Oct 2026 15:26:34 -0700 (PDT)
Received: from hitalo (208-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm985148eec.24.2026.10.08.15.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:26:32 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v3 3/6] Bluetooth: hci_event: Disconnect links that complete while being aborted
Date: Thu,  8 Oct 2026 18:26:13 -0400
Message-ID: <20261008222616.2780570-4-enghitalo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008222616.2780570-1-enghitalo@gmail.com>
References: <20261008222616.2780570-1-enghitalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 16e3b6429159 ("Bluetooth: hci_conn: Fix modifying handle
while aborting"), and for LE since commit 181a42edddf5 ("Bluetooth: Make
handle of hci_conn be unique"), a connection that is being aborted
refuses the handle of its link when the link completes before the
connection is deleted, e.g. while the abort waits for its cancel
command. The link is up in the controller, though, and nothing
disconnects it: the event handler fails the connection or leaves it to
the abort, and the abort cancels the connect attempt and finds no handle
to disconnect. The handle then stays in use in the controller, e.g. a
SCO link left this way makes the controller reject every later setup
for the device until the ACL drops.

Disconnect the link when its connection refuses the handle, on
Connection Complete, Synchronous Connection Complete and LE (Enhanced)
Connection Complete, with the reason the connection was aborted for.
This is not done in hci_conn_set_handle() itself, as its other callers
set the handles of links that are not up yet.

Fixes: 16e3b6429159 ("Bluetooth: hci_conn: Fix modifying handle while aborting")
Fixes: 181a42edddf5 ("Bluetooth: Make handle of hci_conn be unique")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_event.c | 41 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index cbe53e19e..1f9b47389 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3217,6 +3217,39 @@ static int hci_read_enc_key_size(struct hci_dev *hdev, struct hci_conn *conn)
 	return hci_send_cmd(hdev, HCI_OP_READ_ENC_KEY_SIZE, sizeof(cp), &cp);
 }
 
+/* Disconnects a link that came up in the controller but that no connection
+ * takes: nothing else would, and its handle would stay in use there.
+ */
+static void hci_disconnect_unused(struct hci_dev *hdev, u16 handle, u8 reason)
+{
+	struct hci_cp_disconnect cp;
+
+	/* Never for an invalid handle or one that a connection uses */
+	if (handle > HCI_CONN_HANDLE_MAX ||
+	    hci_conn_hash_lookup_handle(hdev, handle))
+		return;
+
+	bt_dev_dbg(hdev, "handle 0x%4.4x reason 0x%2.2x", handle, reason);
+
+	cp.handle = cpu_to_le16(handle);
+	cp.reason = reason;
+	hci_send_cmd(hdev, HCI_OP_DISCONNECT, sizeof(cp), &cp);
+}
+
+/* Sets the handle of a connection whose link came up. A connection that is
+ * being aborted refuses it, so its link is disconnected: the abort only
+ * cancels the connect attempt, and finds no handle to disconnect.
+ */
+static u8 hci_conn_complete_set_handle(struct hci_conn *conn, u16 handle)
+{
+	u8 status = hci_conn_set_handle(conn, handle);
+
+	if (status && conn->abort_reason)
+		hci_disconnect_unused(conn->hdev, handle, conn->abort_reason);
+
+	return status;
+}
+
 static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
 				  struct sk_buff *skb)
 {
@@ -3292,7 +3325,8 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
 	}
 
 	if (!status) {
-		status = hci_conn_set_handle(conn, __le16_to_cpu(ev->handle));
+		status = hci_conn_complete_set_handle(conn,
+						      __le16_to_cpu(ev->handle));
 		if (status)
 			goto done;
 
@@ -5208,7 +5242,8 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 
 	switch (status) {
 	case 0x00:
-		status = hci_conn_set_handle(conn, __le16_to_cpu(ev->handle));
+		status = hci_conn_complete_set_handle(conn,
+						      __le16_to_cpu(ev->handle));
 		if (status) {
 			conn->state = BT_CLOSED;
 			break;
@@ -5974,7 +6009,7 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 	 * hci_conn_failed function which is triggered by the HCI
 	 * request completion callbacks used for connecting.
 	 */
-	if (status || hci_conn_set_handle(conn, handle))
+	if (status || hci_conn_complete_set_handle(conn, handle))
 		goto unlock;
 
 	/* Drop the connection if it has been aborted */
-- 
2.55.0

