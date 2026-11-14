Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660678;
	b=c8HHn4kLBa9e2u690entgR/jOh6Iar0Kp4ccSNh2B1m7MRIb6xMKsvuWhSoA6ffW7duo
	 IfzdOtadEctyKMbZCC6n90/mVMh9BDWHZcnID672J/SNlEKSnlo8qRXBcJRXHZe1U4voV
	 pd568oQhGGjc8vV/R1U/rRq+yZrkI3XvtiRAZUAZpn4mKEJ6IyAWsryVCkBDQV0kDBsKl
	 u6Yj0qwV6zNof8Ym6KSkWBVSCc0xQB02P1wx+Ksvp8ZIStaTUlGxd9m9J9Ph/FmwidEgh
	 li3UmGNZkHRSGOMXNE5T7K2TYiXaImk3BL5eHQg+4yD8kh7rTqszBsjBujia2tnRqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zTE0rfV81tJa1B4KMy6Td9Ov/8P+5EVCpuN5n3QKOnw=;
	b=bI8tRWnkWxhlS5FlgVR8PauHb2MOSUn9SvB7H0T6N0zefy+DKk8hZxM0TJlPKF+P5TYj
	 JmYNSIMnfHFH+eqaYiHy7QORXgnhpbGMQJwXdkg1/e0P9pOeiat+sOvTGGvW1gweES8dw
	 UL47DwlrHRBGIdVkzrBoyKCgeHy9YfbFHzss3UAOgoSntkaWIYHiLyGpQddSkefAKwEMy
	 w/S7Ly3lF8uvomTtgvSGVaOMDHJEf15xaRWlX7iz8WumW9muyeiMswQRjnD0pVufX9v9S
	 X3yOYWOWKR8qf42KHMPtwGEcL7b1erOKiOEBAgBxk0LDPo1BIUQFZTWjpl3fO5H/Hpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kenhou.net;
	spf=none smtp.mailfrom=kenhou.net;
	dkim=pass header.d=kenhou-net.20260707.gappssmtp.com header.i=@kenhou-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pO49Lsw0;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD3606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9DD3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenhou.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kenhou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kenhou-net.20260707.gappssmtp.com header.i=@kenhou-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pO49Lsw0
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed41818a4eso2189085ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kenhou-net.20260707.gappssmtp.com; s=20260707; t=1794660677; x=1795265477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTE0rfV81tJa1B4KMy6Td9Ov/8P+5EVCpuN5n3QKOnw=;
        b=pO49Lsw0t+AgAwzqW1tdC0vCDwYOVglEGq71HHfkMAlA29Jd078T20P1zNGwhLrgDL
         03g4/vL+Yl9P34jqI9++cuCGurpW+jqLe2CRWgaI16xXmaHgXhqZUMZaSIrrSNJQmurc
         ub5agkJLpAr7aw8YK0TTYQS00PqVms1UL0wJFVUTPEZCg77FNPH38WldZXkW3w4FyLyJ
         8wt6+Zy6GnJCSXTLTd7WfJL3+vYWp3cPAezEBR2mTslO4VLjunb3ofAP/VIuI4bSF+kp
         abBQvfWXmV5IIjU0GXoSpr1E8tjfvrms003mK9VEJ6K6E25zwDOe1dUQ7/+s8i0/nr1c
         QDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660677; x=1795265477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTE0rfV81tJa1B4KMy6Td9Ov/8P+5EVCpuN5n3QKOnw=;
        b=jWzEOCUjJfcpEg5Vh/6ugVXo9EZcWIs4vL6Tg+DocLz5J2IptHnVDD3lS5RwnOC5sV
         Adj6FOZBBgrrkJdlISBzTnlRbRwhilyUSb5TthMv4eL1ZHvcONdqatgA8s3xl2f8XFoL
         AItHnYWGiuljvUTkIe9vBnKEnwzAG4AzN3SvOFid6O/KER6/C11qxOGlKev1LaXXefzq
         PY80oH/f0ca8s83mZ7u3Zc6k/9goq6kAkPDfN09tY1D8zXJ/b4heV8fHmMyBWXvJ6rBE
         Z3o17jFWb10n7Qxrhc1jzrWJc9tTQkVxda/qGHtw330wTVZpx47slroQeMZbICIpqgHp
         DeJg==
X-Forwarded-Encrypted: i=1; AL+hErGkYMyanrk1CrNd/GfTbIV98Bi8F/LxyREwWmdd2PEmzvakx4nQFt1Jrrgp+qnTXK0mdp13ppnuJ0UBJ8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d6euZqTKouT7BSamYFZjN+QJfk0xvb95EDdCXp9G9WYzZEF2U
	/Z4wpidD/G07bVH48A4PmJhEXWm+2nqjYITXXZEuiOhV2XiFl/J95TvTsyk6d3spx/g=
X-Gm-Gg: AYBFou2mFiyaF5zEvb9KDfiPfLUD7qbHkK94CfqI33HrPp7/f4smi9V9RHZHUfe3CbO
	78K5QpkHRiZe7OSVoOtoJ2HmW4ur0GfMsD4WyooIw2x873O83vvLR4JcaU4UMY+ZM5SROC/+kGS
	zW0qfqMUxzQyg/cDaFmzXQt4OBBcpy9vVvOdAYvjULy9CPAsYcZCKzKb+jSk0h+sHizkuNagIJZ
	3x3WvMs7EKx0maQ2RZUnryGmKhIRMb00GtoDatIEE4btoKqXbE3a28zVvAkeHqvWCrExdb5Wq1S
	75du/USrMCeNAN9j7RyIe6PUbmjE6yfTPKcTpSsK8F5IwMvI3bZ+ljT0tSzFGFoq4q2LO7vJ01y
	zuwSNLMIrp9T7mK9gvCFjIHyNk1iNqYB4G+BFN7NiOUZd15Ltvlyxti9axWnGxlLciClW2Zmibk
	X9eCVjo8auXSodS1GWmDu4nLJrNNyR8ct6f7FEzQWqCm1JrI8rCgFfs+vPv6RGdMzjIHDr1Riub
	6BePPSKph7CqYfZy1/cQxpYO6cI3TMByUKUUXy/BzhyRh+lEFjWJ5h1c02L1kFTk16TUrjTXVtW
	IAiu7kt8CkvGUmG6bLqDL1JO0qh8tfHgdJNIzwDlEeFM3U3Hb28tCmhSMo5KOhf3DyOYSBW59TN
	mfZI+ThIoe0UDjpEE0ZFVd9E=
X-Received: by 2002:a17:90b:5906:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b1b0b4ffffmr8198704a91.6.1794660677105;
        Sat, 14 Nov 2026 04:51:17 -0800 (PST)
Received: from kenhou-claw.tailf09bb7.ts.net (p1571063-ipxg05601hiraide.tochigi.ocn.ne.jp. [153.185.50.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm8462114a91.17.2026.11.14.04.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:51:16 -0800 (PST)
From: Kenhou Iijima <kenhou@kenhou.net>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Denis Benato <denis.benato@linux.dev>,
	Zhouwang Huang <honjow311@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kenhou Iijima <kenhou@kenhou.net>
Subject: [PATCH v2] HID: hid-msi: Drain orphan MCU ACKs by issuing a query
Date: Sat, 14 Nov 2026 21:50:59 +0900
Message-ID: <20261114125059.17772-1-kenhou@kenhou.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114101045.21986-1-kenhou@kenhou.net>
References: <20261114101045.21986-1-kenhou@kenhou.net>
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

On the MSI Claw 8 AI+ (0db0:1901, firmware 2.30), when a timeout-0
command such as SYNC_TO_ROM (0x22) or SWITCH_MODE (0x24) is issued
(either by the driver or from userspace via hidraw), the controller MCU
sends an asynchronous 0x06 ACK. Unlike regular command responses, the MCU
firmware keeps re-sending this 0x06 ACK approximately every 2 seconds
indefinitely until it receives another feature command (such as
READ_GAMEPAD_MODE).

When issued from userspace via hidraw while hid-msi is bound, the
driver never arms orphan_ack_pending, so every 0x06 ACK arrives with
waiting_cmd == CLAW_COMMAND_TYPE_NONE. When issued in-kernel with
timeout == 0, the initial ACK clears orphan_ack_pending if it arrives
within the 25 ms orphan_ack_complete window (whereas a SYNC_TO_ROM flash
commit ACK arrives ~560 ms later, after a subsequent command or its
timeout clears orphan_ack_pending), and all subsequent 2-second retries
likewise arrive with waiting_cmd != CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA.
Because nothing sends a follow-up command when the device is otherwise
idle, the MCU stays stuck in its ACK-retry state:

1. An endless stream of 0x06 packets is delivered over the USB interrupt
   IN endpoint every 2 seconds until the next command is sent.
2. Only WRITE_PROFILE_DATA (0x21) expects a generic 0x06 ACK; read
   commands wait for their own ACK command types. Without guarding
   CLAW_COMMAND_TYPE_ACK against other waiting commands, a stray or
   delayed 0x06 ACK arriving while READ_PROFILE or READ_GAMEPAD_MODE is
   in flight completes send_cmd_complete early with an empty response
   buffer, corrupting the read result.

Fix this by:
- Scheduling a work item (orphan_ack_work) that issues a harmless
  CLAW_COMMAND_TYPE_READ_GAMEPAD_MODE query whenever an unhandled 0x06
  ACK arrives (whether caught by orphan_ack_pending or when waiting_cmd
  is not CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA), which clears the MCU's
  pending ACK state so it stops re-transmitting 0x06 every 2 seconds.
- Completing send_cmd_complete on CLAW_COMMAND_TYPE_ACK only when
  waiting_cmd is CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA, and draining any
  other 0x06 ACK via orphan_ack_work instead.
- Cancelling orphan_ack_work via disable_work_sync() in claw_remove()
  and msi_suspend(), and re-enabling it via enable_work() in
  msi_resume(). Set .reset_resume = pm_ptr(msi_resume) as well, because
  usbhid defines .reset_resume without falling back to
  hdev->driver->resume in hid_driver_reset_resume(), so reset-resume
  paths also need msi_resume() to re-enable orphan_ack_work.

Fixes: a9517958e828 ("HID: hid-msi: Add MSI Claw configuration driver")
Signed-off-by: Kenhou Iijima <kenhou@kenhou.net>
---
Changes in v2:
- Guard CLAW_COMMAND_TYPE_ACK so send_cmd_complete is only completed
  when waiting_cmd == CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA, avoiding
  early completion of in-flight reads; schedule orphan_ack_work (with a
  dev_dbg log) for any other 0x06 ACK (whether caught by
  orphan_ack_pending or arriving later) instead of waiting for a 2 s
  retry.
- Use disable_work_sync() in claw_remove() and claw_suspend() paired
  with enable_work() in claw_resume(), and wire .reset_resume to
  msi_resume so urbin interrupts cannot re-queue work across suspend,
  reset-resume, or removal.
- Document why only WRITE_PROFILE_DATA expects 0x06 and why drain
  errors (e.g. during RESET_DEVICE or disconnect) are ignored.
- Link to v1: https://lore.kernel.org/linux-input/20261114101045.21986-1-kenhou@kenhou.net/

 drivers/hid/hid-msi.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
index 23d731f700..054babadda 100644
--- a/drivers/hid/hid-msi.c
+++ b/drivers/hid/hid-msi.c
@@ -332,6 +332,7 @@ struct claw_drvdata {
 	enum claw_profile_ack_pending profile_pending;
 	struct completion orphan_ack_complete;
 	struct completion send_cmd_complete;
+	struct work_struct orphan_ack_work;
 	struct delayed_work cfg_resume;
 	struct delayed_work cfg_setup;
 	spinlock_t registration_lock; /* Lock for registration read/write */
@@ -528,11 +529,20 @@ static int claw_raw_event(struct claw_drvdata *drvdata, struct hid_report *repor
 		if (drvdata->orphan_ack_pending) {
 			drvdata->orphan_ack_pending = false;
 			complete(&drvdata->orphan_ack_complete);
-			break;
 		}
 
-		if (drvdata->waiting_cmd == CLAW_COMMAND_TYPE_NONE) {
-			dev_warn(&drvdata->hdev->dev, "Got unexpected ACK from MCU, ignoring\n");
+		if (drvdata->waiting_cmd != CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA) {
+			/*
+			 * Only WRITE_PROFILE_DATA waits for a generic 0x06 ACK;
+			 * reads wait for their own ACK command type. Any other
+			 * 0x06 ACK is an unhandled orphan ACK that the MCU will
+			 * re-send roughly every 2 s until it receives another
+			 * command, so schedule a harmless query to drain it.
+			 */
+			dev_dbg(&drvdata->hdev->dev,
+				"Draining orphan ACK (waiting CMD: %x)\n",
+				drvdata->waiting_cmd);
+			schedule_work(&drvdata->orphan_ack_work);
 			break;
 		}
 
@@ -653,6 +663,22 @@ static int claw_hw_output_report(struct hid_device *hdev, u8 index, u8 *data,
 	return __claw_hw_output_report(hdev, index, data, len, timeout);
 }
 
+static void claw_orphan_ack_drain(struct work_struct *work)
+{
+	struct claw_drvdata *drvdata = container_of(work, struct claw_drvdata,
+						    orphan_ack_work);
+
+	/*
+	 * A query is enough to make the MCU stop re-sending the pending ACK.
+	 * claw_hw_output_report() also waits for any orphan ACK before
+	 * sending, so this cannot interleave with a real command sequence.
+	 * Best-effort drain: errors (e.g. during RESET_DEVICE or disconnect)
+	 * are harmless and intentionally ignored.
+	 */
+	claw_hw_output_report(drvdata->hdev, CLAW_COMMAND_TYPE_READ_GAMEPAD_MODE,
+			      NULL, 0, 25);
+}
+
 static int claw_switch_mode(struct hid_device *hdev, enum claw_mode_field field, u8 val)
 {
 	struct claw_drvdata *drvdata = hid_get_drvdata(hdev);
@@ -1868,6 +1894,7 @@ static int claw_probe(struct hid_device *hdev, u8 ep)
 	spin_lock_init(&drvdata->rumble_lock);
 	init_completion(&drvdata->orphan_ack_complete);
 	init_completion(&drvdata->send_cmd_complete);
+	INIT_WORK(&drvdata->orphan_ack_work, &claw_orphan_ack_drain);
 	INIT_DELAYED_WORK(&drvdata->cfg_resume, &cfg_resume_fn);
 	INIT_DELAYED_WORK(&drvdata->cfg_setup, &cfg_setup_fn);
 	INIT_DELAYED_WORK(&drvdata->rgb_queue, &claw_rgb_queue_fn);
@@ -1954,6 +1981,7 @@ static void claw_remove(struct hid_device *hdev)
 		led_classdev_multicolor_unregister(&drvdata->led_mc);
 	}
 	cancel_delayed_work_sync(&drvdata->rgb_queue);
+	disable_work_sync(&drvdata->orphan_ack_work);
 
 	hid_hw_close(hdev);
 }
@@ -1983,6 +2011,8 @@ static int claw_resume(struct hid_device *hdev)
 	if (!drvdata)
 		return -ENODEV;
 
+	enable_work(&drvdata->orphan_ack_work);
+
 	/* MCU can take up to 500ms to be ready after resume */
 	schedule_delayed_work(&drvdata->cfg_resume, msecs_to_jiffies(500));
 	return 0;
@@ -2015,6 +2045,7 @@ static int claw_suspend(struct hid_device *hdev)
 	cancel_delayed_work_sync(&drvdata->cfg_resume);
 	cancel_delayed_work_sync(&drvdata->cfg_setup);
 	cancel_delayed_work_sync(&drvdata->rgb_queue);
+	disable_work_sync(&drvdata->orphan_ack_work);
 
 	return 0;
 }
@@ -2052,6 +2083,7 @@ static struct hid_driver msi_driver = {
 	.probe		= msi_probe,
 	.remove		= msi_remove,
 	.resume		= pm_ptr(msi_resume),
+	.reset_resume	= pm_ptr(msi_resume),
 	.suspend	= pm_ptr(msi_suspend),
 };
 module_hid_driver(msi_driver);
-- 
2.56.0

