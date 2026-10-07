Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968A4BCADC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791387855; cv=none; b=QaDCDOymrKpD20SPnihjx2QYCtX+SFvwKydC+QzucpY4vFu9QuoGQanivokOdP47f6WPPIBu4STtm1tZXMvtv6grdaV1+ratQnn+2Vf2xNVCuRdroYumZ1aMMsZbtzDJtqj/uRKq5AkA8NvwumMio2ZBIic9bZ2+rfibDNC/8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791387855; c=relaxed/simple;
	bh=ujIhf5dXNFwk7pQ4zK4rhcG/WcsUBG2agGgkAUBKP3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=temmj5v8WAdYVnaS6wnEZT4wPkbxbmAB4crj8JLSBmTgDOLoYN06If9w2MLAjv9CHU9918IQGoBV66zEyt6zuaVWJqkfMiCgEwbHmMdtSqPPwqESHzK5i/65mzB46wkNyCpnh/SEfDabkZ24YenQXSSPcntizRZf0tD9c0MXTcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8DtEe9j; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8DtEe9j"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34ad8819612so376609eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791387849; x=1791992649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsnzOzDPEjaVflvgYk7f5xErna+YXNMqhlw1VDbZP4Y=;
        b=C8DtEe9jk54QNYEqefDgVoGWJ0U8LkXjRIwVpA5F3WNM3yUa0RA9POcOtH7WPQQune
         qaEi+AO3oqxqwpza9tMOyNHXMHTbDyQ6PEbv+xLlpkMJaH3lx8/+NfdVnmD1zWrWeCzY
         8qXwVvmSo49POGyK845bzBZhCdfUTOxFmTUGyrCtjsGW1M7voR7KF1FqJbrqLhZh3O+W
         sVwFcM8SqX12qDatO7bIwMndtO3+Ibr8mNFgmEsh2gVs3fm04jmwSocaF4RLojpfUQtk
         IRSc/8xbUO6ZlLbtFKd7GB5US2ssuiLNDH/aUMGChCuImJOA7LpK1SsdaF7zHUaoSju/
         24Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791387849; x=1791992649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DsnzOzDPEjaVflvgYk7f5xErna+YXNMqhlw1VDbZP4Y=;
        b=svfVtlryFCsf8lz2UZbalt0cBkRinjHj/oiuup6bAZ2iGe4OaAYUVPj4Qe8BGV3kVE
         EBuhrHD3ZZg5K8MqW/tz/D2EF1UUsFrPoWRHG912txgDVJEN1639xyb6s9R4RB8ahQbX
         fvq9XcPEE8z07YkJOrCzIdrR03PQQqddiMOu5BKWPf1PsARWQ2raxiUDWZkR27QXzK5P
         feVA1MxHH/5a3LhTPm7p1pCaL4oB+wZT1eNPnNzx/av8p34f4TnDSRgdelLpBtfeL8tG
         asnYSpjKJc1XbJxIKiqQVweVSEl64sBZfj8JtqRYUweX3wdpzOiBlguGhAyRZXfjrQiw
         GaJg==
X-Forwarded-Encrypted: i=1; AKwUvBwsH1e60uh9Ej/v2pi1eMhdFjqvl26zAJFWRT3E6+SoyN695HIRnKwdJc8aRneBVkullcY/T5Gn++/wcx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgrIny+2trWDPk3gbwXL4XzyYqY7Y3M4lqAxPl4KM1X1X8MeVK
	mBTgOmKk4nAwfE5G875SFtuZiMPEfLfssWdjOXgERIseQ9NBBBXXtYxq
X-Gm-Gg: AYBFou3JZEmulKG8yoqYIOul08ryAio5+Zzv6K5NEcR/YuuCL/zCmcwGxkmDmiDMApd
	RvCMX97CuKRf2P/U6cPSOk5nHNd0KCxdtbPzdQM149shviCE3OSAMrEviN5tvXf624Z1tRE5Ai2
	02u3FAqI47RslyXCWVOZ2IZ5lfJ8zXdUts3Y7Dap6s5kFtDbb0DY+aC8L0AaeRC4bIampKqm5Qb
	9o61PuVN8y8SiXmaInYy/umaJl/FivnC88YhulBVmevxVVw8tP67DU0wteJ/XsDGXleWV8uApp0
	Jt1rWmTou2NI8YRdif7qgM5HPubTigrlahIPjTOStjlaEKulsAJShC83Kuirjmqzwue7W4WYo/L
	GhgwPHgo+xNQ6G49NGLfwhVBzpZHhor/nHvNKevHOwzDE+G9IGRei6FspN6ejvp1AGn7R2YkhW6
	3TZwM4lg4cwW4IILyTLiVy9Qh371ZEsE+JwejL1l3oSTgl2oaJBOywfYCy3RP6sN9SdRaeyPLg0
	okYAmBovqpLvIuuw52I/Wromi01hKURWKkzud02
X-Received: by 2002:a05:693c:400b:b0:34b:101f:cdaf with SMTP id 5a478bee46e88-3515dc1a998mr4087176eec.1.1791387849001;
        Wed, 07 Oct 2026 08:44:09 -0700 (PDT)
Received: from hitalo (190-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af7ab9fsm7876955eec.18.2026.10.07.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:44:08 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH 1/3] Bluetooth: hci_event: Don't fail a connected SCO link on setup errors
Date: Wed,  7 Oct 2026 11:43:51 -0400
Message-ID: <20261007154353.148223-2-enghitalo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007154353.148223-1-enghitalo@gmail.com>
References: <20261007154353.148223-1-enghitalo@gmail.com>
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

