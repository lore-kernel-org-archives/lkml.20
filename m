Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED6E348453
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875784; cv=none; b=gm9oFy9USsJVD35eiwTYQzIXA3+l9v1poqAIAuaA2RhbQ9Lr/Q3S7vFtO/MiDUvP9JIzr+D4FfFSgX3EzjsZu+1aVltk1SaCP2JKf0CfmN7KnwdlQ4Ie9INswdGXCsPOaMGre2w5+FeWN59yefM3OSjwDXNH3/GEsc+g/qtYUKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875784; c=relaxed/simple;
	bh=BjllpH7CylU0dPW7AL5duhTnu8amrkppktT7UN2ZuFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mItvheb2n5TRK6dx+rNabOGjvnS37w1XU3TvDAZ+ufdgLhx1COkijnG5uF0C/tpwCxaLundFj0DFoK+Wpdn2LAOi1BJrA23q1wFM8aVAHV2dfQb7ike25wKAcd07E42py8ie8wkkLpPKB0JM7e6CnkI06EPUegQl+PvUpFjtHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=californiaopensource.com; spf=pass smtp.mailfrom=californiaopensource.com; dkim=pass (2048-bit key) header.d=californiaopensource.com header.i=@californiaopensource.com header.b=ChmmKHyo; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=californiaopensource.com header.i=@californiaopensource.com header.b="ChmmKHyo"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33c2520ad38so6094919eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=californiaopensource.com; s=google; t=1791875782; x=1792480582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSyra3bHkuqWz+L9mTLMsQhLfl/JDwdmDNSp2PenKng=;
        b=ChmmKHyoFVFvb8+3tfaxCipgmyxXZsKVTfepsJHinKAk7lKr6Rdkb9JdKBYSYXXFo5
         68Qv+Q4FSiVSg/vstUfB5OucGdLWD8rFSH1/IvGCqJWJOnF+hP7taH0tuAPQA313rnVK
         tnItZDMrv9aUchdd9Ib3XKXBG/gSRScEZV7uDacsbKG5kLrAjiqGObU9M3eBrBulpymM
         sHINbGic7h6xXHSUZNzpJ5Aw0I77TtSMIg+w7nabXwr+ASPeOWrvetC5htfbkD9dexmi
         YQt/OnACUZd9YilKq296keBVMFkVVB462pV0p+6fqHkhWtm3Lp82SLlWUqBqGuaE9FRV
         MZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875782; x=1792480582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSyra3bHkuqWz+L9mTLMsQhLfl/JDwdmDNSp2PenKng=;
        b=Ghlu18X1CZXWMyKLBvhwImgoVKSapUZ2nrTpmKUbRp1XYHon1xbuGWbm7ztZXN0RVv
         PdxB11QD8Fnglo1lyQSGxFfKEu64ADqByytE5upcME9kiEfeo5P/NH5t+zXAFvf3Atc8
         pKb1JoGQOSTjQzQk4ZmE+3ZYrWpTDyG3xOp+og/sqFwDBwK3jYDM7KRfKqL+PW/Q3vtz
         NEOeV00F7e3mbzFMX6BqE9oTjwhT60VNk2Ngj/YrUDY+4lLOkmAru/dH+4sU6gYDui5F
         jNMY+75QYMwu2dcCwsto0kXAmHfg0u6fQSWR2JeMudYnhxNdXTJv1zmVbiqWkTo/OZpz
         Ew3g==
X-Forwarded-Encrypted: i=1; AKwUvBxx/aSe1mKsZPyghNoDI9YksDCFAe0Z0frX83qlERrVdVgUUlzljLvuzdKWL8zLWaN0Uk3ccDXO3RNLvUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLruVz9Y3Z7N3p5vJyCkHt8ld+aXZCBLhpVaFxHYJFCtSYnSDUu
	0+kZyv4ff0bAVSUouuWXFwaYOtCg9aVCWAkRAlFYIt9/kjRPBSqQ/7XnlpK0HFEXLmz0EsPlaNh
	Nk9JPBUOhcg==
X-Gm-Gg: AYBFou0eUtRekB4mutZ9mtWzwKg5uNpxvEbGj/oVCyPRc+U54OfogggitG6yT1PCGdK
	XJhmOw8m6lwmeBqbGqUnGZWGsH2W4/IQ0fsCC76RfFnVNFWDyGOTO9BYC3x9/CWLW/OvC3mXntZ
	RAFBhMkYSVCl6HosL56npfp6DiC7OP4txEyE7Dpw9tigB6tkH8gHIaInFOUSPbQxLZmmSEtexux
	cEbCcFG85T8I2CCeYVUjZnThxK8wXKnkLKTRtwvheynd8JQtMhf4aqnq9S5gMoy0i/wriLlMRDJ
	T85rjet34hCLDa/QjZIXpgQqimlS4iOE2m8uH+DZLROPH8o08OzznPJePvDOAujwnMW0uQAtmd3
	eWMh/cB253232sVbPhWf09g/HllFE8/N5nVX03pUeoSz+bLZP96MEbwu7eAI5Ah3BDfOQ9k2/qj
	8aLgT/EGREeVXQSZN4eKoWTtkopM6NmWE9356Yta9/A7RL4gvEQ/vq6HOWdht966Qety78Rjp0U
	ykfuaknUy8L6NcQEzQ3l2/0nOxNe2cuul/LzwykhNW7LaWVQ+OvfegjCv19S044o69YvRTM1S4k
	vmCLtALFjSBPIUGy+Q8I0e0/lDxFmZ1SWgIXosBx
X-Received: by 2002:a05:693c:4196:20b0:35b:af:a075 with SMTP id 5a478bee46e88-35b00afb749mr6677708eec.22.1791875781388;
        Tue, 13 Oct 2026 00:16:21 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm39699307eec.28.2026.10.13.00.16.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:16:20 -0700 (PDT)
From: Kevin Dewald <kevin@californiaopensource.com>
X-Google-Original-From: Kevin Dewald <kdewald@itba.edu.ar>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH] Bluetooth: hci_event: Fix LE link drop on remote features command status
Date: Tue, 13 Oct 2026 00:16:15 -0700
Message-ID: <20261013071615.76382-1-kdewald@itba.edu.ar>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Dewald <kevin@simpleble.org>

When the local controller supports peripheral-initiated features
exchange, the LE Read Remote Features procedure also runs for incoming
connections, and it fails with Unsupported Remote Feature (0x1a) if the
central does not support that feature. hci_le_remote_feat_complete_evt()
and hci_le_read_all_remote_features_evt() handle this and let the
connection transition into connected state.

A controller can also return that error in the Command Status event
instead. An Intel controller does so for a central that does not
support peripheral-initiated features exchange, presumably because it
already has the features of the central. hci_cs_le_read_remote_features()
and hci_cs_le_read_all_remote_features() then confirm the connection as
failed while it is still in BT_CONFIG, and the hci_conn_drop() in
le_read_features_complete() disconnects it right away:

  > HCI Event: LE Meta Event (0x3e) plen 31
      LE Enhanced Connection Complete (0x0a)
        Status: Success (0x00)
        Role: Peripheral (0x01)
  < HCI Command: LE Read Remote Used Features (0x08|0x0016) plen 2
  > HCI Event: Command Status (0x0f) plen 4
      LE Read Remote Used Features (0x08|0x0016) ncmd 1
        Status: Unsupported Remote Feature / Unsupported LMP Feature (0x1a)
  < HCI Command: Disconnect (0x01|0x0006) plen 3
        Reason: Remote User Terminated Connection (0x13)

Data the central sends afterwards is reported as:

  Bluetooth: hci0: ACL packet for unknown connection handle 3585

Handle Unsupported Remote Feature in the command status the same way as
in the complete events.

Fixes: 0fe29fd1cd77 ("Bluetooth: Read LE remote features during connection establishment")
Fixes: a106e50be74b ("Bluetooth: HCI: Add support for LL Extended Feature Set")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
Reproduced in test-runner on bluetooth-next with l2cap-tester, the
emulator answering LE Read Remote Features and LE Read All Remote
Features from the peripheral with Unsupported Remote Feature in the
Command Status: "L2CAP LE Server - Success" and "L2CAP LE Server - SCI
Default Mode" fail 5 out of 5 times without this patch, the link being
dropped as above, and pass 5 out of 5 times with it. With the error in
the complete events instead, they pass with and without the patch.

The emulator change and a tester case can be sent as well if wanted.

Not tested yet on the Intel controller the drop was seen with.

 net/bluetooth/hci_event.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index c055d16cf..cad6ed5d8 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3015,8 +3015,25 @@ static void hci_cs_le_read_remote_features(struct hci_dev *hdev, u8 status)
 	hci_dev_lock(hdev);
 
 	conn = hci_conn_hash_lookup_handle(hdev, __le16_to_cpu(cp->handle));
-	if (conn && conn->state == BT_CONFIG)
+	if (conn && conn->state == BT_CONFIG) {
+		/* If the local controller supports peripheral-initiated
+		 * features exchange, but the remote controller does not,
+		 * then the controller may already return the error code
+		 * 0x1a for unsupported remote feature in the command
+		 * status.
+		 *
+		 * Handle it as hci_le_remote_feat_complete_evt() does and
+		 * allow the connection to transition into connected state.
+		 */
+		if (!conn->out &&
+		    status == HCI_ERROR_UNSUPPORTED_REMOTE_FEATURE &&
+		    (hdev->le_features[0] & HCI_LE_PERIPHERAL_FEATURES)) {
+			conn->state = BT_CONNECTED;
+			status = 0x00;
+		}
+
 		hci_connect_cfm(conn, status);
+	}
 
 	hci_dev_unlock(hdev);
 }
@@ -4113,8 +4130,17 @@ static void hci_cs_le_read_all_remote_features(struct hci_dev *hdev, u8 status)
 	hci_dev_lock(hdev);
 
 	conn = hci_conn_hash_lookup_handle(hdev, __le16_to_cpu(cp->handle));
-	if (conn && conn->state == BT_CONFIG)
+	if (conn && conn->state == BT_CONFIG) {
+		/* See hci_cs_le_read_remote_features() */
+		if (!conn->out &&
+		    status == HCI_ERROR_UNSUPPORTED_REMOTE_FEATURE &&
+		    (hdev->le_features[0] & HCI_LE_PERIPHERAL_FEATURES)) {
+			conn->state = BT_CONNECTED;
+			status = 0x00;
+		}
+
 		hci_connect_cfm(conn, status);
+	}
 
 	hci_dev_unlock(hdev);
 }

base-commit: 964430c038967fd06643e866f68115664e1a1bd1
-- 
2.53.0

