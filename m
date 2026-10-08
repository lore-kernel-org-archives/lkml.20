Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09184B1D16
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472389; cv=none; b=ahfqpT2CYWNDNevK4ERn6ZyhXjodRaLV2DIyXCtwmwfbwZCAkj63T+3Wy0vh+tryyEojd0JdDc8MFVoWJGbfng8n5hTUEjhmPafXAxjlEf5CW71StmwhqhOm0uV4oT84xVghKD3grTUptvupTHkuXNeaFAMKAJk86Ji6nXMulkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472389; c=relaxed/simple;
	bh=tXZ7I536a6S88q6vSVGLG6bcgJFuljlqNiqCm+VnHEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dA4mz2gsvnOOuMrVNGocbpSE1f3EgiGoxdkvxCUDBrPjieZXQreP+1hZTLbYfaytGw7a0jeQiWnnHMK70xfDr/UKjdJu5vX9Qp9cZNarPt1m31S/7L5YULXxbc1ELy09afV1QHFZk12+2isGpCyUJirjbu/kx3qNWJ/NSTcULfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLdyoG0x; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLdyoG0x"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-34c522572bfso143317eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791472379; x=1792077179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7iLO1MzSoxZizc0N7yjFMQAwEIUUUSQYMX7Ng9sW1E=;
        b=BLdyoG0x3ihWCt6do/zGWITGjE73+Uiao4Omut6EZNJlxD9iYQy7Na9lGHS//b2G3w
         gPoN8wC/V9RBpSmYhMY9z6h1bEJjEEZ3mX1LcbJV+rhgT29JD83BwFHqzoJhKe1TgpzF
         KLAm8TcG7rTsJxkha7k/ww+ruYm1QUJE880L20CHD4RExaKN7Ps3djph4B519GMQWhbL
         KaZ5rmxLivkwGNp3+Ch7SSW0JTeT/wbyxvZKFzFv8e93WjgHCi7PGxVhdpfzBDTzgnyW
         HL9XQRYuJ/kbAVjJm8My7V4SwGAE7M5iKNY+2Jyah6A9/qihEqfgJdVmU2B61h+S0oeI
         BMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472379; x=1792077179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l7iLO1MzSoxZizc0N7yjFMQAwEIUUUSQYMX7Ng9sW1E=;
        b=fsC01sJZQQSY6ho6eVCLnd9TyWzD2k1f7wn872EBl/mRw6hBEZZYiONK4k9mqpoPI2
         s56mFKtQCbLGwc8dvGaMVVE/OaZIRtV8fTjB+lwPPPl5pB7vPt8FJw3ZsLzQdpb1tpCR
         KAbf7gP+g27LnNJMRSH3nT0+50D2t31xOrIDCkkXMEhk+DwiVvLQhX+Zj+GqFBe1YpOR
         YFIIXfTIpkQzaj/QR/EObAonv0UfHmY8c5+9/5fU6ICBWAx7Qp3Ops/EZq0gQT3p0oh6
         G3+JKd+wsc4UfJUtR3dQ67FZIAIZQFO7j4HCHA5JVvZOpLt5BkBQbJ+DCPCqPNGdqQy6
         hFRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+b8/EpQl7XPvquRm07BcKUMXRvEqVJMvYfMRwAojoNS55s/ElzZLahhTUno5v2A+upxcQDg07947Aypo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbB3pd+atSXS7LsQN3Hg6BbX8OiiYqQqc39YVCVXJ5dWiScv0A
	iZg2n1ViThzZWC1/bAuI6Sj8FKl/yBTactHayWARBn1AL+b9GALQyrJs
X-Gm-Gg: AYBFou1pwkXlcG3QyXTFCapBsX4/SurjPopzWRbrW+3yjbsEvcwG7tKJw+6dcjRogYU
	Z9ok1oUZIcluE4bQ7HJ1qAWzxc+otiAACcruUZaQvbqH5yDmRf6dM2OeEkfcADpKAY7ukPXI/D+
	yr+rMav+9r+nU4MIsLqkaGNcISWdh1ntbK0rFhvQmVnJtYA/NN8gLWGcf8J/VLCuxlbot8Py5Tn
	N6CnQxpB2b8HQXQZWPhT8u9sByoHZdTEqtyiGDRw98mLfxaIMjJSCfooqosz3tGc9BqSN96GOSo
	M47sZlmFgzEM9XVd96zMHNBdmcwCFvZb4G1tmIqU5DzgMd2yyl0uO7GssaqZXuZ8p40G8/JyZ7x
	l7cHF9HDurremSezTpnQOaY46qZ4+MOY4NLPKuzM5fEzw05fPCuVPC+Uk92TROmpVuWSPQLz0FI
	PVf6urqteqigVY748hfj1RhpWfq908PlxmqbCobBz7g3KICVBnSISaNLqyr7kRqOiDKoFASp+MQ
	5tyNxp3k2z3u+/yI3JeRmFTEBuNi80hv6hQz4yT
X-Received: by 2002:a05:7301:da16:b0:34c:f181:85e4 with SMTP id 5a478bee46e88-351755da249mr5326558eec.1.1791472379339;
        Thu, 08 Oct 2026 08:12:59 -0700 (PDT)
Received: from hitalo (190-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afd00e0sm18052389eec.23.2026.10.08.08.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:12:58 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v2 4/6] Bluetooth: Don't leave abandoned SCO links up in the controller
Date: Thu,  8 Oct 2026 11:12:36 -0400
Message-ID: <20261008151238.2138665-5-enghitalo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008151238.2138665-1-enghitalo@gmail.com>
References: <20261008151238.2138665-1-enghitalo@gmail.com>
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

If a controller answers the setup of a SCO_LINK connection with an eSCO
link, which it should not as only SCO packet types are allowed for it,
the connection does not take that link, as before. Such a link is not
disconnected while a SCO_LINK connection waits for its link.

Link: https://github.com/bluez/bluez/issues/2562
Fixes: a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting connections")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_event.c | 49 +++++++++++++++++++++++++++++++++++----
 net/bluetooth/hci_sync.c  |  8 +++++++
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 1f9b47389..8f22a4528 100644
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
@@ -5212,8 +5226,19 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 
 	conn = hci_conn_hash_lookup_ba(hdev, ev->link_type, &ev->bdaddr);
 	if (!conn) {
-		if (ev->link_type == ESCO_LINK)
-			goto unlock;
+		if (ev->link_type == ESCO_LINK) {
+			/* A controller may answer the setup of a SCO_LINK
+			 * connection with an eSCO link. The connection does
+			 * not take it, as before, and the link is left alone
+			 * while the connection waits for its link.
+			 */
+			conn = hci_conn_hash_lookup_ba(hdev, SCO_LINK,
+						       &ev->bdaddr);
+			if (conn && HCI_CONN_HANDLE_UNSET(conn->handle))
+				goto unlock;
+
+			goto unused;
+		}
 
 		/* When the link type in the event indicates SCO connection
 		 * and lookup of the connection object fails, then check
@@ -5226,7 +5251,7 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
 		 */
 		conn = hci_conn_hash_lookup_ba(hdev, ESCO_LINK, &ev->bdaddr);
 		if (!conn)
-			goto unlock;
+			goto unused;
 	}
 
 	/* The HCI_Synchronous_Connection_Complete event is only sent once per connection.
@@ -5236,6 +5261,13 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
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
@@ -5295,6 +5327,15 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev, void *data,
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
index 9eca6757d..4e1c72fd2 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5940,6 +5940,14 @@ static int hci_connect_cancel_sync(struct hci_dev *hdev, struct hci_conn *conn,
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

