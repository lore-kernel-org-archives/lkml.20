Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB474D4896
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472385; cv=none; b=DWTIA27EyWCy6JL061IcOwTBLoFAL0Dr465ij06OP0pn+J/XD6EfE8nn5qWue46VWemulBfgAf487e06wrmAeRsrvDthVTCF2pbDNI1ejpokLopQOARbXC3B5dWqU6FpCo/28i/pg9CzIF/3NkaWmUZvcB7p3vYn9vVTSCZjdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472385; c=relaxed/simple;
	bh=P2AJlJENPvJS7GPy0iCZJp6A75CwIyadtSbULF4M3cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nykm/SoJ9PGrHeHBeiAS71Jw/P+WIff4LT9QZAvSEWcNLG0T8cPYPZ/cUTe0EOOmwYWqFDV+5m8ZIWipA717Rq3gZipI0g+1WpYYUYHg9nH3pI4Y1Y5i89mNBKya7/Tzau6pd66ONfBxQaDC7MdyoYGXujCDv0w5OOj+vWYm1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H77wM2Ua; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H77wM2Ua"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3517ec27a49so93956eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791472377; x=1792077177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9ooXR6Y09KtjeY/pkwXIKyVeGH6jcslX5LxHatrik0=;
        b=H77wM2UawO3pwO56u59SI/0+us1Pi+YQ2FY0mZv6uyMGKlOugi2TwRaB9VT94Ia5fA
         IKot4H8DDM3v9v30PW7nmnjOJ66oZI1wHaaH8p8nfjvq134wCCXjR16xIOltcELid11I
         5bpnNzA6CnULLR9G8pL5YEe7HQ3Ql6X7MTl+IbWNuDeE/4NKpM6bNEMCiAswUx87X94o
         q4w5jT2AuzDDf6pmXlXsomRDxaTHCQBHxaTlXwYoSMcOYcN/DJBO1PPnuDOr0Pa5za/L
         Z7q81NS7tTSllvFQSPalBxpwMV4DZfomH7OhfPLVjEWvg4kNjHZ/0t0yadg0pmJYNeRe
         yyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472377; x=1792077177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9ooXR6Y09KtjeY/pkwXIKyVeGH6jcslX5LxHatrik0=;
        b=oySfj/5eptCIW7ZlSdxdt9xmHubAJY29Xv3/KXIRjV/1VPyo6zIAm1QdJI9JrgZYg2
         RWKLisPhl6XT77TzLs0pIhchpgP9yLPwsuJD6IYyPFPQO5WSuuhKsjdedF7qE4BVpci/
         yL6RRbmLsSMo3bZhZI9YOtELxDUSnz7L/zJdmuR4nNzFWsldN67qY3u68QpJS3a2s4GU
         pRcVfsE9HLfOsQu7lzBnaeSykYrdM0xbr/o34YxJMcRt6quY9rVV48gcDvKCXwFMnoqC
         BU+DJDFlaMzVdXqXKHNTAueYv6e8lTBYm410qbyatwX6zxQY0/Rb56sn2yvBDbLJ8B5N
         ZVnA==
X-Forwarded-Encrypted: i=1; AKwUvBy7SjRC/T0jRy7L3z2X7TbjPP/jfp9ewTIO3524ondiW0Nh0kCZpOlYQPGjpbwe+qDGsqaEpjIq8mtnkAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEKlpZo/o69jNvR65j76Z7UERpA6NfNlTBtn1GuPzu53n/UiJH
	vKFxPFwqnNjkHQXsR1jApz2fVkx5apMTTdtMq6Tm9tEsV1Idkzv0MIbS
X-Gm-Gg: AYBFou1H0jc/185MMS7gQ1P3jXZHajnmuRWR/mseAC5meeGcoPMZnYgYxVs/+CWelDu
	TfzmJfxE6MX5prB6V3sd9dsYNXrwrRf0dbrcN+GkuN/8jwXRvfqt+NMMUTdl0TuuYw/Po5W26sv
	i4y4KawEkRPS7qt0bwjVXN6czuYLjjFyDEKVnrSR8CRhb2NMNf3MYxzfPzoEYYZYyPbQCfen3SD
	glocPGkxJCTD9ZG8GGwctRgBv4jIWVTEDB11sdYPpmLVGiWULddQhhmjqNMYJ+mo4f6amGN98OT
	X94d4lsi9g7g0wiaHq5ipsVKLr1WtehJg4XyPt4BeUsiaWzh8Flm+6GCR2A21zgll6weH86EDsp
	OkstUv5nFpKkujDvf5PmgM1xA3T065iN2ZiHrVtkhNP4IbBprypEJED03ZZeCCwqslw+jgkj+vQ
	SWfEIG/yG/qsGxzC9OuYHTWtIKal9XaYLDMdpe7Mj+lpPNCw5Adicqb/eVXZM3oIUfYngW01Br7
	vVNxRYz72VibZ0D50FUlUgg7V3GlVBW9LV6lzyhk40YnXZ0VD8=
X-Received: by 2002:a05:7301:7307:b0:351:7e15:9c59 with SMTP id 5a478bee46e88-3517e15a574mr3527620eec.0.1791472376732;
        Thu, 08 Oct 2026 08:12:56 -0700 (PDT)
Received: from hitalo (190-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afd00e0sm18052389eec.23.2026.10.08.08.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:12:56 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v2 3/6] Bluetooth: hci_event: Disconnect links that complete while being aborted
Date: Thu,  8 Oct 2026 11:12:35 -0400
Message-ID: <20261008151238.2138665-4-enghitalo@gmail.com>
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

