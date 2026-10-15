Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B235CB95
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034356; cv=none; b=Jl5JwehjH7s4Z7C6vJunNZlFv9cQa3A4ZEzx5HZhsERc8sWa5TI6I5W/cKCJUyc8urt62G+Deh3th3Fe3HzPlHKTQ7xCXdRFb3rs/Ia8PbEFUgOCWwfFX7kX4/GOmI70+Kb7z9ForeidxcmGSWIXyfgTsoCmOI0t9myZBxfMokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034356; c=relaxed/simple;
	bh=7DkAMSdqs432b5pKGZ5+z0IBkk9S52bp6CXXe3fg5J8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Z6Gj+rGMuOuSCGBQHeBbovISBeJKjzoM7hPkoIrs/cozYWiHudt9NeXpAOwInAmn6MRjtShi/VL6/h9dbsp0VGjRqJo3y+fLmbSvYW0AbIm5BPIYnE7bEyuWAm+NJ8UkRrJ9ZiNe4IkQr7UI51l5z0IQLqiL4yrsnGZphhgfMr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY9fqwH1; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY9fqwH1"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93ece7a73b9so613656085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792034354; x=1792639154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBJxQj6NIsMthKy4n+dk5f3Do42mZLL4sgV4e8c1TBM=;
        b=iY9fqwH1t4R5QFF+ee3dl1XkyhOsceF7tr8MpDtGz58zoFkMNc1H4p0N+u4OsGhS7f
         68HOsjy67owCZxvgSYj9e53iBXHszQsoJMnjiJB0EpKRx6KVkNVgucthmIlVhxgt3E6F
         Eto1EPDLdGU9+w2ns1EvM0ED3g3jZ8Im3TKpMD8RuUfya8LzIDSCLdBCf3YXospaTRel
         yNEvotxDq4BBGIO2Nt2pDsySUM8nqt0cJbtG3vKZnMP+hLuh1XgZ1Ootryo1bFn4sWEt
         ktv18wDLG8prgvf8lCKV6uyJxBckFGmgxTNeDcrOsn1PQl+NjTxegWoBf2IlaTxZVHPv
         0VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034354; x=1792639154;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fBJxQj6NIsMthKy4n+dk5f3Do42mZLL4sgV4e8c1TBM=;
        b=RN4s6n8sbsdbtzfCyhkYCjw5tJ7YnbOPmFsnceXeqq1WV9KabwoKlhkZHlDTqdJI4U
         9sNkkGskxbaIDVGPxaKB+OAd3XKlsvNjOydEnsKd1Xy/sRUh4+IbI24rVyCsq5OcigTd
         A3p9YXUF1aaP2QDQA3uoFwF4STGkXKiKj3rqFve3dUuGJgFG+7unoaT1c0TsCQ2g1HVI
         mvrBYZNkzY5s74FWPAHuRNHSTj28YHf2Ev7fA2VmwDJu7oZR47peiZyS6oLvVyiz5/mi
         3HusL6lS7Q230HmWM5CHvdoNK7AkhoE5sr9u/eOMK26BaI0/LtbdCFn+WpL/6h7/+q9s
         xXhA==
X-Forwarded-Encrypted: i=1; AKwUvBwiaQ9eOnvHPMgerpbgTlx8qyz3aK8XdB0FYVpkFjZGu2863v3k2/6Xrj942LnI1V0x5L/zXhJZt0/qt30=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0DbvLyj/gDJqYqX5Hw4wSokgpsY8LNjCEpomYvQblZzYJOg/B
	GUBl4q+fsoU2L1osvloGPtn+0A4PnLIsiWYlw6d2KwYmFT06e/KQHvM=
X-Gm-Gg: AYBFou2o3xvWQ7XkH0PqhRH4iWLnUYhmpTHTCajybPPH00vpfP/pKXvY6iEGFKDiI0F
	Wu9zw5wDNF9WmZzCMtx3Hy4uML0W3zCCfSNz+QdImOSsJI6BT9+qzp77TnLQjumwCt15MXhXze3
	URuNwqxaT+di4xHOktzoOgXi6PFMdTra5Biz5BWJGhNujbZThen8D4Tp9K3EB1h1kCbmDUkf9Og
	NIyqSjb9LFNMfZqqtiR/r05lzCeB183TaMEqC+aw2iJ4ahU6Wtwmp6ENvBm7L0RDdvwI6Qe/0Aa
	cuGi8u4gxmMf5M1DJwGKXQwbhguJXoxGiAjZaMpyoayAvqJggl2imbrCfRpAplEW9so05rrTAbq
	hs9ZkFpK/NuENRndxS3/45wCeklKaxLDVPFEsQnG0uYMo7C4gNA/RRrM3sf80Dhe7WkaaF0XBBZ
	hFtUbhSI7HWxZMgogRFy5BEnGBZYowiPCUH2APDf0Y48wJQVZiBXf5CvlDZPHHpVoC/L/2C/oEM
	nsDepBY50R4pThSiuRI9FPqAN8YIMYlyTHq5Aq2/TlviETnC7o7TSvoub9wwcHflNBZYhmxBhRF
	bYh+6WBOlEbVAESHuaFpoOB40a4t
X-Received: by 2002:a05:620a:1a20:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93ebd20e0b5mr2836858985a.25.1792034354184;
        Wed, 14 Oct 2026 20:19:14 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50095a5sm659924785a.12.2026.10.14.20.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:19:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Eric Lapuyade <eric.lapuyade@linux.intel.com>
Subject: [PATCH] nfc: pn544: close firmware requests and IRQ before teardown
Date: Wed, 14 Oct 2026 23:19:11 -0400
Message-ID: <20261015031911.2746479-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C interrupt can queue fw_work after remove has cancelled it, or
pass a received frame to the HCI device while that device is being freed.
Releasing the managed IRQ only after remove returns leaves both paths
active during teardown.

Serialize firmware request admission with a driver-local mutex. Close the
request gate before joining the IRQ and draining firmware work, so a late
request cannot change the firmware state or report success after the
worker has been disabled. Do not hold the mutex across either join.

Keep the gate closed until the HCI context is initialized and the IRQ is
enabled. NFC registration publishes the device before pn544_hci_probe()
assigns the PHY's HCI pointer, so an earlier firmware request must be
rejected without modifying the firmware state.

Request the IRQ with IRQF_NO_AUTOEN and enable it after HCI setup. Release
and synchronize it before disabling firmware work. Complete an aborted
download while the HCI device is still alive, then remove that device.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 06c660340f1e ("NFC: pn544: i2c: Add firmware download implementation for pn544")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC 15.2.0, W=1 (x86_64). No runtime testing.

 drivers/nfc/pn544/i2c.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 7fde3aefae70..057ef481579b 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -9,6 +9,7 @@
 
 #include <linux/crc-ccitt.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/interrupt.h>
@@ -153,6 +154,9 @@ struct pn544_i2c_phy {
 
 	u8 hw_variant;
 
+	/* Serializes firmware request admission with probe and removal. */
+	struct mutex fw_download_lock;
+	bool fw_download_enabled;
 	struct work_struct fw_work;
 	int fw_work_state;
 	char firmware_name[NFC_FIRMWARE_NAME_MAXSIZE + 1];
@@ -522,6 +526,12 @@ static int pn544_hci_i2c_fw_download(void *phy_id, const char *firmware_name,
 {
 	struct pn544_i2c_phy *phy = phy_id;
 
+	mutex_lock(&phy->fw_download_lock);
+	if (!phy->fw_download_enabled) {
+		mutex_unlock(&phy->fw_download_lock);
+		return -ENODEV;
+	}
+
 	pr_info("Starting Firmware Download (%s)\n", firmware_name);
 
 	strscpy(phy->firmware_name, firmware_name);
@@ -530,6 +540,7 @@ static int pn544_hci_i2c_fw_download(void *phy_id, const char *firmware_name,
 	phy->fw_work_state = FW_WORK_STATE_START;
 
 	schedule_work(&phy->fw_work);
+	mutex_unlock(&phy->fw_download_lock);
 
 	return 0;
 }
@@ -878,6 +889,7 @@ static int pn544_hci_i2c_probe(struct i2c_client *client)
 	if (!phy)
 		return -ENOMEM;
 
+	mutex_init(&phy->fw_download_lock);
 	INIT_WORK(&phy->fw_work, pn544_hci_i2c_fw_work);
 	phy->fw_work_state = FW_WORK_STATE_IDLE;
 
@@ -906,7 +918,8 @@ static int pn544_hci_i2c_probe(struct i2c_client *client)
 
 	r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 				      pn544_hci_i2c_irq_thread_fn,
-				      IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+				      IRQF_TRIGGER_RISING | IRQF_ONESHOT |
+				      IRQF_NO_AUTOEN,
 				      PN544_HCI_I2C_DRIVER_NAME, phy);
 	if (r < 0) {
 		nfc_err(&client->dev, "Unable to register IRQ handler\n");
@@ -920,6 +933,11 @@ static int pn544_hci_i2c_probe(struct i2c_client *client)
 	if (r < 0)
 		return r;
 
+	enable_irq(client->irq);
+	mutex_lock(&phy->fw_download_lock);
+	phy->fw_download_enabled = true;
+	mutex_unlock(&phy->fw_download_lock);
+
 	return 0;
 }
 
@@ -927,7 +945,12 @@ static void pn544_hci_i2c_remove(struct i2c_client *client)
 {
 	struct pn544_i2c_phy *phy = i2c_get_clientdata(client);
 
-	cancel_work_sync(&phy->fw_work);
+	mutex_lock(&phy->fw_download_lock);
+	phy->fw_download_enabled = false;
+	mutex_unlock(&phy->fw_download_lock);
+
+	devm_free_irq(&client->dev, client->irq, phy);
+	disable_work_sync(&phy->fw_work);
 	if (phy->fw_work_state != FW_WORK_STATE_IDLE)
 		pn544_hci_i2c_fw_work_complete(phy, -ENODEV);
 
