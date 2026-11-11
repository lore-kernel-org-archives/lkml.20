Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382857;
	b=XC+Feb0eXlJAZUvKWiHTK4v5qsyOGRbxsos0xWOZXn+dlboO6uYC6XYdad8EYTf+2ObI
	 eiT5wOSo+dtga7pobLGO5WVMP6i60DHcRWq8zSz1G4bMlmt+RxTNfA3KIOkSsRvW299z9
	 8DDMesWIc75cgTggvdHVtnfCzuQNKDFpk3mOzfFq2jEfxratmWkylT6BGlGkGsH3qkCKV
	 PP9slh6dgvbkHpb5Uq9tMvOzgK4igM4sBQuwxUA7qc7PEffgEwAArc7jatMvBvJnxIJHA
	 Bi9BK9V7mWtAwwiPowwprrwpJ3IRx7uLAp0IJNoPJNuIsdd74JvW242cg5/c5nl4Jlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382857;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IElCwPDetwNgoqqqKU3CT3ITZTN6XLpxBW87qye44PQ=;
	b=PzxrWRKpPlbPkwBGYrF0s9tH25AZwV4p62VOSRrUcL1jLIJZfT3zpBxxFhhUPmJsI4yv
	 peYwi2/K7zLsy5ZvI+sBmFONHgQ1JyDoMtSnkuoLzds9D0Ae0rMV01otrQ5M6JW7VH3WB
	 I+1w/faVtkVLDdTZ62MkSlYZLfCqoN75BLWUr1yXYFKvPiYFXt9mxu9irGfo1DHJiwl87
	 bGnDi90SfAEbyldL9VgNzfRg4eIt8ZMrJ7z+W9thQjC0qoFbGn3nYR+D7ew6fueQe/OnD
	 RiKZwcUqQWxFfdvHDTWB3xLG3xmbb19jldqKakxc34mppg0TLXMNQU6KVJA/Y3E/eFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ikmyejBz;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AC6606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AC6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ikmyejBz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794382857; x=1825918857;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
  b=ikmyejBzV9Gmvbqtvnr+ZE0v2/XxWTycwraOM0PG15jB/fzkhtTHSJNc
   ifgeqjDEwCb0yPBvKNQtaQsk6PVdS28vpTogg81TdcMZSp5I/+cZtPeYZ
   kWhErOCtzN21vVkR7WYMeaRNGny4UEVrv0vaM6mmExmdxiyi8IA5GmW8H
   S77xOHQ5VQYJKCl5sI0cxtkRFSxSf4XmMPXoGGlm0g+coHrAaK0tji7ye
   Ym38H/CYcxOTEZStFqu32jC2yozR3Ark7ImLusKXyuIeaZHz9iE39mzI0
   QIw4wTQYVBjOhfgREmBxOidN80WeohxgkFpDyzJ07FZ+vh70PdpMY8KVR
   Q==;
X-CSE-ConnectionGUID: 8c/LS53zRQGQDeEiiV8oeg==
X-CSE-MsgGUID: Qr2Zzgh6TQSNXVHsuMwgrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3050831"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3050831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:40:57 -0800
X-CSE-ConnectionGUID: PxKyLT1aTf2btvEjnkU2lA==
X-CSE-MsgGUID: qFWaG1RIRIyNzeBiqNMk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8923843"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:40:55 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Wed, 11 Nov 2026 09:40:30 +0200
Subject: [PATCH char-misc-next v3 1/4] issei: save power_down flag while
 processing event
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
Message-Id: <20261111-issei_pm_and_itf-v3-1-4f4f6d626ff3@intel.com>
References: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
In-Reply-To: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794382852; l=3128;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=kVyvIAWiJL/xLv1nqDIpUBurEg7V1MU3c1/iL5AtYX0=;
 b=xS9643DaiGDIKz8+HlJptR95nKLyaIIjy86oT8EtVv0t8zM16c3jh1AmMTcg8FCsO/ICBIXK9
 ZbGlzWbwIUrDjuJ1O2a+V7iLKKrAPreji+wkJcM357n/P9lFcXOgyt8
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

