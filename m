Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E22E7366
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042141; cv=none; b=I6NgG2DWLMrOKtbyxGD9dT79Ft5WvcjpZ2ZxTDEcYfNaX80T1ht0lKt8H6XQgRh9h9fZ5Z+bh47UG0GB55zaHF6uu53ECjSmhg4LJ9KOE2tuvuxnzPdzg+iXmGTdvUmE0weWBnY17wijOp0cvVAwV+DeIEXi65rG0fIp1xKJnJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042141; c=relaxed/simple;
	bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaPT/pJEQYIR14aAL3gA9ZSe93F9HAk2d3R2Kkfloq+2XrPtidOZQGEroanKvuUE11WxbCQ3yjLpbaZ9gcQvwjfMbbK/C55I9y/DtgtHUwHxkMqis390DqrXvTOGlZNIU03scIPg6KQcLp/ruM1h/E+vrHWuTbF32bM2yFrZS3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsQ+QiWP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsQ+QiWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792042139; x=1823578139;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
  b=WsQ+QiWPbFLo2eZju49UZcRM2L7acrdcsIy2bV8YsD95jZQcgjulrqIv
   HtNxDA07HmlAxlD3vWDozWhKN5Ik7j1/SN7/DVvK487hkacQHaj+X8El4
   CSqR2qp5O+mTiESXU+9yMX5pzAT7k4Lnd6VcbWmtuE1/nmilU69iDMPzA
   CcxrwzSkt9O9Skss3PGShEAhcoKy4F8myv49wbHUMlSKA6JmhwtECUfAa
   JuOLJlOxvhgPeHDOpwUPbt4eySkakFiFPVBJ5yc2d0a1jEppiOEuC9Ere
   Ewa7gUNgVuIE89Vr53kIoddYwpdMCuTLgcmMR3CDsEllJJoyIDAUNx82R
   w==;
X-CSE-ConnectionGUID: 3z47S8EkQyu6aqkybWRXEg==
X-CSE-MsgGUID: i5iMAxKcRKmkRSU9haKdrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="813097"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="813097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:28:59 -0700
X-CSE-ConnectionGUID: uIgwW+neR3C92EDzzCOrZg==
X-CSE-MsgGUID: UII50zssRiCQPa9jwF2kTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1928832"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:28:57 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 15 Oct 2026 08:28:41 +0300
Subject: [PATCH char-misc-next 1/4] issei: save power_down flag while
 processing event
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-issei_pm_and_itf-v1-1-8212238a57a4@intel.com>
References: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
In-Reply-To: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792042134; l=3128;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
 b=LvfHyxEWSxQ4pliCz3JcE2l55GRL5GRn/YWpp2bgf4nqvUmdp2ABY/eoBdozN3FBBGqvYfTLt
 sNWZ4aEj7qqCtjGDTaIv1uzeFfeBuSQjvI4OKdwiiV61b5z7kUjLrAc
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Change in power_down flag may confuse event thread.
Save flag status at the first available moment and
work according to saved value.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/issei/main.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/issei/main.c b/drivers/misc/issei/main.c
index 5987fb340250..8aaf2d47392b 100644
--- a/drivers/misc/issei/main.c
+++ b/drivers/misc/issei/main.c
@@ -24,7 +24,7 @@ static void issei_rst_state_set(struct issei_device *idev, enum issei_rst_state
 		wake_up(&idev->wait_rst_state);
 }
 
-static int issei_reset(struct issei_device *idev)
+static int issei_reset(struct issei_device *idev, bool power_down)
 {
 	int ret;
 
@@ -34,14 +34,14 @@ static int issei_reset(struct issei_device *idev)
 	issei_fw_cl_remove_all(idev);
 	/* No need to check for overflow here, the counter is used only for info */
 	idev->all_reset_count++;
-	ret = idev->ops->hw_reset(idev, !idev->power_down);
+	ret = idev->ops->hw_reset(idev, !power_down);
 	issei_dmam_setup(idev);
 	if (ret) {
 		dev_err(&idev->dev, "hw_reset failed ret = %d\n", ret);
 		return ret;
 	}
 
-	if (idev->power_down) {
+	if (power_down) {
 		dev_dbg(&idev->dev, "powering down: end of reset\n");
 		issei_rst_state_set(idev, ISSEI_RST_STATE_DISABLED);
 		return -ENODEV;
@@ -87,24 +87,26 @@ static int issei_process_thread(void *_dev)
 {
 	long timeout, old_timeout = MAX_SCHEDULE_TIMEOUT;
 	struct issei_device *idev = _dev;
+	bool power_down;
 	int ret;
 
 	while (!kthread_should_stop()) {
 		dev_dbg(&idev->dev, "process_work in %d\n", idev->rst_state);
+		WRITE_ONCE(idev->has_data, false);
+		power_down = idev->power_down; /* to save state */
 		if (!idev->ops->hw_is_ready(idev) && idev->rst_state > ISSEI_RST_STATE_HW_READY) {
-			if (!idev->power_down)
+			if (!power_down)
 				dev_dbg(&idev->dev, "HW not ready, resetting\n");
 			idev->rst_state = ISSEI_RST_STATE_INIT;
 		}
-		if (idev->power_down)
+		if (power_down)
 			idev->rst_state = ISSEI_RST_STATE_INIT;
-		WRITE_ONCE(idev->has_data, false);
 		dev_dbg(&idev->dev, "reset_step in %d\n", idev->rst_state);
 		timeout = MAX_SCHEDULE_TIMEOUT;
 		ret = 0;
 		switch (idev->rst_state) {
 		case ISSEI_RST_STATE_DISABLED:
-			if (idev->power_down) {
+			if (power_down) {
 				dev_dbg(&idev->dev, "Interrupt in power down?\n");
 				break;
 			}
@@ -115,7 +117,7 @@ static int issei_process_thread(void *_dev)
 			idev->ops->irq_clear(idev);
 			idev->ops->irq_sync(idev);
 
-			if (!idev->power_down) {
+			if (!power_down) {
 				idev->reset_count++;
 				if (idev->reset_count > ISSEI_MAX_CONSEC_RESET) {
 					dev_err(&idev->dev, "reset: reached maximal consecutive resets: disabling the device\n");
@@ -124,8 +126,8 @@ static int issei_process_thread(void *_dev)
 				}
 			}
 
-			ret = issei_reset(idev);
-			if (idev->power_down) {
+			ret = issei_reset(idev, power_down);
+			if (power_down) {
 				dev_dbg(&idev->dev, "Powering down\n");
 				return 0;
 			}

-- 
2.53.0

