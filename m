Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816256;
	b=QlCTAYwgG4XO9JhMloytePTGjpWD2U/pik8p+Ars8KbAZojzMc3hNXUamcaCK/5ww5Qf
	 F41JzxGx0VpGkRJDLBEAVqVM2WaorOab58MF4/yY1ysKJeMVk8Mcz3zoqWA8LfM9HEXrk
	 esPt8Q1nimjnK1PLT1rRwPt0ZCNFghKBJKfvr4kLk6ES5ZvNy0R2sjJMcq4QMIKD7LfEi
	 aZQwlh/6DKatCETF1Jl4luQOsT3bg+qFfZADkA3FqSA/WSsdsB85+OVEhJnIB4yNLR6vc
	 FAk8TiI3aYPE4/puBPpXmhO9bhnxaDByGXzcGu1IFaVLRVhzBGPBE6o7hTb3HJv76lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816256;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=s1qjuKYUc83awRoMLtt3OYHBYrmVYF5F4XNJVMk1IZ8=;
	b=m4H57nGqvHGzhmGOA1J3RjtNi08sV5M4Wv2bXq7KTyskruzSSqvKYILHu4I0dQRep6Jb
	 ih3Fqcuog+kZPm/M+K2f81syrUOMA62pd2Bn8yn+aUMAa0o/I6qbvOOUK1qNviXw0Cp1g
	 2ylWrvvTY2DVMeY+uzIrwt6zLNb2D4SURAglR9IYPT/cByO8oUFOu66eh88McFaXy/+ri
	 X+zCCa3/3BmzOgxHW3A7Yhv5mfZUCNJpRV1BoQ8UdRh4MhxQXAJrOSPMUkfzJGW+xl2ku
	 Gfhl2pM1X31IyvMR72d1HePdyYoHlngNxbYugwewbusMnNwgLPiRkOoyFqygyxZ4smw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AuUAkWbD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B120C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AuUAkWbD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794816254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s1qjuKYUc83awRoMLtt3OYHBYrmVYF5F4XNJVMk1IZ8=;
	b=AuUAkWbD3/r3IthzJ+6d4nabSt1cUneTQlU/lMd8+s2L+g4gvFZgO9IH1Md2kDNla3RsbR
	S5KFcdRNga7wwXYTduIGVm9lOflJivi6YS9n/VEKwS4eP5mhngw1aevslk0X3Lree/4hzF
	vmz9615Bcf4zsKk0RDD4CFZFGsl5VCA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-4egDlCWUOdG0WMuYkWiqUQ-1; Mon,
 16 Nov 2026 03:04:11 -0500
X-MC-Unique: 4egDlCWUOdG0WMuYkWiqUQ-1
X-Mimecast-MFC-AGG-ID: 4egDlCWUOdG0WMuYkWiqUQ_1794816250
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CE5918004F6;
	Mon, 16 Nov 2026 08:04:10 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B5B9618004FF;
	Mon, 16 Nov 2026 08:04:08 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] wifi: ath12k: fix crash on unbind when board data is not found
Date: Mon, 16 Nov 2026 09:04:04 +0100
Message-ID: <20261116080404.93529-1-jtornosm@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

When QCN9274 boots without the required board data in board-2.bin
(e.g. board ID not supported in the default linux-firmware package),
the QMI firmware initialization fails during board data loading:

  ath12k_wifi7_pci 0000:07:00.0: failed to fetch board data for
    bus=pci,qmi-chip-id=0,qmi-board-id=4102 from
    ath12k/QCN9274/hw2.0/board-2.bin

Without this fix, unbinding the device crashes with a page fault in
mhi_queue and duplicate sysfs entries, and the only recovery is a
reboot:

  sysfs: cannot create duplicate filename '/bus/mhi/devices/mhi0_IPCR'
  Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
  Call Trace:
   sysfs_warn_dup.cold+0x17/0x23
   sysfs_do_create_link_sd+0xe3/0xf0
   bus_add_device+0x9a/0x200
   device_add+0x3d4/0x750
   mhi_create_devices+0x15f/0x270 [mhi]
   mhi_pm_mission_mode_transition.isra.0+0x20f/0x2b0 [mhi]
   mhi_pm_st_worker+0x26a/0x2d0 [mhi]

Fix by:
- Setting ATH12K_FLAG_QMI_FAIL when firmware_ready() fails in the
  FW_READY event handler.
- Using ATH12K_MHI_FORCE_POWER_OFF when QMI_FAIL is set, to skip
  the MHI_STATE_RESET that triggers QCN9274 firmware auto-restart.
- Replacing ath12k_pci_power_down() in the QMI_FAIL cleanup path
  with a direct ath12k_mhi_stop() (guarded by MHI_POWER_ON state)
  followed by ath12k_pci_sw_reset() for clean firmware state on
  re-bind.

With this fix, the user can install the correct board-2.bin from the
manufacturer, unbind and bind the device, and it initializes
successfully without rebooting.

Tested on QCN9274 hw2.0 with unsupported board ID (0x1006) in
default board-2.bin.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 2 ++
 drivers/net/wireless/ath/ath12k/pci.c | 4 +++-
 drivers/net/wireless/ath/ath12k/qmi.c | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..4290a4540351 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -507,6 +507,8 @@ void ath12k_mhi_stop(struct ath12k_pci *ab_pci, bool is_suspend)
 	 */
 	if (is_suspend)
 		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF_KEEP_DEV);
+	else if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab_pci->ab->dev_flags))
+		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_FORCE_POWER_OFF);
 	else
 		ath12k_mhi_set_state(ab_pci, ATH12K_MHI_POWER_OFF);
 
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index dbd960f88d38..bbd1f868295d 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1741,7 +1741,9 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
 
 	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
-		ath12k_pci_power_down(ab, false);
+		if (test_bit(ATH12K_MHI_POWER_ON, &ab_pci->mhi_state))
+			ath12k_mhi_stop(ab_pci, false);
+		ath12k_pci_sw_reset(ab_pci->ab, false);
 		goto qmi_fail;
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..5fc4ce4bae6f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4095,6 +4095,9 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			if (!ret)
 				set_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 					&ab->dev_flags);
+			else
+				set_bit(ATH12K_FLAG_QMI_FAIL,
+					&ab->dev_flags);
 
 			break;
 		case ATH12K_QMI_EVENT_HOST_CAP:
-- 
2.56.0

