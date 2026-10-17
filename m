Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068336F90C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259006; cv=none; b=ls+/1s4EJ8Y+ERW3JzbQNtgXHe2EiK4g/Ssgwyb2VVRqA7mvOXRk1s1S02AYpA+gsM4rLQq+msYoMbQ5iWqj0Me2Vo0ezsBLLiROlVlHqTGfy8kp9BLj5VGNizk5gwRITxkMYonNo/VaF2dlQ/kJwFHxqi0ps+yE+xZcIPPFhK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259006; c=relaxed/simple;
	bh=PXfTNimZxtPFUtjkyxv7iqfY7+4RBOfgiA2KMuVA39c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJW+XOkOzfoabShTO4fbs4Jn57hRShwbiU3VDnWYAk4RHaMh4RQkFBrZkgPXa6FbDn4feHP2xyoZAac28lLNNokQejywovjahf6cmQ+/yyMYjQdsx4JSYhhNyE+SdVeLHK2r83lBLKHh4JUA+CrsRMkVdQWLhCiZx/qtV5K+7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8d1RdMx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8d1RdMx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c423b145922so43246566b.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259003; x=1792863803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PwF3jKNAYzszFL75qOBfeCsRKgDJQKcyrSL9S+2luJM=;
        b=D8d1RdMx1cyLTjga3JNRISW6jP0kU+obJNJNbxV6jzdYf+Uh3uzrKBKmmy1qijCzxE
         Gquraup66zzxhUM/Px4DEA3cruj2XsOaMBdgrALDDKxpdHgsLqE1kEt2sXHrGHS+QA+X
         q0+VwBjUtFeelAyDBpLJWntNDnLijccOabpfM5aZLp+BaCUXcRS5x5ucNn7D0T6+iYuN
         h10xrN60erLG6iu7b0dAqVSyUv0rrNHGroGFXlkxjZ+xSAv6u4r6T3PvfJwCyNejcaEO
         6BY6YH/gNDtGjL9AsD18QD4hVQJSZuft/a9hGa6kiYDc/QQHbA7NDFxHlWNUNRTTr7Cu
         JRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259003; x=1792863803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwF3jKNAYzszFL75qOBfeCsRKgDJQKcyrSL9S+2luJM=;
        b=cpkRxUbzx5/v8GnfUTDo1+LOcByqefiTsdwWg9RPz3WuvQIioH+U8x07Qf2rarRf5a
         FXtIRtAFgnxVigwO5jhrAcQEJQ59erAAYCYrpiqIhNm+Jf1MAWx+2jmHzQ0aP55KUboS
         Iu1e9ncOxNnOdBjFxfsdjWyCkbJO9fNLZ/yFBoSk0KPXOzaU2bFV2sx/B7SEq2hUD+7k
         qqkeg5I+VxgMLMnJPtk5ihVwG383bP0bXK6XFtuyed/b+xaac25BKfQmCgyf7TE9k/dk
         CA/Z6kbuLQA4N2F91TeXfmFvyqxPKtskXgzUqgEZ4C8H0SWRamtNVZn/cV800warCMSn
         cIbA==
X-Forwarded-Encrypted: i=1; AKwUvBxw9VXngvrwgcm+C7LZwUEGNXZAqTLH3GWbVot/nBr9XUcE1dWSrLgmJR1VVmo0DruLPp7bb98cIKaRU5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf/6erwCLhI9s+lJ/KL7bxtElkaHIS2mlZwUddIoQC1uYcfWOZ
	rDMg/RzP1wigV7DgNK9SMya66rPgP4vCigOZcP475K9NLdqA8Xpq7Wcx
X-Gm-Gg: AYBFou3ljZvtl5c+mviAXs5hP5wsGjf2KxVlYGaLIQaO205ZxDHKK7JTfJxCSJRbVOq
	fuJoisMmQrsIKqfjQHBbYgqHZVkHAAOFaqQt3OlIm2SsRSpcI6ivWdriI2v07t5TUxdxLyftX0q
	rhKBIC9v3ERHakBi581gzHMKacm2BLuUjz3dK2mQKQrrC6N8lCwHTfe70tbQEuSUxPwUG5fHjMC
	NOZGjs2ZN0K77xHsXLt9eROz9/9ukl5P+96E20zLOmsJeK+gQ3MESXILTbH8HpnlErFZ6YqHzlS
	udWcSltLx2l6ncl+aUPjP8G6bn6/ANxhkNkH3J9+riCiGqVFDH7r5ok3KoRWVe26h8fjUB/SPb9
	DDYcIVfWnKtQpYa9RJSKrJiYw1RJRpKMpGmp3tCHYZsE0O/FdrAHGV6CjvAstt/CUUu9fu6Ibuy
	FbPIF2VSgY9h+hGM1uqzd7cJyLAaQT+FdGjAA/gXCJCxuTvuRkzhh3F6R+XI3CTg1nrvlnKFEiQ
	v1I+g==
X-Received: by 2002:a17:907:c305:b0:c31:c767:adfb with SMTP id a640c23a62f3a-c4196aa9278mr216107766b.0.1792259002706;
        Sat, 17 Oct 2026 10:43:22 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb164fsm190951066b.70.2026.10.17.10.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:43:20 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Nikolay Bryskin <nbryskin@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_qca: Reprobe QCA6390 after hibernation
Date: Sat, 17 Oct 2026 20:43:10 +0300
Message-ID: <20261017174310.22484-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without a way to power-cycle the SoC (no BT_EN GPIO and no power
sequencer, e.g. the ACPI-enumerated QCA6390 on the Dell XPS 13 9310),
HCI_QUIRK_NON_PERSISTENT_SETUP is not set and hdev->setup() runs only
once, at probe, on the assumption that the SoC keeps its firmware.

Hibernation breaks that assumption: the platform powers the SoC off,
and after the image is restored it is back in its ROM state. The
driver's resume callback, shared with suspend-to-idle via
SIMPLE_DEV_PM_OPS(), only clears QCA_SUSPENDING, so the first command
times out and the controller stays unusable. Error recovery and
power-cycling the adapter from userspace don't help either, because
none of them run setup again:

  Bluetooth: hci0: Opcode 0x0c01 failed: -110
  Bluetooth: hci0: command 0x0c01 tx timeout
  Bluetooth: hci0: crash the soc to collect controller dump
  Bluetooth: hci0: Opcode 0x0c05 failed: -110
  Bluetooth: hci0: Frame reassembly failed (-84)
  ...
  Bluetooth: hci0: Opcode 0x0c03 failed: -110

Give the restore phase its own callback which, in this configuration,
rebinds the driver so that probe downloads the firmware again. The
rebind is done from a work item on system_freezable_wq, as it can't
run from within a PM callback and it frees the qca_serdev the callback
works on. All other sleep transitions keep their existing callbacks.

Rebinding works here because the SoC is in its ROM state after the
restore. Rebinding while it still runs the downloaded firmware fails
the same way a warm reboot used to before commit 7e7bbddd029b
("Bluetooth: hci_qca: Fix qca6390 enable failure after warm reboot"),
which this patch doesn't change.

Tested on a Dell XPS 13 9310 (DLB16390): Bluetooth comes back about a
second after resuming from hibernation, with no command timeouts.
Suspend-to-idle is unaffected.

Fixes: e5d6468fe9d8 ("Bluetooth: hci_qca: Add support for Qualcomm Bluetooth SoC QCA6390")
Assisted-by: LLM
Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 58 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..7bca14d364b9 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2775,7 +2775,63 @@ static int __maybe_unused qca_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(qca_pm_ops, qca_suspend, qca_resume);
+struct qca_reprobe {
+	struct work_struct work;
+	struct device *dev;
+};
+
+static void qca_reprobe_work(struct work_struct *work)
+{
+	struct qca_reprobe *reprobe = container_of(work, struct qca_reprobe,
+						   work);
+	int ret;
+
+	ret = device_reprobe(reprobe->dev);
+	if (ret && ret != -EPROBE_DEFER)
+		dev_err(reprobe->dev, "Failed to reprobe device (error %d)\n",
+			ret);
+
+	put_device(reprobe->dev);
+	kfree(reprobe);
+}
+
+static int __maybe_unused qca_restore(struct device *dev)
+{
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	struct hci_uart *hu = &qcadev->serdev_hu;
+	struct qca_reprobe *reprobe;
+
+	qca_resume(dev);
+
+	/* Without power control hdev->setup() runs only once, at probe, as
+	 * the SoC is expected to keep its firmware. Hibernation powers the
+	 * SoC off, so rebind the driver to download the firmware again. The
+	 * rebind can't run from a PM callback, and qcadev is gone once it
+	 * does, so it gets a work item of its own.
+	 */
+	if (hci_test_quirk(hu->hdev, HCI_QUIRK_NON_PERSISTENT_SETUP))
+		return 0;
+
+	reprobe = kzalloc_obj(*reprobe);
+	if (!reprobe)
+		return -ENOMEM;
+
+	INIT_WORK(&reprobe->work, qca_reprobe_work);
+	reprobe->dev = get_device(dev);
+	queue_work(system_freezable_wq, &reprobe->work);
+
+	return 0;
+}
+
+static const struct dev_pm_ops qca_pm_ops = {
+	.suspend = pm_sleep_ptr(qca_suspend),
+	.resume = pm_sleep_ptr(qca_resume),
+	.freeze = pm_sleep_ptr(qca_suspend),
+	.thaw = pm_sleep_ptr(qca_resume),
+	.poweroff = pm_sleep_ptr(qca_suspend),
+	.restore = pm_sleep_ptr(qca_restore),
+};
 
 #ifdef CONFIG_OF
 static const struct of_device_id qca_bluetooth_of_match[] = {
-- 
2.56.0

