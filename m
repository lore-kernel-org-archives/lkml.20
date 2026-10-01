Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422340927A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890773; cv=none; b=hs51YTJapPATMYyjVgfoW2WJDnrr2+3xJ0g0FGmpp5xwWK0NhAsHr2NvD17r1RHUx8eGg6E/WlbO8uwHfLO5GTF+UTtiYch+7X1tO5CDPiIvJBHYSdPO0jSazzg1znHuCCS0YAHeJplsvLEkiiaWNTZXRjSgWVV3ggaZTEfNjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890773; c=relaxed/simple;
	bh=F4mVtLzLskwQCHUKBlnm0DTwM1QujEfRwxFNFpHwvQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=BMfIikOMcwGBPy//TtXeHoj18mF7SzWjg+8/nFBbUeicrIGZhZtTYAUpI/TZ4k4FXxj/iyqMsj3FVMqNTGJeE1KnqyGv9k2rU48zLinrxdRE8BrAx/VIE1GJAnSnt+8JceJ/Zdhg81w9cS4Y7/NHYEmhyfkpKRWEmScLLfRbbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PZAvZKQy; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PZAvZKQy"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261001213927euoutp014669e0bd2e30d45c69fb9072b46aa1ba~ahan-Ib1Y2985629856euoutp01Q
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:39:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261001213927euoutp014669e0bd2e30d45c69fb9072b46aa1ba~ahan-Ib1Y2985629856euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790890767;
	bh=E4d1q0Gg2UrMR1Pqam4NxUMf5y7XXUDda2KIR5efMkc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PZAvZKQyOCg3M4V7jLZYXfnTS00NpW8ANGjocOmLBttUmb/9Q5jnYOBfKXsL7mBda
	 nRAF+ijAIquXge4XweNbv6iCwmhq85w7PwIRmD/W7allbZK2whUc8iqHmNElL/Us55
	 mwCX9+NmSA5RDAxirBNX6t3TvyAzL41z/KyTKA/Q=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261001213926eucas1p18003977c0313cf3395a7413d22043df6~ahanZkbg20134801348eucas1p1D;
	Thu,  1 Oct 2026 21:39:26 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261001213926eusmtip1778ee49ef512a91412cd457181fb1683~ahanGWQKs1437614376eusmtip1u;
	Thu,  1 Oct 2026 21:39:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiazi Liu <jiazi.liu1984@gmail.com>
Subject: [PATCH] usb: dwc3: fix use of destroyed dwc->connect_mutex on
 gadget exit
Date: Thu,  1 Oct 2026 23:39:03 +0200
Message-ID: <20261001213905.3290308-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261001213926eucas1p18003977c0313cf3395a7413d22043df6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261001213926eucas1p18003977c0313cf3395a7413d22043df6
X-EPHeader: CA
X-CMS-RootMailID: 20261001213926eucas1p18003977c0313cf3395a7413d22043df6
References: <CGME20261001213926eucas1p18003977c0313cf3395a7413d22043df6@eucas1p1.samsung.com>

dwc3_gadget_exit() destroys dwc->connect_mutex before calling
usb_del_gadget(), which unbinds the gadget driver and ends up in
dwc3_gadget_pullup() taking that already destroyed mutex. With
CONFIG_DEBUG_MUTEXES this triggers the following warning on reboot:

 DEBUG_LOCKS_WARN_ON(lock->magic != lock)
 WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x4bc/0xb88, CPU#1: systemd-shutdow/1
 ...
 Call trace:
  __mutex_lock+0x4bc/0xb88 (P)
  mutex_lock_nested+0x24/0x30
  dwc3_gadget_pullup+0x88/0x150
  usb_gadget_disconnect_locked+0x44/0x1f0
  gadget_unbind_driver+0x48/0x124
  device_remove+0x4c/0x80
  device_release_driver_internal+0x1e0/0x23c
  device_release_driver+0x18/0x24
  bus_remove_device+0xe8/0x1a0
  device_del+0x14c/0x414
  usb_del_gadget+0x90/0xe8
  dwc3_gadget_exit+0x40/0x9c
  dwc3_drd_exit+0xe4/0x14c
  dwc3_core_remove+0x140/0x17c
  dwc3_qcom_remove+0x38/0x120
  platform_shutdown+0x24/0x34
  device_shutdown+0x158/0x260
  kernel_restart+0x44/0xa4
  __do_sys_reboot+0x118/0x24c
  ...

Fix this by initializing dwc->connect_mutex together with dwc->mutex in
dwc3_core_probe().

Fixes: 1ff77cbefe5a ("usb: dwc3: gadget: fix IRQ storm on invalid event buffer count")
Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc3/core.c   | 1 +
 drivers/usb/dwc3/gadget.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..f977bc3eeb79 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2373,6 +2373,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 	}
 
 	mutex_init(&dwc->mutex);
+	mutex_init(&dwc->connect_mutex);
 
 	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ee837235630a..8fd1fd9b0db3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4879,7 +4879,6 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 
 	init_completion(&dwc->ep0_in_setup);
 	INIT_WORK(&dwc->err_recovery_work, dwc3_err_recovery_work);
-	mutex_init(&dwc->connect_mutex);
 	dwc->gadget = kzalloc_obj(struct usb_gadget);
 	if (!dwc->gadget) {
 		ret = -ENOMEM;
@@ -4977,7 +4976,6 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 		return;
 
 	cancel_work_sync(&dwc->err_recovery_work);
-	mutex_destroy(&dwc->connect_mutex);
 	dwc3_enable_susphy(dwc, true);
 	usb_del_gadget(dwc->gadget);
 	dwc3_gadget_free_endpoints(dwc);
-- 
2.43.0

