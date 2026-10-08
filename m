Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342E3033F7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472381; cv=none; b=XqEJVwnMiYZK3LhlQlAyw00eKq80aKX+e9fCzSho3tMLcUh6cJzX8da4ViPOXI1UdSjfLjvOLuAL7ASljsjrKlDBDHGTBcNkdEIhBWAbCsIyhRUkjl2+c+/iCIBbYRm4KrZX2zGxZjOOio7rbs10hY/6g6Nto8yQ5nowUJtsEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472381; c=relaxed/simple;
	bh=ujIhf5dXNFwk7pQ4zK4rhcG/WcsUBG2agGgkAUBKP3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkjM6+mg9bqgnrWepdHpJtY46AQ1kXhRCfCyeCkwewKmXbQ4KefCBLF55XzCDkDCWO8mn3es+PVxehnEkR6tZKp+NPQMV6l751G8CpedGX1YDch3/K9a/RGipvIedoOzb0wIMu/XD7HFMmxlyLjGZqHwvCiYAOrVCxGRWzwlfqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXGK/E9E; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXGK/E9E"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33c10faf6easo108477eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791472372; x=1792077172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsnzOzDPEjaVflvgYk7f5xErna+YXNMqhlw1VDbZP4Y=;
        b=TXGK/E9E8fKSoQBHZ+WDY5e664KIA7JIZqzKyp4Wyek7DaTo82RumzTm+iRP7aJ5/L
         IgeWojEWkOLWqO24qQFZ2rTvVfzb8eQoE8f64CSodJbRkXhhbx66ojuv1z0pDRlIXrxU
         kttfsCClvNyJwasHDSpKrMT0f28afKVg8sbsTP+6IjQhH8hVIa9Aq/4A5Lup0AFBdY2t
         yoh8o9V13t30humvlg3S9dAGka7NWp96blmSZ8MwMJmgNHtJAGG5inJrV1KVhFvY9gva
         rUQxoeUg0cCAubYwfnNYKRx0uUtakuzUEhck2EdyYQCAnKwrJQVklZZ0+AL3vG6uuUSX
         u2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472372; x=1792077172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DsnzOzDPEjaVflvgYk7f5xErna+YXNMqhlw1VDbZP4Y=;
        b=fW8rLIv+up9xx+gkicdtIXTn+YC//u1IV1GrDDE5YdDCPUypCIbJhi+VopGSdWCGxv
         sZ2N60cczmhZL9oXZm78AJdEZX20/pv001FoVzHsCrLvHRUqPOyh6/gO9ljKQC9jizLc
         rz2LqFmQLeDo6W91xgaFHSCsm06lgm10vBs8LX2u5AuBU3g1RKwzSOskEZmhoPm084aw
         exaQbkFgW7pZiVgfHEYEeOBssRnnn2Hx0y82xxq+gqZLP/5tKPTKXjrji9gSYYQlm5rl
         MisSVBbm5kWtJ6dyeLuCozI3eBWghxUg0GXQtKsteQruZB3eNGNswWH7lEqPNXMKBFpq
         o8qw==
X-Forwarded-Encrypted: i=1; AKwUvBzdAUJ0g5vXfPd7rn8Vg44I5ev0KlVeSDAlnaziCdjylXY1mLUiyjFkr76OgE5za3Z1gGD5U2JBbf2Yuuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOzoNF91JRMWJJ3i1/dxPT2AInCVL0hfq6fQYhu7hwJ2lMUAD9
	7g6WpG9oEqYfBPriYYPdDs2zxPakhO2uFU8RdeOHHQYl6urYAJFuvcSz4khKkoLX3b8=
X-Gm-Gg: AYBFou3bHJR7WqqzwT4ljXsSvL2Z0r/qv7o+/vA19nw2Xfrxy6dok29NY+4/j36QVig
	TSErtcPu/7AnYc7U+TCr00195opSlW2YCvmOJYux/UFCHso/0dxfPHldB0XLXlVEek84z5HVQHC
	YrH9LIqrBKshinptZsUx6s+GJnhgbNRTejwSWsmEoZZTHTFu1CyRiduUtfDNYGrp/f6/kdp+EcV
	LTXhuhHN6Xp4GjnFGX2TRfItlTDtCFVkMT8wsoQ0rwbiLs4C3cG0Bp4fTgZpmWp+b+PQKNCuOeY
	Vs7fjo/ihQmzM8EWDSdyUyHTARnSD3cgkrppjUG8Y1DGTtg2tO0BgOy+OFVD/679WU/OGb6A6VR
	FKy0A233H3eROPuXmf0o9emGM6NVsUpceztkNa8yZp1+aGZw5CEFPCnCSJy0HGjBbhVvMwZHSLH
	f9UP930oAhnsMigYkwy+GNqixIfgYp4vYM31+9oh1GEdvrI2m+/0UXO0sccRqBVLf+sDJR5ZOKJ
	HWGPggFc5SPJDTQyuVbJCrzTE0LMEgchcenYFRs
X-Received: by 2002:a05:7301:7307:b0:351:7e15:9c59 with SMTP id 5a478bee46e88-3517e15a574mr3527292eec.0.1791472371527;
        Thu, 08 Oct 2026 08:12:51 -0700 (PDT)
Received: from hitalo (190-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afd00e0sm18052389eec.23.2026.10.08.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:12:51 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v2 1/6] Bluetooth: hci_event: Don't fail a connected SCO link on setup errors
Date: Thu,  8 Oct 2026 11:12:33 -0400
Message-ID: <20261008151238.2138665-2-enghitalo@gmail.com>
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

When Add SCO Connection, Setup Synchronous Connection or Enhanced Setup
Synchronous Connection fails in Command Status, the error handlers fail
the first link on the ACL, whatever its state. If that link is already
up, it is deleted while the controller keeps it: its socket gets an
error and, as no Disconnect is sent, later setups to the device are
rejected until the ACL drops.

A link that is up can be the first one on the ACL since commit
a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting
connections"). Aborting a pending SCO/eSCO setup, e.g. because its
socket was closed, now deletes its hci_conn, so a socket that connects
right after gets a new one and sends its own setup. The abandoned setup
can still complete, and it is then matched to the new connection by
address. When the controller rejects the new setup because a link
already exists, the handler fails the connection that just came up.
This was reported with an HFP headset, where the rejection was Invalid
HCI Command Parameters and the microphone stayed silent.

Only fail a link that is still waiting for its setup to complete.

Link: https://github.com/bluez/bluez/issues/2562
Fixes: a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting connections")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_event.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index c055d16cf..cbe53e19e 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -2400,13 +2400,19 @@ static void hci_cs_add_sco(struct hci_dev *hdev, __u8 status)
 
 	acl = hci_conn_hash_lookup_handle(hdev, handle);
 	if (acl) {
-		link = list_first_entry_or_null(&acl->link_list,
-						struct hci_link, list);
-		if (link && link->conn) {
+		/* Only a link still waiting for its setup can be the one the
+		 * failed command was for: one that is already up must be kept.
+		 */
+		list_for_each_entry(link, &acl->link_list, list) {
+			if (link->conn->state != BT_CONNECT ||
+			    !HCI_CONN_HANDLE_UNSET(link->conn->handle))
+				continue;
+
 			link->conn->state = BT_CLOSED;
 
 			hci_connect_cfm(link->conn, status);
 			hci_conn_del(link->conn);
+			break;
 		}
 	}
 
@@ -2683,13 +2689,19 @@ static void hci_setup_sync_conn_status(struct hci_dev *hdev, __u16 handle,
 
 	acl = hci_conn_hash_lookup_handle(hdev, handle);
 	if (acl) {
-		link = list_first_entry_or_null(&acl->link_list,
-						struct hci_link, list);
-		if (link && link->conn) {
+		/* Only a link still waiting for its setup can be the one the
+		 * failed command was for: one that is already up must be kept.
+		 */
+		list_for_each_entry(link, &acl->link_list, list) {
+			if (link->conn->state != BT_CONNECT ||
+			    !HCI_CONN_HANDLE_UNSET(link->conn->handle))
+				continue;
+
 			link->conn->state = BT_CLOSED;
 
 			hci_connect_cfm(link->conn, status);
 			hci_conn_del(link->conn);
+			break;
 		}
 	}
 
-- 
2.55.0

