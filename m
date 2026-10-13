Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D0A4ABBB8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934555; cv=none; b=qymA28QQAshDUfQndx2LAIyordGudP1Uvvjm6UndRpeO1gv8icLvPBN8CUnEJPNqG/XCfCl99JBkgd7k7cTPLtaK94BtdsN1tVMSdGZMLN8TtwzdXoUzn3Xhc6d25y7X6brmzCO28aA8dtA4GK9LadO84L18Hmh0nfN5rUBJZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934555; c=relaxed/simple;
	bh=hKuzHhQ1AvSETF8XGUydiDZlFtzoU6214nbtFhLBtS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sa7xPAds1SGbkHcmb+CPY/1vn42OLHNYVshNsx3OI7UL1m8G5vXFfLIBPW4HIBzjKD430ZBPuYlE44m1PVQraDp/xyGTBL5s7ZFYn86S8h6QDxJz+/ZImLt7ERRi6sAXCIfLuj9/iniGaNCcqEJrZnvTYm7ooHaiKLcwvkls4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK0G06qA; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK0G06qA"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33c2520ad38so8131543eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791934553; x=1792539353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUD08xhJaRRxHhZLFhhFLw3lNVBGk+s6r/0ppwaV3jk=;
        b=UK0G06qAO6cH5kOagZH9MOzvCu2uq8DTDs5mSBBfQjEOOeLrNKZ53nUUrax424vKfb
         fpihEa7SfhcAYyagn4Xc/feiqrrgVMnN318sB11BjGMgbEIuPfG3jaUWJTNcFQqHmgBR
         iOZAvIHo+0RSggFEp1YXRVpIh8fsp7jRi+Qf33FQvsbMl1njxRpnDU/XW/50hRjwH+3E
         ax8KtbUcmyh6GQZNUbQqWCyysD3k1q9PpRzXp58ejVJYS764obke/urG/m+b5EF2Fwsb
         HyKzN2Q3Ouz8a3cHVWQWh1p/KXreGYBcr229zDfwgRFIMDjMCRzRR34H4XQQtqpcKrm8
         K6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791934553; x=1792539353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUD08xhJaRRxHhZLFhhFLw3lNVBGk+s6r/0ppwaV3jk=;
        b=0foY6WYbs95YmoeWQGLzCwzppV3HxWxM5kl7x6yQwdrNIeLb0NDeZPa9B3AFimCnhd
         Kzv7QARR2cLkWMEeYEl/WvrazU+UHlmFNGkPpbnO1gIgJpdI1i0m1hKGGkIuY/FKJhxa
         45wVd5rV6vuDOm+tqxfWFkfIEO+h1ltYYoPL5JN3wir+SYdVvnVLwrUX1gia3vgwg0QV
         q4xfMOHf0oryv0hu6f5W69MtMJ4lXd6MidxmGwA1TvNmMaiFIaqMkYY93Fli5MH7RRbx
         0ovvmo16mXdxOvXf6UXc2e29dVSJYOdveh5QrGRaqLbHF/7u9Pw6HkqW8xosnDIK1BeJ
         4veA==
X-Forwarded-Encrypted: i=1; AKwUvBwnhPXNc+V6SWkEiDLRR74RYCt+TN0Xg0GI5VB/G08XJfesxdDKTX5J8wPlfcbOaKYygjdJZSL5Bxk0J88=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBDjZBOqCt6jOATb/pFEzs5oa6uW1/LZDlMbK0gSCMXIrGiu/v
	Uxu8R/ASc8L6rqz5RPhY+YfZYdngrWoEvg7xShSvAuWtJ2h94kTWVbY7
X-Gm-Gg: AYBFou2EL47Gt+2iiHEG5kmeEtjCULJuZhGZ96PcwGN99myaqL3d77UHmHBAvYtyKsA
	Z5tYzdoL4PLCQwrRylAxiWG8OTl1NQJ/NTHb/p7rxReFfNtnLomPAPD+E5ROs6HUPa9rWEzvhdl
	Y8LaktcSSa2qmnkB59rKBWtl5/ym88YvNaeQ7hZCOHzHFbjikmjCVK47TKnBS3n6OET6Jq4ObLl
	4J2TxpjYDWzXX3ZkNxQbGoqY/UUcjeF3cysbEor78z3IWcyr6c16ueq6+bsnkxeBbC4kWApIoFI
	c8WKuoSz6vmD/eShSpbRBHBfWzCCWa+5N9wvPjoP84BUIGPccw62K9TQxwD3cehjiLNJcvvblQS
	VsgXAl9tRvG47/4xxNjEe07ehtor6T/VA6syYjQkpPDWdp/u6mbThcixrQKw6eJp9TmRatoHg+f
	yxDHsGQNSQj2jgpx3NxuExj0eYwEosQw+CycGvznqbBRd+OJl0zYY5sBd3brhXUZbVnv0C4j6eK
	u9+aPtTsKDupM+Z79fdKM5gKHY=
X-Received: by 2002:a05:7300:828a:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3537dedaa87mr18409297eec.4.1791934552974;
        Tue, 13 Oct 2026 16:35:52 -0700 (PDT)
Received: from localhost (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm50705110eec.10.2026.10.13.16.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 16:35:52 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Kiran K <kiran.k@intel.com>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: btintel_pcie: Fix NULL hdev dereference in debug register dump
Date: Wed, 14 Oct 2026 07:35:48 +0800
Message-ID: <20261013233548.3864360-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSI-X interrupts are set up in btintel_pcie_config_pcie() and the
controller is brought out of reset in btintel_pcie_enable_bt(), both
long before btintel_pcie_setup_hdev() allocates the hci_dev.  On top of
that, data->hdev is only published after hci_register_dev() succeeds.
Until then, any interrupt that reaches an error path sees a NULL
data->hdev.

btintel_pcie_dump_debug_registers() is called from those error paths
with data->hdev and dereferences it immediately via hci_get_drvdata().
If the controller raises such an interrupt during probe, the IRQ thread
oopses.  The bt_dev_*() logging helpers are fine with a NULL hdev (they
print "null" as the device name), so the crash is only in the register
dump.

This was seen on an HP ZBook X G2i (8086:e376) with v7.3-rc7, where the
GP1 mailbox interrupt was handled right after the device was enabled:

  btintel_pcie 0000:00:14.7: enabling device (0000 -> 0002)
  Bluetooth: null: Received gp1 mailbox interrupt
  Oops: general protection fault, kernel NULL pointer dereference 0xda0
  CPU: 11 UID: 0 PID: 671 Comm: irq/213-btintel
  RIP: 0010:btintel_pcie_dump_debug_registers+0x20/0x910 [btintel_pcie]
  Call Trace:
   btintel_pcie_irq_msix_handler+0x1ca/0x6b0 [btintel_pcie]
   irq_thread_fn+0x26/0x70
   irq_thread+0x1b1/0x300

The IRQ thread then dies in do_exit() and the module load and the
following power off block behind it.  The GP1 handler no longer calls
the dump helper in current linux-next, but the GP0 handler still does
for the "Controller in error state" and "Controller in lockdown state"
cases, which have the same exposure during probe.

Return early from btintel_pcie_dump_debug_registers() when there is no
hci_dev yet.  The register dump is delivered through hci_recv_diag(),
so there is nowhere to send it without an hdev anyway; the preceding
bt_dev_err() has already reported the event.

Fixes: 190377500fde ("Bluetooth: btintel_pcie: Dump debug registers on error")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/bluetooth/btintel_pcie.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 3a555aa50c87..fcdea1302cf7 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -433,12 +433,21 @@ static void btintel_pcie_prepare_tx(struct txq *txq, u16 tfd_index,
 
 static inline void btintel_pcie_dump_debug_registers(struct hci_dev *hdev)
 {
-	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
+	struct btintel_pcie_data *data;
 	u16 cr_hia, cr_tia;
 	u32 reg, mbox_reg;
 	struct sk_buff *skb;
 	u8 buf[80];
 
+	/* The interrupts are enabled before the hci_dev is allocated and
+	 * data->hdev is published only after hci_register_dev() succeeds, so
+	 * an interrupt handler can get here with a NULL hdev.
+	 */
+	if (!hdev)
+		return;
+
+	data = hci_get_drvdata(hdev);
+
 	skb = alloc_skb(1024, GFP_ATOMIC);
 	if (!skb)
 		return;
-- 
2.53.0

