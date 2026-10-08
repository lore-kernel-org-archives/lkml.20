Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018C3D5222
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498400; cv=none; b=Zm8egqpnj1FrVFW9QDk8h9prJNVRBasbYndT2tHFXEd4tqkUmadWaEbMTFwIA2Dt0CPPawxGrPQN8qzG9hfiz5wjy15jRR6ETBW/T2vMHEjq3Gn6V2Q+Q/bTPD7D+a20+sK2eTDzQfIIECwIsC7yJk80uCgaCYw2xNgQJvDiWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498400; c=relaxed/simple;
	bh=cb6bN/mBV+CJpUzAw9RCU3OpEmV4cxyKE98LtJc3paI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oC029aKB7kXKwoOiSh49Wkm/gX6S7NtoRB+s92p7knoNAFvmInDkTuoMo+H5Ypu3YdrHUXpkd5huJBIKWav1+1JiHT5WPYQ9er1yaS8tbDar5HQeyS7h4ywF+SD2nNoj2X8jpj0zAbL0Rgt7vHx+0YcSKgJN4f6pnGgJy+WhYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOgESHA4; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOgESHA4"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3517ec27a49so148076eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791498398; x=1792103198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RMRYN28UddaNBae6zO8Jm1vRMtVLBHEPyHf9UUf9qc=;
        b=nOgESHA4tlFMaW4/OZL/Z/fFJbdx4d8HCeVjcE5NHhsCPg1P5fdSiiFvxP4psjpEkG
         rbvOJ1zL81qRp/Z8lfMtdLRa3NzADV4fXNZpoEXJQtTYyQ0ftov34DQfOrkoiqXmVnPb
         Hhlu0ScojEZsPkD0MeEF1WgIB3jVgAZmXLSZgMeqjrAAojXIFsFpXgVs/8qAUk0CpyA2
         Obr9+F/QENkggf3uJpUqD+TYmgoBrJXpNSMfolMmrlvoMvVzwHTq/du69ckOb401lv8Q
         YeBVnGC07liSMbItH0fmr/V9BiFeYPjC/kuQT0d4ES3M7vCKpljkYs1MHxlRP4cKtb0T
         75Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498398; x=1792103198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RMRYN28UddaNBae6zO8Jm1vRMtVLBHEPyHf9UUf9qc=;
        b=HHDyd+X+BqDeUjudN9EWs/NXTKvJ8in/Eq9jMDDkfwSGeDwBOwSKpjOUk+vrgi4DXV
         ky4NWWH9+eg9QYd3iRo2D8HcNtWAQDW8qZKpcBMj5xjfNfRgcvESJOQxGQPnR+atSAjB
         69JTaxF5iFulJ3tDWiEo5/1WP2bnkGNQ/I5nYe3kPLKArHse5RYshjtZvUf0IcOR9HeT
         OiwsUHqdw9huic+6MXVTu40pPpBCrLj71mca48f3bAV3QMTdzYCbrJLE6l08CResI8hT
         8CyAXCQ7G6iN6erHQB72MXKAUVJp2B+voWETU9ffPpch8AhbyfwxjwLjwgWP21Hh5edb
         Ghdw==
X-Forwarded-Encrypted: i=1; AKwUvBwZCpUPrT5sERZ7LatA/6kgMUQO3n6OH2Wf1zYKt4KqFgFajNiM2fNR815xMqr9YHiihKvBr922rIX6kiU=@vger.kernel.org
X-Gm-Message-State: AFuF++kzldb4c4CYMAnC2/EvfxHC7ou+TcYhV0h/BL63xHDlmrUXiL+u
	cQkBJ4o004ArG374fgi6hJIU+Ecvy++3gCu2SXMucYtTtJ/ydGhM6x1T
X-Gm-Gg: AYBFou3vPhgbD209jLdue48Tr0dsca0bqGoEB58f1FKGi4L6IwUwgB2qyAxq2f51obk
	5u49/q/jSPfGWJ5FwF7GZ4IYPtyLWwwCcouFyjlBaI2SknAxuy6RLm9Q7qZN6yPZc8R3gwGtDTD
	GfDgV8tCohXX+nf9ydRpdz9Ong8vJgIaee7mWwkxlx715PDJyPoGGHMOlj76a4sUkkquQy1IJoP
	qGyWy2VdteFNfDdd9gjJUkpfB4LT80xC1bLBrfQN0B+P61l8s4ftGzOgFFo1wN5Zr3aFxxn9siF
	R6wSI7FmhWRKnQVfTv/FAarNxGEbxHcjwCIkkMawbq4sKDIial04+XMTWnmJ2qDf+05vU1UTnTF
	IGXHlASfevm0EbXoJagczZiTTiD1H0FtHONPULgE+4OjvIxit08IjQl781Momp5QXfgdZj7y01m
	R/4wwB54EvJWn/NRRvRqcHMyIMq0Gt4rYr0JdIZskGvvEmrHSEe11XPaop0/kHizvbHR68vBqX9
	FiezuHdU92ZR6A0JI4UMNpNKQoPJgaPoHPlU+Jb2SnVzXItYYc=
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id 5a478bee46e88-3537dfdd089mr557780eec.1.1791498397278;
        Thu, 08 Oct 2026 15:26:37 -0700 (PDT)
Received: from hitalo (208-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm985148eec.24.2026.10.08.15.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:26:36 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v3 4/6] Bluetooth: Don't leave abandoned SCO links up in the controller
Date: Thu,  8 Oct 2026 18:26:14 -0400
Message-ID: <20261008222616.2780570-5-enghitalo@gmail.com>
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

Since commit a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for
aborting connections"), aborting a SCO/eSCO connection whose setup is
pending, e.g. because its socket was closed, sends Create Connection
Cancel and deletes the hci_conn. That command cannot cancel a
synchronous connection, controllers just fail it (ACL Connection Already
Exists or Unknown Connection Identifier), and the link may still
complete afterwards. Unless another connection to the device takes it
over, its completion event then finds no connection waiting for it and
is ignored, so the link stays up in the controller, which rejects every
later setup for the device until the ACL drops (with Unsupported LMP
Parameter Value on a MediaTek MT7921). The same happens to a second
link completing for a connection that is already up, e.g. its own setup
after it took over the abandoned one.

There is no command to cancel a pending SCO/eSCO setup, so don't send
Create Connection Cancel for one, and disconnect a SCO/eSCO link that
completes with no connection waiting for it, with Synchronous
Connection Complete or, from Add SCO Connection, Connection Complete.

A controller may also answer the setup of a SCO_LINK connection with an
eSCO link, although only SCO packet types are allowed for it. Such a
link was ignored as well, and stayed up after the connection timed
out. Let the connection take it, as an eSCO connection already takes a
SCO link.

Link: https://github.com/bluez/bluez/issues/2562
Fixes: a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting connections")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_event.c | 43 +++++++++++++++++++++++++++++++++------
 net/bluetooth/hci_sync.c  |  8 ++++++++
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 1f9b47389..c825a99db 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3306,8 +3306,12 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
 
 			conn = hci_conn_hash_lookup_ba(hdev, ESCO_LINK,
 						       &ev->bdaddr);
-			if (!conn)
+			if (!conn) {
+				hci_disconnect_unused(hdev,
+						      __le16_to_cpu(ev->handle),
+						      HCI_ERROR_REMOTE_USER_TERM);
 				goto unlock;
+			}
 
 			conn->type = SCO_LINK;
 		}
@@ -3320,6 +3324,16 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
 	 * whether the connection is already set up.
 	 */
 	if (!HCI_CONN_HANDLE_UNSET(conn->handle)) {
+		/* Another SCO link for a connection that is already up has
+		 * no connection waiting for it either.
+		 */
+		if (!status && ev->link_type == SCO_LINK &&
+		    __le16_to_cpu(ev->handle) != conn->handle) {
+			hci_disconnect_unused(hdev, __le16_to_cpu(ev->handle),
+					      HCI_ERROR_REMOTE_USER_TERM);
+			goto unlock;
+		}
+
 		bt_dev_err(hdev, "Ignoring HCI_Connection_Complete for existing connection");
 		goto unlock;
 	}
@@ -5212,9 +5226,6 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 
 	conn = hci_conn_hash_lookup_ba(hdev, ev->link_type, &ev->bdaddr);
 	if (!conn) {
-		if (ev->link_type == ESCO_LINK)
-			goto unlock;
-
 		/* When the link type in the event indicates SCO connection
 		 * and lookup of the connection object fails, then check
 		 * if an eSCO connection object exists.
@@ -5223,10 +5234,14 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 		 * SCO or eSCO. The eSCO connection is preferred and tried
 		 * to be setup first and until successfully established,
 		 * the link type will be hinted as eSCO.
+		 *
+		 * The other way around, a controller may answer the setup of
+		 * a SCO connection with an eSCO link.
 		 */
-		conn = hci_conn_hash_lookup_ba(hdev, ESCO_LINK, &ev->bdaddr);
+		conn = hci_conn_hash_lookup_ba(hdev, ev->link_type == SCO_LINK ?
+					       ESCO_LINK : SCO_LINK, &ev->bdaddr);
 		if (!conn)
-			goto unlock;
+			goto unused;
 	}
 
 	/* The HCI_Synchronous_Connection_Complete event is only sent once per connection.
@@ -5236,6 +5251,13 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 	 * whether the connection is already set up.
 	 */
 	if (!HCI_CONN_HANDLE_UNSET(conn->handle)) {
+		/* Another link for a connection that is already up, e.g. its
+		 * own setup completing after it took over an abandoned one,
+		 * has no connection waiting for it either.
+		 */
+		if (__le16_to_cpu(ev->handle) != conn->handle)
+			goto unused;
+
 		bt_dev_err(hdev, "Ignoring HCI_Sync_Conn_Complete event for existing connection");
 		goto unlock;
 	}
@@ -5295,6 +5317,15 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 	hci_connect_cfm(conn, status);
 	if (status)
 		hci_conn_del(conn);
+	goto unlock;
+
+unused:
+	/* No connection waits for this link, e.g. because its setup was
+	 * abandoned while pending: don't leave it up in the controller.
+	 */
+	if (!status)
+		hci_disconnect_unused(hdev, __le16_to_cpu(ev->handle),
+				      HCI_ERROR_REMOTE_USER_TERM);
 
 unlock:
 	hci_dev_unlock(hdev);
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 014ceaefd..7f5c96b72 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5942,6 +5942,14 @@ static int hci_connect_cancel_sync(struct hci_dev *hdev, struct hci_conn *conn,
 		return 0;
 	}
 
+	if (conn->type == SCO_LINK || conn->type == ESCO_LINK) {
+		/* There is no command to cancel a pending SCO/eSCO setup. If
+		 * the link completes anyway, it is disconnected then, unless
+		 * a new connection to the device takes it.
+		 */
+		return 0;
+	}
+
 	if (hdev->hci_ver < BLUETOOTH_VER_1_2)
 		return 0;
 
-- 
2.55.0

