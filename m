Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134863;
	b=ZasOQ5g4Wg1m5oPGbpHKS9tYxdZIs+VslhUHaSl5MTKvHUBYmqqLONz5q6v0MhS3bqXB
	 bUPl5jMs/ekdECuykMrMRIR58U1IMjtldamNJ3dnXO5G3Iyy8WrlyL8ffLy8dD4mV6Uam
	 bQ87P6gATrIAWilnX9cer4RHAHSYpTAWdEFuPGOXGbc890wf2IVVKYZ217q0kQDdQtX+X
	 7zxP0wLKcVGiEBG6l6mezHsZm6F6YCBa6A2s111A0b02a8+cfYOttbIROCVZ8uarRw+Of
	 QSihcg7cOVDtiFbJTQLMivcD9837fAfTlIXHfbMQAyXOidbQhvjCrk7F9me0xKAKilQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vksKrVSWOCoTCBOOcilaf8iYOKdP6CKIUvBJMhUMzLc=;
	b=e3iZnp4t0TBz5WbLawQ8Mo4GeTkDM/etCQQPbQnw1+14toKERXsnmAwK/tznA8pBEMxW
	 T7RbxPIn2LGsF4YeW5cDDcGVhnk0Wx5TmnOiHsHgYVhbHiJwZ6gE9RXTrXB2feewmzRPa
	 ziXRtv5a+g9gcPgBXZrfpVUGAvdXkWs9GzKmHyjikz+Rsor590YKy5e0XVT2FhOzEq50A
	 Iv5Gd6FLiV0xtBQxZU5dDTzEcuLVEbvUHVULuu3LyQghEG8m12JzI+sTgiXKCKacEMaf+
	 Dtls2QxsKMXsBBBlwtDU9MU+gkL66/uBKDNz+PegoI4YXiupGGPgAs1CSUlKDCwzPIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=AmTcmyYx;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21E1C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=AmTcmyYx
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso466553eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793134862; x=1793739662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vksKrVSWOCoTCBOOcilaf8iYOKdP6CKIUvBJMhUMzLc=;
        b=AmTcmyYxpmrV//SRIXmL+vGqWd7Dv5HBTY6IcLBRTgg40aJQwUDjsoRAUhEdSD1/KO
         D5EkXm8tcarR8ffyMZriNYYu4bDsihMoyTBgFBjJ5MYEmwZDB8JMNMpOgRKY+WEcHIwf
         CbmubGrPApbUZ88pk03A1YiDiuv4fZ4brSyNZOPKfq9oyGwUqY0BOgiwycPhmlkPGJ/v
         FmFIGAKYAfIBYOi0fcjBlTicM3iDNBmLBy5wGIL8S6prDg3/8BhNF4ai3zW1AgbfSBNQ
         meeNkVut/B40UQKFiDNDuq13IK8B47pYtyAI1Iw+RlguvbIK8WToAwlZd/POVTKrhQoy
         7g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134862; x=1793739662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vksKrVSWOCoTCBOOcilaf8iYOKdP6CKIUvBJMhUMzLc=;
        b=Mtif+1L7m1PGI7qMjDnHPPaT5Da+ECaTyjPOuo3wlvcuLxK6IhJXyDrd8/C8XgO7aU
         ip8XPQjuwH/aMq/9aLVxM9LyAsI7sUyd7M6CxfAm15aI8BpL/Jk+WDy12bNik5P3dEQv
         wDaHs9uBqbb4S7Tb/xlK78/KzhhSHYKQAu+p2KOJWdMwlVKq1mipg/K6Xp6p/CQKC5hj
         ezumireEDkeN0QM6SO/ft4J7Ta1gFpyNCmTmbVtZQIrqk2JOsZRCW0ovqQI2JPv1NbcG
         2HmI/QbQtIVe30982mgTVHASMdspYJM/JjEFrr6yiMcHc+iDSzr+AwIFBSC4qzmPN+8V
         MzjQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8Sp75CwHrgr/iOXMYIpA6qXdotYXmYEWj3YVEgKhQpjJO7omANCciZ7xY/eRusmlBMT9x2W0OLuul7a0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2mRW6U+Mgvya5KN7a33BTd6D5kQ5GVN3HEVZ2zKMTKrOd6c35
	BY13av0pqCJnyJ6G8XpAatRng3+HMkXygAkIMoUFmH7LwJsnKirTqoHLcjOvs4JVl8/xtvSFreZ
	78TIFuQJgwQ==
X-Gm-Gg: AYBFou0gzV63uEddwqt/K5PBWMmFSfDT5tZE/OmvW+2/iL7fV+IBKzWL3HZ8wFNpGVf
	82M+dDLqY1slscknI4wsHU9GgkpcDujmCG4wxsOcypBCHeQU8i+d91kqJBSSiSJV/LiWerCSyMB
	IZaZZhUJVPikYRBPxk87UHP0kqMKABUnTBHAh/ooy5i9Gsonj0fokmgk6WYcBUTZ1EdB1wq3h2y
	hgZVe4bkrK5iRQuweoanTEMK8RtjHqEm9TrEvluM4vVREgH9gQi/O0ZTtjqZqxciWtpkdcs0afe
	2koTfKUpj71dwVGiKnPLmFxo7wAHpxam2GrkqNpphl13u+Wq7fo7vIFz05/LsN0GSFkKkvHO+GW
	b5NMSoPsMIGD8pQunqrfQdP7AOoygX6h0ndxspPLDUL34NfgYVV6dtWr1xn4PVze/FUJMAJlwlX
	S0N/iDONVqOUNb3RQvbRa5goirVoHh54zur3+DOrV1udiEHp/r27lnQCfzm3/e6wTbpKU7yCjYT
	j7BhpSQIkW1lUAT6rmEOWGKwj13H0gDCOMcMGOHgWTOn/x7ktDDik/JyxrCf/cp64fgRZfe+bi3
	COlS3g8w4CWLl8RI4ZP8jVlAnlC3Wo39Mfh/rjHX+uYMIYcKGX6hpqBftS8T+igB3wHUWiCnfva
	Vyhgi7PXaklW3kwevua/0hQ==
X-Received: by 2002:a05:7300:7312:b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a204773c0mr1110485eec.39.1793134861237;
        Tue, 27 Oct 2026 14:01:01 -0700 (PDT)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm34855931eec.18.2026.10.27.14.00.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 14:01:00 -0700 (PDT)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH v3] Bluetooth: MGMT: Fix discovery stuck after a failed Stop Discovery
Date: Tue, 27 Oct 2026 14:00:57 -0700
Message-ID: <20261027210057.44347-1-kevin@simpleble.org>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop Discovery moves the discovery to DISCOVERY_STOPPING, and
stop_discovery_complete() only moves it on to DISCOVERY_STOPPED when
stopping succeeded. When it fails, for example because LE Set Scan
Enable times out, nothing moves the discovery out of
DISCOVERY_STOPPING: Stop Discovery is rejected, as the discovery is not
active anymore, and the LE scan timeout was cancelled before the scan
was disabled. Until the controller is powered off, every Start
Discovery then fails with Busy, and hci_update_passive_scan_sync()
skips background scanning, so devices set to auto-connect are not
connected anymore.

Move the discovery back to DISCOVERY_FINDING when stopping it failed
while the inquiry or the LE scan is still running, so that it can be
stopped again, and only cancel the LE scan timeout once the scan is
disabled, so that the discovery still ends on its own. A timed out LE
Set Scan Enable can still complete afterwards, which cancels the
timeout as well, so also stop the discovery when its scan is disabled
while the timeout is pending.

Fixes: 0e05bba6f6f8 ("Bluetooth: Update stop_discovery to use HCI request")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
Changes in v3:
- Go back to DISCOVERY_FINDING instead of DISCOVERY_STOPPED when
  stopping failed while the inquiry or the LE scan is still running.
- Keep the LE scan timeout until the scan is disabled, so that the
  discovery still ends on its own.
- Stop the discovery when a timed out LE Set Scan Enable completes
  afterwards, as that cancels the timeout too.
- v2: https://lore.kernel.org/linux-bluetooth/20261027172730.86568-1-kevin@simpleble.org/

I did not find an error status that shows by itself that the scan
already stopped: the kernel only disables the scan while HCI_LE_SCAN is
set, and hci_cc_inquiry_cancel() already turns Command Disallowed after
the inquiry completed into success. So v3 checks HCI_INQUIRY and
HCI_LE_SCAN instead, which are only cleared once the controller
confirms. Going back to DISCOVERY_FINDING sends Discovering (enabled)
again.

Reproduced in test-runner with a new mgmt-tester case, "Stop Discovery -
Scan Disable Failed 1", in which the emulator answers the first LE Set
Scan Enable (disable) with Unspecified Error: without this patch a
second Stop Discovery is rejected and Start Discovery fails with Busy
(3 of 3 runs); with it the second Stop Discovery succeeds, and so does
Start Discovery (3 of 3). Without the second Stop Discovery, the
discovery now ends at the LE scan timeout. Freezing the emulated
controller while bluetoothd stops discovering makes LE Set Scan Enable
time out and then complete just after: the discovery is stopped when it
completes, and Start Discovery succeeds (3 of 3). The other kernel
testers pass as before. Only tested with the emulator, not with real
controllers. I can send the mgmt-tester case to BlueZ if you want it.

hci_pause_discovery_sync() has the same pattern on suspend, which I have
not reproduced.

 net/bluetooth/hci_event.c | 12 +++++++++++-
 net/bluetooth/hci_sync.c  |  8 ++++++--
 net/bluetooth/mgmt.c      |  9 ++++++++-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index d05934fef4..80679f1881 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -1819,6 +1819,8 @@ static void store_pending_adv_report(struct hci_dev *hdev, bdaddr_t *bdaddr,
 
 static void le_set_scan_enable_complete(struct hci_dev *hdev, u8 enable)
 {
+	bool timeout_pending;
+
 	hci_dev_lock(hdev);
 
 	switch (enable) {
@@ -1848,10 +1850,18 @@ static void le_set_scan_enable_complete(struct hci_dev *hdev, u8 enable)
 		/* Cancel this timer so that we don't try to disable scanning
 		 * when it's already disabled.
 		 */
-		cancel_delayed_work(&hdev->le_scan_disable);
+		timeout_pending = cancel_delayed_work(&hdev->le_scan_disable);
 
 		hci_dev_clear_flag(hdev, HCI_LE_SCAN);
 
+		/* The scan of a discovery was disabled before its timeout,
+		 * for example by a Stop Discovery that timed out and still
+		 * completed, so nothing else would end the discovery.
+		 */
+		if (timeout_pending &&
+		    hdev->discovery.state == DISCOVERY_FINDING)
+			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+
 		if (hdev->discovery.type == DISCOV_TYPE_INTERLEAVED &&
 		    hci_test_quirk(hdev, HCI_QUIRK_SIMULTANEOUS_DISCOVERY) &&
 		    !test_bit(HCI_INQUIRY, &hdev->flags) &&
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 9d71ce96bd..6465198f13 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5913,11 +5913,15 @@ int hci_stop_discovery_sync(struct hci_dev *hdev)
 		}
 
 		if (hci_dev_test_flag(hdev, HCI_LE_SCAN)) {
-			cancel_delayed_work(&hdev->le_scan_disable);
-
 			err = hci_scan_disable_sync(hdev);
 			if (err)
 				return err;
+
+			/* Only cancel the LE scan timeout once the scan is
+			 * disabled, so that the discovery still ends if
+			 * stopping it failed.
+			 */
+			cancel_delayed_work(&hdev->le_scan_disable);
 		}
 
 	} else {
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 3cb4f9ece8..2bdc355786 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -6322,7 +6322,14 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
 			  cmd->param, 1);
 	mgmt_pending_free(cmd);
 
-	if (!err)
+	/* Go back to DISCOVERY_FINDING when stopping failed while the inquiry
+	 * or the LE scan is still running, so that the discovery can be
+	 * stopped again.
+	 */
+	if (err && (test_bit(HCI_INQUIRY, &hdev->flags) ||
+		    hci_dev_test_flag(hdev, HCI_LE_SCAN)))
+		hci_discovery_set_state(hdev, DISCOVERY_FINDING);
+	else
 		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 }
 

base-commit: 47d4d9f67e92d56ef3965f2727f9c98a5a611368
-- 
2.53.0

