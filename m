Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491519;
	b=4YEmmKXYC+PlDtc64ljFRdCYO/13Y2J55ih1lFsbCmM53AmiaCKYXKIvCNXhZ7D9SuQr
	 ZAg/iaiXEwf1oVbfVDNNoF0x7FNVgVa+YM0Ld0QaZMtu4behZwGbuLJQYM3/rUYyoRAwQ
	 32DXhblcAUNtH8cgzVv6YVHQW0q8QPI49iLjVwznYsiI4OmMlRtH41EAGOqwcB6Tb19qw
	 waCxRpCwXKfcCDffrcyxC+pD18k4x2bHk04Cw0vzxCLxYfE5IYMWttJ+7xdC82pq6bn6S
	 sGYymzhtIhHW0c783yK7n5oPXEu3iezz+cfDwIhCAyFiMd5/xbQinY6tX3XeqmeK2Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491519;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HVBTWjwFTa+IGb3vOI0o1DczkXGYg8kXowwW6CDhXd0=;
	b=a4UrIp7Oe9tUl99tOMOP68bjlaHKj8QGEPyK9UubwMn7iyMMfI8Pr8kKc6779V0N3BD2
	 MW2ISjDS8tKrWnDUYByc03Y052CZ+k9Vxs0bbql8SumDyZLL5gMzMZc1MD4bSaqdMiXNI
	 tQSB4oxnCKVnK9QRAeMQs8tCISXc215VNlRMTIRSNksff3tnRgi150Upg/AC+or5dA01y
	 jlr0oZ7WVRCZfOq+Zdbj/BeiTeyEzUc57J0LV2xKYlNGpxK15gQ0wsXdwrkN2LadYPl2U
	 YE6qnv43wM7Cvr7U70VXy1qNK8bzZIDfixFhcvDv/352HG9jT46ARE+uJVtdtiPlSqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QZ+HZDi4;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C32606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QZ+HZDi4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794491519; x=1826027519;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=5JDiiL84FQMO6Yn6uhFILcjEX9XOe99mOtlHThxmqoM=;
  b=QZ+HZDi40jO6m9/cMAPaBTTbn8vuAJ4k6w+Z2fEkQvBFZU7DIluhofXB
   rX/O5QCmA8Xc4dHTB5h0vEtE1Cr4WZT/PtT6oruGamGSBRpglRreLta4w
   whj3Ds5XDTGitBqeDcsYN7igLutYEsoD6CaGNw6FHfmjZcKX2YeRbFdYI
   RX+u9MWwHaQ2SSB9fxq7bDv9mdQyMeOSkZiVzH8MDWnFPzs1Xdx00+Jzs
   hgwgj/gy/gClyG3hRZEFcGSkwUI1vRhol4sZD7zC5F61MImiCMEudRSbv
   GKeXs3OY0fyQarSmrxy+TBq15hGI9VcgPyfMEN63sM9BuFb5ewZ2GEwVL
   Q==;
X-CSE-ConnectionGUID: Lv0M1P7oRwaSHpiuoKHV1w==
X-CSE-MsgGUID: 1sk+HHg4T9CeFlKPYk4coA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3174156"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3174156"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:51:58 -0800
X-CSE-ConnectionGUID: /UhsDppnRFeMUF+YjpUhqA==
X-CSE-MsgGUID: aO14QmlGRdSFRk0wCCQwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8755057"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:51:57 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 12 Nov 2026 15:51:42 +0200
Subject: [PATCH char-misc-next] mei: csc: add reset_prepare() and
 reset_done()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-csc_reset_prepare_done-v1-1-843c48cc4530@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDQAwFf0Vy7oJZQWh/pZRljU+bQ1dJpAjiv
 3frcRhmDnKYwunRHGT4qutSKvCtIXnnMiPoWJliG3tmjkFcksGxpdWwZkMal4Iw3Dtuh27KfRS
 qcZWT7tf4+T9Z+KhLKNg3ep3nD7DKGiB4AAAA
X-Change-ID: 20261112-csc_reset_prepare_done-b9310b3fa62c
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Menachem Adin <menachem.adin@intel.com>, linux-kernel@vger.kernel.org, 
 Riana Tauro <riana.tauro@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794491516; l=3851;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=5JDiiL84FQMO6Yn6uhFILcjEX9XOe99mOtlHThxmqoM=;
 b=5BWdaHDDJKrYbGX96OnuY0byz4UJM/NWYFRq4qfB30qJQPScAw35XB9V/IgfbaaPrOBzWWImI
 yVY67NLw20kBLtu5vx8uVPbIF5AUrSjxVVoCvvsUUN7pYU8XlPe6Hs0
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Process PCI reset by stopping the flow in reset_prepare() and resuming
it in reset_done().
Consolidate start/stop flow in helper functions and stop polling thread
on suspend/resume by the way.

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/pci-csc.c | 77 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 23 deletions(-)

diff --git a/drivers/misc/mei/pci-csc.c b/drivers/misc/mei/pci-csc.c
index fc09cfb5cdc7..7fbe4c1826bc 100644
--- a/drivers/misc/mei/pci-csc.c
+++ b/drivers/misc/mei/pci-csc.c
@@ -186,38 +186,63 @@ static void mei_csc_remove(struct pci_dev *pdev)
 	mei_deregister(mdev);
 }
 
-static int mei_csc_pci_prepare(struct device *dev)
+static void mei_csc_stop(struct mei_device *mdev)
 {
-	pm_runtime_resume(dev);
-	return 0;
-}
+	struct mei_me_hw *hw = to_me_hw(mdev);
 
-static int mei_csc_pci_suspend(struct device *dev)
-{
-	struct mei_device *mdev = dev_get_drvdata(dev);
+	scoped_guard(mutex, &mdev->device_lock) {
+		if (mei_me_hw_use_polling(hw))
+			hw->is_active = false;
+	}
 
 	mei_stop(mdev);
 
 	mei_disable_interrupts(mdev);
-
-	return 0;
 }
 
-static int mei_csc_pci_resume(struct device *dev)
+static int mei_csc_restart(struct mei_device *mdev)
 {
-	struct mei_device *mdev = dev_get_drvdata(dev);
+	struct mei_me_hw *hw = to_me_hw(mdev);
 	int err;
 
+	scoped_guard(mutex, &mdev->device_lock) {
+		if (mei_me_hw_use_polling(hw)) {
+			hw->is_active = true;
+			wake_up_interruptible(&hw->wait_active);
+		}
+	}
+
 	err = mei_restart(mdev);
 	if (err)
 		return err;
 
-	/* Start timer if stopped in suspend */
+	/* Start timer if stopped in stop */
 	schedule_delayed_work(&mdev->timer_work, HZ);
+	return 0;
+}
 
+static int mei_csc_pci_prepare(struct device *dev)
+{
+	pm_runtime_resume(dev);
 	return 0;
 }
 
+static int mei_csc_pci_suspend(struct device *dev)
+{
+	struct mei_device *mdev = dev_get_drvdata(dev);
+
+	mei_csc_stop(mdev);
+
+	return 0;
+}
+
+static int mei_csc_pci_resume(struct device *dev)
+{
+	struct mei_device *mdev = dev_get_drvdata(dev);
+
+	return mei_csc_restart(mdev);
+}
+
 static void mei_csc_pci_complete(struct device *dev)
 {
 	pm_runtime_suspend(dev);
@@ -316,28 +341,34 @@ static pci_ers_result_t mei_csc_pci_error_slot_reset(struct pci_dev *pdev)
 static void mei_csc_pci_error_resume(struct pci_dev *pdev)
 {
 	struct mei_device *mdev = pci_get_drvdata(pdev);
-	struct mei_me_hw *hw = to_me_hw(mdev);
 
 	dev_info(&pdev->dev, "error recovery: resume\n");
 
-	scoped_guard(mutex, &mdev->device_lock) {
-		if (mei_me_hw_use_polling(hw)) {
-			hw->is_active = true;
-			wake_up_interruptible(&hw->wait_active);
-		}
-	}
+	mei_csc_restart(mdev);
+}
 
-	if (mei_restart(mdev))
-		return;
+static void mei_csc_reset_prepare(struct pci_dev *pdev)
+{
+	struct mei_device *mdev = pci_get_drvdata(pdev);
 
-	/* Start timer if stopped in error */
-	schedule_delayed_work(&mdev->timer_work, HZ);
+	mei_csc_stop(mdev);
+}
+
+static void mei_csc_reset_done(struct pci_dev *pdev)
+{
+	struct mei_device *mdev = pci_get_drvdata(pdev);
+
+	pci_set_master(pdev);
+
+	mei_csc_restart(mdev);
 }
 
 static const struct pci_error_handlers mei_csc_pci_error_handlers = {
 	.error_detected = mei_csc_pci_error_detected,
 	.slot_reset     = mei_csc_pci_error_slot_reset,
 	.resume         = mei_csc_pci_error_resume,
+	.reset_prepare  = mei_csc_reset_prepare,
+	.reset_done     = mei_csc_reset_done,
 };
 
 static const struct dev_pm_ops mei_csc_pm_ops = {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-csc_reset_prepare_done-b9310b3fa62c

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

