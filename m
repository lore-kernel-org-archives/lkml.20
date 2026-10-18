Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF735CBD7
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315895; cv=none; b=qX5AR6NF1VY69n9zUxnv21JhmOCE8oAqf/ERBsFPFuYWXbJ30J4g4FqGMu0HbApDdBFMlS/lAbD4tQo73vS6OEkhi5It+to481EUzlDCbGWyFTC3hBwsmNYtkcwBooui9ZbneMshVoYvqBeR6aj1Tlpq/QgbBh39AAQMpGQGYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315895; c=relaxed/simple;
	bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1vU3SZF1IPYBlhXWjRdzEXniBU5pSJ2A9kxBu7QK9me4LRQZr6DwS5RXI7djWNyTRXUJqxzBT6TH/2PtSSQAeb87+/IFg3b1rY2ukKEo8Ld6LW3uDYTDmV4S5avY77Nl2NiRzcxU+W9MKiOEkh5TGQG6t5a/hrOMIi5f5tIiDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB7yxsJ/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB7yxsJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792315893; x=1823851893;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
  b=aB7yxsJ/oARuOSIx8VNvW8BsKML2WN2gkLmnOSGjYeR46AWXnlFdza3A
   SabybDYDKBpgu4G/VjRmKvskbld57UkaraPGmfUkzdO0Hdjm8R4evfc/+
   HRKECZrSD8b3ildHrRZEsgq0V8er2H/ys/s9QxIFbabGuwerJNGmFIpra
   fNHWRYgGWy4PhRh9serxWVzd1MyrM+SF9J6S1pvBZqUdAnavPSQklL9pa
   LFFe9RfRHiOq4twTrw0lpAuOwZlobsthvtnnw+W2YRpCa0r3rj6RA6jTs
   R+yNEUBH8FQmDJGfvMScHDDI9RG9HsYCh+85a6sL0eEWaTlG8qdWYGUme
   A==;
X-CSE-ConnectionGUID: VSEDeePeTH27ul32ujeljQ==
X-CSE-MsgGUID: yFOccvZzQdawYKyRRo8HXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="932710"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="932710"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:31:33 -0700
X-CSE-ConnectionGUID: IOEjOsHRTxqr+YGBDHKUEA==
X-CSE-MsgGUID: CV0EO0ODRXaUofxjwa8gEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4047687"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:31:31 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Sun, 18 Oct 2026 12:30:52 +0300
Subject: [PATCH char-misc-next v2 1/4] issei: save power_down flag while
 processing event
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-issei_pm_and_itf-v2-1-7a07452e3606@intel.com>
References: <20261018-issei_pm_and_itf-v2-0-7a07452e3606@intel.com>
In-Reply-To: <20261018-issei_pm_and_itf-v2-0-7a07452e3606@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792315888; l=3128;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
 b=uzCRoCxJ+dDHoGoSwK6/khSeVsQm6z88AlAPy0n21bt1vuH5Ad49uqxipkB89tXMDG6pxlkJC
 7hAEl26KLwNDFwOn0jOs8N4rtmPcQ1+sPbUFoIw/AstC3codneOfUnF
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

