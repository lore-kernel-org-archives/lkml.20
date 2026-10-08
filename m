Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8993D4D9F90
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472383; cv=none; b=Bk6TwBA+LQJMAUOVhH2tRMbyqjqhyDsSBJBvgRsuUV5/Yi0aRQnnGmOr1eB9qlXdezz/T3GSWiluq33A7+VYWjr5dZ2fz7P9va9QFbcdOFNhm26D2H3ommdXb3vYrTkiBgMKJLNFQnm2iaBmS6vXb3n2tZ5734kpNIjeySWtwoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472383; c=relaxed/simple;
	bh=wZ6CozmUkheyMWSqRGV6kcV+PJZj5pgj7ODypAQ9KPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPtOmdFKli+YQ5eLEd4wVgheD2z+ZlyPby+nOVUbzbMUvxDrgLXeZ3qc6imZ6r0fPomY5Oov+59O+KWhkh5hCdGXygJ/S04zdxY6WuX2pZ0JhoGThcehplLnx9YwzCHdlH6xGIrIJ7YYB/iMALMFwtE9C5l1rxcQDH/dlEqKlmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVHiU3fu; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVHiU3fu"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3530a44737cso61337eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791472374; x=1792077174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozb/59ScS84H3e/TnN2LeOjW0OQv9TZinl1O9+31lFs=;
        b=lVHiU3fucHaqrjiXuf3DTtjLwmrj+TgW6gJsFLrBIAh4uhqPXx2kC8B91fD6/PiNln
         ihbb3uFy//Kz3syT7nWBTQ1hIG+S+zVa5OxdLBh6V8XJdXyTT8HvhIVn5ade6T98qBP+
         8hZydkjM4j5L8BCI1VxMbXPgs9qMSgU4hUYEGdLLJ/PPlRPAzRqD4/PXcuXAm5//4KRo
         2AbG+cHqVBzzYop81tU97xeWZmbr+5UezbV1+esFokEYnbij9CETVad0BMs8Z0IaihzF
         jBGQzCrCI9cmEzmnvBdq0NuITBi9OWdegih6DUnCdqDkArzGDoT5uxhgiHLeqQM2fA1b
         d/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472374; x=1792077174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozb/59ScS84H3e/TnN2LeOjW0OQv9TZinl1O9+31lFs=;
        b=yZsgXU4cueZQ3J1DiDNRChbv8LC3DRXifxbsV+Zgx79kXrtDfwPhSsD40oiru/yNM3
         OI4O3L1gOCeK8YeNWwEzWJILdfXUbH8xvP3mUcS9ds0tlfVw7Tpb6vmmK8Xu7sXEMfvD
         iicYUP0nywetuhm/itqWPD29iiCPP8zXighIv0ZRIdjWPYbPMV9k2Qpqq/JxGF87kwzY
         oDscQuHWaBEr+C4MrAKtJMC9Hr/p6NEIL031u6r/4iNcUQki90zy4ZX/FbOayaIzfDit
         KuBvcDY+MtYfGpDbgy/VG1v62It2iF38SxTJcKhyUx9dbSP0EwyhvMUf1RKeDr08Pvzp
         2toQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8eRNLsB13dsM+0EQjBNiWAKYxOPWX7h+k/rpnwU4U/p70iJVlWK5biT0wV6/9KuNCSbkybWfdzPZugTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5EXpjrdrBr+64upDdsnI8l+BE0Ba6nui62SnDmB4w3LmzyszW
	4lmoXpeDrtwiTSzkPewNndQFIsmIn7mv0BS8S1X7y0P5Mm/82rQkNGh4
X-Gm-Gg: AYBFou2uX78KIaXxzNKXOqmw15Lr/AXfyiLqfaUFbGn0CqDPfXe2kh8ReSk4GXrg5Nw
	C5oqyqZZJ3S6xrIpHkPfrVwKQe7avHsweL7+U/hJDXv9RUlppZuTd03k8tE+vXjb/prGmfxjVPD
	a4S2AVCCCxD8AxClE+1Rb9+LPFw5Bk6HA4gY0LnjJsRj5GqXPDHbFoAE4j3zmTXSPlV3oqAgyTW
	nvlLJvWJuZSBVnN88FPMAN+xNyL5q0+MNpy+u5xTa5SZcIeQkuGnjdUk5n5Ne3TPLpDPjDNXpCT
	M/ONxuXKm+VbEdunEJ4dfVpcaaV+dCmsxT7kQ2kietonfzlGpbeJQETjD6nGq/OnBXu97DwKFyo
	0IqWPxsrwimmBU46xfLlqRE+jzlzG1MtIhQGyM4aI6it0K/KTjcDli+8Ye7DdHcpI95pE99ByMz
	iGTEoAoW539wQwRVNBIBZM2/qGVcg1XFZYB+yEve+TrHawn7Uk8IAYkPmaYossvCzXF0QpDepSL
	pN93tynfh3Av7/5ADsmKxx+aMVQY2yjHhP+OaAr
X-Received: by 2002:a05:693c:8111:b0:33e:6714:3945 with SMTP id 5a478bee46e88-3517566b798mr6293965eec.2.1791472374184;
        Thu, 08 Oct 2026 08:12:54 -0700 (PDT)
Received: from hitalo (190-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afd00e0sm18052389eec.23.2026.10.08.08.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:12:53 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	Hitalo Souza <enghitalo@gmail.com>
Subject: [PATCH v2 2/6] Bluetooth: hci_conn: Don't set up a SCO link that is already up
Date: Thu,  8 Oct 2026 11:12:34 -0400
Message-ID: <20261008151238.2138665-3-enghitalo@gmail.com>
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
aborting connections"), a SCO/eSCO setup abandoned while pending can
complete after a new connection to the same device was made, and it is
then matched to that connection by address. The new connection's own
setup may not have been sent yet at that point: Enhanced Setup
Synchronous Connection is sent later from the cmd_sync queue, and any
setup is deferred while the ACL leaves sniff mode. When it runs, it
sets the connection back to BT_CONNECT and sends a second setup, which
the controller rejects since a link already exists. The connection that
is up is then failed by the rejection, or left in BT_CONNECT and later
deleted without a Disconnect when its socket is closed.

This is the order of events in the report: the second Enhanced Setup
Synchronous Connection was sent after the first setup had completed,
and was rejected with Invalid HCI Command Parameters.

Don't send a setup for a connection that already has a handle. In
hci_enhanced_setup_sync(), take hdev->lock before checking that, and
check under it that the connection still exists, as
configure_datapath_sync() runs without the lock.

Closes: https://github.com/bluez/bluez/issues/2562
Fixes: a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting connections")
Assisted-by: LLM
Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
---
 net/bluetooth/hci_conn.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 29da3fe2b..399c7db77 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -290,6 +290,22 @@ static int hci_enhanced_setup_sync(struct hci_dev *hdev, void *data)
 
 	configure_datapath_sync(hdev, &conn->codec);
 
+	hci_dev_lock(hdev);
+
+	/* configure_datapath_sync() runs without the lock */
+	if (!hci_conn_valid(hdev, conn)) {
+		hci_dev_unlock(hdev);
+		return -ECANCELED;
+	}
+
+	/* The link may have come up while this was queued, see
+	 * hci_sco_setup().
+	 */
+	if (!HCI_CONN_HANDLE_UNSET(conn->handle)) {
+		hci_dev_unlock(hdev);
+		return 0;
+	}
+
 	conn->state = BT_CONNECT;
 	conn->out = true;
 
@@ -302,8 +318,6 @@ static int hci_enhanced_setup_sync(struct hci_dev *hdev, void *data)
 	cp.tx_bandwidth   = cpu_to_le32(0x00001f40);
 	cp.rx_bandwidth   = cpu_to_le32(0x00001f40);
 
-	hci_dev_lock(hdev);
-
 	switch (conn->codec.id) {
 	case BT_CODEC_MSBC:
 		if (!find_next_esco_param(conn, esco_param_msbc,
@@ -625,6 +639,12 @@ void hci_sco_setup(struct hci_conn *conn, __u8 status)
 	if (!link || !link->conn)
 		return;
 
+	/* The link may already be up: a setup abandoned while pending can
+	 * complete after a new connection was made and be matched to it.
+	 */
+	if (!HCI_CONN_HANDLE_UNSET(link->conn->handle))
+		return;
+
 	BT_DBG("hcon %p", conn);
 
 	if (!status) {
-- 
2.55.0

