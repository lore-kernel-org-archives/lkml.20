Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638806;
	b=VZyF3J9cEPhSHOZCT/GFd9uh3qf5Oyvy0/UXrqqiI/U6IJZUhvBC95Moex16KxHt7B7I
	 OHLPoh3NGcfCEnuTGjt84LIf0O3goGqmjxmMyK97q39Bu//dO2CfzjWrkDGUDlcqAbNL2
	 RghAxM+5xmKrRr23aGDCnBkW8L3o2gtHsdP1ZdpbTYvmvuW8H1weBSbfM3c97MszyZ6Mq
	 Lftmqc2qyFb6RJ3LfN9boYxgnyC6Jx/zF9HVfPxWG6dvWNdx/9K4JYe6cSaTMlHpxUhfK
	 COmKRDIj7iqETeFsopm2UmHkHmccQg+qSqh+fDUR243s4mxpQnYWIQbrW6QU89CMDSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wPJslWzgV/qmgQrkFiDa1p1u44fnWzbYAs/o+wLjkr8=;
	b=MGbinUQE4S9wZBSpSBc44TcvQ8CDKzMNG29nIzc3dXH9sR5/JdFz4/qpKT2/BBQu7VWZ
	 0KpHZTz1RWCM+M9pbgKDuoXrCKjnr5ujsReobRNiDG2C70iyn1ndzrcqgB43u2FmzzrXK
	 ClJiLPD1bH2Iu44bafhh90heW3oIlUanzdUHVy0Rks1pSqu112QFozFCrQfkROo1FvZoL
	 l9JtucicdmENYGN1wF68+CVP4Ysl0RI98B0nrcjwqr50AnnuUv8kEEDyf/LkDxcuV+Aiu
	 9eer09LFfRau0HnXAhDhqAaUqcPvkl0Ef6bA8e3s2ADpPysrsTrOabVM5YxzoYUSY0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simpleble.org;
	spf=pass smtp.mailfrom=californiaopensource.com;
	dkim=pass header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b="gqM/FvLl";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB960752AF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CB960752AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simpleble.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=californiaopensource.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simpleble.org header.i=@simpleble.org header.a=rsa-sha256 header.s=google header.b=gqM/FvLl
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1438d9363fbso2523453c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simpleble.org; s=google; t=1793638805; x=1794243605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPJslWzgV/qmgQrkFiDa1p1u44fnWzbYAs/o+wLjkr8=;
        b=gqM/FvLl18Yd0YilZ+++KmUtIF//9SIjokWGRAaIJXrH7grYfg0sPFLjfGRcLwj8Vc
         xJQDuUuDvUoMo0Ut27i7iNNjgkq0rqVd61t2uHapoI1t64xjkucAdhU2LNb5plDyNmHk
         aaENUKFYcLWucZcgaRaloRRVXvW/7TVyeUpLqALW3kx8jolM1G3ElalvZr4j00EY4coj
         gUf28r2/VKnJDg3taKzyk9HFaKlvyjD8k3nFBzJeLDkfa0mkrHUv8Z+q9uhje1tUelOj
         5ZD6Jhn5QUW5cCO12TsxtFwXmEcaeSVhu9jddgkRn5HPrmky2CIJggSnfLpMvO5eHERJ
         OJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638805; x=1794243605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPJslWzgV/qmgQrkFiDa1p1u44fnWzbYAs/o+wLjkr8=;
        b=Os92nDRv8ePZ6npQcxpyozhBeYQXMVGK7D3BvDLZ9vcHWh4Q/5JUqacV5sUruJ/iaB
         dugVEVlHYQGGsn1Mht9sP0YRuiLA/eaZpeBi363xSMuOnmW8maeLLo0ZuSmIxnEJ6vmq
         at580+oe3eHReyP1BYYfI7otibU+ooJS4bvRE6jVk4QHXsq5nPGY+fy9bW1+6kSsaF0H
         zSp+NOMj8zWwuuQhIxg0wNhjpAZ0k4emJKJaqFUIGt5tMWWRaTcP8/dGccpItZn0Zw+C
         4FWEZ0nAaWjJQtlMEKFgHLVVf28yDyXXbl5qtqdmj6b31ls2Fj4BrIKsZYWnQ8ipI5Ih
         1QsA==
X-Forwarded-Encrypted: i=1; AKwUvBxG6Uba0RL/8j+XGzn9wMwOW/eYnO5bHE/wqI/es+w27EhFu5pCzpWCa4rrU1RjIaTEk6wbZHBPcI5Q2xY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGMU05eEEd/wDzTrLibSgIxOab6FqrnV1iEx/wvH3OfrUpYCfn
	W8E3wnk78jUcLoPyxgxhME4952Ag48crKG5pLowxLrCB50saMK6ddzKHLvQSz48lXdX1avOYsSj
	Umjw3mUk=
X-Gm-Gg: AYBFou2thqwBVlIMwh1QFB2bArhrZwFtu3qEzVLPR964asJAYXhbuGhdkkOsomMbNQ5
	XDU+N2KPtxzF0mjcsUiOJx6PXOFKtK7OZl+loJC/WXwSyMBZiIFZUwgdmS1AZK3yddyeze3gUgU
	5YBMgBmcJUbVLaIhNdkHluhJrGmc82T2/zczqcPQ4wzMbh1MMHvRsRfe8ZEz6tDY8hOz3ifFAid
	m9hZ+brnf0IjgUzNaSvn6CFK3pDa3c8zrTJF/LOih4fdDodpOj1ePIKJnYC+L2n6rTWFqY/vcnH
	aTC2/1zvDvMz2lGH9lK3L5THCSSV1iDSdjTg0/VSQgyPJOdl4mqekTQjEQMamYQlHQ2h9/rj6wg
	adQGPrGfEhMPaWQtNkE7mxDDw1f7QTDXpH8SXwcWDIFb0yqScnf1w89cdPxR0qD+YHuStGN8Lfb
	90sdfnatZI+MF3ST/+W6zwqbj5gzc+Egqjzj/LDSeLzRiNOs9z6a/TPsR320Aqvod9Kxt2BVQDT
	EOMjEMd1bhssXH4tYsd7G59UfGrM3Sp1fgs9LRe8iV/plUB6DNIVuKjZqS+c1vinhUK4WDWEog8
	M2NGXc86vYMfpfLgy0p9TnFA9gCSQ7NC/2N7KSW87Syzvq7BK7aqytuF9K2lmwu4BxStBNw8iMI
	muINF7lwjRJvJOxnYtZuXG8uJzXqmN6b0OfYXL/iZkp5zxPtfTiUUXKs2Ms1YXOBnYHUeewQ=
X-Received: by 2002:a05:701b:4586:20b0:1ab:9742:e028 with SMTP id a92af1059eb24-1ac55960b4bmr14590265c88.3.1793638804745;
        Mon, 02 Nov 2026 09:00:04 -0800 (PST)
Received: from localhost.localdomain ([147.185.47.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm35224345c88.2.2026.11.02.09.00.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 09:00:04 -0800 (PST)
From: Kevin Dewald <kevin@simpleble.org>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kevin Dewald <kevin@simpleble.org>
Subject: [PATCH v5] Bluetooth: MGMT: Fix discovery stuck after a failed Stop Discovery
Date: Mon,  2 Nov 2026 09:00:00 -0800
Message-ID: <20261102170000.62469-1-kevin@simpleble.org>
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
while its inquiry or active LE scan is still running, so that it can be
stopped again. Only change the state while the discovery is still
stopping, as Inquiry Cancel may already have stopped it, for example
when only the passive scan could not be disabled, and a new Start
Discovery may have followed. Do this under hci_dev_lock(), like the
command completions that change these flags, and before replying, so
that a client acting on the reply sees the new state. Only cancel the
LE scan timeout once the scan is disabled, so that the discovery still
ends on its own, except when suspending, where it is still cancelled
first.

A timed out LE Set Scan Enable can still complete afterwards, which
cancels the timeout as well, so also stop the discovery when its scan
is disabled while the timeout is pending, or while the timeout work
waits for the lock.

Fixes: 0e05bba6f6f8 ("Bluetooth: Update stop_discovery to use HCI request")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Kevin Dewald <kevin@simpleble.org>
---
Changes in v5:
- Only change the state while the discovery is still stopping, so that
  a failed stop does not overwrite a new Start Discovery (Sashiko).
- Change the state before replying, so that a client acting on the
  reply sees it (Sashiko).
- Keep cancelling the LE scan timeout first when suspending, so that it
  does not run while suspended (Sashiko).
- Rebase on bluetooth-next 42b8c2d729.
- v4: https://lore.kernel.org/linux-bluetooth/20261030042437.42733-1-kevin@simpleble.org/

Changes in v4:
- Only go back to DISCOVERY_FINDING while the discovery is still
  stopping, and not for the passive scan (Sashiko).
- Check the flags and change the state under hci_dev_lock() (Sashiko).
- Also stop the discovery in le_scan_disable() when the scan was
  disabled while it waited for the lock (Sashiko).
- Rebase on bluetooth-next 1081a6ef8f.
- v3: https://lore.kernel.org/linux-bluetooth/20261027210057.44347-1-kevin@simpleble.org/

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
the inquiry completed into success. So this checks HCI_INQUIRY and
HCI_LE_SCAN instead, which are only cleared once the controller
confirms. Going back to DISCOVERY_FINDING sends Discovering (enabled)
again.

Changing the state before replying also sends Discovering (disabled)
before the reply when stopping succeeds. bluetoothd already gets that
order when Inquiry Cancel stops a BR/EDR discovery, and its tests pass
as before.

Reproduced in test-runner with a new mgmt-tester case, "Stop Discovery -
Scan Disable Failed 1", in which the emulator answers the first LE Set
Scan Enable (disable) with Unspecified Error: without this patch a
second Stop Discovery is rejected and Start Discovery fails with Busy;
with it the second Stop Discovery succeeds, and so does Start Discovery
(3 of 3 runs). Without the second Stop Discovery, the discovery ends at
the LE scan timeout.

The v3 and v4 regressions reproduce with a BR/EDR discovery while
passive scanning for an auto-connect device, where only disabling the
passive scan fails. With v3 the discovery is enabled again and Start
Discovery fails with Busy (2 of 2 runs). With v4, when another socket
starts a discovery after Inquiry Cancel and before the failure, a
second Start Discovery right after the failed stop is accepted (3 of
3). With this version the discovery stays stopped in the first case,
and the second Start Discovery fails with Busy in the other (3 of 3
each).

Freezing the emulated controller while bluetoothd stops discovering
makes LE Set Scan Enable time out and then complete just after: the
discovery is stopped when it completes, and Start Discovery succeeds
(3 of 3). The other kernel testers pass as before. The lock orderings,
the reply ordering and the suspend path are only checked in the code,
not reproduced. Only tested with the emulator, not with real
controllers. I can send the mgmt-tester case to BlueZ if you want it.

Not changed: hci_pause_discovery_sync() can still leave the discovery
in DISCOVERY_STOPPING on suspend when stopping fails, which I have not
reproduced. A simultaneous discovery that is stopped while it resolves
names also goes back to DISCOVERY_FINDING rather than
DISCOVERY_RESOLVING, so its remaining names are not resolved and the LE
scan timeout ends it.

 net/bluetooth/hci_event.c | 12 +++++++++++-
 net/bluetooth/hci_sync.c  | 26 +++++++++++++++++++++++---
 net/bluetooth/mgmt.c      | 23 ++++++++++++++++++++---
 3 files changed, 54 insertions(+), 7 deletions(-)

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
index 9d829c20c3..9213e3ef9f 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -376,8 +376,18 @@ static void le_scan_disable(struct work_struct *work)
 	bt_dev_dbg(hdev, "");
 	hci_dev_lock(hdev);
 
-	if (!hci_dev_test_flag(hdev, HCI_LE_SCAN))
+	if (!hci_dev_test_flag(hdev, HCI_LE_SCAN)) {
+		/* The scan of a discovery can be disabled while this work
+		 * waits for the lock, for example by a Stop Discovery that
+		 * timed out and still completed, so end the discovery as
+		 * le_set_scan_enable_complete() does when it cancels this
+		 * work.
+		 */
+		if (hdev->discovery.state == DISCOVERY_FINDING)
+			goto discov_stopped;
+
 		goto _return;
+	}
 
 	status = hci_cmd_sync_queue(hdev, scan_disable_sync, NULL, NULL);
 	if (status) {
@@ -5920,11 +5930,15 @@ int hci_stop_discovery_sync(struct hci_dev *hdev)
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
@@ -6559,6 +6573,12 @@ static int hci_pause_discovery_sync(struct hci_dev *hdev)
 		return 0;
 
 	hci_discovery_set_state(hdev, DISCOVERY_STOPPING);
+
+	/* Cancel the LE scan timeout first, so that it does not run while
+	 * suspended if the scan cannot be disabled.
+	 */
+	cancel_delayed_work(&hdev->le_scan_disable);
+
 	err = hci_stop_discovery_sync(hdev);
 	if (err)
 		return err;
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index cf5256f4a8..260ef2a457 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -6318,12 +6318,29 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
 
 	bt_dev_dbg(hdev, "err %d", err);
 
+	hci_dev_lock(hdev);
+
+	/* Change the state before replying, so that a client acting on the
+	 * reply sees it, and only while the discovery is still stopping, as
+	 * Inquiry Cancel may already have stopped it and a new Start Discovery
+	 * may have followed. Go back to DISCOVERY_FINDING when stopping failed
+	 * while the inquiry or the active LE scan of the discovery is still
+	 * running, so that it can be stopped again.
+	 */
+	if (hdev->discovery.state == DISCOVERY_STOPPING) {
+		if (err && (test_bit(HCI_INQUIRY, &hdev->flags) ||
+			    (hci_dev_test_flag(hdev, HCI_LE_SCAN) &&
+			     hdev->le_scan_type == LE_SCAN_ACTIVE)))
+			hci_discovery_set_state(hdev, DISCOVERY_FINDING);
+		else
+			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
+	}
+
+	hci_dev_unlock(hdev);
+
 	mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
 			  cmd->param, 1);
 	mgmt_pending_free(cmd);
-
-	if (!err)
-		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
 }
 
 static int stop_discovery_sync(struct hci_dev *hdev, void *data)

base-commit: 42b8c2d729268a65a2d98064e8dc59ff53646b14
-- 
2.53.0

