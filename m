Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F5476CDA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498390; cv=none; b=iFsmAEWP077gpJq2pcXkH2Ydzc/CKcFZr8qCFpcuhoGKADkP0paclacJk6ihdQKEHYDevCvWsEAANAxyo5QMVgjBX8BnuTDgGctv1iFww8rsKsYYDozdneB1vqt0iLPNvAP7MzfLvK/5ynNhqiSjPGtkwlNuD22dfqRqugQFcyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498390; c=relaxed/simple;
	bh=87TlyBVPvSZkRacf76t6g8A8VOoLXKinMW91wLKTfZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zudde1iO3g3gmR+JR7Tc4zt/RiAOtxEEhkWjEPZlliPdgucGOqXd7UsA+AjqUZSWgtiH5ypm9rtBq4E9I9OuWy1MrCpM9DG4sXPPbr77Xv7o1OTcIelQ6sfByaj/bBtLUh1nF/ImkwixFV6Yp5ZgVm+EQlT3AZ8OgA01RRZ5KdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdCRxxgx; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdCRxxgx"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3530a44737cso123362eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791498388; x=1792103188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vef9VvR3jOkcdVIQyjRUIzZuqo6ilnwxU+vXMpgLYqw=;
        b=pdCRxxgxSm1R71SDIhiD0zQQTTQlJr4MwlQmBa80gBR7l2S6iIhS04cYtblmG+BDaf
         EryziX/u82of89+AXpUP1zHuYiHJV3sYaLbskWY5U56YBnkV7ukh1Rj12RGrFTlj4wzB
         lyz3Dt32c4pWfnIUasMpZQNKw2q9Nk6DxC2d5k2tS/QDN305WTnofVferkyCTA8ycomU
         kkVhX2QyjHq5aVh/HttEpA4ntuY6e1Lb6HvbciDbYqHkAyhT0C6Jfxywt+Z1C5zwtagg
         gbKTXz7nyEq/8+/TlYI+OZuGUvsZ4SxrnAEQ4yrltc67Hv6qm9eW4J5mgcyI7Zlj+pOa
         +0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498388; x=1792103188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vef9VvR3jOkcdVIQyjRUIzZuqo6ilnwxU+vXMpgLYqw=;
        b=zkkplpvae1u2VDkiUcr1dkXF924XIvaY5WEkyhg8o/URaeIiIdJwXO0ccx0wQrPL2D
         EPbgS+yHoSaKv2PK6xRAdT1prhGV34tlwK4pQFJeSjA0Yc2ODU+yuWy0zJ8m0Enr1MG1
         oYNOtDGFPrxA4Gwz34VibDaF+KIIaELnu5DGPQV6u183nRRSNTnecIFa6kJD2hMosAsX
         g6ZcsDd65jV5tnqY49rlWdc4aFIc18WvpM40PNIQGRocs7nbD1bzDMz9XEU2TWyS1/oJ
         a237hez1Qk0MAzd+vucY+sYheS44upD0HzLmn9UG+MHt2drhRK53UkZSR/e5RQv1MJrZ
         t3Aw==
X-Forwarded-Encrypted: i=1; AKwUvByHKTnufKRSW4mxFB75zWZDmfqkTw4oinK5+BpOxZJuYe8V1wse7wYRxog167w3dPhaC6Cqv6HogMzmeZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mG6CAeQtLeHbklRZqkm/4aK2vP8j7CUFkApSy7KE3BcRhSKT+s
	5PojIULBeaoUZWPdQjCwpUvblXw4qzDOYXGzODoMbxoL6egzNngxOc9XbGPaJbT4wQE=
X-Gm-Gg: AYBFou0+Gx1qt1YZ+ibqdBk3aurjpU8pjdO90p2L8IaX1ZhIzmLPknNaD6ieMAd5fIU
	740aTvVZ/G3dhPTXimWIKSGz9IPTAPT+8uqa3XOXu5vtQI7IkOP06necrils1QUMHbH51L4oK5T
	wl/ZlhSX1ZEY4NQ5sYBWMR5sUhaiZNd/Uo4LqI6aKPlSnxkrCVEvaPmlYQGUFUSTp7WmmMwvqP8
	ie6l5dJj3jbfhr9LUXldhIlVog0YydVlDzr66jnmSuxGRhWY5lRvoLZFf0yvDZR51LoZ/TUTgk/
	KNMWohknHJEZWJC/djfnb73Cn+2tX57twHJu26P7c/MfF+8ifSpZ8BbI9cLqm9jta6H2YPKsAlf
	nKCdJ8CnbGOzcyrdGXaqGxm5qoZqb5LJRUgvUKytvndYYzVMTBG4O3cgklkldMaoTHMXLXJ97+W
	fwOr+rF/CzT6EtM6xtGLjmIqwAMROXerEux6Xzc5I1sqOL3nl72FGOu3w8owlkETd80GhxfuqNr
	MogHho/Da8AGByBetJM185iBZUpaXHLVfGt7q5r
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id 5a478bee46e88-3537dfdd089mr557084eec.1.1791498387858;
        Thu, 08 Oct 2026 15:26:27 -0700 (PDT)
Received: from hitalo (208-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm985148eec.24.2026.10.08.15.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:26:27 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v3 1/6] Bluetooth: hci_event: Don't fail a connected SCO link on setup errors
Date: Thu,  8 Oct 2026 18:26:11 -0400
Message-ID: <20261008222616.2780570-2-enghitalo@gmail.com>
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

Only fail a link that is still waiting for its setup to complete. A
Command Status does not tell which setup it is for, so, as before, when
a connection is aborted while its setup is pending and another one then
starts a setup on the ACL, an error for the first setup fails the
second connection.

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

